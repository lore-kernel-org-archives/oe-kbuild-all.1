Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D5322F763
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748959278; cv=none; b=VmwYf0o5Winik6SaYddQPGEl4rvKh/53PHlbPhN3crFhJuojuAgrpBLP0DOOrlc7QC0o6w4ImSlK3P13LqmC7ufkoe8ABlg+zPLlF/0hqKgzt3Z90GIyY3a8MIvJ6RtJTiu0WkQd9WpS/sQSMKtKf6koQRU49tJXqOWZlWxnISA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748959278; c=relaxed/simple;
	bh=3q0Obe4Cn9KiuhkbJK81hf7Mt1MlSJlm7+3onifiVyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioOuKhCVv3CSdTjAy+lukR2GMcbvgBt+VXZzbhx0pImIRZ0uj58ZrvoFbhggLoymfVRYC0Wf4Ohh/0KT5WtIATSOA7AaVSaHKuSNkEidZexgDwph354YBYIvn16ZNlSH17CcYL7YNBmN8UOU/5fZJwmDpqFquLJOHdgFlZVXoP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hX/ulD3n; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hX/ulD3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748959276; x=1780495276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3q0Obe4Cn9KiuhkbJK81hf7Mt1MlSJlm7+3onifiVyc=;
  b=hX/ulD3nsKTvvtGTE4P6egq7KjsvK8RlTdtGxdW2VCoOJU4Ws8y8cfSY
   ACeeF8rdziLBHWq37XhaT7LPAl8jEOGmHX7/dEso0jKZHqxMY5ble39Gk
   nAldIjf5JN+EjV4ePCGQWFGOzRlRuexUvEoXKoFh+U3MoX8liV3Tz6GDh
   Xq6lTUsEHo0S7UhAotLI7iVOHd3L5QEWzm3oIB5tumAnaF6F8HhA9lPJG
   APxXZX1+y5Q8mERJsvwPB55qGu3/AVIAvhdQCBp0q+gnuJuHJjN7Q+ado
   HLDVITfgdffpxeS0hId9Nf067hX8s4kTJclw0Jm1S6wM/V6ARXfi7tW9P
   Q==;
X-CSE-ConnectionGUID: 31xtua7ASe6FBdoPIaU8YA==
X-CSE-MsgGUID: LevpayHfTVGeIH0GSPaE/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50917613"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="50917613"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 07:01:15 -0700
X-CSE-ConnectionGUID: 7a90o6iiTQC8JluBJZh12A==
X-CSE-MsgGUID: JX6gQmiOR4GZElohKVUDVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="144898424"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jun 2025 07:01:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMSCS-0002Uz-2q;
	Tue, 03 Jun 2025 14:01:08 +0000
Date: Tue, 3 Jun 2025 22:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Ana-Maria Cusco <ana-maria.cusco@analog.com>, jic23@kernel.org,
	lars@metafoo.de, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl, marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v4 02/11] iio: adc: Add basic support for AD4170
Message-ID: <202506032131.wuzW0a3k-lkp@intel.com>
References: <e79f9a126672b33b8a7c01f650fee43a68c74029.1748829860.git.marcelo.schmitt@analog.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e79f9a126672b33b8a7c01f650fee43a68c74029.1748829860.git.marcelo.schmitt@analog.com>

Hi Marcelo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c06335516e8c14f501a479a4d9de0e6c09c52ef2]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/dt-bindings-iio-adc-Add-AD4170/20250603-105744
base:   c06335516e8c14f501a479a4d9de0e6c09c52ef2
patch link:    https://lore.kernel.org/r/e79f9a126672b33b8a7c01f650fee43a68c74029.1748829860.git.marcelo.schmitt%40analog.com
patch subject: [PATCH v4 02/11] iio: adc: Add basic support for AD4170
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250603/202506032131.wuzW0a3k-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506032131.wuzW0a3k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506032131.wuzW0a3k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/adc/ad4170.c: In function 'ad4170_parse_reference':
>> drivers/iio/adc/ad4170.c:1130:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1130 |         int ret;
         |             ^~~


vim +/ret +1130 drivers/iio/adc/ad4170.c

  1124	
  1125	static int ad4170_parse_reference(struct ad4170_state *st,
  1126					  struct fwnode_handle *child,
  1127					  struct ad4170_setup *setup)
  1128	{
  1129		struct device *dev = &st->spi->dev;
> 1130		int ret;
  1131		u32 aux;
  1132	
  1133		/* Optional positive reference buffering */
  1134		aux = AD4170_REF_BUF_FULL; /* Default to full precharge buffer enabled. */
  1135		fwnode_property_read_u32(child, "adi,positive-reference-buffer", &aux);
  1136		if (aux < AD4170_REF_BUF_PRE || aux > AD4170_REF_BUF_BYPASS)
  1137			return dev_err_probe(dev, -EINVAL,
  1138					     "Invalid adi,positive-reference-buffer: %u\n",
  1139					     aux);
  1140	
  1141		setup->afe |= FIELD_PREP(AD4170_AFE_REF_BUF_P_MSK, aux);
  1142	
  1143		/* Optional negative reference buffering */
  1144		aux = AD4170_REF_BUF_FULL; /* Default to full precharge buffer enabled. */
  1145		fwnode_property_read_u32(child, "adi,negative-reference-buffer", &aux);
  1146		if (aux < AD4170_REF_BUF_PRE || aux > AD4170_REF_BUF_BYPASS)
  1147			return dev_err_probe(dev, -EINVAL,
  1148					     "Invalid adi,negative-reference-buffer: %u\n",
  1149					     aux);
  1150	
  1151		setup->afe |= FIELD_PREP(AD4170_AFE_REF_BUF_M_MSK, aux);
  1152	
  1153		/* Optional voltage reference selection */
  1154		aux = AD4170_REF_REFOUT; /* Default reference selection. */
  1155		ret = fwnode_property_read_u32(child, "adi,reference-select", &aux);
  1156		if (aux > AD4170_REF_AVDD)
  1157			return dev_err_probe(dev, -EINVAL,
  1158					     "Invalid reference selected %u\n",
  1159					     aux);
  1160	
  1161		setup->afe |= FIELD_PREP(AD4170_AFE_REF_SELECT_MSK, aux);
  1162	
  1163		return 0;
  1164	}
  1165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
