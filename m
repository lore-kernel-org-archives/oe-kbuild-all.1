Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669D02107
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711168670; cv=none; b=uEwjzjmACyE0hszZHtYYnCsAop38H8vQXgfY7VX//smBUKN54fM/VAGeKvPAOT1nvFKFhushNTn4u8C1gn0okn4LgL+DqcLXiyHmlL9tv+OxGAloshAzmdhP9S+Pw5VodusoC/B/mzghA6wP2baXhLiW1fV//ipfXu8j2iPPMfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711168670; c=relaxed/simple;
	bh=ETPsEbw/Y/k3N5wKTZcfTT8qBXMAMSv1DYyOifC5160=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wj+Kmk4HT94+6latyQ6BppiO2dDVtjrJNI0uXa2CnIge5zxPCec4Ds+9Kg3a2Qw+rrYLqmhMe5z08PDs3u+lRI4ZTTcEWJN+pxV07nZr4VowC92MhebQGQB8X4xJB75HOuzhDzrsDdWWbCahTGn0XwDW09QvWBVAN2aJX723AAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OU/bZHQo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OU/bZHQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711168668; x=1742704668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ETPsEbw/Y/k3N5wKTZcfTT8qBXMAMSv1DYyOifC5160=;
  b=OU/bZHQotYYj4aNZKNCsfi5BJmm1sNOI8pA8tlenUc9QsrCMmT04oUS5
   OVNYRR8pbp4wS/6Uw3PayVPFXosRU973aoTyJHiYer2FnjDhURuapZtED
   mDgmCxUJ22UMF9eUrc1l2CBvBeFnetNlrfXypK5RLHSneBKSmzW9dNEO3
   l1FbRJWrm9CdUlUj14EQCkHF6np8kdGRu3fqbMufnQ7vQEEIq2y7TMyed
   1m3xOB0OrqaE89MIrvGovJjtitL9Cxkk9YjmcaI6Sz9KSjyGkINBREEuN
   E9hL+QBb5VvsErRsVTac5OhqDPEC/U0t2fFDX2LKPl5YlBUJKTXALsCM4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="10031817"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="10031817"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 21:37:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="15005920"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Mar 2024 21:37:47 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnt8a-000Krj-0p;
	Sat, 23 Mar 2024 04:37:44 +0000
Date: Sat, 23 Mar 2024 12:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-remove-absolute-percpu 2/5] gcc-7: error: unrecognized
 command line option '-mstack-protector-guard-symbol=fixed_percpu_data'; did
 you mean '-mstack-protector-guard=global'?
Message-ID: <202403231204.sFadzZaf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-remove-absolute-percpu
head:   811d6eeae9abffb646afa9c418d4658e6d91cdd6
commit: 97a3fc799b91eabbe92571ad751d8b101bb53b60 [2/5] x86: Define the stack protector guard symbol explicitly
config: x86_64-randconfig-016-20240321 (https://download.01.org/0day-ci/archive/20240323/202403231204.sFadzZaf-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231204.sFadzZaf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231204.sFadzZaf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> gcc-7: error: unrecognized command line option '-mstack-protector-guard-symbol=fixed_percpu_data'; did you mean '-mstack-protector-guard=global'?
   make[3]: *** [scripts/Makefile.build:243: scripts/mod/empty.o] Error 1 shuffle=3425969023
>> gcc-7: error: unrecognized command line option '-mstack-protector-guard-symbol=fixed_percpu_data'; did you mean '-mstack-protector-guard=global'?
   make[3]: *** [scripts/Makefile.build:116: scripts/mod/devicetable-offsets.s] Error 1 shuffle=3425969023
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1189: prepare0] Error 2 shuffle=3425969023
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2 shuffle=3425969023
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2 shuffle=3425969023
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
