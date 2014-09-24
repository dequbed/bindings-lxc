#include <bindings.dsl.h>
#include <lxc/lxccontainer.h>

module Bindings.LXC where
#strict_import

type CBool = CInt
type C_lxc_attach_exec_t = FunPtr (Ptr () -> IO CInt)

#integral_t pid_t
#integral_t uint64_t
#integral_t uid_t
#integral_t gid_t

#integral_t lxc_attach_env_policy_t

#num LXC_ATTACH_KEEP_ENV
#num LXC_ATTACH_CLEAR_ENV

#num LXC_ATTACH_MOVE_TO_CGROUP
#num LXC_ATTACH_DROP_CAPABILITIES
#num LXC_ATTACH_SET_PERSONALITY
#num LXC_ATTACH_LSM_EXEC
#num LXC_ATTACH_REMOUNT_PROC_SYS
#num LXC_ATTACH_LSM_NOW
#num LXC_ATTACH_DEFAULT

#num LXC_ATTACH_LSM

#starttype lxc_attach_options_t
#field attach_flags             , CInt
#field namespaces               , CInt
#field personality              , CLong
#field initial_cwd              , CString
#field uid                      , <uid_t>
#field gid                      , <gid_t>
#field env_policy               , <lxc_attach_env_policy_t>
#field extra_env_vars           , Ptr CString
#field extra_keep_env           , Ptr CString
#field stdin_fd                 , CInt
#field stdout_fd                , CInt
#field stderr_fd                , CInt
#stoptype

#starttype lxc_attach_command_t
#field program                  , CString
#field argv                     , Ptr CString
#stoptype

#ccall lxc_attach_run_command   , Ptr () -> IO CInt
#ccall lxc_attach_run_shell     , Ptr () -> IO CInt

#num LXC_CLONE_KEEPNAME
#num LXC_CLONE_KEEPMACADDR
#num LXC_CLONE_SNAPSHOT
#num LXC_CLONE_KEEPBDEVTYPE
#num LXC_CLONE_MAYBE_SNAPSHOT
#num LXC_CLONE_MAXFLAGS
#num LXC_CREATE_QUIET
#num LXC_CREATE_MAXFLAGS

#starttype struct bdev_specs
#field fstype                   , CString
#stoptype

#starttype struct lxc_snapshot
#field name                     , CString
#field comment_pathname         , CString
#field timestamp                , CString
#field lxcpath                  , CString
#field free                     , FunPtr (<struct lxc_snapshot> -> IO ())
#stoptype

