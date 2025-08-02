Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCECDF59
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 13:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754141050; cv=none; b=TCQMzIonWRtOJQz3GX4eRp5+rsbrxNV7gONpa3iwElMTVOqdTK3UGJj+2Aee7zhZPBB1K/m8mY3+4jWaAgEcyYP3wnN0vwlrZ7bWEx59xyMgYPYy98htx/tSUcFJJROxhjeX9ZCVuyLB8UHpVt5eXdbb4VRvjQJbiIQNwSqOTyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754141050; c=relaxed/simple;
	bh=Pq3p7t9fiJNQbXnBuYuVkhgNE1EaWmbqxeInofvsTVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4KJr9k/cdyxVRH2G0NIacMzgP1qqvAnTn/qVnlFiLcOYh3aWYy3SczzikbLOzE6p19I1K3v1Do4bc5D3el4MZPA7fFRd/CaZ6DL4qwWUzRU/hsO8nPJB3nD24qIshFbRuBOvklUAMYs6ysBjI20ogkl3jDMnNi/mgfUTSEZdPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3xPctkV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3xPctkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754141049; x=1785677049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pq3p7t9fiJNQbXnBuYuVkhgNE1EaWmbqxeInofvsTVE=;
  b=D3xPctkVM28psOOTGUhSYRNUod7mftrd45aVgI4r4zcBJHVfx2O/tzs2
   Mz92pwg+dRekyal4484TMmJEbEkYI4i0PdLEOXVdGIi9gBzlcGTJysS9Z
   xmum6yYIm9kS1+NISUrIX/sw/RZHmWTnGLq4Z1+EwhUr6oBD1hFEugecf
   8joG/U/ytDRso4L4PnRNTLXjdcpwkRCMTHTssi+e74Ol749FSLC5F+QzS
   jLq/JZQW1vHRnLJzkuT2Lctgt4aXp760r22CovF3HSmCQeGNqDb/X6Ff/
   M7S0dNy7ghGOy2kU7c7tRGFmFa+7CZ9wwaCKbKY493VbYKYORqKwOh2Lh
   g==;
X-CSE-ConnectionGUID: MVVmd522Te+02yUZ38D9aA==
X-CSE-MsgGUID: iX/YTjRkSrq+FpteZdM+PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="59091175"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59091175"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 06:24:09 -0700
X-CSE-ConnectionGUID: DH8HfCATR3S6/Qnrwxh8PA==
X-CSE-MsgGUID: 2mqXDWA3S9+4qSxu4Pxtzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="200943618"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Aug 2025 06:24:08 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiCDV-0005Nq-0x;
	Sat, 02 Aug 2025 13:24:05 +0000
Date: Sat, 2 Aug 2025 21:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2630/2630] fs/nfs/enfs/shard_route.c:273:
 warning: Function parameter or member '__struct_name' not described in
 'DEFINE_CLEAR_LIST_FUNC'
Message-ID: <202508022134.uLbgotjO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8fa27fba5fd9db50ef3d03358c9abd371dcbdd99
commit: 2d5981287b67cc1a5d9231bff267f90001251ba3 [2630/2630] nfs/enfs: introduce DEFINE_CLEAR_LIST_FUNC to define enfs_clear_fs_info()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250802/202508022134.uLbgotjO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508022134.uLbgotjO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508022134.uLbgotjO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/enfs/shard_route.c:273: warning: Function parameter or member '__struct_name' not described in 'DEFINE_CLEAR_LIST_FUNC'
>> fs/nfs/enfs/shard_route.c:273: warning: Function parameter or member '__list_name' not described in 'DEFINE_CLEAR_LIST_FUNC'
>> fs/nfs/enfs/shard_route.c:273: warning: expecting prototype for enfs_clear_ ## __struct_name()(). Prototype was for DEFINE_CLEAR_LIST_FUNC() instead
   fs/nfs/enfs/shard_route.c:349: warning: Cannot understand  * @return:0 for success,otherwise for failed
    on line 349 - I thought it was a doc line


vim +273 fs/nfs/enfs/shard_route.c

   256	
   257	/**
   258	 * enfs_clear_ ## __struct_name() - delete and free all __struct_name from view_table
   259	 * @table: view table
   260	 *
   261	 * Context: protected by view_table write lock
   262	 * Return: None
   263	 */
   264	#define DEFINE_CLEAR_LIST_FUNC(__struct_name, __list_name)		\
   265	static void enfs_clear_ ## __struct_name(struct view_table *table)	\
   266	{									\
   267		struct __struct_name *item, *tmp;				\
   268										\
   269		list_for_each_entry_safe(item, tmp, &table->__list_name, next) {\
   270			list_del(&item->next);					\
   271			kfree(item);						\
   272		}								\
 > 273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
