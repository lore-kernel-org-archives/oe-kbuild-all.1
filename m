Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E373221FD0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 22:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765491295; cv=none; b=hzgybo+RI1/o6g8MlTysirI8+hcFU3qpHzRWuIv+iIQXkQonTuFCkEdg7lvXr50kW7JrqfD4ccdO5vBNBJBWSi28yiSdJvcO+aCs8x8BRVWoIILh6MauulQzY23jIWzjhewwtBP73hd8TKyyTujWyn98KVSCZkOWfiNA1uO5rfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765491295; c=relaxed/simple;
	bh=yB+MzgSohP4VCM8o898PRBFCYr3r81ZsKdLKkMhmJPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c4UVd6VRfQqwwLRtcKGXzM9/1sWDC8xxr4caeyBvZu4N/Z9WUqbPvDh4PgE/AE0Eb1ui3gyW0fH2vtDb0MheJdd/u1dMVTbLq8sOW3CbxPtdJpix/YnR61xDPN9IbqwmdQqns/N6yFzX7lIyb7bpgv/sTooZkQqTqj7V3H7Ff/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drPPfiP8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drPPfiP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765491294; x=1797027294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yB+MzgSohP4VCM8o898PRBFCYr3r81ZsKdLKkMhmJPI=;
  b=drPPfiP8mHOAVgDJslBq+4W9Uf5HVb+jnLpEy7QX1o+mQQ51s9XpGgpA
   JITmkeAggTKxEzvnQ8D3wM+6F+gXh7PkYv+ObBWlN2EBI0pt0AHJt6JNL
   2cxeVoBH2mFeOJswtcecoNpVlfJUn7bqH2PENsn5Dm8JIVYWqGeDC1bi4
   ZsjSBTyJur5EEdjzZG7bquOSaEPtjPqoCOkA0pOBzpUT+u7FpjBaLw+vd
   lnK/Vxhf+9r3i8L8kHQkyFJBRLl0h88U6WCCIGvP4Mxok6hGAbkzryCIj
   66vHRBQyhRyBnzNLbXTTFGbVORKNYJb8l1MUOdEqvrqGdtnI7TErWKJBV
   Q==;
X-CSE-ConnectionGUID: hbbJ7mrITbeNdiSSkcaiwQ==
X-CSE-MsgGUID: S0ibKxevS4CiP58t2IwSwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71329446"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71329446"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 14:14:53 -0800
X-CSE-ConnectionGUID: LZuJmqAdSYiXUjDr0EFc/g==
X-CSE-MsgGUID: c9/xRjQUTJavvEf2b5D9zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="227974139"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2025 14:14:52 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTovy-000000001Cm-1DJW;
	Thu, 11 Dec 2025 22:14:50 +0000
Date: Thu, 11 Dec 2025 23:14:35 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] drivers/dax/super.c:45: warning:
 Function parameter or member 'KABI_RESERVE(1' not described in 'dax_device'
Message-ID: <202512112304.Mi0KvHRe-lkp@intel.com>
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
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 63101913bbd057cea31fb598eeb4a4c91584f0f0 [3508/3508] dax: kabi: Reserve KABI slots for dax_* struct
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512112304.Mi0KvHRe-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512112304.Mi0KvHRe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112304.Mi0KvHRe-lkp@intel.com/

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
