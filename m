Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279C51F76A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 17:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734455113; cv=none; b=oRCuFfjVhfkYbKitJarOQ0sxdbYWijW5OG/gGSPfvH72gYi0khN/7uzfPkAS1qJtUavgls7BvK5gXh3eQLKtJfjGPzheU9PAXBjIaTgIipcte9iK2p2JyP2OkQA9UCejhKoZiaKcTPbWPcfKHWR3xUjkPmlK0MT+MBTJP3EZig4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734455113; c=relaxed/simple;
	bh=AKjheriHyM+VfP9U8DsYHNUnlBV0ZNaPsMIcQaumHnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sL3bPn1i3LrGLIHLZ4sNIhUOb6LUnmQmn4Rhc8O8JwkfLzoMhsbbC0B8KGsOEjkf53XDIu/0ll7ZXaTdDfO4yQ5HvFaKzSK+Ax9Rt10bRSZJA7+bHLwFyUlIIroItq9zaVPjfQT5YhZfAKTMyTVltl16SxT7CcNpZf37Vyt9EuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iN0xdPpK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iN0xdPpK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734455112; x=1765991112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AKjheriHyM+VfP9U8DsYHNUnlBV0ZNaPsMIcQaumHnM=;
  b=iN0xdPpKHZXcw89Us9mTzTghQBHg5/yzK8I7hFe0W5FjHW+8csPl5C0a
   9hBose2e4GTyOZ4xy5YOJ8Gw5HhcxUeQrzbHpsLAnDCQ1JQQzB3HP5E8D
   Ov86KaVrE0vNGUujnenLyE1bQ6rN4w8U1tSjPEZmMkXBMm196s0qeUWy8
   zNIcAh9ruJ3z7CMjZgntnxlTMDNa5QDEN9MZkNqRCyzJyzi9DUV4p2XI8
   LSCqaJ/M+vzGuAsRCEZq/OaRJPd5S641GFn4Ca3XT/0O0GumUFml05b1z
   RnYNLkOGB1ckoGi2I2tBMiTzsKdKWdGOehWA6ItNfRt01HOuxsF2GAO0K
   A==;
X-CSE-ConnectionGUID: pKI20K2zSEGLQ9+5uLN58g==
X-CSE-MsgGUID: Nug82KcqT5+thR16DX19mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="52302287"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="52302287"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 09:05:12 -0800
X-CSE-ConnectionGUID: 2tZvdkWUQdOKTnpKKrcAjQ==
X-CSE-MsgGUID: /RtSwP1LSbeVhlV3KkAGXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102183616"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2024 09:05:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNb0N-000FA4-2G;
	Tue, 17 Dec 2024 17:05:07 +0000
Date: Wed, 18 Dec 2024 01:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:filextZUx2 4/39] sound/soc/fsl/fsl_asrc_m2m.c:360:45:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202412180043.PAA4t4sQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filextZUx2
head:   644115e86023fccdaecb1318133ed14418b76f49
commit: 24a01710f6271ec32b629d714e6a64a69665128b [4/39] ASoC: fsl_asrc_m2m: Add memory to memory function
config: powerpc-randconfig-r123-20241217 (https://download.01.org/0day-ci/archive/20241218/202412180043.PAA4t4sQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce: (https://download.01.org/0day-ci/archive/20241218/202412180043.PAA4t4sQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412180043.PAA4t4sQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/fsl/fsl_asrc_m2m.c:360:45: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] pcm_format @@     got unsigned int [usertype] format @@
   sound/soc/fsl/fsl_asrc_m2m.c:360:45: sparse:     expected restricted snd_pcm_format_t [usertype] pcm_format
   sound/soc/fsl/fsl_asrc_m2m.c:360:45: sparse:     got unsigned int [usertype] format
>> sound/soc/fsl/fsl_asrc_m2m.c:361:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted snd_pcm_format_t @@     got unsigned int [usertype] format @@
   sound/soc/fsl/fsl_asrc_m2m.c:361:41: sparse:     expected restricted snd_pcm_format_t
   sound/soc/fsl/fsl_asrc_m2m.c:361:41: sparse:     got unsigned int [usertype] format
>> sound/soc/fsl/fsl_asrc_m2m.c:365:45: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] pcm_format @@     got unsigned int [usertype] pcm_format @@
   sound/soc/fsl/fsl_asrc_m2m.c:365:45: sparse:     expected restricted snd_pcm_format_t [usertype] pcm_format
   sound/soc/fsl/fsl_asrc_m2m.c:365:45: sparse:     got unsigned int [usertype] pcm_format
>> sound/soc/fsl/fsl_asrc_m2m.c:366:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted snd_pcm_format_t @@     got unsigned int [usertype] pcm_format @@
   sound/soc/fsl/fsl_asrc_m2m.c:366:42: sparse:     expected restricted snd_pcm_format_t
   sound/soc/fsl/fsl_asrc_m2m.c:366:42: sparse:     got unsigned int [usertype] pcm_format
>> sound/soc/fsl/fsl_asrc_m2m.c:595:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] formats @@     got restricted snd_pcm_format_t [assigned] [usertype] k @@
   sound/soc/fsl/fsl_asrc_m2m.c:595:54: sparse:     expected unsigned int [usertype] formats
   sound/soc/fsl/fsl_asrc_m2m.c:595:54: sparse:     got restricted snd_pcm_format_t [assigned] [usertype] k

vim +360 sound/soc/fsl/fsl_asrc_m2m.c

   346	
   347	static int fsl_asrc_m2m_comp_set_params(struct snd_compr_stream *stream,
   348						struct snd_compr_params *params)
   349	{
   350		struct fsl_asrc *asrc = stream->private_data;
   351		struct snd_compr_runtime *runtime = stream->runtime;
   352		struct fsl_asrc_pair *pair = runtime->private_data;
   353		struct fsl_asrc_m2m_cap cap;
   354		int ret, i;
   355	
   356		ret = asrc->m2m_get_cap(&cap);
   357		if (ret)
   358			return -EINVAL;
   359	
 > 360		if (pcm_format_to_bits(params->codec.format) & cap.fmt_in)
 > 361			pair->sample_format[IN] = params->codec.format;
   362		else
   363			return -EINVAL;
   364	
 > 365		if (pcm_format_to_bits(params->codec.pcm_format) & cap.fmt_out)
 > 366			pair->sample_format[OUT] = params->codec.pcm_format;
   367		else
   368			return -EINVAL;
   369	
   370		/* check input rate is in scope */
   371		for (i = 0; i < cap.rate_in_count; i++)
   372			if (params->codec.sample_rate == cap.rate_in[i]) {
   373				pair->rate[IN] = params->codec.sample_rate;
   374				break;
   375			}
   376		if (i == cap.rate_in_count)
   377			return -EINVAL;
   378	
   379		/* check output rate is in scope */
   380		for (i = 0; i < cap.rate_out_count; i++)
   381			if (params->codec.options.src_d.out_sample_rate == cap.rate_out[i]) {
   382				pair->rate[OUT] = params->codec.options.src_d.out_sample_rate;
   383				break;
   384			}
   385		if (i == cap.rate_out_count)
   386			return -EINVAL;
   387	
   388		if (params->codec.ch_in != params->codec.ch_out ||
   389		    params->codec.ch_in < cap.chan_min ||
   390		    params->codec.ch_in > cap.chan_max)
   391			return -EINVAL;
   392	
   393		pair->channels = params->codec.ch_in;
   394		pair->buf_len[IN] = params->buffer.fragment_size;
   395		pair->buf_len[OUT] = params->buffer.fragment_size;
   396	
   397		return 0;
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
