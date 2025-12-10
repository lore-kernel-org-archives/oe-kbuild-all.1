Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5CE2F12CB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765365916; cv=none; b=rZzGqTzQp6COIQnWgBurveg2BWcnzK95NFHKuy/6jnaqHA1L9v+J8Taf4eNLRSsERZHLSifaLYbwqVkbFuD3SOGkVCcyjnwrVDZ30/PVuvynkNUvBEU2lMs0Wb7rrnd/hzNh8ZvqaCKxIwgQ9nAhSw/BvysiRv25Mr3Pnl864cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765365916; c=relaxed/simple;
	bh=vDeI2+bK+nsBPaErZvH15cWNGMwbAdJXIbIKnsxBl28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BnlTwXveGNnaPDPuiN0sGiUtOwUbFoJKAD17xsEXccN90R2ScEpwFmNW30qQonHkE3srLsVQAUjymI/BXviLPSlcVDD8Lc1jT8PY6IZBC6on6hpnsYzttM3MDqJLdCxWG/tv13sgFxVNDAubIzpUJailXyOe2qbgAIR9mhwu67Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVJmje79; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVJmje79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765365915; x=1796901915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vDeI2+bK+nsBPaErZvH15cWNGMwbAdJXIbIKnsxBl28=;
  b=VVJmje79FWk7DXx1DpqSC/U9vcOImfyLuPSESLkD28lYmPCmQzeTiaPI
   1Wh57O/6H2X1u2qcFLuyUsWE/r3G4T4wdNhpMGRHxZyEAxpsIBDvZvbFo
   PnqxrH/TtkUChhOwVN3nbczm3u6wCf5tCxySc0DhN/Ns55eYqwD4C4u/n
   U8w+muB7EEzaXY9eIqZI+Zho7Hg3G/raQhu8FDtosiL1zqd5MfwAqpPdt
   bqZ/mMdVrj1+MvIYAgLnPrkLTnxXO/AjMKVeRrtZxEQkrObipF7cSDfGp
   ARsR7k3bE7VPm19TBtDCm8IVQcBICEqU9VqFteUYlTmrsMq6gOszLBc96
   g==;
X-CSE-ConnectionGUID: YdNGFnSZRYuM/wfqh4MBQA==
X-CSE-MsgGUID: ZHGDQobQSYa4ttPnwdzJcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66513490"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="66513490"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 03:25:13 -0800
X-CSE-ConnectionGUID: rBwOwCd0Rp+LDd+nSPFN8A==
X-CSE-MsgGUID: lGt/4GUDTIyPdD5e9ALs4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="200981984"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Dec 2025 03:25:12 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTIJh-00000000387-29Gv;
	Wed, 10 Dec 2025 11:25:09 +0000
Date: Wed, 10 Dec 2025 19:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 13941/14066]
 drivers/gpu/drm/xe/xe_survivability_mode.c:215:1: sparse: sparse: symbol
 'attr_capability_info' was not declared. Should it be static?
Message-ID: <202512101919.G12cuhBJ-lkp@intel.com>
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
commit: f4e9fc967afdb53b1203f894fb4b68451a7fe202 [13941/14066] drm/xe/xe_survivability: Redesign survivability mode
config: i386-randconfig-063-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101919.G12cuhBJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101919.G12cuhBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101919.G12cuhBJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_survivability_mode.c:215:1: sparse: sparse: symbol 'attr_capability_info' was not declared. Should it be static?
>> drivers/gpu/drm/xe/xe_survivability_mode.c:216:1: sparse: sparse: symbol 'attr_postcode_trace' was not declared. Should it be static?
>> drivers/gpu/drm/xe/xe_survivability_mode.c:217:1: sparse: sparse: symbol 'attr_postcode_trace_overflow' was not declared. Should it be static?
>> drivers/gpu/drm/xe/xe_survivability_mode.c:218:1: sparse: sparse: symbol 'attr_aux_info0' was not declared. Should it be static?
>> drivers/gpu/drm/xe/xe_survivability_mode.c:219:1: sparse: sparse: symbol 'attr_aux_info1' was not declared. Should it be static?
>> drivers/gpu/drm/xe/xe_survivability_mode.c:220:1: sparse: sparse: symbol 'attr_aux_info2' was not declared. Should it be static?
>> drivers/gpu/drm/xe/xe_survivability_mode.c:221:1: sparse: sparse: symbol 'attr_aux_info3' was not declared. Should it be static?
>> drivers/gpu/drm/xe/xe_survivability_mode.c:222:1: sparse: sparse: symbol 'attr_aux_info4' was not declared. Should it be static?

vim +/attr_capability_info +215 drivers/gpu/drm/xe/xe_survivability_mode.c

   208	
   209	#define SURVIVABILITY_ATTR_RO(name, _index)					\
   210		struct xe_survivability_attribute attr_##name =	{			\
   211			.attr =  __ATTR(name, 0400, survivability_info_show, NULL),	\
   212			.index = _index,						\
   213		}
   214	
 > 215	SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
 > 216	SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
 > 217	SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
 > 218	SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
 > 219	SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
 > 220	SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
 > 221	SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
 > 222	SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
