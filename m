Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CA130BF6C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766248952; cv=none; b=SR0sO0KHoEX4X7Gq0oDF6LZsfi1hxTe89+qxIcWJtsR33W82kVWCbvAoUMuwvxH2lHXvrMcdVRJfiGJYsXAxvYk/SxDlfHgQKE34cYWwt5ne0D8+knYGV+4yTtIMVsXwJKNYOz+/kx2e2edO7rQKhtlxeglOeapbjxsq5xJ+/yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766248952; c=relaxed/simple;
	bh=oVgytjpd6ddjhWA0G3ToGyMyk92IDTuz7N4S5P5Kicc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GwDynX+8deaJAiPa+h4HMcKFT5/BVQIRslPIad2JwW4FXatdm6IbQ8quRaBGMFmsKmr04A1xm0ZW3hWa7SDGDZdCUPv/H51oshvLcjZhHxDB7m5ToZrO9QIoX0gWyQ0OI0IpnHxjXyC5QF6x9KtspNJ2i2/Pcksg5mesb75xTtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arbGVMgV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arbGVMgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766248950; x=1797784950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oVgytjpd6ddjhWA0G3ToGyMyk92IDTuz7N4S5P5Kicc=;
  b=arbGVMgVXmSSHYR6O46wzLq83iWpLzAnPGBUjdEWq8gcmHAA/E5f+W3N
   tuwUPWYaYuJ82F+MwS67SAMbPNWizzhARO90R5f/x4rVa3ghSxoL+5J0p
   487Jc6lQ5U+q3gZEM4P71+aW9rYg+u/K5D6eQzvMPjpwIi6mpCFOg2K4S
   884QzynJKbjTxhO31rU5ANnWUy7+trHLRyBZUyKp6J+D6cjxY0CENCPZu
   Tot3vA0P5W9dNd86cFSmHqFfj/GrDuhciyDWZBJMuQm/lBVkvm+OqL6Nv
   gRq0mpEpxk6uVK3jAOJX8bd3RPnCs1U19ogR82C7mWY+1FGkS6uHfteq1
   A==;
X-CSE-ConnectionGUID: WzKYpCejQTGhSzeIWt0uEg==
X-CSE-MsgGUID: Y8YSyLGIQX+Uj/roiXV8lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78497133"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78497133"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:42:27 -0800
X-CSE-ConnectionGUID: XSnBYuIOSfm3EO14t8OtHg==
X-CSE-MsgGUID: 9TBYLWPpRI+WYZlXqtEeDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199649430"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2025 08:42:26 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX02B-000000004tJ-38vY;
	Sat, 20 Dec 2025 16:42:23 +0000
Date: Sun, 21 Dec 2025 00:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542] drivers/dax/super.c:45: warning:
 Function parameter or member 'KABI_RESERVE(1' not described in 'dax_device'
Message-ID: <202512210038.6F02IwRo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Long,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 63101913bbd057cea31fb598eeb4a4c91584f0f0 [3542/3542] dax: kabi: Reserve KABI slots for dax_* struct
config: x86_64-randconfig-014-20251215 (https://download.01.org/0day-ci/archive/20251221/202512210038.6F02IwRo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210038.6F02IwRo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210038.6F02IwRo-lkp@intel.com/

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
