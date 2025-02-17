Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BE11758B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802950; cv=none; b=NNRams5xiS4TQUuvKTlkWqL4wC8CWjPPUm7hATMso9L9nn/yUUBEEkA6plXpqE4airHRc+3uG9HZLw4309z8di4i5JnFYa9Exs8ksEKuTsMeaG8zDOjeyLAOQYwyNDUp4bMY6UJlT9SFHEtDXY6YdA1aHEx40Wk0GApC/nTrXcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802950; c=relaxed/simple;
	bh=hQGoRgWJptR8bvXJ1UVdmfd1fJVlDS23tv3MglciDLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ala41AG7ZACog5eIza12zd+SkvBq+ZDg8Dycg9a8nPq7g+qJ0vY1L7UNrhPvhy+75MevwmxmQcR6VRlIRN/qO13bgfYBs/t8nQPi8oUmfkgTDDR277YbCt6vISfuyD9ZipBRjFzHssGogJ6ZUMYiWkQv32K5TIWxLsoEFcigcjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKXIznuf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKXIznuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739802948; x=1771338948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hQGoRgWJptR8bvXJ1UVdmfd1fJVlDS23tv3MglciDLQ=;
  b=SKXIznufWVdEHBKRYjQCpADU67qzXD/sZMRIhvi8lhr9s6nyqXHzJhHc
   0N4iw7b8tgqGRkIop4Y2wJjeFG/+CUpKIJKAA3OuttNoNrn0R79vdfeHj
   d0gYRn7XFWE3bkWK8fxU2MnqNS3eZn7iqHBWFt9iRQBUt/BrO79FH/uNq
   Gx3zHmd6TmG1lEfOcP2oDALr8QDkUiGwafWnyLDz6UTm7FI4WYZ9Ebgob
   Dn5lmDzNHoGve0lc1dHIdWzC0Ci20KpTE4aHh7C049/32skIPNrzXWays
   gmZ8DpxbH7p75EvdFpHwbqfbS4vkvPvTy3xEB7YUUxuHLt0sqWSTZ8XPf
   g==;
X-CSE-ConnectionGUID: 0x3/ATc9S6WQsR69Fj4YGA==
X-CSE-MsgGUID: r57w9a0mSxS+vNqY8r3TLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40344618"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="40344618"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 06:35:47 -0800
X-CSE-ConnectionGUID: P1l9EUXSS8SRTzeQ1bd9hw==
X-CSE-MsgGUID: XBcslEdZRvKeZpBytZ5OEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="114064402"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2025 06:35:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk2Do-001DE5-1i;
	Mon, 17 Feb 2025 14:35:44 +0000
Date: Mon, 17 Feb 2025 22:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 11/11]
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:113:5: warning: no previous
 prototype for function 'mt8196_fe_hw_params'
Message-ID: <202502172224.my9XEus2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a31ccc1fb383ea53ab9d8851297112fcda16a524
commit: 506f0a8aad65ce4aecc6f38c63d90268f6fc12a8 [11/11] CHROMIUM: sound: soc/mediatek: fix ap multi dmic recording issue
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250217/202502172224.my9XEus2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502172224.my9XEus2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502172224.my9XEus2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:89:6: warning: no previous prototype for function 'mt8196_fe_shutdown' [-Wmissing-prototypes]
      89 | void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
         |      ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      89 | void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
         | ^
         | static 
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:113:5: warning: no previous prototype for function 'mt8196_fe_hw_params' [-Wmissing-prototypes]
     113 | int mt8196_fe_hw_params(struct snd_pcm_substream *substream,
         |     ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     113 | int mt8196_fe_hw_params(struct snd_pcm_substream *substream,
         | ^
         | static 
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:126:5: warning: no previous prototype for function 'mt8196_fe_trigger' [-Wmissing-prototypes]
     126 | int mt8196_fe_trigger(struct snd_pcm_substream *substream, int cmd,
         |     ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:126:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     126 | int mt8196_fe_trigger(struct snd_pcm_substream *substream, int cmd,
         | ^
         | static 
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:281:5: warning: no previous prototype for function 'mt8196_get_memif_pbuf_size' [-Wmissing-prototypes]
     281 | int mt8196_get_memif_pbuf_size(struct snd_pcm_substream *substream)
         |     ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:281:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     281 | int mt8196_get_memif_pbuf_size(struct snd_pcm_substream *substream)
         | ^
         | static 
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:4831:23: warning: variable 'afe' set but not used [-Wunused-but-set-variable]
    4831 |         struct mtk_base_afe *afe = NULL;
         |                              ^
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:4833:19: warning: variable 'card' set but not used [-Wunused-but-set-variable]
    4833 |         struct snd_card *card = NULL;
         |                          ^
   6 warnings generated.


vim +/mt8196_fe_hw_params +113 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c

   112	
 > 113	int mt8196_fe_hw_params(struct snd_pcm_substream *substream,
   114				 struct snd_pcm_hw_params *params,
   115				 struct snd_soc_dai *dai)
   116	{
   117		struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
   118		unsigned int channels = params_channels(params);
   119		struct mt8196_afe_private *afe_priv = afe->platform_priv;
   120	
   121		afe_priv->cm_channels = channels;
   122	
   123		return mtk_afe_fe_hw_params(substream, params, dai);
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
