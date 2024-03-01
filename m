Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28363C134
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 00:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709254031; cv=none; b=Cz6yOYEmF6p2FZM4eNOuhkzJRTPCPL6iqMbmxYrQz87iMIsELqg01vRzkw8xpJHlYINjcGxOU7GoifKohWtnIgDkHpf4yOWt/jPJGFSza6/Y/Z5h5ZyFIpmPxe4RXAR9fx0VRUO/MHf9mH4SD/qvo1PHhE7/No4fjf4BHmY8za8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709254031; c=relaxed/simple;
	bh=hrQXTNmtSrxG0gYA54ZH9J4uNOUrwSk9kcJtkmWF9UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eOFKzvdJKoYtcJhOiFqnos2alOypHm+UD25Pw+kvTsCCT3Sb7v1KDbnd6NAztZMcR0/7zIuxkXluD6ZMtJs2Heb+iKjJTDKfmWe1A/fc4m0vpdRQza6CesutwV7POLAwPVV3TZP19xZG96gsbxCJ/lVn1sslk5G88cmsi7LtBXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBjG8hC7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBjG8hC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709254030; x=1740790030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hrQXTNmtSrxG0gYA54ZH9J4uNOUrwSk9kcJtkmWF9UE=;
  b=bBjG8hC7qNnqJPukUTko3cDuOuDCDxsvN1Lota9yGv0yCGvoVr2mCbhC
   TgpxzHPLPGLrqooFZYOav/zqJdLfqaMBYZu86OmuDMsLco8OjL6y0Crw+
   tpZ+VrLXGQ33qrdgaQ0m91MZ4gmVPPmstpStlDWkg3OMyXL6C9KJ4x4q/
   BbIgPWOhhiH50KrUHK7HH3cm11wyb+wPqg8WM9DkrnBbVsTieqrGHvEKh
   I5trIX92ejZisCwWvZR/X86+M0zBwhekaLbaieI/iS0ZyUP4VKBa1I0WA
   mqVGtRFrQpQYt8plWnlk0zbYU9MJ3+wdPQc4UikIY9C9YgALQ2a/iDV36
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3624167"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3624167"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 16:47:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12620297"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Feb 2024 16:47:09 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfr2u-000DP9-2p;
	Fri, 01 Mar 2024 00:46:54 +0000
Date: Fri, 1 Mar 2024 08:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:soc-pcm-cleanup-2024-02-27 3/4]
 sound/soc/intel/avs/pcm.c:1565:42: error: 'struct snd_soc_dpcm_runtime' has
 no member named 'users'
Message-ID: <202403010807.rJH3vZBU-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240301/202403010807.rJH3vZBU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010807.rJH3vZBU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010807.rJH3vZBU-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/intel/avs/pcm.c: In function 'avs_component_hda_open':
>> sound/soc/intel/avs/pcm.c:1565:42: error: 'struct snd_soc_dpcm_runtime' has no member named 'users'
    1565 |                         if (be->dpcm[dir].users == 1)
         |                                          ^


vim +1565 sound/soc/intel/avs/pcm.c

d070002a20fc07 Cezary Rojewski   2022-05-16  1542  
d070002a20fc07 Cezary Rojewski   2022-05-16  1543  static int avs_component_hda_open(struct snd_soc_component *component,
d070002a20fc07 Cezary Rojewski   2022-05-16  1544  				  struct snd_pcm_substream *substream)
d070002a20fc07 Cezary Rojewski   2022-05-16  1545  {
5d2d1a48a2f773 Kuninori Morimoto 2023-09-11  1546  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
d070002a20fc07 Cezary Rojewski   2022-05-16  1547  	struct hdac_ext_stream *link_stream;
d070002a20fc07 Cezary Rojewski   2022-05-16  1548  	struct hda_codec *codec;
d070002a20fc07 Cezary Rojewski   2022-05-16  1549  
eb0699c4cd6e32 Cezary Rojewski   2022-10-27  1550  	if (!rtd->dai_link->no_pcm) {
eb0699c4cd6e32 Cezary Rojewski   2022-10-27  1551  		struct snd_pcm_hardware hwparams = avs_pcm_hardware;
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1552  		struct snd_soc_pcm_runtime *be;
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1553  		struct snd_soc_dpcm *dpcm;
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1554  		int dir = substream->stream;
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1555  
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1556  		/*
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1557  		 * Support the DPCM reparenting while still fulfilling expectations of HDAudio
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1558  		 * common code - a valid stream pointer at substream->runtime->private_data -
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1559  		 * by having all FEs point to the same private data.
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1560  		 */
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1561  		for_each_dpcm_be(rtd, dir, dpcm) {
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1562  			struct snd_pcm_substream *be_substream;
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1563  
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1564  			be = dpcm->be;
f38d4c72cb2d68 Cezary Rojewski   2022-11-18 @1565  			if (be->dpcm[dir].users == 1)
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1566  				break;
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1567  
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1568  			be_substream = snd_soc_dpcm_get_substream(be, dir);
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1569  			substream->runtime->private_data = be_substream->runtime->private_data;
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1570  			break;
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1571  		}
eb0699c4cd6e32 Cezary Rojewski   2022-10-27  1572  
eb0699c4cd6e32 Cezary Rojewski   2022-10-27  1573  		/* RESUME unsupported for de-coupled HD-Audio capture. */
f38d4c72cb2d68 Cezary Rojewski   2022-11-18  1574  		if (dir == SNDRV_PCM_STREAM_CAPTURE)
eb0699c4cd6e32 Cezary Rojewski   2022-10-27  1575  			hwparams.info &= ~SNDRV_PCM_INFO_RESUME;
eb0699c4cd6e32 Cezary Rojewski   2022-10-27  1576  
eb0699c4cd6e32 Cezary Rojewski   2022-10-27  1577  		return snd_soc_set_runtime_hwparams(substream, &hwparams);
eb0699c4cd6e32 Cezary Rojewski   2022-10-27  1578  	}
d070002a20fc07 Cezary Rojewski   2022-05-16  1579  
5d2d1a48a2f773 Kuninori Morimoto 2023-09-11  1580  	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
d070002a20fc07 Cezary Rojewski   2022-05-16  1581  	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
d070002a20fc07 Cezary Rojewski   2022-05-16  1582  					     HDAC_EXT_STREAM_TYPE_LINK);
d070002a20fc07 Cezary Rojewski   2022-05-16  1583  	if (!link_stream)
d070002a20fc07 Cezary Rojewski   2022-05-16  1584  		return -EBUSY;
d070002a20fc07 Cezary Rojewski   2022-05-16  1585  
d070002a20fc07 Cezary Rojewski   2022-05-16  1586  	substream->runtime->private_data = link_stream;
d070002a20fc07 Cezary Rojewski   2022-05-16  1587  	return 0;
d070002a20fc07 Cezary Rojewski   2022-05-16  1588  }
d070002a20fc07 Cezary Rojewski   2022-05-16  1589  

:::::: The code at line 1565 was first introduced by commit
:::::: f38d4c72cb2d68e73d3e54feb68febd6b7c4bfd2 ASoC: Intel: avs: Initialize private data for subsequent HDA FEs

:::::: TO: Cezary Rojewski <cezary.rojewski@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
