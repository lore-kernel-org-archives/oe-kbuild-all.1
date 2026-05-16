Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352951A6808
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 03:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778900535; cv=none; b=SbOxTGaSYK4gMnqyXcTT1/TTRYakHXV3M0+/xwsDxokKjgTpRnnW3KndoGrU5ajLIuAog+b9lfwUxksZi9p3wpWUdoi71sBIVEg3TnGdmBvlvaPJ9Q4Jcj3KexLhHvgb8aSnnlQ0D2ZMBUI//P7x3nCstfWVIi9nLpYopAgog9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778900535; c=relaxed/simple;
	bh=iXvljCq3KTVsmmSdnLrModLlDshEmQ1yHf0UTCB9XOE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pNA2sQaEz2WS8oJ/vb2Y0B3ZdP6m0eSC0EQFVNnKxsvDPSdW5Y1lUhEZw3ulqfPuur1cm02zUGpOjCjmmLEXk6RcU77VKoGvAjDzjIAZqNbdyaiXClXS+lqWRI/Sb/94Lo2PUkPFikJB2/TYQ6jTe4eyqKdVy/WyWckhEHGVpBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8wKrDLY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8wKrDLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778900534; x=1810436534;
  h=date:from:to:cc:subject:message-id;
  bh=iXvljCq3KTVsmmSdnLrModLlDshEmQ1yHf0UTCB9XOE=;
  b=X8wKrDLYcykuom0XAj4gT2MEf7qbKW3YRb5HvNPdUl/plQn+wWr9TR4v
   MMdpXVNW/cNkfAOP+Q6u1O0OD5aoC9sDyiuMAi2QJcS3YcUYohZQ8ASqb
   4+C/AE+P31vfU/enTeftq6wliHt3XtUXFm9WyUzYPdMp2VChgkHTh9bb6
   TRC7Qp17sKky6vhPc2ZRBJf9Y5IPgA5f5sEezgzAGOnEBC4JzicmO4fyJ
   HRQlWLJyKwQPJY39RLb2ZzoL6/S11yQ3FxyILVdG5LQ7LoIfM5VxQG5v9
   f3CBCUfDNlxq83orxcRqTk/fY5HORBFnhp4TcbC6MiLE9J1fnSf+XB8z7
   Q==;
X-CSE-ConnectionGUID: /2+9O28bQhihC6M+bxnz+w==
X-CSE-MsgGUID: WjWFAYoESSax0aUyQEk7fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="78991579"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="78991579"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 20:02:13 -0700
X-CSE-ConnectionGUID: AmJ1GfF+RNePZiX9NLPF5A==
X-CSE-MsgGUID: ECXPTgFJTzu0Q6GN9relQA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 May 2026 20:02:12 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO5I2-000000000Pb-0CZ2;
	Sat, 16 May 2026 03:02:10 +0000
Date: Sat, 16 May 2026 11:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:sunxi-wip 27/29]
 sound/soc/sunxi/sun4i-codec.c:2118:35: warning: 'sun55i_codec_ch_vol_scale'
 defined but not used
Message-ID: <202605161000.Kv6gmLQc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   1cdb4d4846ffaddce6d648dbbfcdcca78f8a0bcc
commit: ef6aea06096134a7e805db2283ed108274414319 [27/29] ASoC: sun4i-codec: Support playback for A523 SoC family's audio codec
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605161000.Kv6gmLQc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161000.Kv6gmLQc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161000.Kv6gmLQc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/sunxi/sun4i-codec.c:20:
   sound/soc/sunxi/sun4i-codec.c:2419:37: error: 'SUN55I_CODEC_ADC_FIFOC' undeclared here (not in a function); did you mean 'SUN55I_CODEC_DAC_FIFOC'?
    2419 |         .reg_adc_fifoc  = REG_FIELD(SUN55I_CODEC_ADC_FIFOC, 0, 31),
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/regmap.h:1464:40: note: in definition of macro 'REG_FIELD'
    1464 |                                 .reg = _reg,    \
         |                                        ^~~~
   sound/soc/sunxi/sun4i-codec.c:2422:27: error: 'SUN55I_CODEC_ADC_RXDATA' undeclared here (not in a function); did you mean 'SUN6I_CODEC_ADC_RXDATA'?
    2422 |         .reg_adc_rxdata = SUN55I_CODEC_ADC_RXDATA,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
         |                           SUN6I_CODEC_ADC_RXDATA
   In file included from include/sound/tlv.h:10,
                    from sound/soc/sunxi/sun4i-codec.c:31:
>> sound/soc/sunxi/sun4i-codec.c:2118:35: warning: 'sun55i_codec_ch_vol_scale' defined but not used [-Wunused-const-variable=]
    2118 | static const DECLARE_TLV_DB_SCALE(sun55i_codec_ch_vol_scale, -11925, 75, 1);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/sound/tlv.h:55:22: note: in definition of macro 'SNDRV_CTL_TLVD_DECLARE_DB_SCALE'
      55 |         unsigned int name[] = { \
         |                      ^~~~
   sound/soc/sunxi/sun4i-codec.c:2118:14: note: in expansion of macro 'DECLARE_TLV_DB_SCALE'
    2118 | static const DECLARE_TLV_DB_SCALE(sun55i_codec_ch_vol_scale, -11925, 75, 1);
         |              ^~~~~~~~~~~~~~~~~~~~


vim +/sun55i_codec_ch_vol_scale +2118 sound/soc/sunxi/sun4i-codec.c

  2115	
  2116	/* volume / mute controls */
  2117	static const DECLARE_TLV_DB_SCALE(sun55i_codec_dvol_scale, -7308, 116, 0);
> 2118	static const DECLARE_TLV_DB_SCALE(sun55i_codec_ch_vol_scale, -11925, 75, 1);
  2119	static const DECLARE_TLV_DB_SCALE(sun55i_codec_hp_vol_scale, -4200, 600, 0);
  2120	static const DECLARE_TLV_DB_RANGE(sun55i_codec_lineout_vol_scale,
  2121		0, 1, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
  2122		2, 31, TLV_DB_SCALE_ITEM(-4350, 150, 0),
  2123	);
  2124	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
