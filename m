Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04AE79CD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736153659; cv=none; b=N3IFbHJ4antcZ35aAzsrQOmmSmGvmW1iLf9sqSu0cFXk8sADQ5qj2EAwOfe502RVUK57v9pHQzGKHtYSwjyyetm7T3j7x5sHZ22kjx+bgrtwWn1sDmHRQICPqihOzSXEowEfVjb5K3Sg7jUtYIYRkmdMgt6oKbZcqe4ENkYbLTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736153659; c=relaxed/simple;
	bh=rd5yIrMpeMEbKPxBhUAf+6BzUQPS3MQrY+5dxjo6JxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uTDKUwX/RKcGOjZuZiSStfsnY9HdO06uLZ0qXZeLsykl/oYDVUnx6/1opght/oP5+HLdujBX9TWd3kLNCDMBTdvjO/v12Mw+ihSef3t7NOBnHBOuLdP/t1ohJR8Nom/Cyi/Cx7ik0F3U56e1KHXqD0+CBV/IFnivewJRUHKXS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QoYgYxr2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoYgYxr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736153657; x=1767689657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rd5yIrMpeMEbKPxBhUAf+6BzUQPS3MQrY+5dxjo6JxA=;
  b=QoYgYxr2nL3vgzqU8iIUuuj09OnqnA45LNF8LwlJafNv4rUN0Rmdyfsn
   wm/am7s+JLcxrXS0YmGm9jzZKbQ5vGVGUqOtUygnZWHLr8Dqhm2D0E1YK
   s1SpZP9+6aVWwHb8EBdwowrLTJVkKKEd2UAbQ5eAyy7EMFNuAq6I4LmxE
   YjEDtxFQrl4UXya7ZWlbkQ/OyZPzLbSsK5bn/Z6fBNmqlKSagDfxyW07a
   mYZf0N5cVEKz+eFWNvTWMZQXvG/8ZD/mPmTU4GbOceP1X3VFNicXPYS3M
   JKiI/ODUOdXv4I7NMDeJTF+HCtH5G+FWm0LmIOCwSqLu4Jh9HMGdIfu1r
   w==;
X-CSE-ConnectionGUID: XSHQ0FfeTVyvSPf2HF7Yvg==
X-CSE-MsgGUID: 4rVQRJ/eQymuPetxHaPo1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="35597922"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="35597922"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 00:54:17 -0800
X-CSE-ConnectionGUID: vMNtRfmDRdWF985UIK+Qjg==
X-CSE-MsgGUID: v8DtyhPERRWRvsHeFDSfBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102463170"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Jan 2025 00:54:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUisH-000CQ6-2Q;
	Mon, 06 Jan 2025 08:54:13 +0000
Date: Mon, 6 Jan 2025 16:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Aswath Govindraju <a-govindraju@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined
 but not used
Message-ID: <202501061623.b5Jszq2k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Aswath,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d89551994a430b50c4fffcb1e617a057fa76e20
commit: e4d4371253029528c02bfb43a46c252e1c3d035f phy: phy-can-transceiver: Add support for setting mux
date:   2 years, 9 months ago
config: sh-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20250106/202501061623.b5Jszq2k-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061623.b5Jszq2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061623.b5Jszq2k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined but not used [-Wunused-const-variable=]
     134 | static const struct of_device_id adg792a_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/adg792a_of_match +134 drivers/mux/adg792a.c

afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  133  
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14 @134  static const struct of_device_id adg792a_of_match[] = {
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  135  	{ .compatible = "adi,adg792a", },
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  136  	{ .compatible = "adi,adg792g", },
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  137  	{ }
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  138  };
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  139  MODULE_DEVICE_TABLE(of, adg792a_of_match);
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  140  

:::::: The code at line 134 was first introduced by commit
:::::: afda08c4caa9489511557def51e322a5f2142a2f mux: adg792a: add mux controller driver for ADG792A/G

:::::: TO: Peter Rosin <peda@axentia.se>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
