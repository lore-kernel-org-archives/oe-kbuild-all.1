Content-Type: multipart/mixed; boundary="===============5909721346260137880=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH RESEND v2 3/3] arm64: implement CPPC FFH support using AMUs
Date: Thu, 29 Oct 2020 06:41:15 +0800
Message-ID: <202010290630.a7ZzGMDO-lkp@intel.com>
In-Reply-To: <20201027163624.20747-4-ionela.voinescu@arm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5909721346260137880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ionela,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 3650b228f83adda7e5ee532e2b90429c03f7b9ec]

url:    https://github.com/0day-ci/linux/commits/Ionela-Voinescu/arm64-cppc=
-add-FFH-support-using-AMUs/20201028-004534
base:    3650b228f83adda7e5ee532e2b90429c03f7b9ec
config: arm64-randconfig-r001-20201028 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 50dfa1=
9cc799ae7cddd39a95dbfce675a12672ad)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/43a45631863c12f95767b36c6=
7a29654319068df
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ionela-Voinescu/arm64-cppc-add-FFH=
-support-using-AMUs/20201028-004534
        git checkout 43a45631863c12f95767b36c67a29654319068df
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from ipc/msg.c:27:
   In file included from include/linux/msg.h:6:
   In file included from include/uapi/linux/msg.h:5:
   In file included from include/linux/ipc.h:5:
   In file included from include/linux/spinlock.h:54:
   In file included from include/linux/irqflags.h:16:
   In file included from arch/arm64/include/asm/irqflags.h:10:
   In file included from arch/arm64/include/asm/ptrace.h:11:
   arch/arm64/include/asm/cpufeature.h:751:9: error: use of undeclared iden=
tifier 'nr_cpu_ids'
           return nr_cpu_ids;
                  ^
>> ipc/msg.c:494:20: warning: implicit conversion from 'int' to 'unsigned s=
hort' changes value from 32768000 to 0 [-Wconstant-conversion]
           msginfo->msgseg =3D MSGSEG;
                           ~ ^~~~~~
   include/uapi/linux/msg.h:87:38: note: expanded from macro 'MSGSEG'
   #define MSGSEG (__MSGSEG <=3D 0xffff ? __MSGSEG : 0xffff)
                                        ^~~~~~~~
   include/uapi/linux/msg.h:86:36: note: expanded from macro '__MSGSEG'
   #define __MSGSEG ((MSGPOOL * 1024) / MSGSSZ) /* max no. of segments */
                     ~~~~~~~~~~~~~~~~~^~~~~~~~
   1 warning and 1 error generated.
--
   In file included from kernel/dma/direct.c:7:
   In file included from include/linux/memblock.h:13:
   In file included from include/linux/mm.h:10:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:54:
   In file included from include/linux/irqflags.h:16:
   In file included from arch/arm64/include/asm/irqflags.h:10:
   In file included from arch/arm64/include/asm/ptrace.h:11:
   arch/arm64/include/asm/cpufeature.h:751:9: error: use of undeclared iden=
tifier 'nr_cpu_ids'
           return nr_cpu_ids;
                  ^
>> kernel/dma/direct.c:102:20: warning: shift count >=3D width of type [-Ws=
hift-count-overflow]
                       phys_limit < DMA_BIT_MASK(64) &&
                       ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> kernel/dma/direct.c:102:20: warning: shift count >=3D width of type [-Ws=
hift-count-overflow]
                       phys_limit < DMA_BIT_MASK(64) &&
                       ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                               ^~~~
>> kernel/dma/direct.c:102:20: warning: shift count >=3D width of type [-Ws=
hift-count-overflow]
                       phys_limit < DMA_BIT_MASK(64) &&
                       ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   3 warnings and 1 error generated.
