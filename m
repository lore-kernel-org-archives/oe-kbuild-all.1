Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44C71864C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 04:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712377282; cv=none; b=VvdHUB0FtfbQNEWI0ijCQ2uvx4hGw7ALp48HnDGlAqjqsjj/DqyXEL4yHJZp3askLZCI+MOf2itTwsjr+jzPAfy0XWgl2SM+iKzkwEnpXyz74Qlj7COqrE2YS5ohWoHddwi+ExI9/thM4+HidUxZcQekIHSGPwzxTdPczjgnkJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712377282; c=relaxed/simple;
	bh=qXZg3/iqWVodipg1nNqupRgQhjBsWmrsn40iKR5HgVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e5KR+hbMOGdhc5nmdmfaNnMAdUfF1fdZyRnWM5KqOPRVMw0YVkoEKDZH5rZLEJ3Qzi9a6jw+bh12vsSus/1wG1MJfK/S6wDAjGvirHR0hOru1K9EOXAS8uw4hTAlov7nb33fZqdjB0YRMh3rjPFNoBFxMKjwDefccJTRXxwe+7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTB98qg3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTB98qg3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712377280; x=1743913280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qXZg3/iqWVodipg1nNqupRgQhjBsWmrsn40iKR5HgVU=;
  b=UTB98qg3izUvgQ3fhhNXtqj5Dv2Jc0vDQWRMWKtNpCohUvwMVODtNkuK
   7zqxc2QWKieqLXAdvaLvChFlRdfJBlCTop189YqG+hD9EnWx2uuvrWJXZ
   Sa3U1YV5GRRAbK+Pqm4rHeYieIC2elKy5EQQhVWqXrY0Ec2IyuvpWehU5
   JioRF8Q6/ZXJTReDvi3raU2/7UzoJS2SkWKEGofcKNzKvq/UPaLrS+6TM
   aoQg8p62jBM9rsgM172FUKUNKJcDcr7Gca/Vt/NGFLLIhUSMhbRgfsodJ
   0xft0YMLHzqLLeWEOHYbWVW412hCJM26vJLT8zGuNRdiEbxfiQiVTX1ep
   Q==;
X-CSE-ConnectionGUID: nCRpBhqQR7i1yj7+I8Aa0g==
X-CSE-MsgGUID: bfB2wLh3Q3SpOSN9IPpwzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18857916"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="18857916"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 21:21:19 -0700
X-CSE-ConnectionGUID: m3ZGqJAcRGy7GPiu5/YSXg==
X-CSE-MsgGUID: cAA6K2OERRG1QTFCjgHydA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="56842322"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Apr 2024 21:21:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsxYJ-00036S-2K;
	Sat, 06 Apr 2024 04:21:15 +0000
Date: Sat, 6 Apr 2024 12:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1149/4242]
 sound/soc/amd/ps/pci-ps.c:271:undefined reference to `sdw_amd_probe'
Message-ID: <202404061257.khJml82D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
commit: a806793f231e390510343837668d8f0eade75a72 [1149/4242] ASoC: amd: simplify soundwire dependencies for legacy stack
config: x86_64-randconfig-r052-20230716 (https://download.01.org/0day-ci/archive/20240406/202404061257.khJml82D-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061257.khJml82D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061257.khJml82D-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `amd_sdw_probe':
>> sound/soc/amd/ps/pci-ps.c:271:(.text+0x1d51eff): undefined reference to `sdw_amd_probe'
   ld: vmlinux.o: in function `acp63_sdw_machine_select':
>> sound/soc/amd/ps/pci-ps.c:294:(.text+0x1d525d5): undefined reference to `sdw_amd_get_slave_info'
   ld: vmlinux.o: in function `amd_sdw_exit':
