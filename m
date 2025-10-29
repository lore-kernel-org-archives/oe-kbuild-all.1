Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8BC2ED17A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 22:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761775496; cv=none; b=ivVwZb7T2SPPjf3GodyvtSFhho3Z1c1PuSjLVC5a5XSTqvJgjDAYXwE0Ep4RMHiyOQInSIk0oeLKHnO5oFT/xBdz2pRtFzAAikiM8K53QedLVaer5EF8awNhDsjW6dUoTkjKlZcVicjqQAgDa6/3Fg9ntnDHpqw08MjDRn6VqfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761775496; c=relaxed/simple;
	bh=xj7tVHLtBz8qG7Wrqp839pFy9qDOJ7P5juaUcw56ARI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VOnJhsY5hjbcqqMnSPqxcng7mbNVOXt28yx7C4JG8J69ip1WUtaOqWwktbTlNlve5ULoMXPd5NZc+OlsJE/H1yH+AW+EBqUzxuHIPlmmhhO/M3+Wu2V8l1pqget98ibczhPFKQ7G7g+OVDjLeewEwSkQnK6BYwqc3oSUMj795Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wc6yN3j9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wc6yN3j9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761775495; x=1793311495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xj7tVHLtBz8qG7Wrqp839pFy9qDOJ7P5juaUcw56ARI=;
  b=Wc6yN3j9FrtZllKPwHf3vVpRUKcz9rQ66n4xVi7r+8QEuUiyMMk1JJvs
   m4tqWclYGXVGTr9Q3nyfyoKUjAJ+Gvsf5icJAFm8YfUcnbyi8IMaTMkrb
   pzpT7bC9hUmEeGUpgs7fLcrf+7BTJYxwMV0F/XyrbIsg+arUt/UgHv3u9
   xf4hOXbmq/V0KKlIs0rQekhxHpDYYarffJo2D/Ydat/1rzF6N7St8+fdO
   ug1tOKAI+CcypzNU7N6lsCCDVjUAaO91PFG23gl4b+EXRdzRlw9yucHLj
   s3Kx6gMhrDvUZ0kIQYC9sB+B4+d7oaqXpXJq2VijJ/HbWYGbAmonZly8D
   w==;
X-CSE-ConnectionGUID: NY+R1L/WQwe20EftoV3KKg==
X-CSE-MsgGUID: nU4fz8W9RtihiukqNSkpag==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63115612"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="63115612"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 15:04:54 -0700
X-CSE-ConnectionGUID: EeBd169OSR+Bk0AZZLyz0w==
X-CSE-MsgGUID: oFNrF0jrTwOmX9gZvbloWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="189853896"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 15:04:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEEHi-000LDc-0J;
	Wed, 29 Oct 2025 22:04:50 +0000
Date: Thu, 30 Oct 2025 06:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.all 4/5] include/linux/writeback.h:196:52:
 error: invalid operands to binary & (have 'struct inode_state_flags' and
 'int')
Message-ID: <202510300516.BcgP2o3u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.all
head:   016122ac8ad0ad10b89ed1daca70253ddcc199e9
commit: 852843205ebcc8cdbf267a7e67ffd76718776ddb [4/5] Merge branch 'vfs-6.19.inode' into vfs.all
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510300516.BcgP2o3u-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300516.BcgP2o3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300516.BcgP2o3u-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/fs.h:7,
                    from include/linux/cgroup.h:17,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
   include/linux/writeback.h: In function 'wait_on_inode':
>> include/linux/writeback.h:196:52: error: invalid operands to binary & (have 'struct inode_state_flags' and 'int')
     196 |                        !(READ_ONCE(inode->i_state) & I_NEW));
         |                                                    ^
   include/linux/wait_bit.h:306:13: note: in definition of macro 'wait_var_event'
     306 |         if (condition)                                                  \
         |             ^~~~~~~~~
>> include/linux/writeback.h:196:52: error: invalid operands to binary & (have 'struct inode_state_flags' and 'int')
     196 |                        !(READ_ONCE(inode->i_state) & I_NEW));
         |                                                    ^
   include/linux/wait_bit.h:266:21: note: in definition of macro '___wait_var_event'
     266 |                 if (condition)                                          \
         |                     ^~~~~~~~~
   include/linux/wait_bit.h:308:9: note: in expansion of macro '__wait_var_event'
     308 |         __wait_var_event(var, condition);                               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/writeback.h:195:9: note: in expansion of macro 'wait_var_event'
     195 |         wait_var_event(inode_state_wait_address(inode, __I_NEW),
         |         ^~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +196 include/linux/writeback.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  191  
^1da177e4c3f41 Linus Torvalds    2005-04-16  192  /* writeback.h requires fs.h; it, too, is not included from here. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  193  static inline void wait_on_inode(struct inode *inode)
^1da177e4c3f41 Linus Torvalds    2005-04-16  194  {
0fe340a98b584a Christian Brauner 2024-08-23  195  	wait_var_event(inode_state_wait_address(inode, __I_NEW),
0fe340a98b584a Christian Brauner 2024-08-23 @196  		       !(READ_ONCE(inode->i_state) & I_NEW));
^1da177e4c3f41 Linus Torvalds    2005-04-16  197  }
1c0eeaf5698597 Joern Engel       2007-10-16  198  

:::::: The code at line 196 was first introduced by commit
:::::: 0fe340a98b584a31b07c664dc5ff0c923730581e inode: port __I_NEW to var event

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
