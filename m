Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001711BB6B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 07:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726212283; cv=none; b=vFJG2UbMV+lBun2VqybwOjHaMjBydOEkjrVtC4CjaGolVEdvEqbZ/X/ppaWrJSon+BWgBfUtYpfe9tnWo9EV6leteD5rSi4vInFKSlLeKPXHjbgDl1azKuZmkRwG85uPJebY/PmpDczpz//ujUs1iWVlnbOaJYKPYgU9n0Dq7M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726212283; c=relaxed/simple;
	bh=1QikKvUVp6ha74jHrObgwk45QIgAQV6sEqzB7cUhAKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H5WZZmhMIhLyEzZGOQI4rZWw9IdIBh74LaciubI9u1SfS/bVvK5sS4ztKFcqSSUF32AbQpgw5RQp7/5YUFbOUZSRwAJwTC1iJGATw3k2oH9qyKU3I9Paq/wxyz4LGWt/o2NAh6xfmeyPzi0+G4BY3nGYEl3x/zZb5pQ9/XqzIOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUBmLYxy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUBmLYxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726212282; x=1757748282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1QikKvUVp6ha74jHrObgwk45QIgAQV6sEqzB7cUhAKQ=;
  b=WUBmLYxyUUVCWcQC6UOnsX7V6R88F82kpF9Sc1BiNegAu1qA8mLlp9pD
   H47E+MSGQVp3RJ+kLi+XaeMItlMsIcmj3vceOJ0JlXmRxMRqD3wdP2B5/
   h+a1rmwfOqgr/WdU5A2e5j+MDHJpAlx2Islj8O2SULXsJeb6NSClW0H3P
   gV184xDpW7Kz/31Efi3ImGq5pZeqPTdwXcYsePurelHOr3/UIJXkbUhUw
   CJxSjrHBGzJJwEj1yKRP6rVe+XGG3vDhdxuiP7/uP6r2KHbZnwT6yJXWX
   DEOECJ9DjEm4ThS6AXf1fjopoTOQxTnA8AYIv4ClBpWSrdtQEBdqFdd3N
   A==;
X-CSE-ConnectionGUID: uMqDAeEWSM6oS+Q+Ehsw6A==
X-CSE-MsgGUID: TVcKN+T9SQCoZRzqt8IzBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="47618299"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="47618299"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 00:24:41 -0700
X-CSE-ConnectionGUID: lSuYPpQaRXibLYMCR7Y1jA==
X-CSE-MsgGUID: SL7OP9lFSS21Jzs7ve7x6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="98660481"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Sep 2024 00:24:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp0fV-00068M-2o;
	Fri, 13 Sep 2024 07:24:37 +0000
Date: Fri, 13 Sep 2024 15:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240912 36/39] ERROR: modpost:
 "pci_pasid_ctrl_status" [drivers/iommu/iommufd/iommufd.ko] undefined!
Message-ID: <202409131551.UnO5JRID-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240912
head:   2af6b607c28e8d86f73f2390c954b5953651da60
commit: 9ff1a7ee87c0501007931ac8e72d99a91a629421 [36/39] iommufd: Extend IOMMU_GET_HW_INFO to report PASID capability
config: i386-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131551.UnO5JRID-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131551.UnO5JRID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131551.UnO5JRID-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
>> ERROR: modpost: "pci_pasid_ctrl_status" [drivers/iommu/iommufd/iommufd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
