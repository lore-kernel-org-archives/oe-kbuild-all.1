Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336071B3942
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721492; cv=none; b=Q4E45tNJWutSVeBPDkqg8/+ls7nab+AkrJBq6vDZc+6flqON8XuSa6r9HpHlHayEArLuoq8AwPlZrqz0gVtIUO4cVeiuN2iO+A4wuDvj78XmQ1w2EARHFoj/wd1SO6NNYKuRibYHKG27XrI/+OatF8rIM92WlKxBTJfwyloIW24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721492; c=relaxed/simple;
	bh=UQePkfvW2IajzZIFAajN26e0pEtfObojWsY/qh/Q8IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amC2Dcm5eBviWOyF/jkFd5rzGj2C7kO4r85VfHCt8vkXFIuLNIFEut2lH9S9FBjszDAijCJntKhObUKE/gWBFVpQ4OX7vPxlPoTG/0+657jixRQLuj5JiXxfaZ/YIxafgdBwspkiDbgmNHgM81MyXo7ir2Dy5hNy491UhELh61k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUj+QB2V; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUj+QB2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730721491; x=1762257491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UQePkfvW2IajzZIFAajN26e0pEtfObojWsY/qh/Q8IQ=;
  b=JUj+QB2VcXUfenwx0txVN/8h4EgL+m8pLU4y5COCHcUMIqP7316ZdxxO
   z/Z+RR7QpZN15zIa1YFiLp3DPJG/TVDTFkl65bPPchL1fb8yxcFalLUxC
   vIhufMsQMbtFl76lfBZ1Y0Mc5FEqx1LLi9D5gSuELxvdEkr/UOE5/XKnK
   SGROBdskVjHrJJM9ICOrZGmBaC9nx4dVR1Dx8o1GC/2OqXCcxhhdkNLxj
   0xO31H3G948B1MfFLEjRicrRFUEcaaQ5cTJc6+6GtMLFRZVuE1B497BgW
   H3Zq9Ac1l3zN/k0riOzwAccMY2GQEpmr7DX/CgAtFqpkYBdvxbtSdLN43
   A==;
X-CSE-ConnectionGUID: m7Z8m2gdS3mi1+Q5h01jpQ==
X-CSE-MsgGUID: OUKudQPrQS+9umzqJWLN8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30516981"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="30516981"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 03:58:10 -0800
X-CSE-ConnectionGUID: CmdIrHemSCWy5SuMsykP7g==
X-CSE-MsgGUID: GTjfcR6PRpmEmax0Tp9Ycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="114437685"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Nov 2024 03:58:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7vig-000kn9-1N;
	Mon, 04 Nov 2024 11:58:06 +0000
Date: Mon, 4 Nov 2024 19:57:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:mpmc_v2 3/3] mm/page_frag_test.c:190:16: warning: 'rc'
 is used uninitialized
Message-ID: <202411041939.kd5E6RS6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git mpmc_v2
head:   b1b3f4485a8277decc8e13a8a8986b3d9298f316
commit: b1b3f4485a8277decc8e13a8a8986b3d9298f316 [3/3] mm: page_frag: numa-aware push
config: powerpc-randconfig-r053-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041939.kd5E6RS6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041939.kd5E6RS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041939.kd5E6RS6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/page_frag_test.c: In function 'objpool_push.constprop':
>> mm/page_frag_test.c:190:16: warning: 'rc' is used uninitialized [-Wuninitialized]
     190 |         return rc;
         |                ^~
   mm/page_frag_test.c:169:13: note: 'rc' was declared here
     169 |         int rc;
         |             ^~


vim +/rc +190 mm/page_frag_test.c

fe0f006f768f10 Yunsheng Lin 2024-07-31  160  
fe0f006f768f10 Yunsheng Lin 2024-07-31  161  /* reclaim an object to object pool */
fe0f006f768f10 Yunsheng Lin 2024-07-31  162  static int objpool_push(void *obj, struct objpool_head *pool)
fe0f006f768f10 Yunsheng Lin 2024-07-31  163  {
b1b3f4485a8277 Yunsheng Lin 2024-11-03  164  	const struct cpumask *prev = cpu_none_mask;
b1b3f4485a8277 Yunsheng Lin 2024-11-03  165  	int numa_node = numa_mem_id();
b1b3f4485a8277 Yunsheng Lin 2024-11-03  166  	const struct cpumask *mask;
fe0f006f768f10 Yunsheng Lin 2024-07-31  167  	unsigned long flags;
b1b3f4485a8277 Yunsheng Lin 2024-11-03  168  	int start_cpu, cpu;
fe0f006f768f10 Yunsheng Lin 2024-07-31  169  	int rc;
fe0f006f768f10 Yunsheng Lin 2024-07-31  170  
fe0f006f768f10 Yunsheng Lin 2024-07-31  171  	/* disable local irq to avoid preemption & interruption */
fe0f006f768f10 Yunsheng Lin 2024-07-31  172  	raw_local_irq_save(flags);
b1b3f4485a8277 Yunsheng Lin 2024-11-03  173  	rcu_read_lock();
b1b3f4485a8277 Yunsheng Lin 2024-11-03  174  
b1b3f4485a8277 Yunsheng Lin 2024-11-03  175  	start_cpu = raw_smp_processor_id();
b1b3f4485a8277 Yunsheng Lin 2024-11-03  176  	for_each_numa_hop_mask(mask, numa_node) {
b1b3f4485a8277 Yunsheng Lin 2024-11-03  177  		for_each_cpu_andnot_wrap(cpu, mask, prev, start_cpu) {
b1b3f4485a8277 Yunsheng Lin 2024-11-03  178  			rc = objpool_try_add_slot(obj, pool, cpu);
b1b3f4485a8277 Yunsheng Lin 2024-11-03  179  			if (!rc)
b1b3f4485a8277 Yunsheng Lin 2024-11-03  180  				goto out;
b1b3f4485a8277 Yunsheng Lin 2024-11-03  181  		}
fe0f006f768f10 Yunsheng Lin 2024-07-31  182  
b1b3f4485a8277 Yunsheng Lin 2024-11-03  183  		start_cpu = 0;
b1b3f4485a8277 Yunsheng Lin 2024-11-03  184  		prev = mask;
b1b3f4485a8277 Yunsheng Lin 2024-11-03  185  	}
b1b3f4485a8277 Yunsheng Lin 2024-11-03  186  
b1b3f4485a8277 Yunsheng Lin 2024-11-03  187  out:
b1b3f4485a8277 Yunsheng Lin 2024-11-03  188  	rcu_read_unlock();
b1b3f4485a8277 Yunsheng Lin 2024-11-03  189  	raw_local_irq_restore(flags);
fe0f006f768f10 Yunsheng Lin 2024-07-31 @190  	return rc;
fe0f006f768f10 Yunsheng Lin 2024-07-31  191  }
fe0f006f768f10 Yunsheng Lin 2024-07-31  192  

:::::: The code at line 190 was first introduced by commit
:::::: fe0f006f768f106d5d3e40ab87e252107ceb0624 mm: page_frag: add a test module for page_frag

:::::: TO: Yunsheng Lin <linyunsheng@huawei.com>
:::::: CC: Yunsheng Lin <linyunsheng@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