>> sound/soc/amd/ps/pci-ps.c:280:(.text+0x1d538ce): undefined reference to `sdw_amd_exit'


vim +271 sound/soc/amd/ps/pci-ps.c

eaf825037d6df8 Vijendar Mukunda 2024-02-14  253  
eaf825037d6df8 Vijendar Mukunda 2024-02-14  254  static int amd_sdw_probe(struct device *dev)
eaf825037d6df8 Vijendar Mukunda 2024-02-14  255  {
eaf825037d6df8 Vijendar Mukunda 2024-02-14  256  	struct acp63_dev_data *acp_data;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  257  	struct sdw_amd_res sdw_res;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  258  	int ret;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  259  
eaf825037d6df8 Vijendar Mukunda 2024-02-14  260  	acp_data = dev_get_drvdata(dev);
eaf825037d6df8 Vijendar Mukunda 2024-02-14  261  	memset(&sdw_res, 0, sizeof(sdw_res));
eaf825037d6df8 Vijendar Mukunda 2024-02-14  262  	sdw_res.addr = acp_data->addr;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  263  	sdw_res.reg_range = acp_data->reg_range;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  264  	sdw_res.handle = acp_data->info.handle;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  265  	sdw_res.parent = dev;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  266  	sdw_res.dev = dev;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  267  	sdw_res.acp_lock = &acp_data->acp_lock;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  268  	sdw_res.count = acp_data->info.count;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  269  	sdw_res.mmio_base = acp_data->acp63_base;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  270  	sdw_res.link_mask = acp_data->info.link_mask;
eaf825037d6df8 Vijendar Mukunda 2024-02-14 @271  	ret = sdw_amd_probe(&sdw_res, &acp_data->sdw);
eaf825037d6df8 Vijendar Mukunda 2024-02-14  272  	if (ret)
eaf825037d6df8 Vijendar Mukunda 2024-02-14  273  		dev_err(dev, "error: SoundWire probe failed\n");
eaf825037d6df8 Vijendar Mukunda 2024-02-14  274  	return ret;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  275  }
eaf825037d6df8 Vijendar Mukunda 2024-02-14  276  
eaf825037d6df8 Vijendar Mukunda 2024-02-14  277  static int amd_sdw_exit(struct acp63_dev_data *acp_data)
eaf825037d6df8 Vijendar Mukunda 2024-02-14  278  {
eaf825037d6df8 Vijendar Mukunda 2024-02-14  279  	if (acp_data->sdw)
eaf825037d6df8 Vijendar Mukunda 2024-02-14 @280  		sdw_amd_exit(acp_data->sdw);
eaf825037d6df8 Vijendar Mukunda 2024-02-14  281  	acp_data->sdw = NULL;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  282  
eaf825037d6df8 Vijendar Mukunda 2024-02-14  283  	return 0;
eaf825037d6df8 Vijendar Mukunda 2024-02-14  284  }
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  285  
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  286  static struct snd_soc_acpi_mach *acp63_sdw_machine_select(struct device *dev)
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  287  {
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  288  	struct snd_soc_acpi_mach *mach;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  289  	const struct snd_soc_acpi_link_adr *link;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  290  	struct acp63_dev_data *acp_data = dev_get_drvdata(dev);
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  291  	int ret, i;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  292  
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  293  	if (acp_data->info.count) {
bbf3e6145ea09c Vijendar Mukunda 2024-02-14 @294  		ret = sdw_amd_get_slave_info(acp_data->sdw);
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  295  		if (ret) {
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  296  			dev_dbg(dev, "failed to read slave information\n");
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  297  			return NULL;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  298  		}
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  299  		for (mach = acp_data->machines; mach; mach++) {
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  300  			if (!mach->links)
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  301  				break;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  302  			link = mach->links;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  303  			for (i = 0; i < acp_data->info.count && link->num_adr; link++, i++) {
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  304  				if (!snd_soc_acpi_sdw_link_slaves_found(dev, link,
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  305  									acp_data->sdw->ids,
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  306  									acp_data->sdw->num_slaves))
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  307  					break;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  308  			}
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  309  			if (i == acp_data->info.count || !link->num_adr)
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  310  				break;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  311  		}
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  312  		if (mach && mach->link_mask) {
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  313  			mach->mach_params.links = mach->links;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  314  			mach->mach_params.link_mask = mach->link_mask;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  315  			return mach;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  316  		}
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  317  	}
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  318  	dev_dbg(dev, "No SoundWire machine driver found\n");
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  319  	return NULL;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  320  }
0386d765f27a1f Vijendar Mukunda 2024-02-14  321  #else
0386d765f27a1f Vijendar Mukunda 2024-02-14  322  static int acp_scan_sdw_devices(struct device *dev, u64 addr)
0386d765f27a1f Vijendar Mukunda 2024-02-14  323  {
d1351c30ac8a6c Vijendar Mukunda 2023-06-12  324  	return 0;
d1351c30ac8a6c Vijendar Mukunda 2023-06-12  325  }
eaf825037d6df8 Vijendar Mukunda 2024-02-14  326  

:::::: The code at line 271 was first introduced by commit
:::::: eaf825037d6df89811d43391be920bf6ad731463 ASoC: amd: ps: refactor acp child platform device creation code

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
