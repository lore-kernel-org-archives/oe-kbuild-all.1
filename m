Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2217322E406
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 20:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767646547; cv=none; b=hSOBTastPIC+5YwCLCrFypuEmbKCY/mlB4G35C+HxjF1bNsZ9M2ZSH1H5QVLCCdpWBLY95Br5pUc2Rwhkukh4piW4kn+AvGubeIcAp3UEHmBjTH0poUXtB3PVf3uHftzEZ9CZLLVD12GleTqKpBSiFbIHKaVzLrjLr5Y1ZeWUWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767646547; c=relaxed/simple;
	bh=WVnWbjYOpqIDwisoDyPelz9EoJY5dPQN7uCwfAGaPOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQUn4TvEXj58ufPV8m8lM6ax9MN0UTqEbPht5AFV0UwE3tAZtLhAL6+/DO94h/j6O6u42E7fPOaSRppXsqG4oJdxquNz7zTTBnOMlZ5mLCB2M/pAczowUKeHo2KwUKRZBp6/TkYbWyCMDeuS+VaeHNpYxuQapJ4YyTJg22FS2aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWTpQvim; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWTpQvim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767646545; x=1799182545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WVnWbjYOpqIDwisoDyPelz9EoJY5dPQN7uCwfAGaPOw=;
  b=RWTpQvimSy61bSUpPCrR0k/y8pdPxA9hKs38dx2BU5dS8vhf9xkC/FDq
   xweCKIF+aGZvs6rgJMcdWzKdKlTjumxcXYLr/VctbIx5sOwwd6/PjMfLs
   0M6KHbQEigPOTG/ftCefw3Fu8AKy1h+I71eV1ArfayUXgwpwCb/j+K+UO
   DFxYTMgofuQmJSze3K+ONrp+JCDtFdb7mBVQ73Sa4F5N/ulS3fPGSdR9A
   bjHP2JVCLIgid0bVN6V0N6XbqTHVxLeoghYUvi80g/8xFl+4NKPVjSiIt
   2AY+tc6WRmXrb3WfQn+zn5/2tHoBYtNgXZ/e9fhcvpDusRBCftaFQAuqw
   g==;
X-CSE-ConnectionGUID: 9MvDq/FoSg6Ngz6DrbAM2A==
X-CSE-MsgGUID: fYo6UwF7QXyVWOhkupe/UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="72863468"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="72863468"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 12:55:44 -0800
X-CSE-ConnectionGUID: vVhRYXs2Sa+I91rilLBy4A==
X-CSE-MsgGUID: MMI8n2KmS3y+WWgOlzEMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202534141"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 05 Jan 2026 12:55:41 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcrc1-000000001BN-36Ax;
	Mon, 05 Jan 2026 20:55:37 +0000
Date: Mon, 5 Jan 2026 21:55:01 +0100
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
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v2 4/6] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma
 to support zero copy
Message-ID: <202601052123.hNOfRem6-lkp@intel.com>
References: <20260105-b4-vc-sm-cma-v2-4-4daea749ced9@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-b4-vc-sm-cma-v2-4-4daea749ced9@ideasonboard.com>

Hi Jai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3e7f562e20ee87a25e104ef4fce557d39d62fa85]

url:    https://github.com/intel-lab-lkp/linux/commits/Jai-Luthra/platform-raspberrypi-vchiq-mmal-Reset-buffers_with_vpu-on-port_enable/20260105-170249
base:   3e7f562e20ee87a25e104ef4fce557d39d62fa85
patch link:    https://lore.kernel.org/r/20260105-b4-vc-sm-cma-v2-4-4daea749ced9%40ideasonboard.com
patch subject: [PATCH v2 4/6] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma to support zero copy
config: sh-kismet-CONFIG_BCM2835_VCHIQ-CONFIG_BCM2835_VCHIQ_MMAL-0-0 (https://download.01.org/0day-ci/archive/20260105/202601052123.hNOfRem6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260105/202601052123.hNOfRem6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601052123.hNOfRem6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BCM2835_VCHIQ when selected by BCM2835_VCHIQ_MMAL
   WARNING: unmet direct dependencies detected for BCM2835_VCHIQ
     Depends on [n]: BCM_VIDEOCORE [=y] && HAS_DMA [=n]
     Selected by [y]:
     - BCM2835_VCHIQ_MMAL [=y] && BCM_VIDEOCORE [=y]
     - BCM_VC_SM_CMA [=y] && BCM_VIDEOCORE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
