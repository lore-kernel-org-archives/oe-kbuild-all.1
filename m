Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F244D8BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 14:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726843619; cv=none; b=OPJmm5EUoGgkKw74dq/oNLK/Jc+QoBRLB7q+cenqrzC8+6LjijyR/MXG20vphpIV1JCzIAl61m7npHS0O10DKXg08kt9Qe+Yq962F/0zF6K9TTphZ+1o8slr2S8Q1TM6I8qz6k3GYWjK6MyMod3ZHpsZ6kShBvzddWd53PYaJcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726843619; c=relaxed/simple;
	bh=ysBTmCjA8EtAdYnNoqznzZds8kYAkwo2L31YU7ZJWGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bbgSBlE4Eqyr8yDU6hYdbut8XfIEVZyd80FSPG9dgWbTnfkgTaCOaUfkFGmkPxkBZKR0bCTTuJMOajkXQ6KlBC/wQAWTqS6lHH4eb9gd/RrLeXWKQdEH95s0knnsCz3OjaYsy51wN6xRIDB7YAyU0MI1W17tnRVHXrEDdFYFAw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TUnJMDZb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUnJMDZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726843617; x=1758379617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ysBTmCjA8EtAdYnNoqznzZds8kYAkwo2L31YU7ZJWGE=;
  b=TUnJMDZbj+CxnzZPRyHEyiZVIl/Oh2wU5LwdZHy7GVYEee7KhOXvfaSq
   xcBIfMoZBPXMOL2QARNOZ+9ltx+nnPeGMiTDfKhJXi/nHsGGvEVMAoagx
   LWlIM8FHwp+0vA5kgK7mKGilYJzE43HB58IPWKgqhVtwwFRTm/fWlVvDe
   lVjErBjcICA0qhMrn7QDupWqszdVVUHKefTbvM3n4+wAunE7CBRcwxAv1
   P+0YPPxzdLy4dvOFSMeDXFa0CgMIkhNhelM6JG/WzdtuG/POIFBnVi8Ai
   R56zKB7bbR0JT/bjJK0Qou5RD+/aMnyDZCseCYdxr2DY3crb22quO7Mtq
   A==;
X-CSE-ConnectionGUID: RuLt4huiQSqtLuZHy+izRw==
X-CSE-MsgGUID: NJiH44a9QZW9jCBJKy9qWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29582535"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="29582535"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:46:57 -0700
X-CSE-ConnectionGUID: AGXSzTjcTn6C9JM91iLgVQ==
X-CSE-MsgGUID: plw61WVFT0eyDhqMBrwYHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="75091622"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Sep 2024 07:46:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sreuL-000EY1-02;
	Fri, 20 Sep 2024 14:46:53 +0000
Date: Fri, 20 Sep 2024 22:46:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 17/19] include/linux/cxl/mailbox.h:66:24: error:
 field 'mbox_wait' has incomplete type
Message-ID: <202409202254.fuZ7sAda-lkp@intel.com>
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
commit: 0490d2063eae6efc3c0ae64c562489926e4876e1 [17/19] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240920/202409202254.fuZ7sAda-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409202254.fuZ7sAda-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409202254.fuZ7sAda-lkp@intel.com/

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
