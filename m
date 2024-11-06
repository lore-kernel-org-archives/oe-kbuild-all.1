Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7DBF9F8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 00:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730853543; cv=none; b=mvSZ77qhTvBS7yGP0Y/QtGu1dypf9vbtlLba4LSzQmLxeEHaRL66ppYFxqVEtEN+01x8ER6AqaP3+jJ4stBf9vFmNGl643gpOiUqbr6Cpt4o6/orPwoOV0qdcVhqDOd/GTlBoKyH9YHYtqqDK3nPyR2PCT18k26LtOLd8ltqZ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730853543; c=relaxed/simple;
	bh=eY5ZO/e9XR2/Uh57vFmn0mLNH0/bGfv+KrTWNps1tbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qkxo8RUIRy5D5+YSuZiHd3z+3MEUUAJH5N1Xfrw9eAbwobZXaW/3aKaqqDN+Rkcs7m/NiUkPSDmjVlsOcHY6VHmDGpl3hrX+1M3v5u9Lm5U4UJS4VgOvuTgoGz+zxClE1zZPOzUjGE//xPx8IzYTX7/LwqvIY+0edOCYF5wKjJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7l8lscO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7l8lscO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730853541; x=1762389541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eY5ZO/e9XR2/Uh57vFmn0mLNH0/bGfv+KrTWNps1tbw=;
  b=Y7l8lscOpRC433NYpgFNFrXC+Bsg3ZLng1NYwuZyg/RgYYGiEe/BHKkd
   liUArOpV9vKg1Ta6aSNldUCUjRbiL0Yom8xCDCThu3VDw4SdASaNxg3m2
   IcsNzanX4dr7iY2zmZsPS1T9lTmIwWFHK45tuxNdS+riNBRejkzjRAnHf
   wOsU7vmu3MF9hfvL7DifoJzvwtYPubVt9WfzEqEuNhAiJHcIBE+2oKVWb
   4FSwqPYWplP/w7qNucj6Bx5c/vv8+I/60QoX6tm4ZLs1UnKAZysUq1bZr
   CrBjBYnMcppMUUEJUHeSkXz4MMo/6ZsBZf5HFvy/O1wAkKMlBenCfKlhX
   g==;
X-CSE-ConnectionGUID: uPb056HKSSSdwPHja3HL/g==
X-CSE-MsgGUID: /Qw6JfjdQ3irVgCwrLIoXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41227713"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="41227713"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 16:38:55 -0800
X-CSE-ConnectionGUID: ufA5GvcNSwiZmANZMhiflQ==
X-CSE-MsgGUID: BSLx4C9NSsueXJJxrr570Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="88793874"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Nov 2024 16:38:54 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8U4R-000me9-2h;
	Wed, 06 Nov 2024 00:38:51 +0000
Date: Wed, 6 Nov 2024 08:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:b4/slub-percpu-sheaves 2/9] mm/slub.c:2560:13: warning:
 'pcs_flush_all' defined but not used
Message-ID: <202411060828.opOeNEjg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/slub-percpu-sheaves
head:   c2ef14761b7d660275c07a6f6c53db215045bcfc
commit: 8a21fb0b8625d6f4f77351cc33427d9c52fd9cdf [2/9] mm/slub: add opt-in caching layer of percpu sheaves
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241106/202411060828.opOeNEjg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060828.opOeNEjg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060828.opOeNEjg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slub.c:2560:13: warning: 'pcs_flush_all' defined but not used [-Wunused-function]
    2560 | static void pcs_flush_all(struct kmem_cache *s)
         |             ^~~~~~~~~~~~~


vim +/pcs_flush_all +2560 mm/slub.c

  2552	
  2553	/*
  2554	 * Caller needs to make sure migration is disabled in order to fully flush
  2555	 * single cpu's sheaves
  2556	 *
  2557	 * flushing operations are rare so let's keep it simple and flush to slabs
  2558	 * directly, skipping the barn
  2559	 */
> 2560	static void pcs_flush_all(struct kmem_cache *s)
  2561	{
  2562		struct slub_percpu_sheaves *pcs;
  2563		struct slab_sheaf *spare, *rcu_free;
  2564		unsigned long flags;
  2565	
  2566		local_lock_irqsave(&s->cpu_sheaves->lock, flags);
  2567		pcs = this_cpu_ptr(s->cpu_sheaves);
  2568	
  2569		spare = pcs->spare;
  2570		pcs->spare = NULL;
  2571	
  2572		rcu_free = pcs->rcu_free;
  2573		pcs->rcu_free = NULL;
  2574	
  2575		local_unlock_irqrestore(&s->cpu_sheaves->lock, flags);
  2576	
  2577		if (spare) {
  2578			sheaf_flush(s, spare);
  2579			free_empty_sheaf(s, spare);
  2580		}
  2581	
  2582		// TODO: handle rcu_free
  2583		BUG_ON(rcu_free);
  2584	
  2585		sheaf_flush_main(s);
  2586	}
  2587	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
