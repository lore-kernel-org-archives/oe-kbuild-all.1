Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19353CC9F3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551124; cv=none; b=mIiaY/qVkyv//sOMqhO+X84QWTQo+h/GSrbbC2YUe1sD7aPLQXaEBP95kTas0EcR3Mba2lPUGtdI/CtR9royrf45Jq2PRTYwjNbMiBdhaeuo8mCFQ/0ODsVU9C0Z+NoTsvNhFbd7Bi+wL0/tNtV2ect/xjjgObSPvK0UPPigKmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551124; c=relaxed/simple;
	bh=/7uVvsm4LXqyM6yQ4h580LPk14PQro4twt8CJA1PJRg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g3GG7kM4/FOcLEqSwCdf5sLaFboI2rQS3c01/f1p/azjg/ilIrHZi2j4WO/wCq0sen/T3CEEt24oMB74ysbVHjqxxa6SoXYS5gHuLsGtPIjBBTnOiLU1fl7etPUeo0h7LUFh+rp9+bOyKOtxyKksvrO92rtPRrrOWsoE0g6pjzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ka1/nI40; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ka1/nI40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772551123; x=1804087123;
  h=date:from:to:cc:subject:message-id;
  bh=/7uVvsm4LXqyM6yQ4h580LPk14PQro4twt8CJA1PJRg=;
  b=ka1/nI40EGoVqe2kdW/qCLLvtOgFLZWaB/G4yW/SuX3rvSNwoZrmgcNS
   lST+4SYkhTZ7cv1j+0fEjbmzGhsq5p+kcaPJtfK+a6gQuA1ZISAkc+tDz
   b1WN/7/9lTRXJfzE8Ka9xADAUZGrxNcMoqB0hLAyZtOlw+MaPcsEuNuDU
   H4AxC2l/XZcUMty2xYXUdxhoT3vwDm7e85Rk9TnyWa6V6gE4QfEW8Z9rz
   g+4B9j+PApYA2jbQ1BroE/AEsA0aXs3YJWMZ3MjSw3HzkpJm1A5xrAlf3
   YAFoa2tBUjRdO5/XVh8uWPzfNx4giHbyXEJswwxaL+uj6pyhLUT0ITg6t
   g==;
X-CSE-ConnectionGUID: B51GYqm2Q3eLLuGYMheslQ==
X-CSE-MsgGUID: 8LJUfzyyQtOBmuxGLaTm4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="61166477"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="61166477"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 07:18:25 -0800
X-CSE-ConnectionGUID: 8oqkFeB0SeGHQcVvMyngxg==
X-CSE-MsgGUID: AdDhfOsjRqmKQxlbifUfpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="222179372"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2026 07:18:23 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxRVs-000000002Q1-1Sqf;
	Tue, 03 Mar 2026 15:18:20 +0000
Date: Tue, 03 Mar 2026 23:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260302 10/12]
 ./usr/include/asm/setup_data.h:35:30: error: declaration does not declare
 anything
Message-ID: <202603032324.MS8Ytf1A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260302
head:   759ff201de93e9bf74683ac6d4414b9141b12c27
commit: 0c2f151521b10100c7f4415d3ef1f7ae4999634d [10/12] x86/setup: Avoid multiple -Wflex-array-member-not-at-end warnings
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260303/202603032324.MS8Ytf1A-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603032324.MS8Ytf1A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603032324.MS8Ytf1A-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/asm/setup_data.h:35:30: error: declaration does not declare anything [-Werror]
      35 |         struct setup_data_hdr;
         |                              ^
>> ./usr/include/asm/setup_data.h:36:14: error: flexible array member in a struct with no named members
      36 |         __u8 data[];
         |              ^~~~
   cc1: all warnings being treated as errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
