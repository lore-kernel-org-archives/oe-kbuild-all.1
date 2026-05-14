Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE7E346AC1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778743911; cv=none; b=lR3zHGZqrDG7GHw4mApzU9uOYP4z3rJYHFanwK8D8tza9xkHcZr/+B90Y6xdbgpOy/OvluCve6m9T3p48kVhnGpW6l7v8ya6uzVkbMdy2zxwdJrks/njFEPmDMf1yDsqLNUDZ+2CTYqrCSamjQNtxOZLzxscS/h6dDcrPrHZRFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778743911; c=relaxed/simple;
	bh=5q72s1BQAWLxk5qPX/qPo1NykgTmPkn9xkIM/DuWAMA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u+mgfZn0vobyZvFOcSo0pcvz3Q2MtH8eLZ27wgN5Ah7Y6TuV1tJ9os1aabKnZehC6V7Rriw0hsRvBMxmsYKsfqyjR5E9/2GkQai6A5psCpb3CsMEiFKqI4ReVok9MrTJ0ueC0VuwlDaZQgu/hVTZ/jihwf6zNLH5695/0fyK/L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BywQDl77; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BywQDl77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778743910; x=1810279910;
  h=date:from:to:cc:subject:message-id;
  bh=5q72s1BQAWLxk5qPX/qPo1NykgTmPkn9xkIM/DuWAMA=;
  b=BywQDl77brn7QahE2hFaSVDSV0iXIyvKbLiWrfPbjLR7PRS5zpVIafeW
   xfHJckv19jk5y8FkGWv9Gm4EXzFS2Kwv1EDoO53rAara3RFlUXSwftUYa
   a/Xrs9PMjYtT+qJ30XgtaE9V4SKi5xKZ2x7NwNOPiXQ7o9XSA1VvJt5pP
   zCNvo54kVpaKzltjUGuX/JSF5xO7S+rbw7OwwiEu5G1Nf6MksByymGrKf
   ZhasMdvl802ZxLeS7Aynvo+4o20t70NtQaB7b2KFeaPPl1wOCfLGIT7hw
   +wwb8aYjZhfin3nVHkUSaWrvy5XPB6tG/cQjeA8LnWIKRk6NsINWYPGEh
   g==;
X-CSE-ConnectionGUID: 9PjLmSrtS8eLnnRyxNr5Nw==
X-CSE-MsgGUID: Nwyfn7PVQRaYIgen0kiUsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79712053"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79712053"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 00:31:49 -0700
X-CSE-ConnectionGUID: TghKESRIRlCC216QElgIUw==
X-CSE-MsgGUID: gEy0UGMSQzeRkmh19+j7Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="243292416"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2026 00:31:48 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNQXq-0000000062J-0Hs7;
	Thu, 14 May 2026 07:31:46 +0000
Date: Thu, 14 May 2026 15:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linuxsecuritymodule:next 7/11]
 security/hornet/hornet_lsm.c:44:23: sparse: sparse: symbol
 'hornet_blob_sizes' was not declared. Should it be static?
Message-ID: <202605141546.35eja3ay-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LinuxSecurityModule/kernel next
head:   7cd0da3c29d22e2a8dcbc995b12199bc3d2704a8
commit: c62310df81899f7e14d632271aba08d0a55e2318 [7/11] lsm: introduce the Hornet LSM
config: hexagon-randconfig-r134-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141546.35eja3ay-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141546.35eja3ay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141546.35eja3ay-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/hornet/hornet_lsm.c:44:23: sparse: sparse: symbol 'hornet_blob_sizes' was not declared. Should it be static?

vim +/hornet_blob_sizes +44 security/hornet/hornet_lsm.c

    43	
  > 44	struct lsm_blob_sizes hornet_blob_sizes __ro_after_init = {
    45		.lbs_bpf_prog = sizeof(struct hornet_prog_security_struct),
    46	};
    47	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
