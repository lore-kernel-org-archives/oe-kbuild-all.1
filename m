Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85BC35964
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741512863; cv=none; b=J3AMdT4Vym0/jtdOuywlEDbPzFCx8BoSUtfR015o+oX2Ax/2ZKWDrqJjP31sV6lEqAqQ99EGJMUKvTQYqrlNF6oExcrL9MpBnzoBWyU608DhxMnbm1gpbw/hs7M5QuaznW024l50ZTMciZHVR9E80zP/G3vspcK9IU3on4BEZJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741512863; c=relaxed/simple;
	bh=WHTfmPzC0+tZtVTI3li3Zohi5rvPgxWBWNWcgPcFItA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TbuZp2pjOazeNN+l5YIN0ULlSXApnEHBG1fuZ+wz9EGErDrMUo+OA3OK0tOjfN+UWpNPJOY4ZrbGRo7E0ViARMdEKjRUKQaMJIzSnb+vytrJnmN/mDLo587/wU81wE2Gcmc9mdZvo6/4K1GRAM1WH383a0XX96B2BjWyl/x9UHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUyUhRaO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUyUhRaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741512862; x=1773048862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WHTfmPzC0+tZtVTI3li3Zohi5rvPgxWBWNWcgPcFItA=;
  b=eUyUhRaOFyWQSlNYJvyHibPWpk2AaIcbasWIBFofipViBpOJvun7CrOq
   YZcyhVNPlkwBQ0rVjMEHhv4vkOppjGXr1xnu4vSZhWsxDGnnrsrWWTWpG
   9zG8uBAmqZfJvQzq0Wn75FbY7sbqQy1mw9l8zT9r53N+QGUbltkTYXr/H
   yxWKQ1eWe/6h6TfeKS4Gwgkbx3dF/JZhir+9Uc9bj3o4+De3+Ea/yMBXY
   1fz1xf7ld/m96LCRTiBKGdxYbAG745u5ZxqGK58+UD6LPWmhvcCGgp1BF
   WBUylkQdXF7+yzFiP71S43xxa9APyqYDXW3ZKuUCNDWZocitqW9EsRXfc
   Q==;
X-CSE-ConnectionGUID: 4xasFpVwSxCtWOUuLkU4ug==
X-CSE-MsgGUID: jSLsPK1eRliC0AqnxGus2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="53501383"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="53501383"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 01:34:21 -0800
X-CSE-ConnectionGUID: fYoL0EfLQXuK/4nfBzb9vw==
X-CSE-MsgGUID: JD7hCEFIQLexggKUmtMEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124973521"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 09 Mar 2025 01:34:20 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trD34-0002tI-0i;
	Sun, 09 Mar 2025 09:34:18 +0000
Date: Sun, 9 Mar 2025 17:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2007/2007] ld: kernel/kexec.c:105: undefined
 reference to `arch_kexec_unprotect_crashkres'
Message-ID: <202503091725.g6h6oRC3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   944ce05f6b83ba40c4382c6b90b7b94f529118d3
commit: 47ff774cbb440dfc3cf5d5bc7cf82b41d4d99966 [2007/2007] x86, crash: wrap crash dumping code into crash related ifdefs
config: x86_64-randconfig-123-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091725.g6h6oRC3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091725.g6h6oRC3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091725.g6h6oRC3-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `__crash_kexec':
   kernel/kexec_core.c:1066: undefined reference to `machine_crash_shutdown'
   ld: vmlinux.o: in function `do_kexec_load':
>> kernel/kexec.c:166: undefined reference to `arch_kexec_protect_crashkres'
>> ld: kernel/kexec.c:105: undefined reference to `arch_kexec_unprotect_crashkres'
   ld: vmlinux.o: in function `__do_sys_kexec_file_load':
   kernel/kexec_file.c:350: undefined reference to `arch_kexec_unprotect_crashkres'
   ld: kernel/kexec_file.c:415: undefined reference to `arch_kexec_protect_crashkres'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
