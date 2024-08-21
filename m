Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E29137745
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 19:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724269799; cv=none; b=WcHVLyf35+yIwaudFu44AudN5+prZsdL9uq7dr1jml9PW39wX3/yuUYhmmtvIiYNgax951y/ij33IXZla/vuQKUAWi/AeJZzUsNionc+eYc08kfAP0jPGajiuDh/rxFnCKHZvkSY9vzpI7eGOeq7dkbsreOifiRJrnUlqcM++cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724269799; c=relaxed/simple;
	bh=PfLwEskyf4x9q6d6VqJeJKCfBkN4MZPYu1N/N+1P4s0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SVwP2SSTuGHAg5SQhlZ5/auVs0QigVjg43IJOhZXaPfNLp/zXFBlgCWq9YxWmSOugCsSso5AstmA2381IC87IEgkZC1N48zB5mtTGrExj1e8UR3umGWf1mpY2rbwChn4A0v7R4OFwtpx2Sc1youVk5S91183ayIjnAU6UgLF5F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6yrxvSz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6yrxvSz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724269798; x=1755805798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PfLwEskyf4x9q6d6VqJeJKCfBkN4MZPYu1N/N+1P4s0=;
  b=I6yrxvSzVAhhqjPbrXsoeSpLn6uZ+FS1V9Ym3soYb9zPTxQTaFDfegPo
   dbVMlRQgJ2Q1Wz37BZ1gQyJFXEE1OLlz3dBHwuDS6lIoEJ2xpsBe2HxMd
   QjIowJFRh66TqPTnLKL+4wR/Ju6haCHX5ABv0uV24y3whifXBkdFpN+DO
   8LKRk8NORVr2tjf6XAvRuxy4bLH9hAMJcp50xC9SSy0guZZ9hU+GrlHvE
   Z+eCURhrL4Lh24ChYCrNM4bLSGZfGq26iDaKb7wiCxLICt+m2928KFEn1
   0HRG67hNng2zH/RPCxCE0UtuQio8rIGyHXGaDjhpt1BgqeGt5jH7pmGxG
   A==;
X-CSE-ConnectionGUID: yWjIUB2GQ7aPQ65rjldAtA==
X-CSE-MsgGUID: q2OdxQp0R2GbfJyy33xPng==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40165944"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="40165944"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 12:49:57 -0700
X-CSE-ConnectionGUID: V8DX7VMVSfak1heM2Qb0zQ==
X-CSE-MsgGUID: CeeG4j8vRoKr0Jb8q0pBnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61721857"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Aug 2024 12:49:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgrL7-000Bsq-2S;
	Wed, 21 Aug 2024 19:49:53 +0000
Date: Thu, 22 Aug 2024 03:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 17/20] include/linux/cxl/mailbox.h:66:24: error:
 field 'mbox_wait' has incomplete type
Message-ID: <202408220316.6IhkeTfi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   3175f4c0e49e730b73cd11048737516e461acf09
commit: e6537a248fe6241de233cf02c499dfd48ce73fce [17/20] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408220316.6IhkeTfi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220316.6IhkeTfi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220316.6IhkeTfi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/fwctl/cxl/cxl.c:7:
>> include/linux/cxl/mailbox.h:66:24: error: field 'mbox_wait' has incomplete type
      66 |         struct rcuwait mbox_wait;
         |                        ^~~~~~~~~
   drivers/fwctl/cxl/cxl.c: In function 'cxlctl_info':
>> drivers/fwctl/cxl/cxl.c:45:16: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      45 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                ^~~~~~~
>> drivers/fwctl/cxl/cxl.c:45:14: warning: assignment to 'struct fwctl_info_cxl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      45 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |              ^
   drivers/fwctl/cxl/cxl.c: In function 'cxlctl_validate_set_features':
>> drivers/fwctl/cxl/cxl.c:66:13: error: implicit declaration of function 'copy_from_user' [-Werror=implicit-function-declaration]
      66 |         if (copy_from_user(&uuid, u64_to_user_ptr(send_cmd->in.payload),
         |             ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mbox_wait +66 include/linux/cxl/mailbox.h

b92a097067314d Dave Jiang 2024-07-18  45  
b92a097067314d Dave Jiang 2024-07-18  46  /**
b92a097067314d Dave Jiang 2024-07-18  47   * struct cxl_mailbox - context for CXL mailbox operations
b92a097067314d Dave Jiang 2024-07-18  48   * @host: device that hosts the mailbox
b92a097067314d Dave Jiang 2024-07-18  49   * @adev: auxiliary device for fw-ctl
e5c38a2af470e8 Dave Jiang 2024-07-18  50   * @enabled_cmds: Hardware commands found enabled in CEL.
e5c38a2af470e8 Dave Jiang 2024-07-18  51   * @exclusive_cmds: Commands that are kernel-internal only
b92a097067314d Dave Jiang 2024-07-18  52   * @payload_size: Size of space for payload
b92a097067314d Dave Jiang 2024-07-18  53   *                (CXL 3.1 8.2.8.4.3 Mailbox Capabilities Register)
b92a097067314d Dave Jiang 2024-07-18  54   * @mbox_mutex: mutex protects device mailbox and firmware
b92a097067314d Dave Jiang 2024-07-18  55   * @mbox_wait: rcuwait for mailbox
b92a097067314d Dave Jiang 2024-07-18  56   * @mbox_send: @dev specific transport for transmitting mailbox commands
69f846d7538bdd Dave Jiang 2024-07-18  57   * @features: number of supported features
b92a097067314d Dave Jiang 2024-07-18  58   */
b92a097067314d Dave Jiang 2024-07-18  59  struct cxl_mailbox {
b92a097067314d Dave Jiang 2024-07-18  60  	struct device *host;
b92a097067314d Dave Jiang 2024-07-18  61  	struct auxiliary_device adev; /* For fw-ctl */
e5c38a2af470e8 Dave Jiang 2024-07-18  62  	DECLARE_BITMAP(enabled_cmds, CXL_MEM_COMMAND_ID_MAX);
e5c38a2af470e8 Dave Jiang 2024-07-18  63  	DECLARE_BITMAP(exclusive_cmds, CXL_MEM_COMMAND_ID_MAX);
b92a097067314d Dave Jiang 2024-07-18  64  	size_t payload_size;
b92a097067314d Dave Jiang 2024-07-18  65  	struct mutex mbox_mutex; /* lock to protect mailbox context */
b92a097067314d Dave Jiang 2024-07-18 @66  	struct rcuwait mbox_wait;
b92a097067314d Dave Jiang 2024-07-18  67  	int (*mbox_send)(struct cxl_mailbox *cxl_mbox, struct cxl_mbox_cmd *cmd);
69f846d7538bdd Dave Jiang 2024-07-18  68  	int num_features;
69f846d7538bdd Dave Jiang 2024-07-18  69  	struct cxl_feat_entry *entries;
b92a097067314d Dave Jiang 2024-07-18  70  };
b92a097067314d Dave Jiang 2024-07-18  71  

:::::: The code at line 66 was first introduced by commit
:::::: b92a097067314dc5012317d92d936ef453466886 cxl: Move mailbox related bits to the same context

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
