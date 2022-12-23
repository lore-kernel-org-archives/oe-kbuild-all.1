Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD163199
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Dec 2022 00:50:20 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id g7so2736923qts.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Dec 2022 16:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HK0NzjehBFdU5DPkz66XIVST96BDBCSuAiI0Z5ePT8=;
        b=hq5XvkxJ/NWyTI6NZUe4gBC4LcGb2K5TTbN38hLfZt/1RGlhNXb9HEd8/osd6KXJJ/
         m41AyXhAR1hmXJwUXWctGhOQz9cJ/sjEklbrnQ8hMiGAoJeKBG6R73KqPNU9ANQxQ0eI
         tBK2RlWWj2eN3ttG3FHaN8XUXHiLUXfauoEWggAWnhe88pfwvxwxb9uHXZjTnG45EO5B
         WuEq18TvkEyx+VXWSODtvYEnCo5Mps7iswsqHJBXKypMQww0/iyeEhgwUAtlqeBvj5U/
         68OoPWwUb8CeVRG8xPpq81ve8kdBKXZfovXgBv0idmwVd5ClE3Xj9J1WyEkpRtA99K7y
         Gpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HK0NzjehBFdU5DPkz66XIVST96BDBCSuAiI0Z5ePT8=;
        b=bkCnR3BudbvVh5pNWHy7H20tt41drZyVqntGErv52mOb9Al/rNHt+yQm3Y0P1+bKDG
         gE/acBIgooKo6GR4WarQmI5xPD3kexu9GHt4MnqlrslTqaZiyvWHRPSkYsLgPapKTJZy
         779civmX6W6TmYYkB4DqCw5kVsz0GwP7WecNynpm69iRLJYSEp2HmFgJhTtfvFrBnqIm
         EytqzMxyT3DHFLGf/xLyWBdKMfUxnxdUiY6FZHikWPAtPdeVzMpt5pAJ2w7Yr09Zd+Yz
         88GoxovTT/gTPNwKnhrewRvm9CghJn5ZUvscE4losvSW/jZICyUQVkKlW3yhihnYyTH0
         9hgw==
X-Gm-Message-State: AFqh2kpc0kwH3dgVRGnLhdt5BJcyF63DD0Ub4KvSmI28GGqIgz1HvezD
	s5m3J7e9aGsrOgGoy01oKuI=
X-Google-Smtp-Source: AMrXdXsHGLd8M1LIGJ5wH0Lb6/t753OsPfNLTQKUBEgVxoVSartfn7WsQZNO4JT0oSeUqd0avVMocw==
X-Received: by 2002:a05:622a:206:b0:3a7:eb36:5cb3 with SMTP id b6-20020a05622a020600b003a7eb365cb3mr12904416qtx.41.1671756618765;
        Thu, 22 Dec 2022 16:50:18 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id m14-20020ac866ce000000b003a7ee9613a6sm1153290qtp.25.2022.12.22.16.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 16:50:17 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailauth.nyi.internal (Postfix) with ESMTP id 4618E27C0054;
	Thu, 22 Dec 2022 19:50:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 22 Dec 2022 19:50:17 -0500
X-ME-Sender: <xms:SPukY82ZhQu9uB6FtX0RSr55TZ01r9cbRgAGNnjGXocNt5JAMJ0Z2g>
    <xme:SPukY3HGAsc9IS3PxFAjp_EMSaojwLQSGd55TPy0-r1ZKyn0RLpVMkp8WlcpAG_6b
    BVzmMUSSAmDZZ-8_A>
X-ME-Received: <xmr:SPukY05cBCDBMnvTaRfOVwxJk6WxxOWkne9mq6gvMCNUAZWaIdEWpefiNUc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedugddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfhfgggtuggj
    sehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvg
    hnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnheptefhieevjeehffetudeu
    uedtfedvtdejffelieevkeeifeegfefhteevleetueffnecuffhomhgrihhnpehkvghrnh
    gvlhdrohhrghdpghhithhhuhgsuhhsvghrtghonhhtvghnthdrtghomhdptddurdhorhhg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgv
X-ME-Proxy: <xmx:SPukY13NlI1aNIHKURzqa6GCAXNY6QCB_IQXOvogMXILJbxsdWCEYA>
    <xmx:SPukY_HC3Cz6n_6JeqBwFgnYY7pCVG1Z1FoJRV98-s3lTi6eRrLjyQ>
    <xmx:SPukY-8iNqb-oN3kYRBeH-DDtpjc5Akj0EDSwYONlvh9vrHK40N7Ag>
    <xmx:SfukY0TdKH7gGoNcArhvg8KWp-jSgoo3Ofm8bV26Pam4t9KTs5HAxw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 19:50:16 -0500 (EST)
Date: Thu, 22 Dec 2022 16:49:51 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [peterz-queue:core/wip-u128 15/15]
 include/linux/atomic/atomic-instrumented.h:1946:9: error: implicit
 declaration of function 'arch_cmpxchg64'; did you mean 'arch_cmpxchg'?
Message-ID: <Y6T7L1JdZu09MWHg@boqun-archlinux>
References: <202212230349.S8YIC4y8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212230349.S8YIC4y8-lkp@intel.com>

On Fri, Dec 23, 2022 at 03:59:16AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/wip-u128
> head:   31c97c3ea0503f4ba1de8de97905d7a36fcbfd2d
> commit: 31c97c3ea0503f4ba1de8de97905d7a36fcbfd2d [15/15] atomic: Add test cases for cmpxchg128 family
> config: arc-randconfig-r043-20221219
> compiler: arc-elf-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=31c97c3ea0503f4ba1de8de97905d7a36fcbfd2d
>         git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
>         git fetch --no-tags peterz-queue core/wip-u128
>         git checkout 31c97c3ea0503f4ba1de8de97905d7a36fcbfd2d
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/build_bug.h:5,
>                     from include/linux/init.h:5,
>                     from lib/atomic64_test.c:10:
>    lib/atomic64_test.c: In function 'test_atomic64':
> >> include/linux/atomic/atomic-instrumented.h:1946:9: error: implicit declaration of function 'arch_cmpxchg64'; did you mean 'arch_cmpxchg'? [-Werror=implicit-function-declaration]
>     1946 |         arch_cmpxchg64(__ai_ptr, __VA_ARGS__); \

Peter, all these three warnings are caused by the fact that we don't
have arch_cmpxchg64() API for archs without 64bit atomic support. Please
consider the following (removing the test) as a temporary workaround:


diff --git a/lib/atomic64_test.c b/lib/atomic64_test.c
index 7f79d0704ba8..3927ef0d2bc8 100644
--- a/lib/atomic64_test.c
+++ b/lib/atomic64_test.c
@@ -172,7 +172,6 @@ static __init void test_atomic64(void)
        int r_int;

        atomic64_t v = ATOMIC64_INIT(v0);
-       long long n = 0;
        long long r = v0;
        BUG_ON(v.counter != r);

@@ -220,7 +219,6 @@ static __init void test_atomic64(void)

        XCHG_FAMILY_TEST(64, v0, v1);
        ATOMIC_CMPXCHG_FAMILY_TEST(64, v0, v1, v2);
-       CMPXCHG_FAMILY_TEST(64, v0, v1, v2);

        INIT(v0);
        BUG_ON(atomic64_add_unless(&v, one, v0));


I will figure out how we conditional compile these tests in the future.

Regards,
Boqun