--
   In file included from drivers/dma/altera-msgdma.c:13:
   In file included from include/linux/dma-mapping.h:7:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:26:
   In file included from include/linux/irqflags.h:16:
   In file included from arch/arm64/include/asm/irqflags.h:10:
   In file included from arch/arm64/include/asm/ptrace.h:11:
   arch/arm64/include/asm/cpufeature.h:751:9: error: use of undeclared iden=
tifier 'nr_cpu_ids'
           return nr_cpu_ids;
                  ^
>> drivers/dma/altera-msgdma.c:877:46: warning: shift count >=3D width of t=
ype [-Wshift-count-overflow]
           ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                       ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.
--
   In file included from drivers/dma/idma64.c:11:
   In file included from include/linux/dmaengine.h:8:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:26:
   In file included from include/linux/irqflags.h:16:
   In file included from arch/arm64/include/asm/irqflags.h:10:
   In file included from arch/arm64/include/asm/ptrace.h:11:
   arch/arm64/include/asm/cpufeature.h:751:9: error: use of undeclared iden=
tifier 'nr_cpu_ids'
           return nr_cpu_ids;
                  ^
>> drivers/dma/idma64.c:648:45: warning: shift count >=3D width of type [-W=
shift-count-overflow]
           ret =3D dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
                                                      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.
--
   In file included from drivers/dma/qcom/hidma_mgmt.c:8:
   In file included from include/linux/dmaengine.h:8:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:26:
   In file included from include/linux/irqflags.h:16:
   In file included from arch/arm64/include/asm/irqflags.h:10:
   In file included from arch/arm64/include/asm/ptrace.h:11:
   arch/arm64/include/asm/cpufeature.h:751:9: error: use of undeclared iden=
tifier 'nr_cpu_ids'
           return nr_cpu_ids;
                  ^
>> drivers/dma/qcom/hidma_mgmt.c:384:23: warning: shift count >=3D width of=
 type [-Wshift-count-overflow]
                   pdevinfo.dma_mask =3D DMA_BIT_MASK(64);
                                       ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.
--
   In file included from drivers/dma/qcom/hidma.c:45:
   In file included from include/linux/dmaengine.h:8:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:26:
   In file included from include/linux/irqflags.h:16:
   In file included from arch/arm64/include/asm/irqflags.h:10:
   In file included from arch/arm64/include/asm/ptrace.h:11:
   arch/arm64/include/asm/cpufeature.h:751:9: error: use of undeclared iden=
tifier 'nr_cpu_ids'
           return nr_cpu_ids;
                  ^
   drivers/dma/qcom/hidma.c:750:8: warning: cast to smaller integer type 'e=
num hidma_cap' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           cap =3D (enum hidma_cap) device_get_match_data(dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dma/qcom/hidma.c:850:45: warning: shift count >=3D width of type=
 [-Wshift-count-overflow]
           rc =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   2 warnings and 1 error generated.
--
   In file included from drivers/misc/mic/bus/vop_bus.c:9:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:54:
   In file included from include/linux/irqflags.h:16:
   In file included from arch/arm64/include/asm/irqflags.h:10:
   In file included from arch/arm64/include/asm/ptrace.h:11:
   arch/arm64/include/asm/cpufeature.h:751:9: error: use of undeclared iden=
tifier 'nr_cpu_ids'
           return nr_cpu_ids;
                  ^
>> drivers/misc/mic/bus/vop_bus.c:150:27: warning: shift count >=3D width o=
f type [-Wshift-count-overflow]
           dma_set_mask(&vdev->dev, DMA_BIT_MASK(64));
                                    ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.
--
   In file included from drivers/mmc/core/sd.c:12:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:54:
   In file included from include/linux/irqflags.h:16:
   In file included from arch/arm64/include/asm/irqflags.h:10:
   In file included from arch/arm64/include/asm/ptrace.h:11:
   arch/arm64/include/asm/cpufeature.h:751:9: error: use of undeclared iden=
tifier 'nr_cpu_ids'
           return nr_cpu_ids;
                  ^
