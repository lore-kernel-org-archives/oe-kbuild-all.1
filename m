Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5F91F150D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 12:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741091865; cv=none; b=QQjFxxTbbFoOsfEFE54DS/HBHiF+h44cv74LWZyf8PPp9hcFTsFoJY3eJrWgza7PBUOlD74ZzELCyZb9Jahx302KkBag20UOkPmdeGzcUjhfdgu/4Q12qwBB/lqGnxLhckSYy8fUrTmPLBr/hmCtk8RzKRsVqzBQob58qP2x9Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741091865; c=relaxed/simple;
	bh=MqJrjIV7j0e6XJeHY+WwA+mHvyQKGNBoYvZnC7ViSZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTdLQrKi0qiMYqzyQgnuKaEux1qL9rPk9092AzjYdyedHGjQ16OqLLKSW9DKYcHOSMTwPuRexFv8RFbf3tCA0uZXhB2dYS21JLjbnFdVUo60qHf0x3nR1f6VapkzEBJEbtMXGHUP5yBbw2Lr4bjqmlI6YDhdAvWDbOmImnKUOGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0yG0dZm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0yG0dZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741091863; x=1772627863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MqJrjIV7j0e6XJeHY+WwA+mHvyQKGNBoYvZnC7ViSZ0=;
  b=U0yG0dZm33cm2q6tFLu+FqU32xm7fWDlvT9hfo2dQtusGQhj/HXhgFmh
   FXD8RyUVVNHtkQ44UHs1lvbMH3QZ14fusKJrCyDzkOc/Wa1f6928nQemn
   URb9E9IZ6RkId/OI7yy78ekSMS1aGSddfjkHrAUXcz/+KFDctSjJa3Bwd
   yxh9ElapsozEQRZ0Y3ceyY5tBqrtv2gtCuWcJbOp3idip7/IIH6/ovDC3
   8loFVlD2lgAYC9HVmHpYjuRMB1I9XA8JNUbHhn3+6vEdmC22PXm5wzGq+
   cvy5oWLUqIty0pQp8o48h+niX2HpjZoB/GAZQyJ3dyLHrGBJ8qpSfIKAr
   Q==;
X-CSE-ConnectionGUID: 7LTk5bmzQz2mksbmL2qhMA==
X-CSE-MsgGUID: Cn0Km61bTbqXUsZLXu1wZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44813500"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="44813500"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 04:37:40 -0800
X-CSE-ConnectionGUID: vpNyF4/gT+KtvDVsFeDevw==
X-CSE-MsgGUID: XZGilTzARo2Nwg3p5G17DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119273764"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2025 04:37:40 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpRWi-000Jle-2J;
	Tue, 04 Mar 2025 12:37:36 +0000
Date: Tue, 4 Mar 2025 20:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 13/13] ASoC: Tidy up SOC_DOUBLE_* and SOC_SINGLE_*
 helpers
Message-ID: <202503042053.coONSnOx-lkp@intel.com>
References: <20250303171424.444556-14-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303171424.444556-14-ckeepax@opensource.cirrus.com>

