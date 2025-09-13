Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4409F57C9F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757774730; cv=none; b=YttE3fdqSO/rQM42Zpr5uzSWczV14xqC5fQ1A2x3qhChe/A1lw1IlKj4TH31LmLOIlplPYKLkBNi8suWNmKaIrXLSUoNRbDYYcm7mmYTklIFcVZvLL8bkcDioNuSwj9iHASWpUM3t5CbbttJVgFckhblJveHBlyMA7GggnPUne0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757774730; c=relaxed/simple;
	bh=/Xz98fVP02xvJx85kDErDac/xpmGs4ViIehYBKsioXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EB5aPmgD37EqlvdDxjvKt14Vg60JYnNoJjyPaaDxDyf79WDLX2w7RfH0YurzJa5oOMZjiKZ0kyvvHLYF9pf6DE+7fhfCVk4G7wDF8eItCajO6h/2DayoNZKc1PJ1Pr43ZwaH1dw8g7iYn+uWZIWZ30cqURN5sC/7S7OIpjl/VY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ev2Ef2/M; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ev2Ef2/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757774729; x=1789310729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Xz98fVP02xvJx85kDErDac/xpmGs4ViIehYBKsioXA=;
  b=Ev2Ef2/MciIvHX1Q+gmklAR/M6pZ5Fr5ySjEZFuw8vltAsCBluY5YiD4
   8y48zRUvUdm3UM/XE6Z+5SPVnIx643CzIS5jjtOGimz1bGcWNtpm05UkR
   qZ83W5a52ssHOKmHGHmKrdIUo8r8kAwuwc6hh4zWl5qDp2c0eKuZyZ/zo
   tluIFhVnhOKiBCxIJ+05Y5HFS/qpVVdhW8HAITMOvVlJjIyBf+niRIqhp
   1ep9limYoeNlp542paM8nPUmUCeFZ9+n8IvVanM2GQ6PW5JH4nHX8xfcK
   NC4AveT2a+N1isfDJUZ+NKKF9USPVSVRHI1lMsoucTTQTWlUpL69pr3Hc
   g==;
X-CSE-ConnectionGUID: 3HFQ9POsS5+NCCKQLi9fTQ==
X-CSE-MsgGUID: GFgkngLpSq+cNc+2P48WKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60039680"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60039680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 07:45:27 -0700
X-CSE-ConnectionGUID: VD48XWEJRwSTLOccNOaIfA==
X-CSE-MsgGUID: JM+84tCuRsyi/E+C1YXdJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="178588698"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2025 07:45:25 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxRVD-0001ay-1g;
	Sat, 13 Sep 2025 14:45:23 +0000
Date: Sat, 13 Sep 2025 22:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 5114/8719]
 drivers/pinctrl/nomadik/pinctrl-nomadik.c:587:2: error: too few arguments to
 function 'nmk_gpio_dbg_show_one'
Message-ID: <202509132232.12viPUPB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
commit: ddeb66d2cb10f03a43d97a0ff2c3869d1951c87d [5114/8719] gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks
config: m68k-randconfig-r113-20250913 (https://download.01.org/0day-ci/archive/20250913/202509132232.12viPUPB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509132232.12viPUPB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509132232.12viPUPB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/nomadik/pinctrl-nomadik.c: In function 'nmk_pin_dbg_show':
>> drivers/pinctrl/nomadik/pinctrl-nomadik.c:587:2: error: too few arguments to function 'nmk_gpio_dbg_show_one'
     nmk_gpio_dbg_show_one(s, pctldev, chip, offset - chip->base);
     ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pinctrl/nomadik/pinctrl-nomadik.c:44:
   include/linux/gpio/gpio-nomadik.h:268:20: note: declared here
    static inline void nmk_gpio_dbg_show_one(struct seq_file *s,
                       ^~~~~~~~~~~~~~~~~~~~~


vim +/nmk_gpio_dbg_show_one +587 drivers/pinctrl/nomadik/pinctrl-nomadik.c

   577	
   578	static void nmk_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
   579				     unsigned int offset)
   580	{
   581		struct gpio_chip *chip = find_gc_from_pin(offset);
   582	
   583		if (!chip) {
   584			seq_printf(s, "invalid pin offset");
   585			return;
   586		}
 > 587		nmk_gpio_dbg_show_one(s, pctldev, chip, offset - chip->base);
   588	}
   589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
