Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C199110A0D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 04:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707279098; cv=none; b=lTH/NeanGnA5gHru5/qXyylzwe6YMhYFCG2JqdYcYr4WcrlR8HTnbLOXyoSUjq7RXOrGLOYT4asDzg7v6v5QkQHnopMZYfkf3/5wngWNr5GgM15Yj2nG5OTJoKR+6rF0YWxxEpWY7uv/xtD+eXjLPDUR6xalo/ba6+dvQMGUGZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707279098; c=relaxed/simple;
	bh=Oq9J4q9OIa1KVIjLlb5tu1/wTpnpMjnSMam+5tULIE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FqPWQG1R4ulwHX4jAeJjamUcBpsgPf2H6LV2C3llt2OhV0hJDF0UNAwa9tO+iM9INbHY2AeSll6pXo2mDlccz/DApYQ61qKdrDuHwTqo2WDpHII40R+uho5o8e3ZypLErc3/3gxKGQw03nJgfMvi9ehSYGgDkkrsqJa1Vw8zzSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jfn5bsEX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jfn5bsEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707279096; x=1738815096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oq9J4q9OIa1KVIjLlb5tu1/wTpnpMjnSMam+5tULIE8=;
  b=Jfn5bsEX5/6htfdtfQFkw/Yi0VleWWuOfyhuSvUnphL18/S9gmWAYu1K
   oBdN0K++bEyiWKbms7hxSErhTAIOC/3NXDdTdpr65pEDZw6XmmNrHbDju
   /WUu6hXdosEI03ZdHQwRsstou7I+Ql6JgC16Vf6X9L/LXfQ8me5PxBUoV
   cgUbgEC7BUEYjILd6dKVIHe7wcHiZVJwVr8U8UspZ/bJoMI+eR8HDCyQM
   Ur7L1dOhyKfT/HYTei511/qvI/WIU3lgeBbcvKKvrOVEddoBE0czLWenv
   5uPKdbvJOh/px+6jHSM+VrZYgydHzFhBVESxBZauuF3faqetYKeH4qgqu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="23384037"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="23384037"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 20:11:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="5995458"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Feb 2024 20:11:33 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXZHX-00026t-18;
	Wed, 07 Feb 2024 04:11:31 +0000
Date: Wed, 7 Feb 2024 12:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:dev/iio-backend-axi-dds-test 18/18]
 drivers/iio/dac/adi-axi-dac.c:165:21: error: 'axi_dac_read_raw' undeclared
 here (not in a function)
Message-ID: <202402071252.8HLMRVpn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux dev/iio-backend-axi-dds-test
head:   505a3dee9cf534b88bab7331c15ec3f3c17f7fd8
commit: 505a3dee9cf534b88bab7331c15ec3f3c17f7fd8 [18/18] reset me
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240207/202402071252.8HLMRVpn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071252.8HLMRVpn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071252.8HLMRVpn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/iio/dac/ad9739a.c: In function 'ad9739a_init':
>> drivers/iio/dac/ad9739a.c:196:1: warning: control reaches end of non-void function [-Wreturn-type]
     196 | }
         | ^
--
   drivers/iio/dac/adi-axi-dac.c: In function 'ad9739a_read_raw':
   drivers/iio/dac/adi-axi-dac.c:109:31: warning: unused variable 'st' [-Wunused-variable]
     109 |         struct axi_dac_state *st = iio_backend_get_priv(back);
         |                               ^~
   drivers/iio/dac/adi-axi-dac.c: In function 'ad9739a_write_raw':
   drivers/iio/dac/adi-axi-dac.c:127:31: warning: unused variable 'st' [-Wunused-variable]
     127 |         struct axi_dac_state *st = iio_backend_get_priv(back);
         |                               ^~
   drivers/iio/dac/adi-axi-dac.c: At top level:
>> drivers/iio/dac/adi-axi-dac.c:165:21: error: 'axi_dac_read_raw' undeclared here (not in a function)
     165 |         .read_raw = axi_dac_read_raw,
         |                     ^~~~~~~~~~~~~~~~
>> drivers/iio/dac/adi-axi-dac.c:166:22: error: 'axi_dac_write_raw' undeclared here (not in a function)
     166 |         .write_raw = axi_dac_write_raw,
         |                      ^~~~~~~~~~~~~~~~~
>> drivers/iio/dac/adi-axi-dac.c:123:12: warning: 'ad9739a_write_raw' defined but not used [-Wunused-function]
     123 | static int ad9739a_write_raw(struct iio_backend *back,
         |            ^~~~~~~~~~~~~~~~~
>> drivers/iio/dac/adi-axi-dac.c:105:12: warning: 'ad9739a_read_raw' defined but not used [-Wunused-function]
     105 | static int ad9739a_read_raw(struct iio_backend *back,
         |            ^~~~~~~~~~~~~~~~


vim +/axi_dac_read_raw +165 drivers/iio/dac/adi-axi-dac.c

   104	
 > 105	static int ad9739a_read_raw(struct iio_backend *back,
   106				    struct iio_chan_spec const *chan,
   107				    int *val, int *val2, long mask)
   108	{
   109		struct axi_dac_state *st = iio_backend_get_priv(back);
   110	
   111		switch (mask) {
   112		case IIO_CHAN_INFO_SCALE:
   113			return 0;
   114		case IIO_CHAN_INFO_FREQUENCY:
   115			return 0;
   116		case IIO_CHAN_INFO_PHASE:
   117			return 0;
   118		default:
   119			return -EINVAL;
   120		};
   121	}
   122	
 > 123	static int ad9739a_write_raw(struct iio_backend *back,
   124				     struct iio_chan_spec const *chan,
   125				     int val, int val2, long mask)
   126	{
   127		struct axi_dac_state *st = iio_backend_get_priv(back);
   128	
   129		switch (mask) {
   130		case IIO_CHAN_INFO_SCALE:
   131			return 0;
   132		case IIO_CHAN_INFO_FREQUENCY:
   133			return 0;
   134		case IIO_CHAN_INFO_PHASE:
   135			return 0;
   136		default:
   137			return -EINVAL;
   138		};
   139	}
   140	
   141	static int axi_dac_data_source_set(struct iio_backend *back, unsigned int chan,
   142					   enum iio_backend_data_source data)
   143	{
   144		struct axi_dac_state *st = iio_backend_get_priv(back);
   145	
   146		switch (data) {
   147		case IIO_BACKEND_INTERNAL_CW:
   148			return regmap_update_bits(st->regmap, AXI_REG_CHAN_CNTRL_7(chan),
   149						  AXI_DAC_DATA_SEL_MASK,
   150						  AXI_DAC_DATA_INTERNAL_TONE);
   151		case IIO_BACKEND_EXTERNAL:
   152			return regmap_update_bits(st->regmap, AXI_REG_CHAN_CNTRL_7(chan),
   153						  AXI_DAC_DATA_SEL_MASK,
   154						  AXI_DAC_DATA_DMA);
   155		default:
   156			return -EINVAL;
   157		}
   158	}
   159	
   160	static const struct iio_backend_ops axi_dac_generic = {
   161		.enable = axi_dac_enable,
   162		.disable = axi_dac_disable,
   163		.request_buffer = axi_dac_request_buffer,
   164		.free_buffer = axi_dac_free_buffer,
 > 165		.read_raw = axi_dac_read_raw,
 > 166		.write_raw = axi_dac_write_raw,
   167		.data_source_set = axi_dac_data_source_set,
   168	};
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
