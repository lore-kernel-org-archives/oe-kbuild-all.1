Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5268618A6A5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 05:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761369613; cv=none; b=qCnVWaOMAqEV78LUGKwnkYHTwIHThYJgBoaMH9SGas4p7kmpxIX/yFwFlcBSGUaBeiol0jSZ69JnOrYSYOzj1MkJvq4vIFS1xsKOa4HtJ91irJNShwnb8yybeByiF19/I1FrbFmRqN2cGidZYy+iNeqFrXs7pv6Yd8jMMUUMSt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761369613; c=relaxed/simple;
	bh=wXBeRtunKaeLURKCjov6BT91H21rvh4OIrfJZul3jqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzI4yjkr4BZ/KrAJn1bwRLuViJTzgd7UkstAHCdpH7M04oYeQdmiIENL8CR3JbSgL0hy668owjCblOX6rcDrWvzeC4gfCPHuPqoQa3GWMGk5oITNfSrIRH4UcvtysNt4/Ee8flaDm928eISmeEaXuC7HEm0CzVD3FCE1NxBD7FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJftMdzt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJftMdzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761369611; x=1792905611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wXBeRtunKaeLURKCjov6BT91H21rvh4OIrfJZul3jqY=;
  b=QJftMdztOA3Z6h8robavMFWZNkg9oahe5+cr36XHN3mFRhJ+c/rXdzE8
   QQGuna+QrBe7aeK6in6p1iNPO37LbqCEUoVHIqqJ1vgdpck5va7UZUuf8
   jrChlyQau6zUZs9KTgJhqGm4oy3a462nj94KK0S5cdvpIjPhU7ZgmVE8n
   yH6kQIoAkqL3z9lXy6VvIlyixAxfIRsK0ryBE2mKzpL2mP9Hmkr4hKamK
   ao/RFJQcrApAuWZs6TKgM/JX8+f91WA9Krph0SBt9yiHtUgJ2mtEFFDrR
   elYgRbtaX/GuaSoCnQQeXZHkdgVmejQOFnXGSrge0vAhJi4UquuzFRnjY
   Q==;
X-CSE-ConnectionGUID: B7DKnX2DQziPvJ7WMlEPmw==
X-CSE-MsgGUID: S7vPc8DqS4qg/KtO33uZHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63449056"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63449056"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 22:20:11 -0700
X-CSE-ConnectionGUID: S0+DIv6QS6qjib57HO0Zfw==
X-CSE-MsgGUID: 85yyjXXARCWKDYojhngPCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="189827043"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Oct 2025 22:20:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCWhD-000F7l-14;
	Sat, 25 Oct 2025 05:20:07 +0000
Date: Sat, 25 Oct 2025 13:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:20251023_cezary_rojewski_asoc_intel_avs_set_of_streaming_fixes
 10/10] sound/soc/intel/avs/probes.c:147:58: sparse: sparse: incorrect type
 in argument 1 (different base types)
Message-ID: <202510251351.8kXbP4wg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20251023_cezary_rojewski_asoc_intel_avs_set_of_streaming_fixes
head:   64007ad3e2a0e0a0ded8b2c6a72c0bb7883d3a33
commit: 64007ad3e2a0e0a0ded8b2c6a72c0bb7883d3a33 [10/10] ASoC: Intel: avs: Use snd_codec format when initializing probe
config: x86_64-randconfig-122-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251351.8kXbP4wg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251351.8kXbP4wg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251351.8kXbP4wg-lkp@intel.com/

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
