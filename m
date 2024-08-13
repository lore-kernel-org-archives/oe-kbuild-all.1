Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E956E1C68C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 04:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723523172; cv=none; b=pyjB7q9C5MYqDsFZg+cPqXUETcAlzOgDnDTJiG0Ve2rIQlvfl0Mmpl4pkPzIflHi1AqoK6/whrWWKNjFgk4xtkmIFkjBglwze306M+E97fYWtf+jAAChXxHejZhWswt2aqIy7OyAA0nfdDSAF3hTAMQIQW6q3JxrjokrwjfBuOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723523172; c=relaxed/simple;
	bh=UEdTAqX5zxPROLxAmkftOX+BCXItY+tQT3qzIU35BOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L66tWEZIUUlFtELP3e41FTT3WK5eIXxYTbVZG6Df8X8eZ3rqzP7mGE1735EgrHOaIKh0a1iI/TcSUTPs6QmC6aHPTSrlqU7JJQ66A95GORbTvCZ6ny0tucXQIUQnwxs5JiROv9vmDQA3xzPDrvTEEvj2xdyAdONaV2V1UHLSu1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndhVrRow; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndhVrRow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723523170; x=1755059170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UEdTAqX5zxPROLxAmkftOX+BCXItY+tQT3qzIU35BOY=;
  b=ndhVrRowjDmSXwKawLS4waAOxaLSZAhwf2FrNU1Q+3ohF4M015N/dRiq
   9Vk6EpKUEn0+d9ZU+RA0bWTTmpTykYiHnAfiFm6Zrwohlv8FjTDE+rGit
   EGLagu2Ko8arGxX8eGYkt4GmN4QN3FYxntkQ/AGlLnsW9ne3cWOJpjzSX
   rzF6Ve2oenbKR5p6BoACErCrtEwS3HChPyiJAnbyK2Cd69IVXl17hQXtj
   FHhuFon40McSGx9tHBj9q+JzPzriEuTLKPyPL992C0gIebBo8qN6rWDnm
   M9Q6rYtYCl0pO6FT+bGhgAWLbh+XHv04HEcIridl6Y+wu89zsgaLdGi8L
   w==;
X-CSE-ConnectionGUID: HTmXkip4Qd27HLwZBW7/8Q==
X-CSE-MsgGUID: hiOHqLkTTpiAI+dnrLszvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="33048370"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="33048370"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 21:26:10 -0700
X-CSE-ConnectionGUID: Df7Wa2e1RhWOwKsESV74fg==
X-CSE-MsgGUID: AenyfHQqTV+8m7qSrgW+jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58464600"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Aug 2024 21:26:09 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdj6j-0000A4-1T;
	Tue, 13 Aug 2024 04:26:05 +0000
Date: Tue, 13 Aug 2024 12:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 7089/23486] drivers/fpga/dfl.o:
 warning: objtool: build_info_commit_dev()+0x238: unreachable instruction
Message-ID: <202408131241.MUQOf023-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   314cc4a8c77c14af0637ae2d7bff746d8002cfab
commit: 99e28159a079ea6af5a5b789e83b68240d67f9ff [7089/23486] fpga: dfl: Add lockdep classes for pdata->lock
config: x86_64-buildonly-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240813/202408131241.MUQOf023-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408131241.MUQOf023-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408131241.MUQOf023-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/fpga/dfl.c:57: warning: cannot understand function prototype: 'struct dfl_dev_info '
   drivers/fpga/dfl.c:77: warning: cannot understand function prototype: 'struct dfl_chardev_info '
>> drivers/fpga/dfl.o: warning: objtool: build_info_commit_dev()+0x238: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
