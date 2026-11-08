Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111416;
	b=vOiB+H9i7NtsYq+mcKgPhGuoWK7Y6ZIaJ9I2uiAjhRKFE+ZPaQ89eCu2oNLKTBDiWZAL
	 Nd8eHA5HxkezmDINzZtcYXfl020KVDLPmW7eFwVgP7DTieBeo6Op+fB/TX0rdesjwGssm
	 9P3rHVg0qd9HIxMwpE47wcz/Toz0KqcSTiSBsFX/Bk6EhE/xoaViysscqVN/IlnwaYfxv
	 5JUWoxRrbrnfcOezPxLzimc9VliFp1F/jUCDCS6LY/+CfXa7eZRZ0C/+cunjadom8qWK2
	 COye+Jd+QZIi+5e/KV9jE9aK1KKlavaMSIbtbTp9j2qHUkG162Ojjpi7XRCgwk7YTLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111416;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GFeo120/e3A7s0AbOXW/TKYVSvyMqvQJzWWKOmH+HEc=;
	b=Yu44fmaexCWmo9NAMYnNm2bz0lOWNHE8K0pGG0h70BGR3nBmdyCUpdacWaywieg9lyZW
	 YhIqDUgecUDf2W4Ainywmfu/gCUKS8h3ATL8RyAnmcvMwWOYBOKJzFQ8Rvoitd7hLKavj
	 8WHjMcDwFA/PmZ07Jl5bC6LDPnXee/RsM0kzPbbpBr3v7AOHfcIpyE7lQ3STxtU8Af/Wp
	 kkMiONtiE0JGgGUQ3E6GKl+iLT9j8Z8Sq8mKvlXxyHWRxrn/FOfloKThY/G/JDP9947ij
	 zh96BwdO/3rdsi95qa+9TWd1sI/4j45Y3zO2j87ydPKXfQbyOYUyDyKWv5Lvz/HSSCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OeWc0V0m;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7908B606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 04:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7908B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OeWc0V0m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794111413; x=1825647413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Q+VZbenjtYNCan7x5h6v4egymzH94QrLAWhp6uxPaM=;
  b=OeWc0V0mZt8XM6VBpgN+zBFuettsR1RPeEirJPJzS0d08Rla0ofSv6ak
   7a8ykUG2U4dpSaXacNaa6fxNXTX8wMi61bFbVnM2QO6LEy38CbTBWKtO3
   aLZW34T3nWtlcWT5uNwFoKDV7E+8TTVPs0up1zxh85GvXJeuqVrdwpHWc
   W0sZTS1yElsypzG4qnJHpX+6pHlmgtKykCWiGJGhYBmOscsGr6ODirpvX
   9P+r3FhZvZVaF5hknYUVMmJ/wph/M+cBeUoLmv9uwGF6B+DckOOMYwORz
   +pPoIJjP8Fl3o4BIBVMX2inptjTMm7jwpWqlnos141OuLi7zYR0kdq48n
   w==;
X-CSE-ConnectionGUID: ZihoHNwtSZqg+XSmxG/3Bw==
X-CSE-MsgGUID: rc+lUFQ8Skmhtg1K+Kn1CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2775232"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2775232"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 20:16:52 -0800
X-CSE-ConnectionGUID: cWI89eCdT7uNvkgdyPugyw==
X-CSE-MsgGUID: hBBQBA72R+a0W3RdhTt7AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7597346"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2026 20:16:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPuKj-00000000s2B-20KO;
	Sun, 08 Nov 2026 04:16:45 +0000
Date: Sun, 8 Nov 2026 12:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, vkoul@kernel.org,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, yung-chuan.liao@linux.intel.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
	Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
	lee@kernel.org, Vijendar.Mukunda@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 4/4] ASoC: amd: ps: guard SDW IRQ work scheduling with
 interrupt_enabled flag
Message-ID: <202611081206.vQhseto9-lkp@intel.com>
References: <20261107175339.3547918-5-Vijendar.Mukunda@amd.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107175339.3547918-5-Vijendar.Mukunda@amd.com>

