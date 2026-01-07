Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54C734028F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767804249; cv=none; b=Dp+IzWVNWVSWCDGDzTzC9+nGvoUBD8ZTQP0EMPh3hygnUfK9QCiYHHgC4z3KmwpjxXXbny3e5weFnNoY7P46wpD5mca/IoURNLE4h3rZtXnVnDsGJaKxfqg22Snw/MIHEHpaMZw7H0NEsZotf2hNZA+WnXVrBOL1JGSQR1pcdfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767804249; c=relaxed/simple;
	bh=S7SD/QNz+8Kwx/gdaPDcVjZPgP07xJkYVkHQdktZEdk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jDBW4bdXBSXqbImF4DmDemzJkCH+BXWDVeBmv1oLlQ9FHSihyJmCA4xOsZa61PAyyk6/6V9C+FjwiHifpiHbDdQ1x1Wj21umJ8lfQhy36louTOPw44vQ6qMgZWL19v3wtbg7bGT9+s9dduCqSliDMCg8Kgg6cbNC1bZBNDh5xr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1qbkLNf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1qbkLNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767804243; x=1799340243;
  h=date:from:to:cc:subject:message-id;
  bh=S7SD/QNz+8Kwx/gdaPDcVjZPgP07xJkYVkHQdktZEdk=;
  b=b1qbkLNf4bGoO31nLivnfuiLj2F+2QG3a8xLc2wIC/2sI+rZCtNxn6Wc
   qb+NXdiurwAJv6tR1GrSvafgYp7KuSZGzUFTsA09O6HAfol+K2aHMkwHy
   01ltCYpd/ijp22mqsklWNBA6y63ouBYdwCjjqudVHZcH6DAmy2l+LvqqV
   1dmVJoBPUqHv/m7w1i3pYORDduX4C4j6OQ3UZ+5nx4FxnErW5Oq97srk/
   ao48BPdsEcX4Wb06Aj6BoKCMywswUo+EjiK8Qw7GCRNzpqElMvDwaWUb+
   TqhwHhcWAZ9lmGZzE8l9uaU7pUqDMM4x9buOHxoBGHjVgE4TVfRVT9ps0
   g==;
X-CSE-ConnectionGUID: pCAa2KVKQCKt3BZ+/St+HA==
X-CSE-MsgGUID: zW6EBnplTxGTKx4oHquTpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="94647759"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="94647759"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 08:44:00 -0800
X-CSE-ConnectionGUID: zrMZHINZTWiql+y8D2akbA==
X-CSE-MsgGUID: hxVKCZsORAK0CHm+fxb1Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="202587291"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jan 2026 08:43:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdWdY-000000003zc-3wqO;
	Wed, 07 Jan 2026 16:43:56 +0000
Date: Thu, 08 Jan 2026 00:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v3 1/9]
 include/linux/node.h:108:76: error: expected ';' before '}' token
Message-ID: <202601080039.LOcqrmzn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v3
head:   8a4f71e8f0a8aef992da7df176a352073872a47c
commit: c96cbb611777a60e4328fc821843d1bc092dcca1 [1/9] numa,memory_hotplug: create N_PRIVATE (Private Nodes)
config: i386-buildonly-randconfig-002-20260107 (https://download.01.org/0day-ci/archive/20260108/202601080039.LOcqrmzn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080039.LOcqrmzn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601080039.LOcqrmzn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/swap.h:11,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
   include/linux/node.h: In function 'node_mark_private':
>> include/linux/node.h:108:76: error: expected ';' before '}' token
     108 | static inline int node_mark_private(int nid, bool enable) { return -ENODEV }
         |                                                                            ^
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3953546934
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2 shuffle=3953546934
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3953546934
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3953546934
   make: Target 'prepare' not remade because of errors.


vim +108 include/linux/node.h

   102	
   103	static inline void node_update_perf_attrs(unsigned int nid,
   104						  struct access_coordinate *coord,
   105						  enum access_coordinate_class access)
   106	{
   107	}
 > 108	static inline int node_mark_private(int nid, bool enable) { return -ENODEV }
   109	#endif
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
