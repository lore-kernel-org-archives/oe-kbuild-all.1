Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81D91CA82
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706178217; cv=none; b=G74vHk+uPgTOeh/S2N2Oik9ntgcVeP50GPlHP/BFEMLaNqBd7FUqzw89Buf+cRJwwbDjUSdUvujAJfJLFPWEfmd2m4Hf3rsE4juFYjCIcGDXChAX4108qysHo68pRK/D6aLfZ52h5Eu+PunNHg8LCaolYqwfwkJ1hV7whQ2vuA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706178217; c=relaxed/simple;
	bh=JGRSWsf/bJfZ+uYQM0hPbAZ+CFYm1tvD7H9lhaGrMTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H2bxgNjl+LscN50AMqLaJsopcgbLGyFJlyxrHvuRh24/muwhTJKw30wvvwhO1koz4VW2oAW9zSNQhSatPQX9xxvXIi7XjVukM0J1S6d62YO6pBlmCBC4ndXHcVDwRE5AW/1WwKdcqWaarl9m61ZA/Tm8JF818junHqNrh8Fai8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YM1ndud4; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YM1ndud4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706178214; x=1737714214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JGRSWsf/bJfZ+uYQM0hPbAZ+CFYm1tvD7H9lhaGrMTo=;
  b=YM1ndud4hzkHrFdEFhzuXn7kRoyF4NdtCnn9FJMYqFzx4EVrGZhKzNxY
   v/fU/wGYcWUfdcQzgwpIPQ5GnSd2cSZNUbSJKFEcVt4PtMp2iMtnYFG0C
   ngVBshyXfOScJuu71SzXlq2qd9pjTZfRQKPuLeKtVyeQrW8s/WEfAdLoi
   LrTHXCcxUX6MoecSxXdQt9eD7pFS4i269G51S1iNEjLgBTU5BHO7GkqaH
   AzkW00YTmFwJ3qArcPMZqy12y1r5s2fDUyWo0IIEIlhr/zQNCBNDT6FgB
   e/BJLYyBtEZ2zS9/L8Jxz4eJ1YwqswnQ60RVgiwSyeFNK7FDt/8Mne461
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405872197"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="405872197"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 02:23:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905921824"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="905921824"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Jan 2024 02:23:32 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSwtO-0008uH-0J;
	Thu, 25 Jan 2024 10:23:30 +0000
Date: Thu, 25 Jan 2024 18:22:36 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 1589/1892] fs/proc/task_mmu.c:143:45: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202401251829.0m6Eo4LI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
commit: 0c30c4cd953025979b7689e49844837f762303ec [1589/1892] mm/maps: read proc/pid/maps under RCU
config: x86_64-randconfig-121-20240125 (https://download.01.org/0day-ci/archive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251829.0m6Eo4LI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251829.0m6Eo4LI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/proc/task_mmu.c:143:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file ** @@
   fs/proc/task_mmu.c:143:45: sparse:     expected struct file [noderef] __rcu **f
   fs/proc/task_mmu.c:143:45: sparse:     got struct file **
   fs/proc/task_mmu.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'get_vma_snapshot' - unexpected unlock
   fs/proc/task_mmu.c:264:22: sparse: sparse: context imbalance in 'm_start' - different lock contexts for basic block
   include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'm_stop' - unexpected unlock
   include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'smaps_pte_range' - unexpected unlock
   include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'clear_refs_pte_range' - unexpected unlock
   include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'pagemap_pmd_range' - unexpected unlock
   include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'pagemap_scan_pmd_entry' - unexpected unlock
   fs/proc/task_mmu.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +143 fs/proc/task_mmu.c

   132	
   133	/*
   134	 * Take VMA snapshot and pin vm_file and anon_name as they are used by
   135	 * show_map_vma.
   136	 */
   137	static int get_vma_snapshot(struct proc_maps_private *priv, struct vm_area_struct *vma)
   138	{
   139		struct vm_area_struct *copy = &priv->vma_copy;
   140		int ret = -EAGAIN;
   141	
   142		memcpy(copy, vma, sizeof(*vma));
 > 143		if (copy->vm_file && !get_file_rcu(&copy->vm_file))
   144			goto out;
   145	
   146		if (!anon_vma_name_get_if_valid(copy))
   147			goto put_file;
   148	
   149		if (priv->mm_wr_seq == mmap_write_seq_read(priv->mm))
   150			return 0;
   151	
   152		/* Address space got modified, vma might be stale. Wait and retry. */
   153		rcu_read_unlock();
   154		ret = mmap_read_lock_killable(priv->mm);
   155		mmap_write_seq_record(priv->mm, &priv->mm_wr_seq);
   156		mmap_read_unlock(priv->mm);
   157		rcu_read_lock();
   158	
   159		if (!ret)
   160			ret = -EAGAIN; /* no other errors, ok to retry */
   161	
   162		anon_vma_name_put_if_valid(copy);
   163	put_file:
   164		if (copy->vm_file)
   165			fput(copy->vm_file);
   166	out:
   167		return ret;
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
