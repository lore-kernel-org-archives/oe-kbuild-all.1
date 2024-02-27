Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C7B51C5B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 04:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709009406; cv=none; b=Ih5+0rxluAL+58WjgFPcf5nDgQjrytZKkjzzaHrjgFi1JE2X5t9DeUM5N3muhLMrdDT35yI0MEhAiaUBjfT2VAEUZEYC+b5Wf6CQ/o5OrZvB0uExrO1MCanTR2nbKgCCkJlhIF8LC5pGkPPx+60yz3+fO4AxMi45CzbMjflecNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709009406; c=relaxed/simple;
	bh=2kO4Znn5M2zP8x2iciRz2Kf2mrh4iXw85wSCGAyo1rY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GCmAPxzVBeVL/XKfwjWCCoM0yEb1wL8cNdcXkJzjWpEwi870OMHlT+Qgy9tzQaPOEtVyNum3fbyEjDD++BGRVgjz7LvUC1t2tMoPLGzr/NuHehD/RpewU2Q+g3IWYHHAh/mc/ZkhaLP9vWs1jTHDOBr1iRpz+RTa62nhH9DIiis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zcp56WWf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zcp56WWf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709009404; x=1740545404;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2kO4Znn5M2zP8x2iciRz2Kf2mrh4iXw85wSCGAyo1rY=;
  b=Zcp56WWf8T1d6of9/D9wrpQNVpBd3TUKTQ2XA3i8d/Gx0B+kSybRmqhW
   gY039EmrR8efvpNKqd8ayGMzyOyAjBnvKI5rx0PHdO0HOWjnbCZlq7l3Z
   w3zgOhQDqw1gVtYO+ICJ1JWywN0O+KmNsucl5HgcWyjn2n6t8aqCrrcKP
   HXNuS4psJJhkFfkKZS9Dcz6wbm/cE0/DNEWmz8p6pBCz2ZDTA58lgospW
   vZSqsjdMm4E1YUK37RcCl4KLx4xnhbGY3gQLh6FVx+dMYYE74HSyxAknu
   ErPslRss73BdvexyiaKNOXgDKYNHbKNj0py5KpH+LFnJNxYhNGKWau2vi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14482267"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="14482267"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 20:50:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="11687901"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Feb 2024 20:50:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1repPj-000Awz-0B;
	Tue, 27 Feb 2024 04:49:59 +0000
Date: Tue, 27 Feb 2024 12:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Johnny Hsieh <mnixry@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileVkFsjG 49/49] sound/soc/amd/yc/acp6x-mach.c:209:2:
 error: expected '}'