Hi Charles,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/ASoC-Remove-unused-helper-macro/20250304-015303
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250303171424.444556-14-ckeepax%40opensource.cirrus.com
patch subject: [PATCH v2 13/13] ASoC: Tidy up SOC_DOUBLE_* and SOC_SINGLE_* helpers
config: x86_64-buildonly-randconfig-005-20250304 (https://download.01.org/0day-ci/archive/20250304/202503042053.coONSnOx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503042053.coONSnOx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503042053.coONSnOx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/rk3308_codec.c:24:
>> include/sound/soc.h:150:49: error: 'shift_left' undeclared here (not in a function)
     150 |         .private_value = SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, \
         |                                                 ^~~~~~~~~~
   include/sound/soc.h:45:46: note: in definition of macro 'SOC_DOUBLE_S_VALUE'
      45 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |                                              ^~~~~~~~~~
   include/sound/soc.h:150:26: note: in expansion of macro 'SOC_DOUBLE_VALUE'
     150 |         .private_value = SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, \
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/rk3308_codec.c:171:9: note: in expansion of macro 'SOC_DOUBLE_RANGE_TLV'
     171 |         SOC_DOUBLE_RANGE_TLV("DAC HPMIX Playback Volume",
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/sound/soc.h:150:61: error: 'shift_right' undeclared here (not in a function)
     150 |         .private_value = SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, \
         |                                                             ^~~~~~~~~~~
   include/sound/soc.h:46:19: note: in definition of macro 'SOC_DOUBLE_S_VALUE'
      46 |         .rshift = shift_right, .min = xmin, .max = xmax, \
         |                   ^~~~~~~~~~~
   include/sound/soc.h:150:26: note: in expansion of macro 'SOC_DOUBLE_VALUE'
     150 |         .private_value = SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, \
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/rk3308_codec.c:171:9: note: in expansion of macro 'SOC_DOUBLE_RANGE_TLV'
     171 |         SOC_DOUBLE_RANGE_TLV("DAC HPMIX Playback Volume",
         |         ^~~~~~~~~~~~~~~~~~~~
--
   In file included from rk3308_codec.c:24:
>> include/sound/soc.h:150:49: error: 'shift_left' undeclared here (not in a function)
     150 |         .private_value = SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, \
         |                                                 ^~~~~~~~~~
   include/sound/soc.h:45:46: note: in definition of macro 'SOC_DOUBLE_S_VALUE'
      45 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |                                              ^~~~~~~~~~
   include/sound/soc.h:150:26: note: in expansion of macro 'SOC_DOUBLE_VALUE'
     150 |         .private_value = SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, \
         |                          ^~~~~~~~~~~~~~~~
   rk3308_codec.c:171:9: note: in expansion of macro 'SOC_DOUBLE_RANGE_TLV'
     171 |         SOC_DOUBLE_RANGE_TLV("DAC HPMIX Playback Volume",
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/sound/soc.h:150:61: error: 'shift_right' undeclared here (not in a function)
     150 |         .private_value = SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, \
         |                                                             ^~~~~~~~~~~
   include/sound/soc.h:46:19: note: in definition of macro 'SOC_DOUBLE_S_VALUE'
      46 |         .rshift = shift_right, .min = xmin, .max = xmax, \
         |                   ^~~~~~~~~~~
   include/sound/soc.h:150:26: note: in expansion of macro 'SOC_DOUBLE_VALUE'
     150 |         .private_value = SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, \
         |                          ^~~~~~~~~~~~~~~~
   rk3308_codec.c:171:9: note: in expansion of macro 'SOC_DOUBLE_RANGE_TLV'
     171 |         SOC_DOUBLE_RANGE_TLV("DAC HPMIX Playback Volume",
         |         ^~~~~~~~~~~~~~~~~~~~


vim +/shift_left +150 include/sound/soc.h

    38	
    39	/*
    40	 * Convenience kcontrol builders
    41	 */
    42	#define SOC_DOUBLE_S_VALUE(xreg, shift_left, shift_right, xmin, xmax, xsign_bit, \
    43				   xinvert, xautodisable) \
    44		((unsigned long)&(struct soc_mixer_control) \
  > 45		{.reg = xreg, .rreg = xreg, .shift = shift_left, \
    46		.rshift = shift_right, .min = xmin, .max = xmax, \
    47		.sign_bit = xsign_bit, .invert = xinvert, .autodisable = xautodisable})
    48	#define SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, xmin, xmax, xinvert, xautodisable) \
    49		SOC_DOUBLE_S_VALUE(xreg, shift_left, shift_right, xmin, xmax, 0, xinvert, \
    50				   xautodisable)
    51	#define SOC_SINGLE_VALUE(xreg, xshift, xmin, xmax, xinvert, xautodisable) \
    52		SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmin, xmax, xinvert, xautodisable)
    53	#define SOC_DOUBLE_R_S_VALUE(xlreg, xrreg, xshift, xmin, xmax, xsign_bit, xinvert) \
    54		((unsigned long)&(struct soc_mixer_control) \
    55		{.reg = xlreg, .rreg = xrreg, .shift = xshift, .rshift = xshift, \
    56		.max = xmax, .min = xmin, .sign_bit = xsign_bit, \
    57		.invert = xinvert})
    58	#define SOC_DOUBLE_R_VALUE(xlreg, xrreg, xshift, xmin, xmax, xinvert) \
    59		SOC_DOUBLE_R_S_VALUE(xlreg, xrreg, xshift, xmin, xmax, 0, xinvert)
    60	
    61	#define SOC_SINGLE(xname, reg, shift, max, invert) \
    62	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
    63		.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,\
    64		.put = snd_soc_put_volsw, \
    65		.private_value = SOC_SINGLE_VALUE(reg, shift, 0, max, invert, 0) }
    66	#define SOC_SINGLE_RANGE(xname, xreg, xshift, xmin, xmax, xinvert) \
    67	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
    68		.info = snd_soc_info_volsw_range, .get = snd_soc_get_volsw_range, \
    69		.put = snd_soc_put_volsw_range, \
    70		.private_value = SOC_SINGLE_VALUE(xreg, xshift, xmin, xmax, xinvert, 0) }
    71	#define SOC_SINGLE_TLV(xname, reg, shift, max, invert, tlv_array) \
    72	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
    73		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
    74			 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
    75		.tlv.p = (tlv_array), \
    76		.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,\
    77		.put = snd_soc_put_volsw, \
    78		.private_value = SOC_SINGLE_VALUE(reg, shift, 0, max, invert, 0) }
    79	#define SOC_SINGLE_SX_TLV(xname, xreg, xshift, xmin, xmax, tlv_array) \
    80	{       .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
    81		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
    82		SNDRV_CTL_ELEM_ACCESS_READWRITE, \
    83		.tlv.p  = (tlv_array),\
    84		.info = snd_soc_info_volsw_sx, \
    85		.get = snd_soc_get_volsw_sx,\
    86		.put = snd_soc_put_volsw_sx, \
    87		.private_value = SOC_SINGLE_VALUE(xreg, xshift, xmin, xmax, 0, 0) }
    88	#define SOC_SINGLE_RANGE_TLV(xname, xreg, xshift, xmin, xmax, xinvert, tlv_array) \
    89	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
    90		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
    91			 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
    92		.tlv.p = (tlv_array), \
    93		.info = snd_soc_info_volsw_range, \
    94		.get = snd_soc_get_volsw_range, .put = snd_soc_put_volsw_range, \
    95		.private_value = SOC_SINGLE_VALUE(xreg, xshift, xmin, xmax, xinvert, 0) }
    96	#define SOC_DOUBLE(xname, reg, shift_left, shift_right, max, invert) \
    97	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
    98		.info = snd_soc_info_volsw, .get = snd_soc_get_volsw, \
    99		.put = snd_soc_put_volsw, \
   100		.private_value = SOC_DOUBLE_VALUE(reg, shift_left, shift_right, \
   101						  0, max, invert, 0) }
   102	#define SOC_DOUBLE_STS(xname, reg, shift_left, shift_right, max, invert) \
   103	{									\
   104		.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),		\
   105		.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,		\
   106		.access = SNDRV_CTL_ELEM_ACCESS_READ |				\
   107			SNDRV_CTL_ELEM_ACCESS_VOLATILE,				\
   108		.private_value = SOC_DOUBLE_VALUE(reg, shift_left, shift_right,	\
   109						  0, max, invert, 0) }
   110	#define SOC_DOUBLE_R(xname, reg_left, reg_right, xshift, xmax, xinvert) \
   111	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
   112		.info = snd_soc_info_volsw, \
   113		.get = snd_soc_get_volsw, .put = snd_soc_put_volsw, \
   114		.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
   115						    0, xmax, xinvert) }
   116	#define SOC_DOUBLE_R_RANGE(xname, reg_left, reg_right, xshift, xmin, \
   117				   xmax, xinvert)		\
   118	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
   119		.info = snd_soc_info_volsw_range, \
   120		.get = snd_soc_get_volsw_range, .put = snd_soc_put_volsw_range, \
   121		.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, \
   122						    xshift, xmin, xmax, xinvert) }
   123	#define SOC_DOUBLE_TLV(xname, reg, shift_left, shift_right, max, invert, tlv_array) \
   124	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
   125		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
   126			 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
   127		.tlv.p = (tlv_array), \
   128		.info = snd_soc_info_volsw, .get = snd_soc_get_volsw, \
   129		.put = snd_soc_put_volsw, \
   130		.private_value = SOC_DOUBLE_VALUE(reg, shift_left, shift_right, \
   131						  0, max, invert, 0) }
   132	#define SOC_DOUBLE_SX_TLV(xname, xreg, shift_left, shift_right, xmin, xmax, tlv_array) \
   133	{       .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
   134		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
   135		SNDRV_CTL_ELEM_ACCESS_READWRITE, \
   136		.tlv.p  = (tlv_array), \
   137		.info = snd_soc_info_volsw_sx, \
   138		.get = snd_soc_get_volsw_sx, \
   139		.put = snd_soc_put_volsw_sx, \
   140		.private_value = SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, \
   141						  xmin, xmax, 0, 0) }
   142	#define SOC_DOUBLE_RANGE_TLV(xname, xreg, xshift_left, xshift_right, xmin, xmax, \
   143				     xinvert, tlv_array) \
   144	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
   145		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
   146			  SNDRV_CTL_ELEM_ACCESS_READWRITE,\
   147		.tlv.p = (tlv_array), \
   148		.info = snd_soc_info_volsw, \
   149		.get = snd_soc_get_volsw, .put = snd_soc_put_volsw, \
 > 150		.private_value = SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, \
   151						  xmin, xmax, xinvert, 0) }
   152	#define SOC_DOUBLE_R_TLV(xname, reg_left, reg_right, xshift, xmax, xinvert, tlv_array) \
   153	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
   154		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
   155			 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
   156		.tlv.p = (tlv_array), \
   157		.info = snd_soc_info_volsw, \
   158		.get = snd_soc_get_volsw, .put = snd_soc_put_volsw, \
   159		.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
   160						    0, xmax, xinvert) }
   161	#define SOC_DOUBLE_R_RANGE_TLV(xname, reg_left, reg_right, xshift, xmin, \
   162				       xmax, xinvert, tlv_array)		\
   163	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
   164		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
   165			 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
   166		.tlv.p = (tlv_array), \
   167		.info = snd_soc_info_volsw_range, \
   168		.get = snd_soc_get_volsw_range, .put = snd_soc_put_volsw_range, \
   169		.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, \
   170						    xshift, xmin, xmax, xinvert) }
   171	#define SOC_DOUBLE_R_SX_TLV(xname, xreg, xrreg, xshift, xmin, xmax, tlv_array) \
   172	{       .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
   173		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
   174		SNDRV_CTL_ELEM_ACCESS_READWRITE, \
   175		.tlv.p  = (tlv_array), \
   176		.info = snd_soc_info_volsw_sx, \
   177		.get = snd_soc_get_volsw_sx, \
   178		.put = snd_soc_put_volsw_sx, \
   179		.private_value = SOC_DOUBLE_R_VALUE(xreg, xrreg, xshift, xmin, xmax, 0) }
   180	#define SOC_DOUBLE_R_S_TLV(xname, reg_left, reg_right, xshift, xmin, xmax, xsign_bit, xinvert, tlv_array) \
   181	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
   182		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
   183			 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
   184		.tlv.p = (tlv_array), \
   185		.info = snd_soc_info_volsw, \
   186		.get = snd_soc_get_volsw, .put = snd_soc_put_volsw, \
   187		.private_value = SOC_DOUBLE_R_S_VALUE(reg_left, reg_right, xshift, \
   188						    xmin, xmax, xsign_bit, xinvert) }
   189	#define SOC_SINGLE_S_TLV(xname, xreg, xshift, xmin, xmax, xsign_bit, xinvert, tlv_array) \
   190		SOC_DOUBLE_R_S_TLV(xname, xreg, xreg, xshift, xmin, xmax, xsign_bit, xinvert, tlv_array)
   191	#define SOC_SINGLE_S8_TLV(xname, xreg, xmin, xmax, tlv_array) \
   192	{	.iface  = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
   193		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
   194			  SNDRV_CTL_ELEM_ACCESS_READWRITE, \
   195		.tlv.p  = (tlv_array), \
   196		.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,\
   197		.put = snd_soc_put_volsw, \
   198		.private_value = (unsigned long)&(struct soc_mixer_control) \
   199		{.reg = xreg, .rreg = xreg,  \
   200		 .min = xmin, .max = xmax, \
   201		.sign_bit = 7,} }
   202	#define SOC_DOUBLE_S8_TLV(xname, xreg, xmin, xmax, tlv_array) \
   203	{	.iface  = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
   204		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
   205			  SNDRV_CTL_ELEM_ACCESS_READWRITE, \
   206		.tlv.p  = (tlv_array), \
   207		.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,\
   208		.put = snd_soc_put_volsw, \
   209		.private_value = SOC_DOUBLE_S_VALUE(xreg, 0, 8, xmin, xmax, 7, 0, 0) }
   210	#define SOC_ENUM_DOUBLE(xreg, xshift_l, xshift_r, xitems, xtexts) \
   211	{	.reg = xreg, .shift_l = xshift_l, .shift_r = xshift_r, \
   212		.items = xitems, .texts = xtexts, \
   213		.mask = xitems ? roundup_pow_of_two(xitems) - 1 : 0}
   214	#define SOC_ENUM_SINGLE(xreg, xshift, xitems, xtexts) \
   215		SOC_ENUM_DOUBLE(xreg, xshift, xshift, xitems, xtexts)
   216	#define SOC_ENUM_SINGLE_EXT(xitems, xtexts) \
   217	{	.items = xitems, .texts = xtexts }
   218	#define SOC_VALUE_ENUM_DOUBLE(xreg, xshift_l, xshift_r, xmask, xitems, xtexts, xvalues) \
   219	{	.reg = xreg, .shift_l = xshift_l, .shift_r = xshift_r, \
   220		.mask = xmask, .items = xitems, .texts = xtexts, .values = xvalues}
   221	#define SOC_VALUE_ENUM_SINGLE(xreg, xshift, xmask, xitems, xtexts, xvalues) \
   222		SOC_VALUE_ENUM_DOUBLE(xreg, xshift, xshift, xmask, xitems, xtexts, xvalues)
   223	#define SOC_VALUE_ENUM_SINGLE_AUTODISABLE(xreg, xshift, xmask, xitems, xtexts, xvalues) \
   224	{	.reg = xreg, .shift_l = xshift, .shift_r = xshift, \
   225		.mask = xmask, .items = xitems, .texts = xtexts, \
   226		.values = xvalues, .autodisable = 1}
   227	#define SOC_ENUM_SINGLE_VIRT(xitems, xtexts) \
   228		SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, xitems, xtexts)
   229	#define SOC_ENUM(xname, xenum) \
   230	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname,\
   231		.info = snd_soc_info_enum_double, \
   232		.get = snd_soc_get_enum_double, .put = snd_soc_put_enum_double, \
   233		.private_value = (unsigned long)&xenum }
   234	#define SOC_SINGLE_EXT(xname, xreg, xshift, xmax, xinvert,\
   235		 xhandler_get, xhandler_put) \
   236	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
   237		.info = snd_soc_info_volsw, \
   238		.get = xhandler_get, .put = xhandler_put, \
   239		.private_value = SOC_SINGLE_VALUE(xreg, xshift, 0, xmax, xinvert, 0) }
   240	#define SOC_DOUBLE_EXT(xname, reg, shift_left, shift_right, max, invert,\
   241		 xhandler_get, xhandler_put) \
   242	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
   243		.info = snd_soc_info_volsw, \
   244		.get = xhandler_get, .put = xhandler_put, \
   245		.private_value = \
   246			SOC_DOUBLE_VALUE(reg, shift_left, shift_right, 0, max, invert, 0) }
   247	#define SOC_DOUBLE_R_EXT(xname, reg_left, reg_right, xshift, xmax, xinvert,\
   248		 xhandler_get, xhandler_put) \
   249	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
   250		.info = snd_soc_info_volsw, \
   251		.get = xhandler_get, .put = xhandler_put, \
   252		.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
   253						    0, xmax, xinvert) }
   254	#define SOC_SINGLE_EXT_TLV(xname, xreg, xshift, xmax, xinvert,\
   255		 xhandler_get, xhandler_put, tlv_array) \
   256	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
   257		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
   258			 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
   259		.tlv.p = (tlv_array), \
   260		.info = snd_soc_info_volsw, \
   261		.get = xhandler_get, .put = xhandler_put, \
   262		.private_value = SOC_SINGLE_VALUE(xreg, xshift, 0, xmax, xinvert, 0) }
   263	#define SOC_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
   264					 xhandler_get, xhandler_put, tlv_array) \
   265	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
   266		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
   267			 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
   268		.tlv.p = (tlv_array), \
   269		.info = snd_soc_info_volsw_range, \
   270		.get = xhandler_get, .put = xhandler_put, \
   271		.private_value = SOC_SINGLE_VALUE(xreg, xshift, xmin, xmax, xinvert, 0) }
   272	#define SOC_DOUBLE_EXT_TLV(xname, xreg, shift_left, shift_right, xmax, xinvert,\
   273		 xhandler_get, xhandler_put, tlv_array) \
   274	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
   275		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
   276			 SNDRV_CTL_ELEM_ACCESS_READWRITE, \
   277		.tlv.p = (tlv_array), \
   278		.info = snd_soc_info_volsw, \
   279		.get = xhandler_get, .put = xhandler_put, \
   280		.private_value = SOC_DOUBLE_VALUE(xreg, shift_left, shift_right, \
   281						  0, xmax, xinvert, 0) }
   282	#define SOC_DOUBLE_R_EXT_TLV(xname, reg_left, reg_right, xshift, xmax, xinvert,\
   283		 xhandler_get, xhandler_put, tlv_array) \
   284	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
   285		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
   286			 SNDRV_CTL_ELEM_ACCESS_READWRITE, \
   287		.tlv.p = (tlv_array), \
   288		.info = snd_soc_info_volsw, \
   289		.get = xhandler_get, .put = xhandler_put, \
   290		.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
   291						    0, xmax, xinvert) }
   292	#define SOC_DOUBLE_R_S_EXT_TLV(xname, reg_left, reg_right, xshift, xmin, xmax, \
   293				       xsign_bit, xinvert, xhandler_get, xhandler_put, \
   294				       tlv_array) \
   295	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
   296		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
   297			  SNDRV_CTL_ELEM_ACCESS_READWRITE, \
   298		.tlv.p = (tlv_array), \
   299		.info = snd_soc_info_volsw, \
   300		.get = xhandler_get, .put = xhandler_put, \
   301		.private_value = SOC_DOUBLE_R_S_VALUE(reg_left, reg_right, xshift, \
   302						      xmin, xmax, xsign_bit, xinvert) }
   303	#define SOC_SINGLE_S_EXT_TLV(xname, xreg, xshift, xmin, xmax, \
   304				     xsign_bit, xinvert, xhandler_get, xhandler_put, \
   305				     tlv_array) \
   306		SOC_DOUBLE_R_S_EXT_TLV(xname, xreg, xreg, xshift, xmin, xmax, \
   307				       xsign_bit, xinvert, xhandler_get, xhandler_put, \
   308				       tlv_array)
   309	#define SOC_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) \
   310	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
   311		.info = snd_soc_info_bool_ext, \
   312		.get = xhandler_get, .put = xhandler_put, \
   313		.private_value = xdata }
   314	#define SOC_ENUM_EXT(xname, xenum, xhandler_get, xhandler_put) \
   315	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
   316		.info = snd_soc_info_enum_double, \
   317		.get = xhandler_get, .put = xhandler_put, \
   318		.private_value = (unsigned long)&xenum }
   319	#define SOC_VALUE_ENUM_EXT(xname, xenum, xhandler_get, xhandler_put) \
   320		SOC_ENUM_EXT(xname, xenum, xhandler_get, xhandler_put)
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
