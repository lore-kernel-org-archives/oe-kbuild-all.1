Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC64E33D1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 04:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720845247; cv=none; b=DTs2bw05A7syGUT9jioeuUnJSur1pyNltzpF96Jp4Jp0NbkeIoDg0re8F5VmU6ZD3GRkXseg6qp5LzOhfYp8Vz7M+PpmXWkHxqQ7nU6moRq2tKj9NRRqmwjjJYtwsjWr/rDyVkyl2hY+dVlI8NlOHAp6zcK4Ej4sQLCTyWspzDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720845247; c=relaxed/simple;
	bh=180YlyQvz8mEyOSMDYutC4JLb7HsRMTJjfmK/cK5aOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PNL5Uw86oKZIb7fv9GoVGs/Tdik2n08ITdt7EBdM71yDKMdpV1McA/bJEEySHJaTCMgZ1w9+DlFtndgQtmNBo32p5b6lqEAE09QPz65gF2h7RJt9In9Iw8F/xcJu+pdOumdZtt8NiESjnMU/wuEJi2rcvFdLdYi5cxzH9HZZ8EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFebE2G2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFebE2G2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720845245; x=1752381245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=180YlyQvz8mEyOSMDYutC4JLb7HsRMTJjfmK/cK5aOY=;
  b=TFebE2G22WowH3DuVIHHVVWpZ834lwpzNACRU/Th/83qu//K57YBdvAl
   F0395pKozBj0eMvOQxmQppU2/Ln+KsMMUJR34nfpUQsGXzh9bO1YdZe01
   rLZTgOos2jZdRwUkh+wwWO/PGYml1MVHJ+GTigWhFQ4onguZboes53XRT
   1PRSKZEi0w4oH8RZ6qJya23BeABpm9kzIWn7NA4wShhJYTE/6F3Bayl7g
   /yfby9FwI9ZPx3wIdgfoJTAVL1hk1KxxHmdTdZy2yxtXfYyvCbWm6weSi
   NqyMPuii1zH6NHcVMPVzpSHYCoqs2CFxaG1Ukz+kacc2Ml8YdIxpRm4v6
   Q==;
X-CSE-ConnectionGUID: Yo1ajrJqQ4exS02LWhFIQQ==
X-CSE-MsgGUID: TVPtbFROSe+Dyn+U684l4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17915964"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="17915964"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 21:34:04 -0700
X-CSE-ConnectionGUID: a+jRCVjdRyKhsPUdU2GTgg==
X-CSE-MsgGUID: 2DC4OgmWRcCzC2+TXzjVBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="54050530"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jul 2024 21:34:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSUSO-000bh0-25;
	Sat, 13 Jul 2024 04:34:00 +0000
Date: Sat, 13 Jul 2024 12:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ERROR: modpost: "xmb_inject_err" [drivers/misc/xilinx_tmr_inject.ko]
 undefined!
Message-ID: <202407131208.j6frPIb7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   528dd46d0fc35c0176257a13a27d41e44fcc6cb3
commit: 895ae5bee159d148bac21a82899292c408c1aab1 drivers: misc: Add Support for TMR Inject IP
date:   1 year, 6 months ago
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240713/202407131208.j6frPIb7-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131208.j6frPIb7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131208.j6frPIb7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "xmb_manager_register" [drivers/misc/xilinx_tmr_manager.ko] undefined!
>> ERROR: modpost: "xmb_inject_err" [drivers/misc/xilinx_tmr_inject.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
