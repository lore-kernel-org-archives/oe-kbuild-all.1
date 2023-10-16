Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F511549F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 08:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqLT3iuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697444326; x=1728980326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ntL7JHEEQI+GrK03bBApCAtAb8UrfQves9fWN+Hpt3w=;
  b=jqLT3iuD6LjSDJfmIsSabUu0AVnHwGuoRu1vKAb2Snh8WJys3UDHoBTM
   2UoNjl61pyCLYszqyTLZiZ8c5NPmOuEQpDAn2dq8++rt+eR+XnSJgMQ7F
   PVQn2ef+A/m9uiMCDL8j6xzbDH70dDAa4wA682pn5b7Bqnqck0krDxxij
   lvXfDEPM05vQLiI5i7rNEPFg/Dqrzmf8+sKxENbV3AISFkYg0EgOtYJts
   yXBWCc19R+q4bRewgSII0G9sSQqVzqzPtjhJKicrS5+b5haW/FeRGbxw1
   mGsZDZ3qa7HwlO8ei2IjfYg1klbK6RpfG86UWF4F5PunIs0r1VnOnIJjH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389334108"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="389334108"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 01:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755604777"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="755604777"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Oct 2023 01:17:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsIn1-0008Dz-14;
	Mon, 16 Oct 2023 08:17:27 +0000
Date: Mon, 16 Oct 2023 16:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Marko <robimarko@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Subject: [vireshk-pm:cpufreq/arm/linux-next 16/16]
 drivers/cpufreq/qcom-cpufreq-nvmem.c:227:14: error: 'QCOM_ID_IPQ8172'
 undeclared; did you mean 'QCOM_ID_IPQ8072'?
Message-ID: <202310161614.fhw6f2Vd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/arm/linux-next
head:   459f4269d3eefd57818a11247d4096f62a4ac806
commit: 459f4269d3eefd57818a11247d4096f62a4ac806 [16/16] cpufreq: qcom-nvmem: add support for IPQ8074
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231016/202310161614.fhw6f2Vd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310161614.fhw6f2Vd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161614.fhw6f2Vd-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/qcom-cpufreq-nvmem.c: In function 'qcom_cpufreq_ipq8074_name_version':
>> drivers/cpufreq/qcom-cpufreq-nvmem.c:227:14: error: 'QCOM_ID_IPQ8172' undeclared (first use in this function); did you mean 'QCOM_ID_IPQ8072'?
     227 |         case QCOM_ID_IPQ8172:
         |              ^~~~~~~~~~~~~~~
         |              QCOM_ID_IPQ8072
   drivers/cpufreq/qcom-cpufreq-nvmem.c:227:14: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/cpufreq/qcom-cpufreq-nvmem.c:228:14: error: 'QCOM_ID_IPQ8173' undeclared (first use in this function); did you mean 'QCOM_ID_IPQ8070'?
     228 |         case QCOM_ID_IPQ8173:
         |              ^~~~~~~~~~~~~~~
         |              QCOM_ID_IPQ8070
>> drivers/cpufreq/qcom-cpufreq-nvmem.c:229:14: error: 'QCOM_ID_IPQ8174' undeclared (first use in this function); did you mean 'QCOM_ID_IPQ8074'?
     229 |         case QCOM_ID_IPQ8174:
         |              ^~~~~~~~~~~~~~~
         |              QCOM_ID_IPQ8074


vim +227 drivers/cpufreq/qcom-cpufreq-nvmem.c

   210	
   211	static int qcom_cpufreq_ipq8074_name_version(struct device *cpu_dev,
   212						     struct nvmem_cell *speedbin_nvmem,
   213						     char **pvs_name,
   214						     struct qcom_cpufreq_drv *drv)
   215	{
   216		u32 msm_id;
   217		int ret;
   218		*pvs_name = NULL;
   219	
   220		ret = qcom_smem_get_soc_id(&msm_id);
   221		if (ret)
   222			return ret;
   223	
   224		switch (msm_id) {
   225		case QCOM_ID_IPQ8070A:
   226		case QCOM_ID_IPQ8071A:
 > 227		case QCOM_ID_IPQ8172:
 > 228		case QCOM_ID_IPQ8173:
 > 229		case QCOM_ID_IPQ8174:
   230			drv->versions = BIT(IPQ8074_ACORN_VERSION);
   231			break;
   232		case QCOM_ID_IPQ8072A:
   233		case QCOM_ID_IPQ8074A:
   234		case QCOM_ID_IPQ8076A:
   235		case QCOM_ID_IPQ8078A:
   236			drv->versions = BIT(IPQ8074_HAWKEYE_VERSION);
   237			break;
   238		default:
   239			dev_err(cpu_dev,
   240				"SoC ID %u is not part of IPQ8074 family, limiting to 1.4GHz!\n",
   241				msm_id);
   242			drv->versions = BIT(IPQ8074_ACORN_VERSION);
   243			break;
   244		}
   245	
   246		return 0;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