#starttype struct lxc_container
#field error_string             , CString
#field error_num                , CInt
#field daemonize                , CBool
#field config_path              , CString
#field is_defined               , FunPtr (Ptr <struct lxc_container> -> IO CBool)
#field state                    , FunPtr (Ptr <struct lxc_container> -> IO CString)
#field is_running               , FunPtr (Ptr <struct lxc_container> -> IO CBool)
#field freeze                   , FunPtr (Ptr <struct lxc_container> -> IO CBool)
#field unfreeze                 , FunPtr (Ptr <struct lxc_container> -> IO CBool)
#field init_pid                 , FunPtr (Ptr <struct lxc_container> -> IO <pid_t>)
#field load_config              , FunPtr (Ptr <struct lxc_container> -> CString -> IO CBool)
#field start                    , FunPtr (Ptr <struct lxc_container> -> CInt -> Ptr CString -> IO CBool)
#field stop                     , FunPtr (Ptr <struct lxc_container> -> IO CBool)
#field want_daemonize           , FunPtr (Ptr <struct lxc_container> -> CBool -> IO CBool)
#field want_close_all_fds       , FunPtr (Ptr <struct lxc_container> -> CBool -> IO CBool)
#field config_file_name         , FunPtr (Ptr <struct lxc_container> -> IO CString)
#field wait                     , FunPtr (Ptr <struct lxc_container> -> CString -> CInt -> IO CBool)
#field set_config_item          , FunPtr (Ptr <struct lxc_container> -> CString -> CString -> IO CBool)
#field destroy                  , FunPtr (Ptr <struct lxc_container> -> IO CBool)
#field save_config              , FunPtr (Ptr <struct lxc_container> -> CString -> IO CBool)
#field create                   , FunPtr (Ptr <struct lxc_container> -> CString -> CString -> <struct bdev_specs> -> CInt -> Ptr CString -> IO CBool)
#field rename                   , FunPtr (Ptr <struct lxc_container> -> CString -> IO CBool)
#field reboot                   , FunPtr (Ptr <struct lxc_container> -> IO CBool)
#field shutdown                 , FunPtr (Ptr <struct lxc_container> -> CInt -> IO CBool)
#field clear_config             , FunPtr (Ptr <struct lxc_container> -> IO CBool)
#field clear_config_item        , FunPtr (Ptr <struct lxc_container> -> CString -> IO CBool)
#field get_config_item          , FunPtr (Ptr <struct lxc_container> -> CString -> CString -> CInt -> IO CInt)
#field get_running_config_item  , FunPtr (Ptr <struct lxc_container> -> CString -> IO CString)
#field get_keys                 , FunPtr (Ptr <struct lxc_container> -> CString -> CString -> CInt -> IO CInt)
#field get_interfaces           , FunPtr (Ptr <struct lxc_container> -> IO (Ptr CString))
#field get_ips                  , FunPtr (Ptr <struct lxc_container> -> CString -> CString -> CInt -> IO (Ptr CString))
#field get_cgroup_item          , FunPtr (Ptr <struct lxc_container> -> CString -> Ptr CChar -> CInt -> IO CInt)
#field set_cgroup_item          , FunPtr (Ptr <struct lxc_container> -> CString -> CString -> IO CBool)
#field get_config_path          , FunPtr (Ptr <struct lxc_container> -> IO CString)
#field set_config_path          , FunPtr (Ptr <struct lxc_container> -> CString -> IO CBool)
#field clone                    , FunPtr (Ptr <struct lxc_container> -> CString -> CString -> CInt -> CString -> CString -> <uint64_t> -> Ptr CString -> IO (Ptr <struct lxc_container>))
#field console_getfd            , FunPtr (Ptr <struct lxc_container> -> Ptr CInt -> Ptr CInt -> IO CInt)
#field console                  , FunPtr (Ptr <struct lxc_container> -> CInt -> CInt -> CInt -> CInt -> CInt -> IO CInt)
#field attach                   , FunPtr (Ptr <struct lxc_container> -> C_lxc_attach_exec_t -> Ptr () -> Ptr <struct lxc_attach_options_t> -> Ptr <pid_t> -> IO CInt)
#field attach_run_wait          , FunPtr (Ptr <struct lxc_container> -> C_lxc_attach_exec_t -> CString -> Ptr CString -> IO CInt)
#field snapshot                 , FunPtr (Ptr <struct lxc_container> -> CString -> IO CInt)
#field snapshot_list            , FunPtr (Ptr <struct lxc_container> -> Ptr (Ptr <struct lxc_snapshot>) -> IO CInt)
#field snapshot_restore         , FunPtr (Ptr <struct lxc_container> -> CString -> CString -> IO CBool)
#field snapshot_destroy         , FunPtr (Ptr <struct lxc_container> -> CString -> IO CBool)
#field may_control              , FunPtr (Ptr <struct lxc_container> -> IO CBool)
#field add_device_node          , FunPtr (Ptr <struct lxc_container> -> CString -> CString -> IO CBool)
#field remove_device_node       , FunPtr (Ptr <struct lxc_container> -> CString -> CString -> IO CBool)
#stoptype

#ccall lxc_container_new          , CString -> CString -> IO (Ptr <struct lxc_container>)
#ccall lxc_container_get          , Ptr <struct lxc_container> -> IO CInt
#ccall lxc_container_put          , Ptr <struct lxc_container> -> IO CInt
#ccall get_wait_states            , Ptr CString -> IO CInt
#ccall lxc_get_global_config_item , CString -> IO CString
#ccall lxc_get_version            , IO CString
#ccall list_defined_containers    , CString -> Ptr (Ptr CString) -> Ptr (Ptr (Ptr <struct lxc_container>))
#ccall list_active_containers     , CString -> Ptr (Ptr CString) -> Ptr (Ptr (Ptr <struct lxc_container>))
#ccall list_all_containers        , CString -> Ptr (Ptr CString) -> Ptr (Ptr (Ptr <struct lxc_container>))
#ccall lxc_log_close              , IO ()