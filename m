Content-Type: multipart/mixed; boundary="===============0542893981136387668=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v0.1 7/9] sched/umcg: add UMCG server/worker API (early RFC)
Date: Sun, 23 May 2021 04:19:56 +0800
Message-ID: <202105230420.NiGdKAjn-lkp@intel.com>
In-Reply-To: <20210520183614.1227046-8-posk@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0542893981136387668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master]
[cannot apply to kselftest/next linus/master v5.13-rc2 next-20210521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Peter-Oskolkov/UMCG-early-=
preview-RFC-patchset/20210522-232442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 1699949=
d3314e5d1956fb082e4cd4798bf6149fc
config: um-randconfig-p001-20210522 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://github.com/0day-ci/linux/commit/634e0c0b3bf5d6ede3674f9c7=
54202b1a521ab89
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Peter-Oskolkov/UMCG-early-preview-=
RFC-patchset/20210522-232442
        git checkout 634e0c0b3bf5d6ede3674f9c754202b1a521ab89
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from init/main.c:21:
>> include/linux/syscalls.h:1062:57: error: unknown type name 'flags'
    1062 | asmlinkage long umcg_create_group(u32 api_version, u64, flags);
         |                                                         ^~~~~
   init/main.c:764:20: warning: no previous prototype for 'arch_post_acpi_s=
ubsys_init' [-Wmissing-prototypes]
     764 | void __init __weak arch_post_acpi_subsys_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   init/main.c:776:20: warning: no previous prototype for 'mem_encrypt_init=
' [-Wmissing-prototypes]
     776 | void __init __weak mem_encrypt_init(void) { }
         |                    ^~~~~~~~~~~~~~~~
   init/main.c:778:20: warning: no previous prototype for 'poking_init' [-W=
missing-prototypes]
     778 | void __init __weak poking_init(void) { }
         |                    ^~~~~~~~~~~
--
   In file included from init/do_mounts.h:5,
                    from init/do_mounts.c:29:
>> include/linux/syscalls.h:1062:57: error: unknown type name 'flags'
    1062 | asmlinkage long umcg_create_group(u32 api_version, u64, flags);
         |                                                         ^~~~~
--
   In file included from arch/um/kernel/syscall.c:11:
>> include/linux/syscalls.h:1062:57: error: unknown type name 'flags'
    1062 | asmlinkage long umcg_create_group(u32 api_version, u64, flags);
         |                                                         ^~~~~
   arch/um/kernel/syscall.c:17:6: warning: no previous prototype for 'old_m=
map' [-Wmissing-prototypes]
      17 | long old_mmap(unsigned long addr, unsigned long len,
         |      ^~~~~~~~
--
   In file included from arch/x86/um/tls_32.c:8:
>> include/linux/syscalls.h:1062:57: error: unknown type name 'flags'
    1062 | asmlinkage long umcg_create_group(u32 api_version, u64, flags);
         |                                                         ^~~~~
   arch/x86/um/tls_32.c:23:5: warning: no previous prototype for 'do_set_th=
read_area' [-Wmissing-prototypes]
      23 | int do_set_thread_area(struct user_desc *info)
         |     ^~~~~~~~~~~~~~~~~~
   arch/x86/um/tls_32.c:39:5: warning: no previous prototype for 'do_get_th=
read_area' [-Wmissing-prototypes]
      39 | int do_get_thread_area(struct user_desc *info)
         |     ^~~~~~~~~~~~~~~~~~
   arch/x86/um/tls_32.c:187:5: warning: no previous prototype for 'arch_swi=
tch_tls' [-Wmissing-prototypes]
     187 | int arch_switch_tls(struct task_struct *to)
         |     ^~~~~~~~~~~~~~~
--
   In file included from kernel/fork.c:54:
>> include/linux/syscalls.h:1062:57: error: unknown type name 'flags'
    1062 | asmlinkage long umcg_create_group(u32 api_version, u64, flags);
         |                                                         ^~~~~
   kernel/fork.c:162:13: warning: no previous prototype for 'arch_release_t=
ask_struct' [-Wmissing-prototypes]
     162 | void __weak arch_release_task_struct(struct task_struct *tsk)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:752:20: warning: no previous prototype for 'arch_task_cach=
e_init' [-Wmissing-prototypes]
     752 | void __init __weak arch_task_cache_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:842:12: warning: no previous prototype for 'arch_dup_task_=
struct' [-Wmissing-prototypes]
     842 | int __weak arch_dup_task_struct(struct task_struct *dst,
         |            ^~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/exit.c:42:
>> include/linux/syscalls.h:1062:57: error: unknown type name 'flags'
    1062 | asmlinkage long umcg_create_group(u32 api_version, u64, flags);
         |                                                         ^~~~~
   kernel/exit.c:1811:13: warning: no previous prototype for 'abort' [-Wmis=
sing-prototypes]
    1811 | __weak void abort(void)
         |             ^~~~~
--
   In file included from fs/d_path.c:2:
>> include/linux/syscalls.h:1062:57: error: unknown type name 'flags'
    1062 | asmlinkage long umcg_create_group(u32 api_version, u64, flags);
         |                                                         ^~~~~
   fs/d_path.c:315:7: warning: no previous prototype for 'simple_dname' [-W=
missing-prototypes]
     315 | char *simple_dname(struct dentry *dentry, char *buffer, int bufl=
en)
         |       ^~~~~~~~~~~~
--
   In file included from drivers/char/random.c:335:
>> include/linux/syscalls.h:1062:57: error: unknown type name 'flags'
    1062 | asmlinkage long umcg_create_group(u32 api_version, u64, flags);
         |                                                         ^~~~~
   drivers/char/random.c:2272:6: warning: no previous prototype for 'add_hw=
generator_randomness' [-Wmissing-prototypes]
    2272 | void add_hwgenerator_randomness(const char *buffer, size_t count,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from net/socket.c:78:
>> include/linux/syscalls.h:1062:57: error: unknown type name 'flags'
    1062 | asmlinkage long umcg_create_group(u32 api_version, u64, flags);
         |                                                         ^~~~~
   net/socket.c: In function '__sys_getsockopt':
   net/socket.c:2143:6: warning: variable 'max_optlen' set but not used [-W=
unused-but-set-variable]
    2143 |  int max_optlen;
         |      ^~~~~~~~~~
--
   In file included from kernel/printk/printk.c:36:
>> include/linux/syscalls.h:1062:57: error: unknown type name 'flags'
    1062 | asmlinkage long umcg_create_group(u32 api_version, u64, flags);
         |                                                         ^~~~~
   kernel/printk/printk.c:175:5: warning: no previous prototype for 'devkms=
g_sysctl_set_loglvl' [-Wmissing-prototypes]
     175 | int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/sched/sched.h:67,
                    from kernel/sched/core.c:13:
>> include/linux/syscalls.h:1062:57: error: unknown type name 'flags'
    1062 | asmlinkage long umcg_create_group(u32 api_version, u64, flags);
         |                                                         ^~~~~
   kernel/sched/core.c: In function 'ttwu_stat':
   kernel/sched/core.c:3274:13: warning: variable 'rq' set but not used [-W=
unused-but-set-variable]
    3274 |  struct rq *rq;
         |             ^~
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER || M=
IPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by
   - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT


vim +/flags +1062 include/linux/syscalls.h

   903	=

   904	/* mm/, CONFIG_MMU only */
   905	asmlinkage long sys_swapon(const char __user *specialfile, int swap_=
flags);
   906	asmlinkage long sys_swapoff(const char __user *specialfile);
   907	asmlinkage long sys_mprotect(unsigned long start, size_t len,
   908					unsigned long prot);
   909	asmlinkage long sys_msync(unsigned long start, size_t len, int flags=
);
   910	asmlinkage long sys_mlock(unsigned long start, size_t len);
   911	asmlinkage long sys_munlock(unsigned long start, size_t len);
   912	asmlinkage long sys_mlockall(int flags);
   913	asmlinkage long sys_munlockall(void);
   914	asmlinkage long sys_mincore(unsigned long start, size_t len,
   915					unsigned char __user * vec);
   916	asmlinkage long sys_madvise(unsigned long start, size_t len, int beh=
avior);
   917	asmlinkage long sys_process_madvise(int pidfd, const struct iovec __=
user *vec,
   918				size_t vlen, int behavior, unsigned int flags);
   919	asmlinkage long sys_remap_file_pages(unsigned long start, unsigned l=
ong size,
   920				unsigned long prot, unsigned long pgoff,
   921				unsigned long flags);
   922	asmlinkage long sys_mbind(unsigned long start, unsigned long len,
   923					unsigned long mode,
   924					const unsigned long __user *nmask,
   925					unsigned long maxnode,
   926					unsigned flags);
   927	asmlinkage long sys_get_mempolicy(int __user *policy,
   928					unsigned long __user *nmask,
   929					unsigned long maxnode,
   930					unsigned long addr, unsigned long flags);
   931	asmlinkage long sys_set_mempolicy(int mode, const unsigned long __us=
er *nmask,
   932					unsigned long maxnode);
   933	asmlinkage long sys_migrate_pages(pid_t pid, unsigned long maxnode,
   934					const unsigned long __user *from,
   935					const unsigned long __user *to);
   936	asmlinkage long sys_move_pages(pid_t pid, unsigned long nr_pages,
   937					const void __user * __user *pages,
   938					const int __user *nodes,
   939					int __user *status,
   940					int flags);
   941	=

   942	asmlinkage long sys_rt_tgsigqueueinfo(pid_t tgid, pid_t  pid, int si=
g,
   943			siginfo_t __user *uinfo);
   944	asmlinkage long sys_perf_event_open(
   945			struct perf_event_attr __user *attr_uptr,
   946			pid_t pid, int cpu, int group_fd, unsigned long flags);
   947	asmlinkage long sys_accept4(int, struct sockaddr __user *, int __use=
r *, int);
   948	asmlinkage long sys_recvmmsg(int fd, struct mmsghdr __user *msg,
   949				     unsigned int vlen, unsigned flags,
   950				     struct __kernel_timespec __user *timeout);
   951	asmlinkage long sys_recvmmsg_time32(int fd, struct mmsghdr __user *m=
sg,
   952				     unsigned int vlen, unsigned flags,
   953				     struct old_timespec32 __user *timeout);
   954	=

   955	asmlinkage long sys_wait4(pid_t pid, int __user *stat_addr,
   956					int options, struct rusage __user *ru);
   957	asmlinkage long sys_prlimit64(pid_t pid, unsigned int resource,
   958					const struct rlimit64 __user *new_rlim,
   959					struct rlimit64 __user *old_rlim);
   960	asmlinkage long sys_fanotify_init(unsigned int flags, unsigned int e=
vent_f_flags);
   961	asmlinkage long sys_fanotify_mark(int fanotify_fd, unsigned int flag=
s,
   962					  u64 mask, int fd,
   963					  const char  __user *pathname);
   964	asmlinkage long sys_name_to_handle_at(int dfd, const char __user *na=
me,
   965					      struct file_handle __user *handle,
   966					      int __user *mnt_id, int flag);
   967	asmlinkage long sys_open_by_handle_at(int mountdirfd,
   968					      struct file_handle __user *handle,
   969					      int flags);
   970	asmlinkage long sys_clock_adjtime(clockid_t which_clock,
   971					struct __kernel_timex __user *tx);
   972	asmlinkage long sys_clock_adjtime32(clockid_t which_clock,
   973					struct old_timex32 __user *tx);
   974	asmlinkage long sys_syncfs(int fd);
   975	asmlinkage long sys_setns(int fd, int nstype);
   976	asmlinkage long sys_pidfd_open(pid_t pid, unsigned int flags);
   977	asmlinkage long sys_sendmmsg(int fd, struct mmsghdr __user *msg,
   978				     unsigned int vlen, unsigned flags);
   979	asmlinkage long sys_process_vm_readv(pid_t pid,
   980					     const struct iovec __user *lvec,
   981					     unsigned long liovcnt,
   982					     const struct iovec __user *rvec,
   983					     unsigned long riovcnt,
   984					     unsigned long flags);
   985	asmlinkage long sys_process_vm_writev(pid_t pid,
   986					      const struct iovec __user *lvec,
   987					      unsigned long liovcnt,
   988					      const struct iovec __user *rvec,
   989					      unsigned long riovcnt,
   990					      unsigned long flags);
   991	asmlinkage long sys_kcmp(pid_t pid1, pid_t pid2, int type,
   992				 unsigned long idx1, unsigned long idx2);
   993	asmlinkage long sys_finit_module(int fd, const char __user *uargs, i=
nt flags);
   994	asmlinkage long sys_sched_setattr(pid_t pid,
   995						struct sched_attr __user *attr,
   996						unsigned int flags);
   997	asmlinkage long sys_sched_getattr(pid_t pid,
   998						struct sched_attr __user *attr,
   999						unsigned int size,
  1000						unsigned int flags);
  1001	asmlinkage long sys_renameat2(int olddfd, const char __user *oldname,
  1002				      int newdfd, const char __user *newname,
  1003				      unsigned int flags);
  1004	asmlinkage long sys_seccomp(unsigned int op, unsigned int flags,
  1005				    void __user *uargs);
  1006	asmlinkage long sys_getrandom(char __user *buf, size_t count,
  1007				      unsigned int flags);
  1008	asmlinkage long sys_memfd_create(const char __user *uname_ptr, unsig=
ned int flags);
  1009	asmlinkage long sys_bpf(int cmd, union bpf_attr *attr, unsigned int =
size);
  1010	asmlinkage long sys_execveat(int dfd, const char __user *filename,
  1011				const char __user *const __user *argv,
  1012				const char __user *const __user *envp, int flags);
  1013	asmlinkage long sys_userfaultfd(int flags);
  1014	asmlinkage long sys_membarrier(int cmd, unsigned int flags, int cpu_=
id);
  1015	asmlinkage long sys_mlock2(unsigned long start, size_t len, int flag=
s);
  1016	asmlinkage long sys_copy_file_range(int fd_in, loff_t __user *off_in,
  1017					    int fd_out, loff_t __user *off_out,
  1018					    size_t len, unsigned int flags);
  1019	asmlinkage long sys_preadv2(unsigned long fd, const struct iovec __u=
ser *vec,
  1020				    unsigned long vlen, unsigned long pos_l, unsigned long pos_h,
  1021				    rwf_t flags);
  1022	asmlinkage long sys_pwritev2(unsigned long fd, const struct iovec __=
user *vec,
  1023				    unsigned long vlen, unsigned long pos_l, unsigned long pos_h,
  1024				    rwf_t flags);
  1025	asmlinkage long sys_pkey_mprotect(unsigned long start, size_t len,
  1026					  unsigned long prot, int pkey);
  1027	asmlinkage long sys_pkey_alloc(unsigned long flags, unsigned long in=
it_val);
  1028	asmlinkage long sys_pkey_free(int pkey);
  1029	asmlinkage long sys_statx(int dfd, const char __user *path, unsigned=
 flags,
  1030				  unsigned mask, struct statx __user *buffer);
  1031	asmlinkage long sys_rseq(struct rseq __user *rseq, uint32_t rseq_len,
  1032				 int flags, uint32_t sig);
  1033	asmlinkage long sys_open_tree(int dfd, const char __user *path, unsi=
gned flags);
  1034	asmlinkage long sys_move_mount(int from_dfd, const char __user *from=
_path,
  1035				       int to_dfd, const char __user *to_path,
  1036				       unsigned int ms_flags);
  1037	asmlinkage long sys_mount_setattr(int dfd, const char __user *path,
  1038					  unsigned int flags,
  1039					  struct mount_attr __user *uattr, size_t usize);
  1040	asmlinkage long sys_fsopen(const char __user *fs_name, unsigned int =
flags);
  1041	asmlinkage long sys_fsconfig(int fs_fd, unsigned int cmd, const char=
 __user *key,
  1042				     const void __user *value, int aux);
  1043	asmlinkage long sys_fsmount(int fs_fd, unsigned int flags, unsigned =
int ms_flags);
  1044	asmlinkage long sys_fspick(int dfd, const char __user *path, unsigne=
d int flags);
  1045	asmlinkage long sys_pidfd_send_signal(int pidfd, int sig,
  1046					       siginfo_t __user *info,
  1047					       unsigned int flags);
  1048	asmlinkage long sys_pidfd_getfd(int pidfd, int fd, unsigned int flag=
s);
  1049	asmlinkage long sys_landlock_create_ruleset(const struct landlock_ru=
leset_attr __user *attr,
  1050			size_t size, __u32 flags);
  1051	asmlinkage long sys_landlock_add_rule(int ruleset_fd, enum landlock_=
rule_type rule_type,
  1052			const void __user *rule_attr, __u32 flags);
  1053	asmlinkage long sys_landlock_restrict_self(int ruleset_fd, __u32 fla=
gs);
  1054	asmlinkage long umcg_api_version(u32 api_version, u32 flags);
  1055	asmlinkage long umcg_register_task(u32 api_version, u32 flags, u32 g=
roup_id,
  1056						struct umcg_task __user *umcg_task);
  1057	asmlinkage long umcg_unregister_task(u32 flags);
  1058	asmlinkage long umcg_wait(u32 flags, const struct __kernel_timespec =
__user *timeout);
  1059	asmlinkage long umcg_wake(u32 flags, u32 next_tid);
  1060	asmlinkage long umcg_swap(u32 wake_flags, u32 next_tid, u32 wait_fla=
gs,
  1061					const struct __kernel_timespec __user *timeout);
> 1062	asmlinkage long umcg_create_group(u32 api_version, u64, flags);
  1063	asmlinkage long umcg_destroy_group(u32 group_id);
  1064	asmlinkage long umcg_poll_worker(u32 flags, struct umcg_task __user =
**ut);
  1065	asmlinkage long umcg_run_worker(u32 flags, u32 worker_tid,
  1066			struct umcg_task __user **ut);
  1067	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0542893981136387668==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0542893981136387668==--

