Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B6ED51C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706428884; cv=none; b=fn4VqtQOPLEks8Lxci8ATXZGCGLdpSjbEg7mv9Szu47BWNiWsGYRT3brmrt0NemfukrWiQbmToswF0XwQftgCs3A8z4QSgn3GjYHvRJRRq2CtN+4LeLuUujdufDInnRWybiFKWiVemPnEsL7GJwKrL7SYVdupL6XsxzNZkIQaWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706428884; c=relaxed/simple;
	bh=V/uxGuIdjQtXLUat9Wg34EnJS/gDqQBII63hArr4gMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=enhmpfaUMdy9DgxTAlKYWRZTwPbeB6IO2fo0T5V/NMe9QmYbroslGZaqlomnv2EXZS1SkQCBJqS+pGP51trYUgFh/VhJFsnCppX48Uvyqpb80Noou+uEjs20JGFqhagHX+R2fGxpFFLa4FNw0WALL32qIm7wCLC1ywCg65+iuGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMcASZyf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMcASZyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706428882; x=1737964882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V/uxGuIdjQtXLUat9Wg34EnJS/gDqQBII63hArr4gMs=;
  b=ZMcASZyfgti/HRX+SKGtdqLwl1htKDR1qP7r+4w8NfIP6eFYVjbbuyih
   E1ZpAQ/rJUgc4g1nTQ9t5/RWTC+FuSUO9TLE2eYlDlN6Y0639K1ioejh1
   cMoY4FX1xXg+Y2HGBCeZiGi759WNbty+VHW3H7sWouJR7B59zjSO2ZY2Z
   vZ50rYS6e0dGuG88zxv2MxKXpGJvgGC++EuG8hlBgfs4smvIS2gJcDH4m
   AsReN2j81q6xacZEJUjEfsc2mlp0TJnVCF/Q0Gd0aExNnTiDD+IwJcILd
   wspGxzXwTV8NAR2sMzy3v28FCsEQ/WWbm6jqCnFZAulaGA98eAw2frUAc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="21283061"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="21283061"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 00:01:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="787514997"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="787514997"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2024 00:01:20 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU06P-0003EQ-2a;
	Sun, 28 Jan 2024 08:01:17 +0000
Date: Sun, 28 Jan 2024 16:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/pm-ops 11/29] sound/arm/aaci.c:742:22: warning:
 unused variable 'aaci'
Message-ID: <202401281542.hlZQZx6m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/pm-ops
head:   2fe6ffd7c79f740b73533d44de3ae0e542674857
commit: 8c975a919c0e6139ddf3692fa44992364587070c [11/29] ALSA: aaci: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
config: arm-randconfig-004-20240127 (https://download.01.org/0day-ci/archive/20240128/202401281542.hlZQZx6m-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281542.hlZQZx6m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281542.hlZQZx6m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/arm/aaci.c: In function 'aaci_do_suspend':
>> sound/arm/aaci.c:742:22: warning: unused variable 'aaci' [-Wunused-variable]
     742 |         struct aaci *aaci = card->private_data;
         |                      ^~~~


vim +/aaci +742 sound/arm/aaci.c

cb5a6ffc5c09bc Russell King 2005-05-12  736  
cb5a6ffc5c09bc Russell King 2005-05-12  737  /*
cb5a6ffc5c09bc Russell King 2005-05-12  738   * Power Management.
cb5a6ffc5c09bc Russell King 2005-05-12  739   */
b13a714923fe4d Ulf Hansson  2013-12-03  740  static int aaci_do_suspend(struct snd_card *card)
cb5a6ffc5c09bc Russell King 2005-05-12  741  {
cb5a6ffc5c09bc Russell King 2005-05-12 @742  	struct aaci *aaci = card->private_data;
792a6c51875c9d Takashi Iwai 2005-11-17  743  	snd_power_change_state(card, SNDRV_CTL_POWER_D3cold);
cb5a6ffc5c09bc Russell King 2005-05-12  744  	return 0;
cb5a6ffc5c09bc Russell King 2005-05-12  745  }
cb5a6ffc5c09bc Russell King 2005-05-12  746  

:::::: The code at line 742 was first introduced by commit
:::::: cb5a6ffc5c09bc354af69407dae710dcddcced37 [ALSA] ARM AACI primecell driver

:::::: TO: Russell King <rmk@arm.linux.org.uk>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
