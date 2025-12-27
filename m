Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C843FFD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 18:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766859711; cv=none; b=LpEYKDLDajzUSbRQWS8JFo79v8ylINGKibhdzuCGF91QhntfjBbGgo60T8bLfvAzHdYfAc81TWM+lxhK/yiLjFYEi+TIlcbzYgoYqXsjmAcM3KRU+tDxhU4dPkQROaNKx6DSaGVcHYLz3iHQ/0UCxji0djM7OJEWiJ0+VH6IAJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766859711; c=relaxed/simple;
	bh=GBNmeOkhPhoqFnh4kkMhkEpnlLQ/hQ1RMfPRuIGNdtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qkgTPHAYdO5v2WMihNi0vUIIUQXWve9ieigkPLEoxzGVDz7taKyuPFaSA0o98pDeFUACsTLF0CLAHusukQFSeBKbdfb5osd0IX+YDJ2On2bVirxarQESoHtvyVeIWIVZ4265PtoD0wvis2cJn3bP6UITcCMmlsHFdVBPlzgfbqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KoQNkF+O; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KoQNkF+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766859709; x=1798395709;
  h=date:from:to:cc:subject:message-id;
  bh=GBNmeOkhPhoqFnh4kkMhkEpnlLQ/hQ1RMfPRuIGNdtk=;
  b=KoQNkF+O5XjTVIJWYdd0ZUpcPl6SI8KZ21vhxTZSYECqtO8uy8ziVLOt
   L1CZgjKgCxi63hE7BYubfOl6gKVlw13WQ1Td0P6/GE4ZMNVwnIkY+5kW0
   vr+k0tzt4B/Lq6EE/FnSyWFgrSpZbPJ0GDPByooZQ+p4qm3CVcf+3qZJp
   KYggntnXXNlaKBMe5zYOcIFla8Rpk3xpa1+ss8sQvGUYAtg7jH5cafdNQ
   rNYE5Glar7VfZAuDfVTMx0X3A1XKrxlcNXgDqlqmHEidL1C4834mWzN4r
   vYGjRE21/5A+7WcgqZM4qMX4ssnq+ahFwROZuUcWBu2pK0iGY9FZ0fjI8
   w==;
X-CSE-ConnectionGUID: NQoQ2bUSRJm7CNw6RZl67g==
X-CSE-MsgGUID: 5GpPM2QYRcqrBqz5eiLb0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="86130361"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="86130361"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 10:21:48 -0800
X-CSE-ConnectionGUID: rpFJ0XV/QKejbbuKxfwVLg==
X-CSE-MsgGUID: 5FMV7o6RTOGAYZXWdv/Zpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205116972"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Dec 2025 10:21:47 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZYvA-00000000617-35W0;
	Sat, 27 Dec 2025 18:21:44 +0000
Date: Sun, 28 Dec 2025 02:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 12/12] fs/f2fs/f2fs.h:4945:
 multiple definition of `f2fs_simulate_lock_timeout';
 fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
Message-ID: <202512280215.9dj4LBZ5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   a9004baf110bf87f6a75b023c26616d966c93733
commit: a9004baf110bf87f6a75b023c26616d966c93733 [12/12] f2fs: sysfs: introduce inject_lock_timeout
config: x86_64-buildonly-randconfig-006-20251227 (https://download.01.org/0day-ci/archive/20251228/202512280215.9dj4LBZ5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512280215.9dj4LBZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512280215.9dj4LBZ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/f2fs/file.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/inode.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/namei.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/hash.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/super.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/inline.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/checkpoint.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/gc.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/data.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/node.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/segment.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/recovery.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/shrinker.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/extent_cache.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/sysfs.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/debug.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/xattr.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/compress.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here
   ld: fs/f2fs/iostat.o: in function `f2fs_simulate_lock_timeout':
>> fs/f2fs/f2fs.h:4945: multiple definition of `f2fs_simulate_lock_timeout'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4945: first defined here


vim +4945 fs/f2fs/f2fs.h

  4933	
  4934	#ifdef CONFIG_F2FS_FAULT_INJECTION
  4935	extern int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
  4936						unsigned long type, enum fault_option fo);
  4937	extern void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi);
  4938	#else
  4939	static inline int f2fs_build_fault_attr(struct f2fs_sb_info *sbi,
  4940						unsigned long rate, unsigned long type,
  4941						enum fault_option fo)
  4942	{
  4943		return 0;
  4944	}
> 4945	void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi) { return; }
  4946	#endif
  4947	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
