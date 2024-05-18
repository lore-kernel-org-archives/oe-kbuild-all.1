Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DEEF4EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716034573; cv=none; b=tWmV4rXMKz4MfZebh4JKxK3HWLer08zY4Vgmt5cTSQ0e+4oEf3u+up7VZ18JPO/WNV6Av4YWiTLM0YbrkkyttLdwz5CiSK4CJKWdYOJ3HxrJxDNVGUKvj+mOmN/lxiMrIeBLwZr4n9MNAh9U71Fa8gxS80sVt1wE9bA0Ts0XdMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716034573; c=relaxed/simple;
	bh=tZjOBAQkMZlhZQtTrSNS0dVmVtWpLXy1N2VuseCTLxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=saHDqmkdRAFWbxyu2zG0HCmES2pq+TEL9vWE/q9eqQH1UVG9i/i/uqXtl+LFdBN6Oq4JuLF9sj+xsdtLcbCdkzrAS9CETVPZaxi2TJkRlzVFkpCJT0CvAn86J4TZuKzHk0igZU1RcPwU/IkBOJ5wEu9bWQHJDiB3jm7LawLAHI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mlCE0GdK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlCE0GdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716034571; x=1747570571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tZjOBAQkMZlhZQtTrSNS0dVmVtWpLXy1N2VuseCTLxo=;
  b=mlCE0GdKsMsLmvkFUuQ1EEXo/766CLk8+J9HEQjz4M6aWUclarH/IAaL
   4kz9+Hna4b6T//qaiFptBUqvvT7DjRwPE1H2mZadRv4ReKUQusObiBWai
   NJKbgTcCwd9ajFvbnmtZ+QrxiWO5gokWWp6Kl2xtKMv6dM7fSCBcxTWvJ
   5kGiPVcVo2f+/CjKMIXcGatd/mMdDlYlPtpa+x21z3rVpHKlBFpdB1W0s
   ooSLgwtTSryz/Njj69cBQ6SV1xIyDscv00eaXjr9ecwD++Arqgqwz16Xr
   XtoAVzfjh1oFBNaL1rAuIPIrsA1i2r1bE00z+s0/6Bxf9bGwyASr05buZ
   A==;
X-CSE-ConnectionGUID: Qsc9tkLCQVGx1gNKdrx3UQ==
X-CSE-MsgGUID: lA6FMzv6T7WaXrQvjxQFjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12014157"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12014157"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 05:16:11 -0700
X-CSE-ConnectionGUID: ukBJMjNNRDuZevsNApP33w==
X-CSE-MsgGUID: 6+hGZEOFSVGSd6ax4p5STA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="31905528"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 May 2024 05:16:09 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Iyt-0002BV-1w;
	Sat, 18 May 2024 12:16:07 +0000
Date: Sat, 18 May 2024 20:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/rt712-quirks 17/25]
 sound/soc/amd/ps/pci-ps.c:305:86: error: 'struct sdw_amd_ctx' has no member
 named 'ids'
Message-ID: <202405182046.ywpq4so6-lkp@intel.com>
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
commit: 2e90b1ef0200f17af369e575e92d915a4f7e9db4 [17/25] soundwire: AMD: remove unused structure members
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240518/202405182046.ywpq4so6-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182046.ywpq4so6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182046.ywpq4so6-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/amd/ps/pci-ps.c: In function 'acp63_sdw_machine_select':
>> sound/soc/amd/ps/pci-ps.c:305:86: error: 'struct sdw_amd_ctx' has no member named 'ids'
     305 |                                                                         acp_data->sdw->ids,
         |                                                                                      ^~
>> sound/soc/amd/ps/pci-ps.c:306:86: error: 'struct sdw_amd_ctx' has no member named 'num_slaves'
     306 |                                                                         acp_data->sdw->num_slaves))
         |                                                                                      ^~
--
   sound/soc/sof/amd/acp-common.c: In function 'amd_sof_sdw_machine_select':
>> sound/soc/sof/amd/acp-common.c:148:86: error: 'struct sdw_amd_ctx' has no member named 'ids'
     148 |                                                                         acp_data->sdw->ids,
         |                                                                                      ^~
>> sound/soc/sof/amd/acp-common.c:149:86: error: 'struct sdw_amd_ctx' has no member named 'num_slaves'
     149 |                                                                         acp_data->sdw->num_slaves))
         |                                                                                      ^~


vim +305 sound/soc/amd/ps/pci-ps.c

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
bbf3e6145ea09c Vijendar Mukunda 2024-02-14  304  				if (!snd_soc_acpi_sdw_link_slaves_found(dev, link,
bbf3e6145ea09c Vijendar Mukunda 2024-02-14 @305  									acp_data->sdw->ids,
bbf3e6145ea09c Vijendar Mukunda 2024-02-14 @306  									acp_data->sdw->num_slaves))
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

:::::: The code at line 305 was first introduced by commit
:::::: bbf3e6145ea09cf346ce09146b0b98415095f170 ASoC: amd: ps: add machine select and register code

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
