Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA53DD297
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 22:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJR+t/En"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705186555; x=1736722555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KKrNy1UUv7d87X05Wr3af+eTFXh8xl0gc1SrcVJvoAY=;
  b=AJR+t/EnFVkwOf0lDSmg3Phtfo3tUIkF/6s8medZ+3+V0pugtb3f3Xlp
   UV/TVKuY/0KJ2rHrVKsIqLrftH2KAQlJa5ldBIAWWcsJ4Yn1l5ocIe/Os
   2oDz88rE+Om976htE8HVQI+E7tma8J2W1AMHXHbI505wS690oWE61zQb/
   0B1p1IKGwrunn8eDrPoJvSSs4UYKwjft6E5ezD0TWC4zx1dF9FwJxotD2
   Ot0gmJUnC7ZmU1QA21npw/YUhjJst9IYKEXRZN0opDBPFO+LaCUP1t7na
   rz4TpWEgW8mcByA0Ypr2cIAljQWRFFURD03ve5gQSfjNi6u94RKi3FRpx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6777355"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="6777355"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 14:55:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="25377602"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2024 14:55:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOmus-000Aym-2A;
	Sat, 13 Jan 2024 22:55:50 +0000
Date: Sun, 14 Jan 2024 06:55:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 12457/21544]
 drivers/char/svm.c:1762:36: warning: 'svm_acpi_match' defined but not used
Message-ID: <202401140607.30eyVRTm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: d8e64215b6c932fd8d7c521d6cb3bcf6414d300c [12457/21544] svm: Delete ifdef CONFIG_ACPI in svm
config: arm64-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240114/202401140607.30eyVRTm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140607.30eyVRTm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140607.30eyVRTm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/svm.c:158:6: warning: no previous prototype for 'sysrq_sched_debug_show_export' [-Wmissing-prototypes]
     158 | void sysrq_sched_debug_show_export(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/svm.c:1132:5: warning: no previous prototype for 'svm_get_pasid' [-Wmissing-prototypes]
    1132 | int svm_get_pasid(pid_t vpid, int dev_id __maybe_unused)
         |     ^~~~~~~~~~~~~
>> drivers/char/svm.c:1762:36: warning: 'svm_acpi_match' defined but not used [-Wunused-const-variable=]
    1762 | static const struct acpi_device_id svm_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:34,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:18,
                    from arch/arm64/include/asm/bug.h:37,
                    from arch/arm64/include/asm/memory.h:27,
                    from arch/arm64/include/asm/esr.h:21,
                    from drivers/char/svm.c:10:
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'svm_proc_load_flag' at drivers/char/svm.c:1465:12:
   arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'atomic_t[1]' [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:487:1: note: in expansion of macro '__CMPXCHG_CASE'
     487 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c: In function 'svm_proc_load_flag':
   drivers/char/svm.c:1456:25: note: object 'l2buf_load_flag' of size 4
    1456 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'svm_proc_load_flag' at drivers/char/svm.c:1465:12:
   arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'atomic_t[1]' [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:487:1: note: in expansion of macro '__CMPXCHG_CASE'
     487 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c: In function 'svm_proc_load_flag':
   drivers/char/svm.c:1456:25: note: object 'l2buf_load_flag' of size 4
    1456 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~


vim +/svm_acpi_match +1762 drivers/char/svm.c

8f29578be61750d Jiankang Chen 2019-10-28  1761  
8f29578be61750d Jiankang Chen 2019-10-28 @1762  static const struct acpi_device_id svm_acpi_match[] = {
8f29578be61750d Jiankang Chen 2019-10-28  1763  	{ "HSVM1980", 0},
8f29578be61750d Jiankang Chen 2019-10-28  1764  	{ }
8f29578be61750d Jiankang Chen 2019-10-28  1765  };
8f29578be61750d Jiankang Chen 2019-10-28  1766  MODULE_DEVICE_TABLE(acpi, svm_acpi_match);
d8e64215b6c932f Lijun Fang    2020-01-16  1767  

:::::: The code at line 1762 was first introduced by commit
:::::: 8f29578be61750d83b8effb090c25e07432dcb75 svm: add svm drv framework for hi1910 and hi1980

:::::: TO: Jiankang Chen <chenjiankang1@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
