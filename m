Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8372561D6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 22:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607721; cv=none; b=ceUKdeMnVmedmDW2yViWuvFyYwesJxTKsJ/Pvq484bDvckJYuwvlwbZQNGxRnr3ciTl8g6dDV4bZG9kShm+UbhVGVBxttztT7ot99pGsYRe7h8KbPJy5Qzej/A07jgGOV3EKsR0dc1Y+4k50EiM+Br9VZlhL5rCVHnqMQWF5aUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607721; c=relaxed/simple;
	bh=hGNfv/GRUdc4gVal34BYxJa2YRip5qr6qGom29pkWOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fjXlYJf5ZoJgJwpD8v9Y3OS6i78rv4D/ngDDE6mQTZSWer2b69MFnhdJOk+HVypRC2uax0BsGQVpynXxQW8/GqiJQdDSw2C82hAlDVteBOhkWpRu0KgE14CYBFJe7ms+yA1u8t3Dg0lObiiVXBv7a2PggGlBxdc/0woikzfP9Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjWmcN/z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjWmcN/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740607720; x=1772143720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hGNfv/GRUdc4gVal34BYxJa2YRip5qr6qGom29pkWOc=;
  b=kjWmcN/zJQUDJ35Cv8OI4T2Fe2rkx84bfB7Bd7P43qxVMpRjyOhbFCGB
   nrft9pkepVO6lfIR9g1+mv9Gu/WAA5zGqA6/MecKzfCl403N87wVwxbNI
   ZIBBQpHD6ocIlHIGLY4kXufg/TDHLsXI8av2WK4ZR7GtVkmUlDdHoXO53
   w4G5IQC3Y4i7Ldw4ZrzyQgq16N8p85glF0goSYykiPh0DcsN7vvEkDJ4t
   R9Bqn/nLDI7bs04SsrMwUGdexOYqGpvngcUVt9084ALmllIYFTYsfIxe+
   cNc/qom8dp0wvjuTrT0uYIbRnRhUpfAaac0oTCtXIplJu2iAdizMzu6pZ
   w==;
X-CSE-ConnectionGUID: e05eMqUnQr2mQjSyEZRmDQ==
X-CSE-MsgGUID: x7UrGMTXStKsgiRtvCQLXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41401952"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="41401952"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 14:08:39 -0800
X-CSE-ConnectionGUID: 6iqoJ1lOTwiGeICL+JsP5A==
X-CSE-MsgGUID: baapvhTJR56RwyUphF3/bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="117314377"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2025 14:08:37 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnPZZ-000CWY-1f;
	Wed, 26 Feb 2025 22:08:12 +0000
Date: Thu, 27 Feb 2025 06:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlelli:upstream/deadline/domains-suspend 3/4]
 build_utility.c:undefined reference to `dl_rebuild_rd_accounting'
Message-ID: <202502270505.8U2LCdyC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jlelli/linux.git upstream/deadline/domains-suspend
head:   78c2e4083eeedc3526f07bedfca514eefbe45e38
commit: 2d96e08126551c9773a9c9854d08c7559c9c90e6 [3/4] sched/deadline: Rebuild root domain accounting after every update
config: sparc-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502270505.8U2LCdyC-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270505.8U2LCdyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270505.8U2LCdyC-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: kernel/sched/build_utility.o: in function `partition_sched_domains':
>> build_utility.c:(.text+0x57bc): undefined reference to `dl_rebuild_rd_accounting'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
