Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B9B23D2A1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 12:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583496; cv=none; b=o5pBATxwIAPGOtv2QwEYa+L0CFfojyNEExpxy58TqanPLBBkIDV+YCklSE9UXmgcizgdaQfeBbIeTiMl/DjPqYr7Pkd5QJY0MiXo+ecnj+wDk9EElQ69EJfsvTKN6gb0cuFurOVPjPDWpTM0an4UxRokyBQV9aljVU/adahHn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583496; c=relaxed/simple;
	bh=IRhsjfye+a9BiO4vM8K1CN0O5XQh7QFmUUK1GHQKP3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZqIIy9hVmNndD4FH4V0bHz1oEYfk2cDqLBMddZ1/HvLKGzLbSLdVxVlGciwKC50tK7FatvctAYmGpGe7WlWdA5WeXkE8pRH6DYfRV8JwIZRIA2UoQ6GlX/8MpNrT0RhPM9lzN8tSwAeVygajWSD+EKQi2AAX/HlFUnI5PQxqy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdtifxcB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdtifxcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745583494; x=1777119494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IRhsjfye+a9BiO4vM8K1CN0O5XQh7QFmUUK1GHQKP3Q=;
  b=JdtifxcB6Oa6PICeZP4m+5P7mhJEj1Del7+QkX8jiFkLZhnNmKFJGm+Z
   kFaWZU9cFiQhyyQfmEOLUl4esZXprEhNbsc6RFHWg2TM5VPc/TF49Rz3c
   lbYrcLtyh9KZa/jT39dRSq/UzTQzfyEVHqiKh+fvkI8p8Tp9ENQXY+VuN
   LrJnKGDVivtg9em4Z2f/3VmLjgf1JzUGBvyMw/ynZykmdhRrSUrToVDey
   OmtzRz+NpkC+6V4p0Sr/jFI55ODv+TKb/LXF8OK3yYx8BiGUQMHXurxI9
   1es6YLseLLS3812SpfEabDrZ0VIjjesvBHU030Xf6eAUupc7g1TfyXQBR
   w==;
X-CSE-ConnectionGUID: PSPEBgqGRIC7QyZBeb+HqA==
X-CSE-MsgGUID: YSTHVM6mSH+b6imk8BLPYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47415467"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47415467"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 05:18:13 -0700
X-CSE-ConnectionGUID: meNzk/NDR96UAOv8iLidyg==
X-CSE-MsgGUID: tlZM1JPaSxu5WEB2zNpSow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137722293"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Apr 2025 05:18:12 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8I0P-00059h-2L;
	Fri, 25 Apr 2025 12:18:09 +0000
Date: Fri, 25 Apr 2025 20:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] drm/bridge: ti-sn65dsi86: Enable HPD functionality
Message-ID: <202504252020.Sr5yxEZ5-lkp@intel.com>
References: <20250424105432.255309-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424105432.255309-1-j-choudhary@ti.com>