>> drivers/mmc/core/sd.c:89:22: warning: shift count >=3D width of type [-W=
shift-count-overflow]
           card->cid.serial                =3D UNSTUFF_BITS(resp, 24, 32);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd.c:58:39: note: expanded from macro 'UNSTUFF_BITS'
                   const u32 __mask =3D (__size < 32 ? 1 << __size : 0) - 1=
; \
                                                       ^  ~~~~~~
   1 warning and 1 error generated.
--
   In file included from drivers/mmc/host/sdhci-sprd.c:9:
   In file included from include/linux/dma-mapping.h:7:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:26:
   In file included from include/linux/irqflags.h:16:
   In file included from arch/arm64/include/asm/irqflags.h:10:
   In file included from arch/arm64/include/asm/ptrace.h:11:
   arch/arm64/include/asm/cpufeature.h:751:9: error: use of undeclared iden=
tifier 'nr_cpu_ids'
           return nr_cpu_ids;
                  ^
>> drivers/mmc/host/sdhci-sprd.c:558:19: warning: shift count >=3D width of=
 type [-Wshift-count-overflow]
           host->dma_mask =3D DMA_BIT_MASK(64);
                            ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.
--
   In file included from drivers/mmc/host/sdhci.c:14:
   In file included from include/linux/dmaengine.h:8:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:26:
   In file included from include/linux/irqflags.h:16:
   In file included from arch/arm64/include/asm/irqflags.h:10:
   In file included from arch/arm64/include/asm/ptrace.h:11:
   arch/arm64/include/asm/cpufeature.h:751:9: error: use of undeclared iden=
tifier 'nr_cpu_ids'
           return nr_cpu_ids;
                  ^
>> drivers/mmc/host/sdhci.c:3953:40: warning: shift count >=3D width of typ=
e [-Wshift-count-overflow]
                   ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
                                                        ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   drivers/mmc/host/sdhci.c:4254:20: warning: shift count >=3D width of typ=
e [-Wshift-count-overflow]
                   host->dma_mask =3D DMA_BIT_MASK(64);
                                    ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   2 warnings and 1 error generated.
--
   In file included from drivers/mmc/host/dw_mmc.c:10:
   In file included from include/linux/blkdev.h:5:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:26:
   In file included from include/linux/irqflags.h:16:
   In file included from arch/arm64/include/asm/irqflags.h:10:
   In file included from arch/arm64/include/asm/ptrace.h:11:
   arch/arm64/include/asm/cpufeature.h:751:9: error: use of undeclared iden=
tifier 'nr_cpu_ids'
           return nr_cpu_ids;
                  ^
>> drivers/mmc/host/dw_mmc.c:2911:33: warning: shift count >=3D width of ty=
pe [-Wshift-count-overflow]
                           if (!dma_set_mask(host->dev, DMA_BIT_MASK(64)))
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> drivers/mmc/host/dw_mmc.c:2911:33: warning: shift count >=3D width of ty=
pe [-Wshift-count-overflow]
                           if (!dma_set_mask(host->dev, DMA_BIT_MASK(64)))
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                               ^~~~
>> drivers/mmc/host/dw_mmc.c:2911:33: warning: shift count >=3D width of ty=
pe [-Wshift-count-overflow]
                           if (!dma_set_mask(host->dev, DMA_BIT_MASK(64)))
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/mmc/host/dw_mmc.c:2913:13: warning: shift count >=3D width of ty=
pe [-Wshift-count-overflow]
                                                         DMA_BIT_MASK(64));
                                                         ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MA=
SK'
   #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   4 warnings and 1 error generated.

vim +494 ipc/msg.c

a0d092fc2df845a Pierre Peiffer  2008-04-29  473  =

