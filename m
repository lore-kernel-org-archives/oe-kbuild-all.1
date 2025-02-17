Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3702E221560
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802951; cv=none; b=PYxnEMAurnAu/g4rEdNQZiAI7kJLgLZ7iN4gldiVbV79ODkSgf/vT9aDlsWKGbbw4lYJzJtQuKDJFi/aMe6KzoY13XgCG0iNanz///gCpnOdLf0fLbqFGeOSyH6pbwlsRaBA2cXv5z9TOAeStfRbrYVRNn4NO3Xcr5c7MzmJVIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802951; c=relaxed/simple;
	bh=uxe2KNXeul7G2WcI0IR1gyzHk/UTGFsriilNdSQeCWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OuyIOjGkRI3GQ/yuWIGHjPfo25SzmR3ZPrO7yhlAbsBwcpSUySeC2FiGzFTjrnEJt7i94HS1YgQOGpVJ968a+TqyTS0QkWg3q5YpLxhvA6l1oF3A6HMz3zixOB8lZqxrg95EMDsoxhOcM6CvRfJ6IqJOY/s+UVQI1Wu2k0pMI3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwd2q6YF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwd2q6YF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739802950; x=1771338950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uxe2KNXeul7G2WcI0IR1gyzHk/UTGFsriilNdSQeCWs=;
  b=iwd2q6YFmytpcn0EMvPwALsDENx1F+8Z0aMpE9hn9IFCClb/3iYenFWT
   oy8na2IoLzRLSBbkkzFRKhsOr/92NADR7z53O45JcZsLKeG8qJE6basMS
   U37rudDewsmE90/AhI4pacgQYakBsAEI//AXvNVe9GE8q/41NaQBK9iHK
   Gk8duZCGquSWXdMxgGZv2i9d3EzL3haM8u0M78x7VUgRDkEQ3CJI8pK3y
   q9uCy+s0WSCJMKrWVhxKk2gfTWrQkqZ3ywF6YxFG/7QjaXwvtcF6I6G/O
   YNzbXgNE81mpeuOlYCCNCNICtcvylQiLmEYJKWQv841jfmK23sUIS4FSp
   g==;
X-CSE-ConnectionGUID: hjXVhtmnSVSwG2vGCOMDZg==
X-CSE-MsgGUID: uVxsXvAHRwusPj3RgecVrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40344621"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="40344621"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 06:35:48 -0800
X-CSE-ConnectionGUID: qhqkxWJHQlC30E41I3ilEw==
X-CSE-MsgGUID: jDllq0IGQhCTtGx6M/OJFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="114064403"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2025 06:35:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk2Do-001DE3-1e;
	Mon, 17 Feb 2025 14:35:44 +0000
Date: Mon, 17 Feb 2025 22:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 11/11]
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:113:5: warning: no previous
 prototype for 'mt8196_fe_hw_params'
Message-ID: <202502172206.JUK7oZeK-lkp@intel.com>
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
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250217/202502172206.JUK7oZeK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502172206.JUK7oZeK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502172206.JUK7oZeK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: drivers/misc/mediatek/audio_ipi/include: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: sound/soc/mediatek/audio_dsp: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/adsp/include: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/base/power/include: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/include/mt-plat//include: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/pbm: No such file or directory [-Wmissing-include-dirs]
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:89:6: warning: no previous prototype for 'mt8196_fe_shutdown' [-Wmissing-prototypes]
      89 | void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
         |      ^~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:113:5: warning: no previous prototype for 'mt8196_fe_hw_params' [-Wmissing-prototypes]
     113 | int mt8196_fe_hw_params(struct snd_pcm_substream *substream,
         |     ^~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:126:5: warning: no previous prototype for 'mt8196_fe_trigger' [-Wmissing-prototypes]
     126 | int mt8196_fe_trigger(struct snd_pcm_substream *substream, int cmd,
         |     ^~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:281:5: warning: no previous prototype for 'mt8196_get_memif_pbuf_size' [-Wmissing-prototypes]
     281 | int mt8196_get_memif_pbuf_size(struct snd_pcm_substream *substream)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c: In function 'mt8196_afe_component_probe':
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:4833:26: warning: variable 'card' set but not used [-Wunused-but-set-variable]
    4833 |         struct snd_card *card = NULL;
         |                          ^~~~
   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c:4831:30: warning: variable 'afe' set but not used [-Wunused-but-set-variable]
    4831 |         struct mtk_base_afe *afe = NULL;
         |                              ^~~


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
