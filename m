Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD3A5F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 01:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719020735; cv=none; b=kpvISlT3V0+eKkuLT/ur/ausea5MkJWnSzHTZTLZuhUnQJ+ZGVfE+rANIyfmFOFZ8wRJQ78SmH7z1zR4tejXgvhErPVezsZncUJY9wqEvEBHDFsAbjZWvT07UseVBSj8E3X1rqv7LA1J1eXWsZ/uwBOQoMhYoRJxUaR9oRJ4tKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719020735; c=relaxed/simple;
	bh=w6EuVaMnuGqffeBQVudVdtabWJEl7m3aoSA1dDkx7p4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tzTUc6QkS0LmqB29B/5I0/m+OjXRVVyt4T82EchlTL4SfrF7OMKuHVOl0uRaOv/MTE/iKJs9lIoFRvs2tAHGQgv083Ndd8FV0dkrihgOUbKxDVq0DS0WvK735Gm/xpiw1UXwdBbc5gLqXSctLgwUSCVdwo/nQb3zmgDlkmp1NTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pm3A/Yoz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pm3A/Yoz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719020733; x=1750556733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w6EuVaMnuGqffeBQVudVdtabWJEl7m3aoSA1dDkx7p4=;
  b=Pm3A/YozGNBSvD+WIDuOQ/rr7rqRwv9tBB/4Q/+nqBtITb3dYKvnh9Vk
   mb2Nhc786bw5msQTMfRYEyIuv5pz+8dQIWDpVDypaA5IojhqhusmI4yyP
   k7HQ2vMupXPtieL7ebYjE5kq44hINQaYjNvCqFHLtpXe4rnTftIBlNRY8
   nS/dC7MQ3mzrRkk9+81yxNlclSF/Y7PRxtNxE3nJ9drREKT5srQUsm5H5
   24/cuamLCr9yqL7d3bzcYySjx6zRJUEBPdh4Z9u9Kt9khSkyPQWOGRg/S
   IZ/BiryxRJMdMkBgQfA03VVQIxazEJ29NDeUiP06JlwHd3mK91QJmzZGX
   A==;
X-CSE-ConnectionGUID: zzji53r4R8GsW+6DZN1bog==
X-CSE-MsgGUID: 7UVRvJflQaqTKZLTxj6p9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="26757034"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="26757034"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 18:45:31 -0700
X-CSE-ConnectionGUID: P9mNGZ4PSg6nYDPUX+2TUg==
X-CSE-MsgGUID: 2qrnDWnzSaSjiXaocmm9fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="43444165"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Jun 2024 18:45:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKpok-0009DC-3B;
	Sat, 22 Jun 2024 01:45:26 +0000
Date: Sat, 22 Jun 2024 09:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Belin <nbelin@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [broonie-ci:v6_20240619_amergnat_add_audio_support_for_the_mediatek_genio_350_evk_board
 33/34] sound/soc/codecs/mt6357.c:993:29: warning: unused variable 'priv'
Message-ID: <202406220937.v2IRV5Lt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v6_20240619_amergnat_add_audio_support_for_the_mediatek_genio_350_evk_board
head:   bb7947bc00dc3b464cc5ce3db7617d3ef9a9d753
commit: 60c32c70aea34f30fbf5d754189b32581cf6a425 [33/34] ASoC: codecs: add MT6357 support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240622/202406220937.v2IRV5Lt-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406220937.v2IRV5Lt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220937.v2IRV5Lt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/mt6357.c: In function 'mt_delay_250_event':
>> sound/soc/codecs/mt6357.c:993:29: warning: unused variable 'priv' [-Wunused-variable]
     993 |         struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
         |                             ^~~~
   sound/soc/codecs/mt6357.c: In function 'mt6357_platform_driver_probe':
>> sound/soc/codecs/mt6357.c:1867:55: warning: too many arguments for format [-Wformat-extra-args]
    1867 |                 return dev_err_probe(&pdev->dev, ret, "Failed to parse dts\n", __func__);
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~


vim +/priv +993 sound/soc/codecs/mt6357.c

   987	
   988	static int mt_delay_250_event(struct snd_soc_dapm_widget *w,
   989				      struct snd_kcontrol *kcontrol,
   990				      int event)
   991	{
   992		struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 > 993		struct mt6357_priv *priv = snd_soc_component_get_drvdata(cmpnt);
   994	
   995		switch (event) {
   996		case SND_SOC_DAPM_POST_PMU:
   997			usleep_range(250, 270);
   998			break;
   999		case SND_SOC_DAPM_PRE_PMD:
  1000			usleep_range(250, 270);
  1001			break;
  1002		default:
  1003			break;
  1004		}
  1005	
  1006		return 0;
  1007	}
  1008	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
