Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFFB1B4158
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 18:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732558608; cv=none; b=gGr/TAoUKPc6Go5ruillUn7j/9Sd4w5edYswOzb4lyaiSUyHXD4clpERsGOK4jq2+7KOXZHq0oOyXPJAJMmZ3lIT8kc+ACUMmr8fw88JtkwEcZQg2Q++e72SldkqZo6sTVDG2NMSHgDiCpYCZ6lbgTaIpNvckvwUMWHFwJyQgbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732558608; c=relaxed/simple;
	bh=G0aQKIzqzqwBWDunEoy4hW0/hNPZ2mDnkqwC0TxbwJc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M0OOxSYN74UwdmNRorPInsovaJoA4Jx5OlVm/oHsuPLNIRfPBmbyzJPytSGhIhA1hq1Vpyu+bfVpJFr40ZLXMDszw3p9lXOtxGzfAOtWlvVytY61NyGTUx4ytRyteVS6XJVABWkeyaVE6K9jnoYxETKb0t0hzjOAoSgmdp9Xjro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3+MrDkH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3+MrDkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732558606; x=1764094606;
  h=date:from:cc:subject:message-id:mime-version;
  bh=G0aQKIzqzqwBWDunEoy4hW0/hNPZ2mDnkqwC0TxbwJc=;
  b=F3+MrDkHahqosdugAkkfjvcRO99uxYz+eS/GgdMOCLRYcMNV1KIOyNsx
   pkACErJY0pZhtLJw6beexX/y6U/xYG9wtPcmGgtkwa85kyDr8MTaKf+yn
   if93TWmWPnloHKXnywOAVPTtigM8f4lWtjYTjBXzJZHuBbfBv9KEujVKY
   eKvBiV18Ue+X3N3QU65PxLe9RWeFck5OX1yutigHLzDkfNKDe95PdR6er
   Xre02oQSTMhbq8eyiGxbi7NE6W782h95WlgmUhpJbkXWkKMzV2P57v2+5
   DsQRTSQ9C9H+WMpcEIW+0rMAKt29vDlyFkGZnydvHYCgEhPlNsAfZn7VL
   A==;
X-CSE-ConnectionGUID: gZOmo4EJSs+3EPUUUBwbRA==
X-CSE-MsgGUID: n2IV/gl6Sf+QOm7WFpO3Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32621756"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="32621756"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 10:16:46 -0800
X-CSE-ConnectionGUID: ksEkX5g8QXmc4ZK/oHG5Hg==
X-CSE-MsgGUID: r96zvUa6RIOdruO2uUkqUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="128870101"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2024 10:16:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFddb-0006gH-0a
	for oe-kbuild-all@lists.linux.dev;
	Mon, 25 Nov 2024 18:16:43 +0000
Date: Tue, 26 Nov 2024 02:16:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/dovetail-xenomai 11278/13313]
 arch/x86/include/asm/idtentry.h:490:49: error: '__sysvec_xen_hvm_callback'
 undeclared; did you mean 'sysvec_xen_hvm_callback'?
Message-ID: <202411260244.2CB28wmw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Florian,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.6/dovetail-xenomai
head:   8025dd14d72f1eee946ab67036c7a3a569861654
commit: 0a2bddb4a08e2bc9f2ba04a7b7acd99668d52a37 [11278/13313] x86: dovetail: Allow multiple HV guest extensions to be enabled
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241126/202411260244.2CB28wmw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260244.2CB28wmw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260244.2CB28wmw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/xen/events/events_base.c:45:
   arch/x86/include/asm/idtentry.h:269:20: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     269 | static inline void pipeline_install_sysvec(vector, function) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/idtentry.h: In function 'pipeline_install_sysvec':
   arch/x86/include/asm/idtentry.h:269:20: warning: old-style function definition [-Wold-style-definition]
   arch/x86/include/asm/idtentry.h:269:20: error: type of 'vector' defaults to 'int' [-Werror=implicit-int]
   arch/x86/include/asm/idtentry.h:269:20: error: type of 'function' defaults to 'int' [-Werror=implicit-int]
   drivers/xen/events/events_base.c: In function 'xen_alloc_callback_vector':
>> arch/x86/include/asm/idtentry.h:490:49: error: '__sysvec_xen_hvm_callback' undeclared (first use in this function); did you mean 'sysvec_xen_hvm_callback'?
     490 |                 pipeline_install_sysvec(vector, __##function); \
         |                                                 ^~
   drivers/xen/events/events_base.c:2238:9: note: in expansion of macro 'sysvec_install'
    2238 |         sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_xen_hvm_callback);
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/idtentry.h:490:49: note: each undeclared identifier is reported only once for each function it appears in
     490 |                 pipeline_install_sysvec(vector, __##function); \
         |                                                 ^~
   drivers/xen/events/events_base.c:2238:9: note: in expansion of macro 'sysvec_install'
    2238 |         sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_xen_hvm_callback);
         |         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +490 arch/x86/include/asm/idtentry.h

   487	
   488	#define sysvec_install(vector, function)                       \
   489		{                                                      \
 > 490			pipeline_install_sysvec(vector, __##function); \
   491			alloc_intr_gate(vector, asm_##function);       \
   492		}
   493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
