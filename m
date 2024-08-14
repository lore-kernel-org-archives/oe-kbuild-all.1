Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C890D1C4615
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 20:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723668524; cv=none; b=o625geVIxZEbdQckfLYV/p3KDPIyTEd+4kPMz2VlvY1Xd1quMOOtZk+I1zVzoWNAtBARA9dMkc+cwKqUy37TbgiHkqxQAExGlFovKC5RUhdMxLqHQKmKvadV0evs4pTDuiTqBfqX1kajz0tS/glaSGvo4E0VAZUNHKDog+skc7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723668524; c=relaxed/simple;
	bh=Js6gzw1yWIRFTklPLJxydm52u7/ema/8+YB8Eq6n9M0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YATmFWW+gKAVFoLEgGykPRs0r/Ipe4ZVUtlz51myo/q3MU0lL9k1iRmhA3OiS+XkvbDCHnlFii8Ha1VxyrDsV/w/0PC3xe+6hf4bXZzNVX05tkUXJhzVOvxEJnpV/2cHEIhL6kc93pxummAY9PiXvklB/Y0O69PyBvZEiRdxDTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGGU3SmG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGGU3SmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723668521; x=1755204521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Js6gzw1yWIRFTklPLJxydm52u7/ema/8+YB8Eq6n9M0=;
  b=XGGU3SmGAt1CjVwwwKUxTKUGe4nlWWGrUDxnydVyfWrBZPxZpD3Z077g
   PU75FhEraAqW83yC/t/kHGgvjRxDg4PPYKJrJtCG6C1VrMGWv7sYUWq47
   k1qFOK2GBVO4ElFv/Ez5BnYmT1GyveNtuwId8WZR1MPnHH1TUxNY+pWFt
   SS1jzB6fEKwk8Gapxm1WvyV3rAWg8Qie7dbr6pRk9wW7T9t58Q9v4yMrE
   +hETPU0LWjOI7fuX2uBEmqcFVp4HIULH2p87vtZ5LCgIOk1O2myJamInt
   rkfjG3C1idUKVNZAFyqGp+8H8xW3uoL4oUbftLg1nbZbpkMVSxTdUdJuD
   Q==;
X-CSE-ConnectionGUID: L2NYWvoYS3288/LxTEWL4g==
X-CSE-MsgGUID: IgJA3rCASoGaqIJcXswraw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33318920"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="33318920"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 13:48:41 -0700
X-CSE-ConnectionGUID: 8I3sQkeiS2ShJEgBU/iBXA==
X-CSE-MsgGUID: G03zzGxHSAOmG6DPUjIhyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="89933551"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2024 13:48:40 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seKv7-0002ry-2e;
	Wed, 14 Aug 2024 20:48:37 +0000
Date: Thu, 15 Aug 2024 04:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [ulfh-pm:fixes 2/3] drivers/pmdomain/arm/scmi_perf_domain.c:129:82:
 warning: '%d' directive output may be truncated writing between 1 and 10
 bytes into a region of size between 0 and 63
