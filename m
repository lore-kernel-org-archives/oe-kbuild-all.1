Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6268D2EAE3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 02:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707798; cv=none; b=pIrN0XC81avfXxuR86sySJ6SKS0MYMp5qmRyhS/wGpc9JI1yq8OMHKiqRN7eIKeYVD4p9vSVufh2YFfMswK/CTa4N6RQyGXMn2m1qLmZQgikiV1hxHg6/SMnYikVAEZv7KBUtSiw0JBHthDK2YwLr498QGHpwImuP7e+TRvrowk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707798; c=relaxed/simple;
	bh=/wldyWsnAKA/YOhrSrGKbjkTPpaQnIHtboYFwSQBrDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a2dvxcfo364B+aivDNXRMlXvuiisSlxpYmdDXYSPBI99uWIZVWpYgeh7m4rZYjUUm2GTB8mDrXcD7+zNqgr6SqylDmDHd7qShxNA151xjEHSIr6pbb20hT2a3D1F+Wv3Tu1exp86ZJgoZzzIuoFEMr+BRbHBMjJa7+mMOucGKLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNxPJncG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNxPJncG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747707796; x=1779243796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/wldyWsnAKA/YOhrSrGKbjkTPpaQnIHtboYFwSQBrDA=;
  b=iNxPJncGnq/PGtlNSlVdEWB09dhEtpYFoP354JT8Ssd9eEojNStYRyU6
   exCKcaonY4FT47vZivwLzHJqwBQgVOrIpvTfhUWoLhrvCHFTYOPjbqtra
   xm9/bCu2IR4LuK0H5w7CDd5D74BnJKgGlmnHBczCKWau5fB/VcGSXtDuX
   HmPgK6Zs0CdRsG7xAE6C/39P9FVxQxoatkAJZOg5soOQYqmmUmBQ43dSr
   U7MIdY750l2XOB68m1U+wf/pZh/OPuLOiWRBCxYE/aqRrZQGsc2IfSBx9
   txLot/5mXuc7GfwhVtxK/jppUSqAegHDIgTW6SGTf4ZKd1eWO2Sebdkgb
   A==;
X-CSE-ConnectionGUID: BFrTPg2vRWaFmTT85iVRYg==
X-CSE-MsgGUID: dXbeUoGRTomplRlyyeS6xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49607840"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49607840"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 19:23:15 -0700
X-CSE-ConnectionGUID: GUSgRJunR9OF3x5RbuAGFQ==
X-CSE-MsgGUID: wPy/Wi2XRcSnpPx59HZsaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140555270"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 May 2025 19:23:13 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHCdL-0000vH-1I;
	Tue, 20 May 2025 02:23:11 +0000
Date: Tue, 20 May 2025 10:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:rzfive-cache 3640/3677] Warning:
 drivers/leds/leds-lp8860.c:101 Excess struct member 'enable_gpio'
 description in 'lp8860_led'
Message-ID: <202505201022.2hLkgwtc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git rzfive-cache
head:   b3de5943f1834862cdd3ebfaf45ced907e808ece
commit: 81831eb45f256632277d4f3abd95093a9a8fbadf [3640/3677] Merge branch 'for-leds-next' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git
config: arm-randconfig-2003-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201022.2hLkgwtc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201022.2hLkgwtc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201022.2hLkgwtc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/leds/leds-lp8860.c:101 Excess struct member 'enable_gpio' description in 'lp8860_led'
>> Warning: drivers/leds/leds-lp8860.c:101 Excess struct member 'regulator' description in 'lp8860_led'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
