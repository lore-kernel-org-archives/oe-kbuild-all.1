Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E39372614
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 05:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751865067; cv=none; b=QDkKtn8Lpf/y3VerSomsMLowUFsdTx0759sBn9rwWkSKBVY35HYfTwppvGDyNQ6WhBuVOB20yNxkSBK6FHVzRYyaB2anxPRi6pUlEmHeamnLgOHFDJY21ZqkOeZlWnKgSDzx8a6l1z8r4inP3qxCiYD/HMxfW/WeI+raPv1eM0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751865067; c=relaxed/simple;
	bh=s2A3HO70NoTO/BGaTHc+/tUjc6RIU3G5z7dyhVEDKpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F92M5O5PhIAAQQcN/j26mNNJcoIlqFaVWAXTSM3oa9AP5GvCLwTapKQ9wEln1OV7VvJNkdjk0p7i4jLy1lWQc3Dplbwlaf48a12pxXu9AyTDswdZ1/lj7791MvA4rrXno9YLW9aOou7iZfB/Hc9VyxuRBr92ZkDo6zHbvg1VxaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGRmDJD0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGRmDJD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751865066; x=1783401066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s2A3HO70NoTO/BGaTHc+/tUjc6RIU3G5z7dyhVEDKpo=;
  b=mGRmDJD0wnCVcCAN7dx0d8w9BtjRjTxd+TGEhgHcszwe3JBeNAv0gX6a
   3pmZb/hg6huJY6COy5pEssK0miDv0PkzwLOmC2/5OaTEKY7VebHYdhbdN
   u7q5l2IasblbsT98dtct9wTs+xBmrrE/KVwTq2w9L9bYUB02ofhxicXaU
   TK2EpZ/lRzmhBWI2qqjEGZeiKKVFW+GcoFVZ0zY/dpYQQOhgRSux/Uaz1
   WmPpi0evm+KU65DFLHYxsKdCE0Gv6WkaliGNDDDhy6RnRzcPncUje41k1
   QscwhvhWj0myrPqkvPMZA1GBF1PzeocX0PZddUjqpFtWNGIn6MuzyXe0T
   w==;
X-CSE-ConnectionGUID: NcrwZ2xZQqGeFluN/RQAaA==
X-CSE-MsgGUID: dE3Fe5P5RfCcvRDbCgRRSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54046967"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="54046967"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 22:11:06 -0700
X-CSE-ConnectionGUID: DMgNTngJSnqQ5g8qsIueOw==
X-CSE-MsgGUID: NYIdSPcOSB6oPBFubWLOEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="155602374"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Jul 2025 22:11:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYe86-00007v-1t;
	Mon, 07 Jul 2025 05:11:02 +0000
Date: Mon, 7 Jul 2025 13:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 3/5] mm: Use seprintf() instead of less ergonomic APIs
Message-ID: <202507071145.zcWsi1Wm-lkp@intel.com>
References: <e3271b5f2ad9fe1282c8e6892a15984b9e316340.1751823326.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3271b5f2ad9fe1282c8e6892a15984b9e316340.1751823326.git.alx@kernel.org>

Hi Alejandro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on akpm-mm/mm-nonmm-unstable linus/master v6.16-rc5 next-20250704]
[cannot apply to vbabka-slab/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alejandro-Colomar/vsprintf-Add-v-seprintf-v-stprintf/20250707-062040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/e3271b5f2ad9fe1282c8e6892a15984b9e316340.1751823326.git.alx%40kernel.org
patch subject: [RFC v2 3/5] mm: Use seprintf() instead of less ergonomic APIs
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250707/202507071145.zcWsi1Wm-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507071145.zcWsi1Wm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507071145.zcWsi1Wm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/slub.c: In function 'create_unique_id':
>> mm/slub.c:7445:13: warning: 'seprintf' reading 1 byte from a region of size 0 [-Wstringop-overread]
    7445 |         p = seprintf(p, e, "%07u", s->size);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:7445:13: note: referencing argument 2 of type 'const char[0]'
   In file included from include/linux/kernel.h:33,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/slub.c:13:
   include/linux/sprintf.h:18:22: note: in a call to function 'seprintf'
      18 | __printf(3, 4) char *seprintf(char *p, const char end[0], const char *fmt, ...);
         |                      ^~~~~~~~


vim +/seprintf +7445 mm/slub.c

  7411	
  7412	/* Create a unique string id for a slab cache:
  7413	 *
  7414	 * Format	:[flags-]size
  7415	 */
  7416	static char *create_unique_id(struct kmem_cache *s)
  7417	{
  7418		char *name = kmalloc(ID_STR_LENGTH, GFP_KERNEL);
  7419		char *p = name;
  7420		char *e = name + ID_STR_LENGTH;
  7421	
  7422		if (!name)
  7423			return ERR_PTR(-ENOMEM);
  7424	
  7425		*p++ = ':';
  7426		/*
  7427		 * First flags affecting slabcache operations. We will only
  7428		 * get here for aliasable slabs so we do not need to support
  7429		 * too many flags. The flags here must cover all flags that
  7430		 * are matched during merging to guarantee that the id is
  7431		 * unique.
  7432		 */
  7433		if (s->flags & SLAB_CACHE_DMA)
  7434			*p++ = 'd';
  7435		if (s->flags & SLAB_CACHE_DMA32)
  7436			*p++ = 'D';
  7437		if (s->flags & SLAB_RECLAIM_ACCOUNT)
  7438			*p++ = 'a';
  7439		if (s->flags & SLAB_CONSISTENCY_CHECKS)
  7440			*p++ = 'F';
  7441		if (s->flags & SLAB_ACCOUNT)
  7442			*p++ = 'A';
  7443		if (p != name + 1)
  7444			*p++ = '-';
> 7445		p = seprintf(p, e, "%07u", s->size);
  7446	
  7447		if (WARN_ON(p == NULL)) {
  7448			kfree(name);
  7449			return ERR_PTR(-EINVAL);
  7450		}
  7451		kmsan_unpoison_memory(name, p - name);
  7452		return name;
  7453	}
  7454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
