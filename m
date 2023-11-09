Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517F1DFD2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 22:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+7BZZKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699570185; x=1731106185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IuY/yThSbLC9rBCoSzHrfMhJyO7for95xikYDFq6HkM=;
  b=k+7BZZKZeW/RXFg6pOwe3ZhZoH8frZN96wSkUUJLVWn2+vE/uGCSQoxw
   SS61357v9fI00Z4MdScBWEY6bgVkxwdq5eijFqjHhl7Sae0zRl9Bmev9G
   WWTwEXPDr1CwgqVFxAlRz9lg+onHQ8d8RARXoafjQ10pdTZAt54pg0wLo
   XICDofte9CAIpFQAgFJfmMX/Siciyu3rSLQuMBY1TPKUbaoCstnKUwVYu
   vZDzZJ8rX+OgMaFpKLZfYeZm1CRFSEJRSvPPG8ifPT4upemaIW2B4IiXw
   VZNgTRM+8vVfH8IshdZHPC9mZ4E2+ZwT2lmEcFlnik4AflK2GNm8/hzQj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454391164"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="454391164"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="1010769082"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="1010769082"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Nov 2023 14:49:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1DqH-0009EU-04;
	Thu, 09 Nov 2023 22:49:41 +0000
Date: Fri, 10 Nov 2023 06:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 77/79]
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c:1124:28: warning:
 'mt8186_mt6366_rt5650_soc_card' defined but not used
Message-ID: <202311100655.vjF5sizU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   c95b3fff2238809f2d97a13002b013538e40fd25
commit: abe14b7bd799ded2ea52619ed42a9a9e79b02eb0 [77/79] FROMGIT: ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650 support
config: x86_64-buildonly-randconfig-005-20231110 (https://download.01.org/0day-ci/archive/20231110/202311100655.vjF5sizU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100655.vjF5sizU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100655.vjF5sizU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c:1124:28: warning: 'mt8186_mt6366_rt5650_soc_card' defined but not used [-Wunused-variable]
    1124 | static struct snd_soc_card mt8186_mt6366_rt5650_soc_card = {
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c:1109:28: warning: 'mt8186_mt6366_rt5682s_max98360_soc_card' defined but not used [-Wunused-variable]
    1109 | static struct snd_soc_card mt8186_mt6366_rt5682s_max98360_soc_card = {
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c:1094:28: warning: 'mt8186_mt6366_rt1019_rt5682s_soc_card' defined but not used [-Wunused-variable]
    1094 | static struct snd_soc_card mt8186_mt6366_rt1019_rt5682s_soc_card = {
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mt8186_mt6366_rt5650_soc_card +1124 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c

  1123	
> 1124	static struct snd_soc_card mt8186_mt6366_rt5650_soc_card = {
  1125		.name = "mt8186_rt5650",
  1126		.owner = THIS_MODULE,
  1127		.dai_link = mt8186_mt6366_rt1019_rt5682s_dai_links,
  1128		.num_links = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links),
  1129		.controls = mt8186_mt6366_rt1019_rt5682s_controls,
  1130		.num_controls = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_controls),
  1131		.dapm_widgets = mt8186_mt6366_rt1019_rt5682s_widgets,
  1132		.num_dapm_widgets = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_widgets),
  1133		.dapm_routes = mt8186_mt6366_rt5650_routes,
  1134		.num_dapm_routes = ARRAY_SIZE(mt8186_mt6366_rt5650_routes),
  1135		.codec_conf = mt8186_mt6366_rt1019_rt5682s_codec_conf,
  1136		.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
  1137	};
  1138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
