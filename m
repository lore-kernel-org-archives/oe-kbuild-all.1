Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162C08F6B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 01:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718413957; cv=none; b=Ip9MqfIvDYEPvt9UHL3l5P3aI49HTtftfIj9zzw+WFrbdwPCjJCevx9V+SS/ATypyhmQNoBBcYVIxjYo+Zdwj+VWCw83hyMfs9r/MkA/tXTFi8pZthbvTKm6Rt6QPDq3H6GfO7m4zTJE2jsBc067rgylmKSPAqOWipt5xJD4Sc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718413957; c=relaxed/simple;
	bh=rfzBmgbHAMPQkiZCITiLda71VjNNReV1BqVTJOOG75Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MlG9BRXYrk6o1KndS15Otz6FowJi45OlOnetFDpd7BpIRK6a7VGoiR75Yn09XSdrMrxny572P1/lee46bbwab7NOZZVV9TcGJVToA8eV06t2A9WLCGyZp/iKOcWs7i2g3WoLizys9L0mFWMu7f63Gk0KfSfkY4C9MzTqQfqXAuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKgTns/7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKgTns/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718413955; x=1749949955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rfzBmgbHAMPQkiZCITiLda71VjNNReV1BqVTJOOG75Y=;
  b=UKgTns/7CU98IoqHmryaInlsHjkedmAfBRpq19zctiyc5lXWALuMp6kO
   1iF9jAs05d/D0+x56PeoEiMhSaC6bd3cRJy/7iwIHH/6ZphtVWDzyXoC7
   7BpIu13322JZb1qiRrviFY1X0lKzeulXpVseBXGhQ8ZFZKAtlF7pzZhKs
   IEWHQXVSzaalb656x3+hBA1HAJOTxSyembCAqUNgLsCCaS9FyRlPK2wMb
   WCUmxwG0BAoJDN1BwstVFUYmshv6CMcgAf1CUCmqc0PbQaXeD4ltyjXN+
   S2EhE2xuaTz7+H/kXghSKVoSyRbwoIxO/VrY+95LZqS9u+aiPrmAM+H2l
   Q==;
X-CSE-ConnectionGUID: DSSjzhRMTlmv5V2NC7wiOA==
X-CSE-MsgGUID: hqaT1LRLRueAiUSuaC8Qmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25900741"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="25900741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 18:12:35 -0700
X-CSE-ConnectionGUID: vchjrgOxRv+YezchNHiPrw==
X-CSE-MsgGUID: waDvhR2JSkuGfMsVz6ZTBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="45042264"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jun 2024 18:12:33 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIHy1-0001yP-0d;
	Sat, 15 Jun 2024 01:12:29 +0000
Date: Sat, 15 Jun 2024 09:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-v6.10-rc3 53/74]
 drivers/soc/qcom/qcom_pd_mapper.c:519:34: warning: 'qcom_pdm_domains'
 defined but not used
Message-ID: <202406150947.QT4HmG1q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.10-rc3
head:   959d8c14d75729561f5ce6f4c79055e18dd652cb
commit: cc7fd75b1dac0e180d13d78127035931503f6fef [53/74] soc: qcom: add pd-mapper implementation
config: m68k-randconfig-r111-20240614 (https://download.01.org/0day-ci/archive/20240615/202406150947.QT4HmG1q-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240615/202406150947.QT4HmG1q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150947.QT4HmG1q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/qcom/qcom_pd_mapper.c: In function 'qcom_pdm_add_service_domain':
   drivers/soc/qcom/qcom_pd_mapper.c:79:27: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      79 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                           ^~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:79:25: warning: assignment to 'struct qcom_pdm_service *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      79 |                 service = kzalloc(sizeof(*service), GFP_KERNEL);
         |                         ^
   drivers/soc/qcom/qcom_pd_mapper.c:89:16: warning: assignment to 'struct qcom_pdm_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      89 |         domain = kzalloc(sizeof(*domain), GFP_KERNEL);
         |                ^
   drivers/soc/qcom/qcom_pd_mapper.c:93:25: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
      93 |                         kfree(service);
         |                         ^~~~~
         |                         kvfree
   drivers/soc/qcom/qcom_pd_mapper.c: In function 'qcom_pdm_get_domain_list':
   drivers/soc/qcom/qcom_pd_mapper.c:160:13: warning: assignment to 'struct servreg_get_domain_list_resp *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     160 |         rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
         |             ^
   drivers/soc/qcom/qcom_pd_mapper.c: In function 'qcom_pdm_start':
   drivers/soc/qcom/qcom_pd_mapper.c:585:14: warning: assignment to 'struct qcom_pdm_data *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     585 |         data = kzalloc(sizeof(*data), GFP_KERNEL);
         |              ^
   drivers/soc/qcom/qcom_pd_mapper.c: At top level:
>> drivers/soc/qcom/qcom_pd_mapper.c:519:34: warning: 'qcom_pdm_domains' defined but not used [-Wunused-const-variable=]
     519 | static const struct of_device_id qcom_pdm_domains[] = {
         |                                  ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/qcom_pdm_domains +519 drivers/soc/qcom/qcom_pd_mapper.c

   518	
 > 519	static const struct of_device_id qcom_pdm_domains[] = {
   520		{ .compatible = "qcom,apq8064", .data = NULL, },
   521		{ .compatible = "qcom,apq8074", .data = NULL, },
   522		{ .compatible = "qcom,apq8084", .data = NULL, },
   523		{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
   524		{ .compatible = "qcom,msm8226", .data = NULL, },
   525		{ .compatible = "qcom,msm8974", .data = NULL, },
   526		{ .compatible = "qcom,msm8996", .data = msm8996_domains, },
   527		{ .compatible = "qcom,msm8998", .data = msm8998_domains, },
   528		{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
   529		{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
   530		{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
   531		{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
   532		{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
   533		{ .compatible = "qcom,sc8280xp", .data = sc8280xp_domains, },
   534		{ .compatible = "qcom,sda660", .data = sdm660_domains, },
   535		{ .compatible = "qcom,sdm660", .data = sdm660_domains, },
   536		{ .compatible = "qcom,sdm670", .data = sdm670_domains, },
   537		{ .compatible = "qcom,sdm845", .data = sdm845_domains, },
   538		{ .compatible = "qcom,sm4250", .data = sm6115_domains, },
   539		{ .compatible = "qcom,sm6115", .data = sm6115_domains, },
   540		{ .compatible = "qcom,sm6350", .data = sm6350_domains, },
   541		{ .compatible = "qcom,sm8150", .data = sm8150_domains, },
   542		{ .compatible = "qcom,sm8250", .data = sm8250_domains, },
   543		{ .compatible = "qcom,sm8350", .data = sm8350_domains, },
   544		{ .compatible = "qcom,sm8450", .data = sm8350_domains, },
   545		{ .compatible = "qcom,sm8550", .data = sm8550_domains, },
   546		{ .compatible = "qcom,sm8650", .data = sm8550_domains, },
   547		{},
   548	};
   549	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
