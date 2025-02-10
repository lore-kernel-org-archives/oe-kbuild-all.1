Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57478256C99
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 17:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208654; cv=none; b=qoQzbqzS49DzB6Q5/JxaZmE4ebvR4LFqvunjQXQhkVXnXqdBVVNXGGVtU3fCTsmVUVvPn2aL6uwYVH63YrDOU9iWS6z8KSOQoEvPlmRECqyp+ea2VxdVeYrwGVyGwlos5PB01JU0EWSl3u04uY0sI4dFiBSCtZ9KzdZ5cuA9MD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208654; c=relaxed/simple;
	bh=QrtAfF+b4gQo5NcTSVXSa34GYXbicQ2DLjZHXedbQtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HNTEJePBuHR6bIo6Vpvr/KOa3H/TxSl4U78L/0HzVE9yTIflZmxcNs9TmV/em7qgd2qdNbEICoo3UdWldl+swap/pdcIIWHOGKqoQcyzM9+2cRze14q03mS/OZbeU8ygpbmZ9sl3wxOEFw5biAUd3w/w4xtTO07VRP9bBJMeOyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBbXCKjk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBbXCKjk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739208653; x=1770744653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QrtAfF+b4gQo5NcTSVXSa34GYXbicQ2DLjZHXedbQtY=;
  b=QBbXCKjkD6FGZMWXpcnN5xj5HJJ2wnOEM2dZGs2+imo8IqJEqmgo2hJw
   51YaPyBIETWNl2G31R7bm24SHGPX1CvtRU4RnBkdp5IuCfZP6HHBlyp2S
   0U9DZiWSgCQd7k01Rau4LUny6k8wykMuSpyhsEbVorj+H16Z08O25RnLQ
   O087A6xaF0v6nPFIuuftoK60lgBaqpiG74sOPiXpG8aMu5/sb/ErftB9g
   /oBVUQki3tGeu2pnNIt6eb1zpDY7yRQVauTiMzef1lLtCiMf9ZK/cBvDJ
   fpveQNlMABAvQt8CJm0dSoGdIUpcYv8oMB+3KAmgPTVBjwwzpnHteGs7T
   A==;
X-CSE-ConnectionGUID: WCyW5uGvS3SgMKpYdP6ekg==
X-CSE-MsgGUID: qNgQBDlgQlW7JsbHETi1SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57212831"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="57212831"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 09:30:52 -0800
X-CSE-ConnectionGUID: 7hHBwknCQQ2XRvvkdhj/ww==
X-CSE-MsgGUID: LhIRsScsR6OC0aEgxQUkWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116325656"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Feb 2025 09:30:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thXcO-00137v-12;
	Mon, 10 Feb 2025 17:30:48 +0000
Date: Tue, 11 Feb 2025 01:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 217/217] cc1: warning:
 drivers/remoteproc/vcp: No such file or directory
Message-ID: <202502110137.W18F2RZp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b603fe68bcf1fd8aa46dd46190c53d641dce5cf0
commit: ea8227ece8dcae6cc6897798cac94b4aa2cf6a8c [217/217] CHROMIUM: soc: mediatek: add mtk-vdisp driver
config: arm-randconfig-002-20250210 (https://download.01.org/0day-ci/archive/20250211/202502110137.W18F2RZp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110137.W18F2RZp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110137.W18F2RZp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: drivers/remoteproc/vcp: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/remoteproc/vcp/include: No such file or directory [-Wmissing-include-dirs]
--
>> cc1: warning: drivers/remoteproc/vcp: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/remoteproc/vcp/include: No such file or directory [-Wmissing-include-dirs]
   drivers/soc/mediatek/mtk-dvfsrc.c:139:5: warning: no previous prototype for 'dvfsrc_get_required_opp_peak_bw' [-Wmissing-prototypes]
     139 | u32 dvfsrc_get_required_opp_peak_bw(struct device_node *np, int index)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
