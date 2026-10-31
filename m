Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413267;
	b=XXz5T0c+/5Ysp69prm52lhYPG3HeLIflPspbH6J54ZnSR1pZ0RvJCUBooQWOJWLPUkZa
	 1maNSnZpBq0yB4J+tVlwEBoufOTggWCQkLVOCE46todAwk9XuCklO3qIJSMYxNbTW4DRe
	 72TmTo2rQ9RI7Qg42cTxBI8DZR9VgefMF8s72VKDX4exv1m/ETX8pDMYwIGxKwybR/TnE
	 ZcIPX7Zt0tJ/ErSqfDQO76/DgeEVEJ/Mnc4/e2qjaBS3PZlXZpvmu8ApDIORUpFo/5fWP
	 BXs+TnDwVx4FPx9zLmxHZwOnSy2iX4paAxwDVrWLuDn7wif7p/Iuaw6Ov0DhNanzm1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413267;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=PogWjP4Qs7F5L9v1joZNRjVjJFwbBx79he+QMq0yhqU=;
	b=CA3XueNqCLATgA6505YTS5Sox/6IXZF083VwpRCWse8m8sMqOJu2JLs7h98LROH5GWa5
	 XDN1BPe+ueEyXBadsqFKeqQ1rZ15F20UJ+IlRuPuvqdb+FwgWvyf+wCI61+PR9QE6gXXX
	 nz/aKkLEPXJeejGwb9BSGXI2w/H8KEuanfhp3qPZ7VKZ3cOUvnUIF/AbJYrStOJ0y372s
	 YbuyWLM1zAsVZx3OY4WDQSAkfuCgk8G9gdwxSAidGwy6+Zkp2HHKSpLMohLgJrgFeic7z
	 Oo7qRaSjU3bIrPQUPCudRfwQ1mloIPqWDkcR11bd/rHpjv08EIYH4I8dydb1qqreuVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="SAT/2T7w";
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6E9606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 02:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B6E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SAT/2T7w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793413266; x=1824949266;
  h=date:from:to:cc:subject:message-id;
  bh=IYxiGPJ21FfwJRT11p1xwzXG+P0wQRUWxhtnkn5kPsY=;
  b=SAT/2T7wY8LTPXutHBZugTtZQqT2ol0dC3LmEXh1jA4Gy5XXmpRCbDDU
   WyF4Zyxi1K732g+nXnn8xRkWXO3vKasZHIc16KZWxnMuiW6fzsS90AQs9
   czdR8CFgvW9iaHaNWIAbf/pxw9mJL2RRnOAcEuiTWUix67ZyudMWXAngu
   kpYvH9SQWuIFvFW1ewCGgMPgsfIBTnNEue7OCdAcTGVk2dJFgYjLQmNR8
   3tR7OeXeT8W9w1aUXWL5wFRRTVqNYzOAyn38U6++031Sm7zbEDZ17t0FA
   +KdCAKYlZ2B0MjgPNfRrLDZHDeyVBItKKBval4UePaMYyNSaE3ldAJMbX
   g==;
X-CSE-ConnectionGUID: Dianssb8Taa6JA1JHpE4vw==
X-CSE-MsgGUID: D3ZKSqkOTgWgr00idq/sPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2064055"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2064055"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 19:21:05 -0700
X-CSE-ConnectionGUID: ZVa7wNWARXeNvwnSWUXyeA==
X-CSE-MsgGUID: ArEazRwxRguVU1BLeRwJIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5922782"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2026 19:21:03 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMyiK-000000005pn-2smY;
	Sat, 31 Oct 2026 02:21:00 +0000
Date: Sat, 31 Oct 2026 03:20:49 +0100
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:sunxi-wip 22/36]
 sound/soc/sunxi/sun4i-codec.c:2129:35: warning: 'sun55i_codec_ch_vol_scale'
 defined but not used
Message-ID: <202610310340.T4hfSMiG-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: 26aaaa5549cb3eb3943ab92ffdfbe36a8eacda2e [22/36] ASoC: sun4i-codec: Support playback for A523 SoC family's audio codec
config: csky-randconfig-2000-20261030 (https://download.01.org/0day-ci/archive/20261031/202610310340.T4hfSMiG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310340.T4hfSMiG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310340.T4hfSMiG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/sound/tlv.h:10,
                    from sound/soc/sunxi/sun4i-codec.c:31:
>> sound/soc/sunxi/sun4i-codec.c:2129:35: warning: 'sun55i_codec_ch_vol_scale' defined but not used [-Wunused-const-variable=]
    2129 | static const DECLARE_TLV_DB_SCALE(sun55i_codec_ch_vol_scale, -11925, 75, 1);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/sound/tlv.h:55:22: note: in definition of macro 'SNDRV_CTL_TLVD_DECLARE_DB_SCALE'
      55 |         unsigned int name[] = { \
         |                      ^~~~
   sound/soc/sunxi/sun4i-codec.c:2129:14: note: in expansion of macro 'DECLARE_TLV_DB_SCALE'
    2129 | static const DECLARE_TLV_DB_SCALE(sun55i_codec_ch_vol_scale, -11925, 75, 1);
         |              ^~~~~~~~~~~~~~~~~~~~


vim +/sun55i_codec_ch_vol_scale +2129 sound/soc/sunxi/sun4i-codec.c

  2126	
  2127	/* volume / mute controls */
  2128	static const DECLARE_TLV_DB_SCALE(sun55i_codec_dvol_scale, -7308, 116, 0);
> 2129	static const DECLARE_TLV_DB_SCALE(sun55i_codec_ch_vol_scale, -11925, 75, 1);
  2130	static const DECLARE_TLV_DB_SCALE(sun55i_codec_hp_vol_scale, -4200, 600, 0);
  2131	static const DECLARE_TLV_DB_RANGE(sun55i_codec_lineout_vol_scale,
  2132		0, 1, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
  2133		2, 31, TLV_DB_SCALE_ITEM(-4350, 150, 0),
  2134	);
  2135	static const char * const sun55i_codec_cpldo_volt_enum_text[] = {
  2136		"0.9V", "1.0V", "1.1V", "1.2V"
  2137	};
  2138	static SOC_ENUM_SINGLE_DECL(sun55i_codec_cpldo_volt_enum, SUN55I_CODEC_DAC,
  2139				    SUN55I_CODEC_DAC_CPLDO_VOLT,
  2140				    sun55i_codec_cpldo_volt_enum_text);
  2141	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
