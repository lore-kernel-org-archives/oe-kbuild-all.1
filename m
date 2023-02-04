Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F06233EC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 16:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675529272; x=1707065272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J6+1SCOD4+Sq42jV3Z/18cFlrenR87o655AoluAzb4E=;
  b=Uqvm+wJbYDKOPGTp7CYq+/cpcB35PChsNpdVQo/ghPfi+D7cM8Z+ZKOP
   8hUa6CHg4Cs+I4pG2G+9j9ETiXg4XTyW18h+EV3u6Sm54R75H2EIXXBKP
   pkdutLYWkJDvvQMPKZUYm7W9CsawQ3ofO7cNwpnqb/gktcbi+ymLcqSBU
   j7Q/5NL4xc+9249jQT99V+g+tdjteaSZjYoS89uV7GRJKcYe2133mQJAg
   jYmAXoCHjtqVADwAncb3/eJhGrmlpgqt+u/rk+Vjj0Clveioui875TuSd
   n5JaiKpsA2up5gRARd2DTZ6AMmwnNW414rE26cCN1LMntIlG8U9rt9I4H
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="391357884"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="391357884"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 08:47:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="839930310"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="839930310"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Feb 2023 08:47:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOLhe-0001Qq-13;
	Sat, 04 Feb 2023 16:47:50 +0000
Date: Sun, 5 Feb 2023 00:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 243/20209]
 sound/soc/sof/sof-of-dev.c:68:5: warning: no previous prototype for
 'sof_of_parse'
Message-ID: <202302050056.mCG5f3vR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: c899829bffffaf0b645ec5d7194aaceb500f8ce9 [243/20209] ASoC: SOF: Parse fw/tplg filename from DT
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302050056.mCG5f3vR-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/c899829bffffaf0b645ec5d7194aaceb500f8ce9
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout c899829bffffaf0b645ec5d7194aaceb500f8ce9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/accessibility/speakup/ drivers/base/power/ drivers/dma/ drivers/firmware/imx/ drivers/gpu/drm/bridge/ drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/input/touchscreen/ drivers/mailbox/ drivers/media/platform/ drivers/mtd/nand/raw/gpmi-nand/ drivers/net/ethernet/freescale/ drivers/net/phy/ drivers/pci/controller/dwc/ drivers/pci/controller/mobiveil/ drivers/power/supply/ drivers/pwm/ drivers/regulator/ drivers/rpmsg/ drivers/soc/imx/ drivers/staging/ drivers/thermal/ drivers/video/backlight/ drivers/video/fbdev/ net/ sound/soc/fsl/ sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/sof/sof-of-dev.c:68:5: warning: no previous prototype for 'sof_of_parse' [-Wmissing-prototypes]
      68 | int sof_of_parse(struct platform_device *pdev)
         |     ^~~~~~~~~~~~


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
https://github.com/intel/lkp-tests
