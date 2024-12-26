Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C333138F80
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735230892; cv=none; b=E559F/fb9K00hVVSnAapFxNQbS7XF8+FeAKkyF3KQs5+ekAJ0FTO+AGM9FNUI/aadzXpzkuns/DFz5Or6WzaZNKxPRFQ7STA/40y23/+beHJRrn4emFvYYRqoYIMpEfKJvYo+z+ziQxYAcT21xXVk4tDqC227+TzOELZAeX84ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735230892; c=relaxed/simple;
	bh=u0PnS9EJj+HyREgBfPmisEJAfatWWNwnCdZRkfhrrQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aPwrJlq30DbtJBOTDHNxTWm1YBznWdZem8ilGTyx42StIPyGkHAC2jVNRHANif/CJub5NrsCOGJy2/bxoqjRsH+keBdErDP7k4AlRTnm4V7MwVSfMZZhAWnBQ6H0grsdEepVNS//1dLsYgosxUonhGAmQYL962FnRqilcjmqoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bU9oXorU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bU9oXorU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735230891; x=1766766891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0PnS9EJj+HyREgBfPmisEJAfatWWNwnCdZRkfhrrQI=;
  b=bU9oXorUfJHEsArpZkJv89B8V+tpxIcobVmcfCBWSezT1iMWraOaGliy
   vYrkc8dPk4KNO56t633RiKTLkzY+s/mUUTnQo9JdQDD7qarpp8hjxlvaM
   RbVwGspeiZ3SX5b2VN/VCGcHKG0gHPIX6loLlPT+GNctX/eIqeaJfLL2t
   MFQFKSarccbEx2R2WhfcjUrACvX7GU23MXjIIJ8eviFuttUzQvR2Afc01
   KjYUYalz5Du4N6osWW9pISrqjLdhuS056bH5VRijztfzqO8frUEwECjlS
   5dx5T10+BP3htMTsLUlbTrzz1JgR24/2XqDXJrAgs3H0F3qsVPOM3ZRf0
   w==;
X-CSE-ConnectionGUID: Pqz1s79kRpSEK5SkrfyBmw==
X-CSE-MsgGUID: y9X3ljivRe6LndakMT9iNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35814238"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="35814238"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 08:34:50 -0800
X-CSE-ConnectionGUID: 76cBZe4NQ6mXayiQNmCx+w==
X-CSE-MsgGUID: xCwWLZbxTNizCgL1yT7aaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104961536"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Dec 2024 08:34:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQqow-0002hK-2T;
	Thu, 26 Dec 2024 16:34:46 +0000
Date: Fri, 27 Dec 2024 00:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:asoc-6.14 3/47] sound/soc/fsl/fsl_easrc.c:1999:2-8:
 WARNING: do_div() does a 64-by-32 division, please consider using div64_u64
 instead.
Message-ID: <202412270022.H4knKz3S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-6.14
head:   69dcf023f1f13ca9c2e9e8f30b9ec52ac0486c0a
commit: 27147695aaf7ccb0edc3f21454b5405c9037b4ba [3/47] ASoC: fsl_easrc: define functions for memory to memory usage
config: csky-randconfig-r051-20241226 (https://download.01.org/0day-ci/archive/20241227/202412270022.H4knKz3S-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412270022.H4knKz3S-lkp@intel.com/

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
