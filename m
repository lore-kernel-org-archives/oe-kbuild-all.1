Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6D51C5F39
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 21:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737669219; cv=none; b=Poj7207tLO5M++aUkRl1oeOK7dqaf0WSktkvImI/gcSgdbXn8SLgJxTRpQbh8EpgUTfqMiozEkDd+hcl/rXng6q1Zw/INkBci8jE98UbVLyYovgj0G6y4AgroNA1iM42oQFPNYyW7Kgfvtmt3Ue7Sl1qaikjUZ1DeF0EmuNStko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737669219; c=relaxed/simple;
	bh=i+aCr1+kUq1lqhpdWpjCFpsU/tJXUo6ii5XTBt+dNTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DlDMPqCSo9tQ3tzvONKc6w6oMyK6qQMq64qZWqFjWtaSCghgq3Vb3pyfZSuBefxy5YX4yhYdVYC7kM0Yu9/KUyrLRLd5YTJferAdqIiF3wf42myezhOjqlmKt1ISUrV5CVwsVupiRfW8xzQiVzNeJDBVXNmiwPkODbUjCX3YyS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5FK5cCa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5FK5cCa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737669217; x=1769205217;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i+aCr1+kUq1lqhpdWpjCFpsU/tJXUo6ii5XTBt+dNTU=;
  b=I5FK5cCanw5plOHtDAdabvcLo72VZLb1VhmgZzWjMNyt2bXlMPR+k9lJ
   5GzSZe5DO+qgys+wXjrsBjVDNPpgM3w/P3vUZzBGQTlLjbWIBxTjTssu4
   6v4i5G0ljF2y9sjmEW3bM1N9s6ndBjm9FHSqHGjkRJaySwQV6mIRRVkqN
   0fg/rWgrXnbcWdfL4kQD+cZELCpc5rUQDn3HWKsHEeUkUHabU8qIcKxRL
   DdWvkwPAegUu1eV37wIjDoCkUjaRvAwcvH8LL9a72CBYUbeQJ+0yegxSs
   qzkz+ofT5/5QBXOVZvZRluwGpGj0W25ILsQAPdDySiXLMu9FBSC9udC34
   A==;
X-CSE-ConnectionGUID: DbO8VAA4S/+3BGG2lkGrew==
X-CSE-MsgGUID: YjyV1pBgRWmFAsJ2zaV20w==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55607999"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="55607999"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 13:53:36 -0800
X-CSE-ConnectionGUID: Miz5m49pRtaxsVges/FIKA==
X-CSE-MsgGUID: UiQPMJ+DScOksCWS4v+h1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="107402016"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2025 13:53:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb58m-000blb-1c;
	Thu, 23 Jan 2025 21:53:32 +0000
Date: Fri, 24 Jan 2025 05:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 1/31]
 drivers/pinctrl/nomadik/pinctrl-nomadik.c:866:9: warning: ISO C90 forbids
 array 'slpm' whose size cannot be evaluated
Message-ID: <202501240531.yCXtF2Ju-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/l1k/linux spdm-future
head:   1429a7f741a85a0115afb4e1cdbc56b8ca525f2e
commit: cb3e63129bf354a30602aa836e07fd2dd591b4dd [1/31] crypto: Harden against integer overflows in DIV_ROUND_UP()
config: i386-buildonly-randconfig-005-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240531.yCXtF2Ju-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240531.yCXtF2Ju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240531.yCXtF2Ju-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/nomadik/pinctrl-nomadik.c:43:
   include/linux/gpio/gpio-nomadik.h:288:30: error: variably modified 'nmk_gpio_chips' at file scope
     288 | extern struct nmk_gpio_chip *nmk_gpio_chips[NMK_MAX_BANKS];
         |                              ^~~~~~~~~~~~~~
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:211:23: error: variably modified 'nmk_gpio_chips' at file scope
     211 | struct nmk_gpio_chip *nmk_gpio_chips[NMK_MAX_BANKS];
         |                       ^~~~~~~~~~~~~~
   drivers/pinctrl/nomadik/pinctrl-nomadik.c: In function 'nmk_pmx_set':
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:866:9: warning: ISO C90 forbids array 'slpm' whose size cannot be evaluated [-Wvla]
     866 |         static unsigned int slpm[NMK_MAX_BANKS];
         |         ^~~~~~
   drivers/pinctrl/nomadik/pinctrl-nomadik.c:866:29: error: storage size of 'slpm' isn't constant
     866 |         static unsigned int slpm[NMK_MAX_BANKS];
         |                             ^~~~
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:866:29: warning: unused variable 'slpm' [-Wunused-variable]
--
   In file included from drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c:20:
   drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h:108:30: error: variably modified 'groups' at file scope
     108 |         struct rcar_du_group groups[RCAR_DU_MAX_GROUPS];
         |                              ^~~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c: In function 'rcar_du_atomic_check_planes':
>> drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c:133:9: warning: ISO C90 forbids array 'group_freed_planes' whose size cannot be evaluated [-Wvla]
     133 |         unsigned int group_freed_planes[RCAR_DU_MAX_GROUPS] = { 0, };
         |         ^~~~~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c:133:9: error: variable-sized object may not be initialized
>> drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c:134:9: warning: ISO C90 forbids array 'group_free_planes' whose size cannot be evaluated [-Wvla]
     134 |         unsigned int group_free_planes[RCAR_DU_MAX_GROUPS] = { 0, };
         |         ^~~~~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c:134:9: error: variable-sized object may not be initialized


vim +/slpm +866 drivers/pinctrl/nomadik/pinctrl-nomadik.c

dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  860  
1a656a80ea8a6a drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  861  static int nmk_pmx_set(struct pinctrl_dev *pctldev, unsigned int function,
1a656a80ea8a6a drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  862  		       unsigned int group)
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  863  {
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  864  	struct nmk_pinctrl *npct = pinctrl_dev_get_drvdata(pctldev);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  865  	const struct nmk_pingroup *g;
966942ae493650 drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28 @866  	static unsigned int slpm[NMK_MAX_BANKS];
f84b4171312a59 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2013-08-15  867  	unsigned long flags = 0;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  868  	bool glitch;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  869  	int ret = -EINVAL;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  870  	int i;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  871  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  872  	g = &npct->soc->groups[group];
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  873  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  874  	if (g->altsetting < 0)
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  875  		return -EINVAL;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  876  
8a10b1a36db852 drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  877  	dev_dbg(npct->dev, "enable group %s, %zu pins\n", g->grp.name, g->grp.npins);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  878  
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  879  	/*
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  880  	 * If we're setting altfunc C by setting both AFSLA and AFSLB to 1,
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  881  	 * we may pass through an undesired state. In this case we take
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  882  	 * some extra care.
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  883  	 *
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  884  	 * Safe sequence used to switch IOs between GPIO and Alternate-C mode:
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  885  	 *  - Save SLPM registers (since we have a shadow register in the
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  886  	 *    nmk_chip we're using that as backup)
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  887  	 *  - Set SLPM=0 for the IOs you want to switch and others to 1
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  888  	 *  - Configure the GPIO registers for the IOs that are being switched
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  889  	 *  - Set IOFORCE=1
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  890  	 *  - Modify the AFLSA/B registers for the IOs that are being switched
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  891  	 *  - Set IOFORCE=0
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  892  	 *  - Restore SLPM registers
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  893  	 *  - Any spurious wake up event during switch sequence to be ignored
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  894  	 *    and cleared
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  895  	 *
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  896  	 * We REALLY need to save ALL slpm registers, because the external
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  897  	 * IOFORCE will switch *all* ports to their sleepmode setting to as
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  898  	 * to avoid glitches. (Not just one port!)
daf731748f978e drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-22  899  	 */
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  900  	glitch = ((g->altsetting & NMK_GPIO_ALT_C) == NMK_GPIO_ALT_C);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  901  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  902  	if (glitch) {
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  903  		spin_lock_irqsave(&nmk_gpio_slpm_lock, flags);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  904  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  905  		/* Initially don't put any pins to sleep when switching */
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  906  		memset(slpm, 0xff, sizeof(slpm));
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  907  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  908  		/*
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  909  		 * Then mask the pins that need to be sleeping now when we're
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  910  		 * switching to the ALT C function.
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  911  		 */
53cf6b72e07486 drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  912  		for (i = 0; i < g->grp.npins; i++) {
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  913  			struct nmk_gpio_chip *nmk_chip;
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  914  			unsigned int bit;
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  915  
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  916  			nmk_chip = find_nmk_gpio_from_pin(g->grp.pins[i], &bit);
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  917  			if (!nmk_chip) {
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  918  				dev_err(npct->dev,
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  919  					"invalid pin offset %d in group %s at index %d\n",
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  920  					g->grp.pins[i], g->grp.name, i);
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  921  				goto out_pre_slpm_init;
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  922  			}
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  923  
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  924  			slpm[nmk_chip->bank] &= ~BIT(bit);
53cf6b72e07486 drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  925  		}
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  926  		nmk_gpio_glitch_slpm_init(slpm);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  927  	}
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  928  
39b707fa7aba7c drivers/pinctrl/nomadik/pinctrl-nomadik.c Andy Shevchenko    2022-06-21  929  	for (i = 0; i < g->grp.npins; i++) {
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  930  		struct nmk_gpio_chip *nmk_chip;
1a656a80ea8a6a drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  931  		unsigned int bit;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  932  
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  933  		nmk_chip = find_nmk_gpio_from_pin(g->grp.pins[i], &bit);
6ca7d2e3525451 drivers/pinctrl/nomadik/pinctrl-nomadik.c Linus Walleij      2015-06-17  934  		if (!nmk_chip) {
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  935  			dev_err(npct->dev,
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  936  				"invalid pin offset %d in group %s at index %d\n",
39b707fa7aba7c drivers/pinctrl/nomadik/pinctrl-nomadik.c Andy Shevchenko    2022-06-21  937  				g->grp.pins[i], g->grp.name, i);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  938  			goto out_glitch;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  939  		}
8e48230d6df5cb drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  940  		dev_dbg(npct->dev, "setting pin %d to altsetting %d\n",
8e48230d6df5cb drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  941  			g->grp.pins[i], g->altsetting);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  942  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  943  		clk_enable(nmk_chip->clk);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  944  		/*
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  945  		 * If the pin is switching to altfunc, and there was an
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  946  		 * interrupt installed on it which has been lazy disabled,
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  947  		 * actually mask the interrupt to prevent spurious interrupts
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  948  		 * that would occur while the pin is under control of the
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  949  		 * peripheral. Only SKE does this.
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  950  		 */
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  951  		nmk_gpio_disable_lazy_irq(nmk_chip, bit);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  952  
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  953  		__nmk_gpio_set_mode_safe(nmk_chip, bit,
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  954  					 (g->altsetting & NMK_GPIO_ALT_C), glitch);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  955  		clk_disable(nmk_chip->clk);
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  956  
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  957  		/*
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  958  		 * Call PRCM GPIOCR config function in case ALTC
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  959  		 * has been selected:
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  960  		 * - If selection is a ALTCx, some bits in PRCM GPIOCR registers
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  961  		 *   must be set.
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  962  		 * - If selection is pure ALTC and previous selection was ALTCx,
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  963  		 *   then some bits in PRCM GPIOCR registers must be cleared.
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  964  		 */
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  965  		if ((g->altsetting & NMK_GPIO_ALT_C) == NMK_GPIO_ALT_C)
39b707fa7aba7c drivers/pinctrl/nomadik/pinctrl-nomadik.c Andy Shevchenko    2022-06-21  966  			nmk_prcm_altcx_set_mode(npct, g->grp.pins[i],
c22df08c7ffbfb drivers/pinctrl/pinctrl-nomadik.c         Jean-Nicolas Graux 2012-09-27  967  						g->altsetting >> NMK_GPIO_ALT_CX_SHIFT);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  968  	}
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  969  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  970  	/* When all pins are successfully reconfigured we get here */
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  971  	ret = 0;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  972  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  973  out_glitch:
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  974  	if (glitch)
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  975  		nmk_gpio_glitch_slpm_restore(slpm);
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  976  out_pre_slpm_init:
75d270fda64d4e drivers/pinctrl/nomadik/pinctrl-nomadik.c Théo Lebrun        2024-02-28  977  	if (glitch)
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  978  		spin_unlock_irqrestore(&nmk_gpio_slpm_lock, flags);
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  979  
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  980  	return ret;
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  981  }
dbfe8ca259e1f8 drivers/pinctrl/pinctrl-nomadik.c         Linus Walleij      2012-05-02  982  

:::::: The code at line 866 was first introduced by commit
:::::: 966942ae493650210b9514f3d4bfc95f78ef0129 gpio: nomadik: extract GPIO platform driver from drivers/pinctrl/nomadik/

:::::: TO: Théo Lebrun <theo.lebrun@bootlin.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
