Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F171C107B7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 16:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694018803; x=1725554803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gNLQ2GtgZk05+7eJGTe0siq8SFeQNkuetYZUPECVfuI=;
  b=D9B8xzj5CODP7eE0xwMJX5ggIlWZnPgHuGIr27tg0BIdi8pqauguyY2f
   9FWhSVIpSez1Urs/lL3aligk0qBJ1B5yERzxb2XLlT4IevR61zMIwYr27
   hdBK9OuRP4g8yFGo3a57GNCLWhZW0e3mn6uaDPZG+MSdFQa9I4MFMrHPW
   CycPiVBrHuWnJbqSq7YyrHvrTi9wXCbD2fVo0XL8rjAz4GSLz1hUFDugg
   lhHoMHBoaNKkRlIzxz5wxC1LR/boe/uyQSOnFxV00X4zjciPpeQHa84gj
   R2fbeQETgEktJY8QfiBRb639Y3tBI7N0fdACnPmGv2rBs4EhIMzRg7dl5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="377031823"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="377031823"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 09:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="718328861"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="718328861"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Sep 2023 09:46:39 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdvfo-0000PS-38;
	Wed, 06 Sep 2023 16:46:36 +0000
Date: Thu, 7 Sep 2023 00:46:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 243/24606]
 sound/soc/sof/sof-of-dev.c:68:5: warning: no previous prototype for function
 'sof_of_parse'
Message-ID: <202309070018.0L4gMMBs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   c099d7415137daf904adcd5fdd73a25024627587
commit: c899829bffffaf0b645ec5d7194aaceb500f8ce9 [243/24606] ASoC: SOF: Parse fw/tplg filename from DT
config: mips-randconfig-r033-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070018.0L4gMMBs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070018.0L4gMMBs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070018.0L4gMMBs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/sof-of-dev.c:68:5: warning: no previous prototype for function 'sof_of_parse' [-Wmissing-prototypes]
   int sof_of_parse(struct platform_device *pdev)
       ^
   sound/soc/sof/sof-of-dev.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sof_of_parse(struct platform_device *pdev)
   ^
   static 
   1 warning generated.


vim +/sof_of_parse +68 sound/soc/sof/sof-of-dev.c

    67	
  > 68	int sof_of_parse(struct platform_device *pdev)
    69	{
    70		struct snd_sof_pdata *sof_pdata = platform_get_drvdata(pdev);
    71		struct device_node *np = pdev->dev.of_node;
    72		int ret;
    73	
    74		/* firmware-name is optional in DT */
    75		of_property_read_string(np, "firmware-name", &sof_pdata->fw_filename);
    76	
    77		ret = of_property_read_string(np, "tplg-name",
    78					      &sof_pdata->tplg_filename);
    79		if (ret < 0)
    80			return ret;
    81	
    82		return 0;
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
