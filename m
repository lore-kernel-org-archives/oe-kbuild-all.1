Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782ECAD5A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101764; cv=none; b=pIczeoYgpDYZMxomDq+xGn5kTa97n7X5VVVsUGxo+uV3raMhNkTxWZxYGowvcOe+legarmSgl2eD8ZUlhU2Bobt7ZabN7b3tzsoYdayqNqxIpLkwiMThSSHR5j/bQMNcObZ5a4NWMSITT+o7qVJsqgHP/Ft1CUNdBPiYRAGfvYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101764; c=relaxed/simple;
	bh=whRaztirvx5Wyh80MSX+DutYWxXqcp9XldzpUIBN9zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RL9ocQPV6eWApZVTJAXkogZ89G/ixCOj9PmxmfLXvQizftCGVnbVFznNOS/IEeeb8TFpk3KZs6dNvG9qIKQ7GfpUbtJymIVFx864/uv5AFXSfPV0l7SpEaCdcjU0CZAsuJ7uBdbAjgZd5P8PdxPisurN7fOF8EVD+nddGVZ5cYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ye1vpUsc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ye1vpUsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767101762; x=1798637762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=whRaztirvx5Wyh80MSX+DutYWxXqcp9XldzpUIBN9zk=;
  b=Ye1vpUscRFLRctIjlqLz3acCJ99UdYRKs5GhGWfYo4e5uWQkYZSqg+pR
   0gpu6ArBLrTkWDc4xRJZDMEBS5A7I1XuW8c2nxAe2kgv9v4yf4q/tTGGs
   y0yP2Ts5ddvAEpt0QKVJiS5+onsfuxgYCsKCS1zUx/P8duJ//+K1vPdxP
   IxLlI8KRPCrVZ4syw6Ts1M1MDfIATIi++6GURpORy7NvlubH2Ftvczmww
   faRXf5heOmNiOPrZwM7R8U+NwZ/8XDuYI1rROJltNezgKu7TjFkxSdOSW
   Ejp45gQksa/gqFkORGIzYZzb5qCevtopBYzs0A+AKUiUJVj2+tbFz2cWG
   A==;
X-CSE-ConnectionGUID: n67i7BcQRH6l96Z0YhImuA==
X-CSE-MsgGUID: ZeS31JIrQ1KFXytQPfESjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79809529"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="79809529"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:36:01 -0800
X-CSE-ConnectionGUID: ada3EXIlSHOIL18jvWVdKA==
X-CSE-MsgGUID: E5snTTCFSEymNkXU32GLZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="205734082"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Dec 2025 05:35:59 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaZtE-000000000P3-2Vow;
	Tue, 30 Dec 2025 13:35:56 +0000
Date: Tue, 30 Dec 2025 21:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	tzungbi@kernel.org
Subject: Re: [PATCH] pmdomain: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <202512302129.BjTBw9E6-lkp@intel.com>
References: <20251229043244.4103262-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229043244.4103262-1-tzungbi@kernel.org>

Hi Tzung-Bi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc3 next-20251219]
[cannot apply to amd-pstate/linux-next amd-pstate/bleeding-edge]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tzung-Bi-Shih/pmdomain-mediatek-Break-lock-dependency-to-prepare_lock/20251229-123525
base:   linus/master
patch link:    https://lore.kernel.org/r/20251229043244.4103262-1-tzungbi%40kernel.org
patch subject: [PATCH] pmdomain: mediatek: Break lock dependency to `prepare_lock`
config: arm-randconfig-003-20251230 (https://download.01.org/0day-ci/archive/20251230/202512302129.BjTBw9E6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512302129.BjTBw9E6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512302129.BjTBw9E6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/mediatek/mtk-pm-domains.c:1304:12: warning: 'scpsys_resume' defined but not used [-Wunused-function]
    1304 | static int scpsys_resume(struct device *dev)
         |            ^~~~~~~~~~~~~
>> drivers/pmdomain/mediatek/mtk-pm-domains.c:1285:12: warning: 'scpsys_suspend' defined but not used [-Wunused-function]
    1285 | static int scpsys_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~


vim +/scpsys_resume +1304 drivers/pmdomain/mediatek/mtk-pm-domains.c

  1284	
> 1285	static int scpsys_suspend(struct device *dev)
  1286	{
  1287		struct scpsys *scpsys = dev_get_drvdata(dev);
  1288		struct generic_pm_domain *genpd;
  1289		struct scpsys_domain *pd;
  1290		int i;
  1291	
  1292		for (i = 0; i < scpsys->pd_data.num_domains; i++) {
  1293			genpd = scpsys->pd_data.domains[i];
  1294			if (!genpd)
  1295				continue;
  1296	
  1297			pd = to_scpsys_domain(genpd);
  1298			clk_bulk_unprepare(pd->num_clks, pd->clks);
  1299			clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
  1300		}
  1301		return 0;
  1302	}
  1303	
> 1304	static int scpsys_resume(struct device *dev)
  1305	{
  1306		struct scpsys *scpsys = dev_get_drvdata(dev);
  1307		struct generic_pm_domain *genpd;
  1308		struct scpsys_domain *pd;
  1309		int i, ret;
  1310	
  1311		for (i = 0; i < scpsys->pd_data.num_domains; i++) {
  1312			genpd = scpsys->pd_data.domains[i];
  1313			if (!genpd)
  1314				continue;
  1315	
  1316			pd = to_scpsys_domain(genpd);
  1317			ret = clk_bulk_prepare(pd->num_clks, pd->clks);
  1318			if (ret)
  1319				return ret;
  1320			ret = clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_clks);
  1321			if (ret)
  1322				return ret;
  1323		}
  1324		return 0;
  1325	}
  1326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
