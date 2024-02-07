Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D027F12B151
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707341435; cv=none; b=dY2l5OVE3r5FjkfcyteY+2dvV39gAzYpiv8yc6wHW1AjN1JLrOZqRBQm4RJIBwPRmsx1jCetoyjwSieZN+EdFC/gtpY1NHgflLSSU1TuyHSIzwC77+bzFcuyUpEdNL/lt9e2/37rl1P6gQlOu8QnFgH42xPM5JB0di10HkOFza4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707341435; c=relaxed/simple;
	bh=2w70knLDUSGa4toKltA9HknjkqehdFX0wj5tbsqkLoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bc+psHKn3N4TR6EzYPQNF9n0AVNdYy4DS7Ap6GtfVHCL7ypQW3HEooYjAfYJvRxG5pSZDUl71w7ST8psCExmbY70F5TKXpudRwLAl2BH41sNRUXxjd+s9jBcIzEvfZY6AjFZf1RrcX9N+X/sBN4ufe/P07BXyufM+u5UzKgFVnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxDPPFz9; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxDPPFz9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707341433; x=1738877433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2w70knLDUSGa4toKltA9HknjkqehdFX0wj5tbsqkLoY=;
  b=bxDPPFz9Bb4xSn1zUNlHAC4w2/BntGEwJNvYxNINXV4Eo3wfmwfhlrvm
   T/z6zyqrTWt5Spur9RDqbaU6MsvfI6vQPnIRCYx/J7PTCEaLavCc9X7Fi
   E5VCLzjhDnTzydl9gC5XtduMBdl5HfvYiMD2Q8U/LuX6wt+SMADcHQh01
   UKzyEhqDJJwJL0ZR9704VbYzEh255ZxpZ6bDfhGJG3tc70B6SxH+3ai0W
   1W3+gSjZfeUV3+MAIpvdJ/+rMTGjtcWGti5rxTn33cbEiyogxXsZcUY2G
   FrJusZiYTQcM3zMxko7enITxs4NqiDfM/yGoxlhH2+zJA3wBZglSwMCOG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="395504104"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="395504104"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 13:30:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1764458"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2024 13:30:15 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXpUi-000340-0e;
	Wed, 07 Feb 2024 21:30:12 +0000
Date: Thu, 8 Feb 2024 05:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3124/3150] drivers/dax/super.c:45: warning:
 Function parameter or member 'KABI_RESERVE(1' not described in 'dax_device'
Message-ID: <202402080518.ety9dEEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ad149a3902264c23ab7b73dedc600a8a9dbb1b43
commit: 63101913bbd057cea31fb598eeb4a4c91584f0f0 [3124/3150] dax: kabi: Reserve KABI slots for dax_* struct
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240208/202402080518.ety9dEEd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402080518.ety9dEEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402080518.ety9dEEd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dax/super.c:45: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'dax_device'


vim +45 drivers/dax/super.c

7b6be8444e0f0d Dan Williams      2017-04-11  17  
1b7646014e0d83 Christoph Hellwig 2021-08-26  18  /**
1b7646014e0d83 Christoph Hellwig 2021-08-26  19   * struct dax_device - anchor object for dax services
1b7646014e0d83 Christoph Hellwig 2021-08-26  20   * @inode: core vfs
1b7646014e0d83 Christoph Hellwig 2021-08-26  21   * @cdev: optional character interface for "device dax"
1b7646014e0d83 Christoph Hellwig 2021-08-26  22   * @private: dax driver private data
1b7646014e0d83 Christoph Hellwig 2021-08-26  23   * @flags: state and boolean properties
db8cd5efeebc49 Ira Weiny         2022-03-04  24   * @ops: operations for this device
8012b866085523 Shiyang Ruan      2022-06-03  25   * @holder_data: holder of a dax_device: could be filesystem or mapped device
8012b866085523 Shiyang Ruan      2022-06-03  26   * @holder_ops: operations for the inner holder
1b7646014e0d83 Christoph Hellwig 2021-08-26  27   */
1b7646014e0d83 Christoph Hellwig 2021-08-26  28  struct dax_device {
1b7646014e0d83 Christoph Hellwig 2021-08-26  29  	struct inode inode;
1b7646014e0d83 Christoph Hellwig 2021-08-26  30  	struct cdev cdev;
1b7646014e0d83 Christoph Hellwig 2021-08-26  31  	void *private;
1b7646014e0d83 Christoph Hellwig 2021-08-26  32  	unsigned long flags;
1b7646014e0d83 Christoph Hellwig 2021-08-26  33  	const struct dax_operations *ops;
8012b866085523 Shiyang Ruan      2022-06-03  34  	void *holder_data;
8012b866085523 Shiyang Ruan      2022-06-03  35  	const struct dax_holder_operations *holder_ops;
63101913bbd057 Long Li           2024-02-07  36  
63101913bbd057 Long Li           2024-02-07  37  	KABI_RESERVE(1)
63101913bbd057 Long Li           2024-02-07  38  	KABI_RESERVE(2)
63101913bbd057 Long Li           2024-02-07  39  	KABI_RESERVE(3)
63101913bbd057 Long Li           2024-02-07  40  	KABI_RESERVE(4)
63101913bbd057 Long Li           2024-02-07  41  	KABI_RESERVE(5)
63101913bbd057 Long Li           2024-02-07  42  	KABI_RESERVE(6)
63101913bbd057 Long Li           2024-02-07  43  	KABI_RESERVE(7)
63101913bbd057 Long Li           2024-02-07  44  	KABI_RESERVE(8)
1b7646014e0d83 Christoph Hellwig 2021-08-26 @45  };
1b7646014e0d83 Christoph Hellwig 2021-08-26  46  

:::::: The code at line 45 was first introduced by commit
:::::: 1b7646014e0d838b06be7288e2dec3262948cc56 dax: mark dax_get_by_host static

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
