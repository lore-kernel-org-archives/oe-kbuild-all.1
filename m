Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC4DDAD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 07:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743145736; cv=none; b=lldt1ecTFI5ndY9Gbr1n/WQzYJlyRMdwhNngE7Mr+2R9mbGIb9iOn256SEWnnQvcCGJ6HoOEPTncICESf4t3Wfc+NBYnNhE+RhPlBZh+lsVYT8INHqqmSOScCmpIubdhz1d+DndG55ceG/hCalrK2p2QWOfk5+TFHulHQLo3SfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743145736; c=relaxed/simple;
	bh=TWrM7+Fwl1E7OMhaO1e5Pe2QIkzhmlo5n5s4bSPZwzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gXbW0ekmGHwm+aYtJDJIm6TwjnsVmButWrzUGJmmxBJV25WwedppDsgxVOSfijBlzR9HpyMzuhvUbQJvEOrH5fab/LCUGmsw3xXF4c6hkffUlDRTEK8bz12qvO0SImTvmgXB+Drc5tN7BwJsAOiF3swxalN/hee2YTfCG3Aq31o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRqaiBld; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRqaiBld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743145734; x=1774681734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TWrM7+Fwl1E7OMhaO1e5Pe2QIkzhmlo5n5s4bSPZwzs=;
  b=cRqaiBldbrg9PdiApirDYvNAChoh5cv9Kd4PkueWWFosQRdh1ylN/3dR
   ac/yYP0/JAcwAAQ8c+0D5dmpRF5Yop14K+xSkg7X4bIRUvFJ1w1qG8cuc
   26jTBdwlrR+cuo4bKrds6IsOJ2pkGQI9huRwMpL5yYcC8v0/jV2T/O4+G
   w11NfP3Q2DFDHZGdtxgpGlWs3Ofc9rMG7EyqKzKvLgoStH+lmiBpN+mwP
   2UD6/XQ8OqUbooDZaqlcg9GLZwfCb20aJWDjHvU4kwwEd2Z6fQRKkbd3n
   VLEgdcxtYrpW3yMhH+2qfp52KQ8cNVmnNIoyFBTBFUdp8sk+UgvY0tMRK
   Q==;
X-CSE-ConnectionGUID: dbgy/OWQT7uGtD3Euza1hA==
X-CSE-MsgGUID: eezmzMUxR8eXCyEwqSVMEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="54702255"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="54702255"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 00:08:53 -0700
X-CSE-ConnectionGUID: 9Wt40HIiRmOS61Z20tkLpQ==
X-CSE-MsgGUID: fuYpD7M/Q46BbceeEPEm1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="130083246"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 Mar 2025 00:08:51 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty3ph-0007CX-0K;
	Fri, 28 Mar 2025 07:08:49 +0000
Date: Fri, 28 Mar 2025 15:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1525/1525] drivers/char/svm.c:366:43:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202503281546.GkxeQtL3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4d1e247486ffeef035a5a55a97f2659f68177357
commit: 51d0e1a742714b2599d54fd92a71bd2998b01084 [1525/1525] support multiple node for getting phys interface
config: arm64-randconfig-r112-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281546.GkxeQtL3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250328/202503281546.GkxeQtL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281546.GkxeQtL3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/char/svm.c:248:20: sparse: sparse: symbol 'svm_find_mem_reg_node' was not declared. Should it be static?
   drivers/char/svm.c:325:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct svm_va2pa_slot *slot @@     got void [noderef] __iomem * @@
   drivers/char/svm.c:325:14: sparse:     expected struct svm_va2pa_slot *slot
   drivers/char/svm.c:325:14: sparse:     got void [noderef] __iomem *
>> drivers/char/svm.c:366:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct svm_va2pa_slot *slots @@
   drivers/char/svm.c:366:43: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/char/svm.c:366:43: sparse:     got struct svm_va2pa_slot *slots
   drivers/char/svm.c:449:6: sparse: sparse: symbol 'sysrq_sched_debug_show_export' was not declared. Should it be static?
   drivers/char/svm.c:1272:35: sparse: sparse: Using plain integer as NULL pointer
   drivers/char/svm.c:248:21: warning: no previous prototype for 'svm_find_mem_reg_node' [-Wmissing-prototypes]
     248 | struct device_node *svm_find_mem_reg_node(struct device *dev, const char *compat)
         |                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/svm.c:449:6: warning: no previous prototype for 'sysrq_sched_debug_show_export' [-Wmissing-prototypes]
     449 | void sysrq_sched_debug_show_export(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/svm.c:1476:5: warning: no previous prototype for 'svm_get_pasid' [-Wmissing-prototypes]
    1476 | int svm_get_pasid(pid_t vpid, int dev_id __maybe_unused)
         |     ^~~~~~~~~~~~~
   drivers/char/svm.c:2269:36: warning: 'svm_acpi_match' defined but not used [-Wunused-const-variable=]
    2269 | static const struct acpi_device_id svm_acpi_match[] = {
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
       inlined from 'svm_proc_load_flag' at drivers/char/svm.c:1805:12:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'atomic_t[1]' [-Warray-bounds=]
     492 |         asm volatile(                                                   39-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c: In function 'svm_proc_load_flag':
   drivers/char/svm.c:1796:25: note: object 'l2buf_load_flag' of size 4
    1796 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'svm_proc_load_flag' at drivers/char/svm.c:1805:12:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'atomic_t[1]' [-Warray-bounds=]
     492 |         asm volatile(                                                   52-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   drivers/char/svm.c: In function 'svm_proc_load_flag':
   drivers/char/svm.c:1796:25: note: object 'l2buf_load_flag' of size 4
    1796 |         static atomic_t l2buf_load_flag = ATOMIC_INIT(0);
         |                         ^~~~~~~~~~~~~~~

vim +366 drivers/char/svm.c

   357	
   358	static void svm_remove_trunk(struct device *dev)
   359	{
   360		int count;
   361	
   362		for (count = 0; count < SVM_VA2PA_TRUNK_COUNT_MAX; count++) {
   363			if (!va2pa_trunk[count].base)
   364				break;
   365	
 > 366			iounmap(va2pa_trunk[count].slots);
   367			kvfree(va2pa_trunk[count].bitmap);
   368			va2pa_trunk[count].slots = NULL;
   369			va2pa_trunk[count].bitmap = NULL;
   370		}
   371	}
   372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
