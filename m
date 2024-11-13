Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9591FDF8F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731495301; cv=none; b=sV25Xi29TpE5XxqVBvyDi3E6pu6bXOP5tIcXFml16ISv1tas3P2hHClZdzNJ9HQQc8T5i6iDQtKRgyqxIa+QhOvznIwRPCpdlEQkP9ARuqotZHOSSd95so5NUlFxjPl2sZCD6lXDz957nVaIQzulu6lAmpXtH5y3Pofml9nwxig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731495301; c=relaxed/simple;
	bh=6UtbK7onQ/sGj++dnuZEQjreVkojlasPfpFY4YlpXgQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VkNiDRhJPwXHSGkb0yEBJJ7pRNua9O3/ia7A0EPciH8I/kpn2GgliU1SQ+fuuy3y1XQlp2ZKfHlb7VoB41VKuPKvdQHqvl8XeJ8sBcInum/xq/8gR84SSuY0gOZ89RDLuWhvQuybtrdGVaV4XFyOYkgYA6bmee1mrMsGB8bCu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQglwGKD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQglwGKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731495299; x=1763031299;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6UtbK7onQ/sGj++dnuZEQjreVkojlasPfpFY4YlpXgQ=;
  b=WQglwGKDuq/6UcFgMRhibBLbo4Yrm1ooUTM8UgvXQ++RS1aW5u4W4+WE
   1OjvPx4BoBYs7CCa3s15anKJa9rVVZi3zQQnzvvlpHuhCtpo//qI8kh5Q
   +kH3ZVIp1bHFdqh0gckAKuQhx3+sr+Qg0WvmNsknn6TSjK8VbyE5dbWsJ
   zjMZPiihu+Va/odN1/UtAhhYeGknWxQTe0KYeyMtpYYjfuEIbmo9/kIkR
   /OURtSxF/oWd00GOjwnbZGJNnTnYg4CB2GXPrAk9peTwd9HSw/uIqGdjy
   5ucGFtXJOUo7uvbrICirbZtF8WYr94LneE9Npp61Oi4zrzMjzLYcu0CIn
   A==;
X-CSE-ConnectionGUID: MRa+BTgCQkW92QAOeO9uCg==
X-CSE-MsgGUID: AGStOjGYRDeyDf3g8/s9+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42788185"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="42788185"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:54:59 -0800
X-CSE-ConnectionGUID: byKFRzeSQ9KNL+fY+lf35Q==
X-CSE-MsgGUID: w6m2YAW+Qiyv/9zlvOQTBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="88228834"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2024 02:54:58 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBB1U-0000GZ-0K
	for oe-kbuild-all@lists.linux.dev;
	Wed, 13 Nov 2024 10:54:56 +0000
Date: Wed, 13 Nov 2024 18:54:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/dovetail-xenomai 11278/13313]
 arch/x86/include/asm/idtentry.h:490:49: error: '__sysvec_xen_hvm_callback'
 undeclared; did you mean 'sysvec_xen_hvm_callback'?
Message-ID: <202411131812.wukQv2f1-lkp@intel.com>
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
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241113/202411131812.wukQv2f1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131812.wukQv2f1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131812.wukQv2f1-lkp@intel.com/

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
