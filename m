Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2A62F2E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 00:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739923661; cv=none; b=uNsccWS+uE3OmuxwFogVPvqQCo/R5MG9cfXewaApk16SFs9fAcH5EF4cVxsd/7is2e304/2eoeVjRvUTYa8yaEbkeyI5igNOdSHLvzkq69PxVVvenX1AaFMUAXqmZmnFTMGGJMt0XeAMg25Jgl+hFx8789LaSIiZT4ptTN+4+0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739923661; c=relaxed/simple;
	bh=qFWs4/1/GU16hwwOVhS+41JN+aTu9D1u2O5uZEnDEWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YXgHblCCX96fuUa7/7aamHGgXku/z1mWLBrKyKW3I3tKR60IiwNNI89M9nT12G49L3QGBIUZlOg8Yd8OktgmO0dZuM55BjJNb4wu/aHaNERfs0N7eHQtnKj7Wa3FtbufNdonFQKG3xCmQREKbL4VLchAiwM5vpZ5tW5zAnZsP14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2oQIfMF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2oQIfMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739923658; x=1771459658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qFWs4/1/GU16hwwOVhS+41JN+aTu9D1u2O5uZEnDEWQ=;
  b=W2oQIfMFdQKHXicpQ2DUfHkFSQT8O0ktyQkmEE/XhA0Z2N1c7+Qsy6w1
   vyydsxJ2kIuxc/pdDUZqjh++92TpOoTB+yoXD3kUmYEE9VfPBDnyLAUHA
   GD2exHlP2rvZif0emVhvEPWR3NrpnkQcny4j4VKoVYFgsFdiOm/qWE15h
   k70pFbyoBXnAdb1voQlIPwaYSD3QjQZqbixhDkzpAFXqqPt9ljBh2Yr+s
   2hPkaHtch77yf9RvpjiEUdOTNXl1tO62BDwpj1KW73QaT1ketIUzVhEtF
   65M79drL87YEOMaZo0COOgIpJIz2mcqcWHRX2TZLQuh7b8gKITp3rO0Pp
   Q==;
X-CSE-ConnectionGUID: 0PtKYbfvRAysqIQwOI71Hw==
X-CSE-MsgGUID: 0qzJK+vcRpOTzYwVKIIlqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51285961"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="51285961"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:07:38 -0800
X-CSE-ConnectionGUID: YI+qM9EsTDinBKjR87dc1g==
X-CSE-MsgGUID: TWEsANU2R22LQ7Slutp8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119750825"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Feb 2025 16:07:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkXcj-00010F-30;
	Wed, 19 Feb 2025 00:07:33 +0000
Date: Wed, 19 Feb 2025 08:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [krzk-github:track/x1e80100-t14s 1001/1079]
 drivers/pmdomain/arm/scmi_perf_domain.c:129:82: warning: '%d' directive
 output may be truncated writing between 1 and 10 bytes into a region of size
 between 0 and 63
Message-ID: <202502190729.8e7FEnhS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux track/x1e80100-t14s
head:   0a5b996575143038f96d880868109359ede28367
commit: d8b0f632f663f5a46a3a519c3a387a5a61c418b7 [1001/1079] pmdomain: arm: Fix debugfs node creation failure
config: arm-randconfig-004-20250219 (https://download.01.org/0day-ci/archive/20250219/202502190729.8e7FEnhS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190729.8e7FEnhS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190729.8e7FEnhS-lkp@intel.com/

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
