Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737891EF0B0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 22:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766355381; cv=none; b=Twqn0HtNenQcPXyRdPYqDGksUkgycmHzuRMG9jiHo+RF15Jh8jMvM1aQdlgBy7hVPaWdpRMJZAx/QUUmIyWHq0jhNIm6dnzIPdCK23Zr/TRDOAhHgFK8MCYmHZ4pv90jPzVg0a/oY22vRAsez69iePjMsGDDFLRhxaQBWD47uBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766355381; c=relaxed/simple;
	bh=8ib/a/5kX7NDesUI8OHuK2TtpZmlAFg+IKciNhDu1WU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GI+SQFmjDtgwFbNmAhQK+/LVtzWFf9tNdTud03YQjypDEERhAvH5nIIwlHb009FXO91V9Y8zZPynNBAqMEGwIwE1IWjB1SaAKp4ybICvpGbdgsI4F0GCjx4fW0pTG5uisPJF49X8Qn+vI2M7McvZyw3W5sK3O1vy18O2FKDa6NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkZUMh6v; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkZUMh6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766355379; x=1797891379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ib/a/5kX7NDesUI8OHuK2TtpZmlAFg+IKciNhDu1WU=;
  b=XkZUMh6vqtv9X3YiFCsv5KZ7vObxeiSGj7pJCM8BDhkPkL4vlDROgd07
   5YaWYE2aQp4Ddd41Bj4OaRT9BM0nrMcQ7VQjkbITDS4twx8hjc/s7mB4L
   F8cMyjwFPeLsvWWN/zRgqWuvy0C8KAow6lmmMzhBLqJUsRa15ZfvrmBlB
   oY7Oas6gKIh5rcOcAXxkEhpzTZcal52PVZt3yyu3+YTpVzJ7bVeLiC1aS
   eadr5gWvFliRY4LuSZoaIRzj2NHEBWaDy/89VjAmSAazYkiwr+Pk/4rOE
   uwUlCWAA3fLgSzYnYrFwgMckOjXiLiW6eHaAFGHz2/6c3XJSMQvki0c9E
   g==;
X-CSE-ConnectionGUID: GbgdqAL7QVW2RYH3x7540g==
X-CSE-MsgGUID: xXNrJpLfR3eUblafIi9sng==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93694879"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="93694879"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 14:16:18 -0800
X-CSE-ConnectionGUID: 8pl/x06ZRji9m+4KAeh37g==
X-CSE-MsgGUID: pLvUEQ3hSUGlhdd8BwiM6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199018407"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2025 14:16:18 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXRip-000000000Ep-3NeY;
	Sun, 21 Dec 2025 22:16:15 +0000
Date: Mon, 22 Dec 2025 06:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jian Zhang <zhangjian210@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3415/3415] arch/arm64/mm/init.c:730:6: warning:
 no previous prototype for 'ascend_enable_all_features'
Message-ID: <202512220606.726hmC01-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: 66ae8ddda388386daea0623a65ea2ac85c24ca00 [3415/3415] ascend/arm64: Add ascend_enable_all kernel parameter
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251222/202512220606.726hmC01-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220606.726hmC01-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220606.726hmC01-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/init.c:730:6: warning: no previous prototype for 'ascend_enable_all_features' [-Wmissing-prototypes]
     730 | void ascend_enable_all_features(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ascend_enable_all_features +730 arch/arm64/mm/init.c

   729	
 > 730	void ascend_enable_all_features(void)
   731	{
   732		if (IS_ENABLED(CONFIG_ASCEND_DVPP_MMAP))
   733			enable_mmap_dvpp = 1;
   734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
