Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA22B29CFB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 20:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727643316; cv=none; b=meqHNxuB06YmwULtlzgJionCNy599LnXjcJ56rWqJcJhQNehtS8BdhAexgqgUGSE71iddVE5kDsMFTdzKDW3uGIE50RqE+73cId5twcnItwCWBe9h9sElHfiiVko1T4OHZ+4p6+2Rr5Do6C+io/+40cDpF5VeL16Ndxh1KpmyH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727643316; c=relaxed/simple;
	bh=MQyz8xjI53NiJgwG+yxpvVJliHTJ76tvX2S4vzr9CDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGYp1HdO6IPHCQ+EflRf/BB6Y1aATguno/6G/ufksnnP26FBoZYjhXigCoS/6mP8Y1B7CD6Eg/UUsB/NPvVVRG2x/RVdFjfT+3/m2q76uxMXfUpKSQfoEUawtVX/nm1QrewuLV9ruRl81LBEgEvLrKh4VvRMkhKLkPxKzLnKU3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLXBxWLU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLXBxWLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727643315; x=1759179315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MQyz8xjI53NiJgwG+yxpvVJliHTJ76tvX2S4vzr9CDU=;
  b=hLXBxWLUSRiaeRy7j+x3O7rkaK1Fw+xVTP65A/oor/6tF8fpbF3amBXT
   I3gMiJG6xom9FiAu/bDBFRom30H57UqZEY4FKBw0Bbr7PDbdDxcEbFhgl
   HiwidXC0AKXB+VugpRUMniY5R4PLZFRipy8NFgjhnvOPhKjfT1y7be1za
   wr0iIOrpLBcBGRGTsy1gnffcXrdtZvy4M1TVzbTks/5sByMHeXgYg8btA
   IrRsntgJtY9CNqn0qRekcYEAfs3GpyMvbD4lqofErrrZWgTD5WvxbED3o
   mfn/QJw9eqqSS8H/Ocy7HHQv+EnakGmYk3RGLF/3D11je4XGD9L1RqOl3
   Q==;
X-CSE-ConnectionGUID: yqkc9i6hStyWZllRoyUlAw==
X-CSE-MsgGUID: 11f9A5ovQ0un9NF+RxLs6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="44184511"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="44184511"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 13:55:14 -0700
X-CSE-ConnectionGUID: jlZg5pjBRFKM6TzmbS6cUA==
X-CSE-MsgGUID: B42chpqaRniCQI0VojOfMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73238622"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Sep 2024 13:55:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv0wh-000OiJ-0F;
	Sun, 29 Sep 2024 20:55:11 +0000
Date: Mon, 30 Sep 2024 04:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 11979/16788]
 sound/soc/fsl/fsl_mqs.c:63: warning: Function parameter or member 'mode' not
 described in 'fsl_mqs_soc_data'
Message-ID: <202409300451.RQCaLcA5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 51ebc87e360f0aec6eed449c3990a6016973689b [11979/16788] LF-12024-1: ASoC: fsl_mqs: Add fsl,mqs-ctrl property
config: i386-buildonly-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240930/202409300451.RQCaLcA5-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300451.RQCaLcA5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300451.RQCaLcA5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/fsl_mqs.c:63: warning: Function parameter or member 'mode' not described in 'fsl_mqs_soc_data'


vim +63 sound/soc/fsl/fsl_mqs.c

51ebc87e360f0a Shengjiu Wang 2024-03-22  37  
063c915502b914 Shengjiu Wang 2022-05-25  38  /**
063c915502b914 Shengjiu Wang 2022-05-25  39   * struct fsl_mqs_soc_data - soc specific data
063c915502b914 Shengjiu Wang 2022-05-25  40   *
063c915502b914 Shengjiu Wang 2022-05-25  41   * @use_gpr: control register is in General Purpose Register group
063c915502b914 Shengjiu Wang 2022-05-25  42   * @ctrl_off: control register offset
063c915502b914 Shengjiu Wang 2022-05-25  43   * @en_mask: enable bit mask
063c915502b914 Shengjiu Wang 2022-05-25  44   * @en_shift: enable bit shift
063c915502b914 Shengjiu Wang 2022-05-25  45   * @rst_mask: reset bit mask
063c915502b914 Shengjiu Wang 2022-05-25  46   * @rst_shift: reset bit shift
063c915502b914 Shengjiu Wang 2022-05-25  47   * @osr_mask: oversample bit mask
063c915502b914 Shengjiu Wang 2022-05-25  48   * @osr_shift: oversample bit shift
063c915502b914 Shengjiu Wang 2022-05-25  49   * @div_mask: clock divider mask
063c915502b914 Shengjiu Wang 2022-05-25  50   * @div_shift: clock divider bit shift
063c915502b914 Shengjiu Wang 2022-05-25  51   */
063c915502b914 Shengjiu Wang 2022-05-25  52  struct fsl_mqs_soc_data {
51ebc87e360f0a Shengjiu Wang 2024-03-22  53  	int  mode;
063c915502b914 Shengjiu Wang 2022-05-25  54  	int  ctrl_off;
063c915502b914 Shengjiu Wang 2022-05-25  55  	int  en_mask;
063c915502b914 Shengjiu Wang 2022-05-25  56  	int  en_shift;
063c915502b914 Shengjiu Wang 2022-05-25  57  	int  rst_mask;
063c915502b914 Shengjiu Wang 2022-05-25  58  	int  rst_shift;
063c915502b914 Shengjiu Wang 2022-05-25  59  	int  osr_mask;
063c915502b914 Shengjiu Wang 2022-05-25  60  	int  osr_shift;
063c915502b914 Shengjiu Wang 2022-05-25  61  	int  div_mask;
063c915502b914 Shengjiu Wang 2022-05-25  62  	int  div_shift;
063c915502b914 Shengjiu Wang 2022-05-25 @63  };
063c915502b914 Shengjiu Wang 2022-05-25  64  

:::::: The code at line 63 was first introduced by commit
:::::: 063c915502b914a5a621458c763dfc28286f7606 ASoC: fsl_mqs: simplify the code with adding fsl_mqs_soc_data

:::::: TO: Shengjiu Wang <shengjiu.wang@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
