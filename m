Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555561DFFD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 06:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794791; cv=none; b=G4vAYmvUF8dw7sF1W9t7LFzYJYhaGy5kFwEAXf1/a2QxQH4sSX7haSksw1BWTJwWcGIh0brpOCOBT2MfU1kCq0NxKvkKNwR4bNYrXLTcs9WH1MPlV2W5acgvyBlWeNeSzfVlVLgv4zWXK7y0CDXrTD6RyhR2JvJ37bHAa2/UJIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794791; c=relaxed/simple;
	bh=np6brmJzpaT6FaMGGDwro7WtTlnuLPEZ+PkOkeamBoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqcgVmlDJe6snI+yDItPhS77dwP3yTYCAY0yGYdJGMGupw6uqd41EQDslm3f0mKLWrZ3MqpdvBfM5FwslSxHOk/ZHzPSsmDTm2YvJ2MNS4N00rB9IYKQGJWoQuk/R0afwLpR+Zw3kPiz5SF0o2bfznT9uQE0WDaLU5e9l5BsU7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bt4HdTYQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bt4HdTYQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756794791; x=1788330791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=np6brmJzpaT6FaMGGDwro7WtTlnuLPEZ+PkOkeamBoM=;
  b=Bt4HdTYQRt1B+C+Im8aTC4oxlwO8CaWbQPEZ3aDAAgXFyWrsPBTo2ouQ
   sWxbnHGa3G+Xtu5BdCHZJiz8Ty5bFFG6FI4CPM04x8MKKx82VRvu0s2zd
   tZ4i523zx/D1g5DOHhKjw/iz6YdnOmHB6RwygJWHWfjjkqPvgJVC+SrtF
   BSswN1Np7LE47SK8OCUloNqhwaWJQPHQaYRQrIgdMoXZbfUZbuXCavV12
   boFzXS83STvhPrsulZ4VgFpwnuR2HDvHDnpP6fxyeYRzpyPavalMlal+1
   7uiJztgW1bj7hG2H/Qdqalztx4HefW853zmuILIQ5gFLv1kGchUDn2tuq
   A==;
X-CSE-ConnectionGUID: 0duUAMbvQWOCKynEuzL7sg==
X-CSE-MsgGUID: 2R7pm6XMSniAWYGa8X5c9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58751603"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58751603"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 23:33:10 -0700
X-CSE-ConnectionGUID: RUl1Ey5pRUOBC9Bzsi09Og==
X-CSE-MsgGUID: xnEUPwHQTDOS8ui092ojFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171062873"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Sep 2025 23:33:00 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utKYw-0001Vl-2z;
	Tue, 02 Sep 2025 06:32:30 +0000
Date: Tue, 2 Sep 2025 14:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>,
	"Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Ben Horgan <ben.horgan@arm.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 10/12] thermal: imx: Use scope-based cleanup helper
Message-ID: <202509021413.o9U55mo6-lkp@intel.com>
References: <20250901085748.36795-11-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901085748.36795-11-zhangzihuan@kylinos.cn>

Hi Zihuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge rafael-pm/thermal arm64/for-next/core linus/master v6.17-rc4 next-20250901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zihuan-Zhang/arm64-topology-Use-scope-based-cleanup-helper/20250901-170106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250901085748.36795-11-zhangzihuan%40kylinos.cn
patch subject: [PATCH v3 10/12] thermal: imx: Use scope-based cleanup helper
config: arm-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021413.o9U55mo6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021413.o9U55mo6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021413.o9U55mo6-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/thermal/imx_thermal.c: In function 'imx_thermal_register_legacy_cooling':
>> drivers/thermal/imx_thermal.c:554:59: error: 'struct imx_thermal_data' has no member named 'policy'
     554 |                 data->cdev = cpufreq_cooling_register(data->policy);
         |                                                           ^~


vim +554 drivers/thermal/imx_thermal.c

3c94f17e72a7bc Anson Huang     2014-08-06  534  
c589c56671c914 Anson Huang     2018-11-21  535  #ifdef CONFIG_CPU_FREQ
a1d00154239206 Bastian Stender 2018-06-08  536  /*
a1d00154239206 Bastian Stender 2018-06-08  537   * Create cooling device in case no #cooling-cells property is available in
a1d00154239206 Bastian Stender 2018-06-08  538   * CPU node
a1d00154239206 Bastian Stender 2018-06-08  539   */
a1d00154239206 Bastian Stender 2018-06-08  540  static int imx_thermal_register_legacy_cooling(struct imx_thermal_data *data)
a1d00154239206 Bastian Stender 2018-06-08  541  {
c589c56671c914 Anson Huang     2018-11-21  542  	struct device_node *np;
a4c062c2956958 Zihuan Zhang    2025-09-01  543  	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(0);
b45fd13be340e4 Anson Huang     2020-03-26  544  	int ret = 0;
a1d00154239206 Bastian Stender 2018-06-08  545  
a4c062c2956958 Zihuan Zhang    2025-09-01  546  	if (!policy) {
c589c56671c914 Anson Huang     2018-11-21  547  		pr_debug("%s: CPUFreq policy not found\n", __func__);
c589c56671c914 Anson Huang     2018-11-21  548  		return -EPROBE_DEFER;
c589c56671c914 Anson Huang     2018-11-21  549  	}
c589c56671c914 Anson Huang     2018-11-21  550  
a4c062c2956958 Zihuan Zhang    2025-09-01  551  	np = of_get_cpu_node(policy->cpu, NULL);
c589c56671c914 Anson Huang     2018-11-21  552  
86df7d19083c66 Rob Herring     2023-03-10  553  	if (!np || !of_property_present(np, "#cooling-cells")) {
a1d00154239206 Bastian Stender 2018-06-08 @554  		data->cdev = cpufreq_cooling_register(data->policy);
a4c062c2956958 Zihuan Zhang    2025-09-01  555  		if (IS_ERR(data->cdev))
a1d00154239206 Bastian Stender 2018-06-08  556  			ret = PTR_ERR(data->cdev);
a1d00154239206 Bastian Stender 2018-06-08  557  	}
a1d00154239206 Bastian Stender 2018-06-08  558  
b45fd13be340e4 Anson Huang     2020-03-26  559  	of_node_put(np);
b45fd13be340e4 Anson Huang     2020-03-26  560  
b45fd13be340e4 Anson Huang     2020-03-26  561  	return ret;
a1d00154239206 Bastian Stender 2018-06-08  562  }
a1d00154239206 Bastian Stender 2018-06-08  563  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