>          |         ^~~~~~~~~~~~~~
>    include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
>       78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>          |                                             ^
>    lib/atomic64_test.c:82:9: note: in expansion of macro 'BUG_ON'
>       82 |         BUG_ON(op(&n, ##args) != ret);                          \
>          |         ^~~~~~
>    lib/atomic64_test.c:82:16: note: in expansion of macro 'cmpxchg64'
>       82 |         BUG_ON(op(&n, ##args) != ret);                          \
>          |                ^~
>    lib/atomic64_test.c:38:9: note: in expansion of macro 'TEST_ARGS_PLAIN'
>       38 |         test(bit, op, ##args);          \
>          |         ^~~~
>    lib/atomic64_test.c:101:9: note: in expansion of macro 'FAMILY_TEST'
>      101 |         FAMILY_TEST(TEST_ARGS_PLAIN, _, cmpxchg##bit,                   \
>          |         ^~~~~~~~~~~
>    lib/atomic64_test.c:223:9: note: in expansion of macro 'CMPXCHG_FAMILY_TEST'
>      223 |         CMPXCHG_FAMILY_TEST(64, v0, v1, v2);
>          |         ^~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> 
> 
> vim +1946 include/linux/atomic/atomic-instrumented.h
> 
> aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland  2018-09-04  1940  
> aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland  2018-09-04  1941  #define cmpxchg64(ptr, ...) \
> aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland  2018-09-04  1942  ({ \
> aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland  2018-09-04  1943  	typeof(ptr) __ai_ptr = (ptr); \
> e87c4f6642f496 include/linux/atomic/atomic-instrumented.h Marco Elver   2021-11-30  1944  	kcsan_mb(); \
> ed8af2e4d2a71b include/asm-generic/atomic-instrumented.h  Marco Elver   2020-01-21  1945  	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
> aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland  2018-09-04 @1946  	arch_cmpxchg64(__ai_ptr, __VA_ARGS__); \
> aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland  2018-09-04  1947  })
> b06ed71a624ba0 include/asm-generic/atomic-instrumented.h  Dmitry Vyukov 2018-01-29  1948  
> 
> :::::: The code at line 1946 was first introduced by commit
> :::::: aa525d063851a98e020b827fdd1d7776ae652301 locking/atomics: Switch to generated instrumentation
> 
> :::::: TO: Mark Rutland <mark.rutland@arm.com>
> :::::: CC: Ingo Molnar <mingo@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/arc 6.1.0 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT="arc-elf-gcc (GCC) 12.1.0"
> CONFIG_CC_IS_GCC=y
> CONFIG_GCC_VERSION=120100
> CONFIG_CLANG_VERSION=0
> CONFIG_AS_IS_GNU=y
> CONFIG_AS_VERSION=23800
> CONFIG_LD_IS_BFD=y
> CONFIG_LD_VERSION=23800
> CONFIG_LLD_VERSION=0
> CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
> CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
> CONFIG_CC_HAS_ASM_INLINE=y
> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
> CONFIG_PAHOLE_VERSION=123
> CONFIG_CONSTRUCTORS=y
> CONFIG_IRQ_WORK=y
> CONFIG_BUILDTIME_TABLE_SORT=y
> 
> #
> # General setup
> #
> CONFIG_BROKEN_ON_SMP=y
> CONFIG_INIT_ENV_ARG_LIMIT=32
> CONFIG_COMPILE_TEST=y
> # CONFIG_WERROR is not set
> CONFIG_LOCALVERSION=""
> CONFIG_BUILD_SALT=""
> CONFIG_HAVE_KERNEL_GZIP=y
> CONFIG_HAVE_KERNEL_LZMA=y
> CONFIG_KERNEL_GZIP=y
> # CONFIG_KERNEL_LZMA is not set
> CONFIG_DEFAULT_INIT=""
> CONFIG_DEFAULT_HOSTNAME="(none)"
> # CONFIG_SYSVIPC is not set
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_WATCH_QUEUE is not set
> CONFIG_CROSS_MEMORY_ATTACH=y
> CONFIG_USELIB=y
> CONFIG_AUDIT=y
> 
> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_SHOW=y
> CONFIG_GENERIC_IRQ_INJECTION=y
> CONFIG_GENERIC_IRQ_CHIP=y
> CONFIG_IRQ_DOMAIN=y
> CONFIG_IRQ_SIM=y
> CONFIG_IRQ_DOMAIN_HIERARCHY=y
> CONFIG_GENERIC_IRQ_DEBUGFS=y
> # end of IRQ subsystem
> 
> CONFIG_GENERIC_CLOCKEVENTS=y
> CONFIG_TIME_KUNIT_TEST=y
> 
> #
> # Timers subsystem
> #
> CONFIG_HZ_PERIODIC=y
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ=y
> # CONFIG_HIGH_RES_TIMERS is not set
> # end of Timers subsystem
> 
> CONFIG_BPF=y
> 
> #
> # BPF subsystem
> #
> CONFIG_BPF_SYSCALL=y
> # CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
> # end of BPF subsystem
> 
> CONFIG_PREEMPT_NONE_BUILD=y
> CONFIG_PREEMPT_NONE=y
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=y
> 
> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=y
> CONFIG_BSD_PROCESS_ACCT=y
> # CONFIG_BSD_PROCESS_ACCT_V3 is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> 
> CONFIG_CPU_ISOLATION=y
> 
> #
> # RCU Subsystem
> #
> CONFIG_TINY_RCU=y
> CONFIG_RCU_EXPERT=y
> CONFIG_SRCU=y
> CONFIG_TINY_SRCU=y
> CONFIG_TASKS_RCU_GENERIC=y
> # CONFIG_FORCE_TASKS_RCU is not set
> CONFIG_FORCE_TASKS_RUDE_RCU=y
> CONFIG_TASKS_RUDE_RCU=y
> # CONFIG_FORCE_TASKS_TRACE_RCU is not set
> CONFIG_TASKS_TRACE_RCU=y
> CONFIG_RCU_NEED_SEGCBLIST=y
> CONFIG_TASKS_TRACE_RCU_READ_MB=y
> # end of RCU Subsystem
> 
> CONFIG_BUILD_BIN2C=y
> CONFIG_IKCONFIG=y
> # CONFIG_IKCONFIG_PROC is not set
> CONFIG_IKHEADERS=y
> CONFIG_GENERIC_SCHED_CLOCK=y
> 
> #
> # Scheduler features
> #
> # end of Scheduler features
> 
> CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
> CONFIG_GCC12_NO_ARRAY_BOUNDS=y
> CONFIG_CC_NO_ARRAY_BOUNDS=y
> CONFIG_CGROUPS=y
> CONFIG_PAGE_COUNTER=y
> # CONFIG_CGROUP_FAVOR_DYNMODS is not set
> CONFIG_MEMCG=y
> CONFIG_CGROUP_SCHED=y
> CONFIG_FAIR_GROUP_SCHED=y
> # CONFIG_CFS_BANDWIDTH is not set
> # CONFIG_RT_GROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> CONFIG_CGROUP_RDMA=y
> CONFIG_CGROUP_FREEZER=y
> # CONFIG_CGROUP_DEVICE is not set
> CONFIG_CGROUP_CPUACCT=y
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_BPF is not set
> CONFIG_CGROUP_MISC=y
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_SOCK_CGROUP_DATA=y
> # CONFIG_NAMESPACES is not set
> CONFIG_CHECKPOINT_RESTORE=y
> CONFIG_SCHED_AUTOGROUP=y
> CONFIG_SYSFS_DEPRECATED=y
> CONFIG_SYSFS_DEPRECATED_V2=y
> # CONFIG_RELAY is not set
> CONFIG_BLK_DEV_INITRD=y
> CONFIG_INITRAMFS_SOURCE=""
> CONFIG_RD_GZIP=y
> CONFIG_RD_BZIP2=y
> # CONFIG_RD_LZMA is not set
> CONFIG_RD_XZ=y
> # CONFIG_RD_LZO is not set
> CONFIG_RD_LZ4=y
> # CONFIG_RD_ZSTD is not set
> CONFIG_BOOT_CONFIG=y
> CONFIG_BOOT_CONFIG_EMBED=y
> CONFIG_BOOT_CONFIG_EMBED_FILE=""
> CONFIG_INITRAMFS_PRESERVE_MTIME=y
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> CONFIG_SYSCTL=y
> CONFIG_SYSCTL_ARCH_UNALIGN_NO_WARN=y
> CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW=y
> CONFIG_EXPERT=y
> CONFIG_MULTIUSER=y
> CONFIG_SGETMASK_SYSCALL=y
> # CONFIG_SYSFS_SYSCALL is not set
> CONFIG_FHANDLE=y
> CONFIG_POSIX_TIMERS=y
> # CONFIG_PRINTK is not set
> CONFIG_BUG=y
> CONFIG_BASE_FULL=y
> # CONFIG_FUTEX is not set
> CONFIG_EPOLL=y
> # CONFIG_SIGNALFD is not set
> # CONFIG_TIMERFD is not set
> CONFIG_EVENTFD=y
> CONFIG_SHMEM=y
> CONFIG_AIO=y
> # CONFIG_IO_URING is not set
> # CONFIG_ADVISE_SYSCALLS is not set
> # CONFIG_MEMBARRIER is not set
> CONFIG_KALLSYMS=y
> # CONFIG_KALLSYMS_SELFTEST is not set
> CONFIG_KALLSYMS_ALL=y
> CONFIG_KALLSYMS_BASE_RELATIVE=y
> CONFIG_KCMP=y
> CONFIG_EMBEDDED=y
> CONFIG_HAVE_PERF_EVENTS=y
> CONFIG_PERF_USE_VMALLOC=y
> # CONFIG_PC104 is not set
> 
> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=y
> CONFIG_DEBUG_PERF_USE_VMALLOC=y
> # end of Kernel Performance Events And Counters
> 
> CONFIG_PROFILING=y
> CONFIG_TRACEPOINTS=y
> # end of General setup
> 
> CONFIG_ARC=y
> CONFIG_LOCKDEP_SUPPORT=y
> CONFIG_SCHED_OMIT_FRAME_POINTER=y
> CONFIG_GENERIC_CSUM=y
> CONFIG_ARCH_FLATMEM_ENABLE=y
> CONFIG_MMU=y
> CONFIG_NO_IOPORT_MAP=y
> CONFIG_GENERIC_CALIBRATE_DELAY=y
> CONFIG_GENERIC_HWEIGHT=y
> CONFIG_STACKTRACE_SUPPORT=y
> 
> #
> # ARC Architecture Configuration
> #
> 
> #
> # ARC Platform/SoC/Board
> #
> CONFIG_ARC_PLAT_TB10X=y
> # CONFIG_ARC_PLAT_AXS10X is not set
> # end of ARC Platform/SoC/Board
> 
> CONFIG_ISA_ARCOMPACT=y
> # CONFIG_ISA_ARCV2 is not set
> 
> #
> # ARC CPU Configuration
> #
> CONFIG_ARC_CPU_770=y
> CONFIG_ARC_TUNE_MCPU=""
> # CONFIG_CPU_BIG_ENDIAN is not set
> # CONFIG_SMP is not set
> # CONFIG_ARC_CACHE is not set
> # CONFIG_ARC_HAS_ICCM is not set
> CONFIG_ARC_HAS_DCCM=y
> CONFIG_ARC_DCCM_SZ=64
> CONFIG_ARC_DCCM_BASE=0xA0000000
> CONFIG_ARC_MMU_V3=y
> CONFIG_ARC_PAGE_SIZE_8K=y
> # CONFIG_ARC_PAGE_SIZE_16K is not set
> # CONFIG_ARC_PAGE_SIZE_4K is not set
> CONFIG_PGTABLE_LEVELS=2
> CONFIG_ARC_COMPACT_IRQ_LEVELS=y
> CONFIG_ARC_FPU_SAVE_RESTORE=y
> CONFIG_ARC_HAS_LLSC=y
> CONFIG_ARC_HAS_SWAPE=y
> # end of ARC CPU Configuration
> 
> CONFIG_LINUX_LINK_BASE=0x80000000
> CONFIG_LINUX_RAM_BASE=0x80000000
> CONFIG_HIGHMEM=y
> CONFIG_ARC_KVADDR_SIZE=256
> CONFIG_ARC_CURR_IN_REG=y
> CONFIG_ARC_EMUL_UNALIGNED=y
> CONFIG_HZ=100
> CONFIG_ARC_METAWARE_HLINK=y
> CONFIG_ARC_DBG=y
> # CONFIG_ARC_DW2_UNWIND is not set
> CONFIG_ARC_BUILTIN_DTB_NAME=""
> # end of ARC Architecture Configuration
> 
> CONFIG_ARCH_FORCE_MAX_ORDER=11
> # CONFIG_PM is not set
> 
> #
> # General architecture-dependent options
> #
> CONFIG_HAVE_IOREMAP_PROT=y
> CONFIG_HAVE_KPROBES=y
> CONFIG_HAVE_KRETPROBES=y
> CONFIG_TRACE_IRQFLAGS_SUPPORT=y
> CONFIG_HAVE_ARCH_TRACEHOOK=y
> CONFIG_GENERIC_SMP_IDLE_THREAD=y
> CONFIG_ARCH_32BIT_OFF_T=y
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
> CONFIG_LTO_NONE=y
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
> CONFIG_MODULES_USE_ELF_RELA=y
> CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
> CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
> CONFIG_CLONE_BACKWARDS=y
> CONFIG_COMPAT_32BIT_TIME=y
> CONFIG_CPU_NO_EFFICIENT_FFS=y
> CONFIG_LOCK_EVENT_COUNTS=y
> CONFIG_HAVE_ARCH_PFN_VALID=y
> 
> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=y
> # end of GCOV-based kernel profiling
> 
> CONFIG_FUNCTION_ALIGNMENT_64B=y
> CONFIG_FUNCTION_ALIGNMENT=64
> # end of General architecture-dependent options
> 
> CONFIG_RT_MUTEXES=y
> CONFIG_BASE_SMALL=0
> # CONFIG_MODULES is not set
> # CONFIG_BLOCK is not set
> CONFIG_ASN1=y
> CONFIG_UNINLINE_SPIN_UNLOCK=y
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
> CONFIG_FREEZER=y
> 
> #
> # Executable file formats
> #
> # CONFIG_BINFMT_ELF is not set
> # CONFIG_BINFMT_SCRIPT is not set
> # CONFIG_BINFMT_MISC is not set
> # CONFIG_COREDUMP is not set
> # end of Executable file formats
> 
> #
> # Memory Management options
> #
> 
> #
> # SLAB allocator options
> #
> # CONFIG_SLAB is not set
> # CONFIG_SLUB is not set
> CONFIG_SLOB_DEPRECATED=y
> CONFIG_SLOB=y
> # end of SLAB allocator options
> 
> # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> CONFIG_COMPAT_BRK=y
> CONFIG_FLATMEM=y
> CONFIG_MEMORY_ISOLATION=y
> CONFIG_SPLIT_PTLOCK_CPUS=4
> CONFIG_COMPACTION=y
> CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
> # CONFIG_PAGE_REPORTING is not set
> CONFIG_MIGRATION=y
> CONFIG_CONTIG_ALLOC=y
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
> CONFIG_NEED_PER_CPU_KM=y
> CONFIG_CMA=y
> # CONFIG_CMA_DEBUG is not set
> # CONFIG_CMA_DEBUGFS is not set
> # CONFIG_CMA_SYSFS is not set
> CONFIG_CMA_AREAS=7
> CONFIG_PAGE_IDLE_FLAG=y
> CONFIG_IDLE_PAGE_TRACKING=y
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
> CONFIG_VM_EVENT_COUNTERS=y
> CONFIG_PERCPU_STATS=y
> CONFIG_GUP_TEST=y
> CONFIG_ARCH_HAS_PTE_SPECIAL=y
> CONFIG_KMAP_LOCAL=y
> # CONFIG_USERFAULTFD is not set
> # CONFIG_LRU_GEN is not set
> 
> #
> # Data Access Monitoring
> #
> CONFIG_DAMON=y
> CONFIG_DAMON_KUNIT_TEST=y
> # CONFIG_DAMON_VADDR is not set
> # CONFIG_DAMON_PADDR is not set
> # CONFIG_DAMON_SYSFS is not set
> # end of Data Access Monitoring
> # end of Memory Management options
> 
> CONFIG_NET=y
> CONFIG_SKB_EXTENSIONS=y
> 
> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> # CONFIG_UNIX is not set
> CONFIG_TLS=y
> CONFIG_TLS_DEVICE=y
> # CONFIG_TLS_TOE is not set
> CONFIG_XFRM=y
> CONFIG_XFRM_OFFLOAD=y
> CONFIG_XFRM_ALGO=y
> CONFIG_XFRM_USER=y
> # CONFIG_XFRM_INTERFACE is not set
> CONFIG_XFRM_SUB_POLICY=y
> CONFIG_XFRM_MIGRATE=y
> CONFIG_XFRM_STATISTICS=y
> CONFIG_XFRM_AH=y
> CONFIG_XFRM_ESP=y
> CONFIG_XFRM_IPCOMP=y
> CONFIG_NET_KEY=y
> # CONFIG_NET_KEY_MIGRATE is not set
> CONFIG_XFRM_ESPINTCP=y
> CONFIG_XDP_SOCKETS=y
> CONFIG_XDP_SOCKETS_DIAG=y
> CONFIG_INET=y
> CONFIG_IP_MULTICAST=y
> # CONFIG_IP_ADVANCED_ROUTER is not set
> CONFIG_IP_ROUTE_CLASSID=y
> CONFIG_IP_PNP=y
> CONFIG_IP_PNP_DHCP=y
> # CONFIG_IP_PNP_BOOTP is not set
> CONFIG_IP_PNP_RARP=y
> CONFIG_NET_IPIP=y
> # CONFIG_NET_IPGRE_DEMUX is not set
> CONFIG_NET_IP_TUNNEL=y
> CONFIG_IP_MROUTE_COMMON=y
> CONFIG_IP_MROUTE=y
> CONFIG_IP_PIMSM_V1=y
> CONFIG_IP_PIMSM_V2=y
> # CONFIG_SYN_COOKIES is not set
> # CONFIG_NET_IPVTI is not set
> CONFIG_NET_UDP_TUNNEL=y
> CONFIG_NET_FOU=y
> CONFIG_NET_FOU_IP_TUNNELS=y
> CONFIG_INET_AH=y
> CONFIG_INET_ESP=y
> CONFIG_INET_ESP_OFFLOAD=y
> CONFIG_INET_ESPINTCP=y
> # CONFIG_INET_IPCOMP is not set
> CONFIG_INET_TABLE_PERTURB_ORDER=16
> CONFIG_INET_TUNNEL=y
> # CONFIG_INET_DIAG is not set
> # CONFIG_TCP_CONG_ADVANCED is not set
> CONFIG_TCP_CONG_CUBIC=y
> CONFIG_DEFAULT_TCP_CONG="cubic"
> CONFIG_TCP_MD5SIG=y
> CONFIG_IPV6=y
> # CONFIG_IPV6_ROUTER_PREF is not set
> CONFIG_IPV6_OPTIMISTIC_DAD=y
> CONFIG_INET6_AH=y
> CONFIG_INET6_ESP=y
> # CONFIG_INET6_ESP_OFFLOAD is not set
> CONFIG_INET6_ESPINTCP=y
> CONFIG_INET6_IPCOMP=y
> CONFIG_IPV6_MIP6=y
> # CONFIG_IPV6_ILA is not set
> CONFIG_INET6_XFRM_TUNNEL=y
> CONFIG_INET6_TUNNEL=y
> # CONFIG_IPV6_VTI is not set
> # CONFIG_IPV6_SIT is not set
> CONFIG_IPV6_TUNNEL=y
> CONFIG_IPV6_FOU=y
> CONFIG_IPV6_FOU_TUNNEL=y
> CONFIG_IPV6_MULTIPLE_TABLES=y
> # CONFIG_IPV6_SUBTREES is not set
> CONFIG_IPV6_MROUTE=y
> # CONFIG_IPV6_MROUTE_MULTIPLE_TABLES is not set
> CONFIG_IPV6_PIMSM_V2=y
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> CONFIG_IPV6_RPL_LWTUNNEL=y
> CONFIG_IPV6_IOAM6_LWTUNNEL=y
> CONFIG_NETLABEL=y
> CONFIG_MPTCP=y
> CONFIG_MPTCP_IPV6=y
> CONFIG_MPTCP_KUNIT_TEST=y
> CONFIG_NETWORK_SECMARK=y
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> CONFIG_NETFILTER=y
> # CONFIG_NETFILTER_ADVANCED is not set
> 
> #
> # Core Netfilter Configuration
> #
> # CONFIG_NETFILTER_INGRESS is not set
> # CONFIG_NETFILTER_EGRESS is not set
> CONFIG_NETFILTER_NETLINK=y
> CONFIG_NETFILTER_FAMILY_BRIDGE=y
> CONFIG_NETFILTER_NETLINK_LOG=y
> # CONFIG_NF_CONNTRACK is not set
> CONFIG_NF_LOG_SYSLOG=y
> CONFIG_NF_TABLES=y
> CONFIG_NF_TABLES_INET=y
> # CONFIG_NF_TABLES_NETDEV is not set
> CONFIG_NFT_NUMGEN=y
> # CONFIG_NFT_LOG is not set
> CONFIG_NFT_LIMIT=y
> CONFIG_NFT_TUNNEL=y
> # CONFIG_NFT_QUOTA is not set
> CONFIG_NFT_REJECT=y
> CONFIG_NFT_REJECT_INET=y
> CONFIG_NFT_COMPAT=y
> CONFIG_NFT_HASH=y
> CONFIG_NFT_FIB=y
> CONFIG_NFT_FIB_INET=y
> # CONFIG_NFT_XFRM is not set
> CONFIG_NFT_SOCKET=y
> # CONFIG_NFT_TPROXY is not set
> CONFIG_NETFILTER_XTABLES=y
> 
> #
> # Xtables combined modules
> #
> # CONFIG_NETFILTER_XT_MARK is not set
> 
> #
> # Xtables targets
> #
> CONFIG_NETFILTER_XT_TARGET_LOG=y
> CONFIG_NETFILTER_XT_TARGET_NFLOG=y
> CONFIG_NETFILTER_XT_TARGET_SECMARK=y
> CONFIG_NETFILTER_XT_TARGET_TCPMSS=y
> 
> #
> # Xtables matches
> #
> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
> # CONFIG_NETFILTER_XT_MATCH_POLICY is not set
> # end of Core Netfilter Configuration
> 
> # CONFIG_IP_SET is not set
> CONFIG_IP_VS=y
> CONFIG_IP_VS_IPV6=y
> # CONFIG_IP_VS_DEBUG is not set
> CONFIG_IP_VS_TAB_BITS=12
> 
> #
> # IPVS transport protocol load balancing support
> #
> CONFIG_IP_VS_PROTO_TCP=y
> CONFIG_IP_VS_PROTO_UDP=y
> CONFIG_IP_VS_PROTO_AH_ESP=y
> CONFIG_IP_VS_PROTO_ESP=y
> # CONFIG_IP_VS_PROTO_AH is not set
> CONFIG_IP_VS_PROTO_SCTP=y
> 
> #
> # IPVS scheduler
> #
> # CONFIG_IP_VS_RR is not set
> CONFIG_IP_VS_WRR=y
> CONFIG_IP_VS_LC=y
> # CONFIG_IP_VS_WLC is not set
> # CONFIG_IP_VS_FO is not set
> # CONFIG_IP_VS_OVF is not set
> CONFIG_IP_VS_LBLC=y
> CONFIG_IP_VS_LBLCR=y
> # CONFIG_IP_VS_DH is not set
> # CONFIG_IP_VS_SH is not set
> CONFIG_IP_VS_MH=y
> CONFIG_IP_VS_SED=y
> CONFIG_IP_VS_NQ=y
> # CONFIG_IP_VS_TWOS is not set
> 
> #
> # IPVS SH scheduler
> #
> CONFIG_IP_VS_SH_TAB_BITS=8
> 
> #
> # IPVS MH scheduler
> #
> CONFIG_IP_VS_MH_TAB_INDEX=12
> 
> #
> # IPVS application helper
> #
> 
> #
> # IP: Netfilter Configuration
> #
> CONFIG_NF_SOCKET_IPV4=y
> # CONFIG_NF_TPROXY_IPV4 is not set
> CONFIG_NF_TABLES_IPV4=y
> CONFIG_NFT_REJECT_IPV4=y
> CONFIG_NFT_DUP_IPV4=y
> CONFIG_NFT_FIB_IPV4=y
> # CONFIG_NF_TABLES_ARP is not set
> CONFIG_NF_DUP_IPV4=y
> CONFIG_NF_LOG_ARP=y
> # CONFIG_NF_LOG_IPV4 is not set
> CONFIG_NF_REJECT_IPV4=y
> CONFIG_IP_NF_IPTABLES=y
> CONFIG_IP_NF_FILTER=y
> # CONFIG_IP_NF_TARGET_REJECT is not set
> CONFIG_IP_NF_MANGLE=y
> CONFIG_IP_NF_RAW=y
> # end of IP: Netfilter Configuration
> 
> #
> # IPv6: Netfilter Configuration
> #
> CONFIG_NF_SOCKET_IPV6=y
> # CONFIG_NF_TPROXY_IPV6 is not set
> CONFIG_NF_TABLES_IPV6=y
> CONFIG_NFT_REJECT_IPV6=y
> # CONFIG_NFT_DUP_IPV6 is not set
> CONFIG_NFT_FIB_IPV6=y
> CONFIG_NF_DUP_IPV6=y
> CONFIG_NF_REJECT_IPV6=y
> # CONFIG_NF_LOG_IPV6 is not set
> # CONFIG_IP6_NF_IPTABLES is not set
> # end of IPv6: Netfilter Configuration
> 
> CONFIG_NF_DEFRAG_IPV6=y
> CONFIG_NF_TABLES_BRIDGE=y
> # CONFIG_NFT_BRIDGE_META is not set
> CONFIG_NFT_BRIDGE_REJECT=y
> CONFIG_BRIDGE_NF_EBTABLES=y
> CONFIG_BRIDGE_EBT_BROUTE=y
> CONFIG_BRIDGE_EBT_T_FILTER=y
> CONFIG_BRIDGE_EBT_T_NAT=y
> # CONFIG_BRIDGE_EBT_802_3 is not set
> # CONFIG_BRIDGE_EBT_AMONG is not set
> CONFIG_BRIDGE_EBT_ARP=y
> CONFIG_BRIDGE_EBT_IP=y
> CONFIG_BRIDGE_EBT_IP6=y
> CONFIG_BRIDGE_EBT_LIMIT=y
> # CONFIG_BRIDGE_EBT_MARK is not set
> CONFIG_BRIDGE_EBT_PKTTYPE=y
> # CONFIG_BRIDGE_EBT_STP is not set
> # CONFIG_BRIDGE_EBT_VLAN is not set
> CONFIG_BRIDGE_EBT_ARPREPLY=y
> # CONFIG_BRIDGE_EBT_DNAT is not set
> CONFIG_BRIDGE_EBT_MARK_T=y
> # CONFIG_BRIDGE_EBT_REDIRECT is not set
> CONFIG_BRIDGE_EBT_SNAT=y
> # CONFIG_BRIDGE_EBT_LOG is not set
> CONFIG_BRIDGE_EBT_NFLOG=y
> # CONFIG_BPFILTER is not set
> CONFIG_IP_DCCP=y
> 
> #
> # DCCP CCIDs Configuration
> #
> # CONFIG_IP_DCCP_CCID2_DEBUG is not set
> CONFIG_IP_DCCP_CCID3=y
> CONFIG_IP_DCCP_CCID3_DEBUG=y
> CONFIG_IP_DCCP_TFRC_LIB=y
> CONFIG_IP_DCCP_TFRC_DEBUG=y
> # end of DCCP CCIDs Configuration
> 
> #
> # DCCP Kernel Hacking
> #
> # CONFIG_IP_DCCP_DEBUG is not set
> # end of DCCP Kernel Hacking
> 
> CONFIG_IP_SCTP=y
> CONFIG_SCTP_DBG_OBJCNT=y
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> CONFIG_SCTP_COOKIE_HMAC_MD5=y
> CONFIG_SCTP_COOKIE_HMAC_SHA1=y
> CONFIG_RDS=y
> CONFIG_RDS_TCP=y
> CONFIG_RDS_DEBUG=y
> CONFIG_TIPC=y
> # CONFIG_TIPC_MEDIA_UDP is not set
> # CONFIG_TIPC_CRYPTO is not set
> CONFIG_TIPC_DIAG=y
> CONFIG_ATM=y
> # CONFIG_ATM_CLIP is not set
> # CONFIG_ATM_LANE is not set
> CONFIG_ATM_BR2684=y
> CONFIG_ATM_BR2684_IPFILTER=y
> CONFIG_L2TP=y
> # CONFIG_L2TP_DEBUGFS is not set
> CONFIG_L2TP_V3=y
> CONFIG_L2TP_IP=y
> CONFIG_L2TP_ETH=y
> CONFIG_STP=y
> CONFIG_BRIDGE=y
> CONFIG_BRIDGE_IGMP_SNOOPING=y
> CONFIG_BRIDGE_VLAN_FILTERING=y
> # CONFIG_BRIDGE_MRP is not set
> # CONFIG_BRIDGE_CFM is not set
> CONFIG_VLAN_8021Q=y
> # CONFIG_VLAN_8021Q_GVRP is not set
> # CONFIG_VLAN_8021Q_MVRP is not set
> CONFIG_LLC=y
> # CONFIG_LLC2 is not set
> CONFIG_ATALK=y
> CONFIG_DEV_APPLETALK=y
> CONFIG_IPDDP=y
> # CONFIG_IPDDP_ENCAP is not set
> # CONFIG_X25 is not set
> CONFIG_LAPB=y
> CONFIG_PHONET=y
> # CONFIG_6LOWPAN is not set
> # CONFIG_IEEE802154 is not set
> CONFIG_NET_SCHED=y
> 
> #
> # Queueing/Scheduling
> #
> CONFIG_NET_SCH_CBQ=y
> CONFIG_NET_SCH_HTB=y
> # CONFIG_NET_SCH_HFSC is not set
> CONFIG_NET_SCH_ATM=y
> CONFIG_NET_SCH_PRIO=y
> CONFIG_NET_SCH_MULTIQ=y
> # CONFIG_NET_SCH_RED is not set
> CONFIG_NET_SCH_SFB=y
> CONFIG_NET_SCH_SFQ=y
> CONFIG_NET_SCH_TEQL=y
> # CONFIG_NET_SCH_TBF is not set
> CONFIG_NET_SCH_CBS=y
> CONFIG_NET_SCH_ETF=y
> CONFIG_NET_SCH_TAPRIO=y
> CONFIG_NET_SCH_GRED=y
> # CONFIG_NET_SCH_DSMARK is not set
> # CONFIG_NET_SCH_NETEM is not set
> # CONFIG_NET_SCH_DRR is not set
> CONFIG_NET_SCH_MQPRIO=y
> CONFIG_NET_SCH_SKBPRIO=y
> CONFIG_NET_SCH_CHOKE=y
> CONFIG_NET_SCH_QFQ=y
> CONFIG_NET_SCH_CODEL=y
> CONFIG_NET_SCH_FQ_CODEL=y
> CONFIG_NET_SCH_CAKE=y
> CONFIG_NET_SCH_FQ=y
> CONFIG_NET_SCH_HHF=y
> CONFIG_NET_SCH_PIE=y
> # CONFIG_NET_SCH_FQ_PIE is not set
> # CONFIG_NET_SCH_INGRESS is not set
> CONFIG_NET_SCH_PLUG=y
> # CONFIG_NET_SCH_ETS is not set
> # CONFIG_NET_SCH_DEFAULT is not set
> 
> #
> # Classification
> #
> CONFIG_NET_CLS=y
> # CONFIG_NET_CLS_BASIC is not set
> # CONFIG_NET_CLS_TCINDEX is not set
> CONFIG_NET_CLS_ROUTE4=y
> CONFIG_NET_CLS_FW=y
> # CONFIG_NET_CLS_U32 is not set
> CONFIG_NET_CLS_RSVP=y
> CONFIG_NET_CLS_RSVP6=y
> CONFIG_NET_CLS_FLOW=y
> CONFIG_NET_CLS_CGROUP=y
> CONFIG_NET_CLS_BPF=y
> CONFIG_NET_CLS_FLOWER=y
> # CONFIG_NET_CLS_MATCHALL is not set
> CONFIG_NET_EMATCH=y
> CONFIG_NET_EMATCH_STACK=32
> CONFIG_NET_EMATCH_CMP=y
> CONFIG_NET_EMATCH_NBYTE=y
> CONFIG_NET_EMATCH_U32=y
> CONFIG_NET_EMATCH_META=y
> CONFIG_NET_EMATCH_TEXT=y
> CONFIG_NET_EMATCH_CANID=y
> CONFIG_NET_EMATCH_IPT=y
> CONFIG_NET_CLS_ACT=y
> CONFIG_NET_ACT_POLICE=y
> # CONFIG_NET_ACT_GACT is not set
> CONFIG_NET_ACT_MIRRED=y
> CONFIG_NET_ACT_SAMPLE=y
> CONFIG_NET_ACT_IPT=y
> # CONFIG_NET_ACT_NAT is not set
> CONFIG_NET_ACT_PEDIT=y
> # CONFIG_NET_ACT_SIMP is not set
> # CONFIG_NET_ACT_SKBEDIT is not set
> CONFIG_NET_ACT_CSUM=y
> CONFIG_NET_ACT_MPLS=y
> # CONFIG_NET_ACT_VLAN is not set
> CONFIG_NET_ACT_BPF=y
> CONFIG_NET_ACT_SKBMOD=y
> CONFIG_NET_ACT_IFE=y
> CONFIG_NET_ACT_TUNNEL_KEY=y
> # CONFIG_NET_ACT_GATE is not set
> CONFIG_NET_IFE_SKBMARK=y
> CONFIG_NET_IFE_SKBPRIO=y
> CONFIG_NET_IFE_SKBTCINDEX=y
> # CONFIG_NET_TC_SKB_EXT is not set
> CONFIG_NET_SCH_FIFO=y
> # CONFIG_DCB is not set
> CONFIG_DNS_RESOLVER=y
> CONFIG_BATMAN_ADV=y
> # CONFIG_BATMAN_ADV_BATMAN_V is not set
> CONFIG_BATMAN_ADV_BLA=y
> CONFIG_BATMAN_ADV_DAT=y
> CONFIG_BATMAN_ADV_NC=y
> CONFIG_BATMAN_ADV_MCAST=y
> # CONFIG_BATMAN_ADV_DEBUG is not set
> # CONFIG_BATMAN_ADV_TRACING is not set
> CONFIG_OPENVSWITCH=y
> CONFIG_VSOCKETS=y
> # CONFIG_VSOCKETS_DIAG is not set
> CONFIG_VSOCKETS_LOOPBACK=y
> # CONFIG_VIRTIO_VSOCKETS is not set
> CONFIG_VIRTIO_VSOCKETS_COMMON=y
> CONFIG_NETLINK_DIAG=y
> CONFIG_MPLS=y
> CONFIG_NET_MPLS_GSO=y
> CONFIG_MPLS_ROUTING=y
> CONFIG_MPLS_IPTUNNEL=y
> CONFIG_NET_NSH=y
> # CONFIG_HSR is not set
> # CONFIG_NET_SWITCHDEV is not set
> # CONFIG_NET_L3_MASTER_DEV is not set
> CONFIG_QRTR=y
> # CONFIG_QRTR_SMD is not set
> CONFIG_QRTR_TUN=y
> # CONFIG_QRTR_MHI is not set
> CONFIG_NET_NCSI=y
> # CONFIG_NCSI_OEM_CMD_GET_MAC is not set
> CONFIG_NCSI_OEM_CMD_KEEP_PHY=y
> CONFIG_SOCK_RX_QUEUE_MAPPING=y
> # CONFIG_CGROUP_NET_PRIO is not set
> CONFIG_CGROUP_NET_CLASSID=y
> CONFIG_NET_RX_BUSY_POLL=y
> CONFIG_BQL=y
> 
> #
> # Network testing
> #
> CONFIG_NET_PKTGEN=y
> # CONFIG_NET_DROP_MONITOR is not set
> # end of Network testing
> # end of Networking options
> 
> CONFIG_HAMRADIO=y
> 
> #
> # Packet Radio protocols
> #
> CONFIG_AX25=y
> # CONFIG_AX25_DAMA_SLAVE is not set
> # CONFIG_NETROM is not set
> CONFIG_ROSE=y
> 
> #
> # AX.25 network device drivers
> #
> CONFIG_BPQETHER=y
> CONFIG_BAYCOM_SER_FDX=y
> CONFIG_BAYCOM_SER_HDX=y
> CONFIG_BAYCOM_PAR=y
> CONFIG_BAYCOM_EPP=y
> CONFIG_YAM=y
> # end of AX.25 network device drivers
> 
> CONFIG_CAN=y
> # CONFIG_CAN_RAW is not set
> CONFIG_CAN_BCM=y
> CONFIG_CAN_GW=y
> CONFIG_CAN_J1939=y
> CONFIG_CAN_ISOTP=y
> # CONFIG_BT is not set
> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> CONFIG_STREAM_PARSER=y
> # CONFIG_MCTP is not set
> CONFIG_FIB_RULES=y
> # CONFIG_WIRELESS is not set
> CONFIG_RFKILL=y
> # CONFIG_RFKILL_GPIO is not set
> # CONFIG_NET_9P is not set
> CONFIG_CAIF=y
> # CONFIG_CAIF_DEBUG is not set
> CONFIG_CAIF_NETDEV=y
> CONFIG_CAIF_USB=y
> CONFIG_CEPH_LIB=y
> # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> # CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
> # CONFIG_NFC is not set
> CONFIG_PSAMPLE=y
> CONFIG_NET_IFE=y
> CONFIG_LWTUNNEL=y
> # CONFIG_LWTUNNEL_BPF is not set
> CONFIG_DST_CACHE=y
> CONFIG_GRO_CELLS=y
> CONFIG_SOCK_VALIDATE_XMIT=y
> CONFIG_NET_SOCK_MSG=y
> CONFIG_PAGE_POOL=y
> # CONFIG_PAGE_POOL_STATS is not set
> CONFIG_FAILOVER=y
> CONFIG_ETHTOOL_NETLINK=y
> CONFIG_NETDEV_ADDR_LIST_TEST=y
> 
> #
> # Device Drivers
> #
> CONFIG_PCCARD=y
> CONFIG_PCMCIA=y
> CONFIG_PCMCIA_LOAD_CIS=y
> 
> #
> # PC-card bridges
> #
> 
> #
> # Generic Driver Options
> #
> CONFIG_AUXILIARY_BUS=y
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=y
> CONFIG_DEVTMPFS_MOUNT=y
> CONFIG_DEVTMPFS_SAFE=y
> # CONFIG_STANDALONE is not set
> CONFIG_PREVENT_FIRMWARE_BUILD=y
> 
> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=y
> CONFIG_FW_LOADER_PAGED_BUF=y
> CONFIG_FW_LOADER_SYSFS=y
> CONFIG_EXTRA_FIRMWARE=""
> CONFIG_FW_LOADER_USER_HELPER=y
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
> CONFIG_FW_LOADER_COMPRESS=y
> CONFIG_FW_LOADER_COMPRESS_XZ=y
> # CONFIG_FW_LOADER_COMPRESS_ZSTD is not set
> CONFIG_FW_UPLOAD=y
> # end of Firmware loader
> 
> CONFIG_WANT_DEV_COREDUMP=y
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=y
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> CONFIG_PM_QOS_KUNIT_TEST=y
> CONFIG_DRIVER_PE_KUNIT_TEST=y
> CONFIG_REGMAP=y
> CONFIG_REGMAP_I2C=y
> CONFIG_REGMAP_SPMI=y
> CONFIG_REGMAP_W1=y
> CONFIG_REGMAP_MMIO=y
> CONFIG_REGMAP_IRQ=y
> CONFIG_REGMAP_I3C=y
> CONFIG_DMA_SHARED_BUFFER=y
> # CONFIG_DMA_FENCE_TRACE is not set
> # end of Generic Driver Options
> 
> #
> # Bus devices
> #
> # CONFIG_ARM_INTEGRATOR_LM is not set
> # CONFIG_BT1_APB is not set
> # CONFIG_BT1_AXI is not set
> # CONFIG_HISILICON_LPC is not set
> # CONFIG_INTEL_IXP4XX_EB is not set
> # CONFIG_QCOM_EBI2 is not set
> CONFIG_MHI_BUS=y
> CONFIG_MHI_BUS_DEBUG=y
> CONFIG_MHI_BUS_EP=y
> # end of Bus devices
> 
> CONFIG_CONNECTOR=y
> CONFIG_PROC_EVENTS=y
> 
> #
> # Firmware Drivers
> #
> 
> #
> # ARM System Control and Management Interface Protocol
> #
> # CONFIG_ARM_SCMI_PROTOCOL is not set
> CONFIG_ARM_SCMI_POWER_DOMAIN=y
> # CONFIG_ARM_SCMI_POWER_CONTROL is not set
> # end of ARM System Control and Management Interface Protocol
> 
> # CONFIG_ARM_SCPI_PROTOCOL is not set
> CONFIG_ARM_SCPI_POWER_DOMAIN=y
> # CONFIG_FIRMWARE_MEMMAP is not set
> # CONFIG_TURRIS_MOX_RWTM is not set
> # CONFIG_BCM47XX_NVRAM is not set
> CONFIG_GOOGLE_FIRMWARE=y
> CONFIG_GOOGLE_CBMEM=y
> CONFIG_GOOGLE_COREBOOT_TABLE=y
> CONFIG_GOOGLE_MEMCONSOLE=y
> CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=y
> CONFIG_GOOGLE_VPD=y
> 
> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> 
> # CONFIG_GNSS is not set
> CONFIG_MTD=y
> 
> #
> # Partition parsers
> #
> # CONFIG_MTD_AR7_PARTS is not set
> # CONFIG_MTD_BCM63XX_PARTS is not set
> # CONFIG_MTD_BRCM_U_BOOT is not set
> CONFIG_MTD_CMDLINE_PARTS=y
> # CONFIG_MTD_OF_PARTS is not set
> # CONFIG_MTD_PARSER_IMAGETAG is not set
> # CONFIG_MTD_PARSER_TPLINK_SAFELOADER is not set
> # CONFIG_MTD_PARSER_TRX is not set
> # CONFIG_MTD_SHARPSL_PARTS is not set
> # CONFIG_MTD_REDBOOT_PARTS is not set
> # end of Partition parsers
> 
> #
> # User Modules And Translation Layers
> #
> # CONFIG_MTD_OOPS is not set
> # CONFIG_MTD_PARTITIONED_MASTER is not set
> 
> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=y
> # CONFIG_MTD_JEDECPROBE is not set
> CONFIG_MTD_GEN_PROBE=y
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=y
> CONFIG_MTD_MAP_BANK_WIDTH_2=y
> CONFIG_MTD_MAP_BANK_WIDTH_4=y
> CONFIG_MTD_CFI_I1=y
> CONFIG_MTD_CFI_I2=y
> CONFIG_MTD_CFI_INTELEXT=y
> CONFIG_MTD_CFI_AMDSTD=y
> # CONFIG_MTD_CFI_STAA is not set
> CONFIG_MTD_CFI_UTIL=y
> # CONFIG_MTD_RAM is not set
> # CONFIG_MTD_ROM is not set
> CONFIG_MTD_ABSENT=y
> # end of RAM/ROM/Flash chip drivers
> 
> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=y
> # CONFIG_MTD_PHYSMAP is not set
> # CONFIG_MTD_SC520CDP is not set
> # CONFIG_MTD_NETSC520 is not set
> # CONFIG_MTD_TS5500 is not set
> CONFIG_MTD_PCMCIA=y
> CONFIG_MTD_PCMCIA_ANONYMOUS=y
> # CONFIG_MTD_PLATRAM is not set
> # end of Mapping drivers for chip access
> 
> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_SPEAR_SMI=y
> # CONFIG_MTD_SLRAM is not set
> CONFIG_MTD_PHRAM=y
> CONFIG_MTD_MTDRAM=y
> CONFIG_MTDRAM_TOTAL_SIZE=4096
> CONFIG_MTDRAM_ERASE_SIZE=128
> 
> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=y
> CONFIG_BCH_CONST_M=14
> CONFIG_BCH_CONST_T=4
> # end of Self-contained MTD device drivers
> 
> #
> # NAND
> #
> CONFIG_MTD_NAND_CORE=y
> CONFIG_MTD_ONENAND=y
> # CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> CONFIG_MTD_ONENAND_GENERIC=y
> # CONFIG_MTD_ONENAND_SAMSUNG is not set
> # CONFIG_MTD_ONENAND_OTP is not set
> CONFIG_MTD_ONENAND_2X_PROGRAM=y
> CONFIG_MTD_RAW_NAND=y
> 
> #
> # Raw/parallel NAND flash controllers
> #
> CONFIG_MTD_NAND_DENALI=y
> CONFIG_MTD_NAND_DENALI_DT=y
> CONFIG_MTD_NAND_AMS_DELTA=y
> # CONFIG_MTD_NAND_SHARPSL is not set
> # CONFIG_MTD_NAND_ATMEL is not set
> # CONFIG_MTD_NAND_MARVELL is not set
> # CONFIG_MTD_NAND_SLC_LPC32XX is not set
> # CONFIG_MTD_NAND_MLC_LPC32XX is not set
> # CONFIG_MTD_NAND_BRCMNAND is not set
> # CONFIG_MTD_NAND_OXNAS is not set
> # CONFIG_MTD_NAND_FSL_IFC is not set
> # CONFIG_MTD_NAND_VF610_NFC is not set
> # CONFIG_MTD_NAND_MXC is not set
> # CONFIG_MTD_NAND_SH_FLCTL is not set
> # CONFIG_MTD_NAND_DAVINCI is not set
> # CONFIG_MTD_NAND_TXX9NDFMC is not set
> # CONFIG_MTD_NAND_FSMC is not set
> # CONFIG_MTD_NAND_SUNXI is not set
> # CONFIG_MTD_NAND_HISI504 is not set
> # CONFIG_MTD_NAND_QCOM is not set
> CONFIG_MTD_NAND_MXIC=y
> # CONFIG_MTD_NAND_TEGRA is not set
> # CONFIG_MTD_NAND_STM32_FMC2 is not set
> # CONFIG_MTD_NAND_MESON is not set
> CONFIG_MTD_NAND_GPIO=y
> CONFIG_MTD_NAND_PLATFORM=y
> # CONFIG_MTD_NAND_CADENCE is not set
> # CONFIG_MTD_NAND_ARASAN is not set
> # CONFIG_MTD_NAND_INTEL_LGM is not set
> # CONFIG_MTD_NAND_RENESAS is not set
> 
> #
> # Misc
> #
> CONFIG_MTD_NAND_NANDSIM=y
> CONFIG_MTD_NAND_DISKONCHIP=y
> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
> 
> #
> # ECC engine support
> #
> CONFIG_MTD_NAND_ECC=y
> # CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
> CONFIG_MTD_NAND_ECC_SW_BCH=y
> CONFIG_MTD_NAND_ECC_MXIC=y
> # CONFIG_MTD_NAND_ECC_MEDIATEK is not set
> # end of ECC engine support
> # end of NAND
> 
> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=y
> CONFIG_MTD_QINFO_PROBE=y
> # end of LPDDR & LPDDR2 PCM memory drivers
> 
> CONFIG_MTD_UBI=y
> CONFIG_MTD_UBI_WL_THRESHOLD=4096
> CONFIG_MTD_UBI_BEB_LIMIT=20
> CONFIG_MTD_UBI_FASTMAP=y
> CONFIG_MTD_UBI_GLUEBI=y
> CONFIG_MTD_HYPERBUS=y
> # CONFIG_HBMC_AM654 is not set
> CONFIG_DTC=y
> CONFIG_OF=y
> # CONFIG_OF_UNITTEST is not set
> # CONFIG_OF_ALL_DTBS is not set
> CONFIG_OF_FLATTREE=y
> CONFIG_OF_EARLY_FLATTREE=y
> CONFIG_OF_KOBJ=y
> CONFIG_OF_DYNAMIC=y
> CONFIG_OF_ADDRESS=y
> CONFIG_OF_IRQ=y
> CONFIG_OF_RESERVED_MEM=y
> CONFIG_OF_RESOLVE=y
> CONFIG_OF_OVERLAY=y
> CONFIG_PARPORT=y
> CONFIG_PARPORT_AX88796=y
> CONFIG_PARPORT_1284=y
> CONFIG_PARPORT_NOT_PC=y
> 
> #
> # NVME Support
> #
> # end of NVME Support
> 
> #
> # Misc devices
> #
> CONFIG_AD525X_DPOT=y
> CONFIG_AD525X_DPOT_I2C=y
> CONFIG_DUMMY_IRQ=y
> CONFIG_ICS932S401=y
> # CONFIG_ATMEL_SSC is not set
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_SMPRO_ERRMON is not set
> # CONFIG_SMPRO_MISC is not set
> CONFIG_HI6421V600_IRQ=y
> # CONFIG_QCOM_COINCELL is not set
> # CONFIG_QCOM_FASTRPC is not set
> # CONFIG_APDS9802ALS is not set
> # CONFIG_ISL29003 is not set
> CONFIG_ISL29020=y
> CONFIG_SENSORS_TSL2550=y
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=y
> # CONFIG_HMC6352 is not set
> CONFIG_DS1682=y
> CONFIG_SRAM=y
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=y
> CONFIG_HISI_HIKEY_USB=y
> # CONFIG_OPEN_DICE is not set
> CONFIG_VCPU_STALL_DETECTOR=y
> CONFIG_C2PORT=y
> 
> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> CONFIG_EEPROM_LEGACY=y
> CONFIG_EEPROM_MAX6875=y
> CONFIG_EEPROM_93CX6=y
> # CONFIG_EEPROM_IDT_89HPESX is not set
> CONFIG_EEPROM_EE1004=y
> # end of EEPROM support
> 
> #
> # Texas Instruments shared transport line discipline
> #
> # end of Texas Instruments shared transport line discipline
> 
> CONFIG_ALTERA_STAPL=y
> CONFIG_ECHO=y
> CONFIG_MISC_RTSX_USB=y
> CONFIG_PVPANIC=y
> # CONFIG_PVPANIC_MMIO is not set
> # end of Misc devices
> 
> #
> # SCSI device support
> #
> # end of SCSI device support
> 
> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> # end of IEEE 1394 (FireWire) support
> 
> # CONFIG_NETDEVICES is not set
> 
> #
> # Input device support
> #
> # CONFIG_INPUT is not set
> 
> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=y
> # CONFIG_SERIO_PARKBD is not set
> CONFIG_SERIO_LIBPS2=y
> # CONFIG_SERIO_RAW is not set
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=y
> # CONFIG_SERIO_ARC_PS2 is not set
> CONFIG_SERIO_APBPS2=y
> # CONFIG_SERIO_OLPC_APSP is not set
> # CONFIG_SERIO_SUN4I_PS2 is not set
> CONFIG_SERIO_GPIO_PS2=y
> CONFIG_USERIO=y
> # CONFIG_GAMEPORT is not set
> # end of Hardware I/O ports
> # end of Input device support
> 
> #
> # Character devices
> #
> # CONFIG_TTY is not set
> CONFIG_SERIAL_DEV_BUS=y
> CONFIG_PRINTER=y
> CONFIG_LP_CONSOLE=y
> CONFIG_PPDEV=y
> CONFIG_IPMI_HANDLER=y
> CONFIG_IPMI_PLAT_DATA=y
> CONFIG_IPMI_PANIC_EVENT=y
> # CONFIG_IPMI_PANIC_STRING is not set
> CONFIG_IPMI_DEVICE_INTERFACE=y
> CONFIG_IPMI_SI=y
> CONFIG_IPMI_SSIF=y
> CONFIG_IPMI_IPMB=y
> CONFIG_IPMI_WATCHDOG=y
> CONFIG_IPMI_POWEROFF=y
> # CONFIG_ASPEED_KCS_IPMI_BMC is not set
> # CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
> # CONFIG_ASPEED_BT_IPMI_BMC is not set
> # CONFIG_SSIF_IPMI_BMC is not set
> CONFIG_IPMB_DEVICE_INTERFACE=y
> CONFIG_HW_RANDOM=y
> CONFIG_HW_RANDOM_TIMERIOMEM=y
> CONFIG_HW_RANDOM_ATMEL=y
> CONFIG_HW_RANDOM_BA431=y
> CONFIG_HW_RANDOM_BCM2835=y
> CONFIG_HW_RANDOM_IPROC_RNG200=y
> CONFIG_HW_RANDOM_IXP4XX=y
> CONFIG_HW_RANDOM_OMAP=y
> CONFIG_HW_RANDOM_OMAP3_ROM=y
> CONFIG_HW_RANDOM_VIRTIO=y
> CONFIG_HW_RANDOM_IMX_RNGC=y
> CONFIG_HW_RANDOM_NOMADIK=y
> CONFIG_HW_RANDOM_STM32=y
> CONFIG_HW_RANDOM_MESON=y
> CONFIG_HW_RANDOM_MTK=y
> CONFIG_HW_RANDOM_EXYNOS=y
> CONFIG_HW_RANDOM_NPCM=y
> CONFIG_HW_RANDOM_KEYSTONE=y
> # CONFIG_HW_RANDOM_CCTRNG is not set
> CONFIG_HW_RANDOM_XIPHERA=y
> 
> #
> # PCMCIA character devices
> #
> CONFIG_CARDMAN_4000=y
> # CONFIG_CARDMAN_4040 is not set
> CONFIG_SCR24X=y
> # end of PCMCIA character devices
> 
> CONFIG_DEVMEM=y
> CONFIG_TCG_TPM=y
> CONFIG_HW_RANDOM_TPM=y
> CONFIG_TCG_TIS_CORE=y
> CONFIG_TCG_TIS=y
> # CONFIG_TCG_TIS_I2C is not set
> # CONFIG_TCG_TIS_SYNQUACER is not set
> CONFIG_TCG_TIS_I2C_CR50=y
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=y
> CONFIG_TCG_TIS_I2C_NUVOTON=y
> CONFIG_TCG_VTPM_PROXY=y
> CONFIG_TCG_TIS_ST33ZP24=y
> CONFIG_TCG_TIS_ST33ZP24_I2C=y
> CONFIG_XILLYBUS_CLASS=y
> CONFIG_XILLYBUS=y
> CONFIG_XILLYBUS_OF=y
> CONFIG_XILLYUSB=y
> # end of Character devices
> 
> #
> # I2C support
> #
> CONFIG_I2C=y
> CONFIG_I2C_BOARDINFO=y
> CONFIG_I2C_COMPAT=y
> CONFIG_I2C_CHARDEV=y
> CONFIG_I2C_MUX=y
> 
> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_ARB_GPIO_CHALLENGE=y
> CONFIG_I2C_MUX_GPIO=y
> # CONFIG_I2C_MUX_GPMUX is not set
> CONFIG_I2C_MUX_LTC4306=y
> CONFIG_I2C_MUX_PCA9541=y
> CONFIG_I2C_MUX_PCA954x=y
> CONFIG_I2C_MUX_PINCTRL=y
> CONFIG_I2C_MUX_REG=y
> CONFIG_I2C_DEMUX_PINCTRL=y
> # CONFIG_I2C_MUX_MLXCPLD is not set
> # end of Multiplexer I2C Chip support
> 
> CONFIG_I2C_HELPER_AUTO=y
> CONFIG_I2C_SMBUS=y
> CONFIG_I2C_ALGOBIT=y
> 
> #
> # I2C Hardware Bus support
> #
> # CONFIG_I2C_HIX5HD2 is not set
> 
> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_ALTERA is not set
> # CONFIG_I2C_ASPEED is not set
> # CONFIG_I2C_AT91 is not set
> # CONFIG_I2C_AXXIA is not set
> # CONFIG_I2C_BCM2835 is not set
> # CONFIG_I2C_BCM_IPROC is not set
> # CONFIG_I2C_BCM_KONA is not set
> CONFIG_I2C_BRCMSTB=y
> # CONFIG_I2C_CADENCE is not set
> # CONFIG_I2C_CBUS_GPIO is not set
> # CONFIG_I2C_DAVINCI is not set
> CONFIG_I2C_DESIGNWARE_CORE=y
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> CONFIG_I2C_DESIGNWARE_PLATFORM=y
> # CONFIG_I2C_DIGICOLOR is not set
> CONFIG_I2C_EMEV2=y
> # CONFIG_I2C_EXYNOS5 is not set
> # CONFIG_I2C_GPIO is not set
> # CONFIG_I2C_HIGHLANDER is not set
> # CONFIG_I2C_HISI is not set
> # CONFIG_I2C_IMG is not set
> # CONFIG_I2C_IMX is not set
> # CONFIG_I2C_IMX_LPI2C is not set
> # CONFIG_I2C_IOP3XX is not set
> # CONFIG_I2C_JZ4780 is not set
> # CONFIG_I2C_KEMPLD is not set
> # CONFIG_I2C_LPC2K is not set
> # CONFIG_I2C_MESON is not set
> # CONFIG_I2C_MICROCHIP_CORE is not set
> # CONFIG_I2C_MT65XX is not set
> # CONFIG_I2C_MT7621 is not set
> # CONFIG_I2C_MV64XXX is not set
> # CONFIG_I2C_MXS is not set
> # CONFIG_I2C_NPCM is not set
> CONFIG_I2C_OCORES=y
> # CONFIG_I2C_OMAP is not set
> # CONFIG_I2C_OWL is not set
> # CONFIG_I2C_APPLE is not set
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_PNX is not set
> # CONFIG_I2C_PXA is not set
> # CONFIG_I2C_QCOM_CCI is not set
> # CONFIG_I2C_QUP is not set
> # CONFIG_I2C_RIIC is not set
> CONFIG_I2C_RK3X=y
> # CONFIG_I2C_RZV2M is not set
> # CONFIG_I2C_S3C2410 is not set
> # CONFIG_I2C_SH_MOBILE is not set
> # CONFIG_I2C_SIMTEC is not set
> # CONFIG_I2C_SPRD is not set
> # CONFIG_I2C_ST is not set
> # CONFIG_I2C_STM32F4 is not set
> # CONFIG_I2C_STM32F7 is not set
> # CONFIG_I2C_SUN6I_P2WI is not set
> # CONFIG_I2C_SYNQUACER is not set
> # CONFIG_I2C_TEGRA is not set
> # CONFIG_I2C_TEGRA_BPMP is not set
> # CONFIG_I2C_UNIPHIER is not set
> # CONFIG_I2C_UNIPHIER_F is not set
> # CONFIG_I2C_VERSATILE is not set
> # CONFIG_I2C_WMT is not set
> CONFIG_I2C_XILINX=y
> # CONFIG_I2C_XLP9XX is not set
> # CONFIG_I2C_RCAR is not set
> 
> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=y
> CONFIG_I2C_DLN2=y
> CONFIG_I2C_CP2615=y
> CONFIG_I2C_PARPORT=y
> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> CONFIG_I2C_TINY_USB=y
> 
> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_MLXCPLD is not set
> # CONFIG_I2C_VIRTIO is not set
> # end of I2C Hardware Bus support
> 
> CONFIG_I2C_SLAVE=y
> CONFIG_I2C_SLAVE_EEPROM=y
> CONFIG_I2C_SLAVE_TESTUNIT=y
> CONFIG_I2C_DEBUG_CORE=y
> CONFIG_I2C_DEBUG_ALGO=y
> CONFIG_I2C_DEBUG_BUS=y
> # end of I2C support
> 
> CONFIG_I3C=y
> # CONFIG_CDNS_I3C_MASTER is not set
> CONFIG_DW_I3C_MASTER=y
> CONFIG_SVC_I3C_MASTER=y
> CONFIG_MIPI_I3C_HCI=y
> # CONFIG_SPI is not set
> CONFIG_SPMI=y
> CONFIG_SPMI_HISI3670=y
> # CONFIG_SPMI_MSM_PMIC_ARB is not set
> # CONFIG_SPMI_MTK_PMIF is not set
> CONFIG_HSI=y
> CONFIG_HSI_BOARDINFO=y
> 
> #
> # HSI controllers
> #
> 
> #
> # HSI clients
> #
> CONFIG_HSI_CHAR=y
> CONFIG_PPS=y
> # CONFIG_PPS_DEBUG is not set
> CONFIG_NTP_PPS=y
> 
> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=y
> CONFIG_PPS_CLIENT_PARPORT=y
> # CONFIG_PPS_CLIENT_GPIO is not set
> 
> #
> # PPS generators support
> #
> 
> #
> # PTP clock support
> #
> # CONFIG_PTP_1588_CLOCK is not set
> CONFIG_PTP_1588_CLOCK_OPTIONAL=y
> 
> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # end of PTP clock support
> 
> CONFIG_PINCTRL=y
> CONFIG_GENERIC_PINCTRL_GROUPS=y
> CONFIG_PINMUX=y
> CONFIG_GENERIC_PINMUX_FUNCTIONS=y
> CONFIG_PINCONF=y
> CONFIG_GENERIC_PINCONF=y
> # CONFIG_DEBUG_PINCTRL is not set
> # CONFIG_PINCTRL_AMD is not set
> # CONFIG_PINCTRL_AS3722 is not set
> # CONFIG_PINCTRL_AT91PIO4 is not set
> # CONFIG_PINCTRL_AXP209 is not set
> # CONFIG_PINCTRL_BM1880 is not set
> CONFIG_PINCTRL_CY8C95X0=y
> # CONFIG_PINCTRL_DA850_PUPD is not set
> # CONFIG_PINCTRL_DA9062 is not set
> # CONFIG_PINCTRL_EQUILIBRIUM is not set
> # CONFIG_PINCTRL_INGENIC is not set
> # CONFIG_PINCTRL_LOONGSON2 is not set
> # CONFIG_PINCTRL_LPC18XX is not set
> CONFIG_PINCTRL_MAX77620=y
> # CONFIG_PINCTRL_MCP23S08 is not set
> # CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
> # CONFIG_PINCTRL_OCELOT is not set
> # CONFIG_PINCTRL_PISTACHIO is not set
> CONFIG_PINCTRL_RK805=y
> # CONFIG_PINCTRL_ROCKCHIP is not set
> CONFIG_PINCTRL_SINGLE=y
> # CONFIG_PINCTRL_STMFX is not set
> # CONFIG_PINCTRL_SX150X is not set
> CONFIG_PINCTRL_TB10X=y
> # CONFIG_PINCTRL_OWL is not set
> # CONFIG_PINCTRL_ASPEED_G4 is not set
> # CONFIG_PINCTRL_ASPEED_G5 is not set
> # CONFIG_PINCTRL_ASPEED_G6 is not set
> # CONFIG_PINCTRL_BCM281XX is not set
> # CONFIG_PINCTRL_BCM2835 is not set
> # CONFIG_PINCTRL_BCM4908 is not set
> # CONFIG_PINCTRL_BCM6318 is not set
> # CONFIG_PINCTRL_BCM6328 is not set
> # CONFIG_PINCTRL_BCM6358 is not set
> # CONFIG_PINCTRL_BCM6362 is not set
> # CONFIG_PINCTRL_BCM6368 is not set
> # CONFIG_PINCTRL_BCM63268 is not set
> # CONFIG_PINCTRL_IPROC_GPIO is not set
> # CONFIG_PINCTRL_CYGNUS_MUX is not set
> # CONFIG_PINCTRL_NS is not set
> # CONFIG_PINCTRL_NSP_GPIO is not set
> # CONFIG_PINCTRL_NS2_MUX is not set
> # CONFIG_PINCTRL_NSP_MUX is not set
> # CONFIG_PINCTRL_AS370 is not set
> # CONFIG_PINCTRL_BERLIN_BG4CT is not set
> # CONFIG_PINCTRL_LOCHNAGAR is not set
> CONFIG_PINCTRL_MADERA=y
> CONFIG_PINCTRL_CS47L92=y
> 
> #
> # Intel pinctrl drivers
> #
> # end of Intel pinctrl drivers
> 
> #
> # MediaTek pinctrl drivers
> #
> CONFIG_EINT_MTK=y
> CONFIG_PINCTRL_MTK=y
> # CONFIG_PINCTRL_MT2701 is not set
> # CONFIG_PINCTRL_MT7623 is not set
> # CONFIG_PINCTRL_MT7629 is not set
> # CONFIG_PINCTRL_MT8135 is not set
> # CONFIG_PINCTRL_MT8127 is not set
> # CONFIG_PINCTRL_MT2712 is not set
> # CONFIG_PINCTRL_MT6765 is not set
> # CONFIG_PINCTRL_MT6779 is not set
> # CONFIG_PINCTRL_MT6795 is not set
> # CONFIG_PINCTRL_MT6797 is not set
> # CONFIG_PINCTRL_MT7622 is not set
> # CONFIG_PINCTRL_MT7986 is not set
> # CONFIG_PINCTRL_MT8167 is not set
> # CONFIG_PINCTRL_MT8173 is not set
> # CONFIG_PINCTRL_MT8183 is not set
> # CONFIG_PINCTRL_MT8186 is not set
> # CONFIG_PINCTRL_MT8188 is not set
> # CONFIG_PINCTRL_MT8192 is not set
> # CONFIG_PINCTRL_MT8195 is not set
> # CONFIG_PINCTRL_MT8365 is not set
> # CONFIG_PINCTRL_MT8516 is not set
> CONFIG_PINCTRL_MT6397=y
> # end of MediaTek pinctrl drivers
> 
> CONFIG_PINCTRL_MESON=y
> # CONFIG_PINCTRL_WPCM450 is not set
> # CONFIG_PINCTRL_NPCM7XX is not set
> # CONFIG_PINCTRL_PXA25X is not set
> # CONFIG_PINCTRL_PXA27X is not set
> # CONFIG_PINCTRL_MSM is not set
> # CONFIG_PINCTRL_QCOM_SPMI_PMIC is not set
> # CONFIG_PINCTRL_QCOM_SSBI_PMIC is not set
> # CONFIG_PINCTRL_LPASS_LPI is not set
> 
> #
> # Renesas pinctrl drivers
> #
> # CONFIG_PINCTRL_RENESAS is not set
> # CONFIG_PINCTRL_PFC_EMEV2 is not set
> # CONFIG_PINCTRL_PFC_R8A77995 is not set
> # CONFIG_PINCTRL_PFC_R8A7794 is not set
> # CONFIG_PINCTRL_PFC_R8A77990 is not set
> # CONFIG_PINCTRL_PFC_R8A7779 is not set
> # CONFIG_PINCTRL_PFC_R8A7790 is not set
> # CONFIG_PINCTRL_PFC_R8A77950 is not set
> # CONFIG_PINCTRL_PFC_R8A77951 is not set
> # CONFIG_PINCTRL_PFC_R8A7778 is not set
> # CONFIG_PINCTRL_PFC_R8A7793 is not set
> # CONFIG_PINCTRL_PFC_R8A7791 is not set
> # CONFIG_PINCTRL_PFC_R8A77965 is not set
> # CONFIG_PINCTRL_PFC_R8A77960 is not set
> # CONFIG_PINCTRL_PFC_R8A77961 is not set
> # CONFIG_PINCTRL_PFC_R8A779F0 is not set
> # CONFIG_PINCTRL_PFC_R8A7792 is not set
> # CONFIG_PINCTRL_PFC_R8A77980 is not set
> # CONFIG_PINCTRL_PFC_R8A77970 is not set
> # CONFIG_PINCTRL_PFC_R8A779A0 is not set
> # CONFIG_PINCTRL_PFC_R8A779G0 is not set
> # CONFIG_PINCTRL_PFC_R8A7740 is not set
> # CONFIG_PINCTRL_PFC_R8A73A4 is not set
> # CONFIG_PINCTRL_RZA1 is not set
> # CONFIG_PINCTRL_RZA2 is not set
> # CONFIG_PINCTRL_RZG2L is not set
> # CONFIG_PINCTRL_PFC_R8A77470 is not set
> # CONFIG_PINCTRL_PFC_R8A7745 is not set
> # CONFIG_PINCTRL_PFC_R8A7742 is not set
> # CONFIG_PINCTRL_PFC_R8A7743 is not set
> # CONFIG_PINCTRL_PFC_R8A7744 is not set
> # CONFIG_PINCTRL_PFC_R8A774C0 is not set
> # CONFIG_PINCTRL_PFC_R8A774E1 is not set
> # CONFIG_PINCTRL_PFC_R8A774A1 is not set
> # CONFIG_PINCTRL_PFC_R8A774B1 is not set
> # CONFIG_PINCTRL_RZN1 is not set
> # CONFIG_PINCTRL_RZV2M is not set
> # CONFIG_PINCTRL_PFC_SH7203 is not set
> # CONFIG_PINCTRL_PFC_SH7264 is not set
> # CONFIG_PINCTRL_PFC_SH7269 is not set
> # CONFIG_PINCTRL_PFC_SH7720 is not set
> # CONFIG_PINCTRL_PFC_SH7722 is not set
> # CONFIG_PINCTRL_PFC_SH7734 is not set
> # CONFIG_PINCTRL_PFC_SH7757 is not set
> # CONFIG_PINCTRL_PFC_SH7785 is not set
> # CONFIG_PINCTRL_PFC_SH7786 is not set
> # CONFIG_PINCTRL_PFC_SH73A0 is not set
> # CONFIG_PINCTRL_PFC_SH7723 is not set
> # CONFIG_PINCTRL_PFC_SH7724 is not set
> # CONFIG_PINCTRL_PFC_SHX3 is not set
> # end of Renesas pinctrl drivers
> 
> # CONFIG_PINCTRL_EXYNOS is not set
> # CONFIG_PINCTRL_S3C24XX is not set
> # CONFIG_PINCTRL_S3C64XX is not set
> # CONFIG_PINCTRL_SPRD_SC9860 is not set
> # CONFIG_PINCTRL_STARFIVE_JH7100 is not set
> # CONFIG_PINCTRL_STM32F429 is not set
> # CONFIG_PINCTRL_STM32F469 is not set
> # CONFIG_PINCTRL_STM32F746 is not set
> # CONFIG_PINCTRL_STM32F769 is not set
> # CONFIG_PINCTRL_STM32H743 is not set
> # CONFIG_PINCTRL_STM32MP135 is not set
> # CONFIG_PINCTRL_STM32MP157 is not set
> # CONFIG_PINCTRL_TI_IODELAY is not set
> CONFIG_PINCTRL_UNIPHIER=y
> # CONFIG_PINCTRL_UNIPHIER_LD4 is not set
> # CONFIG_PINCTRL_UNIPHIER_PRO4 is not set
> # CONFIG_PINCTRL_UNIPHIER_SLD8 is not set
> # CONFIG_PINCTRL_UNIPHIER_PRO5 is not set
> # CONFIG_PINCTRL_UNIPHIER_PXS2 is not set
> # CONFIG_PINCTRL_UNIPHIER_LD6B is not set
> # CONFIG_PINCTRL_UNIPHIER_LD11 is not set
> # CONFIG_PINCTRL_UNIPHIER_LD20 is not set
> # CONFIG_PINCTRL_UNIPHIER_PXS3 is not set
> # CONFIG_PINCTRL_UNIPHIER_NX1 is not set
> # CONFIG_PINCTRL_TMPV7700 is not set
> CONFIG_GPIOLIB=y
> CONFIG_GPIOLIB_FASTPATH_LIMIT=512
> CONFIG_OF_GPIO=y
> CONFIG_GPIOLIB_IRQCHIP=y
> # CONFIG_DEBUG_GPIO is not set
> # CONFIG_GPIO_SYSFS is not set
> # CONFIG_GPIO_CDEV is not set
> CONFIG_GPIO_GENERIC=y
> CONFIG_GPIO_MAX730X=y
> 
> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_74XX_MMIO is not set
> CONFIG_GPIO_ALTERA=y
> # CONFIG_GPIO_ASPEED is not set
> # CONFIG_GPIO_ASPEED_SGPIO is not set
> # CONFIG_GPIO_ATH79 is not set
> # CONFIG_GPIO_RASPBERRYPI_EXP is not set
> # CONFIG_GPIO_BCM_KONA is not set
> # CONFIG_GPIO_BCM_XGS_IPROC is not set
> # CONFIG_GPIO_BRCMSTB is not set
> CONFIG_GPIO_CADENCE=y
> # CONFIG_GPIO_CLPS711X is not set
> CONFIG_GPIO_DWAPB=y
> # CONFIG_GPIO_EIC_SPRD is not set
> # CONFIG_GPIO_EM is not set
> CONFIG_GPIO_FTGPIO010=y
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> CONFIG_GPIO_GRGPIO=y
> # CONFIG_GPIO_HISI is not set
> CONFIG_GPIO_HLWD=y
> # CONFIG_GPIO_IOP is not set
> # CONFIG_GPIO_LOGICVC is not set
> # CONFIG_GPIO_LPC18XX is not set
> # CONFIG_GPIO_LPC32XX is not set
> CONFIG_GPIO_MB86S7X=y
> CONFIG_GPIO_MENZ127=y
> # CONFIG_GPIO_MPC8XXX is not set
> # CONFIG_GPIO_MT7621 is not set
> # CONFIG_GPIO_MXC is not set
> # CONFIG_GPIO_MXS is not set
> # CONFIG_GPIO_PMIC_EIC_SPRD is not set
> # CONFIG_GPIO_PXA is not set
> # CONFIG_GPIO_RCAR is not set
> # CONFIG_GPIO_RDA is not set
> # CONFIG_GPIO_ROCKCHIP is not set
> # CONFIG_GPIO_SAMA5D2_PIOBU is not set
> # CONFIG_GPIO_SIFIVE is not set
> CONFIG_GPIO_SIOX=y
> CONFIG_GPIO_SNPS_CREG=y
> # CONFIG_GPIO_SPRD is not set
> # CONFIG_GPIO_STP_XWAY is not set
> # CONFIG_GPIO_SYSCON is not set
> CONFIG_GPIO_TB10X=y
> # CONFIG_GPIO_TEGRA is not set
> # CONFIG_GPIO_TEGRA186 is not set
> # CONFIG_GPIO_TS4800 is not set
> # CONFIG_GPIO_UNIPHIER is not set
> # CONFIG_GPIO_VISCONTI is not set
> # CONFIG_GPIO_XGENE_SB is not set
> CONFIG_GPIO_XILINX=y
> # CONFIG_GPIO_XLP is not set
> CONFIG_GPIO_AMD_FCH=y
> # CONFIG_GPIO_IDT3243X is not set
> # end of Memory mapped GPIO drivers
> 
> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADNP=y
> CONFIG_GPIO_GW_PLD=y
> CONFIG_GPIO_MAX7300=y
> CONFIG_GPIO_MAX732X=y
> CONFIG_GPIO_MAX732X_IRQ=y
> CONFIG_GPIO_PCA953X=y
> CONFIG_GPIO_PCA953X_IRQ=y
> CONFIG_GPIO_PCA9570=y
> CONFIG_GPIO_PCF857X=y
> CONFIG_GPIO_TPIC2810=y
> # CONFIG_GPIO_TS4900 is not set
> # end of I2C GPIO expanders
> 
> #
> # MFD GPIO expanders
> #
> # CONFIG_GPIO_BD71815 is not set
> # CONFIG_GPIO_BD71828 is not set
> # CONFIG_GPIO_DA9052 is not set
> CONFIG_GPIO_DA9055=y
> CONFIG_GPIO_DLN2=y
> CONFIG_GPIO_KEMPLD=y
> # CONFIG_GPIO_LP873X is not set
> CONFIG_GPIO_LP87565=y
> CONFIG_GPIO_MADERA=y
> CONFIG_GPIO_MAX77620=y
> CONFIG_GPIO_MAX77650=y
> # CONFIG_GPIO_SL28CPLD is not set
> CONFIG_GPIO_STMPE=y
> # CONFIG_GPIO_TC3589X is not set
> CONFIG_GPIO_TPS65218=y
> CONFIG_GPIO_TPS6586X=y
> CONFIG_GPIO_TWL6040=y
> CONFIG_GPIO_WM831X=y
> # end of MFD GPIO expanders
> 
> #
> # USB GPIO expanders
> #
> # end of USB GPIO expanders
> 
> #
> # Virtual GPIO drivers
> #
> CONFIG_GPIO_AGGREGATOR=y
> CONFIG_GPIO_LATCH=y
> CONFIG_GPIO_MOCKUP=y
> # CONFIG_GPIO_VIRTIO is not set
> CONFIG_GPIO_SIM=y
> # end of Virtual GPIO drivers
> 
> CONFIG_W1=y
> # CONFIG_W1_CON is not set
> 
> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_DS2490=y
> CONFIG_W1_MASTER_DS2482=y
> # CONFIG_W1_MASTER_MXC is not set
> CONFIG_W1_MASTER_DS1WM=y
> CONFIG_W1_MASTER_GPIO=y
> CONFIG_W1_MASTER_SGI=y
> # end of 1-wire Bus Masters
> 
> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=y
> # CONFIG_W1_SLAVE_SMEM is not set
> CONFIG_W1_SLAVE_DS2405=y
> # CONFIG_W1_SLAVE_DS2408 is not set
> CONFIG_W1_SLAVE_DS2413=y
> CONFIG_W1_SLAVE_DS2406=y
> CONFIG_W1_SLAVE_DS2423=y
> # CONFIG_W1_SLAVE_DS2805 is not set
> CONFIG_W1_SLAVE_DS2430=y
> # CONFIG_W1_SLAVE_DS2431 is not set
> CONFIG_W1_SLAVE_DS2433=y
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> CONFIG_W1_SLAVE_DS2438=y
> # CONFIG_W1_SLAVE_DS250X is not set
> CONFIG_W1_SLAVE_DS2780=y
> CONFIG_W1_SLAVE_DS2781=y
> # CONFIG_W1_SLAVE_DS28E04 is not set
> CONFIG_W1_SLAVE_DS28E17=y
> # end of 1-wire Slaves
> 
> CONFIG_POWER_RESET=y
> CONFIG_POWER_RESET_AS3722=y
> CONFIG_POWER_RESET_ATC260X=y
> # CONFIG_POWER_RESET_BRCMKONA is not set
> # CONFIG_POWER_RESET_BRCMSTB is not set
> # CONFIG_POWER_RESET_GEMINI_POWEROFF is not set
> CONFIG_POWER_RESET_GPIO=y
> CONFIG_POWER_RESET_GPIO_RESTART=y
> # CONFIG_POWER_RESET_OCELOT_RESET is not set
> CONFIG_POWER_RESET_LTC2952=y
> CONFIG_POWER_RESET_MT6323=y
> CONFIG_POWER_RESET_REGULATOR=y
> # CONFIG_POWER_RESET_RESTART is not set
> # CONFIG_POWER_RESET_KEYSTONE is not set
> # CONFIG_POWER_RESET_SYSCON is not set
> # CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
> # CONFIG_POWER_RESET_RMOBILE is not set
> CONFIG_REBOOT_MODE=y
> CONFIG_SYSCON_REBOOT_MODE=y
> # CONFIG_POWER_RESET_SC27XX is not set
> # CONFIG_NVMEM_REBOOT_MODE is not set
> CONFIG_POWER_SUPPLY=y
> CONFIG_POWER_SUPPLY_DEBUG=y
> CONFIG_POWER_SUPPLY_HWMON=y
> # CONFIG_PDA_POWER is not set
> CONFIG_GENERIC_ADC_BATTERY=y
> CONFIG_IP5XXX_POWER=y
> CONFIG_MAX8925_POWER=y
> CONFIG_WM831X_BACKUP=y
> CONFIG_WM831X_POWER=y
> CONFIG_TEST_POWER=y
> CONFIG_CHARGER_ADP5061=y
> # CONFIG_BATTERY_ACT8945A is not set
> CONFIG_BATTERY_CW2015=y
> CONFIG_BATTERY_DS2760=y
> CONFIG_BATTERY_DS2780=y
> CONFIG_BATTERY_DS2781=y
> CONFIG_BATTERY_DS2782=y
> # CONFIG_BATTERY_LEGO_EV3 is not set
> CONFIG_BATTERY_SAMSUNG_SDI=y
> CONFIG_BATTERY_SBS=y
> # CONFIG_CHARGER_SBS is not set
> CONFIG_MANAGER_SBS=y
> CONFIG_BATTERY_BQ27XXX=y
> CONFIG_BATTERY_BQ27XXX_I2C=y
> CONFIG_BATTERY_BQ27XXX_HDQ=y
> CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
> CONFIG_BATTERY_DA9030=y
> # CONFIG_BATTERY_DA9052 is not set
> CONFIG_CHARGER_DA9150=y
> # CONFIG_BATTERY_DA9150 is not set
> # CONFIG_CHARGER_AXP20X is not set
> CONFIG_BATTERY_AXP20X=y
> # CONFIG_AXP20X_POWER is not set
> CONFIG_BATTERY_MAX17040=y
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_BATTERY_MAX1721X=y
> # CONFIG_CHARGER_ISP1704 is not set
> CONFIG_CHARGER_MAX8903=y
> CONFIG_CHARGER_LP8727=y
> CONFIG_CHARGER_LP8788=y
> CONFIG_CHARGER_GPIO=y
> # CONFIG_CHARGER_MANAGER is not set
> # CONFIG_CHARGER_LT3651 is not set
> # CONFIG_CHARGER_LTC4162L is not set
> CONFIG_CHARGER_MAX14577=y
> CONFIG_CHARGER_DETECTOR_MAX14656=y
> CONFIG_CHARGER_MAX77650=y
> CONFIG_CHARGER_MAX77693=y
> CONFIG_CHARGER_MAX77976=y
> CONFIG_CHARGER_MP2629=y
> # CONFIG_CHARGER_MT6360 is not set
> CONFIG_CHARGER_MT6370=y
> # CONFIG_CHARGER_QCOM_SMBB is not set
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24190 is not set
> # CONFIG_CHARGER_BQ24257 is not set
> CONFIG_CHARGER_BQ24735=y
> CONFIG_CHARGER_BQ2515X=y
> CONFIG_CHARGER_BQ25890=y
> # CONFIG_CHARGER_BQ25980 is not set
> CONFIG_CHARGER_BQ256XX=y
> CONFIG_CHARGER_RK817=y
> CONFIG_CHARGER_SMB347=y
> CONFIG_CHARGER_TPS65090=y
> CONFIG_BATTERY_GAUGE_LTC2941=y
> CONFIG_BATTERY_GOLDFISH=y
> # CONFIG_BATTERY_RT5033 is not set
> # CONFIG_CHARGER_RT9455 is not set
> # CONFIG_CHARGER_SC2731 is not set
> # CONFIG_FUEL_GAUGE_SC27XX is not set
> # CONFIG_CHARGER_UCS1002 is not set
> # CONFIG_CHARGER_BD99954 is not set
> CONFIG_BATTERY_UG3105=y
> CONFIG_HWMON=y
> CONFIG_HWMON_VID=y
> # CONFIG_HWMON_DEBUG_CHIP is not set
> 
> #
> # Native drivers
> #
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=y
> CONFIG_SENSORS_ADM1025=y
> # CONFIG_SENSORS_ADM1026 is not set
> CONFIG_SENSORS_ADM1029=y
> CONFIG_SENSORS_ADM1031=y
> CONFIG_SENSORS_ADM1177=y
> CONFIG_SENSORS_ADM9240=y
> CONFIG_SENSORS_ADT7X10=y
> CONFIG_SENSORS_ADT7410=y
> # CONFIG_SENSORS_ADT7411 is not set
> CONFIG_SENSORS_ADT7462=y
> CONFIG_SENSORS_ADT7470=y
> CONFIG_SENSORS_ADT7475=y
> CONFIG_SENSORS_AHT10=y
> # CONFIG_SENSORS_AS370 is not set
> CONFIG_SENSORS_ASC7621=y
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> # CONFIG_SENSORS_ASB100 is not set
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=y
> # CONFIG_SENSORS_BT1_PVT is not set
> # CONFIG_SENSORS_DS620 is not set
> # CONFIG_SENSORS_DS1621 is not set
> CONFIG_SENSORS_DA9052_ADC=y
> CONFIG_SENSORS_DA9055=y
> # CONFIG_SENSORS_SPARX5 is not set
> CONFIG_SENSORS_F71805F=y
> CONFIG_SENSORS_F71882FG=y
> # CONFIG_SENSORS_F75375S is not set
> # CONFIG_SENSORS_GSC is not set
> # CONFIG_SENSORS_FSCHMD is not set
> CONFIG_SENSORS_FTSTEUTATES=y
> # CONFIG_SENSORS_GL518SM is not set
> CONFIG_SENSORS_GL520SM=y
> CONFIG_SENSORS_G760A=y
> # CONFIG_SENSORS_G762 is not set
> # CONFIG_SENSORS_GPIO_FAN is not set
> CONFIG_SENSORS_HIH6130=y
> CONFIG_SENSORS_IBMAEM=y
> CONFIG_SENSORS_IBMPEX=y
> # CONFIG_SENSORS_IIO_HWMON is not set
> CONFIG_SENSORS_IT87=y
> CONFIG_SENSORS_JC42=y
> # CONFIG_SENSORS_POWR1220 is not set
> # CONFIG_SENSORS_LAN966X is not set
> # CONFIG_SENSORS_LINEAGE is not set
> CONFIG_SENSORS_LOCHNAGAR=y
> CONFIG_SENSORS_LTC2945=y
> CONFIG_SENSORS_LTC2947=y
> CONFIG_SENSORS_LTC2947_I2C=y
> CONFIG_SENSORS_LTC2990=y
> CONFIG_SENSORS_LTC2992=y
> CONFIG_SENSORS_LTC4151=y
> CONFIG_SENSORS_LTC4215=y
> CONFIG_SENSORS_LTC4222=y
> CONFIG_SENSORS_LTC4245=y
> CONFIG_SENSORS_LTC4260=y
> CONFIG_SENSORS_LTC4261=y
> # CONFIG_SENSORS_MAX127 is not set
> CONFIG_SENSORS_MAX16065=y
> CONFIG_SENSORS_MAX1619=y
> CONFIG_SENSORS_MAX1668=y
> CONFIG_SENSORS_MAX197=y
> # CONFIG_SENSORS_MAX31730 is not set
> # CONFIG_SENSORS_MAX31760 is not set
> CONFIG_SENSORS_MAX6620=y
> CONFIG_SENSORS_MAX6621=y
> CONFIG_SENSORS_MAX6639=y
> # CONFIG_SENSORS_MAX6650 is not set
> CONFIG_SENSORS_MAX6697=y
> # CONFIG_SENSORS_MAX31790 is not set
> # CONFIG_SENSORS_MCP3021 is not set
> CONFIG_SENSORS_TC654=y
> CONFIG_SENSORS_TPS23861=y
> CONFIG_SENSORS_MENF21BMC_HWMON=y
> # CONFIG_SENSORS_MR75203 is not set
> CONFIG_SENSORS_LM63=y
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=y
> CONFIG_SENSORS_LM77=y
> # CONFIG_SENSORS_LM78 is not set
> CONFIG_SENSORS_LM80=y
> # CONFIG_SENSORS_LM83 is not set
> # CONFIG_SENSORS_LM85 is not set
> CONFIG_SENSORS_LM87=y
> CONFIG_SENSORS_LM90=y
> CONFIG_SENSORS_LM92=y
> CONFIG_SENSORS_LM93=y
> CONFIG_SENSORS_LM95234=y
> # CONFIG_SENSORS_LM95241 is not set
> CONFIG_SENSORS_LM95245=y
> # CONFIG_SENSORS_PC87360 is not set
> CONFIG_SENSORS_PC87427=y
> CONFIG_SENSORS_NTC_THERMISTOR=y
> CONFIG_SENSORS_NCT6683=y
> CONFIG_SENSORS_NCT6775_CORE=y
> CONFIG_SENSORS_NCT6775=y
> CONFIG_SENSORS_NCT6775_I2C=y
> CONFIG_SENSORS_NCT7802=y
> CONFIG_SENSORS_NCT7904=y
> CONFIG_SENSORS_NPCM7XX=y
> # CONFIG_SENSORS_NSA320 is not set
> CONFIG_SENSORS_OCC_P8_I2C=y
> CONFIG_SENSORS_OCC=y
> CONFIG_SENSORS_PCF8591=y
> CONFIG_SENSORS_PECI_CPUTEMP=y
> # CONFIG_SENSORS_PECI_DIMMTEMP is not set
> CONFIG_SENSORS_PECI=y
> CONFIG_PMBUS=y
> CONFIG_SENSORS_PMBUS=y
> CONFIG_SENSORS_ADM1266=y
> # CONFIG_SENSORS_ADM1275 is not set
> CONFIG_SENSORS_BEL_PFE=y
> # CONFIG_SENSORS_BPA_RS600 is not set
> CONFIG_SENSORS_DELTA_AHE50DC_FAN=y
> CONFIG_SENSORS_FSP_3Y=y
> CONFIG_SENSORS_IBM_CFFPS=y
> # CONFIG_SENSORS_DPS920AB is not set
> # CONFIG_SENSORS_INSPUR_IPSPS is not set
> CONFIG_SENSORS_IR35221=y
> # CONFIG_SENSORS_IR36021 is not set
> CONFIG_SENSORS_IR38064=y
> # CONFIG_SENSORS_IR38064_REGULATOR is not set
> # CONFIG_SENSORS_IRPS5401 is not set
> # CONFIG_SENSORS_ISL68137 is not set
> CONFIG_SENSORS_LM25066=y
> # CONFIG_SENSORS_LM25066_REGULATOR is not set
> CONFIG_SENSORS_LT7182S=y
> CONFIG_SENSORS_LTC2978=y
> CONFIG_SENSORS_LTC2978_REGULATOR=y
> CONFIG_SENSORS_LTC3815=y
> CONFIG_SENSORS_MAX15301=y
> CONFIG_SENSORS_MAX16064=y
> CONFIG_SENSORS_MAX16601=y
> # CONFIG_SENSORS_MAX20730 is not set
> CONFIG_SENSORS_MAX20751=y
> CONFIG_SENSORS_MAX31785=y
> CONFIG_SENSORS_MAX34440=y
> CONFIG_SENSORS_MAX8688=y
> CONFIG_SENSORS_MP2888=y
> CONFIG_SENSORS_MP2975=y
> # CONFIG_SENSORS_MP5023 is not set
> CONFIG_SENSORS_PIM4328=y
> CONFIG_SENSORS_PLI1209BC=y
> # CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
> CONFIG_SENSORS_PM6764TR=y
> # CONFIG_SENSORS_PXE1610 is not set
> CONFIG_SENSORS_Q54SJ108A2=y
> CONFIG_SENSORS_STPDDC60=y
> CONFIG_SENSORS_TPS40422=y
> # CONFIG_SENSORS_TPS53679 is not set
> CONFIG_SENSORS_TPS546D24=y
> # CONFIG_SENSORS_UCD9000 is not set
> CONFIG_SENSORS_UCD9200=y
> # CONFIG_SENSORS_XDPE152 is not set
> CONFIG_SENSORS_XDPE122=y
> # CONFIG_SENSORS_XDPE122_REGULATOR is not set
> # CONFIG_SENSORS_ZL6100 is not set
> # CONFIG_SENSORS_PWM_FAN is not set
> # CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
> # CONFIG_SENSORS_SL28CPLD is not set
> # CONFIG_SENSORS_SBTSI is not set
> # CONFIG_SENSORS_SBRMI is not set
> # CONFIG_SENSORS_SHT15 is not set
> CONFIG_SENSORS_SHT21=y
> CONFIG_SENSORS_SHT3x=y
> CONFIG_SENSORS_SHT4x=y
> # CONFIG_SENSORS_SHTC1 is not set
> CONFIG_SENSORS_SY7636A=y
> # CONFIG_SENSORS_DME1737 is not set
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=y
> CONFIG_SENSORS_EMC2305=y
> CONFIG_SENSORS_EMC6W201=y
> # CONFIG_SENSORS_SMSC47M1 is not set
> CONFIG_SENSORS_SMSC47M192=y
> CONFIG_SENSORS_SMSC47B397=y
> # CONFIG_SENSORS_SCH5627 is not set
> # CONFIG_SENSORS_SCH5636 is not set
> # CONFIG_SENSORS_STTS751 is not set
> CONFIG_SENSORS_SMM665=y
> CONFIG_SENSORS_ADC128D818=y
> CONFIG_SENSORS_ADS7828=y
> CONFIG_SENSORS_AMC6821=y
> CONFIG_SENSORS_INA209=y
> CONFIG_SENSORS_INA2XX=y
> CONFIG_SENSORS_INA238=y
> CONFIG_SENSORS_INA3221=y
> CONFIG_SENSORS_TC74=y
> CONFIG_SENSORS_THMC50=y
> CONFIG_SENSORS_TMP102=y
> CONFIG_SENSORS_TMP103=y
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=y
> CONFIG_SENSORS_TMP421=y
> # CONFIG_SENSORS_TMP464 is not set
> CONFIG_SENSORS_TMP513=y
> CONFIG_SENSORS_VT1211=y
> # CONFIG_SENSORS_W83773G is not set
> CONFIG_SENSORS_W83781D=y
> # CONFIG_SENSORS_W83791D is not set
> CONFIG_SENSORS_W83792D=y
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=y
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=y
> # CONFIG_SENSORS_W83L786NG is not set
> # CONFIG_SENSORS_W83627HF is not set
> CONFIG_SENSORS_W83627EHF=y
> CONFIG_SENSORS_WM831X=y
> CONFIG_THERMAL=y
> CONFIG_THERMAL_NETLINK=y
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
> CONFIG_THERMAL_HWMON=y
> CONFIG_THERMAL_OF=y
> CONFIG_THERMAL_WRITABLE_TRIPS=y
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=y
> CONFIG_THERMAL_GOV_STEP_WISE=y
> CONFIG_THERMAL_GOV_BANG_BANG=y
> # CONFIG_THERMAL_GOV_USER_SPACE is not set
> # CONFIG_CPU_THERMAL is not set
> CONFIG_DEVFREQ_THERMAL=y
> CONFIG_THERMAL_EMULATION=y
> CONFIG_THERMAL_MMIO=y
> CONFIG_HISI_THERMAL=y
> # CONFIG_IMX_THERMAL is not set
> # CONFIG_IMX8MM_THERMAL is not set
> # CONFIG_K3_THERMAL is not set
> CONFIG_MAX77620_THERMAL=y
> # CONFIG_QORIQ_THERMAL is not set
> # CONFIG_SPEAR_THERMAL is not set
> # CONFIG_ROCKCHIP_THERMAL is not set
> # CONFIG_RCAR_THERMAL is not set
> # CONFIG_RCAR_GEN3_THERMAL is not set
> # CONFIG_RZG2L_THERMAL is not set
> # CONFIG_KIRKWOOD_THERMAL is not set
> # CONFIG_DOVE_THERMAL is not set
> # CONFIG_ARMADA_THERMAL is not set
> # CONFIG_DA9062_THERMAL is not set
> CONFIG_MTK_THERMAL=y
> 
> #
> # Intel thermal drivers
> #
> 
> #
> # ACPI INT340X thermal drivers
> #
> # end of ACPI INT340X thermal drivers
> # end of Intel thermal drivers
> 
> #
> # Broadcom thermal drivers
> #
> # CONFIG_BCM2711_THERMAL is not set
> # CONFIG_BCM2835_THERMAL is not set
> # CONFIG_BRCMSTB_THERMAL is not set
> # CONFIG_BCM_NS_THERMAL is not set
> # CONFIG_BCM_SR_THERMAL is not set
> # end of Broadcom thermal drivers
> 
> #
> # Texas Instruments thermal drivers
> #
> # CONFIG_TI_SOC_THERMAL is not set
> # end of Texas Instruments thermal drivers
> 
> #
> # Samsung thermal drivers
> #
> # CONFIG_EXYNOS_THERMAL is not set
> # end of Samsung thermal drivers
> 
> #
> # NVIDIA Tegra thermal drivers
> #
> # CONFIG_TEGRA_SOCTHERM is not set
> # CONFIG_TEGRA_BPMP_THERMAL is not set
> # CONFIG_TEGRA30_TSENSOR is not set
> # end of NVIDIA Tegra thermal drivers
> 
> CONFIG_GENERIC_ADC_THERMAL=y
> 
> #
> # Qualcomm thermal drivers
> #
> # CONFIG_QCOM_SPMI_ADC_TM5 is not set
> # CONFIG_QCOM_SPMI_TEMP_ALARM is not set
> # end of Qualcomm thermal drivers
> 
> # CONFIG_UNIPHIER_THERMAL is not set
> # CONFIG_SPRD_THERMAL is not set
> CONFIG_WATCHDOG=y
> CONFIG_WATCHDOG_CORE=y
> CONFIG_WATCHDOG_NOWAYOUT=y
> # CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
> CONFIG_WATCHDOG_OPEN_TIMEOUT=0
> # CONFIG_WATCHDOG_SYSFS is not set
> # CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set
> 
> #
> # Watchdog Pretimeout Governors
> #
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> 
> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=y
> CONFIG_DA9052_WATCHDOG=y
> # CONFIG_DA9055_WATCHDOG is not set
> CONFIG_DA9063_WATCHDOG=y
> CONFIG_DA9062_WATCHDOG=y
> # CONFIG_GPIO_WATCHDOG is not set
> CONFIG_MENF21BMC_WATCHDOG=y
> CONFIG_MENZ069_WATCHDOG=y
> # CONFIG_WM831X_WATCHDOG is not set
> # CONFIG_XILINX_WATCHDOG is not set
> CONFIG_ZIIRAVE_WATCHDOG=y
> # CONFIG_RAVE_SP_WATCHDOG is not set
> # CONFIG_SL28CPLD_WATCHDOG is not set
> # CONFIG_ARMADA_37XX_WATCHDOG is not set
> # CONFIG_ASM9260_WATCHDOG is not set
> # CONFIG_AT91RM9200_WATCHDOG is not set
> # CONFIG_AT91SAM9X_WATCHDOG is not set
> # CONFIG_SAMA5D4_WATCHDOG is not set
> CONFIG_CADENCE_WATCHDOG=y
> # CONFIG_FTWDT010_WATCHDOG is not set
> # CONFIG_S3C2410_WATCHDOG is not set
> CONFIG_DW_WATCHDOG=y
> # CONFIG_EP93XX_WATCHDOG is not set
> # CONFIG_OMAP_WATCHDOG is not set
> # CONFIG_PNX4008_WATCHDOG is not set
> # CONFIG_DAVINCI_WATCHDOG is not set
> # CONFIG_K3_RTI_WATCHDOG is not set
> # CONFIG_RN5T618_WATCHDOG is not set
> # CONFIG_SUNXI_WATCHDOG is not set
> # CONFIG_NPCM7XX_WATCHDOG is not set
> # CONFIG_STMP3XXX_RTC_WATCHDOG is not set
> # CONFIG_TS4800_WATCHDOG is not set
> # CONFIG_TS72XX_WATCHDOG is not set
> CONFIG_MAX63XX_WATCHDOG=y
> # CONFIG_MAX77620_WATCHDOG is not set
> # CONFIG_IMX2_WDT is not set
> # CONFIG_IMX7ULP_WDT is not set
> CONFIG_RETU_WATCHDOG=y
> # CONFIG_MOXART_WDT is not set
> # CONFIG_ST_LPC_WATCHDOG is not set
> # CONFIG_TEGRA_WATCHDOG is not set
> # CONFIG_QCOM_WDT is not set
> # CONFIG_MESON_GXBB_WATCHDOG is not set
> # CONFIG_MESON_WATCHDOG is not set
> # CONFIG_MEDIATEK_WATCHDOG is not set
> # CONFIG_DIGICOLOR_WATCHDOG is not set
> # CONFIG_LPC18XX_WATCHDOG is not set
> # CONFIG_RENESAS_WDT is not set
> # CONFIG_RENESAS_RZAWDT is not set
> # CONFIG_RENESAS_RZN1WDT is not set
> # CONFIG_RENESAS_RZG2LWDT is not set
> # CONFIG_ASPEED_WATCHDOG is not set
> # CONFIG_UNIPHIER_WATCHDOG is not set
> # CONFIG_RTD119X_WATCHDOG is not set
> # CONFIG_REALTEK_OTTO_WDT is not set
> # CONFIG_SPRD_WATCHDOG is not set
> # CONFIG_VISCONTI_WATCHDOG is not set
> # CONFIG_MSC313E_WATCHDOG is not set
> # CONFIG_APPLE_WATCHDOG is not set
> # CONFIG_SUNPLUS_WATCHDOG is not set
> # CONFIG_SC520_WDT is not set
> CONFIG_KEMPLD_WDT=y
> # CONFIG_BCM47XX_WDT is not set
> # CONFIG_BCM2835_WDT is not set
> # CONFIG_BCM_KONA_WDT is not set
> # CONFIG_BCM7038_WDT is not set
> # CONFIG_IMGPDC_WDT is not set
> # CONFIG_MPC5200_WDT is not set
> # CONFIG_MEN_A21_WDT is not set
> # CONFIG_UML_WATCHDOG is not set
> 
> #
> # USB-based Watchdog Cards
> #
> CONFIG_USBPCWATCHDOG=y
> CONFIG_SSB_POSSIBLE=y
> CONFIG_SSB=y
> CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
> # CONFIG_SSB_PCMCIAHOST is not set
> CONFIG_SSB_SDIOHOST_POSSIBLE=y
> CONFIG_SSB_SDIOHOST=y
> # CONFIG_SSB_DRIVER_GPIO is not set
> CONFIG_BCMA_POSSIBLE=y
> CONFIG_BCMA=y
> CONFIG_BCMA_HOST_SOC=y
> # CONFIG_BCMA_DRIVER_MIPS is not set
> # CONFIG_BCMA_SFLASH is not set
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> # CONFIG_BCMA_DRIVER_GPIO is not set
> # CONFIG_BCMA_DEBUG is not set
> 
> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=y
> CONFIG_MFD_ACT8945A=y
> # CONFIG_MFD_SUN4I_GPADC is not set
> CONFIG_MFD_AS3711=y
> CONFIG_MFD_AS3722=y
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> # CONFIG_MFD_AT91_USART is not set
> CONFIG_MFD_ATMEL_FLEXCOM=y
> # CONFIG_MFD_ATMEL_HLCDC is not set
> # CONFIG_MFD_BCM590XX is not set
> # CONFIG_MFD_BD9571MWV is not set
> CONFIG_MFD_AXP20X=y
> CONFIG_MFD_AXP20X_I2C=y
> CONFIG_MFD_MADERA=y
> CONFIG_MFD_MADERA_I2C=y
> # CONFIG_MFD_CS47L15 is not set
> # CONFIG_MFD_CS47L35 is not set
> # CONFIG_MFD_CS47L85 is not set
> # CONFIG_MFD_CS47L90 is not set
> CONFIG_MFD_CS47L92=y
> # CONFIG_MFD_ASIC3 is not set
> CONFIG_PMIC_DA903X=y
> CONFIG_PMIC_DA9052=y
> CONFIG_MFD_DA9052_I2C=y
> CONFIG_MFD_DA9055=y
> CONFIG_MFD_DA9062=y
> CONFIG_MFD_DA9063=y
> CONFIG_MFD_DA9150=y
> CONFIG_MFD_DLN2=y
> # CONFIG_MFD_ENE_KB3930 is not set
> # CONFIG_MFD_EXYNOS_LPASS is not set
> CONFIG_MFD_GATEWORKS_GSC=y
> # CONFIG_MFD_MC13XXX_I2C is not set
> CONFIG_MFD_MP2629=y
> # CONFIG_MFD_MXS_LRADC is not set
> # CONFIG_MFD_MX25_TSADC is not set
> CONFIG_MFD_HI6421_PMIC=y
> CONFIG_MFD_HI6421_SPMI=y
> # CONFIG_MFD_HI655X_PMIC is not set
> CONFIG_HTC_PASIC3=y
> CONFIG_HTC_I2CPLD=y
> # CONFIG_INTEL_SOC_PMIC is not set
> CONFIG_MFD_IQS62X=y
> CONFIG_MFD_KEMPLD=y
> # CONFIG_MFD_88PM800 is not set
> CONFIG_MFD_88PM805=y
> # CONFIG_MFD_88PM860X is not set
> CONFIG_MFD_MAX14577=y
> CONFIG_MFD_MAX77620=y
> CONFIG_MFD_MAX77650=y
> # CONFIG_MFD_MAX77686 is not set
> CONFIG_MFD_MAX77693=y
> # CONFIG_MFD_MAX77714 is not set
> # CONFIG_MFD_MAX77843 is not set
> CONFIG_MFD_MAX8907=y
> CONFIG_MFD_MAX8925=y
> CONFIG_MFD_MAX8997=y
> # CONFIG_MFD_MAX8998 is not set
> CONFIG_MFD_MT6360=y
> CONFIG_MFD_MT6370=y
> CONFIG_MFD_MT6397=y
> CONFIG_MFD_MENF21BMC=y
> # CONFIG_MFD_VIPERBOARD is not set
> CONFIG_MFD_NTXEC=y
> CONFIG_MFD_RETU=y
> # CONFIG_MFD_PCF50633 is not set
> # CONFIG_MFD_PM8XXX is not set
> # CONFIG_MFD_SPMI_PMIC is not set
> CONFIG_MFD_SY7636A=y
> # CONFIG_MFD_RT4831 is not set
> # CONFIG_MFD_RT5033 is not set
> CONFIG_MFD_RT5120=y
> # CONFIG_MFD_RC5T583 is not set
> CONFIG_MFD_RK808=y
> # CONFIG_MFD_RN5T618 is not set
> CONFIG_MFD_SEC_CORE=y
> CONFIG_MFD_SI476X_CORE=y
> CONFIG_MFD_SIMPLE_MFD_I2C=y
> # CONFIG_MFD_SL28CPLD is not set
> # CONFIG_MFD_SM501 is not set
> # CONFIG_MFD_SKY81452 is not set
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_STMPE=y
> 
> #
> # STMicroelectronics STMPE Interface Drivers
> #
> # CONFIG_STMPE_I2C is not set
> # end of STMicroelectronics STMPE Interface Drivers
> 
> # CONFIG_MFD_SUN6I_PRCM is not set
> CONFIG_MFD_SYSCON=y
> CONFIG_MFD_TI_AM335X_TSCADC=y
> # CONFIG_MFD_LP3943 is not set
> CONFIG_MFD_LP8788=y
> CONFIG_MFD_TI_LMU=y
> CONFIG_MFD_OMAP_USB_HOST=y
> # CONFIG_MFD_PALMAS is not set
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=y
> # CONFIG_MFD_TPS65086 is not set
> CONFIG_MFD_TPS65090=y
> # CONFIG_MFD_TPS65217 is not set
> CONFIG_MFD_TI_LP873X=y
> CONFIG_MFD_TI_LP87565=y
> CONFIG_MFD_TPS65218=y
> CONFIG_MFD_TPS6586X=y
> # CONFIG_MFD_TPS65910 is not set
> # CONFIG_MFD_TPS65912_I2C is not set
> # CONFIG_TWL4030_CORE is not set
> CONFIG_TWL6040_CORE=y
> CONFIG_MFD_WL1273_CORE=y
> CONFIG_MFD_LM3533=y
> CONFIG_MFD_TC3589X=y
> # CONFIG_MFD_TQMX86 is not set
> CONFIG_MFD_LOCHNAGAR=y
> # CONFIG_MFD_ARIZONA_I2C is not set
> CONFIG_MFD_WM8400=y
> CONFIG_MFD_WM831X=y
> CONFIG_MFD_WM831X_I2C=y
> # CONFIG_MFD_WM8350_I2C is not set
> # CONFIG_MFD_WM8994 is not set
> # CONFIG_MFD_STW481X is not set
> # CONFIG_MFD_ROHM_BD718XX is not set
> CONFIG_MFD_ROHM_BD71828=y
> # CONFIG_MFD_ROHM_BD957XMUF is not set
> # CONFIG_MFD_STM32_LPTIMER is not set
> # CONFIG_MFD_STM32_TIMERS is not set
> # CONFIG_MFD_STPMIC1 is not set
> CONFIG_MFD_STMFX=y
> CONFIG_MFD_ATC260X=y
> CONFIG_MFD_ATC260X_I2C=y
> # CONFIG_MFD_KHADAS_MCU is not set
> # CONFIG_MFD_ACER_A500_EC is not set
> # CONFIG_MFD_QCOM_PM8008 is not set
> CONFIG_RAVE_SP_CORE=y
> CONFIG_MFD_RSMU_I2C=y
> # end of Multifunction device drivers
> 
> CONFIG_REGULATOR=y
> CONFIG_REGULATOR_DEBUG=y
> CONFIG_REGULATOR_FIXED_VOLTAGE=y
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
> CONFIG_REGULATOR_USERSPACE_CONSUMER=y
> # CONFIG_REGULATOR_88PG86X is not set
> # CONFIG_REGULATOR_ACT8865 is not set
> # CONFIG_REGULATOR_ACT8945A is not set
> # CONFIG_REGULATOR_AD5398 is not set
> # CONFIG_REGULATOR_ANATOP is not set
> CONFIG_REGULATOR_AS3711=y
> # CONFIG_REGULATOR_AS3722 is not set
> CONFIG_REGULATOR_ATC260X=y
> CONFIG_REGULATOR_AXP20X=y
> CONFIG_REGULATOR_BD71815=y
> CONFIG_REGULATOR_BD71828=y
> # CONFIG_REGULATOR_DA903X is not set
> # CONFIG_REGULATOR_DA9052 is not set
> CONFIG_REGULATOR_DA9055=y
> # CONFIG_REGULATOR_DA9062 is not set
> CONFIG_REGULATOR_DA9063=y
> CONFIG_REGULATOR_DA9121=y
> CONFIG_REGULATOR_DA9210=y
> CONFIG_REGULATOR_DA9211=y
> CONFIG_REGULATOR_FAN53555=y
> CONFIG_REGULATOR_FAN53880=y
> # CONFIG_REGULATOR_GPIO is not set
> # CONFIG_REGULATOR_HI6421 is not set
> # CONFIG_REGULATOR_HI6421V530 is not set
> CONFIG_REGULATOR_HI6421V600=y
> CONFIG_REGULATOR_ISL9305=y
> CONFIG_REGULATOR_ISL6271A=y
> CONFIG_REGULATOR_LM363X=y
> CONFIG_REGULATOR_LOCHNAGAR=y
> CONFIG_REGULATOR_LP3971=y
> # CONFIG_REGULATOR_LP3972 is not set
> # CONFIG_REGULATOR_LP872X is not set
> # CONFIG_REGULATOR_LP873X is not set
> # CONFIG_REGULATOR_LP8755 is not set
> # CONFIG_REGULATOR_LP87565 is not set
> # CONFIG_REGULATOR_LP8788 is not set
> CONFIG_REGULATOR_LTC3589=y
> # CONFIG_REGULATOR_LTC3676 is not set
> CONFIG_REGULATOR_MAX14577=y
> # CONFIG_REGULATOR_MAX1586 is not set
> CONFIG_REGULATOR_MAX77620=y
> CONFIG_REGULATOR_MAX77650=y
> CONFIG_REGULATOR_MAX8649=y
> CONFIG_REGULATOR_MAX8660=y
> CONFIG_REGULATOR_MAX8893=y
> CONFIG_REGULATOR_MAX8907=y
> CONFIG_REGULATOR_MAX8925=y
> CONFIG_REGULATOR_MAX8952=y
> CONFIG_REGULATOR_MAX8973=y
> # CONFIG_REGULATOR_MAX8997 is not set
> CONFIG_REGULATOR_MAX20086=y
> # CONFIG_REGULATOR_MAX77686 is not set
> CONFIG_REGULATOR_MAX77693=y
> # CONFIG_REGULATOR_MAX77802 is not set
> CONFIG_REGULATOR_MAX77826=y
> # CONFIG_REGULATOR_MCP16502 is not set
> CONFIG_REGULATOR_MP5416=y
> # CONFIG_REGULATOR_MP8859 is not set
> CONFIG_REGULATOR_MP886X=y
> # CONFIG_REGULATOR_MPQ7920 is not set
> CONFIG_REGULATOR_MT6311=y
> # CONFIG_REGULATOR_MT6315 is not set
> CONFIG_REGULATOR_MT6323=y
> # CONFIG_REGULATOR_MT6331 is not set
> # CONFIG_REGULATOR_MT6332 is not set
> # CONFIG_REGULATOR_MT6357 is not set
> CONFIG_REGULATOR_MT6358=y
> CONFIG_REGULATOR_MT6359=y
> CONFIG_REGULATOR_MT6360=y
> CONFIG_REGULATOR_MT6370=y
> # CONFIG_REGULATOR_MT6397 is not set
> # CONFIG_REGULATOR_PBIAS is not set
> # CONFIG_REGULATOR_PCA9450 is not set
> CONFIG_REGULATOR_PF8X00=y
> CONFIG_REGULATOR_PFUZE100=y
> CONFIG_REGULATOR_PV88060=y
> CONFIG_REGULATOR_PV88080=y
> CONFIG_REGULATOR_PV88090=y
> # CONFIG_REGULATOR_QCOM_RPMH is not set
> CONFIG_REGULATOR_QCOM_SPMI=y
> CONFIG_REGULATOR_QCOM_USB_VBUS=y
> CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
> # CONFIG_REGULATOR_RK808 is not set
> CONFIG_REGULATOR_ROHM=y
> CONFIG_REGULATOR_RT4801=y
> CONFIG_REGULATOR_RT5120=y
> CONFIG_REGULATOR_RT5190A=y
> # CONFIG_REGULATOR_RT5759 is not set
> # CONFIG_REGULATOR_RT6160 is not set
> CONFIG_REGULATOR_RT6190=y
> CONFIG_REGULATOR_RT6245=y
> CONFIG_REGULATOR_RTQ2134=y
> CONFIG_REGULATOR_RTMV20=y
> CONFIG_REGULATOR_RTQ6752=y
> # CONFIG_REGULATOR_S2MPA01 is not set
> CONFIG_REGULATOR_S2MPS11=y
> # CONFIG_REGULATOR_S5M8767 is not set
> # CONFIG_REGULATOR_SC2731 is not set
> CONFIG_REGULATOR_SLG51000=y
> # CONFIG_REGULATOR_STM32_BOOSTER is not set
> # CONFIG_REGULATOR_STM32_VREFBUF is not set
> # CONFIG_REGULATOR_STM32_PWR is not set
> # CONFIG_REGULATOR_TI_ABB is not set
> # CONFIG_REGULATOR_STW481X_VMMC is not set
> CONFIG_REGULATOR_SY7636A=y
> CONFIG_REGULATOR_SY8106A=y
> CONFIG_REGULATOR_SY8824X=y
> CONFIG_REGULATOR_SY8827N=y
> CONFIG_REGULATOR_TPS51632=y
> CONFIG_REGULATOR_TPS62360=y
> # CONFIG_REGULATOR_TPS6286X is not set
> CONFIG_REGULATOR_TPS65023=y
> CONFIG_REGULATOR_TPS6507X=y
> # CONFIG_REGULATOR_TPS65090 is not set
> CONFIG_REGULATOR_TPS65132=y
> CONFIG_REGULATOR_TPS65218=y
> CONFIG_REGULATOR_TPS6586X=y
> # CONFIG_REGULATOR_TPS68470 is not set
> # CONFIG_REGULATOR_UNIPHIER is not set
> CONFIG_REGULATOR_VCTRL=y
> # CONFIG_REGULATOR_WM831X is not set
> CONFIG_REGULATOR_WM8400=y
> CONFIG_REGULATOR_QCOM_LABIBB=y
> CONFIG_CEC_CORE=y
> CONFIG_CEC_NOTIFIER=y
> 
> #
> # CEC support
> #
> CONFIG_MEDIA_CEC_SUPPORT=y
> CONFIG_CEC_CH7322=y
> # CONFIG_CEC_MESON_AO is not set
> # CONFIG_CEC_MESON_G12A_AO is not set
> # CONFIG_CEC_GPIO is not set
> # CONFIG_CEC_SAMSUNG_S5P is not set
> # CONFIG_CEC_STI is not set
> # CONFIG_CEC_STM32 is not set
> # CONFIG_CEC_TEGRA is not set
> # end of CEC support
> 
> CONFIG_MEDIA_SUPPORT=y
> CONFIG_MEDIA_SUPPORT_FILTER=y
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
> 
> #
> # Media device types
> #
> # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
> # CONFIG_MEDIA_RADIO_SUPPORT is not set
> CONFIG_MEDIA_SDR_SUPPORT=y
> CONFIG_MEDIA_PLATFORM_SUPPORT=y
> CONFIG_MEDIA_TEST_SUPPORT=y
> # end of Media device types
> 
> CONFIG_VIDEO_DEV=y
> CONFIG_MEDIA_CONTROLLER=y
> CONFIG_DVB_CORE=y
> 
> #
> # Video4Linux options
> #
> CONFIG_VIDEO_V4L2_I2C=y
> CONFIG_VIDEO_V4L2_SUBDEV_API=y
> # CONFIG_VIDEO_ADV_DEBUG is not set
> CONFIG_VIDEO_FIXED_MINOR_RANGES=y
> CONFIG_VIDEO_TUNER=y
> CONFIG_V4L2_MEM2MEM_DEV=y
> CONFIG_V4L2_FWNODE=y
> CONFIG_V4L2_ASYNC=y
> # end of Video4Linux options
> 
> #
> # Media controller options
> #
> # CONFIG_MEDIA_CONTROLLER_DVB is not set
> CONFIG_MEDIA_CONTROLLER_REQUEST_API=y
> # end of Media controller options
> 
> #
> # Digital TV options
> #
> # CONFIG_DVB_MMAP is not set
> # CONFIG_DVB_NET is not set
> CONFIG_DVB_MAX_ADAPTERS=16
> CONFIG_DVB_DYNAMIC_MINORS=y
> CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
> CONFIG_DVB_ULE_DEBUG=y
> # end of Digital TV options
> 
> #
> # Media drivers
> #
> 
> #
> # Drivers filtered as selected at 'Filter media drivers'
> #
> 
> #
> # Media drivers
> #
> CONFIG_MEDIA_USB_SUPPORT=y
> 
> #
> # Analog TV USB devices
> #
> CONFIG_VIDEO_HDPVR=y
> CONFIG_VIDEO_PVRUSB2=y
> CONFIG_VIDEO_PVRUSB2_SYSFS=y
> # CONFIG_VIDEO_PVRUSB2_DVB is not set
> CONFIG_VIDEO_PVRUSB2_DEBUGIFC=y
> CONFIG_VIDEO_STK1160_COMMON=y
> CONFIG_VIDEO_STK1160=y
> 
> #
> # Analog/digital TV USB devices
> #
> # CONFIG_VIDEO_CX231XX is not set
> 
> #
> # Digital TV USB devices
> #
> CONFIG_DVB_B2C2_FLEXCOP_USB=y
> CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG=y
> CONFIG_DVB_USB_V2=y
> CONFIG_DVB_USB_AF9015=y
> # CONFIG_DVB_USB_AF9035 is not set
> CONFIG_DVB_USB_ANYSEE=y
> CONFIG_DVB_USB_AU6610=y
> CONFIG_DVB_USB_AZ6007=y
> CONFIG_DVB_USB_CE6230=y
> # CONFIG_DVB_USB_DVBSKY is not set
> CONFIG_DVB_USB_EC168=y
> CONFIG_DVB_USB_GL861=y
> CONFIG_DVB_USB_MXL111SF=y
> CONFIG_DVB_USB_RTL28XXU=y
> CONFIG_DVB_USB_ZD1301=y
> CONFIG_SMS_USB_DRV=y
> 
> #
> # Webcam, TV (analog/digital) USB devices
> #
> CONFIG_VIDEO_EM28XX=y
> # CONFIG_VIDEO_EM28XX_V4L2 is not set
> CONFIG_VIDEO_EM28XX_DVB=y
> 
> #
> # Software defined radio USB devices
> #
> # CONFIG_USB_AIRSPY is not set
> # CONFIG_USB_HACKRF is not set
> CONFIG_MEDIA_PLATFORM_DRIVERS=y
> # CONFIG_V4L_PLATFORM_DRIVERS is not set
> CONFIG_SDR_PLATFORM_DRIVERS=y
> CONFIG_DVB_PLATFORM_DRIVERS=y
> CONFIG_V4L_MEM2MEM_DRIVERS=y
> CONFIG_VIDEO_MEM2MEM_DEINTERLACE=y
> 
> #
> # Allegro DVT media platform drivers
> #
> # CONFIG_VIDEO_ALLEGRO_DVT is not set
> 
> #
> # Amlogic media platform drivers
> #
> # CONFIG_VIDEO_MESON_GE2D is not set
> 
> #
> # Amphion drivers
> #
> # CONFIG_VIDEO_AMPHION_VPU is not set
> 
> #
> # Aspeed media platform drivers
> #
> 
> #
> # Atmel media platform drivers
> #
> 
> #
> # Cadence media platform drivers
> #
> CONFIG_VIDEO_CADENCE_CSI2RX=y
> CONFIG_VIDEO_CADENCE_CSI2TX=y
> 
> #
> # Chips&Media media platform drivers
> #
> # CONFIG_VIDEO_CODA is not set
> 
> #
> # Intel media platform drivers
> #
> 
> #
> # Marvell media platform drivers
> #
> 
> #
> # Mediatek media platform drivers
> #
> # CONFIG_VIDEO_MEDIATEK_JPEG is not set
> # CONFIG_VIDEO_MEDIATEK_MDP is not set
> # CONFIG_VIDEO_MEDIATEK_VPU is not set
> 
> #
> # Microchip Technology, Inc. media platform drivers
> #
> 
> #
> # NVidia media platform drivers
> #
> # CONFIG_VIDEO_TEGRA_VDE is not set
> 
> #
> # NXP media platform drivers
> #
> # CONFIG_VIDEO_IMX7_CSI is not set
> # CONFIG_VIDEO_IMX_MIPI_CSIS is not set
> # CONFIG_VIDEO_IMX_PXP is not set
> # CONFIG_VIDEO_MX2_EMMAPRP is not set
> # CONFIG_VIDEO_DW100 is not set
> # CONFIG_VIDEO_IMX8_JPEG is not set
> 
> #
> # Qualcomm media platform drivers
> #
> 
> #
> # Renesas media platform drivers
> #
> # CONFIG_VIDEO_RENESAS_FCP is not set
> # CONFIG_VIDEO_RENESAS_FDP1 is not set
> # CONFIG_VIDEO_RENESAS_JPU is not set
> # CONFIG_VIDEO_RENESAS_VSP1 is not set
> # CONFIG_VIDEO_RCAR_DRIF is not set
> 
> #
> # Rockchip media platform drivers
> #
> # CONFIG_VIDEO_ROCKCHIP_RGA is not set
> 
> #
> # Samsung media platform drivers
> #
> # CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC is not set
> # CONFIG_VIDEO_SAMSUNG_S5P_G2D is not set
> # CONFIG_VIDEO_SAMSUNG_S5P_JPEG is not set
> # CONFIG_VIDEO_SAMSUNG_S5P_MFC is not set
> 
> #
> # STMicroelectronics media platform drivers
> #
> # CONFIG_VIDEO_STI_BDISP is not set
> # CONFIG_DVB_C8SECTPFE is not set
> # CONFIG_VIDEO_STI_DELTA is not set
> # CONFIG_VIDEO_STI_HVA is not set
> # CONFIG_VIDEO_STM32_DMA2D is not set
> 
> #
> # Sunxi media platform drivers
> #
> 
> #
> # Texas Instruments drivers
> #
> # CONFIG_VIDEO_TI_VPE is not set
> 
> #
> # Verisilicon media platform drivers
> #
> # CONFIG_VIDEO_HANTRO is not set
> 
> #
> # VIA media platform drivers
> #
> 
> #
> # Xilinx media platform drivers
> #
> 
> #
> # MMC/SDIO DVB adapters
> #
> CONFIG_SMS_SDIO_DRV=y
> CONFIG_V4L_TEST_DRIVERS=y
> # CONFIG_VIDEO_VIM2M is not set
> # CONFIG_VIDEO_VICODEC is not set
> CONFIG_VIDEO_VIMC=y
> # CONFIG_VIDEO_VIVID is not set
> CONFIG_VIDEO_VISL=y
> # CONFIG_VISL_DEBUGFS is not set
> CONFIG_DVB_TEST_DRIVERS=y
> # CONFIG_DVB_VIDTV is not set
> CONFIG_MEDIA_COMMON_OPTIONS=y
> 
> #
> # common driver options
> #
> CONFIG_CYPRESS_FIRMWARE=y
> CONFIG_VIDEO_CX2341X=y
> CONFIG_VIDEO_TVEEPROM=y
> CONFIG_DVB_B2C2_FLEXCOP=y
> CONFIG_DVB_B2C2_FLEXCOP_DEBUG=y
> CONFIG_SMS_SIANO_MDTV=y
> # CONFIG_SMS_SIANO_DEBUGFS is not set
> CONFIG_VIDEO_V4L2_TPG=y
> CONFIG_VIDEOBUF2_CORE=y
> CONFIG_VIDEOBUF2_V4L2=y
> CONFIG_VIDEOBUF2_MEMOPS=y
> CONFIG_VIDEOBUF2_DMA_CONTIG=y
> CONFIG_VIDEOBUF2_VMALLOC=y
> CONFIG_VIDEOBUF2_DMA_SG=y
> # end of Media drivers
> 
> #
> # Media ancillary drivers
> #
> 
> #
> # Audio decoders, processors and mixers
> #
> # CONFIG_VIDEO_CS3308 is not set
> CONFIG_VIDEO_CS5345=y
> CONFIG_VIDEO_CS53L32A=y
> CONFIG_VIDEO_MSP3400=y
> CONFIG_VIDEO_SONY_BTF_MPX=y
> # CONFIG_VIDEO_TDA7432 is not set
> # CONFIG_VIDEO_TDA9840 is not set
> CONFIG_VIDEO_TEA6415C=y
> CONFIG_VIDEO_TEA6420=y
> # CONFIG_VIDEO_TLV320AIC23B is not set
> CONFIG_VIDEO_TVAUDIO=y
> CONFIG_VIDEO_UDA1342=y
> # CONFIG_VIDEO_VP27SMPX is not set
> CONFIG_VIDEO_WM8739=y
> CONFIG_VIDEO_WM8775=y
> # end of Audio decoders, processors and mixers
> 
> #
> # RDS decoders
> #
> CONFIG_VIDEO_SAA6588=y
> # end of RDS decoders
> 
> #
> # Video decoders
> #
> CONFIG_VIDEO_ADV7180=y
> CONFIG_VIDEO_ADV7183=y
> CONFIG_VIDEO_ADV748X=y
> CONFIG_VIDEO_ADV7604=y
> # CONFIG_VIDEO_ADV7604_CEC is not set
> CONFIG_VIDEO_ADV7842=y
> CONFIG_VIDEO_ADV7842_CEC=y
> # CONFIG_VIDEO_BT819 is not set
> # CONFIG_VIDEO_BT856 is not set
> CONFIG_VIDEO_BT866=y
> CONFIG_VIDEO_ISL7998X=y
> CONFIG_VIDEO_KS0127=y
> CONFIG_VIDEO_MAX9286=y
> CONFIG_VIDEO_ML86V7667=y
> CONFIG_VIDEO_SAA7110=y
> CONFIG_VIDEO_SAA711X=y
> # CONFIG_VIDEO_TC358743 is not set
> # CONFIG_VIDEO_TVP514X is not set
> CONFIG_VIDEO_TVP5150=y
> CONFIG_VIDEO_TVP7002=y
> CONFIG_VIDEO_TW2804=y
> # CONFIG_VIDEO_TW9903 is not set
> CONFIG_VIDEO_TW9906=y
> # CONFIG_VIDEO_TW9910 is not set
> CONFIG_VIDEO_VPX3220=y
> 
> #
> # Video and audio decoders
> #
> CONFIG_VIDEO_SAA717X=y
> CONFIG_VIDEO_CX25840=y
> # end of Video decoders
> 
> #
> # Video encoders
> #
> # CONFIG_VIDEO_AD9389B is not set
> CONFIG_VIDEO_ADV7170=y
> CONFIG_VIDEO_ADV7175=y
> CONFIG_VIDEO_ADV7343=y
> CONFIG_VIDEO_ADV7393=y
> # CONFIG_VIDEO_ADV7511 is not set
> CONFIG_VIDEO_AK881X=y
> CONFIG_VIDEO_SAA7127=y
> CONFIG_VIDEO_SAA7185=y
> CONFIG_VIDEO_THS8200=y
> # end of Video encoders
> 
> #
> # Video improvement chips
> #
> CONFIG_VIDEO_UPD64031A=y
> # CONFIG_VIDEO_UPD64083 is not set
> # end of Video improvement chips
> 
> #
> # Audio/Video compression chips
> #
> CONFIG_VIDEO_SAA6752HS=y
> # end of Audio/Video compression chips
> 
> #
> # SDR tuner chips
> #
> CONFIG_SDR_MAX2175=y
> # end of SDR tuner chips
> 
> #
> # Miscellaneous helper chips
> #
> CONFIG_VIDEO_I2C=y
> # CONFIG_VIDEO_M52790 is not set
> CONFIG_VIDEO_ST_MIPID02=y
> CONFIG_VIDEO_THS7303=y
> # end of Miscellaneous helper chips
> 
> CONFIG_MEDIA_TUNER=y
> 
> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_E4000=y
> CONFIG_MEDIA_TUNER_FC0011=y
> CONFIG_MEDIA_TUNER_FC0012=y
> CONFIG_MEDIA_TUNER_FC0013=y
> CONFIG_MEDIA_TUNER_FC2580=y
> CONFIG_MEDIA_TUNER_IT913X=y
> CONFIG_MEDIA_TUNER_M88RS6000T=y
> CONFIG_MEDIA_TUNER_MAX2165=y
> CONFIG_MEDIA_TUNER_MC44S803=y
> CONFIG_MEDIA_TUNER_MT2060=y
> CONFIG_MEDIA_TUNER_MT2063=y
> CONFIG_MEDIA_TUNER_MT20XX=y
> # CONFIG_MEDIA_TUNER_MT2131 is not set
> CONFIG_MEDIA_TUNER_MT2266=y
> # CONFIG_MEDIA_TUNER_MXL301RF is not set
> CONFIG_MEDIA_TUNER_MXL5005S=y
> CONFIG_MEDIA_TUNER_MXL5007T=y
> CONFIG_MEDIA_TUNER_QM1D1B0004=y
> CONFIG_MEDIA_TUNER_QM1D1C0042=y
> CONFIG_MEDIA_TUNER_QT1010=y
> CONFIG_MEDIA_TUNER_R820T=y
> CONFIG_MEDIA_TUNER_SI2157=y
> CONFIG_MEDIA_TUNER_SIMPLE=y
> CONFIG_MEDIA_TUNER_TDA18212=y
> CONFIG_MEDIA_TUNER_TDA18218=y
> CONFIG_MEDIA_TUNER_TDA18250=y
> CONFIG_MEDIA_TUNER_TDA18271=y
> CONFIG_MEDIA_TUNER_TDA827X=y
> CONFIG_MEDIA_TUNER_TDA8290=y
> CONFIG_MEDIA_TUNER_TDA9887=y
> CONFIG_MEDIA_TUNER_TEA5761=y
> # CONFIG_MEDIA_TUNER_TEA5767 is not set
> CONFIG_MEDIA_TUNER_TUA9001=y
> CONFIG_MEDIA_TUNER_XC2028=y
> CONFIG_MEDIA_TUNER_XC4000=y
> CONFIG_MEDIA_TUNER_XC5000=y
> # end of Customize TV tuners
> 
> #
> # Customise DVB Frontends
> #
> 
> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_M88DS3103=y
> # CONFIG_DVB_MXL5XX is not set
> CONFIG_DVB_STB0899=y
> CONFIG_DVB_STB6100=y
> CONFIG_DVB_STV090x=y
> # CONFIG_DVB_STV0910 is not set
> # CONFIG_DVB_STV6110x is not set
> CONFIG_DVB_STV6111=y
> 
> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=y
> CONFIG_DVB_MN88472=y
> CONFIG_DVB_MN88473=y
> CONFIG_DVB_SI2165=y
> CONFIG_DVB_TDA18271C2DD=y
> 
> #
> # DVB-S (satellite) frontends
> #
> # CONFIG_DVB_CX24110 is not set
> CONFIG_DVB_CX24116=y
> # CONFIG_DVB_CX24117 is not set
> CONFIG_DVB_CX24120=y
> CONFIG_DVB_CX24123=y
> # CONFIG_DVB_DS3000 is not set
> CONFIG_DVB_MB86A16=y
> CONFIG_DVB_MT312=y
> CONFIG_DVB_S5H1420=y
> CONFIG_DVB_SI21XX=y
> # CONFIG_DVB_STB6000 is not set
> # CONFIG_DVB_STV0288 is not set
> CONFIG_DVB_STV0299=y
> CONFIG_DVB_STV0900=y
> CONFIG_DVB_STV6110=y
> CONFIG_DVB_TDA10071=y
> CONFIG_DVB_TDA10086=y
> CONFIG_DVB_TDA8083=y
> CONFIG_DVB_TDA8261=y
> CONFIG_DVB_TDA826X=y
> CONFIG_DVB_TS2020=y
> # CONFIG_DVB_TUA6100 is not set
> CONFIG_DVB_TUNER_CX24113=y
> CONFIG_DVB_TUNER_ITD1000=y
> # CONFIG_DVB_VES1X93 is not set
> # CONFIG_DVB_ZL10036 is not set
> # CONFIG_DVB_ZL10039 is not set
> 
> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_AF9013=y
> CONFIG_DVB_CX22700=y
> CONFIG_DVB_CX22702=y
> CONFIG_DVB_CXD2820R=y
> CONFIG_DVB_CXD2841ER=y
> # CONFIG_DVB_DIB3000MB is not set
> CONFIG_DVB_DIB3000MC=y
> CONFIG_DVB_DIB7000M=y
> CONFIG_DVB_DIB7000P=y
> CONFIG_DVB_DIB9000=y
> CONFIG_DVB_DRXD=y
> CONFIG_DVB_EC100=y
> # CONFIG_DVB_L64781 is not set
> CONFIG_DVB_MT352=y
> CONFIG_DVB_NXT6000=y
> CONFIG_DVB_RTL2830=y
> CONFIG_DVB_RTL2832=y
> CONFIG_DVB_RTL2832_SDR=y
> # CONFIG_DVB_S5H1432 is not set
> CONFIG_DVB_SI2168=y
> # CONFIG_DVB_SP887X is not set
> CONFIG_DVB_STV0367=y
> CONFIG_DVB_TDA10048=y
> CONFIG_DVB_TDA1004X=y
> CONFIG_DVB_ZD1301_DEMOD=y
> CONFIG_DVB_ZL10353=y
> 
> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_STV0297=y
> CONFIG_DVB_TDA10021=y
> CONFIG_DVB_TDA10023=y
> CONFIG_DVB_VES1820=y
> 
> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> # CONFIG_DVB_AU8522_DTV is not set
> # CONFIG_DVB_AU8522_V4L is not set
> CONFIG_DVB_BCM3510=y
> CONFIG_DVB_LG2160=y
> CONFIG_DVB_LGDT3305=y
> CONFIG_DVB_LGDT3306A=y
> CONFIG_DVB_LGDT330X=y
> CONFIG_DVB_MXL692=y
> CONFIG_DVB_NXT200X=y
> # CONFIG_DVB_OR51132 is not set
> CONFIG_DVB_OR51211=y
> CONFIG_DVB_S5H1409=y
> CONFIG_DVB_S5H1411=y
> 
> #
> # ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_DIB8000=y
> CONFIG_DVB_MB86A20S=y
> CONFIG_DVB_S921=y
> 
> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_MN88443X=y
> CONFIG_DVB_TC90522=y
> 
> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=y
> CONFIG_DVB_TUNER_DIB0070=y
> CONFIG_DVB_TUNER_DIB0090=y
> 
> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_A8293=y
> CONFIG_DVB_AF9033=y
> # CONFIG_DVB_ASCOT2E is not set
> CONFIG_DVB_ATBM8830=y
> # CONFIG_DVB_HELENE is not set
> CONFIG_DVB_HORUS3A=y
> CONFIG_DVB_ISL6405=y
> CONFIG_DVB_ISL6421=y
> CONFIG_DVB_ISL6423=y
> # CONFIG_DVB_IX2505V is not set
> CONFIG_DVB_LGS8GL5=y
> CONFIG_DVB_LGS8GXX=y
> CONFIG_DVB_LNBH25=y
> CONFIG_DVB_LNBH29=y
> # CONFIG_DVB_LNBP21 is not set
> CONFIG_DVB_LNBP22=y
> CONFIG_DVB_M88RS2000=y
> # CONFIG_DVB_TDA665x is not set
> CONFIG_DVB_DRX39XYJ=y
> 
> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_CXD2099=y
> CONFIG_DVB_SP2=y
> # end of Customise DVB Frontends
> 
> #
> # Tools to develop new frontends
> #
> CONFIG_DVB_DUMMY_FE=y
> # end of Media ancillary drivers
> 
> #
> # Graphics support
> #
> CONFIG_APERTURE_HELPERS=y
> CONFIG_VIDEO_NOMODESET=y
> # CONFIG_IMX_IPUV3_CORE is not set
> CONFIG_DRM=y
> CONFIG_DRM_MIPI_DSI=y
> # CONFIG_DRM_DEBUG_MM is not set
> CONFIG_DRM_KUNIT_TEST=y
> CONFIG_DRM_KMS_HELPER=y
> # CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
> # CONFIG_DRM_DEBUG_MODESET_LOCK is not set
> CONFIG_DRM_FBDEV_EMULATION=y
> CONFIG_DRM_FBDEV_OVERALLOC=100
> CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM=y
> CONFIG_DRM_LOAD_EDID_FIRMWARE=y
> CONFIG_DRM_DP_AUX_BUS=y
> CONFIG_DRM_DISPLAY_HELPER=y
> CONFIG_DRM_DISPLAY_DP_HELPER=y
> CONFIG_DRM_DISPLAY_HDCP_HELPER=y
> CONFIG_DRM_DISPLAY_HDMI_HELPER=y
> CONFIG_DRM_DP_AUX_CHARDEV=y
> # CONFIG_DRM_DP_CEC is not set
> CONFIG_DRM_BUDDY=y
> CONFIG_DRM_GEM_DMA_HELPER=y
> CONFIG_DRM_GEM_SHMEM_HELPER=y
> CONFIG_DRM_SCHED=y
> 
> #
> # I2C encoder or helper chips
> #
> # CONFIG_DRM_I2C_CH7006 is not set
> # CONFIG_DRM_I2C_SIL164 is not set
> CONFIG_DRM_I2C_NXP_TDA998X=y
> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> # end of I2C encoder or helper chips
> 
> #
> # ARM devices
> #
> # CONFIG_DRM_HDLCD is not set
> # CONFIG_DRM_MALI_DISPLAY is not set
> CONFIG_DRM_KOMEDA=y
> # end of ARM devices
> 
> # CONFIG_DRM_KMB_DISPLAY is not set
> # CONFIG_DRM_VGEM is not set
> CONFIG_DRM_VKMS=y
> # CONFIG_DRM_EXYNOS is not set
> # CONFIG_DRM_UDL is not set
> CONFIG_DRM_RCAR_DW_HDMI=y
> CONFIG_DRM_RCAR_USE_LVDS=y
> # CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
> # CONFIG_DRM_RZG2L_MIPI_DSI is not set
> # CONFIG_DRM_SUN4I is not set
> CONFIG_DRM_PANEL=y
> 
> #
> # Display Panels
> #
> # CONFIG_DRM_PANEL_ARM_VERSATILE is not set
> # CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596 is not set
> # CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0 is not set
> # CONFIG_DRM_PANEL_BOE_HIMAX8279D is not set
> # CONFIG_DRM_PANEL_BOE_TV101WUM_NL6 is not set
> CONFIG_DRM_PANEL_DSI_CM=y
> CONFIG_DRM_PANEL_LVDS=y
> CONFIG_DRM_PANEL_EBBG_FT8719=y
> CONFIG_DRM_PANEL_ELIDA_KD35T133=y
> CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=y
> # CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D is not set
> CONFIG_DRM_PANEL_ILITEK_ILI9881C=y
> CONFIG_DRM_PANEL_INNOLUX_P079ZCA=y
> # CONFIG_DRM_PANEL_JADARD_JD9365DA_H3 is not set
> CONFIG_DRM_PANEL_JDI_LT070ME05000=y
> CONFIG_DRM_PANEL_JDI_R63452=y
> CONFIG_DRM_PANEL_KHADAS_TS050=y
> CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04=y
> CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W=y
> # CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
> CONFIG_DRM_PANEL_NEWVISION_NV3051D=y
> # CONFIG_DRM_PANEL_NOVATEK_NT35510 is not set
> CONFIG_DRM_PANEL_NOVATEK_NT35560=y
> CONFIG_DRM_PANEL_NOVATEK_NT35950=y
> CONFIG_DRM_PANEL_NOVATEK_NT36672A=y
> CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=y
> # CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO is not set
> # CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
> CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS=y
> # CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
> CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
> CONFIG_DRM_PANEL_RAYDIUM_RM67191=y
> # CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
> # CONFIG_DRM_PANEL_RONBO_RB070D30 is not set
> # CONFIG_DRM_PANEL_SAMSUNG_S6D16D0 is not set
> CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=y
> CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=y
> CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=y
> # CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI is not set
> CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01=y
> # CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
> # CONFIG_DRM_PANEL_SAMSUNG_SOFEF00 is not set
> # CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
> CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=y
> # CONFIG_DRM_PANEL_SHARP_LS037V7DW01 is not set
> # CONFIG_DRM_PANEL_SHARP_LS043T1LE01 is not set
> CONFIG_DRM_PANEL_SHARP_LS060T1SX01=y
> # CONFIG_DRM_PANEL_SITRONIX_ST7701 is not set
> CONFIG_DRM_PANEL_SITRONIX_ST7703=y
> CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521=y
> # CONFIG_DRM_PANEL_TDO_TL070WSH30 is not set
> CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=y
> CONFIG_DRM_PANEL_VISIONOX_RM69299=y
> # CONFIG_DRM_PANEL_XINPENG_XPP055C272 is not set
> # end of Display Panels
> 
> CONFIG_DRM_BRIDGE=y
> CONFIG_DRM_PANEL_BRIDGE=y
> 
> #
> # Display Interface Bridges
> #
> # CONFIG_DRM_CDNS_DSI is not set
> CONFIG_DRM_CHIPONE_ICN6211=y
> CONFIG_DRM_CHRONTEL_CH7033=y
> # CONFIG_DRM_CROS_EC_ANX7688 is not set
> CONFIG_DRM_DISPLAY_CONNECTOR=y
> # CONFIG_DRM_FSL_LDB is not set
> CONFIG_DRM_ITE_IT6505=y
> # CONFIG_DRM_LONTIUM_LT8912B is not set
> CONFIG_DRM_LONTIUM_LT9211=y
> CONFIG_DRM_LONTIUM_LT9611=y
> CONFIG_DRM_LONTIUM_LT9611UXC=y
> # CONFIG_DRM_ITE_IT66121 is not set
> # CONFIG_DRM_LVDS_CODEC is not set
> # CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
> # CONFIG_DRM_NWL_MIPI_DSI is not set
> CONFIG_DRM_NXP_PTN3460=y
> # CONFIG_DRM_PARADE_PS8622 is not set
> CONFIG_DRM_PARADE_PS8640=y
> CONFIG_DRM_SIL_SII8620=y
> # CONFIG_DRM_SII902X is not set
> CONFIG_DRM_SII9234=y
> # CONFIG_DRM_SIMPLE_BRIDGE is not set
> # CONFIG_DRM_THINE_THC63LVD1024 is not set
> CONFIG_DRM_TOSHIBA_TC358762=y
> # CONFIG_DRM_TOSHIBA_TC358764 is not set
> # CONFIG_DRM_TOSHIBA_TC358767 is not set
> CONFIG_DRM_TOSHIBA_TC358768=y
> CONFIG_DRM_TOSHIBA_TC358775=y
> CONFIG_DRM_TI_DLPC3433=y
> # CONFIG_DRM_TI_TFP410 is not set
> # CONFIG_DRM_TI_SN65DSI83 is not set
> CONFIG_DRM_TI_SN65DSI86=y
> CONFIG_DRM_TI_TPD12S015=y
> # CONFIG_DRM_ANALOGIX_ANX6345 is not set
> CONFIG_DRM_ANALOGIX_ANX78XX=y
> CONFIG_DRM_ANALOGIX_DP=y
> CONFIG_DRM_ANALOGIX_ANX7625=y
> # CONFIG_DRM_I2C_ADV7511 is not set
> # CONFIG_DRM_CDNS_MHDP8546 is not set
> # CONFIG_DRM_IMX8QM_LDB is not set
> # CONFIG_DRM_IMX8QXP_LDB is not set
> # CONFIG_DRM_IMX8QXP_PIXEL_COMBINER is not set
> # CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI is not set
> CONFIG_DRM_DW_HDMI=y
> CONFIG_DRM_DW_HDMI_CEC=y
> # end of Display Interface Bridges
> 
> # CONFIG_DRM_INGENIC is not set
> # CONFIG_DRM_V3D is not set
> CONFIG_DRM_ETNAVIV=y
> CONFIG_DRM_ETNAVIV_THERMAL=y
> # CONFIG_DRM_LOGICVC is not set
> CONFIG_DRM_MXS=y
> CONFIG_DRM_MXSFB=y
> CONFIG_DRM_IMX_LCDIF=y
> # CONFIG_DRM_ARCPGU is not set
> CONFIG_DRM_GM12U320=y
> # CONFIG_DRM_OFDRM is not set
> CONFIG_DRM_SIMPLEDRM=y
> # CONFIG_DRM_PL111 is not set
> # CONFIG_DRM_TVE200 is not set
> # CONFIG_DRM_LIMA is not set
> # CONFIG_DRM_ASPEED_GFX is not set
> # CONFIG_DRM_MCDE is not set
> # CONFIG_DRM_TIDSS is not set
> CONFIG_DRM_GUD=y
> CONFIG_DRM_SSD130X=y
> # CONFIG_DRM_SSD130X_I2C is not set
> # CONFIG_DRM_SPRD is not set
> # CONFIG_DRM_LEGACY is not set
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
> CONFIG_DRM_LIB_RANDOM=y
> 
> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=y
> CONFIG_FB_NOTIFY=y
> CONFIG_FB=y
> CONFIG_FIRMWARE_EDID=y
> CONFIG_FB_CFB_FILLRECT=y
> CONFIG_FB_CFB_COPYAREA=y
> CONFIG_FB_CFB_IMAGEBLIT=y
> CONFIG_FB_SYS_FILLRECT=y
> CONFIG_FB_SYS_COPYAREA=y
> CONFIG_FB_SYS_IMAGEBLIT=y
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=y
> CONFIG_FB_DEFERRED_IO=y
> CONFIG_FB_BACKLIGHT=y
> CONFIG_FB_MODE_HELPERS=y
> # CONFIG_FB_TILEBLITTING is not set
> 
> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CLPS711X is not set
> # CONFIG_FB_IMX is not set
> # CONFIG_FB_ARC is not set
> # CONFIG_FB_CONTROL is not set
> # CONFIG_FB_UVESA is not set
> # CONFIG_FB_GBE is not set
> # CONFIG_FB_PVR2 is not set
> CONFIG_FB_OPENCORES=y
> # CONFIG_FB_S1D13XXX is not set
> # CONFIG_FB_ATMEL is not set
> # CONFIG_FB_WM8505 is not set
> # CONFIG_FB_PXA168 is not set
> # CONFIG_FB_W100 is not set
> # CONFIG_FB_SH_MOBILE_LCDC is not set
> # CONFIG_FB_TMIO is not set
> # CONFIG_FB_S3C is not set
> CONFIG_FB_SMSCUFX=y
> # CONFIG_FB_UDL is not set
> # CONFIG_FB_IBM_GXT4500 is not set
> # CONFIG_FB_GOLDFISH is not set
> # CONFIG_FB_DA8XX is not set
> CONFIG_FB_VIRTUAL=y
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_BROADSHEET is not set
> CONFIG_FB_SSD1307=y
> # CONFIG_FB_OMAP2 is not set
> # CONFIG_MMP_DISP is not set
> # end of Frame buffer Devices
> 
> #
> # Backlight & LCD device support
> #
> # CONFIG_LCD_CLASS_DEVICE is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=y
> # CONFIG_BACKLIGHT_KTD253 is not set
> CONFIG_BACKLIGHT_LM3533=y
> # CONFIG_BACKLIGHT_OMAP1 is not set
> CONFIG_BACKLIGHT_DA903X=y
> CONFIG_BACKLIGHT_DA9052=y
> # CONFIG_BACKLIGHT_MAX8925 is not set
> CONFIG_BACKLIGHT_MT6370=y
> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> CONFIG_BACKLIGHT_WM831X=y
> # CONFIG_BACKLIGHT_ADP8860 is not set
> CONFIG_BACKLIGHT_ADP8870=y
> CONFIG_BACKLIGHT_LM3639=y
> CONFIG_BACKLIGHT_AS3711=y
> CONFIG_BACKLIGHT_GPIO=y
> CONFIG_BACKLIGHT_LV5207LP=y
> CONFIG_BACKLIGHT_BD6107=y
> CONFIG_BACKLIGHT_ARCXCNN=y
> CONFIG_BACKLIGHT_RAVE_SP=y
> CONFIG_BACKLIGHT_LED=y
> # end of Backlight & LCD device support
> 
> CONFIG_VIDEOMODE_HELPERS=y
> CONFIG_HDMI=y
> # CONFIG_LOGO is not set
> # end of Graphics support
> 
> # CONFIG_DRM_ACCEL is not set
> # CONFIG_SOUND is not set
> CONFIG_USB_OHCI_LITTLE_ENDIAN=y
> CONFIG_USB_SUPPORT=y
> CONFIG_USB_COMMON=y
> CONFIG_USB_ULPI_BUS=y
> CONFIG_USB_CONN_GPIO=y
> CONFIG_USB_ARCH_HAS_HCD=y
> CONFIG_USB=y
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
> 
> #
> # Miscellaneous USB options
> #
> # CONFIG_USB_DEFAULT_PERSIST is not set
> # CONFIG_USB_FEW_INIT_RETRIES is not set
> CONFIG_USB_DYNAMIC_MINORS=y
> # CONFIG_USB_OTG_PRODUCTLIST is not set
> CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB=y
> CONFIG_USB_AUTOSUSPEND_DELAY=2
> # CONFIG_USB_MON is not set
> 
> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=y
> # CONFIG_USB_XHCI_HCD is not set
> # CONFIG_USB_BRCMSTB is not set
> CONFIG_USB_EHCI_HCD=y
> CONFIG_USB_EHCI_ROOT_HUB_TT=y
> # CONFIG_USB_EHCI_TT_NEWSCHED is not set
> CONFIG_USB_EHCI_FSL=y
> # CONFIG_USB_EHCI_HCD_NPCM7XX is not set
> CONFIG_USB_EHCI_HCD_OMAP=y
> # CONFIG_USB_EHCI_HCD_ORION is not set
> # CONFIG_USB_EHCI_HCD_SPEAR is not set
> # CONFIG_USB_EHCI_HCD_STI is not set
> # CONFIG_USB_EHCI_HCD_AT91 is not set
> # CONFIG_USB_EHCI_SH is not set
> # CONFIG_USB_EHCI_EXYNOS is not set
> # CONFIG_USB_EHCI_MV is not set
> # CONFIG_USB_CNS3XXX_EHCI is not set
> CONFIG_USB_EHCI_HCD_PLATFORM=y
> CONFIG_USB_OXU210HP_HCD=y
> CONFIG_USB_ISP116X_HCD=y
> # CONFIG_USB_ISP1362_HCD is not set
> CONFIG_USB_OHCI_HCD=y
> # CONFIG_USB_OHCI_HCD_SPEAR is not set
> # CONFIG_USB_OHCI_HCD_STI is not set
> # CONFIG_USB_OHCI_HCD_S3C2410 is not set
> CONFIG_USB_OHCI_HCD_LPC32XX=y
> # CONFIG_USB_OHCI_HCD_AT91 is not set
> # CONFIG_USB_OHCI_HCD_OMAP3 is not set
> # CONFIG_USB_OHCI_HCD_DAVINCI is not set
> CONFIG_USB_OHCI_HCD_SSB=y
> # CONFIG_USB_OHCI_SH is not set
> # CONFIG_USB_OHCI_EXYNOS is not set
> # CONFIG_USB_CNS3XXX_OHCI is not set
> CONFIG_USB_OHCI_HCD_PLATFORM=y
> CONFIG_USB_U132_HCD=y
> # CONFIG_USB_SL811_HCD is not set
> # CONFIG_USB_R8A66597_HCD is not set
> CONFIG_USB_HCD_BCMA=y
> CONFIG_USB_HCD_SSB=y
> CONFIG_USB_HCD_TEST_MODE=y
> # CONFIG_USB_RENESAS_USBHS is not set
> 
> #
> # USB Device Class drivers
> #
> # CONFIG_USB_PRINTER is not set
> # CONFIG_USB_WDM is not set
> CONFIG_USB_TMC=y
> 
> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> 
> #
> # also be needed; see USB_STORAGE Help for more info
> #
> 
> #
> # USB Imaging devices
> #
> CONFIG_USB_MDC800=y
> CONFIG_USBIP_CORE=y
> # CONFIG_USBIP_VHCI_HCD is not set
> CONFIG_USBIP_HOST=y
> CONFIG_USBIP_VUDC=y
> CONFIG_USBIP_DEBUG=y
> 
> #
> # USB dual-mode controller drivers
> #
> CONFIG_USB_CDNS_SUPPORT=y
> CONFIG_USB_CDNS3=y
> CONFIG_USB_CDNS3_GADGET=y
> # CONFIG_USB_CDNS3_HOST is not set
> CONFIG_USB_CDNS3_TI=y
> CONFIG_USB_CDNS3_IMX=y
> # CONFIG_USB_FOTG210 is not set
> # CONFIG_USB_MTU3 is not set
> # CONFIG_USB_MUSB_HDRC is not set
> CONFIG_USB_DWC3=y
> # CONFIG_USB_DWC3_ULPI is not set
> # CONFIG_USB_DWC3_HOST is not set
> CONFIG_USB_DWC3_GADGET=y
> # CONFIG_USB_DWC3_DUAL_ROLE is not set
> 
> #
> # Platform Glue Driver Support
> #
> CONFIG_USB_DWC3_OMAP=y
> CONFIG_USB_DWC3_EXYNOS=y
> CONFIG_USB_DWC3_KEYSTONE=y
> CONFIG_USB_DWC3_MESON_G12A=y
> CONFIG_USB_DWC3_OF_SIMPLE=y
> CONFIG_USB_DWC3_ST=y
> CONFIG_USB_DWC3_QCOM=y
> CONFIG_USB_DWC3_IMX8MP=y
> CONFIG_USB_DWC3_XILINX=y
> CONFIG_USB_DWC3_AM62=y
> # CONFIG_USB_DWC2 is not set
> CONFIG_USB_CHIPIDEA=y
> # CONFIG_USB_CHIPIDEA_UDC is not set
> CONFIG_USB_CHIPIDEA_HOST=y
> CONFIG_USB_CHIPIDEA_MSM=y
> CONFIG_USB_CHIPIDEA_IMX=y
> CONFIG_USB_CHIPIDEA_GENERIC=y
> CONFIG_USB_CHIPIDEA_TEGRA=y
> CONFIG_USB_ISP1760=y
> CONFIG_USB_ISP1761_UDC=y
> # CONFIG_USB_ISP1760_HOST_ROLE is not set
> CONFIG_USB_ISP1760_GADGET_ROLE=y
> # CONFIG_USB_ISP1760_DUAL_ROLE is not set
> 
> #
> # USB port drivers
> #
> # CONFIG_USB_USS720 is not set
> 
> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=y
> # CONFIG_USB_EMI26 is not set
> CONFIG_USB_ADUTUX=y
> # CONFIG_USB_SEVSEG is not set
> CONFIG_USB_LEGOTOWER=y
> CONFIG_USB_LCD=y
> CONFIG_USB_CYPRESS_CY7C63=y
> # CONFIG_USB_CYTHERM is not set
> CONFIG_USB_IDMOUSE=y
> CONFIG_USB_FTDI_ELAN=y
> CONFIG_USB_APPLEDISPLAY=y
> # CONFIG_USB_QCOM_EUD is not set
> # CONFIG_APPLE_MFI_FASTCHARGE is not set
> CONFIG_USB_SISUSBVGA=y
> CONFIG_USB_LD=y
> CONFIG_USB_TRANCEVIBRATOR=y
> CONFIG_USB_IOWARRIOR=y
> CONFIG_USB_TEST=y
> CONFIG_USB_EHSET_TEST_FIXTURE=y
> # CONFIG_USB_ISIGHTFW is not set
> # CONFIG_USB_YUREX is not set
> # CONFIG_USB_EZUSB_FX2 is not set
> CONFIG_USB_HUB_USB251XB=y
> CONFIG_USB_HSIC_USB3503=y
> CONFIG_USB_HSIC_USB4604=y
> # CONFIG_USB_LINK_LAYER_TEST is not set
> CONFIG_USB_CHAOSKEY=y
> # CONFIG_BRCM_USB_PINMAP is not set
> CONFIG_USB_ONBOARD_HUB=y
> CONFIG_USB_ATM=y
> # CONFIG_USB_SPEEDTOUCH is not set
> CONFIG_USB_CXACRU=y
> CONFIG_USB_UEAGLEATM=y
> CONFIG_USB_XUSBATM=y
> 
> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=y
> # CONFIG_KEYSTONE_USB_PHY is not set
> CONFIG_NOP_USB_XCEIV=y
> # CONFIG_AM335X_PHY_USB is not set
> # CONFIG_TAHVO_USB is not set
> CONFIG_USB_ISP1301=y
> # CONFIG_USB_TEGRA_PHY is not set
> # CONFIG_USB_ULPI is not set
> # end of USB Physical Layer drivers
> 
> CONFIG_USB_GADGET=y
> CONFIG_USB_GADGET_DEBUG=y
> # CONFIG_USB_GADGET_VERBOSE is not set
> # CONFIG_USB_GADGET_DEBUG_FILES is not set
> CONFIG_USB_GADGET_DEBUG_FS=y
> CONFIG_USB_GADGET_VBUS_DRAW=2
> CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
> 
> #
> # USB Peripheral Controller
> #
> # CONFIG_USB_LPC32XX is not set
> CONFIG_USB_FUSB300=y
> CONFIG_USB_GR_UDC=y
> CONFIG_USB_R8A66597=y
> # CONFIG_USB_RENESAS_USB3 is not set
> CONFIG_USB_PXA27X=y
> CONFIG_USB_MV_UDC=y
> # CONFIG_USB_MV_U3D is not set
> # CONFIG_USB_SNP_UDC_PLAT is not set
> # CONFIG_USB_M66592 is not set
> CONFIG_USB_BDC_UDC=y
> CONFIG_USB_NET2272=y
> CONFIG_USB_NET2272_DMA=y
> CONFIG_USB_GADGET_XILINX=y
> # CONFIG_USB_ASPEED_UDC is not set
> # CONFIG_USB_ASPEED_VHUB is not set
> # CONFIG_USB_DUMMY_HCD is not set
> # end of USB Peripheral Controller
> 
> CONFIG_USB_LIBCOMPOSITE=y
> CONFIG_USB_U_ETHER=y
> CONFIG_USB_F_NCM=y
> CONFIG_USB_F_ECM=y
> CONFIG_USB_F_SUBSET=y
> CONFIG_USB_F_RNDIS=y
> CONFIG_USB_F_FS=y
> CONFIG_USB_F_UVC=y
> CONFIG_USB_F_HID=y
> CONFIG_USB_F_PRINTER=y
> # CONFIG_USB_CONFIGFS is not set
> 
> #
> # USB Gadget precomposed configurations
> #
> # CONFIG_USB_ZERO is not set
> # CONFIG_USB_ETH is not set
> CONFIG_USB_G_NCM=y
> CONFIG_USB_GADGETFS=y
> CONFIG_USB_FUNCTIONFS=y
> CONFIG_USB_FUNCTIONFS_ETH=y
> CONFIG_USB_FUNCTIONFS_RNDIS=y
> CONFIG_USB_FUNCTIONFS_GENERIC=y
> CONFIG_USB_G_PRINTER=y
> CONFIG_USB_G_HID=y
> CONFIG_USB_G_WEBCAM=y
> CONFIG_USB_RAW_GADGET=y
> # end of USB Gadget precomposed configurations
> 
> CONFIG_TYPEC=y
> CONFIG_TYPEC_TCPM=y
> CONFIG_TYPEC_TCPCI=y
> # CONFIG_TYPEC_RT1711H is not set
> CONFIG_TYPEC_MT6360=y
> # CONFIG_TYPEC_TCPCI_MT6370 is not set
> CONFIG_TYPEC_TCPCI_MAXIM=y
> CONFIG_TYPEC_FUSB302=y
> CONFIG_TYPEC_UCSI=y
> # CONFIG_UCSI_CCG is not set
> CONFIG_UCSI_STM32G0=y
> # CONFIG_TYPEC_TPS6598X is not set
> # CONFIG_TYPEC_ANX7411 is not set
> # CONFIG_TYPEC_RT1719 is not set
> # CONFIG_TYPEC_HD3SS3220 is not set
> # CONFIG_TYPEC_STUSB160X is not set
> # CONFIG_TYPEC_QCOM_PMIC is not set
> # CONFIG_TYPEC_WUSB3801 is not set
> 
> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> CONFIG_TYPEC_MUX_FSA4480=y
> # CONFIG_TYPEC_MUX_PI3USB30532 is not set
> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
> 
> #
> # USB Type-C Alternate Mode drivers
> #
> CONFIG_TYPEC_DP_ALTMODE=y
> CONFIG_TYPEC_NVIDIA_ALTMODE=y
> # end of USB Type-C Alternate Mode drivers
> 
> CONFIG_USB_ROLE_SWITCH=y
> CONFIG_MMC=y
> CONFIG_PWRSEQ_EMMC=y
> CONFIG_PWRSEQ_SIMPLE=y
> # CONFIG_MMC_TEST is not set
> 
> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> # CONFIG_MMC_SUNPLUS is not set
> # CONFIG_MMC_SDHCI is not set
> # CONFIG_MMC_MESON_GX is not set
> # CONFIG_MMC_MESON_MX_SDHC is not set
> # CONFIG_MMC_MESON_MX_SDIO is not set
> # CONFIG_MMC_MOXART is not set
> # CONFIG_MMC_OMAP_HS is not set
> # CONFIG_MMC_DAVINCI is not set
> # CONFIG_MMC_S3C is not set
> # CONFIG_MMC_TMIO is not set
> # CONFIG_MMC_SDHI is not set
> # CONFIG_MMC_UNIPHIER is not set
> # CONFIG_MMC_DW is not set
> # CONFIG_MMC_SH_MMCIF is not set
> CONFIG_MMC_VUB300=y
> # CONFIG_MMC_USHC is not set
> CONFIG_MMC_USDHI6ROL0=y
> CONFIG_MMC_REALTEK_USB=y
> CONFIG_MMC_CQHCI=y
> CONFIG_MMC_HSQ=y
> # CONFIG_MMC_BCM2835 is not set
> CONFIG_MMC_MTK=y
> # CONFIG_MMC_OWL is not set
> # CONFIG_MMC_LITEX is not set
> CONFIG_MEMSTICK=y
> # CONFIG_MEMSTICK_DEBUG is not set
> 
> #
> # MemoryStick drivers
> #
> # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> 
> #
> # MemoryStick Host Controller Drivers
> #
> # CONFIG_MEMSTICK_REALTEK_USB is not set
> CONFIG_NEW_LEDS=y
> CONFIG_LEDS_CLASS=y
> # CONFIG_LEDS_CLASS_FLASH is not set
> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> 
> #
> # LED drivers
> #
> # CONFIG_LEDS_AN30259A is not set
> # CONFIG_LEDS_ARIEL is not set
> CONFIG_LEDS_AW2013=y
> # CONFIG_LEDS_BCM6328 is not set
> CONFIG_LEDS_BCM6358=y
> CONFIG_LEDS_LM3530=y
> # CONFIG_LEDS_LM3532 is not set
> CONFIG_LEDS_LM3533=y
> CONFIG_LEDS_LM3642=y
> CONFIG_LEDS_LM3692X=y
> # CONFIG_LEDS_MT6323 is not set
> # CONFIG_LEDS_S3C24XX is not set
> # CONFIG_LEDS_COBALT_QUBE is not set
> # CONFIG_LEDS_COBALT_RAQ is not set
> CONFIG_LEDS_GPIO=y
> # CONFIG_LEDS_LP3944 is not set
> CONFIG_LEDS_LP3952=y
> # CONFIG_LEDS_LP50XX is not set
> CONFIG_LEDS_LP55XX_COMMON=y
> # CONFIG_LEDS_LP5521 is not set
> # CONFIG_LEDS_LP5523 is not set
> CONFIG_LEDS_LP5562=y
> CONFIG_LEDS_LP8501=y
> CONFIG_LEDS_LP8788=y
> CONFIG_LEDS_LP8860=y
> CONFIG_LEDS_PCA955X=y
> # CONFIG_LEDS_PCA955X_GPIO is not set
> CONFIG_LEDS_PCA963X=y
> # CONFIG_LEDS_WM831X_STATUS is not set
> CONFIG_LEDS_DA903X=y
> CONFIG_LEDS_DA9052=y
> CONFIG_LEDS_REGULATOR=y
> # CONFIG_LEDS_BD2802 is not set
> # CONFIG_LEDS_LT3593 is not set
> CONFIG_LEDS_NS2=y
> CONFIG_LEDS_NETXBIG=y
> # CONFIG_LEDS_TCA6507 is not set
> CONFIG_LEDS_TLC591XX=y
> # CONFIG_LEDS_MAX77650 is not set
> # CONFIG_LEDS_MAX8997 is not set
> # CONFIG_LEDS_LM355x is not set
> # CONFIG_LEDS_OT200 is not set
> CONFIG_LEDS_MENF21BMC=y
> CONFIG_LEDS_IS31FL319X=y
> # CONFIG_LEDS_IS31FL32XX is not set
> 
> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> CONFIG_LEDS_SYSCON=y
> # CONFIG_LEDS_MLXREG is not set
> CONFIG_LEDS_USER=y
> CONFIG_LEDS_TI_LMU_COMMON=y
> # CONFIG_LEDS_LM3697 is not set
> CONFIG_LEDS_LM36274=y
> # CONFIG_LEDS_IP30 is not set
> # CONFIG_LEDS_BCM63138 is not set
> # CONFIG_LEDS_LGM is not set
> 
> #
> # Flash and Torch LED drivers
> #
> 
> #
> # RGB LED drivers
> #
> 
> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> 
> #
> # Simple LED drivers
> #
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> # CONFIG_RTC_CLASS is not set
> # CONFIG_DMADEVICES is not set
> 
> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=y
> CONFIG_SW_SYNC=y
> CONFIG_UDMABUF=y
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> CONFIG_DMABUF_DEBUG=y
> # CONFIG_DMABUF_SELFTESTS is not set
> CONFIG_DMABUF_HEAPS=y
> # CONFIG_DMABUF_SYSFS_STATS is not set
> CONFIG_DMABUF_HEAPS_SYSTEM=y
> # end of DMABUF options
> 
> CONFIG_AUXDISPLAY=y
> CONFIG_CHARLCD=y
> CONFIG_LINEDISP=y
> CONFIG_HD44780_COMMON=y
> # CONFIG_HD44780 is not set
> CONFIG_IMG_ASCII_LCD=y
> CONFIG_LCD2S=y
> CONFIG_PARPORT_PANEL=y
> CONFIG_PANEL_PARPORT=0
> CONFIG_PANEL_PROFILE=5
> CONFIG_PANEL_CHANGE_MESSAGE=y
> CONFIG_PANEL_BOOT_MESSAGE=""
> # CONFIG_CHARLCD_BL_OFF is not set
> # CONFIG_CHARLCD_BL_ON is not set
> CONFIG_CHARLCD_BL_FLASH=y
> CONFIG_PANEL=y
> CONFIG_UIO=y
> CONFIG_UIO_PDRV_GENIRQ=y
> CONFIG_UIO_DMEM_GENIRQ=y
> CONFIG_UIO_PRUSS=y
> # CONFIG_VFIO is not set
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO_ANCHOR=y
> CONFIG_VIRTIO=y
> # CONFIG_VIRTIO_MENU is not set
> # CONFIG_VDPA is not set
> CONFIG_VHOST_IOTLB=y
> CONFIG_VHOST=y
> CONFIG_VHOST_MENU=y
> CONFIG_VHOST_NET=y
> CONFIG_VHOST_VSOCK=y
> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y
> 
> #
> # Microsoft Hyper-V guest support
> #
> # end of Microsoft Hyper-V guest support
> 
> # CONFIG_GREYBUS is not set
> # CONFIG_COMEDI is not set
> CONFIG_STAGING=y
> 
> #
> # IIO staging drivers
> #
> 
> #
> # Accelerometers
> #
> # end of Accelerometers
> 
> #
> # Analog to digital converters
> #
> # end of Analog to digital converters
> 
> #
> # Analog digital bi-direction converters
> #
> # CONFIG_ADT7316 is not set
> # end of Analog digital bi-direction converters
> 
> #
> # Direct Digital Synthesis
> #
> # end of Direct Digital Synthesis
> 
> #
> # Network Analyzer, Impedance Converters
> #
> # CONFIG_AD5933 is not set
> # end of Network Analyzer, Impedance Converters
> 
> #
> # Active energy metering IC
> #
> CONFIG_ADE7854=y
> CONFIG_ADE7854_I2C=y
> # end of Active energy metering IC
> 
> #
> # Resolver to digital converters
> #
> # end of Resolver to digital converters
> # end of IIO staging drivers
> 
> # CONFIG_USB_EMXX is not set
> # CONFIG_STAGING_MEDIA is not set
> CONFIG_STAGING_BOARD=y
> CONFIG_MOST_COMPONENTS=y
> CONFIG_MOST_NET=y
> CONFIG_MOST_VIDEO=y
> CONFIG_MOST_DIM2=y
> # CONFIG_MOST_I2C is not set
> CONFIG_BCM_VIDEOCORE=y
> # CONFIG_BCM2835_VCHIQ is not set
> # CONFIG_VIDEO_BCM2835 is not set
> # CONFIG_XIL_AXIS_FIFO is not set
> CONFIG_FIELDBUS_DEV=y
> CONFIG_HMS_ANYBUSS_BUS=y
> CONFIG_ARCX_ANYBUS_CONTROLLER=y
> CONFIG_HMS_PROFINET=y
> # CONFIG_GOLDFISH is not set
> # CONFIG_CHROME_PLATFORMS is not set
> # CONFIG_MELLANOX_PLATFORM is not set
> # CONFIG_OLPC_XO175 is not set
> CONFIG_SURFACE_PLATFORMS=y
> CONFIG_HAVE_CLK=y
> CONFIG_HAVE_CLK_PREPARE=y
> CONFIG_COMMON_CLK=y
> # CONFIG_COMMON_CLK_WM831X is not set
> 
> #
> # Clock driver for ARM Reference designs
> #
> # CONFIG_CLK_ICST is not set
> # CONFIG_CLK_SP810 is not set
> # end of Clock driver for ARM Reference designs
> 
> # CONFIG_CLK_HSDK is not set
> # CONFIG_COMMON_CLK_APPLE_NCO is not set
> CONFIG_COMMON_CLK_MAX77686=y
> CONFIG_COMMON_CLK_MAX9485=y
> # CONFIG_COMMON_CLK_RK808 is not set
> # CONFIG_COMMON_CLK_HI655X is not set
> # CONFIG_COMMON_CLK_SCMI is not set
> # CONFIG_COMMON_CLK_SCPI is not set
> # CONFIG_COMMON_CLK_SI5341 is not set
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI514 is not set
> CONFIG_COMMON_CLK_SI544=y
> # CONFIG_COMMON_CLK_SI570 is not set
> # CONFIG_COMMON_CLK_BM1880 is not set
> CONFIG_COMMON_CLK_CDCE706=y
> # CONFIG_COMMON_CLK_TPS68470 is not set
> # CONFIG_COMMON_CLK_CDCE925 is not set
> CONFIG_COMMON_CLK_CS2000_CP=y
> # CONFIG_COMMON_CLK_EN7523 is not set
> # CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
> # CONFIG_COMMON_CLK_FSL_SAI is not set
> # CONFIG_COMMON_CLK_GEMINI is not set
> # CONFIG_COMMON_CLK_LAN966X is not set
> # CONFIG_COMMON_CLK_ASPEED is not set
> # CONFIG_COMMON_CLK_S2MPS11 is not set
> # CONFIG_CLK_TWL6040 is not set
> # CONFIG_COMMON_CLK_AXI_CLKGEN is not set
> # CONFIG_CLK_QORIQ is not set
> # CONFIG_CLK_LS1028A_PLLDIG is not set
> # CONFIG_COMMON_CLK_XGENE is not set
> # CONFIG_COMMON_CLK_LOCHNAGAR is not set
> # CONFIG_COMMON_CLK_OXNAS is not set
> # CONFIG_COMMON_CLK_RS9_PCIE is not set
> CONFIG_COMMON_CLK_VC5=y
> # CONFIG_COMMON_CLK_VC7 is not set
> # CONFIG_COMMON_CLK_MMP2_AUDIO is not set
> # CONFIG_COMMON_CLK_BD718XX is not set
> CONFIG_COMMON_CLK_FIXED_MMIO=y
> # CONFIG_CLK_ACTIONS is not set
> # CONFIG_CLK_BAIKAL_T1 is not set
> # CONFIG_CLK_BCM2711_DVP is not set
> # CONFIG_CLK_BCM2835 is not set
> # CONFIG_CLK_BCM_63XX is not set
> # CONFIG_CLK_BCM_63XX_GATE is not set
> # CONFIG_CLK_BCM_KONA is not set
> # CONFIG_CLK_BCM_CYGNUS is not set
> # CONFIG_CLK_BCM_HR2 is not set
> # CONFIG_CLK_BCM_NSP is not set
> # CONFIG_CLK_BCM_NS2 is not set
> # CONFIG_CLK_BCM_SR is not set
> # CONFIG_CLK_RASPBERRYPI is not set
> # CONFIG_COMMON_CLK_HI3516CV300 is not set
> # CONFIG_COMMON_CLK_HI3519 is not set
> # CONFIG_COMMON_CLK_HI3559A is not set
> # CONFIG_COMMON_CLK_HI3660 is not set
> # CONFIG_COMMON_CLK_HI3670 is not set
> # CONFIG_COMMON_CLK_HI3798CV200 is not set
> # CONFIG_COMMON_CLK_HI6220 is not set
> # CONFIG_RESET_HISI is not set
> # CONFIG_STUB_CLK_HI6220 is not set
> # CONFIG_STUB_CLK_HI3660 is not set
> # CONFIG_COMMON_CLK_BOSTON is not set
> # CONFIG_MXC_CLK is not set
> # CONFIG_CLK_IMX8MM is not set
> # CONFIG_CLK_IMX8MN is not set
> # CONFIG_CLK_IMX8MP is not set
> # CONFIG_CLK_IMX8MQ is not set
> # CONFIG_CLK_IMX8ULP is not set
> # CONFIG_CLK_IMX93 is not set
> 
> #
> # Ingenic SoCs drivers
> #
> # CONFIG_INGENIC_CGU_JZ4740 is not set
> # CONFIG_INGENIC_CGU_JZ4755 is not set
> # CONFIG_INGENIC_CGU_JZ4725B is not set
> # CONFIG_INGENIC_CGU_JZ4760 is not set
> # CONFIG_INGENIC_CGU_JZ4770 is not set
> # CONFIG_INGENIC_CGU_JZ4780 is not set
> # CONFIG_INGENIC_CGU_X1000 is not set
> # CONFIG_INGENIC_CGU_X1830 is not set
> # CONFIG_INGENIC_TCU_CLK is not set
> # end of Ingenic SoCs drivers
> 
> # CONFIG_COMMON_CLK_KEYSTONE is not set
> # CONFIG_TI_SYSCON_CLK is not set
> 
> #
> # Clock driver for MediaTek SoC
> #
> # CONFIG_COMMON_CLK_MEDIATEK_FHCTL is not set
> # CONFIG_COMMON_CLK_MT2701 is not set
> # CONFIG_COMMON_CLK_MT2712 is not set
> # CONFIG_COMMON_CLK_MT6765 is not set
> # CONFIG_COMMON_CLK_MT6779 is not set
> # CONFIG_COMMON_CLK_MT6795 is not set
> # CONFIG_COMMON_CLK_MT6797 is not set
> # CONFIG_COMMON_CLK_MT7622 is not set
> # CONFIG_COMMON_CLK_MT7629 is not set
> # CONFIG_COMMON_CLK_MT7986 is not set
> # CONFIG_COMMON_CLK_MT8135 is not set
> # CONFIG_COMMON_CLK_MT8167 is not set
> # CONFIG_COMMON_CLK_MT8173 is not set
> # CONFIG_COMMON_CLK_MT8183 is not set
> # CONFIG_COMMON_CLK_MT8186 is not set
> # CONFIG_COMMON_CLK_MT8192 is not set
> # CONFIG_COMMON_CLK_MT8195 is not set
> # CONFIG_COMMON_CLK_MT8365 is not set
> # CONFIG_COMMON_CLK_MT8516 is not set
> # end of Clock driver for MediaTek SoC
> 
> #
> # Clock support for Amlogic platforms
> #
> # end of Clock support for Amlogic platforms
> 
> # CONFIG_MSTAR_MSC313_CPUPLL is not set
> # CONFIG_MSTAR_MSC313_MPLL is not set
> # CONFIG_MCHP_CLK_MPFS is not set
> # CONFIG_COMMON_CLK_PISTACHIO is not set
> # CONFIG_COMMON_CLK_QCOM is not set
> # CONFIG_CLK_MT7621 is not set
> # CONFIG_CLK_RENESAS is not set
> # CONFIG_COMMON_CLK_SAMSUNG is not set
> # CONFIG_S3C2410_COMMON_CLK is not set
> # CONFIG_S3C2412_COMMON_CLK is not set
> # CONFIG_S3C2443_COMMON_CLK is not set
> # CONFIG_CLK_SIFIVE is not set
> # CONFIG_CLK_INTEL_SOCFPGA is not set
> # CONFIG_SPRD_COMMON_CLK is not set
> # CONFIG_CLK_STARFIVE_JH7100 is not set
> CONFIG_CLK_SUNXI=y
> CONFIG_CLK_SUNXI_CLOCKS=y
> CONFIG_CLK_SUNXI_PRCM_SUN6I=y
> CONFIG_CLK_SUNXI_PRCM_SUN8I=y
> CONFIG_CLK_SUNXI_PRCM_SUN9I=y
> # CONFIG_SUNXI_CCU is not set
> # CONFIG_COMMON_CLK_TI_ADPLL is not set
> # CONFIG_CLK_UNIPHIER is not set
> # CONFIG_COMMON_CLK_VISCONTI is not set
> # CONFIG_CLK_LGM_CGU is not set
> CONFIG_XILINX_VCU=y
> # CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
> # CONFIG_COMMON_CLK_ZYNQMP is not set
> CONFIG_CLK_KUNIT_TEST=y
> CONFIG_CLK_GATE_KUNIT_TEST=y
> # CONFIG_HWSPINLOCK is not set
> 
> #
> # Clock Source drivers
> #
> CONFIG_TIMER_OF=y
> CONFIG_TIMER_PROBE=y
> # CONFIG_BCM2835_TIMER is not set
> # CONFIG_BCM_KONA_TIMER is not set
> # CONFIG_DAVINCI_TIMER is not set
> # CONFIG_DIGICOLOR_TIMER is not set
> # CONFIG_OMAP_DM_TIMER is not set
> # CONFIG_DW_APB_TIMER is not set
> # CONFIG_FTTMR010_TIMER is not set
> # CONFIG_IXP4XX_TIMER is not set
> # CONFIG_MESON6_TIMER is not set
> # CONFIG_OWL_TIMER is not set
> # CONFIG_RDA_TIMER is not set
> # CONFIG_SUN4I_TIMER is not set
> # CONFIG_SUN5I_HSTIMER is not set
> # CONFIG_TEGRA_TIMER is not set
> # CONFIG_TEGRA186_TIMER is not set
> # CONFIG_VT8500_TIMER is not set
> # CONFIG_NPCM7XX_TIMER is not set
> # CONFIG_CADENCE_TTC_TIMER is not set
> # CONFIG_ASM9260_TIMER is not set
> # CONFIG_CLKSRC_DBX500_PRCMU is not set
> # CONFIG_CLPS711X_TIMER is not set
> # CONFIG_MXS_TIMER is not set
> # CONFIG_NSPIRE_TIMER is not set
> # CONFIG_INTEGRATOR_AP_TIMER is not set
> # CONFIG_CLKSRC_PISTACHIO is not set
> # CONFIG_CLKSRC_TI_32K is not set
> # CONFIG_CLKSRC_STM32_LP is not set
> # CONFIG_CLKSRC_MPS2 is not set
> CONFIG_ARC_TIMERS=y
> # CONFIG_ARC_TIMERS_64BIT is not set
> # CONFIG_ARM_TIMER_SP804 is not set
> # CONFIG_ARMV7M_SYSTICK is not set
> # CONFIG_ATMEL_PIT is not set
> # CONFIG_ATMEL_ST is not set
> # CONFIG_CLKSRC_SAMSUNG_PWM is not set
> # CONFIG_FSL_FTM_TIMER is not set
> # CONFIG_OXNAS_RPS_TIMER is not set
> # CONFIG_MTK_TIMER is not set
> # CONFIG_SPRD_TIMER is not set
> # CONFIG_CLKSRC_JCORE_PIT is not set
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_RENESAS_OSTM is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> # CONFIG_CLKSRC_VERSATILE is not set
> # CONFIG_CLKSRC_PXA is not set
> # CONFIG_TIMER_IMX_SYS_CTR is not set
> # CONFIG_CLKSRC_ST_LPC is not set
> # CONFIG_GXP_TIMER is not set
> # CONFIG_MSC313E_TIMER is not set
> # CONFIG_INGENIC_TIMER is not set
> # CONFIG_INGENIC_SYSOST is not set
> # CONFIG_INGENIC_OST is not set
> # CONFIG_MICROCHIP_PIT64B is not set
> # end of Clock Source drivers
> 
> CONFIG_MAILBOX=y
> # CONFIG_IMX_MBOX is not set
> CONFIG_PLATFORM_MHU=y
> # CONFIG_ARMADA_37XX_RWTM_MBOX is not set
> # CONFIG_ROCKCHIP_MBOX is not set
> CONFIG_ALTERA_MBOX=y
> # CONFIG_HI3660_MBOX is not set
> # CONFIG_HI6220_MBOX is not set
> CONFIG_MAILBOX_TEST=y
> # CONFIG_POLARFIRE_SOC_MAILBOX is not set
> # CONFIG_QCOM_APCS_IPC is not set
> # CONFIG_BCM_PDC_MBOX is not set
> # CONFIG_STM32_IPCC is not set
> # CONFIG_MTK_ADSP_MBOX is not set
> # CONFIG_MTK_CMDQ_MBOX is not set
> # CONFIG_SUN6I_MSGBOX is not set
> # CONFIG_SPRD_MBOX is not set
> # CONFIG_QCOM_IPCC is not set
> # CONFIG_IOMMU_SUPPORT is not set
> 
> #
> # Remoteproc drivers
> #
> # CONFIG_REMOTEPROC is not set
> # end of Remoteproc drivers
> 
> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=y
> CONFIG_RPMSG_CHAR=y
> # CONFIG_RPMSG_CTRL is not set
> CONFIG_RPMSG_NS=y
> CONFIG_RPMSG_QCOM_GLINK=y
> CONFIG_RPMSG_QCOM_GLINK_RPM=y
> CONFIG_RPMSG_VIRTIO=y
> # end of Rpmsg drivers
> 
> # CONFIG_SOUNDWIRE is not set
> 
> #
> # SOC (System On Chip) specific Drivers
> #
> 
> #
> # Amlogic SoC drivers
> #
> # CONFIG_MESON_CANVAS is not set
> # CONFIG_MESON_CLK_MEASURE is not set
> # CONFIG_MESON_GX_SOCINFO is not set
> # CONFIG_MESON_MX_SOCINFO is not set
> # end of Amlogic SoC drivers
> 
> #
> # Apple SoC drivers
> #
> # CONFIG_APPLE_RTKIT is not set
> # CONFIG_APPLE_SART is not set
> # end of Apple SoC drivers
> 
> #
> # ASPEED SoC drivers
> #
> # CONFIG_ASPEED_LPC_CTRL is not set
> # CONFIG_ASPEED_LPC_SNOOP is not set
> # CONFIG_ASPEED_UART_ROUTING is not set
> # CONFIG_ASPEED_P2A_CTRL is not set
> # CONFIG_ASPEED_SOCINFO is not set
> # end of ASPEED SoC drivers
> 
> # CONFIG_AT91_SOC_ID is not set
> # CONFIG_AT91_SOC_SFR is not set
> 
> #
> # Broadcom SoC drivers
> #
> # CONFIG_BCM2835_POWER is not set
> # CONFIG_SOC_BCM63XX is not set
> # CONFIG_SOC_BRCMSTB is not set
> # CONFIG_BCM_PMB is not set
> # end of Broadcom SoC drivers
> 
> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # CONFIG_QUICC_ENGINE is not set
> CONFIG_DPAA2_CONSOLE=y
> # end of NXP/Freescale QorIQ SoC drivers
> 
> #
> # fujitsu SoC drivers
> #
> # end of fujitsu SoC drivers
> 
> #
> # i.MX SoC drivers
> #
> # CONFIG_SOC_IMX8M is not set
> # CONFIG_SOC_IMX9 is not set
> # end of i.MX SoC drivers
> 
> #
> # IXP4xx SoC drivers
> #
> # CONFIG_IXP4XX_QMGR is not set
> # CONFIG_IXP4XX_NPE is not set
> # end of IXP4xx SoC drivers
> 
> #
> # Enable LiteX SoC Builder specific drivers
> #
> # CONFIG_LITEX_SOC_CONTROLLER is not set
> # end of Enable LiteX SoC Builder specific drivers
> 
> # CONFIG_LOONGSON2_GUTS is not set
> 
> #
> # MediaTek SoC drivers
> #
> # CONFIG_MTK_CMDQ is not set
> # CONFIG_MTK_DEVAPC is not set
> # CONFIG_MTK_INFRACFG is not set
> # CONFIG_MTK_PMIC_WRAP is not set
> # CONFIG_MTK_SCPSYS is not set
> # CONFIG_MTK_MMSYS is not set
> # end of MediaTek SoC drivers
> 
> #
> # Qualcomm SoC drivers
> #
> # CONFIG_QCOM_COMMAND_DB is not set
> # CONFIG_QCOM_GENI_SE is not set
> # CONFIG_QCOM_GSBI is not set
> # CONFIG_QCOM_LLCC is not set
> # CONFIG_QCOM_RPMH is not set
> # CONFIG_QCOM_SMD_RPM is not set
> # CONFIG_QCOM_SPM is not set
> # CONFIG_QCOM_WCNSS_CTRL is not set
> # CONFIG_QCOM_APR is not set
> # CONFIG_QCOM_ICC_BWMON is not set
> # end of Qualcomm SoC drivers
> 
> # CONFIG_SOC_RENESAS is not set
> # CONFIG_ROCKCHIP_GRF is not set
> # CONFIG_ROCKCHIP_IODOMAIN is not set
> # CONFIG_SOC_SAMSUNG is not set
> # CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
> # CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
> CONFIG_SOC_TI=y
> # CONFIG_UX500_SOC_ID is not set
> 
> #
> # Xilinx SoC drivers
> #
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> 
> CONFIG_PM_DEVFREQ=y
> 
> #
> # DEVFREQ Governors
> #
> # CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND is not set
> CONFIG_DEVFREQ_GOV_PERFORMANCE=y
> # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
> # CONFIG_DEVFREQ_GOV_USERSPACE is not set
> # CONFIG_DEVFREQ_GOV_PASSIVE is not set
> 
> #
> # DEVFREQ Drivers
> #
> # CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
> # CONFIG_ARM_IMX_BUS_DEVFREQ is not set
> # CONFIG_ARM_TEGRA_DEVFREQ is not set
> # CONFIG_ARM_MEDIATEK_CCI_DEVFREQ is not set
> # CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ is not set
> # CONFIG_PM_DEVFREQ_EVENT is not set
> CONFIG_EXTCON=y
> 
> #
> # Extcon Device Drivers
> #
> CONFIG_EXTCON_ADC_JACK=y
> CONFIG_EXTCON_GPIO=y
> # CONFIG_EXTCON_MAX14577 is not set
> CONFIG_EXTCON_MAX3355=y
> # CONFIG_EXTCON_MAX8997 is not set
> CONFIG_EXTCON_PTN5150=y
> # CONFIG_EXTCON_QCOM_SPMI_MISC is not set
> # CONFIG_EXTCON_RT8973A is not set
> # CONFIG_EXTCON_SM5502 is not set
> # CONFIG_EXTCON_USB_GPIO is not set
> # CONFIG_EXTCON_USBC_TUSB320 is not set
> # CONFIG_MEMORY is not set
> CONFIG_IIO=y
> CONFIG_IIO_BUFFER=y
> CONFIG_IIO_BUFFER_CB=y
> CONFIG_IIO_BUFFER_DMA=y
> CONFIG_IIO_BUFFER_DMAENGINE=y
> CONFIG_IIO_BUFFER_HW_CONSUMER=y
> CONFIG_IIO_KFIFO_BUF=y
> CONFIG_IIO_TRIGGERED_BUFFER=y
> CONFIG_IIO_CONFIGFS=y
> CONFIG_IIO_TRIGGER=y
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
> # CONFIG_IIO_SW_DEVICE is not set
> CONFIG_IIO_SW_TRIGGER=y
> # CONFIG_IIO_TRIGGERED_EVENT is not set
> 
> #
> # Accelerometers
> #
> CONFIG_ADXL313=y
> CONFIG_ADXL313_I2C=y
> CONFIG_ADXL345=y
> CONFIG_ADXL345_I2C=y
> CONFIG_ADXL355=y
> CONFIG_ADXL355_I2C=y
> # CONFIG_ADXL367_I2C is not set
> # CONFIG_ADXL372_I2C is not set
> CONFIG_BMA180=y
> # CONFIG_BMA400 is not set
> # CONFIG_BMC150_ACCEL is not set
> # CONFIG_DA280 is not set
> CONFIG_DA311=y
> CONFIG_DMARD06=y
> # CONFIG_DMARD09 is not set
> CONFIG_DMARD10=y
> CONFIG_FXLS8962AF=y
> CONFIG_FXLS8962AF_I2C=y
> CONFIG_IIO_ST_ACCEL_3AXIS=y
> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=y
> # CONFIG_IIO_KX022A_I2C is not set
> CONFIG_KXSD9=y
> CONFIG_KXSD9_I2C=y
> # CONFIG_KXCJK1013 is not set
> CONFIG_MC3230=y
> CONFIG_MMA7455=y
> CONFIG_MMA7455_I2C=y
> CONFIG_MMA7660=y
> # CONFIG_MMA8452 is not set
> CONFIG_MMA9551_CORE=y
> CONFIG_MMA9551=y
> # CONFIG_MMA9553 is not set
> CONFIG_MSA311=y
> # CONFIG_MXC4005 is not set
> CONFIG_MXC6255=y
> CONFIG_STK8312=y
> CONFIG_STK8BA50=y
> # end of Accelerometers
> 
> #
> # Analog to digital converters
> #
> # CONFIG_AD7091R5 is not set
> # CONFIG_AD7291 is not set
> CONFIG_AD7606=y
> CONFIG_AD7606_IFACE_PARALLEL=y
> CONFIG_AD799X=y
> CONFIG_ADI_AXI_ADC=y
> # CONFIG_ASPEED_ADC is not set
> # CONFIG_AT91_SAMA5D2_ADC is not set
> CONFIG_AXP20X_ADC=y
> # CONFIG_AXP288_ADC is not set
> # CONFIG_BCM_IPROC_ADC is not set
> # CONFIG_BERLIN2_ADC is not set
> # CONFIG_CC10001_ADC is not set
> CONFIG_DA9150_GPADC=y
> CONFIG_DLN2_ADC=y
> CONFIG_ENVELOPE_DETECTOR=y
> # CONFIG_EXYNOS_ADC is not set
> CONFIG_HX711=y
> # CONFIG_INGENIC_ADC is not set
> # CONFIG_IMX7D_ADC is not set
> # CONFIG_IMX8QXP_ADC is not set
> CONFIG_LP8788_ADC=y
> # CONFIG_LPC18XX_ADC is not set
> # CONFIG_LPC32XX_ADC is not set
> CONFIG_LTC2471=y
> # CONFIG_LTC2485 is not set
> CONFIG_LTC2497=y
> CONFIG_MAX1363=y
> # CONFIG_MAX9611 is not set
> CONFIG_MCP3422=y
> CONFIG_MEDIATEK_MT6360_ADC=y
> CONFIG_MEDIATEK_MT6370_ADC=y
> # CONFIG_MEDIATEK_MT6577_AUXADC is not set
> # CONFIG_MEN_Z188_ADC is not set
> # CONFIG_MESON_SARADC is not set
> CONFIG_MP2629_ADC=y
> # CONFIG_NAU7802 is not set
> # CONFIG_NPCM_ADC is not set
> CONFIG_QCOM_VADC_COMMON=y
> CONFIG_QCOM_SPMI_IADC=y
> # CONFIG_QCOM_SPMI_VADC is not set
> CONFIG_QCOM_SPMI_ADC5=y
> # CONFIG_RCAR_GYRO_ADC is not set
> # CONFIG_ROCKCHIP_SARADC is not set
> # CONFIG_RICHTEK_RTQ6056 is not set
> # CONFIG_RZG2L_ADC is not set
> # CONFIG_SC27XX_ADC is not set
> # CONFIG_SPEAR_ADC is not set
> CONFIG_SD_ADC_MODULATOR=y
> # CONFIG_STM32_ADC_CORE is not set
> # CONFIG_STM32_DFSDM_CORE is not set
> # CONFIG_STM32_DFSDM_ADC is not set
> CONFIG_STMPE_ADC=y
> # CONFIG_TI_ADC081C is not set
> CONFIG_TI_ADS1015=y
> CONFIG_TI_AM335X_ADC=y
> CONFIG_VF610_ADC=y
> CONFIG_XILINX_XADC=y
> # CONFIG_XILINX_AMS is not set
> # end of Analog to digital converters
> 
> #
> # Analog to digital and digital to analog converters
> #
> # end of Analog to digital and digital to analog converters
> 
> #
> # Analog Front Ends
> #
> # CONFIG_IIO_RESCALE is not set
> # end of Analog Front Ends
> 
> #
> # Amplifiers
> #
> CONFIG_HMC425=y
> # end of Amplifiers
> 
> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=y
> CONFIG_AD7746=y
> # end of Capacitance to digital converters
> 
> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=y
> CONFIG_ATLAS_EZO_SENSOR=y
> CONFIG_BME680=y
> CONFIG_BME680_I2C=y
> CONFIG_CCS811=y
> CONFIG_IAQCORE=y
> CONFIG_PMS7003=y
> # CONFIG_SCD30_CORE is not set
> CONFIG_SCD4X=y
> # CONFIG_SENSIRION_SGP30 is not set
> CONFIG_SENSIRION_SGP40=y
> CONFIG_SPS30=y
> CONFIG_SPS30_I2C=y
> # CONFIG_SPS30_SERIAL is not set
> CONFIG_SENSEAIR_SUNRISE_CO2=y
> # CONFIG_VZ89X is not set
> # end of Chemical Sensors
> 
> #
> # Hid Sensor IIO Common
> #
> # end of Hid Sensor IIO Common
> 
> CONFIG_IIO_MS_SENSORS_I2C=y
> 
> #
> # IIO SCMI Sensors
> #
> # end of IIO SCMI Sensors
> 
> #
> # SSP Sensor Common
> #
> # end of SSP Sensor Common
> 
> CONFIG_IIO_ST_SENSORS_I2C=y
> CONFIG_IIO_ST_SENSORS_CORE=y
> 
> #
> # Digital to analog converters
> #
> CONFIG_AD5064=y
> # CONFIG_AD5380 is not set
> CONFIG_AD5446=y
> CONFIG_AD5592R_BASE=y
> CONFIG_AD5593R=y
> CONFIG_AD5686=y
> CONFIG_AD5696_I2C=y
> # CONFIG_DPOT_DAC is not set
> # CONFIG_DS4424 is not set
> # CONFIG_LPC18XX_DAC is not set
> # CONFIG_M62332 is not set
> CONFIG_MAX517=y
> CONFIG_MAX5821=y
> CONFIG_MCP4725=y
> # CONFIG_STM32_DAC is not set
> # CONFIG_TI_DAC5571 is not set
> CONFIG_VF610_DAC=y
> # end of Digital to analog converters
> 
> #
> # IIO dummy driver
> #
> # end of IIO dummy driver
> 
> #
> # Filters
> #
> # end of Filters
> 
> #
> # Frequency Synthesizers DDS/PLL
> #
> 
> #
> # Clock Generator/Distribution
> #
> # end of Clock Generator/Distribution
> 
> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> # end of Phase-Locked Loop (PLL) frequency synthesizers
> # end of Frequency Synthesizers DDS/PLL
> 
> #
> # Digital gyroscope sensors
> #
> CONFIG_BMG160=y
> CONFIG_BMG160_I2C=y
> CONFIG_FXAS21002C=y
> CONFIG_FXAS21002C_I2C=y
> CONFIG_MPU3050=y
> CONFIG_MPU3050_I2C=y
> # CONFIG_IIO_ST_GYRO_3AXIS is not set
> CONFIG_ITG3200=y
> # end of Digital gyroscope sensors
> 
> #
> # Health Sensors
> #
> 
> #
> # Heart Rate Monitors
> #
> CONFIG_AFE4404=y
> CONFIG_MAX30100=y
> # CONFIG_MAX30102 is not set
> # end of Heart Rate Monitors
> # end of Health Sensors
> 
> #
> # Humidity sensors
> #
> CONFIG_AM2315=y
> CONFIG_DHT11=y
> # CONFIG_HDC100X is not set
> CONFIG_HDC2010=y
> CONFIG_HTS221=y
> CONFIG_HTS221_I2C=y
> CONFIG_HTU21=y
> CONFIG_SI7005=y
> # CONFIG_SI7020 is not set
> # end of Humidity sensors
> 
> #
> # Inertial measurement units
> #
> # CONFIG_BMI160_I2C is not set
> CONFIG_BOSCH_BNO055=y
> CONFIG_BOSCH_BNO055_SERIAL=y
> # CONFIG_BOSCH_BNO055_I2C is not set
> CONFIG_FXOS8700=y
> CONFIG_FXOS8700_I2C=y
> CONFIG_KMX61=y
> CONFIG_INV_ICM42600=y
> CONFIG_INV_ICM42600_I2C=y
> CONFIG_INV_MPU6050_IIO=y
> CONFIG_INV_MPU6050_I2C=y
> CONFIG_IIO_ST_LSM6DSX=y
> CONFIG_IIO_ST_LSM6DSX_I2C=y
> CONFIG_IIO_ST_LSM6DSX_I3C=y
> CONFIG_IIO_ST_LSM9DS0=y
> CONFIG_IIO_ST_LSM9DS0_I2C=y
> # end of Inertial measurement units
> 
> #
> # Light sensors
> #
> CONFIG_ADJD_S311=y
> CONFIG_ADUX1020=y
> CONFIG_AL3010=y
> # CONFIG_AL3320A is not set
> CONFIG_APDS9300=y
> CONFIG_APDS9960=y
> CONFIG_AS73211=y
> CONFIG_BH1750=y
> CONFIG_BH1780=y
> CONFIG_CM32181=y
> # CONFIG_CM3232 is not set
> CONFIG_CM3323=y
> # CONFIG_CM3605 is not set
> CONFIG_CM36651=y
> CONFIG_GP2AP002=y
> # CONFIG_GP2AP020A00F is not set
> CONFIG_IQS621_ALS=y
> # CONFIG_SENSORS_ISL29018 is not set
> CONFIG_SENSORS_ISL29028=y
> # CONFIG_ISL29125 is not set
> CONFIG_JSA1212=y
> # CONFIG_RPR0521 is not set
> CONFIG_SENSORS_LM3533=y
> CONFIG_LTR501=y
> CONFIG_LTRF216A=y
> CONFIG_LV0104CS=y
> CONFIG_MAX44000=y
> # CONFIG_MAX44009 is not set
> CONFIG_NOA1305=y
> CONFIG_OPT3001=y
> CONFIG_PA12203001=y
> # CONFIG_SI1133 is not set
> CONFIG_SI1145=y
> CONFIG_STK3310=y
> CONFIG_ST_UVIS25=y
> CONFIG_ST_UVIS25_I2C=y
> CONFIG_TCS3414=y
> # CONFIG_TCS3472 is not set
> CONFIG_SENSORS_TSL2563=y
> CONFIG_TSL2583=y
> # CONFIG_TSL2591 is not set
> # CONFIG_TSL2772 is not set
> CONFIG_TSL4531=y
> CONFIG_US5182D=y
> CONFIG_VCNL4000=y
> CONFIG_VCNL4035=y
> # CONFIG_VEML6030 is not set
> CONFIG_VEML6070=y
> CONFIG_VL6180=y
> # CONFIG_ZOPT2201 is not set
> # end of Light sensors
> 
> #
> # Magnetometer sensors
> #
> # CONFIG_AK8974 is not set
> CONFIG_AK8975=y
> CONFIG_AK09911=y
> # CONFIG_BMC150_MAGN_I2C is not set
> CONFIG_MAG3110=y
> # CONFIG_MMC35240 is not set
> CONFIG_IIO_ST_MAGN_3AXIS=y
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=y
> CONFIG_SENSORS_HMC5843=y
> CONFIG_SENSORS_HMC5843_I2C=y
> CONFIG_SENSORS_RM3100=y
> CONFIG_SENSORS_RM3100_I2C=y
> CONFIG_YAMAHA_YAS530=y
> # end of Magnetometer sensors
> 
> #
> # Multiplexers
> #
> # CONFIG_IIO_MUX is not set
> # end of Multiplexers
> 
> #
> # Inclinometer sensors
> #
> # end of Inclinometer sensors
> 
> CONFIG_IIO_FORMAT_KUNIT_TEST=y
> 
> #
> # Triggers - standalone
> #
> # CONFIG_IIO_HRTIMER_TRIGGER is not set
> # CONFIG_IIO_INTERRUPT_TRIGGER is not set
> # CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
> # CONFIG_IIO_STM32_TIMER_TRIGGER is not set
> CONFIG_IIO_TIGHTLOOP_TRIGGER=y
> CONFIG_IIO_SYSFS_TRIGGER=y
> # end of Triggers - standalone
> 
> #
> # Linear and angular position sensors
> #
> CONFIG_IQS624_POS=y
> # end of Linear and angular position sensors
> 
> #
> # Digital potentiometers
> #
> # CONFIG_AD5110 is not set
> CONFIG_AD5272=y
> CONFIG_DS1803=y
> CONFIG_MAX5432=y
> CONFIG_MCP4018=y
> CONFIG_MCP4531=y
> # CONFIG_TPL0102 is not set
> # end of Digital potentiometers
> 
> #
> # Digital potentiostats
> #
> CONFIG_LMP91000=y
> # end of Digital potentiostats
> 
> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=y
> CONFIG_BMP280=y
> CONFIG_BMP280_I2C=y
> # CONFIG_DLHL60D is not set
> CONFIG_DPS310=y
> CONFIG_HP03=y
> CONFIG_ICP10100=y
> # CONFIG_MPL115_I2C is not set
> CONFIG_MPL3115=y
> CONFIG_MS5611=y
> CONFIG_MS5611_I2C=y
> CONFIG_MS5637=y
> CONFIG_IIO_ST_PRESS=y
> CONFIG_IIO_ST_PRESS_I2C=y
> # CONFIG_T5403 is not set
> CONFIG_HP206C=y
> # CONFIG_ZPA2326 is not set
> # end of Pressure sensors
> 
> #
> # Lightning sensors
> #
> # end of Lightning sensors
> 
> #
> # Proximity and distance sensors
> #
> CONFIG_ISL29501=y
> # CONFIG_LIDAR_LITE_V2 is not set
> CONFIG_MB1232=y
> CONFIG_PING=y
> CONFIG_RFD77402=y
> # CONFIG_SRF04 is not set
> CONFIG_SX_COMMON=y
> # CONFIG_SX9310 is not set
> CONFIG_SX9324=y
> CONFIG_SX9360=y
> # CONFIG_SX9500 is not set
> CONFIG_SRF08=y
> CONFIG_VCNL3020=y
> # CONFIG_VL53L0X_I2C is not set
> # end of Proximity and distance sensors
> 
> #
> # Resolver to digital converters
> #
> # end of Resolver to digital converters
> 
> #
> # Temperature sensors
> #
> # CONFIG_IQS620AT_TEMP is not set
> # CONFIG_MLX90614 is not set
> CONFIG_MLX90632=y
> CONFIG_TMP006=y
> CONFIG_TMP007=y
> CONFIG_TMP117=y
> CONFIG_TSYS01=y
> # CONFIG_TSYS02D is not set
> CONFIG_MAX30208=y
> # end of Temperature sensors
> 
> # CONFIG_PWM is not set
> 
> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=y
> CONFIG_AL_FIC=y
> CONFIG_MADERA_IRQ=y
> # CONFIG_JCORE_AIC is not set
> # CONFIG_RENESAS_INTC_IRQPIN is not set
> # CONFIG_RENESAS_IRQC is not set
> # CONFIG_RENESAS_RZA1_IRQC is not set
> # CONFIG_RENESAS_RZG2L_IRQC is not set
> # CONFIG_SL28CPLD_INTC is not set
> CONFIG_TB10X_IRQC=y
> # CONFIG_TS4800_IRQ is not set
> # CONFIG_XILINX_INTC is not set
> # CONFIG_INGENIC_TCU_IRQ is not set
> # CONFIG_IRQ_UNIPHIER_AIDET is not set
> # CONFIG_MESON_IRQ_GPIO is not set
> # CONFIG_IMX_IRQSTEER is not set
> # CONFIG_IMX_INTMUX is not set
> # CONFIG_IMX_MU_MSI is not set
> # CONFIG_EXYNOS_IRQ_COMBINER is not set
> # CONFIG_MST_IRQ is not set
> # CONFIG_MCHP_EIC is not set
> # CONFIG_SUNPLUS_SP7021_INTC is not set
> # end of IRQ chip support
> 
> CONFIG_IPACK_BUS=y
> CONFIG_RESET_CONTROLLER=y
> # CONFIG_RESET_A10SR is not set
> # CONFIG_RESET_ATH79 is not set
> # CONFIG_RESET_AXS10X is not set
> # CONFIG_RESET_BCM6345 is not set
> # CONFIG_RESET_BERLIN is not set
> # CONFIG_RESET_BRCMSTB is not set
> # CONFIG_RESET_BRCMSTB_RESCAL is not set
> # CONFIG_RESET_HSDK is not set
> # CONFIG_RESET_IMX7 is not set
> # CONFIG_RESET_INTEL_GW is not set
> # CONFIG_RESET_K210 is not set
> # CONFIG_RESET_LANTIQ is not set
> # CONFIG_RESET_LPC18XX is not set
> # CONFIG_RESET_MCHP_SPARX5 is not set
> # CONFIG_RESET_MESON is not set
> # CONFIG_RESET_MESON_AUDIO_ARB is not set
> # CONFIG_RESET_NPCM is not set
> # CONFIG_RESET_PISTACHIO is not set
> # CONFIG_RESET_QCOM_AOSS is not set
> # CONFIG_RESET_QCOM_PDC is not set
> # CONFIG_RESET_RASPBERRYPI is not set
> # CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
> # CONFIG_RESET_SCMI is not set
> # CONFIG_RESET_SIMPLE is not set
> # CONFIG_RESET_SOCFPGA is not set
> # CONFIG_RESET_STARFIVE_JH7100 is not set
> # CONFIG_RESET_SUNPLUS is not set
> # CONFIG_RESET_SUNXI is not set
> # CONFIG_RESET_TI_SCI is not set
> CONFIG_RESET_TI_SYSCON=y
> # CONFIG_RESET_TI_TPS380X is not set
> # CONFIG_RESET_TN48M_CPLD is not set
> # CONFIG_RESET_UNIPHIER is not set
> # CONFIG_RESET_UNIPHIER_GLUE is not set
> # CONFIG_RESET_ZYNQ is not set
> # CONFIG_COMMON_RESET_HI3660 is not set
> # CONFIG_COMMON_RESET_HI6220 is not set
> 
> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=y
> CONFIG_GENERIC_PHY_MIPI_DPHY=y
> # CONFIG_PHY_LPC18XX_USB_OTG is not set
> # CONFIG_PHY_PISTACHIO_USB is not set
> # CONFIG_PHY_XGENE is not set
> # CONFIG_USB_LGM_PHY is not set
> # CONFIG_PHY_CAN_TRANSCEIVER is not set
> # CONFIG_PHY_SUN4I_USB is not set
> # CONFIG_PHY_SUN6I_MIPI_DPHY is not set
> # CONFIG_PHY_SUN9I_USB is not set
> # CONFIG_PHY_SUN50I_USB3 is not set
> # CONFIG_PHY_MESON8_HDMI_TX is not set
> # CONFIG_PHY_MESON8B_USB2 is not set
> # CONFIG_PHY_MESON_GXL_USB2 is not set
> # CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG is not set
> # CONFIG_PHY_MESON_G12A_USB2 is not set
> # CONFIG_PHY_MESON_G12A_USB3_PCIE is not set
> # CONFIG_PHY_MESON_AXG_PCIE is not set
> # CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG is not set
> # CONFIG_PHY_MESON_AXG_MIPI_DPHY is not set
> 
> #
> # PHY drivers for Broadcom platforms
> #
> # CONFIG_PHY_BCM63XX_USBH is not set
> # CONFIG_PHY_CYGNUS_PCIE is not set
> # CONFIG_PHY_BCM_SR_USB is not set
> CONFIG_BCM_KONA_USB2_PHY=y
> # CONFIG_PHY_BCM_NS_USB2 is not set
> # CONFIG_PHY_NS2_USB_DRD is not set
> # CONFIG_PHY_BRCM_SATA is not set
> # CONFIG_PHY_BRCM_USB is not set
> # CONFIG_PHY_BCM_SR_PCIE is not set
> # end of PHY drivers for Broadcom platforms
> 
> CONFIG_PHY_CADENCE_TORRENT=y
> CONFIG_PHY_CADENCE_DPHY=y
> CONFIG_PHY_CADENCE_DPHY_RX=y
> CONFIG_PHY_CADENCE_SIERRA=y
> # CONFIG_PHY_CADENCE_SALVO is not set
> # CONFIG_PHY_FSL_IMX8MQ_USB is not set
> # CONFIG_PHY_MIXEL_LVDS_PHY is not set
> # CONFIG_PHY_MIXEL_MIPI_DPHY is not set
> # CONFIG_PHY_FSL_IMX8M_PCIE is not set
> # CONFIG_PHY_FSL_LYNX_28G is not set
> # CONFIG_PHY_HI6220_USB is not set
> # CONFIG_PHY_HI3660_USB is not set
> # CONFIG_PHY_HI3670_USB is not set
> # CONFIG_PHY_HI3670_PCIE is not set
> # CONFIG_PHY_HISTB_COMBPHY is not set
> # CONFIG_PHY_HISI_INNO_USB2 is not set
> # CONFIG_PHY_INGENIC_USB is not set
> # CONFIG_PHY_LANTIQ_VRX200_PCIE is not set
> # CONFIG_PHY_LANTIQ_RCU_USB2 is not set
> # CONFIG_ARMADA375_USBCLUSTER_PHY is not set
> # CONFIG_PHY_BERLIN_SATA is not set
> # CONFIG_PHY_BERLIN_USB is not set
> CONFIG_PHY_MVEBU_A3700_UTMI=y
> # CONFIG_PHY_MVEBU_A38X_COMPHY is not set
> # CONFIG_PHY_MVEBU_CP110_UTMI is not set
> CONFIG_PHY_PXA_28NM_HSIC=y
> CONFIG_PHY_PXA_28NM_USB2=y
> # CONFIG_PHY_PXA_USB is not set
> # CONFIG_PHY_MMP3_USB is not set
> # CONFIG_PHY_MMP3_HSIC is not set
> # CONFIG_PHY_MTK_PCIE is not set
> # CONFIG_PHY_MTK_TPHY is not set
> # CONFIG_PHY_MTK_UFS is not set
> # CONFIG_PHY_MTK_XSPHY is not set
> # CONFIG_PHY_MTK_HDMI is not set
> # CONFIG_PHY_MTK_MIPI_DSI is not set
> # CONFIG_PHY_MTK_DP is not set
> # CONFIG_PHY_SPARX5_SERDES is not set
> CONFIG_PHY_LAN966X_SERDES=y
> # CONFIG_PHY_CPCAP_USB is not set
> CONFIG_PHY_MAPPHONE_MDM6600=y
> # CONFIG_PHY_OCELOT_SERDES is not set
> CONFIG_PHY_ATH79_USB=y
> # CONFIG_PHY_QCOM_EDP is not set
> # CONFIG_PHY_QCOM_IPQ4019_USB is not set
> # CONFIG_PHY_QCOM_PCIE2 is not set
> # CONFIG_PHY_QCOM_QMP is not set
> # CONFIG_PHY_QCOM_QUSB2 is not set
> # CONFIG_PHY_QCOM_USB_HS is not set
> # CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2 is not set
> CONFIG_PHY_QCOM_USB_HSIC=y
> # CONFIG_PHY_QCOM_USB_HS_28NM is not set
> # CONFIG_PHY_QCOM_USB_SS is not set
> # CONFIG_PHY_QCOM_IPQ806X_USB is not set
> # CONFIG_PHY_MT7621_PCI is not set
> # CONFIG_PHY_RALINK_USB is not set
> # CONFIG_PHY_RCAR_GEN3_USB3 is not set
> # CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
> # CONFIG_PHY_ROCKCHIP_INNO_HDMI is not set
> # CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
> # CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY is not set
> # CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY is not set
> # CONFIG_PHY_ROCKCHIP_PCIE is not set
> # CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
> # CONFIG_PHY_ROCKCHIP_TYPEC is not set
> # CONFIG_PHY_EXYNOS_DP_VIDEO is not set
> # CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
> # CONFIG_PHY_EXYNOS_PCIE is not set
> # CONFIG_PHY_SAMSUNG_UFS is not set
> # CONFIG_PHY_SAMSUNG_USB2 is not set
> CONFIG_PHY_EXYNOS5_USBDRD=y
> # CONFIG_PHY_UNIPHIER_USB2 is not set
> # CONFIG_PHY_UNIPHIER_USB3 is not set
> # CONFIG_PHY_UNIPHIER_PCIE is not set
> # CONFIG_PHY_UNIPHIER_AHCI is not set
> # CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
> # CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
> # CONFIG_PHY_STIH407_USB is not set
> # CONFIG_PHY_STM32_USBPHYC is not set
> # CONFIG_PHY_SUNPLUS_USB is not set
> # CONFIG_PHY_TEGRA194_P2U is not set
> # CONFIG_PHY_DA8XX_USB is not set
> # CONFIG_PHY_DM816X_USB is not set
> # CONFIG_PHY_AM654_SERDES is not set
> # CONFIG_PHY_J721E_WIZ is not set
> # CONFIG_OMAP_CONTROL_PHY is not set
> # CONFIG_TI_PIPE3 is not set
> CONFIG_PHY_TUSB1210=y
> # CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
> # CONFIG_PHY_INTEL_KEEMBAY_USB is not set
> # CONFIG_PHY_INTEL_LGM_COMBO is not set
> # CONFIG_PHY_INTEL_LGM_EMMC is not set
> # CONFIG_PHY_INTEL_THUNDERBAY_EMMC is not set
> # CONFIG_PHY_XILINX_ZYNQMP is not set
> # end of PHY Subsystem
> 
> # CONFIG_POWERCAP is not set
> CONFIG_MCB=y
> CONFIG_MCB_LPC=y
> 
> #
> # Performance monitor support
> #
> # CONFIG_ARM_CCN is not set
> # CONFIG_ARM_CMN is not set
> # CONFIG_FSL_IMX8_DDR_PMU is not set
> # CONFIG_ARM_DMC620_PMU is not set
> # CONFIG_ALIBABA_UNCORE_DRW_PMU is not set
> # CONFIG_MESON_DDR_PMU is not set
> # end of Performance monitor support
> 
> # CONFIG_RAS is not set
> 
> #
> # Android
> #
> CONFIG_ANDROID_BINDER_IPC=y
> # CONFIG_ANDROID_BINDERFS is not set
> CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
> # CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
> # end of Android
> 
> CONFIG_DAX=y
> # CONFIG_NVMEM is not set
> 
> #
> # HW tracing support
> #
> # CONFIG_STM is not set
> # CONFIG_INTEL_TH is not set
> # end of HW tracing support
> 
> CONFIG_FPGA=y
> # CONFIG_FPGA_MGR_SOCFPGA is not set
> # CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
> # CONFIG_ALTERA_PR_IP_CORE is not set
> # CONFIG_FPGA_MGR_ZYNQ_FPGA is not set
> # CONFIG_FPGA_BRIDGE is not set
> # CONFIG_FPGA_DFL is not set
> # CONFIG_FPGA_MGR_ZYNQMP_FPGA is not set
> # CONFIG_FPGA_MGR_VERSAL_FPGA is not set
> # CONFIG_FSI is not set
> # CONFIG_TEE is not set
> CONFIG_PM_OPP=y
> CONFIG_SIOX=y
> CONFIG_SIOX_BUS_GPIO=y
> # CONFIG_SLIMBUS is not set
> CONFIG_INTERCONNECT=y
> # CONFIG_INTERCONNECT_IMX is not set
> # CONFIG_INTERCONNECT_QCOM_OSM_L3 is not set
> # CONFIG_INTERCONNECT_SAMSUNG is not set
> CONFIG_COUNTER=y
> # CONFIG_104_QUAD_8 is not set
> CONFIG_INTERRUPT_CNT=y
> # CONFIG_STM32_TIMER_CNT is not set
> # CONFIG_STM32_LPTIMER_CNT is not set
> # CONFIG_TI_EQEP is not set
> CONFIG_FTM_QUADDEC=y
> CONFIG_MICROCHIP_TCB_CAPTURE=y
> # CONFIG_TI_ECAP_CAPTURE is not set
> CONFIG_MOST=y
> CONFIG_MOST_USB_HDM=y
> CONFIG_MOST_CDEV=y
> CONFIG_PECI=y
> CONFIG_PECI_CPU=y
> # CONFIG_PECI_ASPEED is not set
> # CONFIG_HTE is not set
> # end of Device Drivers
> 
> #
> # File systems
> #
> # CONFIG_VALIDATE_FS_PARSER is not set
> CONFIG_FS_POSIX_ACL=y
> CONFIG_EXPORTFS=y
> # CONFIG_EXPORTFS_BLOCK_OPS is not set
> # CONFIG_FILE_LOCKING is not set
> # CONFIG_FS_ENCRYPTION is not set
> # CONFIG_FS_VERITY is not set
> CONFIG_FSNOTIFY=y
> CONFIG_DNOTIFY=y
> # CONFIG_INOTIFY_USER is not set
> # CONFIG_FANOTIFY is not set
> # CONFIG_QUOTA is not set
> CONFIG_AUTOFS4_FS=y
> CONFIG_AUTOFS_FS=y
> CONFIG_FUSE_FS=y
> CONFIG_CUSE=y
> CONFIG_VIRTIO_FS=y
> CONFIG_OVERLAY_FS=y
> CONFIG_OVERLAY_FS_REDIRECT_DIR=y
> CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
> CONFIG_OVERLAY_FS_INDEX=y
> CONFIG_OVERLAY_FS_METACOPY=y
> 
> #
> # Caches
> #
> CONFIG_NETFS_SUPPORT=y
> CONFIG_NETFS_STATS=y
> CONFIG_FSCACHE=y
> # CONFIG_FSCACHE_STATS is not set
> CONFIG_FSCACHE_DEBUG=y
> # end of Caches
> 
> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=y
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_SYSCTL=y
> # CONFIG_PROC_PAGE_MONITOR is not set
> CONFIG_PROC_CHILDREN=y
> CONFIG_KERNFS=y
> CONFIG_SYSFS=y
> CONFIG_TMPFS=y
> CONFIG_TMPFS_POSIX_ACL=y
> CONFIG_TMPFS_XATTR=y
> CONFIG_MEMFD_CREATE=y
> CONFIG_CONFIGFS_FS=y
> # end of Pseudo filesystems
> 
> # CONFIG_MISC_FILESYSTEMS is not set
> CONFIG_NETWORK_FILESYSTEMS=y
> # CONFIG_CEPH_FS is not set
> # CONFIG_CIFS is not set
> CONFIG_CODA_FS=y
> # CONFIG_AFS_FS is not set
> CONFIG_NLS=y
> CONFIG_NLS_DEFAULT="iso8859-1"
> CONFIG_NLS_CODEPAGE_437=y
> CONFIG_NLS_CODEPAGE_737=y
> CONFIG_NLS_CODEPAGE_775=y
> # CONFIG_NLS_CODEPAGE_850 is not set
> # CONFIG_NLS_CODEPAGE_852 is not set
> CONFIG_NLS_CODEPAGE_855=y
> CONFIG_NLS_CODEPAGE_857=y
> CONFIG_NLS_CODEPAGE_860=y
> # CONFIG_NLS_CODEPAGE_861 is not set
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=y
> CONFIG_NLS_CODEPAGE_864=y
> CONFIG_NLS_CODEPAGE_865=y
> # CONFIG_NLS_CODEPAGE_866 is not set
> # CONFIG_NLS_CODEPAGE_869 is not set
> # CONFIG_NLS_CODEPAGE_936 is not set
> CONFIG_NLS_CODEPAGE_950=y
> CONFIG_NLS_CODEPAGE_932=y
> CONFIG_NLS_CODEPAGE_949=y
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=y
> CONFIG_NLS_CODEPAGE_1250=y
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ASCII=y
> CONFIG_NLS_ISO8859_1=y
> # CONFIG_NLS_ISO8859_2 is not set
> CONFIG_NLS_ISO8859_3=y
> CONFIG_NLS_ISO8859_4=y
> CONFIG_NLS_ISO8859_5=y
> CONFIG_NLS_ISO8859_6=y
> CONFIG_NLS_ISO8859_7=y
> # CONFIG_NLS_ISO8859_9 is not set
> # CONFIG_NLS_ISO8859_13 is not set
> CONFIG_NLS_ISO8859_14=y
> CONFIG_NLS_ISO8859_15=y
> # CONFIG_NLS_KOI8_R is not set
> CONFIG_NLS_KOI8_U=y
> CONFIG_NLS_MAC_ROMAN=y
> CONFIG_NLS_MAC_CELTIC=y
> # CONFIG_NLS_MAC_CENTEURO is not set
> CONFIG_NLS_MAC_CROATIAN=y
> CONFIG_NLS_MAC_CYRILLIC=y
> CONFIG_NLS_MAC_GAELIC=y
> CONFIG_NLS_MAC_GREEK=y
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=y
> CONFIG_NLS_MAC_ROMANIAN=y
> CONFIG_NLS_MAC_TURKISH=y
> CONFIG_NLS_UTF8=y
> CONFIG_DLM=y
> # CONFIG_DLM_DEPRECATED_API is not set
> # CONFIG_DLM_DEBUG is not set
> CONFIG_UNICODE=y
> # CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
> # end of File systems
> 
> #
> # Security options
> #
> CONFIG_KEYS=y
> # CONFIG_KEYS_REQUEST_CACHE is not set
> # CONFIG_PERSISTENT_KEYRINGS is not set
> CONFIG_BIG_KEYS=y
> CONFIG_TRUSTED_KEYS=y
> CONFIG_TRUSTED_KEYS_TPM=y
> CONFIG_ENCRYPTED_KEYS=y
> # CONFIG_USER_DECRYPTED_DATA is not set
> CONFIG_KEY_DH_OPERATIONS=y
> CONFIG_SECURITY_DMESG_RESTRICT=y
> CONFIG_SECURITY=y
> CONFIG_SECURITYFS=y
> CONFIG_SECURITY_NETWORK=y
> # CONFIG_SECURITY_NETWORK_XFRM is not set
> CONFIG_SECURITY_PATH=y
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_SELINUX is not set
> CONFIG_SECURITY_SMACK=y
> CONFIG_SECURITY_SMACK_BRINGUP=y
> CONFIG_SECURITY_SMACK_NETFILTER=y
> # CONFIG_SECURITY_SMACK_APPEND_SIGNALS is not set
> CONFIG_SECURITY_TOMOYO=y
> CONFIG_SECURITY_TOMOYO_MAX_ACCEPT_ENTRY=2048
> CONFIG_SECURITY_TOMOYO_MAX_AUDIT_LOG=1024
> CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER=y
> CONFIG_SECURITY_TOMOYO_INSECURE_BUILTIN_SETTING=y
> # CONFIG_SECURITY_APPARMOR is not set
> # CONFIG_SECURITY_YAMA is not set
> CONFIG_SECURITY_SAFESETID=y
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> # CONFIG_SECURITY_LANDLOCK is not set
> CONFIG_INTEGRITY=y
> CONFIG_INTEGRITY_SIGNATURE=y
> CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
> # CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
> CONFIG_INTEGRITY_AUDIT=y
> CONFIG_IMA=y
> CONFIG_IMA_MEASURE_PCR_IDX=10
> CONFIG_IMA_LSM_RULES=y
> CONFIG_IMA_NG_TEMPLATE=y
> # CONFIG_IMA_SIG_TEMPLATE is not set
> CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
> CONFIG_IMA_DEFAULT_HASH_SHA1=y
> # CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
> # CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
> # CONFIG_IMA_DEFAULT_HASH_WP512 is not set
> # CONFIG_IMA_DEFAULT_HASH_SM3 is not set
> CONFIG_IMA_DEFAULT_HASH="sha1"
> CONFIG_IMA_WRITE_POLICY=y
> # CONFIG_IMA_READ_POLICY is not set
> CONFIG_IMA_APPRAISE=y
> CONFIG_IMA_ARCH_POLICY=y
> CONFIG_IMA_APPRAISE_BUILD_POLICY=y
> CONFIG_IMA_APPRAISE_REQUIRE_FIRMWARE_SIGS=y
> CONFIG_IMA_APPRAISE_REQUIRE_KEXEC_SIGS=y
> CONFIG_IMA_APPRAISE_REQUIRE_MODULE_SIGS=y
> # CONFIG_IMA_APPRAISE_REQUIRE_POLICY_SIGS is not set
> # CONFIG_IMA_APPRAISE_BOOTPARAM is not set
> # CONFIG_IMA_APPRAISE_MODSIG is not set
> CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
> # CONFIG_IMA_DISABLE_HTABLE is not set
> # CONFIG_EVM is not set
> CONFIG_DEFAULT_SECURITY_SMACK=y
> # CONFIG_DEFAULT_SECURITY_TOMOYO is not set
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,smack,selinux,tomoyo,apparmor,bpf"
> 
> #
> # Kernel hardening options
> #
> 
> #
> # Memory initialization
> #
> CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
> CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
> CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
> # CONFIG_INIT_STACK_NONE is not set
> # CONFIG_INIT_STACK_ALL_PATTERN is not set
> CONFIG_INIT_STACK_ALL_ZERO=y
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> CONFIG_INIT_ON_FREE_DEFAULT_ON=y
> CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
> # CONFIG_ZERO_CALL_USED_REGS is not set
> # end of Memory initialization
> 
> CONFIG_RANDSTRUCT_NONE=y
> # end of Kernel hardening options
> # end of Security options
> 
> CONFIG_CRYPTO=y
> 
> #
> # Crypto core or helper
> #
> # CONFIG_CRYPTO_FIPS is not set
> CONFIG_CRYPTO_ALGAPI=y
> CONFIG_CRYPTO_ALGAPI2=y
> CONFIG_CRYPTO_AEAD=y
> CONFIG_CRYPTO_AEAD2=y
> CONFIG_CRYPTO_SKCIPHER=y
> CONFIG_CRYPTO_SKCIPHER2=y
> CONFIG_CRYPTO_HASH=y
> CONFIG_CRYPTO_HASH2=y
> CONFIG_CRYPTO_RNG=y
> CONFIG_CRYPTO_RNG2=y
> CONFIG_CRYPTO_RNG_DEFAULT=y
> CONFIG_CRYPTO_AKCIPHER2=y
> CONFIG_CRYPTO_AKCIPHER=y
> CONFIG_CRYPTO_KPP2=y
> CONFIG_CRYPTO_KPP=y
> CONFIG_CRYPTO_ACOMP2=y
> CONFIG_CRYPTO_MANAGER=y
> CONFIG_CRYPTO_MANAGER2=y
> CONFIG_CRYPTO_USER=y
> # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
> CONFIG_CRYPTO_NULL=y
> CONFIG_CRYPTO_NULL2=y
> CONFIG_CRYPTO_CRYPTD=y
> CONFIG_CRYPTO_AUTHENC=y
> # CONFIG_CRYPTO_TEST is not set
> CONFIG_CRYPTO_ENGINE=y
> # end of Crypto core or helper
> 
> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=y
> CONFIG_CRYPTO_DH=y
> CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
> CONFIG_CRYPTO_ECC=y
> CONFIG_CRYPTO_ECDH=y
> CONFIG_CRYPTO_ECDSA=y
> CONFIG_CRYPTO_ECRDSA=y
> # CONFIG_CRYPTO_SM2 is not set
> CONFIG_CRYPTO_CURVE25519=y
> # end of Public-key cryptography
> 
> #
> # Block ciphers
> #
> CONFIG_CRYPTO_AES=y
> CONFIG_CRYPTO_AES_TI=y
> CONFIG_CRYPTO_ARIA=y
> CONFIG_CRYPTO_BLOWFISH=y
> CONFIG_CRYPTO_BLOWFISH_COMMON=y
> CONFIG_CRYPTO_CAMELLIA=y
> CONFIG_CRYPTO_CAST_COMMON=y
> CONFIG_CRYPTO_CAST5=y
> CONFIG_CRYPTO_CAST6=y
> CONFIG_CRYPTO_DES=y
> # CONFIG_CRYPTO_FCRYPT is not set
> CONFIG_CRYPTO_SERPENT=y
> CONFIG_CRYPTO_SM4=y
> CONFIG_CRYPTO_SM4_GENERIC=y
> CONFIG_CRYPTO_TWOFISH=y
> CONFIG_CRYPTO_TWOFISH_COMMON=y
> # end of Block ciphers
> 
> #
> # Length-preserving ciphers and modes
> #
> # CONFIG_CRYPTO_ADIANTUM is not set
> # CONFIG_CRYPTO_CHACHA20 is not set
> CONFIG_CRYPTO_CBC=y
> # CONFIG_CRYPTO_CFB is not set
> CONFIG_CRYPTO_CTR=y
> # CONFIG_CRYPTO_CTS is not set
> CONFIG_CRYPTO_ECB=y
> # CONFIG_CRYPTO_HCTR2 is not set
> # CONFIG_CRYPTO_KEYWRAP is not set
> # CONFIG_CRYPTO_LRW is not set
> # CONFIG_CRYPTO_OFB is not set
> CONFIG_CRYPTO_PCBC=y
> CONFIG_CRYPTO_XTS=y
> # end of Length-preserving ciphers and modes
> 
> #
> # AEAD (authenticated encryption with associated data) ciphers
> #
> CONFIG_CRYPTO_AEGIS128=y
> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_CCM=y
> CONFIG_CRYPTO_GCM=y
> CONFIG_CRYPTO_SEQIV=y
> CONFIG_CRYPTO_ECHAINIV=y
> CONFIG_CRYPTO_ESSIV=y
> # end of AEAD (authenticated encryption with associated data) ciphers
> 
> #
> # Hashes, digests, and MACs
> #
> CONFIG_CRYPTO_BLAKE2B=y
> CONFIG_CRYPTO_CMAC=y
> CONFIG_CRYPTO_GHASH=y
> CONFIG_CRYPTO_HMAC=y
> CONFIG_CRYPTO_MD4=y
> CONFIG_CRYPTO_MD5=y
> CONFIG_CRYPTO_MICHAEL_MIC=y
> CONFIG_CRYPTO_POLY1305=y
> CONFIG_CRYPTO_RMD160=y
> CONFIG_CRYPTO_SHA1=y
> CONFIG_CRYPTO_SHA256=y
> CONFIG_CRYPTO_SHA512=y
> CONFIG_CRYPTO_SHA3=y
> CONFIG_CRYPTO_SM3=y
> CONFIG_CRYPTO_SM3_GENERIC=y
> CONFIG_CRYPTO_STREEBOG=y
> # CONFIG_CRYPTO_VMAC is not set
> CONFIG_CRYPTO_WP512=y
> # CONFIG_CRYPTO_XCBC is not set
> CONFIG_CRYPTO_XXHASH=y
> # end of Hashes, digests, and MACs
> 
> #
> # CRCs (cyclic redundancy checks)
> #
> CONFIG_CRYPTO_CRC32C=y
> # CONFIG_CRYPTO_CRC32 is not set
> CONFIG_CRYPTO_CRCT10DIF=y
> # end of CRCs (cyclic redundancy checks)
> 
> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=y
> CONFIG_CRYPTO_LZO=y
> # CONFIG_CRYPTO_842 is not set
> CONFIG_CRYPTO_LZ4=y
> CONFIG_CRYPTO_LZ4HC=y
> CONFIG_CRYPTO_ZSTD=y
> # end of Compression
> 
> #
> # Random number generation
> #
> # CONFIG_CRYPTO_ANSI_CPRNG is not set
> CONFIG_CRYPTO_DRBG_MENU=y
> CONFIG_CRYPTO_DRBG_HMAC=y
> # CONFIG_CRYPTO_DRBG_HASH is not set
> # CONFIG_CRYPTO_DRBG_CTR is not set
> CONFIG_CRYPTO_DRBG=y
> CONFIG_CRYPTO_JITTERENTROPY=y
> CONFIG_CRYPTO_KDF800108_CTR=y
> # end of Random number generation
> 
> #
> # Userspace interface
> #
> CONFIG_CRYPTO_USER_API=y
> CONFIG_CRYPTO_USER_API_HASH=y
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> CONFIG_CRYPTO_USER_API_RNG=y
> CONFIG_CRYPTO_USER_API_RNG_CAVP=y
> CONFIG_CRYPTO_USER_API_AEAD=y
> # CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
> CONFIG_CRYPTO_STATS=y
> # end of Userspace interface
> 
> CONFIG_CRYPTO_HASH_INFO=y
> CONFIG_CRYPTO_HW=y
> # CONFIG_CRYPTO_DEV_ALLWINNER is not set
> # CONFIG_CRYPTO_DEV_EXYNOS_RNG is not set
> # CONFIG_CRYPTO_DEV_S5P is not set
> # CONFIG_CRYPTO_DEV_ATMEL_AES is not set
> # CONFIG_CRYPTO_DEV_ATMEL_TDES is not set
> # CONFIG_CRYPTO_DEV_ATMEL_SHA is not set
> CONFIG_CRYPTO_DEV_ATMEL_I2C=y
> CONFIG_CRYPTO_DEV_ATMEL_ECC=y
> # CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
> # CONFIG_CRYPTO_DEV_QCE is not set
> # CONFIG_CRYPTO_DEV_QCOM_RNG is not set
> # CONFIG_CRYPTO_DEV_IMGTEC_HASH is not set
> # CONFIG_CRYPTO_DEV_ZYNQMP_AES is not set
> # CONFIG_CRYPTO_DEV_ZYNQMP_SHA3 is not set
> CONFIG_CRYPTO_DEV_VIRTIO=y
> # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> CONFIG_CRYPTO_DEV_CCREE=y
> # CONFIG_CRYPTO_DEV_HISI_SEC is not set
> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> # CONFIG_CRYPTO_DEV_SA2UL is not set
> # CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4 is not set
> # CONFIG_CRYPTO_DEV_KEEMBAY_OCS_ECC is not set
> # CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU is not set
> # CONFIG_CRYPTO_DEV_ASPEED is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=y
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
> CONFIG_X509_CERTIFICATE_PARSER=y
> # CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
> # CONFIG_PKCS7_MESSAGE_PARSER is not set
> 
> #
> # Certificates for signature checking
> #
> # CONFIG_SYSTEM_TRUSTED_KEYRING is not set
> CONFIG_SYSTEM_BLACKLIST_KEYRING=y
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
> # end of Certificates for signature checking
> 
> CONFIG_BINARY_PRINTF=y
> 
> #
> # Library routines
> #
> CONFIG_LINEAR_RANGES=y
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=y
> CONFIG_GENERIC_STRNCPY_FROM_USER=y
> CONFIG_GENERIC_STRNLEN_USER=y
> CONFIG_GENERIC_NET_UTILS=y
> CONFIG_CORDIC=y
> CONFIG_PRIME_NUMBERS=y
> CONFIG_RATIONAL=y
> CONFIG_GENERIC_PCI_IOMAP=y
> 
> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_UTILS=y
> CONFIG_CRYPTO_LIB_AES=y
> CONFIG_CRYPTO_LIB_GF128MUL=y
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
> CONFIG_CRYPTO_LIB_CHACHA=y
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
> CONFIG_CRYPTO_LIB_CURVE25519=y
> CONFIG_CRYPTO_LIB_DES=y
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
> CONFIG_CRYPTO_LIB_POLY1305=y
> CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
> CONFIG_CRYPTO_LIB_SHA1=y
> CONFIG_CRYPTO_LIB_SHA256=y
> # end of Crypto library routines
> 
> CONFIG_CRC_CCITT=y
> CONFIG_CRC16=y
> CONFIG_CRC_T10DIF=y
> # CONFIG_CRC64_ROCKSOFT is not set
> CONFIG_CRC_ITU_T=y
> CONFIG_CRC32=y
> CONFIG_CRC32_SELFTEST=y
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> CONFIG_CRC32_BIT=y
> # CONFIG_CRC64 is not set
> CONFIG_CRC4=y
> # CONFIG_CRC7 is not set
> CONFIG_LIBCRC32C=y
> CONFIG_CRC8=y
> CONFIG_XXHASH=y
> CONFIG_AUDIT_GENERIC=y
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_ZLIB_INFLATE=y
> CONFIG_ZLIB_DEFLATE=y
> CONFIG_LZO_COMPRESS=y
> CONFIG_LZO_DECOMPRESS=y
> CONFIG_LZ4_COMPRESS=y
> CONFIG_LZ4HC_COMPRESS=y
> CONFIG_LZ4_DECOMPRESS=y
> CONFIG_ZSTD_COMMON=y
> CONFIG_ZSTD_COMPRESS=y
> CONFIG_ZSTD_DECOMPRESS=y
> CONFIG_XZ_DEC=y
> CONFIG_XZ_DEC_X86=y
> CONFIG_XZ_DEC_POWERPC=y
> CONFIG_XZ_DEC_IA64=y
> CONFIG_XZ_DEC_ARM=y
> # CONFIG_XZ_DEC_ARMTHUMB is not set
> # CONFIG_XZ_DEC_SPARC is not set
> CONFIG_XZ_DEC_MICROLZMA=y
> CONFIG_XZ_DEC_BCJ=y
> CONFIG_XZ_DEC_TEST=y
> CONFIG_DECOMPRESS_GZIP=y
> CONFIG_DECOMPRESS_BZIP2=y
> CONFIG_DECOMPRESS_XZ=y
> CONFIG_DECOMPRESS_LZ4=y
> CONFIG_GENERIC_ALLOCATOR=y
> CONFIG_REED_SOLOMON=y
> CONFIG_REED_SOLOMON_ENC16=y
> CONFIG_REED_SOLOMON_DEC16=y
> CONFIG_BCH=y
> CONFIG_TEXTSEARCH=y
> CONFIG_TEXTSEARCH_KMP=y
> CONFIG_TEXTSEARCH_BM=y
> CONFIG_TEXTSEARCH_FSM=y
> CONFIG_INTERVAL_TREE=y
> CONFIG_ASSOCIATIVE_ARRAY=y
> CONFIG_HAS_IOMEM=y
> CONFIG_HAS_DMA=y
> CONFIG_NEED_DMA_MAP_STATE=y
> CONFIG_DMA_DECLARE_COHERENT=y
> CONFIG_ARCH_HAS_SETUP_DMA_OPS=y
> CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
> CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
> CONFIG_ARCH_HAS_DMA_PREP_COHERENT=y
> CONFIG_DMA_NONCOHERENT_MMAP=y
> CONFIG_DMA_COHERENT_POOL=y
> CONFIG_DMA_DIRECT_REMAP=y
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_DMA_MAP_BENCHMARK=y
> CONFIG_SGL_ALLOC=y
> CONFIG_DQL=y
> CONFIG_GLOB=y
> CONFIG_GLOB_SELFTEST=y
> CONFIG_NLATTR=y
> CONFIG_GENERIC_ATOMIC64=y
> CONFIG_CLZ_TAB=y
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=y
> CONFIG_SIGNATURE=y
> CONFIG_LIBFDT=y
> CONFIG_OID_REGISTRY=y
> CONFIG_FONT_SUPPORT=y
> CONFIG_FONT_8x16=y
> CONFIG_FONT_AUTOSELECT=y
> CONFIG_STACKDEPOT=y
> CONFIG_REF_TRACKER=y
> # CONFIG_PARMAN is not set
> # CONFIG_OBJAGG is not set
> # end of Library routines
> 
> CONFIG_ASN1_ENCODER=y
> 
> #
> # Kernel hacking
> #
> 
> #
> # printk and dmesg options
> #
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
> # CONFIG_SYMBOLIC_ERRNAME is not set
> # end of printk and dmesg options
> 
> CONFIG_DEBUG_KERNEL=y
> # CONFIG_DEBUG_MISC is not set
> 
> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=y
> CONFIG_AS_HAS_NON_CONST_LEB128=y
> # CONFIG_DEBUG_INFO_NONE is not set
> # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> CONFIG_DEBUG_INFO_DWARF5=y
> # CONFIG_DEBUG_INFO_REDUCED is not set
> CONFIG_DEBUG_INFO_COMPRESSED=y
> # CONFIG_DEBUG_INFO_SPLIT is not set
> # CONFIG_DEBUG_INFO_BTF is not set
> CONFIG_PAHOLE_HAS_SPLIT_BTF=y
> CONFIG_GDB_SCRIPTS=y
> CONFIG_FRAME_WARN=1024
> # CONFIG_STRIP_ASM_SYMS is not set
> CONFIG_READABLE_ASM=y
> CONFIG_HEADERS_INSTALL=y
> CONFIG_DEBUG_SECTION_MISMATCH=y
> CONFIG_SECTION_MISMATCH_WARN_ONLY=y
> CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B=y
> CONFIG_VMLINUX_MAP=y
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
> 
> #
> # Generic Kernel Debugging Instruments
> #
> # CONFIG_MAGIC_SYSRQ is not set
> CONFIG_DEBUG_FS=y
> # CONFIG_DEBUG_FS_ALLOW_ALL is not set
> # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> CONFIG_DEBUG_FS_ALLOW_NONE=y
> CONFIG_HAVE_ARCH_KGDB=y
> # CONFIG_KGDB is not set
> # CONFIG_UBSAN is not set
> CONFIG_HAVE_KCSAN_COMPILER=y
> # end of Generic Kernel Debugging Instruments
> 
> #
> # Networking Debugging
> #
> # CONFIG_NET_DEV_REFCNT_TRACKER is not set
> CONFIG_NET_NS_REFCNT_TRACKER=y
> # CONFIG_DEBUG_NET is not set
> # end of Networking Debugging
> 
> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=y
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_PAGE_OWNER is not set
> CONFIG_PAGE_POISONING=y
> CONFIG_DEBUG_PAGE_REF=y
> CONFIG_DEBUG_OBJECTS=y
> CONFIG_DEBUG_OBJECTS_SELFTEST=y
> CONFIG_DEBUG_OBJECTS_FREE=y
> # CONFIG_DEBUG_OBJECTS_TIMERS is not set
> # CONFIG_DEBUG_OBJECTS_WORK is not set
> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
> CONFIG_SHRINKER_DEBUG=y
> CONFIG_HAVE_DEBUG_KMEMLEAK=y
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> CONFIG_SCHED_STACK_END_CHECK=y
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
> # CONFIG_DEBUG_VM is not set
> # CONFIG_DEBUG_VM_PGTABLE is not set
> CONFIG_DEBUG_MEMORY_INIT=y
> CONFIG_DEBUG_KMAP_LOCAL=y
> # CONFIG_DEBUG_HIGHMEM is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
> # end of Memory Debugging
> 
> # CONFIG_DEBUG_SHIRQ is not set
> 
> #
> # Debug Oops, Lockups and Hangs
> #
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=0
> CONFIG_PANIC_TIMEOUT=0
> CONFIG_LOCKUP_DETECTOR=y
> CONFIG_SOFTLOCKUP_DETECTOR=y
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> # CONFIG_DETECT_HUNG_TASK is not set
> # CONFIG_WQ_WATCHDOG is not set
> # end of Debug Oops, Lockups and Hangs
> 
> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=y
> CONFIG_SCHED_INFO=y
> CONFIG_SCHEDSTATS=y
> # end of Scheduler Debugging
> 
> # CONFIG_DEBUG_TIMEKEEPING is not set
> 
> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=y
> CONFIG_PROVE_LOCKING=y
> # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> CONFIG_LOCK_STAT=y
> CONFIG_DEBUG_RT_MUTEXES=y
> CONFIG_DEBUG_SPINLOCK=y
> CONFIG_DEBUG_MUTEXES=y
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
> CONFIG_DEBUG_RWSEMS=y
> CONFIG_DEBUG_LOCK_ALLOC=y
> CONFIG_LOCKDEP=y
> CONFIG_LOCKDEP_BITS=15
> CONFIG_LOCKDEP_CHAINS_BITS=16
> CONFIG_LOCKDEP_STACK_TRACE_BITS=19
> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
> # CONFIG_DEBUG_LOCKDEP is not set
> # CONFIG_DEBUG_ATOMIC_SLEEP is not set
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> CONFIG_WW_MUTEX_SELFTEST=y
> CONFIG_SCF_TORTURE_TEST=y
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> 
> CONFIG_TRACE_IRQFLAGS=y
> # CONFIG_DEBUG_IRQFLAGS is not set
> CONFIG_STACKTRACE=y
> CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
> CONFIG_DEBUG_KOBJECT=y
> 
> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=y
> CONFIG_DEBUG_PLIST=y
> CONFIG_DEBUG_SG=y
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_BUG_ON_DATA_CORRUPTION=y
> CONFIG_DEBUG_MAPLE_TREE=y
> # end of Debug kernel data structures
> 
> # CONFIG_DEBUG_CREDENTIALS is not set
> 
> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=y
> # CONFIG_PROVE_RCU_LIST is not set
> CONFIG_TORTURE_TEST=y
> # CONFIG_RCU_SCALE_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> # CONFIG_RCU_REF_SCALE_TEST is not set
> CONFIG_RCU_TRACE=y
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> 
> CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
> # CONFIG_LATENCYTOP is not set
> CONFIG_NOP_TRACER=y
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
> CONFIG_TRACE_CLOCK=y
> CONFIG_RING_BUFFER=y
> CONFIG_EVENT_TRACING=y
> CONFIG_CONTEXT_SWITCH_TRACER=y
> CONFIG_PREEMPTIRQ_TRACEPOINTS=y
> CONFIG_TRACING=y
> CONFIG_TRACING_SUPPORT=y
> # CONFIG_FTRACE is not set
> # CONFIG_SAMPLES is not set
> 
> #
> # arc Debugging
> #
> CONFIG_16KSTACKS=y
> # end of arc Debugging
> 
> #
> # Kernel Testing and Coverage
> #
> CONFIG_KUNIT=y
> CONFIG_KUNIT_DEBUGFS=y
> CONFIG_KUNIT_TEST=y
> CONFIG_KUNIT_EXAMPLE_TEST=y
> CONFIG_KUNIT_ALL_TESTS=y
> CONFIG_KUNIT_DEFAULT_ENABLED=y
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_CC_HAS_SANCOV_TRACE_PC=y
> CONFIG_RUNTIME_TESTING_MENU=y
> CONFIG_LKDTM=y
> CONFIG_CPUMASK_KUNIT_TEST=y
> CONFIG_TEST_LIST_SORT=y
> CONFIG_TEST_MIN_HEAP=y
> CONFIG_TEST_SORT=y
> CONFIG_TEST_DIV64=y
> CONFIG_BACKTRACE_SELF_TEST=y
> CONFIG_TEST_REF_TRACKER=y
> # CONFIG_RBTREE_TEST is not set
> CONFIG_REED_SOLOMON_TEST=y
> CONFIG_INTERVAL_TREE_TEST=y
> CONFIG_ATOMIC64_SELFTEST=y
> CONFIG_TEST_HEXDUMP=y
> CONFIG_STRING_SELFTEST=y
> # CONFIG_TEST_STRING_HELPERS is not set
> # CONFIG_TEST_KSTRTOX is not set
> CONFIG_TEST_PRINTF=y
> CONFIG_TEST_SCANF=y
> CONFIG_TEST_BITMAP=y
> CONFIG_TEST_UUID=y
> # CONFIG_TEST_XARRAY is not set
> CONFIG_TEST_MAPLE_TREE=y
> CONFIG_TEST_RHASHTABLE=y
> CONFIG_TEST_IDA=y
> CONFIG_FIND_BIT_BENCHMARK=y
> CONFIG_TEST_FIRMWARE=y
> # CONFIG_TEST_SYSCTL is not set
> CONFIG_BITFIELD_KUNIT=y
> CONFIG_HASH_KUNIT_TEST=y
> CONFIG_RESOURCE_KUNIT_TEST=y
> CONFIG_SYSCTL_KUNIT_TEST=y
> CONFIG_LIST_KUNIT_TEST=y
> CONFIG_LINEAR_RANGES_TEST=y
> CONFIG_CMDLINE_KUNIT_TEST=y
> CONFIG_BITS_TEST=y
> CONFIG_RATIONAL_KUNIT_TEST=y
> CONFIG_MEMCPY_KUNIT_TEST=y
> CONFIG_IS_SIGNED_TYPE_KUNIT_TEST=y
> CONFIG_OVERFLOW_KUNIT_TEST=y
> CONFIG_STACKINIT_KUNIT_TEST=y
> CONFIG_STRSCPY_KUNIT_TEST=y
> CONFIG_SIPHASH_KUNIT_TEST=y
> # CONFIG_TEST_UDELAY is not set
> CONFIG_TEST_MEMCAT_P=y
> CONFIG_TEST_MEMINIT=y
> # CONFIG_TEST_FREE_PAGES is not set
> # end of Kernel Testing and Coverage
> 
> #
> # Rust hacking
> #
> # end of Rust hacking
> 
> # CONFIG_WARN_MISSING_DOCUMENTS is not set
> # CONFIG_WARN_ABI_ERRORS is not set
> # end of Kernel hacking

