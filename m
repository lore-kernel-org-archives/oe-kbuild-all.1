Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8CC2701B8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766924624; cv=none; b=N/qfU5P1My5w5HsmhDz17kH9FGxb3u/8lSUnaR1PiFDP8yG8XtC4hrI08iCvMj3lDeD7fCTfiw5+6ehTh2aMr3IeTXm1mLcqMWV4YMcdPla29AkR/cnjQEbWUhLrA6V5a+1IL/JfifMuvEXMv/RIpq/oh2FNuXaHLpT1s5qzi9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766924624; c=relaxed/simple;
	bh=rvvVxog2vKd34UV5IsAFmjCEgb1P9+wCN1EpDAQVuuk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HrxCkuw7V5C/ry8vVYR3iiyg2KXxATokLpzIcB0uCzu9uXMbqoYWdGldFWuvhkovGv2d3to3rQ3UrRmZP3TEFxkAwHmVlFzlu4uAUqjjVwEtB43Ud023piQM+MKC/8rqqVZLtWXxKHZzLaLA3usGTFM4PrHD02vLTgU2LksgXTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6KA0lqQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6KA0lqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766924623; x=1798460623;
  h=date:from:to:cc:subject:message-id;
  bh=rvvVxog2vKd34UV5IsAFmjCEgb1P9+wCN1EpDAQVuuk=;
  b=X6KA0lqQaxhrppdEz2q8lTmwLGPEJEgnybB2M9mjv1IZRxJuak6v7f6R
   HEjQZ10E7r5rXlS9WcKw4EGWjBwoDBg2p0VjS565NHiP2YNjoy2HFDGY/
   mOMUmWaBnbDp5x7oPr4Bb0MQa6Vg9X12GoMmfIhI4vKCdKFhUzAaxTMG4
   mvYTTQJcLL4eW8Tzk02AAkA3FuEZJRgyXT6pgCdySUfTOuxdLpNWB3kmM
   gpLow8fFADXxIoaaXRCZTSQB5piTFYxORyH5SDlr1c4pWPILCuMEP0sWy
   zkYZv8DPhGrx+26uD54fPGSOBD07jX6VY6sRyNFUzESPf7PfeDs7Z2W7E
   Q==;
X-CSE-ConnectionGUID: IyfoXksMTBCTh5DgohHprQ==
X-CSE-MsgGUID: wFaMIWMFRsaQ1gDqSVJaGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="68645238"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="68645238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 04:23:42 -0800
X-CSE-ConnectionGUID: HMmZfHfRRG28jipFyVx05Q==
X-CSE-MsgGUID: 6uboSW2GQpGCy723PvW9Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="238131031"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Dec 2025 04:23:41 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZpoA-000000006SX-0UMo;
	Sun, 28 Dec 2025 12:23:38 +0000
Date: Sun, 28 Dec 2025 20:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: sound/soc/fsl/fsl_easrc.c:1999:2-8: WARNING: do_div() does a
 64-by-32 division, please consider using div64_u64 instead.
Message-ID: <202512281902.bPsKjjkC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d26143bb38e2546fe6f8c9860c13a88146ce5dd6
commit: 27147695aaf7ccb0edc3f21454b5405c9037b4ba ASoC: fsl_easrc: define functions for memory to memory usage
date:   1 year ago
config: xtensa-randconfig-r052-20251228 (https://download.01.org/0day-ci/archive/20251228/202512281902.bPsKjjkC-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512281902.bPsKjjkC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/fsl/fsl_easrc.c:1999:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

vim +1999 sound/soc/fsl/fsl_easrc.c

  1949	
  1950	/* calculate capture data length according to output data length and sample rate */
  1951	static int fsl_easrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
  1952	{
  1953		struct fsl_asrc *easrc = pair->asrc;
  1954		struct fsl_easrc_priv *easrc_priv = easrc->private;
  1955		struct fsl_easrc_ctx_priv *ctx_priv = pair->private;
  1956		unsigned int in_rate = ctx_priv->in_params.norm_rate;
  1957		unsigned int out_rate = ctx_priv->out_params.norm_rate;
  1958		unsigned int channels = pair->channels;
  1959		unsigned int in_samples, out_samples;
  1960		unsigned int in_width, out_width;
  1961		unsigned int out_length;
  1962		unsigned int frac_bits;
  1963		u64 val1, val2;
  1964	
  1965		switch (easrc_priv->rs_num_taps) {
  1966		case EASRC_RS_32_TAPS:
  1967			/* integer bits = 5; */
  1968			frac_bits = 39;
  1969			break;
  1970		case EASRC_RS_64_TAPS:
  1971			/* integer bits = 6; */
  1972			frac_bits = 38;
  1973			break;
  1974		case EASRC_RS_128_TAPS:
  1975			/* integer bits = 7; */
  1976			frac_bits = 37;
  1977			break;
  1978		default:
  1979			return -EINVAL;
  1980		}
  1981	
  1982		val1 = (u64)in_rate << frac_bits;
  1983		do_div(val1, out_rate);
  1984		val1 += (s64)ctx_priv->ratio_mod << (frac_bits - 31);
  1985	
  1986		in_width = snd_pcm_format_physical_width(ctx_priv->in_params.sample_format) / 8;
  1987		out_width = snd_pcm_format_physical_width(ctx_priv->out_params.sample_format) / 8;
  1988	
  1989		ctx_priv->in_filled_len += input_buffer_length;
  1990		if (ctx_priv->in_filled_len <= ctx_priv->in_filled_sample * in_width * channels) {
  1991			out_length = 0;
  1992		} else {
  1993			in_samples = ctx_priv->in_filled_len / (in_width * channels) -
  1994				     ctx_priv->in_filled_sample;
  1995	
  1996			/* right shift 12 bit to make ratio in 32bit space */
  1997			val2 = (u64)in_samples << (frac_bits - 12);
  1998			val1 = val1 >> 12;
> 1999			do_div(val2, val1);
  2000			out_samples = val2;
  2001	
  2002			out_length = out_samples * out_width * channels;
  2003			ctx_priv->in_filled_len = ctx_priv->in_filled_sample * in_width * channels;
  2004		}
  2005	
  2006		return out_length;
  2007	}
  2008	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
