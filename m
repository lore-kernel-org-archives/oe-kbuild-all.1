Content-Type: multipart/mixed; boundary="===============1541451125363232331=="
MIME-Version: 1.0
From: David Gow <davidgow@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-5.4.y 236/3868] exfat_super.c:undefined reference to `atomic64_read_386'
Date: Sat, 15 May 2021 13:44:34 +0800
Message-ID: <CABVgOSnmDQ7M-0W=jD5KWxOxCf2vFh2V3ZORL29bqYD1VxJe4Q@mail.gmail.com>
In-Reply-To: <202105150856.LsnXbeo9-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1541451125363232331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 15, 2021 at 8:01 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git linux-5.4.y
> head:   e72abf1f11a982a2a3fb555b5a9bd2eb2011dee8
> commit: 6859c3c6bb2b0f0e77ab764a61b474fb79f2550c [236/3868] staging: exfa=
t: fix multiple definition error of `rename_file'

This doesn't seem to be caused by this commit. Instead, once the
rename_file issue is fixed, the build actually gets to the point where
these errors are visible.

> config: um-randconfig-p002-20210515 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-rc.git/commit/?id=3D6859c3c6bb2b0f0e77ab764a61b474fb79f2550c
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/lin=
ux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc linux-5.4.y
>         git checkout 6859c3c6bb2b0f0e77ab764a61b474fb79f2550c
>         # save the attached .config to linux build tree
>         make W=3D1 W=3D1 ARCH=3Dum
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):

These errors appear to be the ones referenced in:
http://lists.infradead.org/pipermail/linux-um/2021-April/001329.html

Note that, while the patch linked there applies, it in turn exposes
another issue with missing X86_FEATURE_XMM{,2} symbols.
Another patch to fix this is linked in the thread, but I haven't
managed to backport it to 5.4 in order to test it:
https://patchwork.ozlabs.org/project/linux-um/patch/20210312151609.24745-2-=
anton.ivanov(a)cambridgegreys.com/

