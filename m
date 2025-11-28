Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6B62FC02F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319572; cv=none; b=HqPd6SRvEthhZ1oOfL7KXLjnxzv07wbDdFUijesWDYSWz4ax9GGosxcI9A12YILPaloZMkF2oWnHnmYT9nmOmTvsSZCJ6gRdcBWOd7TemWty0iBHcP4OErrslRHa+F+3oUTPeCAHWNIkg6GtylNGX7Wji6rzSmCR4UCDCFGdZPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319572; c=relaxed/simple;
	bh=MFWYKHdvB7b8qPTj7Q2QevElT3RmAa802y4WrfUS7wk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ck6iqXEefvofmjkfrzMcoSuGQsAUHfmgpxPzrCM0l3gOhiQP2znfUHYUNk6MERCi7lWR0IRcnRsKV7YEh5IzCYLcXQYbmGY0oywQsjfm7aD9bhFZeaUlzYjQZ4i/yJw7pYNrJA0hM/qBQQvHor6LHi1GufNw6736Jhreng1XKGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EdEazkxE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdEazkxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764319569; x=1795855569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MFWYKHdvB7b8qPTj7Q2QevElT3RmAa802y4WrfUS7wk=;
  b=EdEazkxEzWTWMsZM2mZpuNsUmFL61oG/bxMNpIioy86Zq3J5UQbMDvOm
   sz7iNL7sugu5+jST0lpStQfmm3yKR2rwQGV6kDwNndwY+H0dLWbq5B11h
   cFhy+4xYa8D4rCnw/jV9x8UXXLhBzu07fEv++1OyaqFu2if+gRSfYttaq
   NEDbVI1CWxHtxRqHnvUPyyTCqSEYG91zB7EIk/bfu30qIhVjoU+deVR6Q
   XTD5N8zRk0sAEGVhOLDID8jmjhsuWIUdq1C52dOLKbuxQijrLKvXqc7f/
   sR2CH7BQ0AFBwEnagHpuwwMfSXcCAgoxrW5kpSYtT5hVmFa/dbxlFJhVp
   g==;
X-CSE-ConnectionGUID: G+skO3jiSHCEKhaiPwZsQw==
X-CSE-MsgGUID: 38FVm4INQvmxDBdrEWdGNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66250168"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66250168"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 00:46:06 -0800
X-CSE-ConnectionGUID: U3oZOMMHQMStOQqiASH8hQ==
X-CSE-MsgGUID: mxXSrrIKR0SSbFIrRkZ82g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192538987"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Nov 2025 00:46:05 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOu78-000000006C7-3O3J;
	Fri, 28 Nov 2025 08:46:02 +0000
Date: Fri, 28 Nov 2025 16:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3355/3355] drivers/xcu/xcu_group.c:41:5: warning:
 no previous prototype for function '__xcu_group_attach'
Message-ID: <202511281657.lWcX7PhK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ae3faae9efa6dabe1e7613b5e5d3758ffaefb86a
commit: b7261a251299bfdababe53a848084af2ecfcc1ae [3355/3355] xcu: Add base NPU driver support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251128/202511281657.lWcX7PhK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281657.lWcX7PhK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281657.lWcX7PhK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/xcu/xcu_group.c:41:5: warning: no previous prototype for function '__xcu_group_attach' [-Wmissing-prototypes]
      41 | int __xcu_group_attach(struct xcu_group *new_group,
         |     ^
   drivers/xcu/xcu_group.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | int __xcu_group_attach(struct xcu_group *new_group,
         | ^
         | static 
   1 warning generated.


vim +/__xcu_group_attach +41 drivers/xcu/xcu_group.c

    40	
  > 41	int __xcu_group_attach(struct xcu_group *new_group,
    42							struct xcu_group *previous_group)
    43	{
    44		int id = new_group->id;
    45	
    46		if (id == -1)
    47			id = idr_alloc(&previous_group->next_layer, new_group, 0,
    48						INT_MAX, GFP_KERNEL);
    49		else
    50			id = idr_alloc(&previous_group->next_layer, new_group, id,
    51						id + 1, GFP_KERNEL);
    52	
    53		if (id < 0) {
    54			XSCHED_ERR("Fail to attach xcu_group: id conflict @ %s\n",
    55					__func__);
    56			return -EEXIST;
    57		}
    58		new_group->id = id;
    59		new_group->previous_layer = previous_group;
    60	
    61		return 0;
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
