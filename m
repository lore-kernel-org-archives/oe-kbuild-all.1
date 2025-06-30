Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA7128EA76
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312902; cv=none; b=lm815JUAqTNQtbCocg5+1neg+289B6ivtJ6YPT7eijDuxrlk4j+gtHlaqSQoKEcdHTu5OkS+M6jstYiFfVJKZaqcL/tXVCo7N+YeXTSGwlUfi3w1sjx5MTyn5TLb//DACfurqSNqN38q2D9BONusY+TjBxqMyazMtCMdpyObyA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312902; c=relaxed/simple;
	bh=ueykaj4t3S5qMjiIcfZJpPv7ovy6BUuVMfzLuNYps5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fZGBSqIoYyyhet89c4UdAwryq+BN2iilfM96Nq9/KWIe0VFu8wQFdNQS1eMjSZa71c47xc5+3dJR9FpkZvWZa/apXKJBhXg0VP8Pm45JXdduO9pzTi8tQWq2oO5qCqWVEZq94xvFhpAHnK3PMmlCLX+DOGIAjjYkMPA89cZV3P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8va8z7k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8va8z7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751312902; x=1782848902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ueykaj4t3S5qMjiIcfZJpPv7ovy6BUuVMfzLuNYps5M=;
  b=Z8va8z7kQIof784125y+Z7bQsIAVdFr6BTEX2Yk1Ot6YqM5xEFWOm+KG
   Rj+h3tR7KyFmyXwcpnnZgBx596SkM2aL0hzmYXWUb8nS4dLzvh+eYda5g
   Dsdy3c+Htsanh1/davcOmpA0fcWsg0Wg65Zgw5e6uqBPqu0GhaLWtDprR
   nIIqBYBtd6hJcansLkUgJw66nqg7JjWXZ852ek41Bugjl9GEBlboSfTR7
   sNtHH6tRSLU2HL0X0GgfLz9CoED/Fz9jQBfg511R/lHPA6huXz45DJ2Ok
   bbQcWzt8kDaPY5po2DZTwR2qkQDyGxdpZS4TWrmZFKgMGdGCY/AXAPi72
   g==;
X-CSE-ConnectionGUID: 8vQO61lkSOSU44hZOuQ3WA==
X-CSE-MsgGUID: Q6H2RR6dSCis8Wmdbd978g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53416239"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="53416239"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 12:48:21 -0700
X-CSE-ConnectionGUID: IzvsmRVLQWewjlOGOFqtEQ==
X-CSE-MsgGUID: gmAw8kbxQBmZoJjSNUciMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153300934"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 30 Jun 2025 12:48:20 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWKUD-0001I7-26;
	Mon, 30 Jun 2025 19:48:17 +0000
Date: Mon, 30 Jun 2025 21:47:21 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.pidfs.setns 6/9] fs/pidfs.c:36:6: error:
 'pidfs_root_path' redeclared as different kind of symbol
Message-ID: <202506302155.n9lUMkNw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.pidfs.setns
head:   80432e84dc3a17336efd11282d8c5db368ed827b
commit: 90c48e2619324e40223af34ff8aed6480b9d19c1 [6/9] pidfs: add pidfs_root_path() helper
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250630/202506302155.n9lUMkNw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506302155.n9lUMkNw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506302155.n9lUMkNw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/pidfs.c:36:6: warning: no previous prototype for 'pidfs_root_path' [-Wmissing-prototypes]
      36 | void pidfs_root_path(struct path *path)
         |      ^~~~~~~~~~~~~~~
>> fs/pidfs.c:36:6: error: 'pidfs_root_path' redeclared as different kind of symbol
   fs/pidfs.c:34:20: note: previous definition of 'pidfs_root_path' with type 'struct path'
      34 | static struct path pidfs_root_path = {};
         |                    ^~~~~~~~~~~~~~~
   fs/pidfs.c: In function 'pidfs_root_path':
>> fs/pidfs.c:38:17: error: incompatible types when assigning to type 'struct path' from type 'void (*)(struct path *)'
      38 |         *path = pidfs_root_path;
         |                 ^~~~~~~~~~~~~~~
   fs/pidfs.c: In function 'pidfs_init':
>> fs/pidfs.c:1077:24: error: request for member 'mnt' in something not a structure or union
    1077 |         pidfs_root_path.mnt = pidfs_mnt;
         |                        ^
>> fs/pidfs.c:1078:24: error: request for member 'dentry' in something not a structure or union
    1078 |         pidfs_root_path.dentry = pidfs_mnt->mnt_root;
         |                        ^
   fs/pidfs.c: At top level:
>> fs/pidfs.c:34:20: warning: 'pidfs_root_path' defined but not used [-Wunused-variable]
      34 | static struct path pidfs_root_path = {};
         |                    ^~~~~~~~~~~~~~~


vim +/pidfs_root_path +36 fs/pidfs.c

    33	
  > 34	static struct path pidfs_root_path = {};
    35	
  > 36	void pidfs_root_path(struct path *path)
    37	{
  > 38		*path = pidfs_root_path;
    39		path_get(path);
    40	}
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
