Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3B8748D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 04:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736395870; cv=none; b=gOlevex4a62T1D+iVxe8ULJlnrQYxT7IOCluXxTIQCjKQvMOVtINi11TFiqZSkgPXvwAKJTpfuonubhNZj/zi6bB6aL9gH7/RdsMjXSLD5yyXs4e9ILd51Cp6gk7MQubhndWIT8bqE7LW+7nie7F1G19hw52Ypvg+OEfEibAizc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736395870; c=relaxed/simple;
	bh=jXKR1qbDCJJt3cGd/Td3XwbMSNnEPR6H/GVXIa97qVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eewj5bNfDR13Dy1LrQuSHL3Dxx+8ngrinufd1Mqii/xBFW9IyEd5VkYyI/wY2CsIjEQnxp7c3GkZ8113jK+BNRZWiFRy25fg21ETDM7Anpu2AY7P2OrGohmXhy1F05lPOPFPiAANspoK6DbFzx6GPzRKakr6E29aMsD8Jdqfw48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqVHWoy9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqVHWoy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736395869; x=1767931869;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jXKR1qbDCJJt3cGd/Td3XwbMSNnEPR6H/GVXIa97qVQ=;
  b=lqVHWoy9Ub0gPbItZXRB6FtCR57WCoi3DEf87RFiBzowVOMaHXFRKvJ1
   bQxRSaBZypIJP499WmqJcrhA1DILqfbEP/cIcU3du5gob/kOA4/6dVZ7o
   gNL2kyWiw26f1P+kcT+Y6T6RISlc6SuKKTR8UcSkXQ+5tJVqL+TMu8aoi
   7guVWeq+dchh661MvXX1AfB+O37nLhsdzrxab3pvBsN8BwUyvPYYhXk8B
   ylAR4PIdZLmdm5CK2DjwOLsaHakfRVvUp1X5hbjcXJg7y1DG+ELE2Mi6v
   YdGHWqYPnguhdIhlFs3fvY6hyQ1PbvOz/L6HG1O6PvOiiUJZd0Oc+S2ae
   w==;
X-CSE-ConnectionGUID: sQ/8W5EiTni+x8aGAcAYrg==
X-CSE-MsgGUID: aFysc5MfTliTzQkBpo74aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36526139"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="36526139"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 20:11:09 -0800
X-CSE-ConnectionGUID: vh8e4UARSxqKa3LGMEC83Q==
X-CSE-MsgGUID: e33hHeIGSE+JWHHxyXnlXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="103098812"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Jan 2025 20:11:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVjsu-000H1n-1y;
	Thu, 09 Jan 2025 04:11:04 +0000
Date: Thu, 9 Jan 2025 12:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [broonie-ci:fileVlmFCG 59/59] sound/soc/sunxi/sun4i-codec.c:2380:29:
 warning: unused variable 'scodec'
Message-ID: <202501091243.WF1D0ml7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileVlmFCG
head:   71b63892c728eaead796701751cf942708e56e85
commit: 71b63892c728eaead796701751cf942708e56e85 [59/59] ASoC: sun4i-codec: Use new devm clk and reset APIs
config: m68k-randconfig-r071-20250109 (https://download.01.org/0day-ci/archive/20250109/202501091243.WF1D0ml7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091243.WF1D0ml7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501091243.WF1D0ml7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/sunxi/sun4i-codec.c: In function 'sun4i_codec_remove':
>> sound/soc/sunxi/sun4i-codec.c:2380:29: warning: unused variable 'scodec' [-Wunused-variable]
    2380 |         struct sun4i_codec *scodec = snd_soc_card_get_drvdata(card);
         |                             ^~~~~~


vim +/scodec +2380 sound/soc/sunxi/sun4i-codec.c

45fb6b6f2aa3f6b Emilio López     2015-09-12  2376  
f56a1b1026ff2e0 Uwe Kleine-König 2023-03-15  2377  static void sun4i_codec_remove(struct platform_device *pdev)
45fb6b6f2aa3f6b Emilio López     2015-09-12  2378  {
45fb6b6f2aa3f6b Emilio López     2015-09-12  2379  	struct snd_soc_card *card = platform_get_drvdata(pdev);
45fb6b6f2aa3f6b Emilio López     2015-09-12 @2380  	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(card);
45fb6b6f2aa3f6b Emilio López     2015-09-12  2381  
45fb6b6f2aa3f6b Emilio López     2015-09-12  2382  	snd_soc_unregister_card(card);
45fb6b6f2aa3f6b Emilio López     2015-09-12  2383  }
45fb6b6f2aa3f6b Emilio López     2015-09-12  2384  

:::::: The code at line 2380 was first introduced by commit
:::::: 45fb6b6f2aa3f6b22b81078db0dba4b26c9d0bdb ASoC: sunxi: add support for the on-chip codec on early Allwinner SoCs

:::::: TO: Emilio López <emilio@elopez.com.ar>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
