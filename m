Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC3D3D3AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 19:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714246734; cv=none; b=OJZNaRztpR76XgCqwrqpeEwa2CymNcPsSwQw03xdmwLkECvx4pR1gY4hMGnRplZIIufzALHjKM+SO2cv6B9cQL4xLugGZTLKclUexyyZw22IA6G4lxkJYfqLva3yJ4eCI3wLze2K433zFhekQ337M5qQ5caGmxtxCF1TFsMzslU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714246734; c=relaxed/simple;
	bh=P/sL2nF7Z9xmlV0kAu7qvhcfVM6+dD99BbljgkRniZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tiljcl3Ghjlognta4+pD0YOjbPHzmGpp5uqWZXZQs2X/SbjryYAyTcPuKC3/rVtem7XVCMFcS1fNf8SZDfz0KomRUl32jbYkXA8Jn6fnRC+oYAJLt8fLmlRtyGZXE/ryJNPyoG0YrLHAFSBxTetub9jP95jDZuF26tcWOifF+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2ycn5yI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2ycn5yI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714246732; x=1745782732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P/sL2nF7Z9xmlV0kAu7qvhcfVM6+dD99BbljgkRniZ0=;
  b=Y2ycn5yI41YxTlfi8mAGsf6xPVkRuNqZgc4mBJbUZmPapUip6Y44eouA
   31hKh5JHAgYMamE9od1Qz6GOfdo66YkfsdGD/UQO7MvlVA0m8k0kT1CWG
   n4IMnzqXho35UjPFuFp3OkPksWPHu3PTcjVj6jClFuuSeI6jL9flwd4TH
   33wIQbORGhJeT9Cw47pa7KSn3NHLHZLnOmdVnOK/4pFClHL72/SLMOaxx
   VJYNaitvaPi2aDQBdStisXxBkbViPv/iUW6FtP8hJe+xRuHqe4Cph2P/D
   KjEbPBcM51HvE208VKBNWmfZg+dS7JGl+iTDElecE5uwCs5lXBHmgCu5J
   w==;
X-CSE-ConnectionGUID: TBPajxJjQ9uQJg1QBeZ9BQ==
X-CSE-MsgGUID: krbHGzCbTAiVTqM9qx8X7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9807763"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="9807763"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 12:38:51 -0700
X-CSE-ConnectionGUID: CaTtUN/NSmmKKLleDSXw5Q==
X-CSE-MsgGUID: YsegK8AjS4WrpwOkaI7nJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25797079"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Apr 2024 12:38:50 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0nsl-0005R2-2O;
	Sat, 27 Apr 2024 19:38:47 +0000
Date: Sun, 28 Apr 2024 03:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Harsha Harsha <harsha.harsha@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 986/991]
 drivers/firmware/xilinx/zynqmp.c:510:16: warning: unused variable 'api_id'
Message-ID: <202404280350.II89P3j6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   08ceadacc1da15a77045dee6654f9cd906906271
commit: fc84226b26fa1b852ada58d04401d9660725549b [986/991] firmware: xilinx: Fix feature check for crypto drivers
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240428/202404280350.II89P3j6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280350.II89P3j6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280350.II89P3j6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/xilinx/zynqmp.c: In function 'xlnx_get_crypto_dev_data':
>> drivers/firmware/xilinx/zynqmp.c:510:16: warning: unused variable 'api_id' [-Wunused-variable]
     510 |         u32 v, api_id;
         |                ^~~~~~


vim +/api_id +510 drivers/firmware/xilinx/zynqmp.c

