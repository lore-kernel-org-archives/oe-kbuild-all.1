Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E10BD528
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 04:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756529017; cv=none; b=l3hUV7s/Z2gA54NUmfv3v4X6jSvGsAMTM55lOC4apk307f9CSOArPeFDYPWphFQJZcarqf1gmz+QQzU09pwX4TaDUuhoz29CXhleQNzo+qAxjuG7gPNA+x7GyOJbnlh7FZeMyQelwWxuiyZAPZL/KePYaXGkIBQh5Ntq/XgpvNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756529017; c=relaxed/simple;
	bh=rKIJ55u0ZFNX4pWO7VsSLkqsK27MYa6yOf5iaqtjXuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=emrvXXxOkHPiWJ805UsgksamZIocIZ1ebHTiLX4zdw7HXmr0yyKxxEQcHDVw2XBdccxgEUVYArhVlEojxlAWKu9llgNrBYSSN+UY5qK3Gj6u88PivkSEetfTdY0Sp4WF5gAsteGzRNPtyvy9y6smiFK+Ec/7DfBH4EeKRLXa82E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvwiCe5q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvwiCe5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756529014; x=1788065014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rKIJ55u0ZFNX4pWO7VsSLkqsK27MYa6yOf5iaqtjXuU=;
  b=JvwiCe5qn/02+aZF+W1f+o60PiKfj8XcVZExMtjbHH4RjJeMQG4lED8G
   nMSaznuEHNvCc/ZWNwGqe7ZXhF6slR/Sec1KeH12h7VYhcV6ek0L1ToAb
   R8Y4QJqqJ8E5bJIAoo1/9Y4OOlDf4EubpbEu5XaFS1QrNtmTrhPjM6Ybz
   0EhWVSk7Dj00CkjygAHI5VTEQU6q3SZyvV2bbP6rvtLVHhAySd/soVuNm
   mwiy6jkOrSe4BndMAyJCNYQEDMSuizma1BrpirI46VBidPSRFAsll2/zC
   onyUq6zzrzTdrCEtgvPnRptfHypkZLdvz5Ys0K/xvyPhqPX4WNntE1p0h
   Q==;
X-CSE-ConnectionGUID: BLOuUKv9SZ6x8CQ3kcGldQ==
X-CSE-MsgGUID: ZGdr7jkxQwmF7Lje3Q1qSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69406586"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="69406586"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 21:43:34 -0700
X-CSE-ConnectionGUID: k8v9cE4QSdO2I98IrDaZqQ==
X-CSE-MsgGUID: 5Dt8D5dyRL6IvzXENfKYAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="169832202"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Aug 2025 21:43:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usDQj-000VAl-2Y;
	Sat, 30 Aug 2025 04:43:14 +0000
Date: Sat, 30 Aug 2025 12:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2791/2791] include/linux/psp-hygon.h:219:5:
 warning: no previous prototype for 'psp_register_cmd_notifier'
Message-ID: <202508301216.R8Pg7xrR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi niuyongwen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   34513bb98544f7d61a383d9d15901d35e7767c06
commit: 518c81d56c055affc71650b1ad1ba7f86e5ee867 [2791/2791] arch/x86/kvm: Support tkm virtualization
config: x86_64-buildonly-randconfig-004-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301216.R8Pg7xrR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508301216.R8Pg7xrR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508301216.R8Pg7xrR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/psp.c:15:
>> include/linux/psp-hygon.h:219:5: warning: no previous prototype for 'psp_register_cmd_notifier' [-Wmissing-prototypes]
     219 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/psp-hygon.h:220:5: warning: no previous prototype for 'psp_unregister_cmd_notifier' [-Wmissing-prototypes]
     220 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/psp.c:105:21: warning: no previous prototype for 'map_tbl_dump' [-Wmissing-prototypes]
     105 | void __maybe_unused map_tbl_dump(const char *title, struct addr_map_tbls *tbls)
         |                     ^~~~~~~~~~~~
   arch/x86/kvm/psp.c:118:21: warning: no previous prototype for 'g2h_tbl_dump' [-Wmissing-prototypes]
     118 | void __maybe_unused g2h_tbl_dump(const char *title, struct gpa2hva_tbls *tbls)
         |                     ^~~~~~~~~~~~


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
