Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB6937D118
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722393; cv=none; b=X+FZCMyJs61v9YNYe6tNR2Z4UjW/xlD3txm2ozuFPunI42wQJvaE41XXqAtYKpgyk/uLbtk1A5bwJaIUAIEFqdl0omyyjk4isOwxydwZVbetSNDgSvIM9fjxdTfE2cPK3xJY6GLApVwm2/pDs6IMxRtWcRYYLCko3XiSlyCswHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722393; c=relaxed/simple;
	bh=H7pSDMSyqPqwdx54EQq6ZNslbDliPHteb1G+F6qP+Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/NFJY4Yv4WsVcstk41Jk+p9xdcoJ/YT+spKixqicq3UUwBGPuVBLc9BSFhKe5NuMIpshYT24jMvqynCxI1t4bihfJEFy2OIIGyTpVcaXxdrVn9U7RkBmRtpztYIwJghIW47lItDPEoQ/hsi2kxzT8XTIsc3I7/lV7Qw7AqQ9W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxUMyN13; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxUMyN13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772722392; x=1804258392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H7pSDMSyqPqwdx54EQq6ZNslbDliPHteb1G+F6qP+Nc=;
  b=SxUMyN133C9pC7/U2AbSFqoMgZurqwc8KLKrwO6Pd+0sPcReFd5NF2vO
   KjL+vpyxXWy73i/IUxZHZTSGPaozXhwraFYJ4Z9oBSxxgVmtzdHNXMngF
   gdntRhUEfrF8yupkDF7xA9bwf+P+rBo9NiLLqGALhinKZvg1+lTydRKFb
   XmoPX7P9mKr3yx6O2wrsPD/lCD0vtAs+b5JJhmo+2anSLBXF2kA3puRs1
   wWDnNAFtji903QJzLBaRlPek/Dld0rGq/qrhpici+k2yqvjMl2R+ma+MU
   NXOQoxfRw/lTGLvEK7UxU1DmbGcHiJYAZBGOhY17NpEc84/4jKSgWfxUZ
   w==;
X-CSE-ConnectionGUID: 9L0uJrXXSjyJE4xHR2FtVQ==
X-CSE-MsgGUID: LCSyM0NCTq2/1Kq3rbdoJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73857989"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73857989"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:53:11 -0800
X-CSE-ConnectionGUID: 3A3drPBGQO2cmfpROcfAqQ==
X-CSE-MsgGUID: O/BIXjCrQgu49CE9tA8SnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="249164089"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 06:53:09 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyA4Y-000000000l4-2DMf;
	Thu, 05 Mar 2026 14:53:06 +0000
Date: Thu, 5 Mar 2026 22:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: songxiebing <songxiebing@kylinos.cn>, tiwai@suse.com
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/intel: Synchronize the module parameter values
 of the power_save
Message-ID: <202603052231.cdetWcMJ-lkp@intel.com>
References: <20260302081218.771520-1-songxiebing@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302081218.771520-1-songxiebing@kylinos.cn>

Hi songxiebing,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v7.0-rc2 next-20260304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/songxiebing/ALSA-hda-intel-Synchronize-the-module-parameter-values-of-the-power_save/20260302-161555
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20260302081218.771520-1-songxiebing%40kylinos.cn
patch subject: [PATCH] ALSA: hda/intel: Synchronize the module parameter values of the power_save
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260305/202603052231.cdetWcMJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052231.cdetWcMJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052231.cdetWcMJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/hda/controllers/intel.c: In function 'set_default_power_save':
>> sound/hda/controllers/intel.c:2309:20: error: lvalue required as left operand of assignment
    2309 |         power_save = val;
         |                    ^


vim +2309 sound/hda/controllers/intel.c

  2289	
  2290	static void set_default_power_save(struct azx *chip)
  2291	{
  2292		struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
  2293		int val = power_save;
  2294	
  2295		if (pm_blacklist < 0) {
  2296			const struct snd_pci_quirk *q;
  2297	
  2298			q = snd_pci_quirk_lookup(chip->pci, power_save_denylist);
  2299			if (q && val) {
  2300				dev_info(chip->card->dev, "device %04x:%04x is on the power_save denylist, forcing power_save to 0\n",
  2301					 q->subvendor, q->subdevice);
  2302				val = 0;
  2303				hda->runtime_pm_disabled = 1;
  2304			}
  2305		} else if (pm_blacklist > 0) {
  2306			dev_info(chip->card->dev, "Forcing power_save to 0 via option\n");
  2307			val = 0;
  2308		}
> 2309		power_save = val;
  2310		snd_hda_set_power_save(&chip->bus, val * 1000);
  2311	}
  2312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