03ffa9af3a5ff88 Dhaval Shah    2023-07-31  500  
32cc91c6435a6e8 Dhaval Shah    2023-12-08  501  /**
32cc91c6435a6e8 Dhaval Shah    2023-12-08  502   * xlnx_get_crypto_dev_data() - Get crypto dev data of platform
32cc91c6435a6e8 Dhaval Shah    2023-12-08  503   * @feature_map:	List of available feature map of all platform
32cc91c6435a6e8 Dhaval Shah    2023-12-08  504   *
32cc91c6435a6e8 Dhaval Shah    2023-12-08  505   * Return: Returns crypto dev data, either address crypto dev or ERR PTR
32cc91c6435a6e8 Dhaval Shah    2023-12-08  506   */
32cc91c6435a6e8 Dhaval Shah    2023-12-08  507  void *xlnx_get_crypto_dev_data(struct xlnx_feature *feature_map)
32cc91c6435a6e8 Dhaval Shah    2023-12-08  508  {
32cc91c6435a6e8 Dhaval Shah    2023-12-08  509  	struct xlnx_feature *feature;
32cc91c6435a6e8 Dhaval Shah    2023-12-08 @510  	u32 v, api_id;
32cc91c6435a6e8 Dhaval Shah    2023-12-08  511  	int ret;
32cc91c6435a6e8 Dhaval Shah    2023-12-08  512  
32cc91c6435a6e8 Dhaval Shah    2023-12-08  513  	ret = zynqmp_pm_get_api_version(&v);
32cc91c6435a6e8 Dhaval Shah    2023-12-08  514  	if (ret)
32cc91c6435a6e8 Dhaval Shah    2023-12-08  515  		return ERR_PTR(ret);
32cc91c6435a6e8 Dhaval Shah    2023-12-08  516  
32cc91c6435a6e8 Dhaval Shah    2023-12-08  517  	feature = feature_map;
32cc91c6435a6e8 Dhaval Shah    2023-12-08  518  	for (; feature->family; feature++) {
32cc91c6435a6e8 Dhaval Shah    2023-12-08  519  		if (feature->family == pm_family_code &&
32cc91c6435a6e8 Dhaval Shah    2023-12-08  520  		    (feature->subfamily == ALL_SUB_FAMILY_CODE ||
32cc91c6435a6e8 Dhaval Shah    2023-12-08  521  		     feature->subfamily == pm_sub_family_code)) {
116c4543d61c2f1 Mounika Botcha 2024-03-12  522  			if (feature->family == ZYNQMP_FAMILY_CODE ||
116c4543d61c2f1 Mounika Botcha 2024-03-12  523  			    feature->family == VERSAL_FAMILY_CODE) {
fc84226b26fa1b8 Harsha Harsha  2024-04-19  524  				ret = zynqmp_pm_feature(feature->feature_id);
32cc91c6435a6e8 Dhaval Shah    2023-12-08  525  				if (ret < 0)
32cc91c6435a6e8 Dhaval Shah    2023-12-08  526  					return ERR_PTR(ret);
32cc91c6435a6e8 Dhaval Shah    2023-12-08  527  			} else {
32cc91c6435a6e8 Dhaval Shah    2023-12-08  528  				return ERR_PTR(-ENODEV);
32cc91c6435a6e8 Dhaval Shah    2023-12-08  529  			}
32cc91c6435a6e8 Dhaval Shah    2023-12-08  530  
32cc91c6435a6e8 Dhaval Shah    2023-12-08  531  			return feature->data;
32cc91c6435a6e8 Dhaval Shah    2023-12-08  532  		}
32cc91c6435a6e8 Dhaval Shah    2023-12-08  533  	}
32cc91c6435a6e8 Dhaval Shah    2023-12-08  534  	return ERR_PTR(-ENODEV);
32cc91c6435a6e8 Dhaval Shah    2023-12-08  535  }
32cc91c6435a6e8 Dhaval Shah    2023-12-08  536  EXPORT_SYMBOL_GPL(xlnx_get_crypto_dev_data);
32cc91c6435a6e8 Dhaval Shah    2023-12-08  537  

:::::: The code at line 510 was first introduced by commit
:::::: 32cc91c6435a6e8fbe03b9542ff79f8ad27b37ca firmware: xilinx: get platform information

:::::: TO: Dhaval Shah <dhaval.r.shah@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
