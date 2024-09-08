Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D421366
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725784435; cv=none; b=SbxlrBek4GdvrxB38llZivWSTVH3bCJbATJytyyDesVc3qJeQoO0SPdQohqpVL7w/L5fDqY89QbgNZYC0neE2J6gpwK6nod8/ynorY+8GqawkgimW9ZSwCfZ6tTUrZBqjpYNga3OZP8MrYlAxwpbqE6fMP2JH9UUnYR4ayDrAL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725784435; c=relaxed/simple;
	bh=N3vqVyZIfIDJiRicknhZKFEyqFNu8HXSax4FU3EUiis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fR6eZwqqdi9+85/3xOFMtQnunxazxBd5nVX9PHNWz2QBBuPjnLwjHnn9m3L4/loy80OqIySTrMrh9G4srDCqxaw9/nE0pQtLQkNP9yPCJ1Z4r9dEYjfnCPWuBhxWFik0F7qCYYa/v3x1wbetzUugMbXZYJZZACx50qHAa/ArZm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lx0hdNCR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lx0hdNCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725784431; x=1757320431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N3vqVyZIfIDJiRicknhZKFEyqFNu8HXSax4FU3EUiis=;
  b=lx0hdNCRhbl5doCNGapcBeI0mMHpLAhFxPsUQ36yTYAg84fbiFxdn2vA
   iLLXRBf3wSj14WwPSI27ILb7dqZ/TDkNfAKWYSgwNTjd9lVD+jXlBMyG8
   UnwzSqEz0/nd7MlGMR3WeO7183jM6xKzLCYeBky9cX5JACsdIFgvUHhX+
   JmR08FFGGHXWgtouecys9dh813c18TyFJQd8vqmpYTZH5RdFEY2OcAWjM
   Iv7qHLsCV7ion3uljz8FHvTax2mBA04txOPz0q0qRWGHBfKVDEZMe0yfo
   ysLt2kR2+RpZIPaoP0IxAhJ98Lmj0y9DWB3wClwktbtk4dGbN/Taq0dEx
   A==;
X-CSE-ConnectionGUID: vWSL3HipRZGlqJHPBKFbKQ==
X-CSE-MsgGUID: LMhrq9QZTjiIyZJuBHrcaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="23992691"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="23992691"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 01:33:49 -0700
X-CSE-ConnectionGUID: RB5dvTubRpS74dkqzYHd6A==
X-CSE-MsgGUID: g+H9DQuERzW8k/xNRVNY3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66012349"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2024 01:33:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snDMg-000DMJ-0g;
	Sun, 08 Sep 2024 08:33:46 +0000
Date: Sun, 8 Sep 2024 16:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:asoc-fix-mt8365-build 17/17]
 sound/soc/mediatek/mt8365/mt8365-reg.h:952:41: error: implicit declaration
 of function 'FIELD_PREP'
Message-ID: <202409081634.LL3eZu3N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-fix-mt8365-build
head:   6e1282d0de699bce314a7e613af2cdd4df42ebbb
commit: 6e1282d0de699bce314a7e613af2cdd4df42ebbb [17/17] ASoC: mt8365: Allow build coverage
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240908/202409081634.LL3eZu3N-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409081634.LL3eZu3N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409081634.LL3eZu3N-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/mediatek/mt8365/mt8365-afe-common.h:19,
                    from sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:18:
   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c: In function 'mt8365_afe_cm2_mux_conn':
>> sound/soc/mediatek/mt8365/mt8365-reg.h:952:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     952 | #define CM2_AFE_CM2_CONN_CFG1(x)        FIELD_PREP(CM2_AFE_CM2_CONN_CFG1_MASK, (x))
         |                                         ^~~~~~~~~~
   sound/soc/mediatek/mt8365/mt8365-afe-pcm.c:280:28: note: in expansion of macro 'CM2_AFE_CM2_CONN_CFG1'
     280 |                            CM2_AFE_CM2_CONN_CFG1(TDM_IN_CH0));
         |                            ^~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/mediatek/mt8365/mt8365-dai-adda.c: In function 'mt8365_dai_set_adda_out':
