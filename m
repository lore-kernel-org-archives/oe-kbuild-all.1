Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D4B288510
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 22:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751840097; cv=none; b=g7BJv3lUOfAWSZn5d5nUNUnl4m7mp7H3mJ93i69Pnz08QfUhwXqbOpVblJCaTHWA0umQ0011wdnRKrWjxIAPc7GLqwm0NfvCik8lKEvJVy9TrhL4M3GVeMjwYaIuPFHYF7mYW3AGUvJQ/4/pLQmA3NI0ENAuVJKugLbQh3AzRIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751840097; c=relaxed/simple;
	bh=6MqFgvDjnix1ZNjql75fA41FRBYAI2GLxcKf9FIqU2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gn4VJEUee0fErLu34aLEPZ5MOcgzDvspWB6U02K3SJIXXrvtW03cn0Aq8buM7W1P5ZlCuZkAGCbEhj8avLwnsdG7zJjCp4xG4RZ54BLLlEnz5j8hGQy0CgsJaB+jzOeElEH3LEnW1ojFU6tC9ttrT7PeYpMkBv8lqXn8LN/OPM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYItO0pl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYItO0pl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751840095; x=1783376095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6MqFgvDjnix1ZNjql75fA41FRBYAI2GLxcKf9FIqU2w=;
  b=iYItO0plNQ2MHdAs5YF25MQ2LEuuQa+f/bTs93ukjs3H9zAhsmYxdoXF
   wyuL7Psj5tpqcF9Q6Kx8/tQ4gGd5K/dHevGlmYbayNgzYx08nt/Oj9q/r
   r8KRmg7nSq6ljVvR/VBxNqRYS7btBWXyrdg5l1Dmrdvc796LXcGiBd6kE
   PRNDDuJqIvkvzTnzll6SMV2jRJxZENh3+eodGHO2O8pqcIboNnKdsY1bx
   4wm4XQ6PHTkv/mPlI6vLRgfB8lnfFGQiHcDhyY2ItZBSm3GSvtoajjGRO
   /2G/lCQPwHAbczuFr+4yTnHvE6GmsDuwcI3me2DY2cR766Ph38F/db3ID
   Q==;
X-CSE-ConnectionGUID: FuOeLrJJT2q0h9gmJEx6KQ==
X-CSE-MsgGUID: yLrY8iSwQv6VIzOTOrRR7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="64750159"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="64750159"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 15:14:52 -0700
X-CSE-ConnectionGUID: lLgESG7OSZKqxQee1CsdNQ==
X-CSE-MsgGUID: hbjae5esQ8uE6mAjG87dXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="186075690"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Jul 2025 15:14:50 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYXdH-000017-2f;
	Sun, 06 Jul 2025 22:14:47 +0000
Date: Mon, 7 Jul 2025 06:13:48 +0800
From: kernel test robot <lkp@intel.com>
To: Len Bao <len.bao@gmx.us>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Len Bao <len.bao@gmx.us>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/dp: Remove dead code after return statement
Message-ID: <202507070237.Hwcze8au-lkp@intel.com>
References: <20250706162431.15029-1-len.bao@gmx.us>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706162431.15029-1-len.bao@gmx.us>

Hi Len,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Len-Bao/drm-dp-Remove-dead-code-after-return-statement/20250707-002653
base:   linus/master
patch link:    https://lore.kernel.org/r/20250706162431.15029-1-len.bao%40gmx.us
patch subject: [PATCH] drm/dp: Remove dead code after return statement
config: arm-randconfig-002-20250707 (https://download.01.org/0day-ci/archive/20250707/202507070237.Hwcze8au-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070237.Hwcze8au-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507070237.Hwcze8au-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/display/drm_dp_helper.c: In function 'drm_dp_pcon_frl_configure_2':
>> drivers/gpu/drm/display/drm_dp_helper.c:3580:13: warning: unused variable 'ret' [-Wunused-variable]
    3580 |         int ret;
         |             ^~~


vim +/ret +3580 drivers/gpu/drm/display/drm_dp_helper.c

ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3565  
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3566  /**
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3567   * drm_dp_pcon_frl_configure_2() - Set HDMI Link configuration Step-2
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3568   * @aux: DisplayPort AUX channel
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3569   * @max_frl_mask : Max FRL BW to be tried by the PCON with HDMI Sink
68a8c645b2538c drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2021-03-23  3570   * @frl_type : FRL training type, can be Extended, or Normal.
68a8c645b2538c drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2021-03-23  3571   * In Normal FRL training, the PCON tries each frl bw from the max_frl_mask
68a8c645b2538c drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2021-03-23  3572   * starting from min, and stops when link training is successful. In Extended
68a8c645b2538c drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2021-03-23  3573   * FRL training, all frl bw selected in the mask are trained by the PCON.
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3574   *
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3575   * Returns 0 if success, else returns negative error code.
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3576   */
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3577  int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
68a8c645b2538c drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2021-03-23  3578  				u8 frl_type)
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3579  {
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18 @3580  	int ret;
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3581  	u8 buf = max_frl_mask;
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3582  
68a8c645b2538c drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2021-03-23  3583  	if (frl_type == DP_PCON_FRL_LINK_TRAIN_EXTENDED)
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3584  		buf |= DP_PCON_FRL_LINK_TRAIN_EXTENDED;
68a8c645b2538c drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2021-03-23  3585  	else
68a8c645b2538c drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2021-03-23  3586  		buf &= ~DP_PCON_FRL_LINK_TRAIN_EXTENDED;
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3587  
af67978ee37e54 drivers/gpu/drm/display/drm_dp_helper.c Dmitry Baryshkov 2025-03-24  3588  	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3589  }
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3590  EXPORT_SYMBOL(drm_dp_pcon_frl_configure_2);
ce32a6239de648 drivers/gpu/drm/drm_dp_helper.c         Ankit Nautiyal   2020-12-18  3591  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
