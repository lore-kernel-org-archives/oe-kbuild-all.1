Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92658206
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706968776; cv=none; b=lXo1vLPn5qDJFxaKc1AJWxg32pdZmejocMjsw8JrQ+wMrj2A/05tW19cFgXR1VH1qE/GdIyiB8/WBYyxOPqt3a3Dp/divIwPMXx+zgaza8FL9motg8VamaqWqIorduqBA+1eGiCdZExhJkuvu42UjglD6vDEtBwMJyvYNR5PHSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706968776; c=relaxed/simple;
	bh=tfMghj2EHFVhQtt89dRMAsudia1RS5Au2NS0/D4ucFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tr5kt7XheMa1FDnaTL5pxy1qlukySC5I49CIcLHVGKM46SCxAPPRiJ+K8wIE1UlUnr+8t3CA+L5fnG6MVME3nksBHBAnaOurA44u98uZGVtQrLLvQT8iNMSt8/zRYnIJ5l2OGADtfclsEVQ9axJJy5oHAGJfj4PCTIOt6vYqcBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVC2GwwY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVC2GwwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706968774; x=1738504774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tfMghj2EHFVhQtt89dRMAsudia1RS5Au2NS0/D4ucFM=;
  b=WVC2GwwYJxe2OLrbyODcVvDLMr3/IAYaZ8n9QJcpdp6vRkbCT0uyXCtA
   SLBdZmXiv5zhHksfw8mpYDgOHiqvBr69wrIRWc6P7dXecl9CUSWA/la2t
   ec37/KV0QzjpNVQSb7F/A8knqaVtiKtknePzhmg7RO2eLP990dCgznUVT
   KUid/MNqN6JOF5q9XxwYnSjGpXzCCuOrPr1X/siY6vD1QDCcQFUz1nBIH
   6cHO41Yk7yiqzgWsNjL/sOtgBhpH1YEqJcm80Tg4geVleguW+DfpoPkR/
   uAG8KaNcYUnlpgz9Vf10/i3F7JFiOCqowXRBwdSrFNw1dOuDlI18w5fM0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="4123248"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="4123248"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 05:59:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="4921874"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Feb 2024 05:59:31 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWGYK-00058E-2W;
	Sat, 03 Feb 2024 13:59:28 +0000
Date: Sat, 3 Feb 2024 21:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-caches-v4r1-BROKEN 2/6] mm/slub.c:4905:13:
 warning: 'flush_pca' defined but not used
Message-ID: <202402032111.AEPLIyDN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v4r1-BROKEN
head:   769a361e3d36bf4b006b69c6adbdcd24fe2e470a
commit: 8f3b3550b6d09f88b11b9d89eb1d6a215c48bf98 [2/6] mm/slub: add opt-in percpu array cache of objects
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240203/202402032111.AEPLIyDN-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402032111.AEPLIyDN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402032111.AEPLIyDN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slub.c:4905:13: warning: 'flush_pca' defined but not used [-Wunused-function]
    4905 | static void flush_pca(struct kmem_cache *s, unsigned int count)
         |             ^~~~~~~~~


vim +/flush_pca +4905 mm/slub.c

  4904	
> 4905	static void flush_pca(struct kmem_cache *s, unsigned int count)
  4906	{
  4907		struct slub_percpu_array *pca;
  4908		unsigned int batch, remaining;
  4909		void *objects[PCA_BATCH_MAX];
  4910		unsigned long flags;
  4911	
  4912		local_lock_irqsave(&s->cpu_array->lock, flags);
  4913		pca = this_cpu_read(s->cpu_array);
  4914	
  4915	next_batch:
  4916		batch = min(count, PCA_BATCH_MAX);
  4917	
  4918		batch = min(batch, pca->used);
  4919	
  4920		for (unsigned int i = 0; i < batch; i++) {
  4921			objects[i] = pca->objects[--pca->used];
  4922		}
  4923	
  4924		remaining = pca->used;
  4925	
  4926		local_unlock_irqrestore(&s->cpu_array->lock, flags);
  4927	
  4928		__kmem_cache_free_bulk(s, batch, &objects[0]);
  4929	
  4930		stat_add(s, PCA_FLUSH, batch);
  4931	
  4932		if (batch < count && remaining > 0) {
  4933			count -= batch;
  4934			local_lock_irqsave(&s->cpu_array->lock, flags);
  4935			pca = this_cpu_read(s->cpu_array);
  4936			goto next_batch;
  4937		}
  4938	}
  4939	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
