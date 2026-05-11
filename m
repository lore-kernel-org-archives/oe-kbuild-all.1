Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCE861FFE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509111; cv=none; b=QwHwH8mlJFSQLHwH+plQF0ld0dbt8KlxMGiDJgDSw0bYT1bj81xKMnnHSaWIuTeXdbCND7tR/N1E2iXQd97R+xA0Sa+GTZvNJ61V5r1KIxNzLpVhbeKC6X4ZaK20zsC/7bJOq5fbC/7Wk3xdelM2TVzKRO2KoALG3z0YVC7VjMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509111; c=relaxed/simple;
	bh=+dS0RUgJT+VnzsmVVk9FRAty2q6sRaHP6Sg5Wc57JY0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bDCa54Hjm9/s607TRD8ipMQ9rAYFS2BAN5XdbzcYvZ19K/GKNxEDJ/X5cenys1YSaTsbG8E7UPcLgu1onlsT2oy253pyZI697kpkRP8lBfPkcg75X2VGoblcrI7O8uDlVSWDxEze90BYv0gQUfNmLQITJDC7KeJzXKA0UoaxDaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=La1DnbcO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="La1DnbcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778509110; x=1810045110;
  h=date:from:to:cc:subject:message-id;
  bh=+dS0RUgJT+VnzsmVVk9FRAty2q6sRaHP6Sg5Wc57JY0=;
  b=La1DnbcOvXq9yEN2d8j6ymjUXqaOcf2hO6Yhie8HEofIYG3DLNzxwTcl
   Uid41rLFgx4BDdKO9DC0njhvGN1KrAtFD1OtnGNYEhyYViR1aL+JHqkXP
   mESkbUJ1g8c71TiMfKR2Wf9GLwInIf2i+Wo+g0oRldKEEwh68pQomyfg4
   7DSXQi0kNMxKmUYatkWmWhmtY+c09TkI+87bWCxi38WaLAFk4TDnrbjCu
   5/IGvLqlmvwl5yVRiYC4XJv5Rlpc/chFL7ecJ1NvCtUVgJzOXvtTrcs8K
   XAw67F5fZhpESMLK13dB1McYESq1DzMNujLQ0GgxRjGOa+2pDGuN46xZE
   A==;
X-CSE-ConnectionGUID: mwHyQ/OsSBqDPKdYiD6Fmg==
X-CSE-MsgGUID: lf+6+RIOSMqsARQ6sSQ73w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79379737"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79379737"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:18:29 -0700
X-CSE-ConnectionGUID: 5z3Q03wMRheTq+zVirXXiA==
X-CSE-MsgGUID: 6QeBxB7/Q9O8PuqDbKufVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="239280434"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 May 2026 07:18:28 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMRSk-000000000hh-0AIA;
	Mon, 11 May 2026 14:18:26 +0000
Date: Mon, 11 May 2026 22:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v1 8/8]
 fs/configfs/mount.c:70:16: error: dereferencing pointer to incomplete type
 'struct configfs_super_info'
Message-ID: <202605112246.3o6TTTdO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v1
head:   c924e1daab3eb4efc26275918155673d5e90c6ba
commit: c924e1daab3eb4efc26275918155673d5e90c6ba [8/8] configfs: configfs_create_root()
config: parisc-randconfig-002-20260511 (https://download.01.org/0day-ci/archive/20260511/202605112246.3o6TTTdO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112246.3o6TTTdO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112246.3o6TTTdO-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/configfs/mount.c: In function 'configfs_test_super':
>> fs/configfs/mount.c:70:16: error: dereferencing pointer to incomplete type 'struct configfs_super_info'
     return sb_info->root == info->root && sb_info->ns == info->ns;
                   ^~
   In file included from include/linux/fs.h:45,
                    from fs/configfs/mount.c:11:
   fs/configfs/mount.c: In function 'configfs_fill_super':
   fs/configfs/mount.c:80:21: error: dereferencing pointer to incomplete type 'struct configfs_super_info'
     info = kzalloc_obj(*info);
                        ^~~~~
   include/linux/slab.h:973:44: note: in definition of macro '__alloc_objs'
     const size_t __obj_size = size_mul(sizeof(TYPE), COUNT); \
                                               ^~~~
   fs/configfs/mount.c:80:9: note: in expansion of macro 'kzalloc_obj'
     info = kzalloc_obj(*info);
            ^~~~~~~~~~~
   fs/configfs/mount.c: In function 'configfs_get_tree':
   fs/configfs/mount.c:126:9: error: implicit declaration of function 'vfs_get_super'; did you mean 'vfs_get_tree'? [-Werror=implicit-function-declaration]
     return vfs_get_super(fc, configfs_test_super, configfs_fill_super);
            ^~~~~~~~~~~~~
            vfs_get_tree
   fs/configfs/mount.c: At top level:
   fs/configfs/mount.c:181:28: warning: no previous prototype for 'configfs_get_root' [-Wmissing-prototypes]
    struct configfs_root_info *configfs_get_root(struct ns_common *ns)
                               ^~~~~~~~~~~~~~~~~
   fs/configfs/mount.c: In function 'configfs_get_root':
   fs/configfs/mount.c:188:2: error: 'err' undeclared (first use in this function)
     err = idr_alloc(&configfs_mount, root, ns->ns_id,
     ^~~
   fs/configfs/mount.c:188:2: note: each undeclared identifier is reported only once for each function it appears in
   fs/configfs/mount.c: In function 'configfs_pin_fs':
   fs/configfs/mount.c:206:10: error: implicit declaration of function 'configfs_create_root'; did you mean 'configfs_get_root'? [-Werror=implicit-function-declaration]
      root = configfs_create_root(ns);
             ^~~~~~~~~~~~~~~~~~~~
             configfs_get_root
   fs/configfs/mount.c:206:8: warning: assignment to 'struct configfs_root_info *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      root = configfs_create_root(ns);
           ^
   fs/configfs/mount.c: In function 'configfs_init':
   fs/configfs/mount.c:246:2: error: 'configfs_root' undeclared (first use in this function); did you mean 'configfs_init'?
     configfs_root = configfs_create_root(
     ^~~~~~~~~~~~~
     configfs_init
   fs/configfs/mount.c:247:55: error: expected ')' before ';' token
     err = sysfs_create_mount_point(kernel_kobj, "config");
                                                          ^
                                                          )
   fs/configfs/mount.c:263:13: error: expected ';' before '}' token
     return err;
                ^
                ;
    }
    ~            
   fs/configfs/mount.c:244:3: error: label 'out' used but not defined
      goto out;
      ^~~~
   fs/configfs/mount.c:264:1: warning: no return statement in function returning non-void [-Wreturn-type]
    }
    ^
   fs/configfs/mount.c: In function 'configfs_test_super':
   fs/configfs/mount.c:71:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors


vim +70 fs/configfs/mount.c

    63	
    64	static int configfs_test_super(struct super_block *sb, struct fs_context *fc)
    65	{
    66		struct configfs_super_info *sb_info =
    67			(struct configfs_super_info *)sb->s_fs_info;
    68		struct configfs_super_info *info = fc->s_fs_info;
    69	
  > 70		return sb_info->root == info->root && sb_info->ns == info->ns;
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
