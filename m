Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE69636D4FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766074459; cv=none; b=dKNLwlTXwcscumgoZByJw1Y4MFuRJp+uE5y4GmWnCJjQ9bbhyBBgAWlKboTr37ZtIm9OVSkYOh2B20rfTNmqr0es4r64PnjhYjYAcPIdnQSYNKhrCLt3JHLPVqX8NrZi2+fD4xOmSM5i28fqAgdrgyIuurWw8m1fVsMISDagEJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766074459; c=relaxed/simple;
	bh=Boc0IZTUK4mRcYttTgEhESrhkyTmTX2AlLVLSK+Y2Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nyn85Dgv8HkIf82jVZBKu2H6oest1G7q1uH71nq2Ch6CMB3AP59z63ZbRypLxUkLlPlWP5AAYlo+kC4h2t/TG+Q1+U7WED+NzSd5iWW0eAktpg3LXinPBquuhRaDefttNcRRHt8DOlnKetFQbwHll7Ad3KLNSNVw/kxqkengTeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czS9PLaq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czS9PLaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766074457; x=1797610457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Boc0IZTUK4mRcYttTgEhESrhkyTmTX2AlLVLSK+Y2Rw=;
  b=czS9PLaqHFSXFSAB+B4W4AE96/hFtOLpHi7WLXkqlr39akqQUwFPI2NG
   mvSD6Wafs2CvVLBgfgj96j5fShvCvSflGYwSkxmmTT6cqkcxwGY6FrCJY
   qS1pKv9rPfMaU8epIXdgKYBPZ+4jEU0PAp+iKE1inWxAAFY8dHz+GJucY
   +HwxjnC7LTOWwTMbPXGSrynNGJuYSFNubuRVEZrxigJKmgV+HS8+qOxIE
   NJVbKuOBunNVlIigv116h8wogM+MItffIHXL+Vt5ZmfV8Vq5/MTlm2DX+
   Q8w97JneMTT50AssGQuqpSBPgSpnQ1qMZzOSNudT0JZalB1KMOMHJMlVq
   Q==;
X-CSE-ConnectionGUID: S3OoZlimSWqLV2nvCL02Mw==
X-CSE-MsgGUID: MQXzyog4T5q5t5CIC7U6cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78347260"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="78347260"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 08:14:15 -0800
X-CSE-ConnectionGUID: W24Je3W/SGGvEAMEl8OleA==
X-CSE-MsgGUID: 18zchsePRbuYY4teOiusjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="203132539"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Dec 2025 08:14:14 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWGdn-000000002IN-339U;
	Thu, 18 Dec 2025 16:14:11 +0000
Date: Fri, 19 Dec 2025 00:13:10 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: sound/soc/intel/avs/probes.c:147:58: sparse: sparse: incorrect type
 in argument 1 (different base types)
Message-ID: <202512190032.hnwn9mCV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 64007ad3e2a0e0a0ded8b2c6a72c0bb7883d3a33 ASoC: Intel: avs: Use snd_codec format when initializing probe
date:   8 weeks ago
config: arc-randconfig-r122-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190032.hnwn9mCV-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190032.hnwn9mCV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190032.hnwn9mCV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/intel/avs/probes.c:147:58: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got unsigned int [usertype] format @@
   sound/soc/intel/avs/probes.c:147:58: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/soc/intel/avs/probes.c:147:58: sparse:     got unsigned int [usertype] format

vim +147 sound/soc/intel/avs/probes.c

   128	
   129	static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
   130					      struct snd_compr_params *params, struct snd_soc_dai *dai)
   131	{
   132		struct hdac_ext_stream *host_stream = avs_compr_get_host_stream(cstream);
   133		struct snd_compr_runtime *rtd = cstream->runtime;
   134		struct avs_dev *adev = to_avs_dev(dai->dev);
   135		unsigned int format_val;
   136		int bps, ret;
   137	
   138		hdac_stream(host_stream)->bufsize = 0;
   139		hdac_stream(host_stream)->period_bytes = 0;
   140		hdac_stream(host_stream)->format_val = 0;
   141		cstream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_SG;
   142		cstream->dma_buffer.dev.dev = adev->dev;
   143	
   144		ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
   145		if (ret < 0)
   146			return ret;
 > 147		bps = snd_pcm_format_physical_width(params->codec.format);
   148		if (bps < 0)
   149			return bps;
   150		format_val = snd_hdac_stream_format(params->codec.ch_out, bps, params->codec.sample_rate);
   151		ret = snd_hdac_stream_set_params(hdac_stream(host_stream), format_val);
   152		if (ret < 0)
   153			return ret;
   154		ret = snd_hdac_stream_setup(hdac_stream(host_stream), false);
   155		if (ret < 0)
   156			return ret;
   157	
   158		hdac_stream(host_stream)->prepared = 1;
   159	
   160		if (!adev->num_probe_streams) {
   161			union avs_connector_node_id node_id;
   162	
   163			/* D0ix not allowed during probing. */
   164			ret = avs_dsp_disable_d0ix(adev);
   165			if (ret)
   166				return ret;
   167	
   168			node_id.vindex = hdac_stream(host_stream)->stream_tag - 1;
   169			node_id.dma_type = AVS_DMA_HDA_HOST_INPUT;
   170	
   171			ret = avs_dsp_init_probe(adev, params, bps, node_id, rtd->dma_bytes);
   172			if (ret < 0) {
   173				dev_err(dai->dev, "probe init failed: %d\n", ret);
   174				avs_dsp_enable_d0ix(adev);
   175				return ret;
   176			}
   177		}
   178	
   179		adev->num_probe_streams++;
   180		return 0;
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
