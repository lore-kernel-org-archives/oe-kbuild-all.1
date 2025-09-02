Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542662DF120
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 06:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794018; cv=none; b=qZ9YUg4actyo6eSeWDOenhh3JG84tL8BEeIUeR3keaiPb1i6g2ut1lOsYkyzmFr2zWt29C+rAWR8K1z9y0mlW71ofiHGvBQiIt4Eycq2zb6LOQb/TDLqMlEjOcVNAdtVbKN1SNH9tYSkKH9Adk4RDJD/1OIatN3XfFMMdPSAuiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794018; c=relaxed/simple;
	bh=kvHTUMZPvClcGpw+A7pNpjYD7JH4ZyYt27CoRde4604=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhLSgASwsKSZ7i/KJC8kZrTdMcuu/YtNyN/L9peJ8Y8X36g/gIznukv1cz02ZA/W5rlA+W9DZX0jzVC8SqE3U5SfuMXt11qQ0oL9cvu1rEfyOaH+sxuZdtsYRIvqlAb8/m/16LGPHxdahn/dEnExzAnrqmb1iW4zxH5pXi0F1ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JESpDajF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JESpDajF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756794016; x=1788330016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kvHTUMZPvClcGpw+A7pNpjYD7JH4ZyYt27CoRde4604=;
  b=JESpDajFa9juhy2b+y+OrxXlqLOIxWD7L/A/J7f9VKiQjBLQA1EpUVwW
   Iga24+k+draSkCbPM8cwuww+QPsKahGvWqp8jkZ7rjLkVSRQ1636YCxft
   m2c7ITNFw896fY9kQXfs8WX2qYG7S20okTHpyczM/Glyhy2k5iO0auTnJ
   B0uOnbx5rbANTPFQFDX99iLhHXC3XXDPATtG7FIjosHAN4zCBLyo1hjWB
   D2AUnNT0gloou9chNURd/Uerl7UBJkYKiNdkwgj7GwLDh1s2/PQ/PlOJA
   RbAmUZJz4xOqhrngh+QrRPcQuZaEldtnSTkt85YmZlZs7dg7k3Ruf0GLs
   A==;
X-CSE-ConnectionGUID: h964jKy1Qo+VNnIVgReq5w==
X-CSE-MsgGUID: GDRpeRBmRze0KQP2O56lxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58907159"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="58907159"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 23:20:16 -0700
X-CSE-ConnectionGUID: qiDgWfaGSbmUwSaIPteqBg==
X-CSE-MsgGUID: aZ+HaOMFTumAyZ23yY1+XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="202113663"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Sep 2025 23:20:09 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utKNC-0001VJ-01;
	Tue, 02 Sep 2025 06:20:06 +0000
Date: Tue, 2 Sep 2025 14:19:26 +0800
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
Subject: Re: [PATCH v3 11/12] thermal/drivers/ti-soc-thermal: Use scope-based
 cleanup helper
Message-ID: <202509021413.NLo9zuEp-lkp@intel.com>
References: <20250901085748.36795-12-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901085748.36795-12-zhangzihuan@kylinos.cn>

Hi Zihuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge rafael-pm/thermal arm64/for-next/core linus/master v6.17-rc4 next-20250901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zihuan-Zhang/arm64-topology-Use-scope-based-cleanup-helper/20250901-170106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250901085748.36795-12-zhangzihuan%40kylinos.cn
patch subject: [PATCH v3 11/12] thermal/drivers/ti-soc-thermal: Use scope-based cleanup helper
config: mips-randconfig-r073-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021413.NLo9zuEp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021413.NLo9zuEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021413.NLo9zuEp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thermal/ti-soc-thermal/ti-thermal-common.c:243:50: error: no member named 'policy' in 'struct ti_thermal_data'
     243 |         data->cool_dev = cpufreq_cooling_register(data->policy);
         |                                                   ~~~~  ^
   1 error generated.


vim +243 drivers/thermal/ti-soc-thermal/ti-thermal-common.c

