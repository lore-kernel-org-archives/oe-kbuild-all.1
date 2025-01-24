Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D1B1D5CD4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 02:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737686613; cv=none; b=F2RQgBbtPaFukx87QPZyfS/yQ5IzH5TyoDGUoU1/7Jes7TxycFf+55v4xQVpaofYUUoEOXJjNNG/WR95LY/SyP0CcX/B5oOttsdT8Vp9TNQtkykMpp/tcYDvEH/kPulrvYcAmmlTES5S2nsiiEjDxjuIOr5F0VTUQcmPUJtWn6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737686613; c=relaxed/simple;
	bh=UDJw6klU5GC5OvWvKPQ6ddT5q8IZcysi3RWSZDH7Kno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrFlNuTpyj64gIEdySzD45g3naQ9a70MXLmgsXMF+Hu0yT3DD58tMuXagjIzGirTEUqyI02T01VybEG4xGswhCcrvvRD6eomyt7A67gYW9Q8PFDK0SWGtoNj4BeN+EyBbCk2YfITUQFmh4LnMixiyBm+fWtx8rDjpSx+R1skKi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2bDsZOp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2bDsZOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737686611; x=1769222611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UDJw6klU5GC5OvWvKPQ6ddT5q8IZcysi3RWSZDH7Kno=;
  b=W2bDsZOpESSA3bFdcgLL/H+NqS6PtOII10TUTxYDd68/heEU9JjnFSZg
   scmXB4sfULdYQWn0mCLjmssnpjxAJE/mI+D6lwihV5Meow75T15L9D+Hu
   xjo5lqZufNYb+WwZhCvpjXLWopgsVAMlyB7+QMB3ydv5VTvB6C7F+wjl8
   6qMjmUJUqSAnfpocGqZqtPQ2HS0fOH8Zp3tEb4R+N4gkE3KGRxMAI7YQ3
   oKN+J2CCCH8ZkJreZLLlVAn1SOfqYdJNqR5iB/aBvw2yf85hwHjWITz3u
   8PemocQMy7KZuW3SILrUx8dTfIP1rUNkY0rHWFYkt2g7aymaKNUkxLxJj
   g==;
X-CSE-ConnectionGUID: /bHAX+eWSc6QlRlD9aBU+g==
X-CSE-MsgGUID: l2mSwMzRSLyUIejFUGWtPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38469248"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="38469248"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 18:43:31 -0800
X-CSE-ConnectionGUID: Ws85L+DpTkyDXH1n8NnZRw==
X-CSE-MsgGUID: Q4/os04ZRnaob4ujie2NGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="138519428"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2025 18:43:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb9fL-000c2z-1h;
	Fri, 24 Jan 2025 02:43:27 +0000
Date: Fri, 24 Jan 2025 10:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] slab: don't batch kvfree_rcu() with SLUB_TINY
Message-ID: <202501241007.NYO5XTeM-lkp@intel.com>
References: <20250123-slub-tiny-kfree_rcu-v1-4-0e386ef1541a@suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123-slub-tiny-kfree_rcu-v1-4-0e386ef1541a@suse.cz>

Hi Vlastimil,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on e492fac3657b60b8dd78a6e8ca26d1d14706c7b3]

url:    https://github.com/intel-lab-lkp/linux/commits/Vlastimil-Babka/slab-rcu-move-TINY_RCU-variant-of-kvfree_rcu-to-SLAB/20250123-183930
base:   e492fac3657b60b8dd78a6e8ca26d1d14706c7b3
patch link:    https://lore.kernel.org/r/20250123-slub-tiny-kfree_rcu-v1-4-0e386ef1541a%40suse.cz
patch subject: [PATCH RFC 4/4] slab: don't batch kvfree_rcu() with SLUB_TINY
config: arc-randconfig-002-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241007.NYO5XTeM-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241007.NYO5XTeM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241007.NYO5XTeM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
ERROR: modpost: "kvfree_call_rcu" [fs/ext4/ext4.ko] undefined!
>> ERROR: modpost: "kvfree_call_rcu" [fs/ext2/ext2.ko] undefined!
ERROR: modpost: "kvfree_call_rcu" [fs/fuse/fuse.ko] undefined!
ERROR: modpost: "kvfree_call_rcu" [fs/overlayfs/overlay.ko] undefined!
ERROR: modpost: "kvfree_call_rcu" [fs/btrfs/btrfs.ko] undefined!
>> ERROR: modpost: "kvfree_call_rcu" [lib/dim/dimlib.ko] undefined!
ERROR: modpost: "kvfree_call_rcu" [drivers/gpu/drm/etnaviv/etnaviv.ko] undefined!
ERROR: modpost: "kvfree_call_rcu" [drivers/infiniband/core/ib_core.ko] undefined!
ERROR: modpost: "kvfree_call_rcu" [drivers/infiniband/core/ib_cm.ko] undefined!
ERROR: modpost: "kvfree_call_rcu" [drivers/infiniband/core/ib_uverbs.ko] undefined!
WARNING: modpost: suppressed 9 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
