Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B4B2DC337
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765290612; cv=none; b=SMFuXQcKCRhNGE4XFDu7cDZXGA/1K0Qx/yLReZfL8asNe9iba/tkRIdYWVEgJk2ytdqMuU1a+jwbkhT2du92mnd8VyH/27/Q5k7ei3q3iWFjJdzCFpY6Ud4DTesRNDlaboREJZpgPzymo0moNsy7BOtNEmAhx2KJlQ11Chybvxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765290612; c=relaxed/simple;
	bh=VnoM++ZKxlGdBsYO6fWD6U0I889T2987BmFomhUqwuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PJGuK5Fkn6JEWVe6sNFNOz/iqtMhkSbFeWodJWPEmMAYNiFHT/IRVSWR+14FTky1x5T0brcYw4KncNC6MzAPUMZlZX+Jia5f4fbvOkVaMn5RuJvogTUqL7isO2aXiuL5kBTrMA0ZRi5DUUkCjnIyt9MmsAMptYyRT3G1HZyMTlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GX3ScwjY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GX3ScwjY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765290611; x=1796826611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VnoM++ZKxlGdBsYO6fWD6U0I889T2987BmFomhUqwuU=;
  b=GX3ScwjYHBqiMlyxFYE7dbW7Ps1xLa7NSIJLDRjNfnM7tQNn1XzoX1jK
   wKETOxdlkwDLR8D4oKaLaScPPxGxf58koE4Fd4DJr9THBfkCHkk6/d2vP
   n1wywhsUbONhqt6Xi/N2vuok3RkjYUbRsQ74BvvKx2bkkbb1bfnfNNgXs
   CYsX72ese/of7tE7RwftuFAamgv8Rhsa0IbHfqjjqsmRAK3rrbrgddVcc
   Liz15/RJE3cwugVOJfI7QdHachMF8oVQ9HtMep03vvE0GZcpyB2r5CA3N
   YFh5EetJ6oJk5KhA9SKYEHtJUErAR69ezWiyLU3asJAC2sQgMYvbDAc/Q
   Q==;
X-CSE-ConnectionGUID: shNVoNLKTYqvnyouvscgjQ==
X-CSE-MsgGUID: yEmISwYETZuL4nSGk8LisA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71106390"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="71106390"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 06:30:09 -0800
X-CSE-ConnectionGUID: mTX+8jWhQ5qSPVZkIXwHlA==
X-CSE-MsgGUID: FKWBDLfJTNq02HTF8DGeSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="196243903"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 09 Dec 2025 06:30:08 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSyj7-000000000HN-0ew8;
	Tue, 09 Dec 2025 14:30:05 +0000
Date: Tue, 9 Dec 2025 15:29:51 +0100
From: kernel test robot <lkp@intel.com>
To: Oliver Hartkopp <socketcan@hartkopp.net>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [linux-next:master 12363/13990] kismet: WARNING: unmet direct
 dependencies detected for CAN_DEV when selected by CAN
Message-ID: <202512091523.zty3CLmc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c75caf76ed86bbc15a72808f48f8df1608a0886c
commit: cb2dc6d2869a4fb7ef8d792a81a74bc6f0958a72 [12363/13990] can: Kconfig: select CAN driver infrastructure by default
config: loongarch-kismet-CONFIG_CAN_DEV-CONFIG_CAN-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091523.zty3CLmc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091523.zty3CLmc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091523.zty3CLmc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CAN_DEV when selected by CAN
   WARNING: unmet direct dependencies detected for CAN_DEV
     Depends on [n]: NETDEVICES [=n] && CAN [=y]
     Selected by [y]:
     - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