Hi Jayesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on drm-exynos/exynos-drm-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jayesh-Choudhary/drm-bridge-ti-sn65dsi86-Enable-HPD-functionality/20250424-185532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250424105432.255309-1-j-choudhary%40ti.com
patch subject: [RFC PATCH] drm/bridge: ti-sn65dsi86: Enable HPD functionality
config: s390-randconfig-002-20250425 (https://download.01.org/0day-ci/archive/20250425/202504252020.Sr5yxEZ5-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504252020.Sr5yxEZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504252020.Sr5yxEZ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:205: warning: Function parameter or struct member 'keep_hpd' not described in 'ti_sn65dsi86'


vim +205 drivers/gpu/drm/bridge/ti-sn65dsi86.c

cea86c5bb4425c Bjorn Andersson  2021-10-25  131  
27ed2b3f22ed60 Douglas Anderson 2020-05-07  132  /**
db0036db4851df Douglas Anderson 2021-04-23  133   * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
bf73537f411b0d Douglas Anderson 2021-04-23  134   * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
bf73537f411b0d Douglas Anderson 2021-04-23  135   * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
a1e3667a9835e1 Douglas Anderson 2021-06-11  136   * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
cea86c5bb4425c Bjorn Andersson  2021-10-25  137   * @pwm_aux:      AUX-bus sub device for PWM controller functionality.
bf73537f411b0d Douglas Anderson 2021-04-23  138   *
bf73537f411b0d Douglas Anderson 2021-04-23  139   * @dev:          Pointer to the top level (i2c) device.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  140   * @regmap:       Regmap for accessing i2c.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  141   * @aux:          Our aux channel.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  142   * @bridge:       Our bridge.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  143   * @connector:    Our connector.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  144   * @host_node:    Remote DSI node.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  145   * @dsi:          Our MIPI DSI source.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  146   * @refclk:       Our reference clock.
4e5763f03e105f Laurent Pinchart 2021-06-24  147   * @next_bridge:  The bridge on the eDP side.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  148   * @enable_gpio:  The GPIO we toggle to enable the bridge.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  149   * @supplies:     Data for bulk enabling/disabling our regulators.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  150   * @dp_lanes:     Count of dp_lanes we're using.
5bebaeadb30e8d Douglas Anderson 2020-05-18  151   * @ln_assign:    Value to program to the LN_ASSIGN register.
c42fb724cdf608 Douglas Anderson 2020-06-12  152   * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
b137406d9679ac Douglas Anderson 2021-04-23  153   * @comms_enabled: If true then communication over the aux channel is enabled.
b137406d9679ac Douglas Anderson 2021-04-23  154   * @comms_mutex:   Protects modification of comms_enabled.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  155   *
27ed2b3f22ed60 Douglas Anderson 2020-05-07  156   * @gchip:        If we expose our GPIOs, this is used.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  157   * @gchip_output: A cache of whether we've set GPIOs to output.  This
27ed2b3f22ed60 Douglas Anderson 2020-05-07  158   *                serves double-duty of keeping track of the direction and
27ed2b3f22ed60 Douglas Anderson 2020-05-07  159   *                also keeping track of whether we've incremented the
27ed2b3f22ed60 Douglas Anderson 2020-05-07  160   *                pm_runtime reference count for this pin, which we do
27ed2b3f22ed60 Douglas Anderson 2020-05-07  161   *                whenever a pin is configured as an output.  This is a
27ed2b3f22ed60 Douglas Anderson 2020-05-07  162   *                bitmap so we can do atomic ops on it without an extra
27ed2b3f22ed60 Douglas Anderson 2020-05-07  163   *                lock so concurrent users of our 4 GPIOs don't stomp on
27ed2b3f22ed60 Douglas Anderson 2020-05-07  164   *                each other's read-modify-write.
cea86c5bb4425c Bjorn Andersson  2021-10-25  165   *
cea86c5bb4425c Bjorn Andersson  2021-10-25  166   * @pchip:        pwm_chip if the PWM is exposed.
cea86c5bb4425c Bjorn Andersson  2021-10-25  167   * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
cea86c5bb4425c Bjorn Andersson  2021-10-25  168   * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
cea86c5bb4425c Bjorn Andersson  2021-10-25  169   * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
27ed2b3f22ed60 Douglas Anderson 2020-05-07  170   */
db0036db4851df Douglas Anderson 2021-04-23  171  struct ti_sn65dsi86 {
7aa83fbd712a6f Douglas Anderson 2023-06-13  172  	struct auxiliary_device		*bridge_aux;
7aa83fbd712a6f Douglas Anderson 2023-06-13  173  	struct auxiliary_device		*gpio_aux;
7aa83fbd712a6f Douglas Anderson 2023-06-13  174  	struct auxiliary_device		*aux_aux;
7aa83fbd712a6f Douglas Anderson 2023-06-13  175  	struct auxiliary_device		*pwm_aux;
bf73537f411b0d Douglas Anderson 2021-04-23  176  
a095f15c00e278 Sandeep Panda    2018-07-20  177  	struct device			*dev;
a095f15c00e278 Sandeep Panda    2018-07-20  178  	struct regmap			*regmap;
b814ec6d453577 Sean Paul        2018-08-13  179  	struct drm_dp_aux		aux;
a095f15c00e278 Sandeep Panda    2018-07-20  180  	struct drm_bridge		bridge;
e283820cbf8092 Douglas Anderson 2022-02-04  181  	struct drm_connector		*connector;
a095f15c00e278 Sandeep Panda    2018-07-20  182  	struct device_node		*host_node;
a095f15c00e278 Sandeep Panda    2018-07-20  183  	struct mipi_dsi_device		*dsi;
a095f15c00e278 Sandeep Panda    2018-07-20  184  	struct clk			*refclk;
4e5763f03e105f Laurent Pinchart 2021-06-24  185  	struct drm_bridge		*next_bridge;
a095f15c00e278 Sandeep Panda    2018-07-20  186  	struct gpio_desc		*enable_gpio;
a095f15c00e278 Sandeep Panda    2018-07-20  187  	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
fa8a66c68755ce Douglas Anderson 2019-12-18  188  	int				dp_lanes;
5bebaeadb30e8d Douglas Anderson 2020-05-18  189  	u8				ln_assign;
5bebaeadb30e8d Douglas Anderson 2020-05-18  190  	u8				ln_polrs;
b137406d9679ac Douglas Anderson 2021-04-23  191  	bool				comms_enabled;
b137406d9679ac Douglas Anderson 2021-04-23  192  	struct mutex			comms_mutex;
7d7f75fa49ee7f Jayesh Choudhary 2025-04-24  193  	bool				keep_hpd;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  194  
9e4f358313920d Douglas Anderson 2020-06-12  195  #if defined(CONFIG_OF_GPIO)
27ed2b3f22ed60 Douglas Anderson 2020-05-07  196  	struct gpio_chip		gchip;
27ed2b3f22ed60 Douglas Anderson 2020-05-07  197  	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
9e4f358313920d Douglas Anderson 2020-06-12  198  #endif
ed531feda7852d Uwe Kleine-König 2025-02-17  199  #if IS_REACHABLE(CONFIG_PWM)
596de87ddfc72f Uwe Kleine-König 2024-02-14  200  	struct pwm_chip			*pchip;
cea86c5bb4425c Bjorn Andersson  2021-10-25  201  	bool				pwm_enabled;
cea86c5bb4425c Bjorn Andersson  2021-10-25  202  	atomic_t			pwm_pin_busy;
cea86c5bb4425c Bjorn Andersson  2021-10-25  203  #endif
cea86c5bb4425c Bjorn Andersson  2021-10-25  204  	unsigned int			pwm_refclk_freq;
a095f15c00e278 Sandeep Panda    2018-07-20 @205  };
a095f15c00e278 Sandeep Panda    2018-07-20  206  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
