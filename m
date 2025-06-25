Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB7A215062
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 21:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750886646; cv=none; b=Q7wJaxUsNrONL2WdyQVksZU/kn94hzProcxmaHuzYfBB1aSGilOg3M848TtBXeYUWePXRL6nfLCDyUzg9IfSK3O8N4sM3H48+i0JjJ4PRNjPTrUQs2jSJSQUyRHaPv+jWgoDL7o9gCRZ5Frf/nVcaawBUJL3j90w4lE2D43W3os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750886646; c=relaxed/simple;
	bh=UiU22gz6mWOSYtksqFHfQPP22IyQ6VvvU/2zzO3HztM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fQ5u28S709pf1hYyYq46PLby9KuGEGr7pnNvUR0yE2qPqtQc8mVfVRd3JAkVb1L2WkWl/wP+HYhNcxCAQy05HJqoJokk0TE1XwBUYGsEM7x601WRELLoIgf5sIWxTvbY/PkxtkYUL9h9znm7LBDU+ZHrpLyYSlo///9smCKnQU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcK56VhV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcK56VhV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750886645; x=1782422645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UiU22gz6mWOSYtksqFHfQPP22IyQ6VvvU/2zzO3HztM=;
  b=PcK56VhV4mYZzXFgYG4V2MAGPold0THg30rnmGYaQHOWuGqxO5MPMqqM
   9zHA4u5dR6K0dtlZIJ+/qa90OxZ8f+Oy/MLxL2AY/eKnlR16yKtSph8z/
   SyB/78ATuq2sfNXP8A6ag1JIy2+mM/rwQgIy7Z1/OsARZP7D/DFlNQEo1
   MJfl4jiPZ9lOIcQoJ80QdV/hrThKzJhc/gSPQb1lF1Ytzz3eK6EbWDwuC
   smxqnRqXLdcuhVTOoyIABFpUoUCdlkgY5iJgwWv06g/YPhg/5wftSj49y
   sny86ujLSAIR2r1Wj5WBX378DoK2wxjaSyYR/Tdzh8XlHP9CLQv2sydUB
   g==;
X-CSE-ConnectionGUID: JYmEh7vyQmWGhO8pu/4T0w==
X-CSE-MsgGUID: DBV38zghS+6fVVBiR+Kw4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="78605982"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="78605982"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 14:24:04 -0700
X-CSE-ConnectionGUID: dM0dDkgURB6Bkulh+9GO8w==
X-CSE-MsgGUID: 8s4zR9kfSzmD27L0V3KEzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="157826765"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jun 2025 14:24:03 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUXb6-00004d-1m;
	Wed, 25 Jun 2025 21:24:00 +0000
Date: Wed, 25 Jun 2025 23:23:00 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] drivers/dax/super.c:45: warning:
 Function parameter or member 'KABI_RESERVE(1' not described in 'dax_device'
Message-ID: <202506260545.EUm4TtiQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: 63101913bbd057cea31fb598eeb4a4c91584f0f0 [2195/2195] dax: kabi: Reserve KABI slots for dax_* struct
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250626/202506260545.EUm4TtiQ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260545.EUm4TtiQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260545.EUm4TtiQ-lkp@intel.com/

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
