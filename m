Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE6915B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 02:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687314474; x=1718850474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K3DiFHLxLCjSvGTOLnc5YfKPoBsHib1194BlM3655dk=;
  b=XEYCLi0TaYsRpYE09C5Aoiih7TLIzAdktlMgG6/FN2jS8+q1aanmpq3Y
   DiskgAs/xAEuPYlvfzZugEiMZa537QRSDwqkz6g6ItkndJwsOI3TCELYw
   m10NPs+iryHHpKYsK8wFpQMvqHEq1/f/fXFCaOnngLOWVpw/KYuy3x66j
   bNEP2kwKuxn2X7BKFky3sgp4TQgLj8FBl63WFDyWD4rzxGY8Jy/dGx10M
   ZmMbzIZnwol5yEBrY/yIDJQulTCINPw8bcNPs8TaHurc+aHL3bKYu2l7B
   1fl9dTrviSmmHuR/7c5LLgRs6Tj8aiMijQL9/sGK1VVhpZQTp/QZjvIzZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="362584735"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="362584735"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 19:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="961000626"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="961000626"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jun 2023 19:27:52 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBnZX-0006Sr-1b;
	Wed, 21 Jun 2023 02:27:51 +0000
Date: Wed, 21 Jun 2023 10:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, Yu Zhao <yuzhao@google.com>,
	"T . J . Alumbaugh" <talumbau@google.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 3/3] mm/lru_gen: Don't build multi-gen LRU page table
 walk code on architecture not supported
Message-ID: <202306211018.fodsNZaR-lkp@intel.com>
References: <20230613120047.149573-3-aneesh.kumar@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613120047.149573-3-aneesh.kumar@linux.ibm.com>

Hi Aneesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master tip/x86/core v6.4-rc7 next-20230620]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V/mm-lru_gen-lru_gen_look_around-simplification/20230613-200408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230613120047.149573-3-aneesh.kumar%40linux.ibm.com
patch subject: [PATCH 3/3] mm/lru_gen: Don't build multi-gen LRU page table walk code on architecture not supported
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20230621/202306211018.fodsNZaR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211018.fodsNZaR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211018.fodsNZaR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:4564:6: warning: no previous prototype for '__try_to_inc_max_seq' [-Wmissing-prototypes]
    4564 | bool __try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/__try_to_inc_max_seq +4564 mm/vmscan.c

  4559	
  4560	/*
  4561	 * inc_max_seq can drop the lru_lock in between. So use a waitqueue seq_update_progress
  4562	 * to allow concurrent access.
  4563	 */
> 4564	bool __try_to_inc_max_seq(struct lruvec *lruvec, unsigned long max_seq,
  4565				  bool can_swap, bool force_scan)
  4566	{
  4567		bool success = false;
  4568		struct lru_gen_folio *lrugen = &lruvec->lrugen;
  4569	
  4570		VM_WARN_ON_ONCE(max_seq > READ_ONCE(lrugen->max_seq));
  4571	
  4572		/* see the comment in iterate_mm_list() */
  4573		if (lruvec->seq_update_progress)
  4574			success = false;
  4575		else {
  4576			spin_lock_irq(&lruvec->lru_lock);
  4577	
  4578			if (max_seq != lrugen->max_seq)
  4579				goto done;
  4580	
  4581			if (lruvec->seq_update_progress)
  4582				goto done;
  4583	
  4584			success = true;
  4585			lruvec->seq_update_progress = true;
  4586	done:
  4587			spin_unlock_irq(&lruvec->lru_lock);
  4588		}
  4589	
  4590		if (success)
  4591			inc_max_seq(lruvec, can_swap, force_scan);
  4592	
  4593		return success;
  4594	}
  4595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
