Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE75B8248B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 21:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767648648; cv=none; b=HbQ3QyDzyWlQIdOIKAgAzJkvHclBhVRgQH3vpRaUDpt1VP+GuL6aImZZMaFQU/8L5KUrASgatmU3ejkAgFwtfQqD7Ogu7nwQ+IV99Wk7yQhtFa6Vd74UHeY0fKmzMgJpOTn/uCayZlam1goNB3fqyRyt9+EOsu4znEaUIoDFGPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767648648; c=relaxed/simple;
	bh=+QPX0QOZsIbeOr1tYmOsmy8KiMogxkPsaB5Zw6Ya8u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAT088N01q07Gr2mk4RBYwk2gjoAHN3ogCBGKvaQGqrdFoFSHjRoV0F1jA9B8qytskBEjzF+9Jdd6zKA6P8cAfE37k+KAMENYPkv9bvd85DZBOqG2ia7PbctQsqlAomIZaodIbyIfpXEDH8HJm1gnuErG+zLZ1ckXuKgoIrOalY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9yhrI/M; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9yhrI/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767648646; x=1799184646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+QPX0QOZsIbeOr1tYmOsmy8KiMogxkPsaB5Zw6Ya8u4=;
  b=E9yhrI/MYXHuPCIMXuh7EnlKpwiLkMDXBb6WWwDHFqZPSataq+PGwDEN
   ZvpWtlfaFIVQS3y8csK56dRLAWMzLSZ6EyR4+lGhoeVDdYDsdNnQjJB7U
   NajAuvZawO8iN9D+maubPNC+bdQoEuickbOjoK2yky8Js7CMh2bC8AOsW
   mC1hnHiYuMmMOnMtfgFigcLrKYSBpZpQSsT5OckMoLRTYBQJp7VttPteL
   7hL14JK6kqpxV5Jw68Y4vmYhF/WECB2vLAUyzdUvXuAJEIRR2Arh7zC+l
   fFKQIpu6Dt94AYQL+zzWYNKnmCz70Xnw1aFCj0QGxwyNoPef0HoM9wGHl
   Q==;
X-CSE-ConnectionGUID: 2koOiAgnTqSWvhxbtXi5XQ==
X-CSE-MsgGUID: HxC3527jQse60COSh1myfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68923767"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="68923767"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 13:30:45 -0800
X-CSE-ConnectionGUID: NPj+/zxiT0aoB/qL190f6A==
X-CSE-MsgGUID: JCPR0GnLRUiPosC/4ZYcBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207522667"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Jan 2026 13:30:41 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcs9t-000000001Bh-457N;
	Mon, 05 Jan 2026 21:30:37 +0000
Date: Mon, 5 Jan 2026 22:30:17 +0100
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Alexander Winkowski <dereference23@outlook.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: Re: [PATCH v2 3/6] platform/raspberrypi: Add VideoCore shared memory
 support
Message-ID: <202601052222.PZT4wjmg-lkp@intel.com>
References: <20260105-b4-vc-sm-cma-v2-3-4daea749ced9@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-b4-vc-sm-cma-v2-3-4daea749ced9@ideasonboard.com>

Hi Jai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3e7f562e20ee87a25e104ef4fce557d39d62fa85]

url:    https://github.com/intel-lab-lkp/linux/commits/Jai-Luthra/platform-raspberrypi-vchiq-mmal-Reset-buffers_with_vpu-on-port_enable/20260105-170249
base:   3e7f562e20ee87a25e104ef4fce557d39d62fa85
patch link:    https://lore.kernel.org/r/20260105-b4-vc-sm-cma-v2-3-4daea749ced9%40ideasonboard.com
patch subject: [PATCH v2 3/6] platform/raspberrypi: Add VideoCore shared memory support
config: sh-kismet-CONFIG_BCM2835_VCHIQ-CONFIG_BCM_VC_SM_CMA-0-0 (https://download.01.org/0day-ci/archive/20260105/202601052222.PZT4wjmg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260105/202601052222.PZT4wjmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601052222.PZT4wjmg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BCM2835_VCHIQ when selected by BCM_VC_SM_CMA
   WARNING: unmet direct dependencies detected for BCM2835_VCHIQ
     Depends on [n]: BCM_VIDEOCORE [=y] && HAS_DMA [=n]
     Selected by [y]:
     - BCM_VC_SM_CMA [=y] && BCM_VIDEOCORE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