Hi Vijendar,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on vkoul-dmaengine/next linus/master v7.4-rc1 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vijendar-Mukunda/ASoC-amd-ps-guard-adata-sdw-dereferences-with-NULL-check-in-IRQ-handler/20261107-232226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261107175339.3547918-5-Vijendar.Mukunda%40amd.com
patch subject: [PATCH 4/4] ASoC: amd: ps: guard SDW IRQ work scheduling with interrupt_enabled flag
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20261108/202611081206.vQhseto9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081206.vQhseto9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081206.vQhseto9-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/amd/ps/pci-ps.c: In function 'acp63_irq_handler':
>> sound/soc/amd/ps/pci-ps.c:218:55: error: 'struct amd_sdw_manager' has no member named 'interrupt_enabled'
     218 |                         if (amd_manager && amd_manager->interrupt_enabled)
         |                                                       ^~
   sound/soc/amd/ps/pci-ps.c:229:55: error: 'struct amd_sdw_manager' has no member named 'interrupt_enabled'
     229 |                         if (amd_manager && amd_manager->interrupt_enabled)
         |                                                       ^~


vim +218 sound/soc/amd/ps/pci-ps.c

   194	
   195	static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
   196	{
   197		struct acp63_dev_data *adata;
   198		struct pdm_dev_data *ps_pdm_data;
   199		struct amd_sdw_manager *amd_manager;
   200		u32 ext_intr_stat, ext_intr_stat1;
   201		u16 irq_flag = 0;
   202		u16 wake_irq_flag = 0;
   203		u16 sdw_dma_irq_flag = 0;
   204	
   205		adata = dev_id;
   206		if (!adata)
   207			return IRQ_NONE;
   208		/* ACP interrupts will be cleared by reading particular bit and writing
   209		 * same value to the status register. writing zero's doesn't have any
   210		 * effect.
   211		 * Bit by bit checking of IRQ field is implemented.
   212		 */
   213		ext_intr_stat = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
   214		if (ext_intr_stat & ACP_SDW0_STAT) {
   215			writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
   216			if (adata->sdw) {
   217				amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
 > 218				if (amd_manager && amd_manager->interrupt_enabled)
   219					schedule_work(&amd_manager->amd_sdw_irq_thread);
   220			}
   221			irq_flag = 1;
   222		}
   223	
   224		ext_intr_stat1 = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
   225		if (ext_intr_stat1 & ACP_SDW1_STAT) {
   226			writel(ACP_SDW1_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
   227			if (adata->sdw) {
   228				amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
   229				if (amd_manager && amd_manager->interrupt_enabled)
   230					schedule_work(&amd_manager->amd_sdw_irq_thread);
   231			}
   232			irq_flag = 1;
   233		}
   234	
   235		if (ext_intr_stat & ACP_ERROR_IRQ) {
   236			writel(ACP_ERROR_IRQ, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
   237			/* TODO: Report SoundWire Manager instance errors */
   238			writel(0, adata->acp63_base + ACP_SW0_I2S_ERROR_REASON);
   239			writel(0, adata->acp63_base + ACP_SW1_I2S_ERROR_REASON);
   240			writel(0, adata->acp63_base + ACP_ERROR_STATUS);
   241			irq_flag = 1;
   242		}
   243	
   244		if (adata->acp_rev >= ACP70_PCI_REV)
   245			wake_irq_flag = check_and_handle_acp70_sdw_wake_irq(adata);
   246	
   247		if (ext_intr_stat & BIT(PDM_DMA_STAT)) {
   248			ps_pdm_data = dev_get_drvdata(&adata->pdm_dev->dev);
   249			writel(BIT(PDM_DMA_STAT), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
   250			if (ps_pdm_data->capture_stream)
   251				snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
   252			irq_flag = 1;
   253		}
   254	
   255		sdw_dma_irq_flag = check_and_handle_sdw_dma_irq(adata, ext_intr_stat, ext_intr_stat1);
   256		if (sdw_dma_irq_flag)
   257			return IRQ_WAKE_THREAD;
   258	
   259		if (irq_flag || wake_irq_flag)
   260			return IRQ_HANDLED;
   261		else
   262			return IRQ_NONE;
   263	}
   264	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
