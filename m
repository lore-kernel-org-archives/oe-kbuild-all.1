Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4611EF07
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 19:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705952295; cv=none; b=q52CvQ3Ot0wyYX9GObcWQARziLH8MGYjbibsic6t43UkzR4EyCimGzDgN0WutgpdK0CK1b0dhtWX02GA4z1mWshAsYEhtgs0az/lZOy5s9UIHKM1WvST+ohJAvXQmBi1E8HIy0GrBxrJzGSe/23rC+e885QqgEpR4sU95DAv9MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705952295; c=relaxed/simple;
	bh=tquhQiV8ld0ygjF1diLNrRE2kAuF0jyum9CqHaRJ75s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yx2KR/FlTvmP2SOziOYoXKabsH+KtBAmuy4QRXEUeyAzn2A5lMww160jGA0F8gtpPm57AH9qd62elsj1l0+oMOmOH7TJnVIp5f7RWtUExWgPO1CN3m5IZOjUGoLdd1juxN0tAGLm2p7opDL3EGS4f/UCygVKnQOm3CpB8VdGbF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZGM2hul; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZGM2hul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705952290; x=1737488290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tquhQiV8ld0ygjF1diLNrRE2kAuF0jyum9CqHaRJ75s=;
  b=fZGM2hul758HM2sqsY1dgNXQoq9ejJ2CZFRNTbBdqb8qkPFdh2AklBm0
   deANARvYk74yjduE3N/U0Qy8g/WylDEsS8ibQMja7kuvWH62x+IBM8HHJ
   2fTB4/GLGToHWfQtVnT1JzWxg7ZfdoQenhaFb2DaL7tGM6dDJJm+ERqXH
   +XvhwICtXWkDn3WPse0fAFUqT1ScU+djLV/7Ng4Z1nqSaHNfw58TaHbZ9
   PGis/Pg7IKtQMrwd+NnIj8vPANjfN+DlYi7ejnqdJmfzf5BDyEHAFHhTK
   pIGC34m/ogmucrFeLiCxKAjAypig/fsDe3RspYFGH0vZdLZ/Ar94oCgHx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1162469"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1162469"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 11:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1302039"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jan 2024 11:38:08 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rS07R-0006pI-0B;
	Mon, 22 Jan 2024 19:38:05 +0000
Date: Tue, 23 Jan 2024 03:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 12457/21565]
 drivers/char/svm.c:1762:36: warning: 'svm_acpi_match' defined but not used
Message-ID: <202401230321.uVO9BE4k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lijun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fb3a7131883be36037affebc26a6597087cbd012
commit: d8e64215b6c932fd8d7c521d6cb3bcf6414d300c [12457/21565] svm: Delete ifdef CONFIG_ACPI in svm
config: arm64-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240123/202401230321.uVO9BE4k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401230321.uVO9BE4k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401230321.uVO9BE4k-lkp@intel.com/

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

8f29578be61750 Jiankang Chen 2019-10-28  1761  
8f29578be61750 Jiankang Chen 2019-10-28 @1762  static const struct acpi_device_id svm_acpi_match[] = {
8f29578be61750 Jiankang Chen 2019-10-28  1763  	{ "HSVM1980", 0},
8f29578be61750 Jiankang Chen 2019-10-28  1764  	{ }
8f29578be61750 Jiankang Chen 2019-10-28  1765  };
8f29578be61750 Jiankang Chen 2019-10-28  1766  MODULE_DEVICE_TABLE(acpi, svm_acpi_match);
d8e64215b6c932 Lijun Fang    2020-01-16  1767  

:::::: The code at line 1762 was first introduced by commit
:::::: 8f29578be61750d83b8effb090c25e07432dcb75 svm: add svm drv framework for hi1910 and hi1980

:::::: TO: Jiankang Chen <chenjiankang1@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