>
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2dcc): undefined reference =
to `atomic64_xchg_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2df8): undefined reference =
to `atomic64_read_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2e28): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2e33): undefined reference =
to `atomic64_xchg_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2e5f): undefined reference =
to `atomic64_read_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2e8f): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2eb2): undefined reference =
to `cmpxchg8b_emu'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2ee1): undefined reference =
to `atomic64_read_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2f15): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2f38): undefined reference =
to `cmpxchg8b_emu'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2f64): undefined reference =
to `atomic64_read_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2f94): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2fb7): undefined reference =
to `cmpxchg8b_emu'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x2fe3): undefined reference =
to `atomic64_read_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x300e): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3035): undefined reference =
to `cmpxchg8b_emu'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3061): undefined reference =
to `atomic64_read_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3091): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x30b4): undefined reference =
to `cmpxchg8b_emu'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x30e0): undefined reference =
to `atomic64_read_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3110): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3133): undefined reference =
to `cmpxchg8b_emu'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3162): undefined reference =
to `atomic64_read_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3192): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x31bb): undefined reference =
to `cmpxchg8b_emu'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x31e7): undefined reference =
to `atomic64_read_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3217): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x323b): undefined reference =
to `cmpxchg8b_emu'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3267): undefined reference =
to `atomic64_read_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3294): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x329b): undefined reference =
to `atomic64_read_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x32de): undefined reference =
to `cmpxchg8b_emu'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3333): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x333a): undefined reference =
to `atomic64_read_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x338a): undefined reference =
to `cmpxchg8b_emu'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x33d3): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x33d8): undefined reference =
to `atomic64_dec_if_positive_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3416): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x341b): undefined reference =
to `atomic64_dec_if_positive_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x344c): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3451): undefined reference =
to `atomic64_dec_if_positive_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x348a): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x348f): undefined reference =
to `atomic64_inc_not_zero_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x34c3): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x34c8): undefined reference =
to `atomic64_inc_not_zero_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x34f2): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x34f7): undefined reference =
to `atomic64_inc_not_zero_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3521): undefined reference =
to `atomic64_set_386'
>    /usr/bin/ld: atomic64_test.c:(.init.text+0x3526): undefined reference =
to `atomic64_inc_not_zero_386'
>    /usr/bin/ld: drivers/lightnvm/pblk-init.o: in function `pblk_core_init=
':
>    pblk-init.c:(.text+0x48b): undefined reference to `atomic64_set_386'
>    /usr/bin/ld: pblk-init.c:(.text+0x496): undefined reference to `atomic=
64_set_386'
>    /usr/bin/ld: pblk-init.c:(.text+0x4a1): undefined reference to `atomic=
64_set_386'
>    /usr/bin/ld: pblk-init.c:(.text+0x4e8): undefined reference to `atomic=
64_set_386'
>    /usr/bin/ld: drivers/lightnvm/pblk-core.o: in function `pblk_line_clos=
e_meta':
>    pblk-core.c:(.text+0x4959): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: pblk-core.c:(.text+0x496c): undefined reference to `atomi=
c64_read_386'
>    /usr/bin/ld: pblk-core.c:(.text+0x497d): undefined reference to `atomi=
c64_read_386'
>    /usr/bin/ld: drivers/lightnvm/pblk-core.o: in function `pblk_update_ma=
p_dev':
>    pblk-core.c:(.text+0x64e7): undefined reference to `atomic64_inc_386'
>    /usr/bin/ld: drivers/scsi/st.o: in function `resid_cnt_show':
>    st.c:(.text+0x66): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: drivers/scsi/st.o: in function `other_cnt_show':
>    st.c:(.text+0x96): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: drivers/scsi/st.o: in function `io_ns_show':
>    st.c:(.text+0xc6): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: drivers/scsi/st.o: in function `in_flight_show':
>    st.c:(.text+0xf6): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: drivers/scsi/st.o: in function `write_ns_show':
>    st.c:(.text+0x126): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: drivers/scsi/st.o:st.c:(.text+0x156): more undefined refe=
rences to `atomic64_read_386' follow
>    /usr/bin/ld: drivers/scsi/st.o: in function `st_scsi_execute_end':
>    st.c:(.text+0xa4e): undefined reference to `atomic64_add_386'
>    /usr/bin/ld: st.c:(.text+0xa5c): undefined reference to `atomic64_inc_=
386'
>    /usr/bin/ld: st.c:(.text+0xa6a): undefined reference to `atomic64_dec_=
386'
>    /usr/bin/ld: st.c:(.text+0xac0): undefined reference to `atomic64_add_=
386'
>    /usr/bin/ld: st.c:(.text+0xad4): undefined reference to `atomic64_add_=
386'
>    /usr/bin/ld: st.c:(.text+0xae2): undefined reference to `atomic64_inc_=
386'
>    /usr/bin/ld: st.c:(.text+0xb05): undefined reference to `atomic64_add_=
386'
>    /usr/bin/ld: st.c:(.text+0xb36): undefined reference to `atomic64_add_=
386'
>    /usr/bin/ld: st.c:(.text+0xb4a): undefined reference to `atomic64_add_=
386'
>    /usr/bin/ld: st.c:(.text+0xb58): undefined reference to `atomic64_inc_=
386'
>    /usr/bin/ld: st.c:(.text+0xb7a): undefined reference to `atomic64_add_=
386'
>    /usr/bin/ld: st.c:(.text+0xb96): undefined reference to `atomic64_inc_=
386'
>    /usr/bin/ld: st.c:(.text+0xbd5): undefined reference to `atomic64_add_=
386'
>    /usr/bin/ld: st.c:(.text+0xbe2): undefined reference to `atomic64_add_=
386'
>    /usr/bin/ld: drivers/scsi/st.o: in function `st_do_scsi.constprop.0':
>    st.c:(.text+0x1382): undefined reference to `atomic64_inc_386'
>    /usr/bin/ld: drivers/md/raid1.o: in function `process_checks':
>    raid1.c:(.text+0x3c7a): undefined reference to `atomic64_add_386'
>    /usr/bin/ld: raid1.c:(.text+0x3db7): undefined reference to `atomic64_=
add_386'
>    /usr/bin/ld: drivers/md/raid10.o: in function `sync_request_write':
>    raid10.c:(.text+0x1d14): undefined reference to `atomic64_add_386'
>    /usr/bin/ld: drivers/md/md.o: in function `mismatch_cnt_show':
>    md.c:(.text+0x141d): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: drivers/md/md.o: in function `md_do_sync':
>    md.c:(.text+0x8aa2): undefined reference to `atomic64_set_386'
>    /usr/bin/ld: drivers/md/md.o: in function `do_md_stop':
>    md.c:(.text+0xd2cb): undefined reference to `atomic64_set_386'
>    /usr/bin/ld: drivers/staging/exfat/exfat_super.o: in function `exfat_r=
ename':
> >> exfat_super.c:(.text+0x1e50): undefined reference to `atomic64_read_38=
6'
> >> /usr/bin/ld: exfat_super.c:(.text+0x1e85): undefined reference to `cmp=
xchg8b_emu'
> >> /usr/bin/ld: exfat_super.c:(.text+0x1f5f): undefined reference to `ato=
mic64_read_386'
>    /usr/bin/ld: exfat_super.c:(.text+0x1f94): undefined reference to `cmp=
xchg8b_emu'
>    /usr/bin/ld: drivers/staging/exfat/exfat_super.o: in function `exfat_r=
mdir':
>    exfat_super.c:(.text+0x2362): undefined reference to `atomic64_read_38=
6'
>    /usr/bin/ld: exfat_super.c:(.text+0x2397): undefined reference to `cmp=
xchg8b_emu'
>    /usr/bin/ld: drivers/staging/exfat/exfat_super.o: in function `exfat_u=
nlink':
>    exfat_super.c:(.text+0x2670): undefined reference to `atomic64_read_38=
6'
>    /usr/bin/ld: exfat_super.c:(.text+0x26a5): undefined reference to `cmp=
xchg8b_emu'
>    /usr/bin/ld: drivers/staging/exfat/exfat_super.o: in function `exfat_r=
ead_root':
>    exfat_super.c:(.text+0x33fa): undefined reference to `atomic64_read_38=
6'
>    /usr/bin/ld: exfat_super.c:(.text+0x344e): undefined reference to `cmp=
xchg8b_emu'
>    /usr/bin/ld: drivers/staging/exfat/exfat_super.o: in function `exfat_f=
ill_super':
> >> exfat_super.c:(.text+0x3d21): undefined reference to `atomic64_set_386'
>    /usr/bin/ld: drivers/staging/exfat/exfat_super.o: in function `exfat_f=
ill_inode':
>    exfat_super.c:(.text+0x4621): undefined reference to `atomic64_read_38=
6'
>    /usr/bin/ld: exfat_super.c:(.text+0x4675): undefined reference to `cmp=
xchg8b_emu'
>    /usr/bin/ld: drivers/staging/exfat/exfat_super.o: in function `exfat_b=
uild_inode':
>    exfat_super.c:(.text+0x49a6): undefined reference to `atomic64_set_386'
>    /usr/bin/ld: drivers/staging/exfat/exfat_super.o: in function `exfat_m=
kdir':
>    exfat_super.c:(.text+0x4a77): undefined reference to `atomic64_read_38=
6'
>    /usr/bin/ld: exfat_super.c:(.text+0x4ac5): undefined reference to `cmp=
xchg8b_emu'
>    /usr/bin/ld: exfat_super.c:(.text+0x4b71): undefined reference to `ato=
mic64_read_386'
>    /usr/bin/ld: exfat_super.c:(.text+0x4bb3): undefined reference to `cmp=
xchg8b_emu'
>    /usr/bin/ld: exfat_super.c:(.text+0x4c15): undefined reference to `ato=
mic64_read_386'
>    /usr/bin/ld: drivers/staging/exfat/exfat_super.o: in function `exfat_c=
reate':
>    exfat_super.c:(.text+0x4d7b): undefined reference to `atomic64_read_38=
6'
>    /usr/bin/ld: exfat_super.c:(.text+0x4dc9): undefined reference to `cmp=
xchg8b_emu'
>    /usr/bin/ld: exfat_super.c:(.text+0x4e6b): undefined reference to `ato=
mic64_read_386'
>    /usr/bin/ld: exfat_super.c:(.text+0x4ead): undefined reference to `cmp=
xchg8b_emu'
>    /usr/bin/ld: exfat_super.c:(.text+0x4f0f): undefined reference to `ato=
mic64_read_386'
>    /usr/bin/ld: drivers/staging/exfat/exfat_super.o: in function `exfat_l=
ookup':
>    exfat_super.c:(.text+0x5140): undefined reference to `atomic64_read_38=
6'
>    /usr/bin/ld: exfat_super.c:(.text+0x516d): undefined reference to `ato=
mic64_read_386'
>    /usr/bin/ld: drivers/staging/exfat/exfat_super.o: in function `exfat_s=
ymlink':
>    exfat_super.c:(.text+0x69a9): undefined reference to `atomic64_read_38=
6'
>    /usr/bin/ld: exfat_super.c:(.text+0x69f3): undefined reference to `cmp=
xchg8b_emu'
>    /usr/bin/ld: exfat_super.c:(.text+0x6a93): undefined reference to `ato=
mic64_read_386'
>    /usr/bin/ld: exfat_super.c:(.text+0x6add): undefined reference to `cmp=
xchg8b_emu'
>    /usr/bin/ld: exfat_super.c:(.text+0x6b63): undefined reference to `ato=
mic64_read_386'
>    /usr/bin/ld: kernel/sched/cputime.o: in function `account_user_time':
>    cputime.c:(.text+0x42): undefined reference to `atomic64_add_386'
>    /usr/bin/ld: kernel/sched/cputime.o: in function `account_guest_time':
>    cputime.c:(.text+0xc2): undefined reference to `atomic64_add_386'
>    /usr/bin/ld: kernel/sched/cputime.o: in function `account_system_index=
_time':
>    cputime.c:(.text+0x16b): undefined reference to `atomic64_add_386'
>    /usr/bin/ld: kernel/sched/cputime.o: in function `account_system_time':
>    cputime.c:(.text+0x217): undefined reference to `atomic64_add_386'
>    /usr/bin/ld: kernel/sched/rt.o: in function `update_curr_rt':
>    rt.c:(.text+0x1c8): undefined reference to `atomic64_add_386'
>    /usr/bin/ld: kernel/sched/deadline.o:deadline.c:(.text+0x1f8a): more u=
ndefined references to `atomic64_add_386' follow
>    /usr/bin/ld: kernel/time/posix-cpu-timers.o: in function `cpu_clock_sa=
mple_group':
>    posix-cpu-timers.c:(.text+0x57c): undefined reference to `atomic64_rea=
d_386'
>    /usr/bin/ld: posix-cpu-timers.c:(.text+0x58a): undefined reference to =
`atomic64_read_386'
>    /usr/bin/ld: posix-cpu-timers.c:(.text+0x596): undefined reference to =
`atomic64_read_386'
>    /usr/bin/ld: posix-cpu-timers.c:(.text+0x5c7): undefined reference to =
`atomic64_read_386'
>    /usr/bin/ld: posix-cpu-timers.c:(.text+0x5d8): undefined reference to =
`atomic64_read_386'
>    /usr/bin/ld: kernel/time/posix-cpu-timers.o:posix-cpu-timers.c:(.text+=
0x5e7): more undefined references to `atomic64_read_386' follow
>    /usr/bin/ld: kernel/time/posix-cpu-timers.o: in function `cpu_clock_sa=
mple_group':
>    posix-cpu-timers.c:(.text+0x68a): undefined reference to `cmpxchg8b_em=
u'
>    /usr/bin/ld: posix-cpu-timers.c:(.text+0x69f): undefined reference to =
`atomic64_read_386'
>    /usr/bin/ld: posix-cpu-timers.c:(.text+0x6ca): undefined reference to =
`cmpxchg8b_emu'
>    /usr/bin/ld: posix-cpu-timers.c:(.text+0x6df): undefined reference to =
`atomic64_read_386'
>    /usr/bin/ld: posix-cpu-timers.c:(.text+0x70a): undefined reference to =
`cmpxchg8b_emu'
>    /usr/bin/ld: posix-cpu-timers.c:(.text+0x71f): undefined reference to =
`atomic64_read_386'
>    /usr/bin/ld: kernel/time/posix-cpu-timers.o: in function `thread_group=
_sample_cputime':
>    posix-cpu-timers.c:(.text+0x1833): undefined reference to `atomic64_re=
ad_386'
>    /usr/bin/ld: posix-cpu-timers.c:(.text+0x1844): undefined reference to=
 `atomic64_read_386'
>    /usr/bin/ld: posix-cpu-timers.c:(.text+0x1853): undefined reference to=
 `atomic64_read_386'
