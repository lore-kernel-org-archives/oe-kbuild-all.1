Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6451D13D2E8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 00:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709168007; cv=none; b=WtF+bKW7RwfESzu8R0qVMdAuxQ2IO5pSycZfFO/Rd6kFHNh3dScZgesFyS+JW3j29fQHvTMmNd6U0NTqN4kRR9KF4C8uznPIIVoYNMvnjGoQDYtgle+AYlDhptp/+dJEF1U6jtD61qYh7Mwz8HNRnEhT2s8iwLKMTWVJXwx1sDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709168007; c=relaxed/simple;
	bh=esxJ59g5YmNNIqPoQ4IcnKcYX1KC+8bC7JJtSlVBuqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O26bCs/HBW0eAzXQwmt0ooU7AGK1b9nm9SQE+WvceqY1TDtiVvGUdAVlwErX3DyCXtKJo0cwZDRzUrVR/CyN5Nk2+MTJDNhP74nZK4B8JwXBIw7MIjroirWIrs9XJ5j6Mlqumnj3fUNmIZQRaySU66jNpHPDvwA+mn34Bany2Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlwW45j5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlwW45j5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709168005; x=1740704005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=esxJ59g5YmNNIqPoQ4IcnKcYX1KC+8bC7JJtSlVBuqY=;
  b=ZlwW45j5522b5nSRGZfZqOV9itNS4JWzEXR44yIuYX1556qJNvvyNjUM
   5LZMCTJ07OriP00jIhsgQIykmnIi19oK5gkiynt3QqQoR9Im1R1t71haf
   6xSUts9VIulk1HWtQQhv/hhjLSchObbfvZaLpF/cZhcy2YfTvjrXZUcuj
   sdZQWRw/KJhMR0swOFy89sesZKCaCqexjPKGq+wGJWTbNEnRlitbcyhI1
   i7D0XJCXFM5W2nfHhBsM9nbJdvSHlWq3PAQ+S0fE4ToRMboAWi2Jv8vwi
   15SolBYKEzO6CHt8Im+ScsyWP6EJcFHiUMq/BB821XrXCGYEIuTTkt92z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14174604"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="14174604"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:53:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="12203526"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 Feb 2024 16:53:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfUfp-000CW3-0M;
	Thu, 29 Feb 2024 00:53:21 +0000
Date: Thu, 29 Feb 2024 08:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:soc-pcm-cleanup-2024-02-27 3/4]
 sound/soc/intel/avs/pcm.c:1565:22: error: no member named 'users' in 'struct
 snd_soc_dpcm_runtime'
Message-ID: <202402290842.09Yqj6XV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux soc-pcm-cleanup-2024-02-27
head:   378ed01e36098e26f82f6e0e889f98fd5ca1e8fa
commit: 1b849845de9332050046c914bbc3b2129fd2fd6b [3/4] ASoC: soc-pcm: replace snd_soc_dpcm_runtime users
config: x86_64-randconfig-161-20240228 (https://download.01.org/0day-ci/archive/20240229/202402290842.09Yqj6XV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290842.09Yqj6XV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290842.09Yqj6XV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/avs/pcm.c:1565:22: error: no member named 'users' in 'struct snd_soc_dpcm_runtime'
    1565 |                         if (be->dpcm[dir].users == 1)
         |                             ~~~~~~~~~~~~~ ^
   1 error generated.


vim +1565 sound/soc/intel/avs/pcm.c

d070002a20fc071 Cezary Rojewski   2022-05-16  1542  
d070002a20fc071 Cezary Rojewski   2022-05-16  1543  static int avs_component_hda_open(struct snd_soc_component *component,
d070002a20fc071 Cezary Rojewski   2022-05-16  1544  				  struct snd_pcm_substream *substream)
d070002a20fc071 Cezary Rojewski   2022-05-16  1545  {
5d2d1a48a2f7734 Kuninori Morimoto 2023-09-11  1546  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
d070002a20fc071 Cezary Rojewski   2022-05-16  1547  	struct hdac_ext_stream *link_stream;
d070002a20fc071 Cezary Rojewski   2022-05-16  1548  	struct hda_codec *codec;
d070002a20fc071 Cezary Rojewski   2022-05-16  1549  
eb0699c4cd6e32d Cezary Rojewski   2022-10-27  1550  	if (!rtd->dai_link->no_pcm) {
eb0699c4cd6e32d Cezary Rojewski   2022-10-27  1551  		struct snd_pcm_hardware hwparams = avs_pcm_hardware;
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1552  		struct snd_soc_pcm_runtime *be;
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1553  		struct snd_soc_dpcm *dpcm;
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1554  		int dir = substream->stream;
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1555  
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1556  		/*
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1557  		 * Support the DPCM reparenting while still fulfilling expectations of HDAudio
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1558  		 * common code - a valid stream pointer at substream->runtime->private_data -
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1559  		 * by having all FEs point to the same private data.
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1560  		 */
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1561  		for_each_dpcm_be(rtd, dir, dpcm) {
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1562  			struct snd_pcm_substream *be_substream;
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1563  
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1564  			be = dpcm->be;
f38d4c72cb2d68e Cezary Rojewski   2022-11-18 @1565  			if (be->dpcm[dir].users == 1)
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1566  				break;
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1567  
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1568  			be_substream = snd_soc_dpcm_get_substream(be, dir);
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1569  			substream->runtime->private_data = be_substream->runtime->private_data;
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1570  			break;
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1571  		}
eb0699c4cd6e32d Cezary Rojewski   2022-10-27  1572  
eb0699c4cd6e32d Cezary Rojewski   2022-10-27  1573  		/* RESUME unsupported for de-coupled HD-Audio capture. */
f38d4c72cb2d68e Cezary Rojewski   2022-11-18  1574  		if (dir == SNDRV_PCM_STREAM_CAPTURE)
eb0699c4cd6e32d Cezary Rojewski   2022-10-27  1575  			hwparams.info &= ~SNDRV_PCM_INFO_RESUME;
eb0699c4cd6e32d Cezary Rojewski   2022-10-27  1576  
eb0699c4cd6e32d Cezary Rojewski   2022-10-27  1577  		return snd_soc_set_runtime_hwparams(substream, &hwparams);
eb0699c4cd6e32d Cezary Rojewski   2022-10-27  1578  	}
d070002a20fc071 Cezary Rojewski   2022-05-16  1579  
5d2d1a48a2f7734 Kuninori Morimoto 2023-09-11  1580  	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
d070002a20fc071 Cezary Rojewski   2022-05-16  1581  	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
d070002a20fc071 Cezary Rojewski   2022-05-16  1582  					     HDAC_EXT_STREAM_TYPE_LINK);
d070002a20fc071 Cezary Rojewski   2022-05-16  1583  	if (!link_stream)
d070002a20fc071 Cezary Rojewski   2022-05-16  1584  		return -EBUSY;
d070002a20fc071 Cezary Rojewski   2022-05-16  1585  
d070002a20fc071 Cezary Rojewski   2022-05-16  1586  	substream->runtime->private_data = link_stream;
d070002a20fc071 Cezary Rojewski   2022-05-16  1587  	return 0;
d070002a20fc071 Cezary Rojewski   2022-05-16  1588  }
d070002a20fc071 Cezary Rojewski   2022-05-16  1589  

:::::: The code at line 1565 was first introduced by commit
:::::: f38d4c72cb2d68e73d3e54feb68febd6b7c4bfd2 ASoC: Intel: avs: Initialize private data for subsequent HDA FEs

:::::: TO: Cezary Rojewski <cezary.rojewski@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