156d9ed1260ee56 Al Viro         2017-07-09  474  static int msgctl_info(str=
uct ipc_namespace *ns, int msqid,
156d9ed1260ee56 Al Viro         2017-07-09  475  			 int cmd, struct msginf=
o *msginfo)
a0d092fc2df845a Pierre Peiffer  2008-04-29  476  {
2cafed30f150f73 Davidlohr Bueso 2013-07-08  477  	int err;
27c331a17461420 Manfred Spraul  2018-08-21  478  	int max_idx;
5a06a363ef48444 Ingo Molnar     2006-07-30  479  =

5a06a363ef48444 Ingo Molnar     2006-07-30  480  	/*
5a06a363ef48444 Ingo Molnar     2006-07-30  481  	 * We must not return ker=
nel stack data.
^1da177e4c3f415 Linus Torvalds  2005-04-16  482  	 * due to padding, it's n=
ot enough
^1da177e4c3f415 Linus Torvalds  2005-04-16  483  	 * to set all member fiel=
ds.
^1da177e4c3f415 Linus Torvalds  2005-04-16  484  	 */
^1da177e4c3f415 Linus Torvalds  2005-04-16  485  	err =3D security_msg_queu=
e_msgctl(NULL, cmd);
^1da177e4c3f415 Linus Torvalds  2005-04-16  486  	if (err)
^1da177e4c3f415 Linus Torvalds  2005-04-16  487  		return err;
^1da177e4c3f415 Linus Torvalds  2005-04-16  488  =

156d9ed1260ee56 Al Viro         2017-07-09  489  	memset(msginfo, 0, sizeof=
(*msginfo));
156d9ed1260ee56 Al Viro         2017-07-09  490  	msginfo->msgmni =3D ns->m=
sg_ctlmni;
156d9ed1260ee56 Al Viro         2017-07-09  491  	msginfo->msgmax =3D ns->m=
sg_ctlmax;
156d9ed1260ee56 Al Viro         2017-07-09  492  	msginfo->msgmnb =3D ns->m=
sg_ctlmnb;
156d9ed1260ee56 Al Viro         2017-07-09  493  	msginfo->msgssz =3D MSGSS=
Z;
156d9ed1260ee56 Al Viro         2017-07-09 @494  	msginfo->msgseg =3D MSGSE=
G;
d9a605e40b1376e Davidlohr Bueso 2013-09-11  495  	down_read(&msg_ids(ns).rw=
sem);
^1da177e4c3f415 Linus Torvalds  2005-04-16  496  	if (cmd =3D=3D MSG_INFO) {
156d9ed1260ee56 Al Viro         2017-07-09  497  		msginfo->msgpool =3D msg=
_ids(ns).in_use;
156d9ed1260ee56 Al Viro         2017-07-09  498  		msginfo->msgmap =3D atom=
ic_read(&ns->msg_hdrs);
156d9ed1260ee56 Al Viro         2017-07-09  499  		msginfo->msgtql =3D atom=
ic_read(&ns->msg_bytes);
^1da177e4c3f415 Linus Torvalds  2005-04-16  500  	} else {
156d9ed1260ee56 Al Viro         2017-07-09  501  		msginfo->msgmap =3D MSGM=
AP;
156d9ed1260ee56 Al Viro         2017-07-09  502  		msginfo->msgpool =3D MSG=
POOL;
156d9ed1260ee56 Al Viro         2017-07-09  503  		msginfo->msgtql =3D MSGT=
QL;
^1da177e4c3f415 Linus Torvalds  2005-04-16  504  	}
27c331a17461420 Manfred Spraul  2018-08-21  505  	max_idx =3D ipc_get_maxid=
x(&msg_ids(ns));
d9a605e40b1376e Davidlohr Bueso 2013-09-11  506  	up_read(&msg_ids(ns).rwse=
m);
27c331a17461420 Manfred Spraul  2018-08-21  507  	return (max_idx < 0) ? 0 =
: max_idx;
^1da177e4c3f415 Linus Torvalds  2005-04-16  508  }
2cafed30f150f73 Davidlohr Bueso 2013-07-08  509  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============5909721346260137880==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
VHWYx2H1SonittlX4n9zkoyfKh0CAA==
--===============5909721346260137880==--

