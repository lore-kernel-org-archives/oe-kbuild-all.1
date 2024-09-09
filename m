Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C896B74C08
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896491; cv=none; b=aQEildVckfuWtf5TUrGbvMX02Urse8ZuDZKyqPJOB79655EHa/4CbDFXP1KDAYhrlmKGGahF9jDza9vYLbkl9hgwkxHx9MRWBjOZ/YpF4n5DenNd8CIIQfiGRvpibMowhLFmFCo5Jnn63tAlh27DpSGEDToKBAqve66/heEbf14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896491; c=relaxed/simple;
	bh=eXiwDIrZVkbM9oC/23EpvORyZqD2xkSMHeI6NcC3M0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FBR1qhK4UpErzTqxAx/A5+G2wJneGC8j5UPzy1oII8J/zVNCKtvru2u9ZZNicJmsuuAPHTtElwfB2O1ow+YrejNsCNwgH8HtHVpp2A/nZHom2M2OrgmnNcNOJSLreoxZtPdgqv/lLlSUh0DLZ/O2AQsHmjg9OiUSn2Fl2Udff5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJ7RT5kZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJ7RT5kZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725896490; x=1757432490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eXiwDIrZVkbM9oC/23EpvORyZqD2xkSMHeI6NcC3M0s=;
  b=gJ7RT5kZQPc32xKvaVaifVKnge+fR4BbcpFhJZ9n8e8b9thbnoIYrbt7
   GYW2lsqYm/NMD7hDK7VQL+XLup2vz1qaYPOv85BNpdaATz9fo1bfkn5ms
   TNtZUR+PVulCBW5UDqUqIl3J+LH3aUlUhUvq9drCivISEZflipSBKwpyp
   Nib79Tzidws9/d6Yt+sgj7lL60qTOrcvGiW2icjPzKow/4NESrsPhd2X1
   96rZqVotAMJx3EHsWaKQLwJfa/6XO9zu4GzxWxfP/p2WqUaiaER3ipeWI
   JWqD9wZunFZRcC7GZyX0QUBLMbUzTb5g+WUlyuIfUKvG3M+hsFrfqBTVM
   A==;
X-CSE-ConnectionGUID: KSn9bed4R0C5ADv7Ah8h9w==
X-CSE-MsgGUID: XO19nDciTVWnAq+sTIkYWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24544083"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24544083"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:41:29 -0700
X-CSE-ConnectionGUID: Td7r8hfkTYCQuFSlc87M5g==
X-CSE-MsgGUID: 78XXLNOwTaygjWN+iNRjAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66721362"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2024 08:41:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sngW5-000EtQ-22;
	Mon, 09 Sep 2024 15:41:25 +0000
Date: Mon, 9 Sep 2024 23:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 92/339] kismet: WARNING: unmet direct
 dependencies detected for GENERIC_PHY_MIPI_DPHY when selected by
 VIDEO_CADENCE_CSI2RX
Message-ID: <202409092316.vpmL2lYg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   85d46cfcef8242e37cbd99a6591cab2b90d0d8ed
commit: 7149fb6fface964718d99db0070c5cc5a2bae81a [92/339] media: platform: cadence: select MIPI_DPHY dependency
config: x86_64-kismet-CONFIG_GENERIC_PHY_MIPI_DPHY-CONFIG_VIDEO_CADENCE_CSI2RX-0-0 (https://download.01.org/0day-ci/archive/20240909/202409092316.vpmL2lYg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240909/202409092316.vpmL2lYg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409092316.vpmL2lYg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY when selected by VIDEO_CADENCE_CSI2RX
   WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
     Depends on [n]: GENERIC_PHY [=n]
     Selected by [y]:
     - VIDEO_CADENCE_CSI2RX [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
