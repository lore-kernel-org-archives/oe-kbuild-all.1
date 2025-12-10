Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429741E9B12
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765403281; cv=none; b=IVILLcuu1uawvh4Tzaf0uDlxKHzO/GcfXKrpY833/GEa1OJzsFc8PqR9JxJA7hdskLcKVaDmNhnVkP1qRtGvlOE8/HKucQPcCiFVHFdGvLje/57d7AwsbLHF82T0kuYHeoAMdFVKlFvEQlQHXxtICzo7M2l9M/qAOMZnv7XwDlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765403281; c=relaxed/simple;
	bh=FmctgjsWcScy+u9f37ABnof0EmJVkKQDLXVnAE8/85o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=btk9V7q/3dt62q1ze10/N890ZCfUHaPctEu9SRYWVZT4RBFEiIY5Ufat9FEHL/Qj9NzGskye6c/mBTN/yeSssVUn3uwviwjoJVb4ZEJ5l2AFbcfqtFZmhlJqs2DWyhzEvJUZADNAe2BiHIcg0ho0L5A73NPLPwrOhdC2RMDtoVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HM5m4bDc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HM5m4bDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765403279; x=1796939279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FmctgjsWcScy+u9f37ABnof0EmJVkKQDLXVnAE8/85o=;
  b=HM5m4bDc3vVD2Tsgm2v/jiPq8IEwup+ZBayft5HIf/HW1p2TLtSGtK03
   23zT79mR+JU8ofMg1+KY8zLUim1UKo5Z4w/ZTtGgy6TB4rw8/EHufhPdU
   rfA11QWFqJ/9YP/ncJkyVR8RoN7kfmWIESDJqCTjfkg+XVhKBJPdx3uxB
   G/0ubH+t6INFrHrMsxXV9T3bGcXeXjnmhF1eJ2SuRypxm3UtzEWviDhvl
   LS8NZmWwdLE69dZWgAXjGqzaaaZ8woOwR06VUcTtaqNYx9Z+JXAwuDkgZ
   sBAG62Snm331+PVIhoOTRB7ZvwZlqk65kyyI0ePlMmmm0eKvFjHAD07+P
   g==;
X-CSE-ConnectionGUID: 0jcxcPWiSna+xQwuRWHzDQ==
X-CSE-MsgGUID: JrkdWbhAREWJwX/OcZfdzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78002265"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78002265"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 13:47:58 -0800
X-CSE-ConnectionGUID: nTN6n3RTRAiFm6vdXMPu6g==
X-CSE-MsgGUID: k7qkp9hvQKCnRqIE8CI2ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196680155"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2025 13:47:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTS2N-000000003nl-2Jz2;
	Wed, 10 Dec 2025 21:47:55 +0000
Date: Thu, 11 Dec 2025 05:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3529/3529] fs/nfs/enfs/shard_route.c:273:
 warning: Function parameter or member '__struct_name' not described in
 'DEFINE_CLEAR_LIST_FUNC'
Message-ID: <202512110548.FQDvrNPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi ChenXiaoSong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: 2d5981287b67cc1a5d9231bff267f90001251ba3 [3529/3529] nfs/enfs: introduce DEFINE_CLEAR_LIST_FUNC to define enfs_clear_fs_info()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251211/202512110548.FQDvrNPq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110548.FQDvrNPq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110548.FQDvrNPq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/enfs/shard_route.c:273: warning: Function parameter or member '__struct_name' not described in 'DEFINE_CLEAR_LIST_FUNC'
>> fs/nfs/enfs/shard_route.c:273: warning: Function parameter or member '__list_name' not described in 'DEFINE_CLEAR_LIST_FUNC'
   fs/nfs/enfs/shard_route.c:273: warning: expecting prototype for enfs_clear_ ## __struct_name()(). Prototype was for DEFINE_CLEAR_LIST_FUNC() instead
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
