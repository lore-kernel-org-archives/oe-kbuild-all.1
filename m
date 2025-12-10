Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981B23254B0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765370239; cv=none; b=fd+pX5U0iqt79+2bWPOUTChwYIpLUg97WbGJxc/D1/YcI8rtTgmmsWzOYEurj28n7U5qRlcPpXg7kGTA9iNcqHjI3OCrnL/bYMk8criRsR4NzTCkq7T4tewfwLt5/gEcAKEQxhBPhXVX3MnOnopCTen5F/+U/vzcmy6rHU5G/2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765370239; c=relaxed/simple;
	bh=3etqmPrTX92nX4TsNy6OLxFlMcZrOp+2odu04unOSlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhglRpMlz2jYZmi987NV8xOf/twXj4p4gGIf7Eiu+rZ33EOcRRC4IyeF6UJ5VyspBDT1WtajNH45GvoObtMLiyO2A2PnnCOO+J49PEzp8uEsdt/ogN0jiVitaBVntNvdYma44c3X7Lt7OW0Yj13NbvDjw4iIj4LHBRUW0oXSYJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E50waanj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E50waanj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765370236; x=1796906236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3etqmPrTX92nX4TsNy6OLxFlMcZrOp+2odu04unOSlc=;
  b=E50waanjbmYBWlPLQInjNWbKaAFmXvfbUosyFBcSJ4jIAUqpE9aIUw99
   vz/7EkjDWNbx61waJ7jBKc8QLbvhr3Jp08xkg9J6JyH+gpk0FHHOgSS2C
   +6UEMicebl59RGeFysyAvV2IQll9T7iKR+vucUFIIvcmyo+P6zi8Uf148
   CtSy4ctyQZJg8Uo1NKu5FSgkg865xmMyTseV2iWVRzyAU6L3KkY3JjWJp
   uYY/ga0dDGTpGAXqW+huAA20YNqIuL6INvYwxmfa2y98Mwvgyj6oS8Kk7
   sNXXpCAmUhOEN/1vrlovbs9ULJt5lyqCj0PkjlNl4BLKc+n1NQKYrRxxk
   w==;
X-CSE-ConnectionGUID: 5peTx2HUR9mrxIr/qw3ToA==
X-CSE-MsgGUID: +Im0qnqwQCKm6VAjMagXSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84749480"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="84749480"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 04:37:15 -0800
X-CSE-ConnectionGUID: FEbTeSzYTFKthxxQC3oD/A==
X-CSE-MsgGUID: sH4jz8D9RyGikChkqjJmVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="201618514"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2025 04:37:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTJRP-000000003An-2Uft;
	Wed, 10 Dec 2025 12:37:11 +0000
Date: Wed, 10 Dec 2025 20:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 13942/14066]
 drivers/gpu/drm/xe/xe_survivability_mode.c:239:1: sparse: sparse: symbol
 'attr_fdo_mode' was not declared. Should it be static?
Message-ID: <202512102006.cWGs6pX5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   008d3547aae5bc86fac3eda317489169c3fda112
commit: 1987ea95ac37ea3f9299d220974676207d5262f6 [13942/14066] drm/xe/xe_survivability: Add support for survivability mode v2
config: i386-randconfig-063-20251210 (https://download.01.org/0day-ci/archive/20251210/202512102006.cWGs6pX5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102006.cWGs6pX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102006.cWGs6pX5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_survivability_mode.c:231:1: sparse: sparse: symbol 'attr_capability_info' was not declared. Should it be static?
   drivers/gpu/drm/xe/xe_survivability_mode.c:232:1: sparse: sparse: symbol 'attr_postcode_trace' was not declared. Should it be static?
   drivers/gpu/drm/xe/xe_survivability_mode.c:233:1: sparse: sparse: symbol 'attr_postcode_trace_overflow' was not declared. Should it be static?
   drivers/gpu/drm/xe/xe_survivability_mode.c:234:1: sparse: sparse: symbol 'attr_aux_info0' was not declared. Should it be static?
   drivers/gpu/drm/xe/xe_survivability_mode.c:235:1: sparse: sparse: symbol 'attr_aux_info1' was not declared. Should it be static?
   drivers/gpu/drm/xe/xe_survivability_mode.c:236:1: sparse: sparse: symbol 'attr_aux_info2' was not declared. Should it be static?
   drivers/gpu/drm/xe/xe_survivability_mode.c:237:1: sparse: sparse: symbol 'attr_aux_info3' was not declared. Should it be static?
   drivers/gpu/drm/xe/xe_survivability_mode.c:238:1: sparse: sparse: symbol 'attr_aux_info4' was not declared. Should it be static?
>> drivers/gpu/drm/xe/xe_survivability_mode.c:239:1: sparse: sparse: symbol 'attr_fdo_mode' was not declared. Should it be static?

vim +/attr_fdo_mode +239 drivers/gpu/drm/xe/xe_survivability_mode.c

   224	
   225	#define SURVIVABILITY_ATTR_RO(name, _index)					\
   226		struct xe_survivability_attribute attr_##name =	{			\
   227			.attr =  __ATTR(name, 0400, survivability_info_show, NULL),	\
   228			.index = _index,						\
   229		}
   230	
   231	SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
   232	SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
   233	SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
   234	SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
   235	SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
   236	SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
   237	SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
   238	SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
 > 239	SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
