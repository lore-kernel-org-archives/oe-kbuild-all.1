Content-Type: multipart/mixed; boundary="===============3898588852249486196=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/3] proc: Remove the now unnecessary internal mount of proc
Date: Sat, 29 Feb 2020 12:23:56 +0800
Message-ID: <202002291254.mYsR31pv%lkp@intel.com>
In-Reply-To: <87r1yeqxbp.fsf_-_@x220.int.ebiederm.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3898588852249486196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi "Eric,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on uml/linux-next]
[also build test ERROR on linux/master kees/for-next/pstore linus/master v5=
.6-rc3 next-20200228]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Eric-W-Biederman/proc-Actu=
ally-honor-the-mount-options/20200229-100926
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git linux-ne=
xt
config: nds32-defconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Dnds32 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/proc/base.c: In function 'proc_flush_task':
>> fs/proc/base.c:3217:31: error: 'struct pid_namespace' has no member name=
d 'proc_mnt'
    3217 |   proc_flush_task_mnt(upid->ns->proc_mnt, upid->nr,
         |                               ^~

vim +3217 fs/proc/base.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  3180  =

0895e91d60ef9b Randy Dunlap      2007-10-21  3181  /**
0895e91d60ef9b Randy Dunlap      2007-10-21  3182   * proc_flush_task -  Re=
move dcache entries for @task from the /proc dcache.
0895e91d60ef9b Randy Dunlap      2007-10-21  3183   * @task: task that shou=
ld be flushed.
0895e91d60ef9b Randy Dunlap      2007-10-21  3184   *
0895e91d60ef9b Randy Dunlap      2007-10-21  3185   * When flushing dentrie=
s from proc, one needs to flush them from global
60347f6716aa49 Pavel Emelyanov   2007-10-18  3186   * proc (proc_mnt) and f=
rom all the namespaces' procs this task was seen
0895e91d60ef9b Randy Dunlap      2007-10-21  3187   * in. This call is supp=
osed to do all of this job.
0895e91d60ef9b Randy Dunlap      2007-10-21  3188   *
0895e91d60ef9b Randy Dunlap      2007-10-21  3189   * Looks in the dcache f=
or
0895e91d60ef9b Randy Dunlap      2007-10-21  3190   * /proc/@pid
0895e91d60ef9b Randy Dunlap      2007-10-21  3191   * /proc/@tgid/task/@pid
0895e91d60ef9b Randy Dunlap      2007-10-21  3192   * if either directory i=
s present flushes it and all of it'ts children
0895e91d60ef9b Randy Dunlap      2007-10-21  3193   * from the dcache.
0895e91d60ef9b Randy Dunlap      2007-10-21  3194   *
0895e91d60ef9b Randy Dunlap      2007-10-21  3195   * It is safe and reason=
able to cache /proc entries for a task until
0895e91d60ef9b Randy Dunlap      2007-10-21  3196   * that task exits.  Aft=
er that they just clog up the dcache with
0895e91d60ef9b Randy Dunlap      2007-10-21  3197   * useless entries, poss=
ibly causing useful dcache entries to be
0895e91d60ef9b Randy Dunlap      2007-10-21  3198   * flushed instead.  Thi=
s routine is proved to flush those useless
0895e91d60ef9b Randy Dunlap      2007-10-21  3199   * dcache entries at pro=
cess exit time.
0895e91d60ef9b Randy Dunlap      2007-10-21  3200   *
0895e91d60ef9b Randy Dunlap      2007-10-21  3201   * NOTE: This routine is=
 just an optimization so it does not guarantee
0895e91d60ef9b Randy Dunlap      2007-10-21  3202   *       that no dcache =
entries will exist at process exit time it
0895e91d60ef9b Randy Dunlap      2007-10-21  3203   *       just makes it v=
ery unlikely that any will persist.
60347f6716aa49 Pavel Emelyanov   2007-10-18  3204   */
60347f6716aa49 Pavel Emelyanov   2007-10-18  3205  =

60347f6716aa49 Pavel Emelyanov   2007-10-18  3206  void proc_flush_task(str=
uct task_struct *task)
60347f6716aa49 Pavel Emelyanov   2007-10-18  3207  {
9fcc2d15b14894 Eric W. Biederman 2007-11-14  3208  	int i;
9b4d1cbef8f41a Oleg Nesterov     2009-09-22  3209  	struct pid *pid, *tgid;
130f77ecb2e7d5 Pavel Emelyanov   2007-10-18  3210  	struct upid *upid;
130f77ecb2e7d5 Pavel Emelyanov   2007-10-18  3211  =

130f77ecb2e7d5 Pavel Emelyanov   2007-10-18  3212  	pid =3D task_pid(task);
130f77ecb2e7d5 Pavel Emelyanov   2007-10-18  3213  	tgid =3D task_tgid(task=
);
9fcc2d15b14894 Eric W. Biederman 2007-11-14  3214  =

9fcc2d15b14894 Eric W. Biederman 2007-11-14  3215  	for (i =3D 0; i <=3D pi=
d->level; i++) {
130f77ecb2e7d5 Pavel Emelyanov   2007-10-18  3216  		upid =3D &pid->numbers=
[i];
130f77ecb2e7d5 Pavel Emelyanov   2007-10-18 @3217  		proc_flush_task_mnt(up=
id->ns->proc_mnt, upid->nr,
9b4d1cbef8f41a Oleg Nesterov     2009-09-22  3218  					tgid->numbers[i].nr=
);
130f77ecb2e7d5 Pavel Emelyanov   2007-10-18  3219  	}
60347f6716aa49 Pavel Emelyanov   2007-10-18  3220  }
60347f6716aa49 Pavel Emelyanov   2007-10-18  3221  =


:::::: The code at line 3217 was first introduced by commit
:::::: 130f77ecb2e7d5ac3e53e620f55e374f4a406b20 pid namespaces: make proc_f=
lush_task() actually from entries from multiple namespaces

:::::: TO: Pavel Emelyanov <xemul@openvz.org>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3898588852249486196==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
+Q4rW+r/AIA0MPOopgAA
--===============3898588852249486196==--

