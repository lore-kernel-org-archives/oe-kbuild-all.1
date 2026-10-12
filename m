Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA0B37BE86
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813082; cv=none; b=s9W6+98c0eFHNJuD0E6Uq/qOIWAwpIg3ftg9B0N+lfaMpFHCn6BuzzasZDCoeiZGLZ9N174f6aQjVGb21zbzpgwT4kDs68j0of6mvcx6TIXGb5u981Z7wc/MwV4hpt94kmBeAYn/QqLi5GGuyreXYEEOHudyPC3lUAZE97VYokA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813082; c=relaxed/simple;
	bh=zmI0tvik6jWEY8Ciw4LFFsaQ7mpbn0sRvDhXJZkFxu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QGOA9aaSMZ6Siq5Z70C71Lz7GHMQG0lC8MbEOgXqg7FYSQsF90ihl5oDbF/gB7olr4X18X4+uOg/fbYJ/t4uQZ5I6UmAFsrSWogFFkX6/7fLV+hm8KNyj/op/zulR39x0cbunnnTFihu8nUIAVNLQJwrsEIbDGhikb6uaFRBe1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+np5VK7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+np5VK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791813080; x=1823349080;
  h=date:from:to:cc:subject:message-id;
  bh=zmI0tvik6jWEY8Ciw4LFFsaQ7mpbn0sRvDhXJZkFxu4=;
  b=V+np5VK7U6DXwIvygQGnnC10kyuDhzUfAk/O14AkzfPcJc6TKkbb7JN/
   8qdC4Y/Cxzf1tN46zpQ5ZmlpBvjMceny8QrUa80eWBYLyaivzAz0798QW
   hHLC2puHKWtln0OMJYpY9do7B5EB6DqdqguuWvOdda88U3BWfoIkcuy50
   C7sLLwunEpLrqFS2W7rrvbYtrMxK1iNxFLdns0PboNqFpXAU1nKgFxjO8
   MDw05PORrV7JRiVpATW3mGGw9mXP4z4aM7bHmOkQZX4FWnt8tYN3sG+TW
   MiGl9+7wicp56+zedCVsOVegf6CnywSAJe1vLpvzFLlbv8Z5STxWEis/r
   g==;
X-CSE-ConnectionGUID: SAjP7SZyR6m6f+snPXi9OQ==
X-CSE-MsgGUID: hKKZZcC1R0WLmLEOQyvzLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="417698"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="417698"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 06:51:19 -0700
X-CSE-ConnectionGUID: 3eTN4yl0RWWIuu1HkIBC5w==
X-CSE-MsgGUID: ZKi41Ke4TkKo7XNYfHIudQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2661940"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 12 Oct 2026 06:51:19 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGGQu-00000000BZF-01WZ;
	Mon, 12 Oct 2026 13:51:16 +0000
Date: Mon, 12 Oct 2026 21:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 2/2] fs/f2fs/file.c:1104:24: error:
 assignment of member 'ia_valid' in read-only object
Message-ID: <202610122100.s1O8N1fx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   664d401caf1306ec655f7e729082dfccd36dc5da
commit: 664d401caf1306ec655f7e729082dfccd36dc5da [2/2] f2fs: opt in to multigrain timestamps
config: parisc-randconfig-1000-20261012 (https://download.01.org/0day-ci/archive/20261012/202610122100.s1O8N1fx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610122100.s1O8N1fx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610122100.s1O8N1fx-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/file.c: In function '__setattr_copy':
>> fs/f2fs/file.c:1104:24: error: assignment of member 'ia_valid' in read-only object
    1104 |         attr->ia_valid &= ~ATTR_MODE;
         |                        ^~
   fs/f2fs/file.c:1113:32: error: assignment of member 'ia_valid' in read-only object
    1113 |                 attr->ia_valid |= ATTR_MODE;
         |                                ^~


vim +/ia_valid +1104 fs/f2fs/file.c

  1097	
  1098	#ifdef CONFIG_F2FS_FS_POSIX_ACL
  1099	static void __setattr_copy(struct mnt_idmap *idmap,
  1100				   struct inode *inode, const struct iattr *attr)
  1101	{
  1102		unsigned int ia_valid = attr->ia_valid;
  1103	
> 1104		attr->ia_valid &= ~ATTR_MODE;
  1105	
  1106		setattr_copy(idmap, inode, attr);
  1107		if (ia_valid & ATTR_MODE) {
  1108			umode_t mode = attr->ia_mode;
  1109	
  1110			if (!in_group_or_capable(idmap, inode, i_gid_into_vfsgid(idmap, inode)))
  1111				mode &= ~S_ISGID;
  1112			set_acl_inode(inode, mode);
  1113			attr->ia_valid |= ATTR_MODE;
  1114		}
  1115	}
  1116	#else
  1117	#define __setattr_copy setattr_copy
  1118	#endif
  1119	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
