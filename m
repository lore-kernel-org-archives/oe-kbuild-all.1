Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AD42949E5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 09:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830026; cv=none; b=ORgQBQ0r60+Up1YcCm+xMsGdL9oZv7jqiMue1kyE20Dn9VgDm0r/M3xbiq9hzAzO1MwVSl/ek1RIMog9P4Pv0/2K61UqxdVZWcNDyraWaKbcKoUTPuX4tSzLkCtF4pKh0NrjT4E1toMrvy4BVwjhAR8bgqkKMsOz5OkpnOD++jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830026; c=relaxed/simple;
	bh=RChSlJ8/CDd3NrmYj8XDKyBEcimPta9LIPzGfBFOGV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YfOzcGyB1goM4t+mmx4XgXDTsHae6GSDktgi0QY9QO3Ndvybs+ZBediTYgotTz+c/bskoSan7lqnmw6zdIHq/g0ybDTsMzT6sJA5WDQCZbUBi+JLWMZQ4XzNbCjU2JDSrlzCW1+ptwka6WHJ4hppN4eyyThsI8qjsOH5WPY2alQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEw7Vpcc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEw7Vpcc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752830025; x=1784366025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RChSlJ8/CDd3NrmYj8XDKyBEcimPta9LIPzGfBFOGV8=;
  b=NEw7Vpccjdqc7FrbR3qOCNMDEghw33MEtuKGfUCoGk258D9XDXIrRpnP
   H1ZVG8FblZQpeHv24OW714mwtyXEsS/dcAu2wOnbK/5LMfgunYI/QA87Z
   2KBLZ8UkVwDLUImKpmYV0kPkf5QWa4v/kB4SvG0gd1/T4rRStr+v/wuDU
   wAGb0lZSFe95OvKcrTRbIRLRrluE1mt2Ulaul1EW7eqFvG8n7B8rAKyWA
   7recLmUP7QEsPIS5q9mRz/aLOHFKA/rPFnETzTlUBeF6GLJsyc8+JeaIP
   d9C15O4Tj80sxkse2WFhZZkQ0xtWrfUsGtlyXkfnegxVzl4pIYBoHflLx
   g==;
X-CSE-ConnectionGUID: TkNwTHp+QfynN3XFEZpWIA==
X-CSE-MsgGUID: 0+b7bI4US5afdfxtm93MHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55061521"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="55061521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 02:13:44 -0700
X-CSE-ConnectionGUID: 0jo58pj5Qg6ZzPd+JUwQCA==
X-CSE-MsgGUID: Ob/fxbeTS/63AEmMWQ/1CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="162038930"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2025 02:13:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uch9x-000ETf-0O;
	Fri, 18 Jul 2025 09:13:41 +0000
Date: Fri, 18 Jul 2025 17:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:net/pgty 5/5] net/core/devmem.c:100:8: error: no member
 named 'pp_magic' in 'struct net_iov'
Message-ID: <202507181704.KbD8RU8j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux net/pgty
head:   f693f41f0b807939f60546e7921a0c5848337e61
commit: f693f41f0b807939f60546e7921a0c5848337e61 [5/5] net: page_pool: kill pp_magic
config: x86_64-buildonly-randconfig-005-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181704.KbD8RU8j-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181704.KbD8RU8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181704.KbD8RU8j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/devmem.c:100:8: error: no member named 'pp_magic' in 'struct net_iov'
     100 |         niov->pp_magic = 0;
         |         ~~~~  ^
   1 error generated.


vim +100 net/core/devmem.c

170aafe35cb98e Mina Almasry   2024-09-10   81  
28c5c74eeaa0a2 Mina Almasry   2024-09-10   82  struct net_iov *
28c5c74eeaa0a2 Mina Almasry   2024-09-10   83  net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
28c5c74eeaa0a2 Mina Almasry   2024-09-10   84  {
28c5c74eeaa0a2 Mina Almasry   2024-09-10   85  	struct dmabuf_genpool_chunk_owner *owner;
28c5c74eeaa0a2 Mina Almasry   2024-09-10   86  	unsigned long dma_addr;
28c5c74eeaa0a2 Mina Almasry   2024-09-10   87  	struct net_iov *niov;
28c5c74eeaa0a2 Mina Almasry   2024-09-10   88  	ssize_t offset;
28c5c74eeaa0a2 Mina Almasry   2024-09-10   89  	ssize_t index;
28c5c74eeaa0a2 Mina Almasry   2024-09-10   90  
28c5c74eeaa0a2 Mina Almasry   2024-09-10   91  	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
28c5c74eeaa0a2 Mina Almasry   2024-09-10   92  					(void **)&owner);
28c5c74eeaa0a2 Mina Almasry   2024-09-10   93  	if (!dma_addr)
28c5c74eeaa0a2 Mina Almasry   2024-09-10   94  		return NULL;
28c5c74eeaa0a2 Mina Almasry   2024-09-10   95  
28c5c74eeaa0a2 Mina Almasry   2024-09-10   96  	offset = dma_addr - owner->base_dma_addr;
28c5c74eeaa0a2 Mina Almasry   2024-09-10   97  	index = offset / PAGE_SIZE;
7d60fa9e1ab1e4 Pavel Begunkov 2025-02-04   98  	niov = &owner->area.niovs[index];
28c5c74eeaa0a2 Mina Almasry   2024-09-10   99  
8ab79ed50cf10f Mina Almasry   2024-09-10 @100  	niov->pp_magic = 0;
8ab79ed50cf10f Mina Almasry   2024-09-10  101  	niov->pp = NULL;
8ab79ed50cf10f Mina Almasry   2024-09-10  102  	atomic_long_set(&niov->pp_ref_count, 0);
8ab79ed50cf10f Mina Almasry   2024-09-10  103  
28c5c74eeaa0a2 Mina Almasry   2024-09-10  104  	return niov;
28c5c74eeaa0a2 Mina Almasry   2024-09-10  105  }
28c5c74eeaa0a2 Mina Almasry   2024-09-10  106  

:::::: The code at line 100 was first introduced by commit
:::::: 8ab79ed50cf10f338465c296012500de1081646f page_pool: devmem support

:::::: TO: Mina Almasry <almasrymina@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
