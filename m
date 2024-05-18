Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D161DFCB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716041422; cv=none; b=NmoL6AT00T6VKHHmAWDeNUiHmOhThAAbAnhKCfOW+hdvR2F0eQCg/vV5y52WPtiwL9fbKMDUS3oL+LKcxhBAvpf0JO7iSicFlPO0Lca0WsWCd0NJ6+40CtjpgXT0hafH2aM1qjjmfCpDv8AOSTIEq+uVexOQyv7uF5tiZGMHC3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716041422; c=relaxed/simple;
	bh=+c59opgdGc/2CH3pSaiNGWcLDWuSTUv4O9KtBMnutBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nTrR0xFRcamW8+uc/AbPGFZU33s5yF2CBpPTFHdZF9OZJiBN+XpFgMjQHEKX1r3KYVRz2au5RpsxgDnd2TQpHTUdXvxrvFDXaPsLWTaeHOK7WgKY2xbMIOfCnNgnjnqiC28lxMu8MmFr+jh1U2IZRtNAHQHp9lKHqdU9jpAJtpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UD/rLqVr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UD/rLqVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716041420; x=1747577420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+c59opgdGc/2CH3pSaiNGWcLDWuSTUv4O9KtBMnutBc=;
  b=UD/rLqVrEWCiazEq3kMftYFi8AXijGEO5ChK83mpyA6Zx28Z/IV01Mzv
   c69U2KqL7v51krRFZlwkfxt9vXcLiI2DQxbxisKY62sNyeBWiSbjaHWwD
   GZvpzbFjPEp3fJgs+tUiOcR3I9Qcr6CepYLCH0jEBX1m/9+iV7U3n+goS
   m+teDLELYw8E+Zz+2hax2h3oNy+tkd2cBLCQPrWURWI79Kwe8/yCYi7MC
   ArC2og5rV+7rvR5Xt9jwm4RmCmgDuiJePDXqdjfHBEECWeGiWzWoGdQTM
   gAvH9NpvGFU6nS+tjMPtb7g9LgZMVASK9ovfyLtqS0XjBFcNuAoqqsOza
   Q==;
X-CSE-ConnectionGUID: ksY96Q15QnuVSfAbdd5qSg==
X-CSE-MsgGUID: LH8MkXM4Q/WyIf4FKd7JVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12017689"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12017689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 07:10:19 -0700
X-CSE-ConnectionGUID: BKjwNvtcTgKiyfwVzbi6iw==
X-CSE-MsgGUID: Au+LEBGtTtiTgbZJJu3T/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="62914848"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 May 2024 07:10:19 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8KlM-0002GA-0z;
	Sat, 18 May 2024 14:10:16 +0000
Date: Sat, 18 May 2024 22:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/rt712-quirks 18/25]
 sound/soc/amd/ps/pci-ps.c:304:38: error: too many arguments to function
 'snd_soc_acpi_sdw_link_slaves_found'
Message-ID: <202405182154.DtA1TL6v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/rt712-quirks
head:   ff658f42df42bc9bb86c54be12714ed220b88994
commit: 014c32cc9c49189a18852a8f782db94108cffe37 [18/25] ASoc/soundwire: remove sdw_slave_extended_id
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240518/202405182154.DtA1TL6v-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182154.DtA1TL6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182154.DtA1TL6v-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/amd/ps/pci-ps.c: In function 'acp63_sdw_machine_select':
   sound/soc/amd/ps/pci-ps.c:305:86: error: 'struct sdw_amd_ctx' has no member named 'ids'
     305 |                                                                         acp_data->sdw->ids,
         |                                                                                      ^~
   sound/soc/amd/ps/pci-ps.c:306:86: error: 'struct sdw_amd_ctx' has no member named 'num_slaves'
     306 |                                                                         acp_data->sdw->num_slaves))
         |                                                                                      ^~
>> sound/soc/amd/ps/pci-ps.c:304:38: error: too many arguments to function 'snd_soc_acpi_sdw_link_slaves_found'
     304 |                                 if (!snd_soc_acpi_sdw_link_slaves_found(dev, link,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/amd/ps/../mach-config.h:13,
                    from sound/soc/amd/ps/pci-ps.c:20:
   include/sound/soc-acpi.h:232:6: note: declared here
     232 | bool snd_soc_acpi_sdw_link_slaves_found(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/sof/amd/acp-common.c: In function 'amd_sof_sdw_machine_select':
   sound/soc/sof/amd/acp-common.c:148:86: error: 'struct sdw_amd_ctx' has no member named 'ids'
     148 |                                                                         acp_data->sdw->ids,
         |                                                                                      ^~
   sound/soc/sof/amd/acp-common.c:149:86: error: 'struct sdw_amd_ctx' has no member named 'num_slaves'
     149 |                                                                         acp_data->sdw->num_slaves))
         |                                                                                      ^~
>> sound/soc/sof/amd/acp-common.c:147:38: error: too many arguments to function 'snd_soc_acpi_sdw_link_slaves_found'
     147 |                                 if (!snd_soc_acpi_sdw_link_slaves_found(sdev->dev, link,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/sound/sof.h:16,
                    from sound/soc/sof/amd/../sof-priv.h:16,
                    from sound/soc/sof/amd/acp-common.c:13:
   include/sound/soc-acpi.h:232:6: note: declared here
     232 | bool snd_soc_acpi_sdw_link_slaves_found(struct device *dev,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snd_soc_acpi_sdw_link_slaves_found +304 sound/soc/amd/ps/pci-ps.c

bbf3e6145ea09c Vijendar Mukunda 2024-02-14  285  
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  286  static struct snd_soc_acpi_mach *acp63_sdw_machine_select(struct device *dev)
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  287  {
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  288  	struct snd_soc_acpi_mach *mach;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  289  	const struct snd_soc_acpi_link_adr *link;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  290  	struct acp63_dev_data *acp_data = dev_get_drvdata(dev);
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  291  	int ret, i;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  292  
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  293  	if (acp_data->info.count) {
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  294  		ret = sdw_amd_get_slave_info(acp_data->sdw);
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  295  		if (ret) {
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  296  			dev_dbg(dev, "failed to read slave information\n");
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  297  			return NULL;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  298  		}
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  299  		for (mach = acp_data->machines; mach; mach++) {
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  300  			if (!mach->links)
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  301  				break;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  302  			link = mach->links;
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  303  			for (i = 0; i < acp_data->info.count && link->num_adr; link++, i++) {
bbf3e6145ea09c Vijendar Mukunda 2024-02-14 @304  				if (!snd_soc_acpi_sdw_link_slaves_found(dev, link,
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

:::::: The code at line 304 was first introduced by commit
:::::: bbf3e6145ea09cf346ce09146b0b98415095f170 ASoC: amd: ps: add machine select and register code

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
