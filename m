Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1974191
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jun 2026 03:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782531025; cv=none; b=ae3yYcaI6mQJcXGlhA1w8dXUeW3omBZvbk05tUXBUj+T7KBAUT+ugYEqTMPAhApQG7LJhYLUB8KFSglO2E45ac6lj3Ud9tNCGB+CjX2bJ4ZPZsfHISFHpXbCoNtex6bJDZGWFz2O+xTpqRlABAS1kEkO0IvmuAcxBKo2wIf6tJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782531025; c=relaxed/simple;
	bh=dS6cTzkDx3bC68xCsXTk099uqVfOUplO9GVuiQ184JI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AnZ1z7NPDCQQGj+RSr5+MXVKbjQ2MU3oLsQ8dpUgAl+/zDNP6eC1riPkXLJiV9DNKCWd+mMgl9/qf1+soK0jMZqJerVj0pYE0B24nhqMG/4kxshq12yqEVkp+8bjGKnd7G9qqfG5/ps2WC+qDq6MTFXmra2mYvSenxBN1y3n8to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBqCvrXO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBqCvrXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782531023; x=1814067023;
  h=date:from:to:cc:subject:message-id;
  bh=dS6cTzkDx3bC68xCsXTk099uqVfOUplO9GVuiQ184JI=;
  b=NBqCvrXOui1+6aezwvFqLEFeq18qj1Jz1w9TS35QwtGLoBSBYCVLtEeU
   QOwxM/94KE7Ezl2MoAlZPzd4zUWemKIJWBdRJ+Q9PpoMPcZ+b8BSr3L3G
   1XYAKHPdPqG4JhtfxvDCmVkISSt8HCIHViBo//MLN6B8Smlxn9pLYZ314
   PNj0Vcphk8cExUfpu5Uop5qA7+e0VHkQBHBolSZigPMC49nwwcZvBNFmH
   t31Wrg4jSq+Vv9zzVlcSWJ4zA09Iv/yIYh1jCoerNtvy+GJsXGdk2dfqz
   NuNxRl2e42E6ECMmBgEbBytF+DbZ6imT1hqFtR3y7M2Wj6meR3+uIw5JG
   Q==;
X-CSE-ConnectionGUID: TNXhQ8h5TUqHcQOHo+oa7A==
X-CSE-MsgGUID: ncG4sjMSTNCXGn1niukwQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="108857635"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="108857635"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 20:30:22 -0700
X-CSE-ConnectionGUID: Na2UvhzXSzuOx4QAtHuPmA==
X-CSE-MsgGUID: 9aGsptQUQtaLfSOD19S2ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="274678547"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jun 2026 20:30:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdJkI-000000005b3-0wSC;
	Sat, 27 Jun 2026 03:30:18 +0000
Date: Sat, 27 Jun 2026 11:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Liam R. Howlett (Oracle)" <liam@infradead.org>
Subject: [liam:maple_marks_v7.2 3/31] lib/maple_tree.c:1158:20:
 sparse: sparse: symbol 'mas_lockdep_map' was not declared. Should it be
 static?
Message-ID: <202606271109.IvGd0Mth-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v7.2
head:   be119ad50e9c87a4a975871d84614f7c6aeaf0de
commit: 3e341aa5972e499ffef5881c5dad0f9aa3488053 [3/31] maple_tree: Add write lock checking with lockdep sequence numbers
config: microblaze-randconfig-r121-20260627 (https://download.01.org/0day-ci/archive/20260627/202606271109.IvGd0Mth-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606271109.IvGd0Mth-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606271109.IvGd0Mth-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:1158:20: sparse: sparse: symbol 'mas_lockdep_map' was not declared. Should it be static?

vim +/mas_lockdep_map +1158 lib/maple_tree.c

  1155	
  1156	
  1157	#ifdef CONFIG_LOCKDEP
> 1158	struct lockdep_map *mas_lockdep_map(struct ma_state *mas)
  1159	{
  1160		struct maple_tree *mt = mas->tree;
  1161	
  1162		if (mt_external_lock(mt))
  1163			return mt->ma_external_lock;
  1164	
  1165		return &(mt->ma_lock).dep_map;
  1166	}
  1167	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
