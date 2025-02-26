Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3573F23AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 07:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740554217; cv=none; b=aa9Z9gZ4oDcJknt3uZ/1db8q2shDhNsx8zdrfJHT4Au19wew1gZlpLI3t0S1Et5fjyzlrvuENwJoDdpfX+uX7y6mujcWmC3XlU0Mvn8boxLURjXnCIKl1oeHtfhy+tLDGokDrvMKoxLUw/eiRGeG9BzZLb10LwsEQufkSyG75+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740554217; c=relaxed/simple;
	bh=WJcPLtmCS5Mm9pbUsd+n/kOTpeVyg6A+9XJjatOq3tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=osE50RIwYmOgQenSzgRSi32IzVmGUAjFmK15IsO7cikkJSvoOW7+i1j8nbSedr8HZUM+FFnPFSZIafhzijXYEeQJHCwuGj5m8qtXKUzMIhwiblrgUl6txuxfOhm5Wh6PFFeEkmqAPZXvUpu+S6PAT1IQIafp+/XDHQAJroTrrMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z84rJ/Wo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z84rJ/Wo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740554216; x=1772090216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WJcPLtmCS5Mm9pbUsd+n/kOTpeVyg6A+9XJjatOq3tw=;
  b=Z84rJ/WokHnnewzFoGengQ7DCUSyyixetzsHlSSFYOYNi5pxcG8/aAPN
   MXOcslUzokp37dhGokWthgQczsG+pZK5kqKuILUWswvPAw8P+bUSWvITK
   L4WNi/Fcv/KdVRVAyOtFpR23UoILwMkcikl53BJDMIcNeFdS+8oKm73Y0
   pscMsn7cKgkvzFvpl+RhNhmS/f4RTgPc1nFf4+fGX188moowiETZDeD3Q
   Veub7IeS81VYdPKYU2/NPkpwQdzbPqZokcl9+YfPZmttvchxXKMwM1vm2
   JkCXYrZROuvYBPh0DYpR8xXmWluuO2SYJoUEm8ue9V9+VYAxnja4+zyMR
   g==;
X-CSE-ConnectionGUID: WimqTG65RKiN55+JCeWXcQ==
X-CSE-MsgGUID: BAdPKpnzRAas2Pu5qQG2Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40623199"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="40623199"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:16:55 -0800
X-CSE-ConnectionGUID: NUCsVotUTQC6oboZyW9vbw==
X-CSE-MsgGUID: jEYP9Y8TShybhEs4T8peRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="147448900"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Feb 2025 23:16:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnBf1-000BK9-03;
	Wed, 26 Feb 2025 07:16:51 +0000
Date: Wed, 26 Feb 2025 15:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/2]
 arch/x86/coco/pkvm/pkvm.c:53:27: error: variable has incomplete type 'struct
 tdx_module_output'
Message-ID: <202502261538.YYXvF5fI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hubert,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   1340b52753f1557497f8d399a5e8ec6bf6a76002
commit: 1cd69cd68d8470b2504c03c331dca866646cacff [2/2] Merge branch 'android15-6.6-2aa57daa75e0' into android15-6.6-desktop
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250226/202502261538.YYXvF5fI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261538.YYXvF5fI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261538.YYXvF5fI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/coco/pkvm/pkvm.c:10:
   arch/x86/include/asm/pkvm.h:151:39: warning: declaration of 'struct tdx_module_output' will not be visible outside of this function [-Wvisibility]
     151 | u64 __pkvm_module_call(u64 fn, struct tdx_module_output *out);
         |                                       ^
>> arch/x86/coco/pkvm/pkvm.c:53:27: error: variable has incomplete type 'struct tdx_module_output'
      53 |         struct tdx_module_output out;
         |                                  ^
   arch/x86/coco/pkvm/pkvm.c:53:9: note: forward declaration of 'struct tdx_module_output'
      53 |         struct tdx_module_output out;
         |                ^
   1 warning and 1 error generated.


vim +53 arch/x86/coco/pkvm/pkvm.c

