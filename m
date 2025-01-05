Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9713BACC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736069848; cv=none; b=GfKpzIAqRY64ADel8TeC918rVXAiWgRPDYOjW/UwHooD2G0odnuBrPZcjGer4wgRB/XUyyLJETDzp5XC4sXX+FGCvJqRxzLeSA3bwn1QLVYtv7Yve/q+ZdV+cLYOuCdWsFyemOSR0KzCEBn+rMmzwyNjOX+e/LG5CR9nFdZrh0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736069848; c=relaxed/simple;
	bh=N0FyqY85SY8Q9wKarpvNHZi9UTBZodjKj0w3F5hDETg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gYRMPmqb5WKe0KihCTL2gNY/pF9ZEYOkRsP5I89H3z3qJK2a1t0KnANamBDuhafbCzv/5Z+09nhLsf1J8aW6D+WphaZ0W7Z0cuMAShrvd659iQvAP1zcWymcc0RfHM48oBdZQu8mHCMFlgyYW8BYdPJ1sxyPtv0V1QmFLxOvs+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kUEGr2Kz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUEGr2Kz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736069846; x=1767605846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N0FyqY85SY8Q9wKarpvNHZi9UTBZodjKj0w3F5hDETg=;
  b=kUEGr2Kzn2LD8YbSbLUTVBwQcE3megHZ2HOSVs7ls0gzLsQza4gN+6ok
   HPT9yUT5qmVg1lobDqkPRFK0X9wP0JfFRip+bPVd5H2vG9qIdDTuy+CZv
   FimKJWjeBONQ0zvGKudzP27CNn14wG1BN7W8XH1iYdZzic0kRwkQllaCx
   XHJpMxIrmqkHEr/6q1wjTVKBStdWhFlfc2Ykyuw5XfekLRqiVciM7/7wU
   000xnrE200ua0fPrfIps8wmlTtlI4ZkEqK20MxFdoy8t7Z5H01xi2s+Ml
   oJUdTe1fnMqrYx7rjQiCZHPlu8XtFJlvViqsNJ24C+oYrCkaW4ETnf2NN
   g==;
X-CSE-ConnectionGUID: gdeVdo2YSkuDm3S4xfXqrQ==
X-CSE-MsgGUID: 1cNczQwgRk6NhOSzbgraqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="36357107"
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="36357107"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 01:37:25 -0800
X-CSE-ConnectionGUID: ksGDFov8St2soeFh9eHzVg==
X-CSE-MsgGUID: VkQ2rb/HS2qC5OIbk4CT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102665552"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Jan 2025 01:37:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUN4U-000BbA-00;
	Sun, 05 Jan 2025 09:37:22 +0000
Date: Sun, 5 Jan 2025 17:36:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Yu <jack.yu@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: sound/soc/codecs/rt1318.c:1149:34: warning: 'rt1318_of_match'
 defined but not used
Message-ID: <202501051728.qXANNrff-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jack,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: fe1ff61487ace69cd4e680e36169c90667eb9624 ASoC: rt1318: Add RT1318 audio amplifier driver
date:   7 months ago
config: parisc-randconfig-r025-20211224 (https://download.01.org/0day-ci/archive/20250105/202501051728.qXANNrff-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051728.qXANNrff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501051728.qXANNrff-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rt1318.c:1149:34: warning: 'rt1318_of_match' defined but not used [-Wunused-const-variable=]
    1149 | static const struct of_device_id rt1318_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/rt1318_of_match +1149 sound/soc/codecs/rt1318.c

  1148	
> 1149	static const struct of_device_id rt1318_of_match[] = {
  1150		{ .compatible = "realtek,rt1318", },
  1151		{},
  1152	};
  1153	MODULE_DEVICE_TABLE(of, rt1318_of_match);
  1154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