>    /usr/bin/ld: kernel/time/posix-cpu-timers.o: in function `run_posix_cp=
u_timers':
>    posix-cpu-timers.c:(.text+0x1a24): undefined reference to `atomic64_re=
ad_386'
>    /usr/bin/ld: kernel/time/posix-cpu-timers.o:posix-cpu-timers.c:(.text+=
0x1a35): more undefined references to `atomic64_read_386' follow
>    /usr/bin/ld: kernel/trace/trace_clock.o: in function `trace_clock_coun=
ter':
>    trace_clock.c:(.text+0xdd): undefined reference to `atomic64_add_retur=
n_386'
>    /usr/bin/ld: fs/ext4/balloc.o: in function `ext4_has_free_clusters':
>    balloc.c:(.text+0x99): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: fs/ext4/dir.o: in function `ext4_dir_llseek':
>    dir.c:(.text+0x2fa): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: fs/ext4/dir.o: in function `ext4_readdir':
>    dir.c:(.text+0x7a0): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: dir.c:(.text+0xb9b): undefined reference to `atomic64_rea=
d_386'
>    /usr/bin/ld: dir.c:(.text+0xbc8): undefined reference to `cmpxchg8b_em=
u'
>    /usr/bin/ld: dir.c:(.text+0xd32): undefined reference to `atomic64_rea=
d_386'
>    /usr/bin/ld: dir.c:(.text+0xd5f): undefined reference to `cmpxchg8b_em=
u'
>    /usr/bin/ld: dir.c:(.text+0xec0): undefined reference to `atomic64_rea=
d_386'
>    /usr/bin/ld: fs/ext4/ialloc.o: in function `get_orlov_stats':
>    ialloc.c:(.text+0x26): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: fs/ext4/inline.o: in function `ext4_add_dirent_to_inline.=
isra.0':
>    inline.c:(.text+0xa2e): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: inline.c:(.text+0xa64): undefined reference to `cmpxchg8b=
_emu'
>    /usr/bin/ld: fs/ext4/inline.o: in function `ext4_read_inline_dir':
>    inline.c:(.text+0x2cdc): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: inline.c:(.text+0x2db1): undefined reference to `atomic64=
_read_386'
>    /usr/bin/ld: inline.c:(.text+0x2dde): undefined reference to `cmpxchg8=
b_emu'
>    /usr/bin/ld: fs/ext4/inode.o: in function `ext4_do_update_inode':
>    inode.c:(.text+0x2677): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: inode.c:(.text+0x2ab1): undefined reference to `atomic64_=
read_386'
>    /usr/bin/ld: fs/ext4/inode.o: in function `__ext4_iget':
>    inode.c:(.text+0x5ef0): undefined reference to `atomic64_set_386'
>    /usr/bin/ld: inode.c:(.text+0x6362): undefined reference to `atomic64_=
set_386'
>    /usr/bin/ld: fs/ext4/inode.o: in function `ext4_mark_iloc_dirty':
>    inode.c:(.text+0x68a9): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: inode.c:(.text+0x68dc): undefined reference to `cmpxchg8b=
_emu'
>    /usr/bin/ld: fs/ext4/inode.o: in function `ext4_setattr':
>    inode.c:(.text+0xbf04): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: inode.c:(.text+0xbf39): undefined reference to `cmpxchg8b=
_emu'
>    /usr/bin/ld: fs/ext4/ioctl.o: in function `swap_inode_boot_loader':
>    ioctl.c:(.text+0xa26): undefined reference to `atomic64_set_386'
>    /usr/bin/ld: fs/ext4/namei.o: in function `ext4_setent':
>    namei.c:(.text+0x132a): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: namei.c:(.text+0x1360): undefined reference to `cmpxchg8b=
_emu'
>    /usr/bin/ld: fs/ext4/namei.o: in function `add_dirent_to_buf':
>    namei.c:(.text+0x37d7): undefined reference to `atomic64_read_386'
>    /usr/bin/ld: namei.c:(.text+0x380b): undefined reference to `cmpxchg8b=
_emu'
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1541451125363232331==--