Message-ID: <202408150404.5PB4DniH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git fixes
head:   e4e512eedc8bb12c4c19553860dc50669fe8f32c
commit: e9f9e3c652c803eaeb8aab1d094262f7196f7054 [2/3] pmdomain: arm: Fix debugfs node creation failure
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240815/202408150404.5PB4DniH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408150404.5PB4DniH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408150404.5PB4DniH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pmdomain/arm/scmi_perf_domain.c: In function 'scmi_perf_domain_probe':
>> drivers/pmdomain/arm/scmi_perf_domain.c:129:82: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 63 [-Wformat-truncation=]
     129 |                 snprintf(scmi_pd->domain_name, sizeof(scmi_pd->domain_name), "%s-%d",
         |                                                                                  ^~
   drivers/pmdomain/arm/scmi_perf_domain.c:129:78: note: directive argument in the range [0, 2147483646]
     129 |                 snprintf(scmi_pd->domain_name, sizeof(scmi_pd->domain_name), "%s-%d",
         |                                                                              ^~~~~~~
   drivers/pmdomain/arm/scmi_perf_domain.c:129:17: note: 'snprintf' output between 3 and 75 bytes into a destination of size 64
     129 |                 snprintf(scmi_pd->domain_name, sizeof(scmi_pd->domain_name), "%s-%d",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     130 |                          scmi_pd->info->name, scmi_pd->domain_id);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +129 drivers/pmdomain/arm/scmi_perf_domain.c

    77	
    78	static int scmi_perf_domain_probe(struct scmi_device *sdev)
    79	{
    80		struct device *dev = &sdev->dev;
    81		const struct scmi_handle *handle = sdev->handle;
    82		const struct scmi_perf_proto_ops *perf_ops;
    83		struct scmi_protocol_handle *ph;
    84		struct scmi_perf_domain *scmi_pd;
    85		struct genpd_onecell_data *scmi_pd_data;
    86		struct generic_pm_domain **domains;
    87		int num_domains, i, ret = 0;
    88	
    89		if (!handle)
    90			return -ENODEV;
    91	
    92		/* The OF node must specify us as a power-domain provider. */
    93		if (!of_find_property(dev->of_node, "#power-domain-cells", NULL))
    94			return 0;
    95	
    96		perf_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
    97		if (IS_ERR(perf_ops))
    98			return PTR_ERR(perf_ops);
    99	
   100		num_domains = perf_ops->num_domains_get(ph);
   101		if (num_domains < 0) {
   102			dev_warn(dev, "Failed with %d when getting num perf domains\n",
   103				 num_domains);
   104			return num_domains;
   105		} else if (!num_domains) {
   106			return 0;
   107		}
   108	
   109		scmi_pd = devm_kcalloc(dev, num_domains, sizeof(*scmi_pd), GFP_KERNEL);
   110		if (!scmi_pd)
   111			return -ENOMEM;
   112	
   113		scmi_pd_data = devm_kzalloc(dev, sizeof(*scmi_pd_data), GFP_KERNEL);
   114		if (!scmi_pd_data)
   115			return -ENOMEM;
   116	
   117		domains = devm_kcalloc(dev, num_domains, sizeof(*domains), GFP_KERNEL);
   118		if (!domains)
   119			return -ENOMEM;
   120	
   121		for (i = 0; i < num_domains; i++, scmi_pd++) {
   122			scmi_pd->info = perf_ops->info_get(ph, i);
   123	
   124			scmi_pd->domain_id = i;
   125			scmi_pd->perf_ops = perf_ops;
   126			scmi_pd->ph = ph;
   127	
   128			/* Domain attributes can report identical names across domains */
 > 129			snprintf(scmi_pd->domain_name, sizeof(scmi_pd->domain_name), "%s-%d",
   130				 scmi_pd->info->name, scmi_pd->domain_id);
   131	
   132			scmi_pd->genpd.name = scmi_pd->domain_name;
   133			scmi_pd->genpd.flags = GENPD_FLAG_ALWAYS_ON |
   134					       GENPD_FLAG_OPP_TABLE_FW;
   135			scmi_pd->genpd.set_performance_state = scmi_pd_set_perf_state;
   136			scmi_pd->genpd.attach_dev = scmi_pd_attach_dev;
   137			scmi_pd->genpd.detach_dev = scmi_pd_detach_dev;
   138	
   139			ret = pm_genpd_init(&scmi_pd->genpd, NULL, false);
   140			if (ret)
   141				goto err;
   142	
   143			domains[i] = &scmi_pd->genpd;
   144		}
   145	
   146		scmi_pd_data->domains = domains;
   147		scmi_pd_data->num_domains = num_domains;
   148	
   149		ret = of_genpd_add_provider_onecell(dev->of_node, scmi_pd_data);
   150		if (ret)
   151			goto err;
   152	
   153		dev_set_drvdata(dev, scmi_pd_data);
   154		dev_info(dev, "Initialized %d performance domains", num_domains);
   155		return 0;
   156	err:
   157		for (i--; i >= 0; i--)
   158			pm_genpd_remove(domains[i]);
   159		return ret;
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