445eaf871bf94e drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-07-12  215  
03e859d344267c drivers/staging/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-03-19  216  int ti_thermal_register_cpu_cooling(struct ti_bandgap *bgp, int id)
445eaf871bf94e drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-07-12  217  {
03e859d344267c drivers/staging/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-03-19  218  	struct ti_thermal_data *data;
26d9cc65fa769d drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-07-04  219  	struct device_node *np = bgp->dev->of_node;
01d493f192a73c drivers/thermal/ti-soc-thermal/ti-thermal-common.c Zihuan Zhang     2025-09-01  220  	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(0);
26d9cc65fa769d drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-07-04  221  
26d9cc65fa769d drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-07-04  222  	/*
26d9cc65fa769d drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-07-04  223  	 * We are assuming here that if one deploys the zone
26d9cc65fa769d drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-07-04  224  	 * using DT, then it must be aware that the cooling device
26d9cc65fa769d drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-07-04  225  	 * loading has to happen via cpufreq driver.
26d9cc65fa769d drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-07-04  226  	 */
86df7d19083c66 drivers/thermal/ti-soc-thermal/ti-thermal-common.c Rob Herring      2023-03-10  227  	if (of_property_present(np, "#thermal-sensor-cells"))
26d9cc65fa769d drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-07-04  228  		return 0;
445eaf871bf94e drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-07-12  229  
03e859d344267c drivers/staging/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-03-19  230  	data = ti_bandgap_get_sensor_data(bgp, id);
0c12b5ac82fbae drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-05-29  231  	if (!data || IS_ERR(data))
03e859d344267c drivers/staging/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-03-19  232  		data = ti_thermal_build_data(bgp, id);
04a4d10d07b101 drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-09-11  233  
04a4d10d07b101 drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-09-11  234  	if (!data)
04a4d10d07b101 drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-09-11  235  		return -EINVAL;
445eaf871bf94e drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-07-12  236  
01d493f192a73c drivers/thermal/ti-soc-thermal/ti-thermal-common.c Zihuan Zhang     2025-09-01  237  	if (!policy) {
4d753aa7b6279e drivers/thermal/ti-soc-thermal/ti-thermal-common.c Viresh Kumar     2017-04-25  238  		pr_debug("%s: CPUFreq policy not found\n", __func__);
4d753aa7b6279e drivers/thermal/ti-soc-thermal/ti-thermal-common.c Viresh Kumar     2017-04-25  239  		return -EPROBE_DEFER;
4d753aa7b6279e drivers/thermal/ti-soc-thermal/ti-thermal-common.c Viresh Kumar     2017-04-25  240  	}
4d753aa7b6279e drivers/thermal/ti-soc-thermal/ti-thermal-common.c Viresh Kumar     2017-04-25  241  
445eaf871bf94e drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-07-12  242  	/* Register cooling device */
4d753aa7b6279e drivers/thermal/ti-soc-thermal/ti-thermal-common.c Viresh Kumar     2017-04-25 @243  	data->cool_dev = cpufreq_cooling_register(data->policy);
0c12b5ac82fbae drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-05-29  244  	if (IS_ERR(data->cool_dev)) {
cffafc32473560 drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2014-12-12  245  		int ret = PTR_ERR(data->cool_dev);
4d753aa7b6279e drivers/thermal/ti-soc-thermal/ti-thermal-common.c Viresh Kumar     2017-04-25  246  		dev_err(bgp->dev, "Failed to register cpu cooling device %d\n",
cffafc32473560 drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2014-12-12  247  			ret);
cffafc32473560 drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2014-12-12  248  
cffafc32473560 drivers/thermal/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2014-12-12  249  		return ret;
445eaf871bf94e drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-07-12  250  	}
03e859d344267c drivers/staging/ti-soc-thermal/ti-thermal-common.c Eduardo Valentin 2013-03-19  251  	ti_bandgap_set_sensor_data(bgp, id, data);
445eaf871bf94e drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-07-12  252  
445eaf871bf94e drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-07-12  253  	return 0;
445eaf871bf94e drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-07-12  254  }
445eaf871bf94e drivers/staging/omap-thermal/omap-thermal-common.c Eduardo Valentin 2012-07-12  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
