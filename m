Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D2F3211
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 01:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739497801; cv=none; b=rQJ6G7viwMelHA69J0lqjFP2mPPG6aAI45sSG7heryWRANgy7CNlG87mvdzrN+5O4P5UnYzGvU3rYNdegVGfJ4Cx8Dd995nLbde82KPUG7vetkGQ0pirgRCW9fCG6ZZplCuNSeOKYdH5e3MWnzOWEPqJRi4ZA7ZXrjygzHzsdhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739497801; c=relaxed/simple;
	bh=uZIqZBgSw6MHMa59JE3fs0UQGhaLRFCXQDuYAWbtbcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VHj8RmkcDbxVnrGzrO01sfQoF3RHhF+CspYbMsK64QT2drxUFDkIj3KBLYEQlmlk8g6NBsDEvjEeGGHZrrRRDJoPr5O+jrsGXWU4ypF3v3cC5yJCt4ZBsVbgLyuBS1q26KG9ijchX/rhHTjv2aP8T71KrP1eLSyhdBDgQWgtBr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZrMu6Ht; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZrMu6Ht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739497799; x=1771033799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uZIqZBgSw6MHMa59JE3fs0UQGhaLRFCXQDuYAWbtbcE=;
  b=TZrMu6HtfpFX6EeXPlSEQXV9m7rS55prf7HgaGNr1yzzEDVYZFtAd2My
   A7fdIe+zpAmHQ8ZAt8GjGGXfFrT6VKygiw8dWL5sUX4hUtvP1SERaORAz
   /k1wx6Aq2zcl5SC9kaogj4Yu3oABO3wtKVGNpcDgZkOe1R+SLf9/hmUlf
   XE3cH3wMaXfREKoWuF1MNq4F6JUaHNW/54IID2Etr4mwvQVeUYn4Nl0XL
   6BGQpxjm3aIG8qav9ZL7Rq6ewaeKLOvkkcp2AGNLxECxkQN4k3XiKps5+
   qcsXchqJ5BCkRyyyBpbSh+uE5CQehfEz+XsNSbEecY9q2b/8GpiRIYGxr
   w==;
X-CSE-ConnectionGUID: jpzA7i6pTX+i+nSs1vYkTA==
X-CSE-MsgGUID: GqaXF/hoQTuFBHiE1sOC9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40093904"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="40093904"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 17:49:59 -0800
X-CSE-ConnectionGUID: PaJLY80jRaWZbOBiEL37qQ==
X-CSE-MsgGUID: AC/aIoHuTgqRezpnWCv0Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="144184554"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Feb 2025 17:49:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tikq3-0018wP-2F;
	Fri, 14 Feb 2025 01:49:55 +0000
Date: Fri, 14 Feb 2025 09:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 3/26] lib/test_capability-analysis.c:15:9:
 sparse: sparse: incompatible types for operation (!=):
Message-ID: <202502140943.uVg4P69O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   9c8d14ce8aff2d38bf494f5d5436a302e3236842
commit: 253098e71de0ef676e7abfab510da9e73500db47 [3/26] compiler-capability-analysis: Add test stub
config: i386-randconfig-r111-20250214 (https://download.01.org/0day-ci/archive/20250214/202502140943.uVg4P69O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502140943.uVg4P69O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502140943.uVg4P69O-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/test_capability-analysis.c:15:9: sparse: sparse: incompatible types for operation (!=):
   lib/test_capability-analysis.c:15:9: sparse:    void
   lib/test_capability-analysis.c:15:9: sparse:    int

vim +15 lib/test_capability-analysis.c

     8	
     9	/*
    10	 * Test that helper macros work as expected.
    11	 */
    12	static void __used test_common_helpers(void)
    13	{
    14		BUILD_BUG_ON(capability_unsafe(3) != 3); /* plain expression */
  > 15		BUILD_BUG_ON(capability_unsafe((void)2; 3;) != 3); /* does not swallow semi-colon */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
