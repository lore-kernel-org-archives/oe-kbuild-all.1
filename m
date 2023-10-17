Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A584C15F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 09:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVwML6Eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697533548; x=1729069548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bhK0Kx+Hpn7VIHcO3KCifAoy+rj9l95PuBWkvbJvrgw=;
  b=JVwML6EhAj4aMR3C4H9aEikvpbMPg701YhWTtaghM44iXJWIyXXQ2bqo
   SjuNpMm9h75AnLyBvVenVWhytTVAq9hYTAz5pqcp01TgCTqCwzkeqZpkB
   e6DQOjiL7lZPi+b6jzlCxIBndaNlBBj3JUfAhcus5KgLMg4HtwvNPnFhm
   QczUSgtbcz6lSmgLwFDUA2AcE98PvMRXggNvvB6heqZwf4ZQPb1rVsqGl
   hyCsb4Bt/NtrqIeFMl7Y5SvgthCe//pU/YPVv54J/xAfBIK+5EYZNDjju
   cKEqpuT4W8itLKxD97u/kvJ0JCgkHhCemtJcIhDoeffrWmRlJuJgyM2xs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="370806832"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="370806832"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 02:05:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="821898278"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="821898278"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Oct 2023 02:05:47 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsg1I-0009Nn-1F;
	Tue, 17 Oct 2023 09:05:44 +0000
Date: Tue, 17 Oct 2023 17:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.4-2.3.x-imx 2744/30000]
 sound/soc/sof/sof-of-dev.c:43:5: warning: no previous declaration for
 'sof_of_parse'
Message-ID: <202310171702.zTOHRO4u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.4-2.3.x-imx
head:   bcde5677c4cabfef7080ffc2fef17275144a0517
commit: 85114278455e26e02a40fc069dc876f1fffed9cf [2744/30000] ASoC: SOF: Parse fw/tplg filename from DT
config: i386-randconfig-011-20231017 (https://download.01.org/0day-ci/archive/20231017/202310171702.zTOHRO4u-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171702.zTOHRO4u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171702.zTOHRO4u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/sof-of-dev.c:43:5: warning: no previous declaration for 'sof_of_parse' [-Wmissing-declarations]
    int sof_of_parse(struct platform_device *pdev)
        ^~~~~~~~~~~~
   sound/soc/sof/sof-of-dev.c: In function 'sof_of_probe':
   sound/soc/sof/sof-of-dev.c:65:28: warning: unused variable 'mach' [-Wunused-variable]
     struct snd_soc_acpi_mach *mach;
                               ^~~~


vim +/sof_of_parse +43 sound/soc/sof/sof-of-dev.c

    42	
  > 43	int sof_of_parse(struct platform_device *pdev)
    44	{
    45		struct snd_sof_pdata *sof_pdata = platform_get_drvdata(pdev);
    46		struct device_node *np = pdev->dev.of_node;
    47		int ret;
    48	
    49		/* firmware-name is optional in DT */
    50		of_property_read_string(np, "firmware-name", &sof_pdata->fw_filename);
    51	
    52		ret = of_property_read_string(np, "tplg-name",
    53					      &sof_pdata->tplg_filename);
    54		if (ret < 0)
    55			return ret;
    56	
    57		return 0;
    58	}
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
