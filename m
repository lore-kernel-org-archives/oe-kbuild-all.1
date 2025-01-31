Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D29145B3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 07:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307193; cv=none; b=Nu3qyHwy+jfwH94iITn7HV1COcLevZOWjWYQuI8ln4SwsRD2Vjq+rGmY9qHfJUn3fGeqXSMtqD11az24EOjN+qS42vJ94meIBUPLb8m2Xl4SniAFlPTcAKCxMxp4dz5M4nutiTHcfVO30cqTb+OnVGEC51OK1J7Ow1nnk6vsXok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307193; c=relaxed/simple;
	bh=zOrrtSgX7CZSyiq4mgybdFcv+4KBEcNP5sep2xb2dTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ghRnWHmzcwoRXuhrOpsSbjjrSJ3m5yeL8QV3FIVw9TOq5r1r/AVFyEEu1T7b1m7yPu+sUFnz/C0ujhM6JYd7RvmaF9jNt6Afuq9W7ASYHJYKcr/e+efNJI9HkOtI55OzRuY/YVQiS9GfkKYKMz3xRnT1ASJt1vNNpxu4CxZh4no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUw3jnJz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUw3jnJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738307191; x=1769843191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zOrrtSgX7CZSyiq4mgybdFcv+4KBEcNP5sep2xb2dTE=;
  b=WUw3jnJz/dHab/g3fZYCYxcBrFwve1p1RgOyBU1LkX9P6fhsLERU1G0Z
   uOUE6U38ixTiqLQh+hrj5Ozf8B+hd+GuouFxEpsSfYGmBwsdt2/gk4Jy9
   dxOaoB8rJLQksPJ1g5ICS34z1D/+ATDqqmyTT8frzr2TVH61DtLUQfYNs
   7C+KIxc6YRoz3GJyEApU6VggwrvpwtinlnAQsIcry+CZRfeJ1YqBL8gOt
   NjdKplLMT1WFbEaljA0rMrc4PlnOb9K+L11Nqbn08WvG09eHHooyN2fhL
   vK6B8gZQPK/FDOgev3qjgDQKfgN4m+c2kfazyITRYXJCKVK0s5r+t6C8J
   A==;
X-CSE-ConnectionGUID: 30RbEgDBQOSig87/3Q46Dw==
X-CSE-MsgGUID: MmOmkkmoR0+aNw7mA7Qy/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49863684"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="49863684"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 23:06:30 -0800
X-CSE-ConnectionGUID: toRm1x3RQ/aUNmmXvhHBbQ==
X-CSE-MsgGUID: jnvC9LM6RlmC/uaDqvvFNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="110132404"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jan 2025 23:06:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdl6h-000m7b-08;
	Fri, 31 Jan 2025 07:06:27 +0000
Date: Fri, 31 Jan 2025 15:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-msiof-2025-01-30 2/2]
 sound/soc/renesas/rcar/msiof.c:356:9: sparse: sparse: statement expected
 after case label
Message-ID: <202501311443.YYRcwfUV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-msiof-2025-01-30
head:   d9a82c93cca8d2f5381062d77bbab0736dd6dc5b
commit: d9a82c93cca8d2f5381062d77bbab0736dd6dc5b [2/2] msiof
config: loongarch-randconfig-r122-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311443.YYRcwfUV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250131/202501311443.YYRcwfUV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311443.YYRcwfUV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/renesas/rcar/msiof.c:356:9: sparse: sparse: statement expected after case label

vim +356 sound/soc/renesas/rcar/msiof.c

   332	
   333	static int msiof_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
   334	{
   335		struct msiof_priv *priv = snd_soc_dai_get_drvdata(dai);
   336	
   337		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
   338		case SND_SOC_DAIFMT_BP_FP:
   339			priv->is_provider = 1;
   340			break;
   341		case SND_SOC_DAIFMT_BC_FC:
   342			priv->is_provider = 0;
   343			break;
   344		default:
   345			return -EINVAL;
   346		}
   347	
   348		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
   349		case SND_SOC_DAIFMT_NB_IF:
   350		case SND_SOC_DAIFMT_IB_NF:
   351		case SND_SOC_DAIFMT_IB_IF:
   352			return -EINVAL;
   353		/* it supports NB_NF only */
   354		case SND_SOC_DAIFMT_NB_NF:
   355		default:
 > 356		}
   357	
   358		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
   359		case SND_SOC_DAIFMT_I2S:
   360			priv->need_delay = 1;
   361			break;
   362		case SND_SOC_DAIFMT_LEFT_J:
   363			priv->need_delay = 0;
   364			break;
   365		default:
   366			return -EINVAL;
   367		}
   368	
   369		return 0;
   370	}
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
