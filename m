Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210335FEED
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736111271; cv=none; b=b3oFLjDSqTOULJ10dAFvHL8HcNqE35PsAUJ0uU59OHzS48+ygS1F34yOSDDFmNX9VnxAngAMk8n4nORj1l+9Cz4jkMW+fb49XLxh04ixL97nVthdSDOTEsoEBJu8z4qJQqc6zVlVM9vYp9kaA3PdK6zW0vE9xEDxmHerfAVeQTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736111271; c=relaxed/simple;
	bh=Ksfx8+X8iAo9DgmFvaYWOuXaewtHooQUTjU5zFD5f8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QOI/goSwxh9B7H91a+1lpc69T1rKLkygiwJdcFQQL/ynFTUGNGh6IepKUCblQ/nleyDikXudJGpeH2lQMM6mu3L0Q19nAM4JkcnfitYf9p0kBogqMrxpOj9DdEok83Jak8YrqWzM3r6uSTBJvgcJqI7qWvuJtMo/z2IIvaXq2fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DctNk0dl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DctNk0dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736111270; x=1767647270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ksfx8+X8iAo9DgmFvaYWOuXaewtHooQUTjU5zFD5f8I=;
  b=DctNk0dlc3kxRZya5t9imqsOlXR3RZo3gBGy3O7zK5KSxkdN+OjwkpOd
   QyQlAfTKfOMEJwQIg54eotSRmQMCoux70cJUqVE93Y1f9J/5Jj8LdDbUo
   Mzq/gnCqjzL92EmkfM93EIhxuNyTsJgMeqyO4yRBR9eTglslPQGP5erRS
   fl5lgrsXBpPpQuE+KNjWvLZ7jVlPrqm7AwTmYqG+afD+yAMFZcsSLvrFk
   Bn/mUcFgkfUiF2uYa87yF77u62I86HcS0lh8tu+otunKucWih4ggI8XLl
   Sgfl+I62Cyin9SCgUXgfKZHGlQwnB+ReE5LJnBJIQn/Q6qjIHadWVIDWS
   A==;
X-CSE-ConnectionGUID: sqH2oxD4RNScD+aGW4n6ig==
X-CSE-MsgGUID: rmutWuVJSZ2TTlFV/uSs/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="47249458"
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="47249458"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 13:07:50 -0800
X-CSE-ConnectionGUID: AfNFs8RmR862NDA498WJLw==
X-CSE-MsgGUID: jQuDrS/1SMONLfmvgNnDHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125549097"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 13:07:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUXqb-000BzG-2L;
	Sun, 05 Jan 2025 21:07:45 +0000
Date: Mon, 6 Jan 2025 05:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Subject: security/landlock/ruleset.c:644: warning: Function parameter or
 struct member '' not described in 'landlock_init_layer_masks'
Message-ID: <202501060543.XG0RGoPB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9244696b34f2a626d7468864420ab6a47289bf10
commit: 0e7410112964168a65578002269ae3b80b207936 landlock: Move and rename layer helpers
date:   1 year, 2 months ago
config: csky-randconfig-r026-20230729 (https://download.01.org/0day-ci/archive/20250106/202501060543.XG0RGoPB-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501060543.XG0RGoPB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501060543.XG0RGoPB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 182.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 182.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 182.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 182.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 182.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 182.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 182.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 182.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 182.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 182.
   security/landlock/ruleset.c:182: warning: Function parameter or struct member '' not described in 'insert_rule'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 182.
   Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 182.
   security/landlock/ruleset.c:182: warning: Excess function parameter 'layers' description in 'insert_rule'
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 644.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 644.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 644.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 644.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 644.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 644.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 644.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 644.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 644.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 644.
>> security/landlock/ruleset.c:644: warning: Function parameter or struct member '' not described in 'landlock_init_layer_masks'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 644.
   Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 644.
>> security/landlock/ruleset.c:644: warning: Excess function parameter 'layer_masks' description in 'landlock_init_layer_masks'


vim +644 security/landlock/ruleset.c

   626	
   627	/**
   628	 * landlock_init_layer_masks - Initialize layer masks from an access request
   629	 *
   630	 * Populates @layer_masks such that for each access right in @access_request,
   631	 * the bits for all the layers are set where this access right is handled.
   632	 *
   633	 * @domain: The domain that defines the current restrictions.
   634	 * @access_request: The requested access rights to check.
   635	 * @layer_masks: The layer masks to populate.
   636	 *
   637	 * Returns: An access mask where each access right bit is set which is handled
   638	 * in any of the active layers in @domain.
   639	 */
   640	access_mask_t landlock_init_layer_masks(
   641		const struct landlock_ruleset *const domain,
   642		const access_mask_t access_request,
   643		layer_mask_t (*const layer_masks)[LANDLOCK_NUM_ACCESS_FS])
 > 644	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
