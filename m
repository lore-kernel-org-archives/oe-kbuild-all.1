Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9150D3B7B93
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 07:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211022; cv=none; b=RohVsX8NWUPH+lhwg4B9GeK7lCeqHSyDFtsbagTy0Nirvh5cAL80HnSmjBm/Zg+XiQ8EPN9IwuLrtQTew7id9n0+iSy0r/zJ8qHRvmFoTpfIrG5BPIRqDq/tQFHvPxNpzFF0z4zMpNoO8Ov3SSGNHbz8sd1a3TY/BYMg8WVU8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211022; c=relaxed/simple;
	bh=6MMnnwj/JV8YNAeXhJEYQNuhJ+o5OUYqXX99QnuSBp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQybNb3QOovuC79IrdUofXiYKll08aJd9XL0S0auYncrJ/Z59ZanStVlZFJAl7s5bmzxKkstscNHPPJIpRyZPH9drqWNdOuoawuEQkhvcrdyOnTweUx7B23FCCjNtXVB6ntuAfPa/LEMWTMuCU7M2XTjtur7Og+v2ggxsfLW2ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4pJvbzs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4pJvbzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787211018; x=1818747018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6MMnnwj/JV8YNAeXhJEYQNuhJ+o5OUYqXX99QnuSBp0=;
  b=C4pJvbzsbLjpjetsUA5q9a9QkcAZ0ci0QzrQeD+wJBmUi5TgT6GLSSXY
   yGMJ36zK9A/6+rwsbNoDmvE8qJEGWGHguifRTl9f95KNP65gSK3jbK1UF
   omqTINHpm9tbRBXnAWoFe9nrl634dkUUAlRxP65SLdu/qq7ugjEqycBLn
   9XS3SoWqrgEFW6rwkaOBJSBXka5b2b4Hgj7DycrdF049mqJwvpCcB63Ci
   pMSH17bw0UNvuJuSPFa0slwsR1Dvx9xZrh5jPMOeEnoqe9ij9eTzWIbxw
   4wvZ+LusG7QkgaOCbsNRKhnbOHMpa/u+R+Zhck/hQxtbhCOHKXcorowsk
   Q==;
X-CSE-ConnectionGUID: GB6hIQYERCubZNsXkmNOHw==
X-CSE-MsgGUID: ZsiIYLyvQ6S6Hfqt4mFzIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="91418649"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="91418649"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 00:30:18 -0700
X-CSE-ConnectionGUID: Tuh2IBKgRRyFd/k2k0LfeA==
X-CSE-MsgGUID: du6nR5njRPS19NUEeGD1Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="266512410"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Aug 2026 00:30:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwxE3-00000000iEr-32KU;
	Thu, 20 Aug 2026 07:30:11 +0000
Date: Thu, 20 Aug 2026 15:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Donald Robson <donald.robson@imgtec.com>,
	Sarah Walker <sarah.walker@imgtec.com>,
	Alessio Belle <Alessio.Belle@imgtec.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH v2] drm/imagination: Align rogue_fwif_hwrtdata to 64 bytes
Message-ID: <202608201552.P4LSH5IX-lkp@intel.com>
References: <20260805-fix_imagination-v2-1-7391a13c891f@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-fix_imagination-v2-1-7391a13c891f@samsung.com>

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/drm-imagination-Align-rogue_fwif_hwrtdata-to-64-bytes/20260805-213722
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260805-fix_imagination-v2-1-7391a13c891f%40samsung.com
patch subject: [PATCH v2] drm/imagination: Align rogue_fwif_hwrtdata to 64 bytes
config: riscv-randconfig-r131-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201552.P4LSH5IX-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201552.P4LSH5IX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201552.P4LSH5IX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/imagination/pvr_power.c:62:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *power_sync @@
   drivers/gpu/drm/imagination/pvr_power.c:62:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/imagination/pvr_power.c:62:16: sparse:     got unsigned int [usertype] *power_sync

vim +62 drivers/gpu/drm/imagination/pvr_power.c

cc1aeedb98ad34 Sarah Walker 2023-11-22  46  
727538a4bbff07 Sarah Walker 2023-11-22  47  static int
727538a4bbff07 Sarah Walker 2023-11-22  48  pvr_power_send_command(struct pvr_device *pvr_dev, struct rogue_fwif_kccb_cmd *pow_cmd)
727538a4bbff07 Sarah Walker 2023-11-22  49  {
cc1aeedb98ad34 Sarah Walker 2023-11-22  50  	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
cc1aeedb98ad34 Sarah Walker 2023-11-22  51  	u32 slot_nr;
cc1aeedb98ad34 Sarah Walker 2023-11-22  52  	u32 value;
cc1aeedb98ad34 Sarah Walker 2023-11-22  53  	int err;
cc1aeedb98ad34 Sarah Walker 2023-11-22  54  
cc1aeedb98ad34 Sarah Walker 2023-11-22  55  	WRITE_ONCE(*fw_dev->power_sync, 0);
cc1aeedb98ad34 Sarah Walker 2023-11-22  56  
cc1aeedb98ad34 Sarah Walker 2023-11-22  57  	err = pvr_kccb_send_cmd_powered(pvr_dev, pow_cmd, &slot_nr);
cc1aeedb98ad34 Sarah Walker 2023-11-22  58  	if (err)
cc1aeedb98ad34 Sarah Walker 2023-11-22  59  		return err;
cc1aeedb98ad34 Sarah Walker 2023-11-22  60  
cc1aeedb98ad34 Sarah Walker 2023-11-22  61  	/* Wait for FW to acknowledge. */
cc1aeedb98ad34 Sarah Walker 2023-11-22 @62  	return readl_poll_timeout(pvr_dev->fw_dev.power_sync, value, value != 0, 100,
cc1aeedb98ad34 Sarah Walker 2023-11-22  63  				  POWER_SYNC_TIMEOUT_US);
727538a4bbff07 Sarah Walker 2023-11-22  64  }
727538a4bbff07 Sarah Walker 2023-11-22  65  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
