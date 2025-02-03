Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C725154457
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 19:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611736; cv=none; b=UVZhvqCdY5BW257ozg0i/SulBpKEmS7An1I45+JHSTSTz9EpDpmIoy4yAE3FbLOrCotnLBXMH1eiottWPKmP5fLS8tQwaPO4UOHRyBFBr2bbXj9on6JrazNkRh/uSUZehay+hGlbXCDnCgHYU32QSrzYVfEscgkpHTXMKzKux84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611736; c=relaxed/simple;
	bh=Hsk7BNb0nwUuQltBDKVL1GTObFAftMkSlayUlddO8ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=unVl9EMn0JHfaNgqpnk2ZkiSl6jm0tHiqK6T8sBd4UVgquEpMeN8qvpAPx6TNdLwfGn4CAbLOfKIgZYaODzZvvhFaGxnQRFMX4TrSjcUgDAcabWoHkEnwPDZx6XF4XxVGlexUdRMlBwVXuo/SDToxArAvtyPQ2H/10eotDSRsVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdbtLAZT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdbtLAZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738611735; x=1770147735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hsk7BNb0nwUuQltBDKVL1GTObFAftMkSlayUlddO8ZA=;
  b=UdbtLAZTwl9GjMf2BHEtL5UGK2Nm9kR6WO+hujpbVQ4W7GYs418ZnHbm
   LxFms/gbbYthyN9/VXPeYOZd94GW77NrDBMcPBSRk2sJUfTJ4y6KC+jxr
   U+0tKdPW96ltD2A5nmZnvKYLcmvjy/Pfvl4EVvkUI/nTv+oIFMdjWRT9l
   tLD9BBxNC3ld9tr0PwLHQAy1hyliLoDVS+Bt0/SJ30aFt2k7ntft8s3Br
   g4ERm5VHn7pRinCdNWtqB+sc7vfrxKIfzEixIqf0+nMJGxoQmdNHgCx5K
   cLefBorPAMtUQQJJV05E4QLj1G4IYtaRVrabFdIRy1he//OO0brKRcY49
   g==;
X-CSE-ConnectionGUID: 86B3yuHfTiiuUs8zj5NYLQ==
X-CSE-MsgGUID: JTKY62o8ROa0aZBROY1C7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42771944"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="42771944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 11:42:14 -0800
X-CSE-ConnectionGUID: NcHxiXO3S462clf6HvKxjw==
X-CSE-MsgGUID: yUuRMKNBSIigzcfWywyYQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133632104"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2025 11:42:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf2Kg-000rOv-1B;
	Mon, 03 Feb 2025 19:42:10 +0000
Date: Tue, 4 Feb 2025 03:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 21/53] kismet: WARNING: unmet
 direct dependencies detected for ESP32_IPC when selected by MTD_ESP32
Message-ID: <202502040330.eSZHB1hf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: 4b24286e4a4219278c00f2ea2f1d2a01ad029aff [21/53] drivers/mtd: add esp32 MTD support
config: alpha-kismet-CONFIG_ESP32_IPC-CONFIG_MTD_ESP32-0-0 (https://download.01.org/0day-ci/archive/20250204/202502040330.eSZHB1hf-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250204/202502040330.eSZHB1hf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040330.eSZHB1hf-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ESP32_IPC when selected by MTD_ESP32
   WARNING: unmet direct dependencies detected for ESP32_IPC
     Depends on [n]: OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - MTD_ESP32 [=y] && MTD [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
