Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A53B27CD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 21:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782509951; cv=none; b=KW/xz32a2DYn3dD4rUjrQVbNJfYueaSqUFraLHe/SfmEX4inbHK2LDRZsud5sAtfrl9CJ4wZq2a8x7kqDPD0uIEC38Ew/eBQFhpJdVEinoNqe99nv80hyN7elCMJ9Vo0r/80Nkpdhack9ZoyfipUQaJWVw939Zsfhiuf7tIGjtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782509951; c=relaxed/simple;
	bh=Iolg640dLpu4ZmOyxre8bcJoCK7wUqhr3p+Qe+PTzGo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VKnWbm+huzXbxP0SBgngOInGYaz1JNMAgo5CeDaqGthCzQaM+vinka2CGRYZLzd6dJVlFjuLzqZdpUSuaHXI1XFiHavtY+jxhMi+VkBnMf3hIhoHNjeADgX+lu2iPTAqvUXkHkxYGN6yy5t7KxQFhQPHJcgMK8SXGx4LKg2rOGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQGTMD7u; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQGTMD7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782509949; x=1814045949;
  h=date:from:to:cc:subject:message-id;
  bh=Iolg640dLpu4ZmOyxre8bcJoCK7wUqhr3p+Qe+PTzGo=;
  b=YQGTMD7uWdj0MsNwRw0fYjmr1W6Kb01M65GR78fTzeJtUj91w/PtWX6Q
   EMAuXIPAu1NrrEZCXG/6h6NwnPg6sfk5kv5It90+YTDQfBLfkY0sUmtU7
   FMkwhQUA49TeNdFUUWFAJRacYNBmARkThOQNh1pClH22YvPRWqeifn0dk
   v4RxNymZqlx4gRoRUFes/IybCRSmEEh40hJ8UbGrXLHqd2a/ATxoGWBWP
   OeCa3QVFb+Kl+XkPwKGJ5qHS0w6CUpiVfFaRoXMsKthOmH4ubMuVKPc2k
   PI7NUUJBF/aKMrhnTfHDnr1RoYWcdvg7k4tRy8CI+ZUP32HzhH7HSd0Sx
   Q==;
X-CSE-ConnectionGUID: xnXHXvqqSSyD7v6Gpy3ZcQ==
X-CSE-MsgGUID: kpMwNtoASyOL2l0DwNeN+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="83180668"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="83180668"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 14:39:04 -0700
X-CSE-ConnectionGUID: YVwxv9HHQw+inP/Jtfxcww==
X-CSE-MsgGUID: 9Hic+evYRZyb5FSAVU7oFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="274624344"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jun 2026 14:39:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdEGI-000000005Rv-2F51;
	Fri, 26 Jun 2026 21:38:58 +0000
Date: Sat, 27 Jun 2026 05:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Liam R. Howlett (Oracle)" <liam@infradead.org>
Subject: [liam:maple_marks_v7.2 3/31] lib/maple_tree.c:1158:21:
 warning: no previous prototype for 'mas_lockdep_map'
Message-ID: <202606270547.qHs8FB7V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v7.2
head:   be119ad50e9c87a4a975871d84614f7c6aeaf0de
commit: 3e341aa5972e499ffef5881c5dad0f9aa3488053 [3/31] maple_tree: Add write lock checking with lockdep sequence numbers
config: x86_64-buildonly-randconfig-004-20260627 (https://download.01.org/0day-ci/archive/20260627/202606270547.qHs8FB7V-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270547.qHs8FB7V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270547.qHs8FB7V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/maple_tree.c:1158:21: warning: no previous prototype for 'mas_lockdep_map' [-Wmissing-prototypes]
    1158 | struct lockdep_map *mas_lockdep_map(struct ma_state *mas)
         |                     ^~~~~~~~~~~~~~~


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
