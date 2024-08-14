Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3265C1B374D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647130; cv=none; b=noAA/03o9jAD576HqwA+fL/Y2UfNkU0Iouyb6erUn8e6hIydPQHY35WkPiBuICPU+eMjiPJIk2uCEPFLyeFvcyT+33z0xRBDqzxPwKcp6BuccXIA8TaoI5g5d3JKXrVF1re+bupH+MbDgMosSQmYx0ETfwiTmy1HhaI1UvqGc8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647130; c=relaxed/simple;
	bh=hzPSeoiGw8GJFALSSfUOZwWr3OtLihmP3qu00FT3PrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nlkrg8V6GYBOc2xqW89JfUwVF1U2WwoQvuFT6QdSFlejKY5mDwIbMuh/tdLkKVXpJLlGMw+mo/jnYHess6cso4XPZpSoDbtbdkCYndc9W6pvH6HaHF/WXINVtFKs1PKxVnjI5jFZboTqKVBjGZAaACGYaSrVZmFrm2NgQtuNWCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9pjCnMB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9pjCnMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723647128; x=1755183128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hzPSeoiGw8GJFALSSfUOZwWr3OtLihmP3qu00FT3PrE=;
  b=N9pjCnMB6rBL79OSwFu7sPAhueFW6tqL7ipBzdfmwQZ3pQK/YMaps1Rf
   CzI3kPeHOF3Mhmw3NKB+9uWrnRCLBmp0yi9VZRZmiuEubJoBsDt4Wq/PL
   L4YNUtnhHJvm3ZKx0X3MVJLbPslGcV+yOq2zQWXgcRvojIJKefdrvp9Oa
   g4zIVL440QvUJJ75Y4LnHi5TIo1x9XwiQxtYErumf5MNjqxY/WCJQ6ucP
   vR++HKhFxP19TfCuyFbkHJr/uJz0hge2w7GF8vLPAEub5rXURSsXbbaBF
   z6K3fi9XUlDjFFod3rFmp+Ztr63iNHED47tMyicexWIS8RDBEbrpnulOj
   w==;
X-CSE-ConnectionGUID: 1KZ4tncwSa2l9wR/UDSL7w==
X-CSE-MsgGUID: uo18jgofQ+KNM7eqw5zjdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21728900"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="21728900"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:52:07 -0700
X-CSE-ConnectionGUID: goscjA3aRCqSapmdD+Mvdw==
X-CSE-MsgGUID: sAWzotWFQSOip+ZJavpW9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="59174191"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Aug 2024 07:52:06 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seFM3-00025J-2p;
	Wed, 14 Aug 2024 14:52:03 +0000
Date: Wed, 14 Aug 2024 22:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiongmengbiao <xiongmengbiao@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13420/13428] include/linux/psp-hygon.h:219:5:
 warning: no previous prototype for function 'psp_register_cmd_notifier'
Message-ID: <202408142206.7FsNhsAd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   80659f8a805633d663edc260627f7fa51fd8b474
commit: 518c81d56c055affc71650b1ad1ba7f86e5ee867 [13420/13428] arch/x86/kvm: Support tkm virtualization
config: x86_64-buildonly-randconfig-001-20240814 (https://download.01.org/0day-ci/archive/20240814/202408142206.7FsNhsAd-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408142206.7FsNhsAd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408142206.7FsNhsAd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/psp.c:15:
>> include/linux/psp-hygon.h:219:5: warning: no previous prototype for function 'psp_register_cmd_notifier' [-Wmissing-prototypes]
     219 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^
   include/linux/psp-hygon.h:219:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     219 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         | ^
         | static 
>> include/linux/psp-hygon.h:220:5: warning: no previous prototype for function 'psp_unregister_cmd_notifier' [-Wmissing-prototypes]
     220 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^
   include/linux/psp-hygon.h:220:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     220 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         | ^
         | static 
   arch/x86/kvm/psp.c:105:21: warning: no previous prototype for function 'map_tbl_dump' [-Wmissing-prototypes]
     105 | void __maybe_unused map_tbl_dump(const char *title, struct addr_map_tbls *tbls)
         |                     ^
   arch/x86/kvm/psp.c:105:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     105 | void __maybe_unused map_tbl_dump(const char *title, struct addr_map_tbls *tbls)
         | ^
         | static 
   arch/x86/kvm/psp.c:118:21: warning: no previous prototype for function 'g2h_tbl_dump' [-Wmissing-prototypes]
     118 | void __maybe_unused g2h_tbl_dump(const char *title, struct gpa2hva_tbls *tbls)
         |                     ^
   arch/x86/kvm/psp.c:118:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     118 | void __maybe_unused g2h_tbl_dump(const char *title, struct gpa2hva_tbls *tbls)
         | ^
         | static 
   4 warnings generated.


vim +/psp_register_cmd_notifier +219 include/linux/psp-hygon.h

d0b3a770d8e20d chench00 2024-08-01  218  
d0b3a770d8e20d chench00 2024-08-01 @219  int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
d0b3a770d8e20d chench00 2024-08-01 @220  int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
d0b3a770d8e20d chench00 2024-08-01  221  

:::::: The code at line 219 was first introduced by commit
:::::: d0b3a770d8e20d953fe2a74ea8c4b5f4767c4add crypto: command co-processor: Add another mailbox interrupt support for PSP sending command to X86

:::::: TO: chench00 <chench@hygon.cn>
:::::: CC: chench00 <chench@hygon.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
