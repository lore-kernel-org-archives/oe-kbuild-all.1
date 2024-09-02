Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8845FDA7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 22:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725317376; cv=none; b=t5+9kgKGjfAac87vC14wKC94pvjBWrRPUQ+QcN5ydalxo4LOYhuqIL/HhYqIbHv4KlIY+xGLJbjuZVGHHa6eWo+SmvqLb57XD6Bp22Vwm5oyJMhGFsyTsAj430tiQHxQDt58ctvim6HgyWrYAXUOdwMqpi+3iJBxevwm+k5T6So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725317376; c=relaxed/simple;
	bh=hM9Z4BDK049pTPtzfQR5/DrcTHC5fpfuvDDY2kJwe60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzFAZsqZzsNxdLGmlagy0JDkvd2HvIdWdjZkhxYNjPkjnv7SQbdUBMAaHwJADTOYRvkwPDh9i2Ux7pFC36qhukUtKWX/9hxBo9FWQpTEk4lJ7o9MwaDjmytJJuUNjQ4Gqmyemgysqr/PjmCXlrQADy9KJge7iIuVrE+Mm75Inso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKZpSIdM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKZpSIdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725317374; x=1756853374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hM9Z4BDK049pTPtzfQR5/DrcTHC5fpfuvDDY2kJwe60=;
  b=mKZpSIdMGzm9Ec7nPueW+10IR2G/iI+/OgfaLRccrgxV1X2svkSzMiDX
   JTlMDjOmmuwhyDk8a/0QKRVOduIGkNAVWNZNgz+Y5z13YOCSZmInT20xf
   qUac/bY3MKgZVXa/C78uTPPq4YC3Kkjz3N9y3P4SnpWT4R8zti8Hk1KJt
   Gg/xRsqkUQ8R4gCQ1FrjDAVSHlOh9tsbARng76mY243by9m+n3ICDpdkb
   IBAOhofOTVlfGapAPa9IHN3khZMLoezYS1WO9TXvsteI4L94ykUiXplXJ
   9UDsWMr8OqgIkwrKOMrFrajVPckWWPjz9eL8AQQGXkw27+oxyTD45xdcg
   g==;
X-CSE-ConnectionGUID: kU+38jDTTPWycGtgfPWIrQ==
X-CSE-MsgGUID: 6JcjQJDhTs6ieTDj4tU64A==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34505554"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="34505554"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 15:49:31 -0700
X-CSE-ConnectionGUID: DwtGiH6iTHO4XCXanijk0w==
X-CSE-MsgGUID: 2gI6yUKsSR+BUeLSgFutqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="65214969"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2024 15:49:25 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slFrO-0005zC-11;
	Mon, 02 Sep 2024 22:49:22 +0000
Date: Tue, 3 Sep 2024 06:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andriy.shevchenko@linux.intel.com,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	judyhsiao@google.com, navada@ti.com, cujomalainey@google.com,
	aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com, antheas.dk@gmail.com,
	Jerry2.Huang@lcfuturecenter.com, jim.shil@goertek.com
Subject: Re: [PATCH v2] ASoC: tas2781: Add Calibration Kcontrols for
 Chromebook
Message-ID: <202409030627.SFdj22Xs-lkp@intel.com>
References: <20240902062029.983-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902062029.983-1-shenghao-ding@ti.com>

Hi Shenghao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20240902]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoC-tas2781-Add-Calibration-Kcontrols-for-Chromebook/20240902-142152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240902062029.983-1-shenghao-ding%40ti.com
patch subject: [PATCH v2] ASoC: tas2781: Add Calibration Kcontrols for Chromebook
config: alpha-randconfig-r073-20240902 (https://download.01.org/0day-ci/archive/20240903/202409030627.SFdj22Xs-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409030627.SFdj22Xs-lkp@intel.com/

smatch warnings:
sound/soc/codecs/tas2781-i2c.c:452 sngl_calib_start() warn: inconsistent indenting

vim +452 sound/soc/codecs/tas2781-i2c.c

   425	
   426	static void sngl_calib_start(struct tasdevice_priv *tas_priv, int i,
   427		int *reg, unsigned char *dat)
   428	{
   429		struct tasdevice *tasdev = tas_priv->tasdevice;
   430		struct bulk_reg_val *p = tasdev[i].cali_data_backup;
   431		const int sum = ARRAY_SIZE(tas2781_cali_start_reg);
   432		int j;
   433	
   434		if (p == NULL)
   435			return;
   436	
   437		/* Store the current setting from the chip */
   438		for (j = 0; j < sum; j++) {
   439			if (p[j].val_len == 1) {
   440				if (p[j].is_locked)
   441					tasdevice_dev_write(tas_priv, i,
   442						TAS2781_TEST_UNLOCK_REG,
   443						TAS2781_TEST_PAGE_UNLOCK);
   444				tasdevice_dev_read(tas_priv, i, p[j].reg,
   445					(int *)&p[j].val[0]);
   446			} else {
   447				switch (p[j].reg) {
   448				case 0:
   449				if (!reg[0])
   450					continue;
   451				p[j].reg = reg[0];
 > 452					break;
   453				case TAS2781_PRM_PLT_FLAG_REG:
   454				p[j].reg = reg[1];
   455					break;
   456				case TAS2781_PRM_SINEGAIN_REG:
   457				p[j].reg = reg[2];
   458					break;
   459				case TAS2781_PRM_SINEGAIN2_REG:
   460				p[j].reg = reg[3];
   461					break;
   462				}
   463				tasdevice_dev_bulk_read(tas_priv, i, p[j].reg,
   464					p[j].val, 4);
   465			}
   466		}
   467	
   468		/* Update the setting for calibration */
   469		for (j = 0; j < sum - 2; j++) {
   470			if (p[j].val_len == 1) {
   471				if (p[j].is_locked)
   472					tasdevice_dev_write(tas_priv, i,
   473						TAS2781_TEST_UNLOCK_REG,
   474						TAS2781_TEST_PAGE_UNLOCK);
   475				tasdevice_dev_write(tas_priv, i, p[j].reg,
   476					tas2781_cali_start_reg[j].val[0]);
   477			} else {
   478				if (!p[j].reg)
   479					continue;
   480				tasdevice_dev_bulk_write(tas_priv, i, p[j].reg,
   481					(unsigned char *)
   482					tas2781_cali_start_reg[j].val, 4);
   483			}
   484		}
   485	
   486		tasdevice_dev_bulk_write(tas_priv, i, p[j].reg, &dat[1], 4);
   487		tasdevice_dev_bulk_write(tas_priv, i, p[j + 1].reg, &dat[5], 4);
   488	}
   489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
