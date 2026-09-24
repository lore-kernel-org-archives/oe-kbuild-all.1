Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F37E15746F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 00:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790210195; cv=none; b=e5Ga2UuYw/vrndW/OQcRi0RGz8PciDgFrU+fJEBO10z9uUANkzR4xhQX85TB6QxJyABdcxFtLoN7T8+SsOdcf0NPa0rFiwsIWJVszfohL7hOvL0pCuV9lv+iRu9o2mUDSmT2LILe4MgcL7693e6kVdSIwcd4+MitNC4UqRaVtwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790210195; c=relaxed/simple;
	bh=g4PjPOdNr6p9ljxnp/UFUK2Tn11XbxPj6BRVeurzseI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uq/E5oO0S6G2WNFq9d2sBjsYa5qGktKZ/P79TEdOzFjIOMMd4VxxT/+/wWU0+m/P49xOhzI6BuVMEPW6gsP56m7abV4ZWfi6REVQ0/yxm1LEfEL7lqk7fnBsog18NdYRUbJq3j1KzGzChU64lS3AsRmSZkDzwlEXFvPZrWJojtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCahxiLk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCahxiLk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790210193; x=1821746193;
  h=date:from:to:cc:subject:message-id;
  bh=g4PjPOdNr6p9ljxnp/UFUK2Tn11XbxPj6BRVeurzseI=;
  b=GCahxiLkMqq6PqkBue+yE1UWwenzAf31l2hPGpUHer36q+mX7Ocy0CFl
   9fp6pOPZrv7B5VhSafYCrYodXL8DkUA5Ceat5zscuqaUmQ+Fqc9iJffO+
   +4C2cDyb+hu0l7vsWOcwQLWkP49fKmLF2dC5d8O+NjdqXf1rvTJfg7FCE
   8YDqaJq4fmlqy8/cMjryn779Rtcl7zeG6QfIOozvnA/NOQVnrctJYgE1e
   BuZPx87Z+n+GMDgMmhz749AGitMVDPSH6slP/ZFdPCB1ZQJC/WEgBu8h+
   79lUAxCU8REKk/rpCwiNvMpMf2FMmupW1RYAGTedPczmIJVvDMiBgUIwN
   A==;
X-CSE-ConnectionGUID: OxjGez4mQMe9sdmRH7v4hQ==
X-CSE-MsgGUID: /pimNWwTRq2RcU6MnVagNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90983091"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="90983091"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 17:36:32 -0700
X-CSE-ConnectionGUID: I9bsiZG7TTK1ASApS+/57A==
X-CSE-MsgGUID: i5Lc7YnRQiCw/5ndzJgPiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="301795615"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2026 17:36:31 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9XRt-00000000095-0yT5;
	Thu, 24 Sep 2026 00:36:29 +0000
Date: Thu, 24 Sep 2026 02:36:13 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Subject: [linux-next:master 7215/9480] Warning:
 drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'val' not described
 in 'sppctl_func_set'
Message-ID: <202609240204.VHoUp5qw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d7783543c2646af69ad65825e810060494bea21
commit: 7dcf87d2dbbe8c9c1efb69fe9be728a3dfd51d3d [7215/9480] pinctrl: fix PINCTRL_SPPCTL=m
config: nios2-randconfig-r2100-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240204.VHoUp5qw-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240204.VHoUp5qw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240204.VHoUp5qw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'pctl' not described in 'sppctl_func_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'func' not described in 'sppctl_func_set'
>> Warning: drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'val' not described in 'sppctl_func_set'
>> Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'pctl' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'reg_off' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'bit_off' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'bit_sz' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'val' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:261 function parameter 'chip' not described in 'sppctl_first_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:261 function parameter 'offset' not described in 'sppctl_first_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:296 function parameter 'chip' not described in 'sppctl_master_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:296 function parameter 'offset' not described in 'sppctl_master_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:695 function parameter 'offset' not described in 'sppctl_fully_pinmux_conv'
   Warning: drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'pctl' not described in 'sppctl_func_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'func' not described in 'sppctl_func_set'
>> Warning: drivers/pinctrl/sunplus/sppctl.c:175 function parameter 'val' not described in 'sppctl_func_set'
>> Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'pctl' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'reg_off' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'bit_off' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'bit_sz' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:228 function parameter 'val' not described in 'sppctl_gmx_set'
   Warning: drivers/pinctrl/sunplus/sppctl.c:261 function parameter 'chip' not described in 'sppctl_first_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:261 function parameter 'offset' not described in 'sppctl_first_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:296 function parameter 'chip' not described in 'sppctl_master_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:296 function parameter 'offset' not described in 'sppctl_master_get'
   Warning: drivers/pinctrl/sunplus/sppctl.c:695 function parameter 'offset' not described in 'sppctl_fully_pinmux_conv'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
