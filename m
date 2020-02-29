Content-Type: multipart/mixed; boundary="===============8088671353140152785=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/3] proc: Remove the now unnecessary internal mount of proc
Date: Fri, 28 Feb 2020 22:49:15 -0600
Message-ID: <8736auov5g.fsf@x220.int.ebiederm.org>
In-Reply-To: <202002291137.px8YXKJI%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8088671353140152785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kbuild test robot <lkp@intel.com> writes:

> Hi "Eric,
>
> Thank you for the patch! Yet something to improve:

Dear kbuild robot,

Yep. You got it the wrong base.  I will see about using --base
if I repost, or have another patchset that so clearly needs
to be applied on top of a non-default base.

Thank you for writing me how to do that.

Eric


> [auto build test ERROR on uml/linux-next]
> [also build test ERROR on linux/master kees/for-next/pstore linus/master =
v5.6-rc3 next-20200228]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/Eric-W-Biederman/proc-Ac=
tually-honor-the-mount-options/20200229-100926
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git linux-=
next
> config: x86_64-defconfig (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64 =

>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    fs/proc/base.c: In function 'proc_flush_task':
>>> fs/proc/base.c:3217:33: error: 'struct pid_namespace' has no member nam=
ed 'proc_mnt'; did you mean 'proc_self'?
>       proc_flush_task_mnt(upid->ns->proc_mnt, upid->nr,
>                                     ^~~~~~~~
>                                     proc_self
>
> vim +3217 fs/proc/base.c
>
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  3180  =

> 0895e91d60ef9b Randy Dunlap      2007-10-21  3181  /**
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3182   * proc_flush_task -  =
Remove dcache entries for @task from the /proc dcache.
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3183   * @task: task that sh=
ould be flushed.
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3184   *
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3185   * When flushing dentr=
ies from proc, one needs to flush them from global
> 60347f6716aa49 Pavel Emelyanov   2007-10-18  3186   * proc (proc_mnt) and=
 from all the namespaces' procs this task was seen
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3187   * in. This call is su=
pposed to do all of this job.
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3188   *
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3189   * Looks in the dcache=
 for
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3190   * /proc/@pid
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3191   * /proc/@tgid/task/@p=
id
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3192   * if either directory=
 is present flushes it and all of it'ts children
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3193   * from the dcache.
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3194   *
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3195   * It is safe and reas=
onable to cache /proc entries for a task until
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3196   * that task exits.  A=
fter that they just clog up the dcache with
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3197   * useless entries, po=
ssibly causing useful dcache entries to be
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3198   * flushed instead.  T=
his routine is proved to flush those useless
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3199   * dcache entries at p=
rocess exit time.
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3200   *
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3201   * NOTE: This routine =
is just an optimization so it does not guarantee
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3202   *       that no dcach=
e entries will exist at process exit time it
> 0895e91d60ef9b Randy Dunlap      2007-10-21  3203   *       just makes it=
 very unlikely that any will persist.
> 60347f6716aa49 Pavel Emelyanov   2007-10-18  3204   */
> 60347f6716aa49 Pavel Emelyanov   2007-10-18  3205  =

> 60347f6716aa49 Pavel Emelyanov   2007-10-18  3206  void proc_flush_task(s=
truct task_struct *task)
> 60347f6716aa49 Pavel Emelyanov   2007-10-18  3207  {
> 9fcc2d15b14894 Eric W. Biederman 2007-11-14  3208  	int i;
> 9b4d1cbef8f41a Oleg Nesterov     2009-09-22  3209  	struct pid *pid, *tgi=
d;
> 130f77ecb2e7d5 Pavel Emelyanov   2007-10-18  3210  	struct upid *upid;
> 130f77ecb2e7d5 Pavel Emelyanov   2007-10-18  3211  =

> 130f77ecb2e7d5 Pavel Emelyanov   2007-10-18  3212  	pid =3D task_pid(task=
);
> 130f77ecb2e7d5 Pavel Emelyanov   2007-10-18  3213  	tgid =3D task_tgid(ta=
sk);
> 9fcc2d15b14894 Eric W. Biederman 2007-11-14  3214  =

> 9fcc2d15b14894 Eric W. Biederman 2007-11-14  3215  	for (i =3D 0; i <=3D =
pid->level; i++) {
> 130f77ecb2e7d5 Pavel Emelyanov   2007-10-18  3216  		upid =3D &pid->numbe=
rs[i];
> 130f77ecb2e7d5 Pavel Emelyanov   2007-10-18 @3217  		proc_flush_task_mnt(=
upid->ns->proc_mnt, upid->nr,
> 9b4d1cbef8f41a Oleg Nesterov     2009-09-22  3218  					tgid->numbers[i].=
nr);
> 130f77ecb2e7d5 Pavel Emelyanov   2007-10-18  3219  	}
> 60347f6716aa49 Pavel Emelyanov   2007-10-18  3220  }
> 60347f6716aa49 Pavel Emelyanov   2007-10-18  3221  =

>
> :::::: The code at line 3217 was first introduced by commit
> :::::: 130f77ecb2e7d5ac3e53e620f55e374f4a406b20 pid namespaces: make proc=
_flush_task() actually from entries from multiple namespaces
>
> :::::: TO: Pavel Emelyanov <xemul@openvz.org>
> :::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8088671353140152785==--

