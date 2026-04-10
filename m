Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1363F3A4F24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775822317; cv=none; b=ol3O4yNIgHB9EUCu5JHMzLFEtz/mI5L2ELfb9e2lNGzOzI9mCcQ4wdJQxVUf5SrtmoBXyIBayG9mDwpgnfe2GrvGevq3L7hEzbCAp6CDucrb0t1LcA96sjo2AqzQ5UMqj9zIZx+b7DIsPxq2iv18ut1EOsEa6FfXP1MnOeqxEvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775822317; c=relaxed/simple;
	bh=90M+UrQg2nIFSgWJI0O80YkyqEnqlOZvdZre+9kYQPo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V1RKubbd547iLHUIwJqaonD5xjkbvsFWF/FgMIVW4Ap9vQxWUfjpxasc1BjTP8KgOM5x+F0AwM0ek9J+HqwTR9FSV3LCM3uFtizYRrV1fwbF8JG4aS/9mXzmrrYvk7YzM7PqTwPbL6XQ7EbB6Ab8jPsxiOs5rGpA03wJFWrNv9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sf3xdaMT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sf3xdaMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775822315; x=1807358315;
  h=date:from:to:cc:subject:message-id;
  bh=90M+UrQg2nIFSgWJI0O80YkyqEnqlOZvdZre+9kYQPo=;
  b=Sf3xdaMTPhFgUIBTz4P0BjGBL5cC2tgYFgQSlp0A32/+s0xD5lgaq3qp
   Dpxwfu4YspiSUo1qF3rBKLaSd0OHEnpS/HnxiMrLni8jrlVGgpshZHgHn
   UdDM1qhCO5Cq4Po3qIVWpdaLenbjB3mll4pwqx108Hv4tdNGLz4GTlTCa
   oX0g7tbsEwFM+nNzYRUfYJtKCcL4U3k7fQ8tOGvfMSkeNrjrEq17wTaSk
   HajDnVruG2VHHnVcjyFP/hVul29tZZLCHp6cyFg0rWq1mSxxss/w2M40E
   wqwYa7zmZC66h6ILQBBQHzvcMFXwcrjPe7APC7Qpv4bgP+UklRXgsudUE
   w==;
X-CSE-ConnectionGUID: UDGuwyfnQdik/oYMh/9A8w==
X-CSE-MsgGUID: dHjdaIueS6uX179VMswLMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76857252"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76857252"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:58:34 -0700
X-CSE-ConnectionGUID: bmAz7KokTSuW4s0sLcet7w==
X-CSE-MsgGUID: GJKrt1NdSH+W+SuXnytsbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252433282"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 04:58:33 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBAVK-000000003g7-2kWZ;
	Fri, 10 Apr 2026 11:58:30 +0000
Date: Fri, 10 Apr 2026 19:58:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.fixes 3/5] fs/sysfs/mount.c:75:37: error:
 initialization of 'struct net *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202604101915.F2UrsUG1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.fixes
head:   98d1a51c628ef056c2d5a06d39c2d5b38aff9237
commit: 9a8098b1d5023ca94d91ce9b7c3dbf762fe3b3fb [3/5] kernfs: pass struct ns_common instead of const void * for namespace tags
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260410/202604101915.F2UrsUG1-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101915.F2UrsUG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101915.F2UrsUG1-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/sysfs/mount.c: In function 'sysfs_init_fs_context':
   fs/sysfs/mount.c:75:37: error: implicit declaration of function 'to_net_ns'; did you mean 'get_net_ns'? [-Wimplicit-function-declaration]
      75 |                 struct net *netns = to_net_ns(ns);
         |                                     ^~~~~~~~~
         |                                     get_net_ns
>> fs/sysfs/mount.c:75:37: error: initialization of 'struct net *' from 'int' makes pointer from integer without a cast [-Wint-conversion]


vim +75 fs/sysfs/mount.c

    54	
    55	static int sysfs_init_fs_context(struct fs_context *fc)
    56	{
    57		struct kernfs_fs_context *kfc;
    58		struct ns_common *ns;
    59	
    60		if (!(fc->sb_flags & SB_KERNMOUNT)) {
    61			if (!kobj_ns_current_may_mount(KOBJ_NS_TYPE_NET))
    62				return -EPERM;
    63		}
    64	
    65		kfc = kzalloc_obj(struct kernfs_fs_context);
    66		if (!kfc)
    67			return -ENOMEM;
    68	
    69		kfc->ns_tag = ns = kobj_ns_grab_current(KOBJ_NS_TYPE_NET);
    70		kfc->root = sysfs_root;
    71		kfc->magic = SYSFS_MAGIC;
    72		fc->fs_private = kfc;
    73		fc->ops = &sysfs_fs_context_ops;
    74		if (ns) {
  > 75			struct net *netns = to_net_ns(ns);
    76	
    77			put_user_ns(fc->user_ns);
    78			fc->user_ns = get_user_ns(netns->user_ns);
    79		}
    80		fc->global = true;
    81		return 0;
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