Message-ID: <202402271252.5GtsuK2I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileVkFsjG
head:   8f991eeead81d9908ba751d48d90969541e60142
commit: 8f991eeead81d9908ba751d48d90969541e60142 [49/49] ASoC: amd: yc: Add Lenovo ThinkBook 21J0 into DMI quirk table
config: x86_64-randconfig-r112-20240227 (https://download.01.org/0day-ci/archive/20240227/202402271252.5GtsuK2I-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402271252.5GtsuK2I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402271252.5GtsuK2I-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/amd/yc/acp6x-mach.c:209:2: error: expected '}'
     209 |         {
         |         ^
   sound/soc/amd/yc/acp6x-mach.c:47:58: note: to match this '{'
      47 | static const struct dmi_system_id yc_acp_quirk_table[] = {
         |                                                          ^
   1 error generated.


vim +209 sound/soc/amd/yc/acp6x-mach.c

fa991481b8b22a Vijendar Mukunda    2021-10-18   46  
fa991481b8b22a Vijendar Mukunda    2021-10-18   47  static const struct dmi_system_id yc_acp_quirk_table[] = {
faf15233e59052 Cem Kaya            2023-04-10   48  	{
faf15233e59052 Cem Kaya            2023-04-10   49  		.driver_data = &acp6x_card,
faf15233e59052 Cem Kaya            2023-04-10   50  		.matches = {
faf15233e59052 Cem Kaya            2023-04-10   51  			DMI_MATCH(DMI_BOARD_VENDOR, "Dell Inc."),
faf15233e59052 Cem Kaya            2023-04-10   52  			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5525"),
faf15233e59052 Cem Kaya            2023-04-10   53  		}
faf15233e59052 Cem Kaya            2023-04-10   54  	},
a450b5c8739248 linkt               2022-10-11   55  	{
a450b5c8739248 linkt               2022-10-11   56  		.driver_data = &acp6x_card,
a450b5c8739248 linkt               2022-10-11   57  		.matches = {
a450b5c8739248 linkt               2022-10-11   58  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
a450b5c8739248 linkt               2022-10-11   59  			DMI_MATCH(DMI_PRODUCT_NAME, "21D0"),
a450b5c8739248 linkt               2022-10-11   60  		}
a450b5c8739248 linkt               2022-10-11   61  	},
a75481fa00cc06 Leohearts           2022-10-21   62  	{
a75481fa00cc06 Leohearts           2022-10-21   63  		.driver_data = &acp6x_card,
a75481fa00cc06 Leohearts           2022-10-21   64  		.matches = {
a75481fa00cc06 Leohearts           2022-10-21   65  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
a75481fa00cc06 Leohearts           2022-10-21   66  			DMI_MATCH(DMI_PRODUCT_NAME, "21D0"),
a75481fa00cc06 Leohearts           2022-10-21   67  		}
a75481fa00cc06 Leohearts           2022-10-21   68  	},
a450b5c8739248 linkt               2022-10-11   69  	{
a450b5c8739248 linkt               2022-10-11   70  		.driver_data = &acp6x_card,
a450b5c8739248 linkt               2022-10-11   71  		.matches = {
a450b5c8739248 linkt               2022-10-11   72  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
a450b5c8739248 linkt               2022-10-11   73  			DMI_MATCH(DMI_PRODUCT_NAME, "21D1"),
a450b5c8739248 linkt               2022-10-11   74  		}
a450b5c8739248 linkt               2022-10-11   75  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18   76  	{
e521f087780d07 Mario Limonciello   2022-04-11   77  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18   78  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18   79  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18   80  			DMI_MATCH(DMI_PRODUCT_NAME, "21D2"),
fa991481b8b22a Vijendar Mukunda    2021-10-18   81  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18   82  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18   83  	{
e521f087780d07 Mario Limonciello   2022-04-11   84  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18   85  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18   86  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18   87  			DMI_MATCH(DMI_PRODUCT_NAME, "21D3"),
fa991481b8b22a Vijendar Mukunda    2021-10-18   88  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18   89  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18   90  	{
e521f087780d07 Mario Limonciello   2022-04-11   91  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18   92  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18   93  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18   94  			DMI_MATCH(DMI_PRODUCT_NAME, "21D4"),
fa991481b8b22a Vijendar Mukunda    2021-10-18   95  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18   96  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18   97  	{
e521f087780d07 Mario Limonciello   2022-04-11   98  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18   99  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  100  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  101  			DMI_MATCH(DMI_PRODUCT_NAME, "21D5"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  102  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  103  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  104  	{
e521f087780d07 Mario Limonciello   2022-04-11  105  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  106  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  107  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  108  			DMI_MATCH(DMI_PRODUCT_NAME, "21CF"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  109  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  110  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  111  	{
e521f087780d07 Mario Limonciello   2022-04-11  112  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  113  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  114  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  115  			DMI_MATCH(DMI_PRODUCT_NAME, "21CG"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  116  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  117  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  118  	{
e521f087780d07 Mario Limonciello   2022-04-11  119  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  120  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  121  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  122  			DMI_MATCH(DMI_PRODUCT_NAME, "21CQ"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  123  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  124  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  125  	{
e521f087780d07 Mario Limonciello   2022-04-11  126  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  127  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  128  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  129  			DMI_MATCH(DMI_PRODUCT_NAME, "21CR"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  130  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  131  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  132  	{
e521f087780d07 Mario Limonciello   2022-04-11  133  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  134  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  135  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
be0aa8d4b0fcb4 syed sabakareem     2022-07-22  136  			DMI_MATCH(DMI_PRODUCT_NAME, "21CM"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  137  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  138  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  139  	{
e521f087780d07 Mario Limonciello   2022-04-11  140  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  141  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  142  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
be0aa8d4b0fcb4 syed sabakareem     2022-07-22  143  			DMI_MATCH(DMI_PRODUCT_NAME, "21CN"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  144  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  145  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  146  	{
e521f087780d07 Mario Limonciello   2022-04-11  147  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  148  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  149  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  150  			DMI_MATCH(DMI_PRODUCT_NAME, "21CH"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  151  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  152  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  153  	{
e521f087780d07 Mario Limonciello   2022-04-11  154  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  155  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  156  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  157  			DMI_MATCH(DMI_PRODUCT_NAME, "21CJ"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  158  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  159  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  160  	{
e521f087780d07 Mario Limonciello   2022-04-11  161  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  162  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  163  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  164  			DMI_MATCH(DMI_PRODUCT_NAME, "21CK"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  165  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  166  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  167  	{
e521f087780d07 Mario Limonciello   2022-04-11  168  		.driver_data = &acp6x_card,
fa991481b8b22a Vijendar Mukunda    2021-10-18  169  		.matches = {
fa991481b8b22a Vijendar Mukunda    2021-10-18  170  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  171  			DMI_MATCH(DMI_PRODUCT_NAME, "21CL"),
fa991481b8b22a Vijendar Mukunda    2021-10-18  172  		}
fa991481b8b22a Vijendar Mukunda    2021-10-18  173  	},
57d1e8900495cf Sicong Jiang        2023-05-31  174  	{
57d1e8900495cf Sicong Jiang        2023-05-31  175  		.driver_data = &acp6x_card,
57d1e8900495cf Sicong Jiang        2023-05-31  176  		.matches = {
57d1e8900495cf Sicong Jiang        2023-05-31  177  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
57d1e8900495cf Sicong Jiang        2023-05-31  178  			DMI_MATCH(DMI_PRODUCT_NAME, "21EF"),
57d1e8900495cf Sicong Jiang        2023-05-31  179  		}
57d1e8900495cf Sicong Jiang        2023-05-31  180  	},
c0fc96fed7ffa3 syed sabakareem     2022-08-02  181  	{
c0fc96fed7ffa3 syed sabakareem     2022-08-02  182  		.driver_data = &acp6x_card,
c0fc96fed7ffa3 syed sabakareem     2022-08-02  183  		.matches = {
c0fc96fed7ffa3 syed sabakareem     2022-08-02  184  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  185  			DMI_MATCH(DMI_PRODUCT_NAME, "21EM"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  186  		}
c0fc96fed7ffa3 syed sabakareem     2022-08-02  187  	},
c0fc96fed7ffa3 syed sabakareem     2022-08-02  188  	{
c0fc96fed7ffa3 syed sabakareem     2022-08-02  189  		.driver_data = &acp6x_card,
c0fc96fed7ffa3 syed sabakareem     2022-08-02  190  		.matches = {
c0fc96fed7ffa3 syed sabakareem     2022-08-02  191  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  192  			DMI_MATCH(DMI_PRODUCT_NAME, "21EN"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  193  		}
c0fc96fed7ffa3 syed sabakareem     2022-08-02  194  	},
a8f5da0bf4d85a Baishan Jiang       2023-04-12  195  	{
a8f5da0bf4d85a Baishan Jiang       2023-04-12  196  		.driver_data = &acp6x_card,
a8f5da0bf4d85a Baishan Jiang       2023-04-12  197  		.matches = {
a8f5da0bf4d85a Baishan Jiang       2023-04-12  198  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
a8f5da0bf4d85a Baishan Jiang       2023-04-12  199  			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
a8f5da0bf4d85a Baishan Jiang       2023-04-12  200  		}
a8f5da0bf4d85a Baishan Jiang       2023-04-12  201  	},
8f991eeead81d9 Johnny Hsieh        2024-02-26  202  	{
8f991eeead81d9 Johnny Hsieh        2024-02-26  203  		.driver_data = &acp6x_card,
8f991eeead81d9 Johnny Hsieh        2024-02-26  204  		.matches = {
8f991eeead81d9 Johnny Hsieh        2024-02-26  205  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
8f991eeead81d9 Johnny Hsieh        2024-02-26  206  			DMI_MATCH(DMI_PRODUCT_NAME, "21J0"),
8f991eeead81d9 Johnny Hsieh        2024-02-26  207  		}
8f991eeead81d9 Johnny Hsieh        2024-02-26  208  	}
c0fc96fed7ffa3 syed sabakareem     2022-08-02 @209  	{
c0fc96fed7ffa3 syed sabakareem     2022-08-02  210  		.driver_data = &acp6x_card,
c0fc96fed7ffa3 syed sabakareem     2022-08-02  211  		.matches = {
c0fc96fed7ffa3 syed sabakareem     2022-08-02  212  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  213  			DMI_MATCH(DMI_PRODUCT_NAME, "21J5"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  214  		}
c0fc96fed7ffa3 syed sabakareem     2022-08-02  215  	},
c0fc96fed7ffa3 syed sabakareem     2022-08-02  216  	{
c0fc96fed7ffa3 syed sabakareem     2022-08-02  217  		.driver_data = &acp6x_card,
c0fc96fed7ffa3 syed sabakareem     2022-08-02  218  		.matches = {
c0fc96fed7ffa3 syed sabakareem     2022-08-02  219  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  220  			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
c0fc96fed7ffa3 syed sabakareem     2022-08-02  221  		}
c0fc96fed7ffa3 syed sabakareem     2022-08-02  222  	},
1263cc0f414d21 August Wikerfors    2023-09-11  223  	{
1263cc0f414d21 August Wikerfors    2023-09-11  224  		.driver_data = &acp6x_card,
1263cc0f414d21 August Wikerfors    2023-09-11  225  		.matches = {
1263cc0f414d21 August Wikerfors    2023-09-11  226  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
1263cc0f414d21 August Wikerfors    2023-09-11  227  			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
1263cc0f414d21 August Wikerfors    2023-09-11  228  		}
1263cc0f414d21 August Wikerfors    2023-09-11  229  	},
cfff2a7794d23b Mario Limonciello   2023-09-06  230  	{
cfff2a7794d23b Mario Limonciello   2023-09-06  231  		.driver_data = &acp6x_card,
cfff2a7794d23b Mario Limonciello   2023-09-06  232  		.matches = {
cfff2a7794d23b Mario Limonciello   2023-09-06  233  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
cfff2a7794d23b Mario Limonciello   2023-09-06  234  			DMI_MATCH(DMI_PRODUCT_NAME, "82TL"),
cfff2a7794d23b Mario Limonciello   2023-09-06  235  		}
cfff2a7794d23b Mario Limonciello   2023-09-06  236  	},
1263cc0f414d21 August Wikerfors    2023-09-11  237  	{
1263cc0f414d21 August Wikerfors    2023-09-11  238  		.driver_data = &acp6x_card,
1263cc0f414d21 August Wikerfors    2023-09-11  239  		.matches = {
1263cc0f414d21 August Wikerfors    2023-09-11  240  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
1263cc0f414d21 August Wikerfors    2023-09-11  241  			DMI_MATCH(DMI_PRODUCT_NAME, "82UG"),
1263cc0f414d21 August Wikerfors    2023-09-11  242  		}
1263cc0f414d21 August Wikerfors    2023-09-11  243  	},
f7fe85b229bc30 Attila Tőkés        2024-02-10  244  	{
f7fe85b229bc30 Attila Tőkés        2024-02-10  245  		.driver_data = &acp6x_card,
f7fe85b229bc30 Attila Tőkés        2024-02-10  246  		.matches = {
f7fe85b229bc30 Attila Tőkés        2024-02-10  247  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
f7fe85b229bc30 Attila Tőkés        2024-02-10  248  			DMI_MATCH(DMI_PRODUCT_NAME, "82UU"),
f7fe85b229bc30 Attila Tőkés        2024-02-10  249  		}
f7fe85b229bc30 Attila Tőkés        2024-02-10  250  	},
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  251  	{
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  252  		.driver_data = &acp6x_card,
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  253  		.matches = {
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  254  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
c008323fe361bd Mario Limonciello   2023-08-23  255  			DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  256  		}
2232b2dd8cd4f1 Mario Limonciello   2022-09-20  257  	},
1948fa64727685 Sven Frotscher      2023-09-28  258  	{
1948fa64727685 Sven Frotscher      2023-09-28  259  		.driver_data = &acp6x_card,
1948fa64727685 Sven Frotscher      2023-09-28  260  		.matches = {
1948fa64727685 Sven Frotscher      2023-09-28  261  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
1948fa64727685 Sven Frotscher      2023-09-28  262  			DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
1948fa64727685 Sven Frotscher      2023-09-28  263  		}
1948fa64727685 Sven Frotscher      2023-09-28  264  	},
610010737f7448 Mario Limonciello   2024-02-05  265  	{
610010737f7448 Mario Limonciello   2024-02-05  266  		.driver_data = &acp6x_card,
610010737f7448 Mario Limonciello   2024-02-05  267  		.matches = {
610010737f7448 Mario Limonciello   2024-02-05  268  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
610010737f7448 Mario Limonciello   2024-02-05  269  			DMI_MATCH(DMI_PRODUCT_NAME, "83AS"),
610010737f7448 Mario Limonciello   2024-02-05  270  		}
610010737f7448 Mario Limonciello   2024-02-05  271  	},
4df5b13dec9e1b Xiaoyan Li          2022-09-20  272  	{
4df5b13dec9e1b Xiaoyan Li          2022-09-20  273  		.driver_data = &acp6x_card,
4df5b13dec9e1b Xiaoyan Li          2022-09-20  274  		.matches = {
4df5b13dec9e1b Xiaoyan Li          2022-09-20  275  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
4df5b13dec9e1b Xiaoyan Li          2022-09-20  276  			DMI_MATCH(DMI_PRODUCT_NAME, "UM5302TA"),
4df5b13dec9e1b Xiaoyan Li          2022-09-20  277  		}
4df5b13dec9e1b Xiaoyan Li          2022-09-20  278  	},
a0dd7fcab5cd22 Aniol Martí         2022-12-27  279  	{
a0dd7fcab5cd22 Aniol Martí         2022-12-27  280  		.driver_data = &acp6x_card,
a0dd7fcab5cd22 Aniol Martí         2022-12-27  281  		.matches = {
a0dd7fcab5cd22 Aniol Martí         2022-12-27  282  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
a0dd7fcab5cd22 Aniol Martí         2022-12-27  283  			DMI_MATCH(DMI_PRODUCT_NAME, "M5402RA"),
a0dd7fcab5cd22 Aniol Martí         2022-12-27  284  		}
a0dd7fcab5cd22 Aniol Martí         2022-12-27  285  	},
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  286  	{
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  287  		.driver_data = &acp6x_card,
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  288  		.matches = {
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  289  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  290  			DMI_MATCH(DMI_PRODUCT_NAME, "M6400RC"),
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  291  		}
4a1b5bc73e9ce8 Andrey Rakhmatullin 2023-05-01  292  	},
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  293  	{
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  294  		.driver_data = &acp6x_card,
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  295  		.matches = {
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  296  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  297  			DMI_MATCH(DMI_PRODUCT_NAME, "M3402RA"),
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  298  		}
110ccfa9dd6ca1 Enrico Belleri      2023-04-27  299  	},
3b1f08833c45d0 BrenoRCBrito        2023-08-18  300  	{
3b1f08833c45d0 BrenoRCBrito        2023-08-18  301  		.driver_data = &acp6x_card,
3b1f08833c45d0 BrenoRCBrito        2023-08-18  302  		.matches = {
3b1f08833c45d0 BrenoRCBrito        2023-08-18  303  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
3b1f08833c45d0 BrenoRCBrito        2023-08-18  304  			DMI_MATCH(DMI_PRODUCT_NAME, "M6500RC"),
3b1f08833c45d0 BrenoRCBrito        2023-08-18  305  		}
3b1f08833c45d0 BrenoRCBrito        2023-08-18  306  	},
b24e3590c94ab0 Malcolm Hart        2023-11-27  307  	{
b24e3590c94ab0 Malcolm Hart        2023-11-27  308  		.driver_data = &acp6x_card,
b24e3590c94ab0 Malcolm Hart        2023-11-27  309  		.matches = {
b24e3590c94ab0 Malcolm Hart        2023-11-27  310  			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
b24e3590c94ab0 Malcolm Hart        2023-11-27  311  			DMI_MATCH(DMI_PRODUCT_NAME, "E1504FA"),
b24e3590c94ab0 Malcolm Hart        2023-11-27  312  		}
b24e3590c94ab0 Malcolm Hart        2023-11-27  313  	},
e616a916fe8431 Walt Holman         2023-09-10  314  	{
e616a916fe8431 Walt Holman         2023-09-10  315  		.driver_data = &acp6x_card,
e616a916fe8431 Walt Holman         2023-09-10  316  		.matches = {
e616a916fe8431 Walt Holman         2023-09-10  317  			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
e616a916fe8431 Walt Holman         2023-09-10  318  			DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 15 B7ED"),
e616a916fe8431 Walt Holman         2023-09-10  319  		}
e616a916fe8431 Walt Holman         2023-09-10  320  	},
c6dce23ec993f7 Techno Mooney       2024-01-29  321  	{
c6dce23ec993f7 Techno Mooney       2024-01-29  322  		.driver_data = &acp6x_card,
c6dce23ec993f7 Techno Mooney       2024-01-29  323  		.matches = {
c6dce23ec993f7 Techno Mooney       2024-01-29  324  			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
c6dce23ec993f7 Techno Mooney       2024-01-29  325  			DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 15 C7VF"),
c6dce23ec993f7 Techno Mooney       2024-01-29  326  		}
c6dce23ec993f7 Techno Mooney       2024-01-29  327  	},
d40b6529c6269c Brent Mendelsohn    2022-10-24  328  	{
d40b6529c6269c Brent Mendelsohn    2022-10-24  329  		.driver_data = &acp6x_card,
d40b6529c6269c Brent Mendelsohn    2022-10-24  330  		.matches = {
d40b6529c6269c Brent Mendelsohn    2022-10-24  331  			DMI_MATCH(DMI_BOARD_VENDOR, "Alienware"),
d40b6529c6269c Brent Mendelsohn    2022-10-24  332  			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
d40b6529c6269c Brent Mendelsohn    2022-10-24  333  		}
d40b6529c6269c Brent Mendelsohn    2022-10-24  334  	},
c1dd6bf6199752 Artem Lukyanov      2022-11-30  335  	{
c1dd6bf6199752 Artem Lukyanov      2022-11-30  336  		.driver_data = &acp6x_card,
c1dd6bf6199752 Artem Lukyanov      2022-11-30  337  		.matches = {
c1dd6bf6199752 Artem Lukyanov      2022-11-30  338  			DMI_MATCH(DMI_BOARD_VENDOR, "TIMI"),
c1dd6bf6199752 Artem Lukyanov      2022-11-30  339  			DMI_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
c1dd6bf6199752 Artem Lukyanov      2022-11-30  340  		}
c1dd6bf6199752 Artem Lukyanov      2022-11-30  341  	},
dcff8b7ca92d72 fengwk              2023-01-22  342  	{
dcff8b7ca92d72 fengwk              2023-01-22  343  		.driver_data = &acp6x_card,
dcff8b7ca92d72 fengwk              2023-01-22  344  		.matches = {
dcff8b7ca92d72 fengwk              2023-01-22  345  			DMI_MATCH(DMI_BOARD_VENDOR, "TIMI"),
dcff8b7ca92d72 fengwk              2023-01-22  346  			DMI_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 15 2022"),
dcff8b7ca92d72 fengwk              2023-01-22  347  		}
dcff8b7ca92d72 fengwk              2023-01-22  348  	},
68506a173dd700 Wim Van Boven       2022-12-16  349  	{
68506a173dd700 Wim Van Boven       2022-12-16  350  		.driver_data = &acp6x_card,
68506a173dd700 Wim Van Boven       2022-12-16  351  		.matches = {
68506a173dd700 Wim Van Boven       2022-12-16  352  			DMI_MATCH(DMI_BOARD_VENDOR, "Razer"),
68506a173dd700 Wim Van Boven       2022-12-16  353  			DMI_MATCH(DMI_PRODUCT_NAME, "Blade 14 (2022) - RZ09-0427"),
68506a173dd700 Wim Van Boven       2022-12-16  354  		}
68506a173dd700 Wim Van Boven       2022-12-16  355  	},
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  356  	{
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  357  		.driver_data = &acp6x_card,
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  358  		.matches = {
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  359  			DMI_MATCH(DMI_BOARD_VENDOR, "RB"),
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  360  			DMI_MATCH(DMI_PRODUCT_NAME, "Swift SFA16-41"),
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  361  		}
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  362  	},
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  363  	{
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  364  		.driver_data = &acp6x_card,
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  365  		.matches = {
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  366  			DMI_MATCH(DMI_BOARD_VENDOR, "IRBIS"),
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  367  			DMI_MATCH(DMI_PRODUCT_NAME, "15NBC1011"),
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  368  		}
7fd26a27680aa9 Syed Saba Kareem    2023-01-11  369  	},
22ce6843abec19 Joseph Hunkeler     2023-02-16  370  	{
22ce6843abec19 Joseph Hunkeler     2023-02-16  371  		.driver_data = &acp6x_card,
22ce6843abec19 Joseph Hunkeler     2023-02-16  372  		.matches = {
22ce6843abec19 Joseph Hunkeler     2023-02-16  373  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
22ce6843abec19 Joseph Hunkeler     2023-02-16  374  			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16z-n000"),
22ce6843abec19 Joseph Hunkeler     2023-02-16  375  		}
22ce6843abec19 Joseph Hunkeler     2023-02-16  376  	},
ee4281de4d6028 Prajna Sariputra    2023-04-02  377  	{
ee4281de4d6028 Prajna Sariputra    2023-04-02  378  		.driver_data = &acp6x_card,
ee4281de4d6028 Prajna Sariputra    2023-04-02  379  		.matches = {
ee4281de4d6028 Prajna Sariputra    2023-04-02  380  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
ee4281de4d6028 Prajna Sariputra    2023-04-02  381  			DMI_MATCH(DMI_BOARD_NAME, "8A42"),
ee4281de4d6028 Prajna Sariputra    2023-04-02  382  		}
ee4281de4d6028 Prajna Sariputra    2023-04-02  383  	},
d52279d5c9204a Duc Anh Le          2023-02-28  384  	{
d52279d5c9204a Duc Anh Le          2023-02-28  385  		.driver_data = &acp6x_card,
d52279d5c9204a Duc Anh Le          2023-02-28  386  		.matches = {
d52279d5c9204a Duc Anh Le          2023-02-28  387  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
d52279d5c9204a Duc Anh Le          2023-02-28  388  			DMI_MATCH(DMI_BOARD_NAME, "8A43"),
d52279d5c9204a Duc Anh Le          2023-02-28  389  		}
d52279d5c9204a Duc Anh Le          2023-02-28  390  	},
205efd4619b860 Ge-org Brohammer    2023-03-17  391  	{
205efd4619b860 Ge-org Brohammer    2023-03-17  392  		.driver_data = &acp6x_card,
205efd4619b860 Ge-org Brohammer    2023-03-17  393  		.matches = {
205efd4619b860 Ge-org Brohammer    2023-03-17  394  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
205efd4619b860 Ge-org Brohammer    2023-03-17  395  			DMI_MATCH(DMI_BOARD_NAME, "8A22"),
205efd4619b860 Ge-org Brohammer    2023-03-17  396  		}
205efd4619b860 Ge-org Brohammer    2023-03-17  397  	},
d1cf5d30b43f1a Shubh               2023-09-02  398  	{
d1cf5d30b43f1a Shubh               2023-09-02  399  		.driver_data = &acp6x_card,
d1cf5d30b43f1a Shubh               2023-09-02  400  		.matches = {
d1cf5d30b43f1a Shubh               2023-09-02  401  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
d1cf5d30b43f1a Shubh               2023-09-02  402  			DMI_MATCH(DMI_BOARD_NAME, "8A3E"),
d1cf5d30b43f1a Shubh               2023-09-02  403  		}
d1cf5d30b43f1a Shubh               2023-09-02  404  	},
0c6498a59fbbcb Matus Malych        2023-11-12  405  	{
0c6498a59fbbcb Matus Malych        2023-11-12  406  		.driver_data = &acp6x_card,
0c6498a59fbbcb Matus Malych        2023-11-12  407  		.matches = {
0c6498a59fbbcb Matus Malych        2023-11-12  408  			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
0c6498a59fbbcb Matus Malych        2023-11-12  409  			DMI_MATCH(DMI_BOARD_NAME, "8B2F"),
0c6498a59fbbcb Matus Malych        2023-11-12  410  		}
0c6498a59fbbcb Matus Malych        2023-11-12  411  	},
deeb7855f5d7e2 Rsplwe              2023-05-11  412  	{
deeb7855f5d7e2 Rsplwe              2023-05-11  413  		.driver_data = &acp6x_card,
deeb7855f5d7e2 Rsplwe              2023-05-11  414  		.matches = {
deeb7855f5d7e2 Rsplwe              2023-05-11  415  			DMI_MATCH(DMI_BOARD_VENDOR, "MECHREVO"),
deeb7855f5d7e2 Rsplwe              2023-05-11  416  			DMI_MATCH(DMI_BOARD_NAME, "MRID6"),
deeb7855f5d7e2 Rsplwe              2023-05-11  417  		}
deeb7855f5d7e2 Rsplwe              2023-05-11  418  	},
7b9891ad25246b Jeremy Soller       2023-05-05  419  	{
7b9891ad25246b Jeremy Soller       2023-05-05  420  		.driver_data = &acp6x_card,
7b9891ad25246b Jeremy Soller       2023-05-05  421  		.matches = {
7b9891ad25246b Jeremy Soller       2023-05-05  422  			DMI_MATCH(DMI_BOARD_VENDOR, "System76"),
7b9891ad25246b Jeremy Soller       2023-05-05  423  			DMI_MATCH(DMI_PRODUCT_VERSION, "pang12"),
7b9891ad25246b Jeremy Soller       2023-05-05  424  		}
7b9891ad25246b Jeremy Soller       2023-05-05  425  	},
19650c0f402f53 Jeremy Soller       2023-11-27  426  	{
19650c0f402f53 Jeremy Soller       2023-11-27  427  		.driver_data = &acp6x_card,
19650c0f402f53 Jeremy Soller       2023-11-27  428  		.matches = {
19650c0f402f53 Jeremy Soller       2023-11-27  429  			DMI_MATCH(DMI_BOARD_VENDOR, "System76"),
19650c0f402f53 Jeremy Soller       2023-11-27  430  			DMI_MATCH(DMI_PRODUCT_VERSION, "pang13"),
19650c0f402f53 Jeremy Soller       2023-11-27  431  		}
19650c0f402f53 Jeremy Soller       2023-11-27  432  	},
fa991481b8b22a Vijendar Mukunda    2021-10-18  433  	{}
fa991481b8b22a Vijendar Mukunda    2021-10-18  434  };
fa991481b8b22a Vijendar Mukunda    2021-10-18  435  

:::::: The code at line 209 was first introduced by commit
:::::: c0fc96fed7ffa3e58f58b9cdb7158b5c61e026a2 ASoC: amd: yc: Update DMI table entries for AMD platforms

:::::: TO: syed sabakareem <Syed.SabaKareem@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
