Content-Type: multipart/mixed; boundary="===============5393934425708261291=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2] cgroup: inline cgroup_task_freeze()
Date: Tue, 11 May 2021 09:19:32 +0800
Message-ID: <202105110948.PvKuvNS7-lkp@intel.com>
In-Reply-To: <20210510213946.1667103-1-guro@fb.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5393934425708261291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Roman,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.13-rc1]
[also build test ERROR on next-20210510]
[cannot apply to cgroup/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Roman-Gushchin/cgroup-inli=
ne-cgroup_task_freeze/20210511-054016
base:    6efb943b8616ec53a5e444193dccf1af9ad627b5
config: s390-randconfig-r014-20210510 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project a0fed6=
35fe1701470062495a6ffee1c608f3f1bc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/e291ca6f1be456048725ece6a=
d45384eb60199bc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Roman-Gushchin/cgroup-inline-cgrou=
p_task_freeze/20210511-054016
        git checkout e291ca6f1be456048725ece6ad45384eb60199bc
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/cgroup/cgroup.c:35:
   In file included from include/linux/init_task.h:18:
   In file included from include/net/net_namespace.h:38:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from mac=
ro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/cgroup/cgroup.c:35:
   In file included from include/linux/init_task.h:18:
   In file included from include/net/net_namespace.h:38:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/cgroup/cgroup.c:35:
   In file included from include/linux/init_task.h:18:
   In file included from include/net/net_namespace.h:38:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> kernel/cgroup/cgroup.c:6112:15: error: implicit declaration of function =
'cgroup_task_freeze' [-Werror,-Wimplicit-function-declaration]
           if (unlikely(cgroup_task_freeze(child))) {
                        ^
   kernel/cgroup/cgroup.c:6112:15: note: did you mean 'cgroup_task_frozen'?
   include/linux/cgroup.h:909:20: note: 'cgroup_task_frozen' declared here
   static inline bool cgroup_task_frozen(struct task_struct *task)
                      ^
   12 warnings and 1 error generated.


vim +/cgroup_task_freeze +6112 kernel/cgroup/cgroup.c

7e47682ea555e7 kernel/cgroup.c        Aleksa Sarai               2015-06-09=
  6076  =

817929ec274bcf kernel/cgroup.c        Paul Menage                2007-10-18=
  6077  /**
5a5cf5cb30d781 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6078   * cgroup_post_fork - finalize cgroup setup for the child process
5a5cf5cb30d781 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6079   * @child: the child process
a043e3b2c63445 kernel/cgroup.c        Li Zefan                   2008-02-23=
  6080   *
5a5cf5cb30d781 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6081   * Attach the child process to its css_set calling the subsystem fo=
rk()
5a5cf5cb30d781 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6082   * callbacks.
a043e3b2c63445 kernel/cgroup.c        Li Zefan                   2008-02-23=
  6083   */
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6084  void cgroup_post_fork(struct task_struct *child,
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6085  		      struct kernel_clone_args *kargs)
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6086  	__releases(&cgroup_threadgroup_rwsem) __releases(&cgroup_mutex)
817929ec274bcf kernel/cgroup.c        Paul Menage                2007-10-18=
  6087  {
30159ec7a9db7f kernel/cgroup.c        Tejun Heo                  2013-06-25=
  6088  	struct cgroup_subsys *ss;
eaf797abc53b0a kernel/cgroup.c        Tejun Heo                  2014-02-25=
  6089  	struct css_set *cset;
5153faac18d293 kernel/cgroup/cgroup.c Tejun Heo                  2019-10-24=
  6090  	int i;
eaf797abc53b0a kernel/cgroup.c        Tejun Heo                  2014-02-25=
  6091  =

ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6092  	cset =3D kargs->cset;
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6093  	kargs->cset =3D NULL;
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6094  =

82d6489d0fed2e kernel/cgroup.c        Daniel Bristot de Oliveira 2016-06-22=
  6095  	spin_lock_irq(&css_set_lock);
5153faac18d293 kernel/cgroup/cgroup.c Tejun Heo                  2019-10-24=
  6096  =

0cd9d33ace336b kernel/cgroup/cgroup.c Tejun Heo                  2020-01-30=
  6097  	/* init tasks are special, only link regular threads */
0cd9d33ace336b kernel/cgroup/cgroup.c Tejun Heo                  2020-01-30=
  6098  	if (likely(child->pid)) {
5153faac18d293 kernel/cgroup/cgroup.c Tejun Heo                  2019-10-24=
  6099  		WARN_ON_ONCE(!list_empty(&child->cg_list));
73a7242a06ff99 kernel/cgroup/cgroup.c Waiman Long                2017-06-13=
  6100  		cset->nr_tasks++;
f6d7d049c17a29 kernel/cgroup.c        Tejun Heo                  2015-10-15=
  6101  		css_set_move_task(child, NULL, cset, false);
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6102  	} else {
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6103  		put_css_set(cset);
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6104  		cset =3D NULL;
0cd9d33ace336b kernel/cgroup/cgroup.c Tejun Heo                  2020-01-30=
  6105  	}
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6106  =

76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6107  	/*
5153faac18d293 kernel/cgroup/cgroup.c Tejun Heo                  2019-10-24=
  6108  	 * If the cgroup has to be frozen, the new task has too.  Let's set
5153faac18d293 kernel/cgroup/cgroup.c Tejun Heo                  2019-10-24=
  6109  	 * the JOBCTL_TRAP_FREEZE jobctl bit to get the task into the
5153faac18d293 kernel/cgroup/cgroup.c Tejun Heo                  2019-10-24=
  6110  	 * frozen state.
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6111  	 */
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
 @6112  	if (unlikely(cgroup_task_freeze(child))) {
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6113  		spin_lock(&child->sighand->siglock);
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6114  		WARN_ON_ONCE(child->frozen);
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6115  		child->jobctl |=3D JOBCTL_TRAP_FREEZE;
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6116  		spin_unlock(&child->sighand->siglock);
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6117  =

76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6118  		/*
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6119  		 * Calling cgroup_update_frozen() isn't required here,
5153faac18d293 kernel/cgroup/cgroup.c Tejun Heo                  2019-10-24=
  6120  		 * because it will be called anyway a bit later from
5153faac18d293 kernel/cgroup/cgroup.c Tejun Heo                  2019-10-24=
  6121  		 * do_freezer_trap(). So we avoid cgroup's transient switch
5153faac18d293 kernel/cgroup/cgroup.c Tejun Heo                  2019-10-24=
  6122  		 * from the frozen state and back.
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6123  		 */
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6124  	}
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19=
  6125  =

82d6489d0fed2e kernel/cgroup.c        Daniel Bristot de Oliveira 2016-06-22=
  6126  	spin_unlock_irq(&css_set_lock);
5edee61edeaaeb kernel/cgroup.c        Tejun Heo                  2012-10-16=
  6127  =

5edee61edeaaeb kernel/cgroup.c        Tejun Heo                  2012-10-16=
  6128  	/*
5edee61edeaaeb kernel/cgroup.c        Tejun Heo                  2012-10-16=
  6129  	 * Call ss->fork().  This must happen after @child is linked on
5edee61edeaaeb kernel/cgroup.c        Tejun Heo                  2012-10-16=
  6130  	 * css_set; otherwise, @child might change state between ->fork()
5edee61edeaaeb kernel/cgroup.c        Tejun Heo                  2012-10-16=
  6131  	 * and addition to css_set.
5edee61edeaaeb kernel/cgroup.c        Tejun Heo                  2012-10-16=
  6132  	 */
b4e0eeafba61b1 kernel/cgroup.c        Tejun Heo                  2016-02-22=
  6133  	do_each_subsys_mask(ss, i, have_fork_callback) {
b53202e6308939 kernel/cgroup.c        Oleg Nesterov              2015-12-03=
  6134  		ss->fork(child);
b4e0eeafba61b1 kernel/cgroup.c        Tejun Heo                  2016-02-22=
  6135  	} while_each_subsys_mask();
5a5cf5cb30d781 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6136  =

ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6137  	/* Make the new cset the root_cset of the new cgroup namespace. */
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6138  	if (kargs->flags & CLONE_NEWCGROUP) {
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6139  		struct css_set *rcset =3D child->nsproxy->cgroup_ns->root_cset;
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6140  =

ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6141  		get_css_set(cset);
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6142  		child->nsproxy->cgroup_ns->root_cset =3D cset;
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6143  		put_css_set(rcset);
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6144  	}
ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6145  =

ef2c41cf38a755 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05=
  6146  	cgroup_css_set_put_fork(kargs);
5edee61edeaaeb kernel/cgroup.c        Tejun Heo                  2012-10-16=
  6147  }
5edee61edeaaeb kernel/cgroup.c        Tejun Heo                  2012-10-16=
  6148  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5393934425708261291==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
ndQIk+wqiMlSt57/B147803S5QAA
--===============5393934425708261291==--

