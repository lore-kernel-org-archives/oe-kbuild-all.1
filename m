Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF81A1482E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731997556; cv=none; b=SORzKZnTU6gubmwbNk0cx/T0lr1MnZLOw95uZ8rpLX/EH+J8+nUO8RZfGvppd1DfJET/ZL2x4LvDmu87oeL1l+Ji+PUiqfNDHKw+tMejZd9LyZT7PftMp6V5hyy/6BheiwoxR/QpRFLYiwCq92vvuHd/Z2Uz3YcNWAZ9KKpJozo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731997556; c=relaxed/simple;
	bh=iEw/pbmxHWg2RIWPtJu4jfn7IRavtGGYsDokFq/IAyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nyyM5QSrH78YDdqXgRtcTj4UO3CHC1fKQ9d9onkJ4ImGvyjOZqhzsNrw/qc7s4UXmVZ4Tzpb/9xhR+5X6xmrDrOYFXqPPfCKHxUwpyf9qsgsGEIW0+TQbc/RcAchJusP/kAQyg1J9QdpSzfz7e7i3UkEoVE7c1KWOLQrFv+QqwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVy8CXmb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVy8CXmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731997554; x=1763533554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iEw/pbmxHWg2RIWPtJu4jfn7IRavtGGYsDokFq/IAyY=;
  b=jVy8CXmbjkHLFRQtblLka7KPHXCugh0wty7UYgixoTeWO3ce2vmaPx4g
   HROUde0KTeaejY18maT0OQ92F+faWPVKcN7KgiZg9i6bvcSzvMUBQv1Dj
   o+TLGhXmZ9y5EmlhM/t3luyuZP49jx4mwdhY5pmkfigFGXqmpPZE1GVPQ
   AxebDOG0W7+cXbn0ih7ANaeXVKWG2CuzxRZVNqBXKQ4dWOkTYX7KpmXQ4
   vSnxqYYq2ZLD6eB3V0n61Rb5GVJBjirFDQDPas3XltarGzTa0Xng0oOuM
   GhvlOkPmiFJ8DodASgQnF3MwRnII5DjHICUSAYd3MwWvvDbMNEerrEXPT
   A==;
X-CSE-ConnectionGUID: E2GVD1YPTaCIHSP/rIGZ9w==
X-CSE-MsgGUID: +5WeU8mGTVW1VmXOQ649Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31732427"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31732427"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 22:25:53 -0800
X-CSE-ConnectionGUID: HpDA+grJRu2QP0P8tUxsxQ==
X-CSE-MsgGUID: Lwo43PQLRImMfQ8sFi1Tyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89024062"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2024 22:25:52 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDHgG-00008o-1W;
	Tue, 19 Nov 2024 06:25:49 +0000
Date: Tue, 19 Nov 2024 14:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_content 19/21] ERROR: modpost:
 "filemap_fsnotify_fault" [fs/xfs/xfs.ko] undefined!
Message-ID: <202411191423.eEl9yEsr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_pre_content
head:   a2b4aa2a63d555f7b7d22f6f54583dff35a1f608
commit: d3e0f4f0a419a7012bcdc60530619ba2cdf96e85 [19/21] xfs: add pre-content fsnotify hook for write faults
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241119/202411191423.eEl9yEsr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191423.eEl9yEsr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191423.eEl9yEsr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "filemap_fsnotify_fault" [fs/xfs/xfs.ko] undefined!
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
