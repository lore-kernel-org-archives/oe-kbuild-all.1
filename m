Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DD6171AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 06:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719383433; cv=none; b=sxwdxueteYGas8YtPwTPuM+KW5wyJn+S2rVw5Jx66i3K5s2ZwDJvZaQr51XOg3o1ceT3PCF50fqgreUtfFiH0rEvjFWLvZYmZLqiz+1JoyYfs9zwHiWSMlkTOYS7LUSL/qzIqkaI6xbGDoQjaAFeZ3C53W1bn2q4t9n2/C9igi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719383433; c=relaxed/simple;
	bh=uC+ZeK3zcInntRLTsAGB+IY++zdE9TgaHBcGA6aMNMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fUppjxXOK708ss8DRybvzQzAdUUtB338SSRoEo9L6nxMEnfgbAS8FXLK/bChq7zMk3p5GDj3VHNeIu3rpbAaFxnondRl4Df/Dku1UmkheOe/1ZsTQBBUwH3xqZauMzIesZQvBh/1NXSRRxmL6Sqttcv3QaCE9xYXsOPi16ZfxWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsW1Pud2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsW1Pud2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719383432; x=1750919432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uC+ZeK3zcInntRLTsAGB+IY++zdE9TgaHBcGA6aMNMA=;
  b=YsW1Pud2sIoGXgEqjlBGvrYMUBgTe5zumF/X8e5buT83R/MOHPl7kOYc
   jq6pJK5w7uloccbhlo4diUZ5YEGD3TpEz2ShmEDQzNtOUwt5FTROsVGQk
   Muz6XKipyhYxVz5W5xcPORTSr5FcLAUBpeVZik8DEsF0aO4qzdJCo5cAu
   fbuz5tdite8ATyYiKlvD6VgUgl1pBrLGyY47I/JMNseWRD4ZaOkFvP06Z
   /V0bkFrHEI06zTfYd4XTkrUjSiZpLyu9PqD0DJfwUkZEPY+Ar0wQBQR69
   +f1XRkG5uFoKtIzK5YSGZ8j66OHsAIgEzPUI3KeHJh1CUCMy9N/576DIs
   A==;
X-CSE-ConnectionGUID: Vrw3nCmgQnuMmKTFmNTIKQ==
X-CSE-MsgGUID: 7J0hhXSNSI6IgG4w8E7/Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16662879"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16662879"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 23:30:31 -0700
X-CSE-ConnectionGUID: IN/bD3BgTf2+nWfQ0e0Dhw==
X-CSE-MsgGUID: Lbg+b9ztSsumvOUujU+EmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="75103616"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Jun 2024 23:30:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMMAl-000F3a-0g;
	Wed, 26 Jun 2024 06:30:27 +0000
Date: Wed, 26 Jun 2024 14:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Chris Lew <quic_clew@quicinc.com>
Subject: [qcom:20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org 4/4]
 drivers/soc/qcom/qcom_pd_mapper.c:520:34: warning: unused variable
 'qcom_pdm_domains'
Message-ID: <202406261455.Sm9b8zbo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux 20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org
head:   1ebcde047c547134e894508468ead0b7bd3b967d
commit: 1ebcde047c547134e894508468ead0b7bd3b967d [4/4] soc: qcom: add pd-mapper implementation
config: x86_64-randconfig-r131-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261455.Sm9b8zbo-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406261455.Sm9b8zbo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261455.Sm9b8zbo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/qcom/qcom_pd_mapper.c:520:34: warning: unused variable 'qcom_pdm_domains' [-Wunused-const-variable]
     520 | static const struct of_device_id qcom_pdm_domains[] = {
         |                                  ^~~~~~~~~~~~~~~~
   1 warning generated.


vim +/qcom_pdm_domains +520 drivers/soc/qcom/qcom_pd_mapper.c

   519	
 > 520	static const struct of_device_id qcom_pdm_domains[] = {
   521		{ .compatible = "qcom,apq8064", .data = NULL, },
   522		{ .compatible = "qcom,apq8074", .data = NULL, },
   523		{ .compatible = "qcom,apq8084", .data = NULL, },
   524		{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
   525		{ .compatible = "qcom,msm8226", .data = NULL, },
   526		{ .compatible = "qcom,msm8974", .data = NULL, },
   527		{ .compatible = "qcom,msm8996", .data = msm8996_domains, },
   528		{ .compatible = "qcom,msm8998", .data = msm8998_domains, },
   529		{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
   530		{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
   531		{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
   532		{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
   533		{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
   534		{ .compatible = "qcom,sc8280xp", .data = sc8280xp_domains, },
   535		{ .compatible = "qcom,sda660", .data = sdm660_domains, },
   536		{ .compatible = "qcom,sdm660", .data = sdm660_domains, },
   537		{ .compatible = "qcom,sdm670", .data = sdm670_domains, },
   538		{ .compatible = "qcom,sdm845", .data = sdm845_domains, },
   539		{ .compatible = "qcom,sm4250", .data = sm6115_domains, },
   540		{ .compatible = "qcom,sm6115", .data = sm6115_domains, },
   541		{ .compatible = "qcom,sm6350", .data = sm6350_domains, },
   542		{ .compatible = "qcom,sm8150", .data = sm8150_domains, },
   543		{ .compatible = "qcom,sm8250", .data = sm8250_domains, },
   544		{ .compatible = "qcom,sm8350", .data = sm8350_domains, },
   545		{ .compatible = "qcom,sm8450", .data = sm8350_domains, },
   546		{ .compatible = "qcom,sm8550", .data = sm8550_domains, },
   547		{ .compatible = "qcom,sm8650", .data = sm8550_domains, },
   548		{},
   549	};
   550	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
