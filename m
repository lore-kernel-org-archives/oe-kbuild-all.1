Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495431B85E4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 13:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741441656; cv=none; b=lKH6tzgmQKolSJulb3PMrJLxwsU97LuzZeh3aVwDdpv3PJHeuHozMB5NkoVIZqDlfkHyriIk9YdDqr3dn2n0JJ55Zz6GATS7fm3KVHyuobuoyDO0wvpZUB1L1T0FYWchrkBACEgvjKcXh1NnzOe7gMaWMJfDTS0Ri2qjgZPIXts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741441656; c=relaxed/simple;
	bh=VhVMNtKTGuXymtyKJMeoT8KYnmWFDSOmhBUY5ZZr65M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTS4VWVKAlQAYdIA6oK2W+EmRNGSgIXYLXTVth7dpme0zO5xROaIXVGQPVBBRLJjn84nFIhQnLzo9kGCHhySRQhNQyvpqSlJu4KlSf5wkXHTqlvtIK45PeDp32jVPm2IJ3RTS8LoKM3z+UztYsLtMf751G3NepiWBBrTkZPsDUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlM0NXLu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlM0NXLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741441654; x=1772977654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VhVMNtKTGuXymtyKJMeoT8KYnmWFDSOmhBUY5ZZr65M=;
  b=SlM0NXLu+eAcRYReJHs3scNdR8nNr8KHoBtUABd2waapA2TD2vP4mdG/
   j1T6Vr/T44BlsW7eWlLwq7Su+nq1islV7MEHLehddJSXSGEdZ6zozvdQY
   jhPSihzCxrAMMgg26zwUZLKzEvHT2ufhVwdRHTbZ5dxO9BeL1ri+tNKDc
   61odowv4r4R9Wq5YedK9NT4wxWxGFt2YWHCO6nbGjT2T0g0JYb1mim76Z
   XoPDFwwAKimXx5k4AT5Asyzrhp9Y2EpimyULO+X96MqCsisp++6Vp+Win
   s3VGwuLM/y2rI8CbxJo28nFaA4LkDomSbv6OyL6ZcY7QBDDF5fr16TL8b
   g==;
X-CSE-ConnectionGUID: z5ILByeEQP6QJ97PM9KtWQ==
X-CSE-MsgGUID: 1eQn7ascQWiUis5G+jBu5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46263792"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="46263792"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 05:47:34 -0800
X-CSE-ConnectionGUID: qBrvRkGqQQG0U0lDswIdLw==
X-CSE-MsgGUID: 8Tm5jwVmQoKT7WroWG650A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119501133"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2025 05:47:31 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tquWR-0001wW-23;
	Sat, 08 Mar 2025 13:47:25 +0000
Date: Sat, 8 Mar 2025 21:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>, brauner@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, viro@zeniv.linux.org.uk, jack@suse.cz,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org, audit@vger.kernel.org, axboe@kernel.dk,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: [PATCH] fs: support filename refcount without atomics
Message-ID: <202503082155.OjmOoifN-lkp@intel.com>
References: <20250307161155.760949-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307161155.760949-1-mjguzik@gmail.com>

Hi Mateusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Guzik/fs-support-filename-refcount-without-atomics/20250308-002442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250307161155.760949-1-mjguzik%40gmail.com
patch subject: [PATCH] fs: support filename refcount without atomics
config: i386-buildonly-randconfig-001-20250308 (https://download.01.org/0day-ci/archive/20250308/202503082155.OjmOoifN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503082155.OjmOoifN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503082155.OjmOoifN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/swait.h:5,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/fs.h: In function 'makeatomicname':
>> include/linux/fs.h:2875:24: error: 'struct filename' has no member named 'owner'
    2875 |         VFS_BUG_ON(name->owner != current && !name->is_atomic);
         |                        ^~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   include/linux/fs.h:2875:9: note: in expansion of macro 'VFS_BUG_ON'
    2875 |         VFS_BUG_ON(name->owner != current && !name->is_atomic);
         |         ^~~~~~~~~~
   include/linux/fs.h: In function 'refname':
   include/linux/fs.h:2884:24: error: 'struct filename' has no member named 'owner'
    2884 |         VFS_BUG_ON(name->owner != current && !name->is_atomic);
         |                        ^~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   include/linux/fs.h:2884:9: note: in expansion of macro 'VFS_BUG_ON'
    2884 |         VFS_BUG_ON(name->owner != current && !name->is_atomic);
         |         ^~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2878351160
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=2878351160
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=2878351160
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=2878351160
   make: Target 'prepare' not remade because of errors.


vim +2875 include/linux/fs.h

  2866	
  2867	static inline void makeatomicname(struct filename *name)
  2868	{
  2869		VFS_BUG_ON(IS_ERR_OR_NULL(name));
  2870		/*
  2871		 * The name can legitimately already be atomic if it was cached by audit.
  2872		 * If switching the refcount to atomic, we need not to know we are the
  2873		 * only non-atomic user.
  2874		 */
> 2875		VFS_BUG_ON(name->owner != current && !name->is_atomic);
  2876		/*
  2877		 * Don't bother branching, this is a store to an already dirtied cacheline.
  2878		 */
  2879		name->is_atomic = true;
  2880	}
  2881	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