>> sound/soc/mediatek/mt8365/mt8365-dai-adda.c:30:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      30 |         val |= FIELD_PREP(AFE_ADDA_DL_SAMPLING_RATE,
         |                ^~~~~~~~~~
--
   sound/soc/mediatek/mt8365/mt8365-dai-dmic.c: In function 'mt8365_dai_configure_dmic':
>> sound/soc/mediatek/mt8365/mt8365-dai-dmic.c:134:24: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     134 |                 val |= FIELD_PREP(DMIC_TOP_CON_CK_PHASE_SEL_CH1,
         |                        ^~~~~~~~~~
--
   sound/soc/mediatek/mt8365/mt8365-dai-i2s.c: In function 'mt8365_dai_set_config':
>> sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:294:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     294 |         val |= FIELD_PREP(AFE_I2S_CON_RATE_MASK, fs);
         |                ^~~~~~~~~~
   In file included from sound/soc/mediatek/mt8365/mt8365-afe-common.h:16,
                    from sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:14:
   sound/soc/mediatek/mt8365/mt8365-dai-i2s.c: At top level:
   sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:785:33: warning: 'mt8365_i2s_enum' defined but not used [-Wunused-const-variable=]
     785 | static SOC_ENUM_SINGLE_EXT_DECL(mt8365_i2s_enum, mt8365_i2s_hd_str);
         |                                 ^~~~~~~~~~~~~~~
   include/sound/soc.h:411:31: note: in definition of macro 'SOC_ENUM_SINGLE_EXT_DECL'
     411 |         const struct soc_enum name = SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(xtexts), xtexts)
         |                               ^~~~
--
   sound/soc/mediatek/mt8365/mt8365-dai-pcm.c: In function 'mt8365_dai_configure_pcm1':
>> sound/soc/mediatek/mt8365/mt8365-dai-pcm.c:69:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      69 |         val |= FIELD_PREP(PCM_INTF_CON1_FORMAT_MASK, fmt);
         |                ^~~~~~~~~~


vim +/FIELD_PREP +952 sound/soc/mediatek/mt8365/mt8365-reg.h

38c7c9ddc74033 Alexandre Mergnat 2024-07-22  950  
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  951  /* AFE_CM2_CONN* */
38c7c9ddc74033 Alexandre Mergnat 2024-07-22 @952  #define CM2_AFE_CM2_CONN_CFG1(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG1_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  953  #define CM2_AFE_CM2_CONN_CFG1_MASK	GENMASK(4, 0)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  954  #define CM2_AFE_CM2_CONN_CFG2(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG2_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  955  #define CM2_AFE_CM2_CONN_CFG2_MASK	GENMASK(9, 5)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  956  #define CM2_AFE_CM2_CONN_CFG3(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG3_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  957  #define CM2_AFE_CM2_CONN_CFG3_MASK	GENMASK(14, 10)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  958  #define CM2_AFE_CM2_CONN_CFG4(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG4_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  959  #define CM2_AFE_CM2_CONN_CFG4_MASK	GENMASK(19, 15)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  960  #define CM2_AFE_CM2_CONN_CFG5(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG5_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  961  #define CM2_AFE_CM2_CONN_CFG5_MASK	GENMASK(24, 20)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  962  #define CM2_AFE_CM2_CONN_CFG6(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG6_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  963  #define CM2_AFE_CM2_CONN_CFG6_MASK	GENMASK(29, 25)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  964  #define CM2_AFE_CM2_CONN_CFG7(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG7_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  965  #define CM2_AFE_CM2_CONN_CFG7_MASK	GENMASK(4, 0)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  966  #define CM2_AFE_CM2_CONN_CFG8(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG8_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  967  #define CM2_AFE_CM2_CONN_CFG8_MASK	GENMASK(9, 5)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  968  #define CM2_AFE_CM2_CONN_CFG9(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG9_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  969  #define CM2_AFE_CM2_CONN_CFG9_MASK	GENMASK(14, 10)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  970  #define CM2_AFE_CM2_CONN_CFG10(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG10_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  971  #define CM2_AFE_CM2_CONN_CFG10_MASK	GENMASK(19, 15)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  972  #define CM2_AFE_CM2_CONN_CFG11(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG11_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  973  #define CM2_AFE_CM2_CONN_CFG11_MASK	GENMASK(24, 20)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  974  #define CM2_AFE_CM2_CONN_CFG12(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG12_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  975  #define CM2_AFE_CM2_CONN_CFG12_MASK	GENMASK(29, 25)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  976  #define CM2_AFE_CM2_CONN_CFG13(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG13_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  977  #define CM2_AFE_CM2_CONN_CFG13_MASK	GENMASK(4, 0)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  978  #define CM2_AFE_CM2_CONN_CFG14(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG14_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  979  #define CM2_AFE_CM2_CONN_CFG14_MASK	GENMASK(9, 5)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  980  #define CM2_AFE_CM2_CONN_CFG15(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG15_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  981  #define CM2_AFE_CM2_CONN_CFG15_MASK	GENMASK(14, 10)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  982  #define CM2_AFE_CM2_CONN_CFG16(x)	FIELD_PREP(CM2_AFE_CM2_CONN_CFG16_MASK, (x))
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  983  #define CM2_AFE_CM2_CONN_CFG16_MASK	GENMASK(19, 15)
38c7c9ddc74033 Alexandre Mergnat 2024-07-22  984  

:::::: The code at line 952 was first introduced by commit
:::::: 38c7c9ddc74033406461d64e541bbc8268e77f73 ASoC: mediatek: mt8365: Add common header

:::::: TO: Alexandre Mergnat <amergnat@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
