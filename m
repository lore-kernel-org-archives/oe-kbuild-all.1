Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0CC20103D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 20:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736369394; cv=none; b=nBtEwB1uB9n35UlaZhrxZ2NzWGjHyc4Rrf82NSzi6N5O+l+OvSdOe+MRYyR8VDF0ftTm38sLrPMV0WkI7MQSGUIp21E8n+UNS5nXxGVK26dG5iM4g2RDte/i4GCA+6QU9nJKDJQZLnom07dnxFmCpD4tojhJOnft3kR2EfokeAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736369394; c=relaxed/simple;
	bh=Ba89oTnfyI9WV8bcWYTTxHg909b3TGUbrGG/YbQlK5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pMnY9gQQjDavouT+q2oVTA9cvsc4Y4TDJIhaFq1WASPNtqACH3ZQOCWouPuG/1V+KcP0r7Qs81R6yNmUYeQu0EVsgpMQ7Z2mEaCenwHpgff13BRu9VDaTldSILpeNxWJ5RSCjkw+OjpmKT7yDfQbHtTDdDhRPACTmNH76ORBNnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgbCMJqw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgbCMJqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736369392; x=1767905392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ba89oTnfyI9WV8bcWYTTxHg909b3TGUbrGG/YbQlK5c=;
  b=JgbCMJqw355pn+6EQ0LOfPf73U8zy1Y4LRax8C+3my78aIeX+1J/aE8U
   sp2RzjJTQX3ERXRI1x/LmWtZkkWd0REBJBlW01d08EXFCSKurLb3gGtDs
   X/ATvA4eZ7q7Va0ijOnvp9PPlonDmcJMHZYd28x9OlJ3sOxRYS88gSM04
   1SK8wkEnVoPgKjIbYaiNZcSqXOwml4WDAid/Bl9YukEjnWyMsudNdWuxq
   5mTRLhErAF1C4W5yFX/sVXkCtAJzBm6UV1+Y8yAc4r7ZSD+ZrZt9S2f9D
   LaEx9YkLeogpcJYvkIBCUMnCeNaa3cOC+0s6qgPtOuxdfuZVdtg4gd+RP
   g==;
X-CSE-ConnectionGUID: cBCSLoB+TMqxSva1bAswbg==
X-CSE-MsgGUID: 4qkSFX3LQDaLhHJNZtA9uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36496087"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="36496087"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 12:49:52 -0800
X-CSE-ConnectionGUID: 0+azlfzCTj6hV9auzBwhsQ==
X-CSE-MsgGUID: hFXIch3aR5aKIaIuZtbP3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="103412551"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jan 2025 12:49:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVczr-000Gfv-24;
	Wed, 08 Jan 2025 20:49:47 +0000
Date: Thu, 9 Jan 2025 04:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Moritz Fischer <mdf@kernel.org>,
	Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>
Subject: drivers/fpga/versal-fpga.c:78:34: warning: 'versal_fpga_of_match'
 defined but not used
Message-ID: <202501090440.ExDRHeJU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nava,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0b7958fa05d562e514fd0abe2a4800042abf868b
commit: 01c54e628932c655e4cd2c6ed0cc688ec6e6f96b fpga: versal-fpga: Add versal fpga manager driver
date:   3 years, 6 months ago
config: sh-randconfig-r023-20230105 (https://download.01.org/0day-ci/archive/20250109/202501090440.ExDRHeJU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090440.ExDRHeJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090440.ExDRHeJU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/fpga/versal-fpga.c:78:34: warning: 'versal_fpga_of_match' defined but not used [-Wunused-const-variable=]
      78 | static const struct of_device_id versal_fpga_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +/versal_fpga_of_match +78 drivers/fpga/versal-fpga.c

    77	
  > 78	static const struct of_device_id versal_fpga_of_match[] = {
    79		{ .compatible = "xlnx,versal-fpga", },
    80		{},
    81	};
    82	MODULE_DEVICE_TABLE(of, versal_fpga_of_match);
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