0b97a4c41ed1bc Shaoqin Huang  2022-12-07   5  
0b97a4c41ed1bc Shaoqin Huang  2022-12-07   6  #include <linux/cpufeature.h>
317d3034702744 Shaoqin Huang  2022-12-06   7  #include <linux/kvm_para.h>
0b97a4c41ed1bc Shaoqin Huang  2022-12-07   8  #include <asm/coco.h>
0b97a4c41ed1bc Shaoqin Huang  2022-12-07   9  #include <asm/vmx.h>
0b97a4c41ed1bc Shaoqin Huang  2022-12-07 @10  #include <asm/pkvm.h>
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  11  #include <asm/insn.h>
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  12  #include <asm/insn-eval.h>
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  13  #include <asm/pgtable.h>
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  14  #include <asm/virt_exception.h>
317d3034702744 Shaoqin Huang  2022-12-06  15  
317d3034702744 Shaoqin Huang  2022-12-06  16  static bool pkvm_guest_detected;
317d3034702744 Shaoqin Huang  2022-12-06  17  
317d3034702744 Shaoqin Huang  2022-12-06  18  bool pkvm_is_protected_guest(void)
317d3034702744 Shaoqin Huang  2022-12-06  19  {
317d3034702744 Shaoqin Huang  2022-12-06  20  	return pkvm_guest_detected;
317d3034702744 Shaoqin Huang  2022-12-06  21  }
317d3034702744 Shaoqin Huang  2022-12-06  22  
317d3034702744 Shaoqin Huang  2022-12-06  23  int pkvm_set_mem_host_visibility(unsigned long addr, int numpages, bool enc)
317d3034702744 Shaoqin Huang  2022-12-06  24  {
317d3034702744 Shaoqin Huang  2022-12-06  25  	unsigned long size = numpages * PAGE_SIZE;
317d3034702744 Shaoqin Huang  2022-12-06  26  
317d3034702744 Shaoqin Huang  2022-12-06  27  	if (!enc) {
317d3034702744 Shaoqin Huang  2022-12-06  28  		/*
317d3034702744 Shaoqin Huang  2022-12-06  29  		 * When pkvm guest want to share a range of memory, these pages
317d3034702744 Shaoqin Huang  2022-12-06  30  		 * may have not been setup in the guest ept pagetables. So when
317d3034702744 Shaoqin Huang  2022-12-06  31  		 * the pkvm do the __pkvm_guest_share_host() thing, if no page
317d3034702744 Shaoqin Huang  2022-12-06  32  		 * found in guest ept, this function will failed, thus the share
317d3034702744 Shaoqin Huang  2022-12-06  33  		 * page function will failed.
317d3034702744 Shaoqin Huang  2022-12-06  34  		 * So before share these pages to host, first touch them, so
317d3034702744 Shaoqin Huang  2022-12-06  35  		 * they will have entry in the guest ept, to make sure the
317d3034702744 Shaoqin Huang  2022-12-06  36  		 * sharing will success.
317d3034702744 Shaoqin Huang  2022-12-06  37  		 *
317d3034702744 Shaoqin Huang  2022-12-06  38  		 * TODO: Another good way to mitigate this touch is to fake ept
317d3034702744 Shaoqin Huang  2022-12-06  39  		 * violation when the sharing function find that there is no
317d3034702744 Shaoqin Huang  2022-12-06  40  		 * page in the guest ept.
317d3034702744 Shaoqin Huang  2022-12-06  41  		 */
317d3034702744 Shaoqin Huang  2022-12-06  42  		memset((void *)addr, 0, size);
317d3034702744 Shaoqin Huang  2022-12-06  43  		kvm_hypercall2(PKVM_GHC_SHARE_MEM, __pa(addr), size);
317d3034702744 Shaoqin Huang  2022-12-06  44  	} else
317d3034702744 Shaoqin Huang  2022-12-06  45  		kvm_hypercall2(PKVM_GHC_UNSHARE_MEM, __pa(addr), size);
317d3034702744 Shaoqin Huang  2022-12-06  46  
317d3034702744 Shaoqin Huang  2022-12-06  47  	return 0;
317d3034702744 Shaoqin Huang  2022-12-06  48  }
317d3034702744 Shaoqin Huang  2022-12-06  49  
e95e614d9a682c Chuanxiao Dong 2024-10-14  50  static void pkvm_get_ve_info(struct ve_info *ve)
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  51  {
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  52  	/* Reuse the tdx output for pkvm. */
0b97a4c41ed1bc Shaoqin Huang  2022-12-07 @53  	struct tdx_module_output out;
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  54  
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  55  	__pkvm_module_call(PKVM_GHC_GET_VE_INFO, &out);
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  56  
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  57  	/* Transfer the output parameters */
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  58  	ve->exit_reason = out.rcx;
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  59  	ve->exit_qual   = out.rdx;
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  60  	ve->gla         = out.r8;
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  61  	ve->gpa         = out.r9;
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  62  }
0b97a4c41ed1bc Shaoqin Huang  2022-12-07  63  

:::::: The code at line 53 was first introduced by commit
:::::: 0b97a4c41ed1bcb8f14bd5c08e1714877bb0c2a8 ANDROID: pkvm: x86: Add pkvm guest virtualization exception (#VE)

:::::: TO: Shaoqin Huang <shaoqin.huang@intel.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
