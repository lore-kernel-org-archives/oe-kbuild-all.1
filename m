Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BADF9474
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728976659; cv=none; b=iDJ2yPDiDdgOaxUc6nL/wSH3/mJvTbrNF0hAsaC371xBtRtZH5pM3uD8CTYL3IYr0iIMiNsf19qnmIRmQxdprdGaeqS3HEYxBzyx1gTOo9B3/hAEC6QR0yzOa1nnWuMDl5yOifvlu49YUJ1suLvPRuMN765untSpILP65dTpTkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728976659; c=relaxed/simple;
	bh=VyVAUW2jfIahoUmBynf3DiQzN/V+aa3+M/nRBAz23MM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n94/PShbB+U3kZUlblkqNDALEZQYjp1KLVJJZwmk6wweM3KXA9pTvdkMeIs0hMxH62fWZ8UdCGTbzsPy9bhxviz4L+UvSDS6iYOmMWysfUniHVS0XisNK21AgA7/++jEHuM1CvIt2mQ9fyYS6CPEddkYOeQLsc5908ANN8Ju49c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUsbY0ZC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUsbY0ZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728976657; x=1760512657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VyVAUW2jfIahoUmBynf3DiQzN/V+aa3+M/nRBAz23MM=;
  b=nUsbY0ZCoYl8mCnO63JdlHPcS3XCxXTaRnq2JFjae1OUYmjxAeoT0uTw
   kVR+wUucoNLlS6luMxuDQUHOBupg/1mdh/5/tYdXhsvt9s4RJ5tOE2SJ3
   OiyiBs0CMYRI97vCbGijbu5Dh5nMVaRDOtAYCY3avMrSsDjaY7FPU5R1j
   zgTEfk2UY/Dsy2MOCZXRZ5UquyBNPqcxvu9d4TynmCQ+Wpz66kqKGXMDt
   WOzzOYa8ZXH7WXVNx/+HkiTzPOQVk0EcnFTX7rur5kGivWeUPq1G1HdWv
   wkUJ8Uwy23/01yLyhKAaDYIFAYvorlFTEFh52ekmr3JGvygv5KUCfCkHt
   g==;
X-CSE-ConnectionGUID: qflGKkEqQeeN/xLprxpSjw==
X-CSE-MsgGUID: y0c4drIkTK6RNnIAR1A6AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32269672"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="32269672"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 00:17:36 -0700
X-CSE-ConnectionGUID: WmlhLk42S8+/0MnNpC7PQQ==
X-CSE-MsgGUID: KXAS9CZQQbaS5K9BU3UFNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="115250230"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2024 00:17:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0boD-000HkP-0g;
	Tue, 15 Oct 2024 07:17:33 +0000
Date: Tue, 15 Oct 2024 15:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next_wrap5 13/13] kernel/padata.c:277:13: error: call
 to undeclared function 'cpumask_next_wrap_old'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202410151524.HTALvqw4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next_wrap5
head:   d2ce21c762c90540ac4114fe274ffa7bb0627c4c
commit: d2ce21c762c90540ac4114fe274ffa7bb0627c4c [13/13] drop cpumask_next_wrap_old
config: i386-defconfig (https://download.01.org/0day-ci/archive/20241015/202410151524.HTALvqw4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151524.HTALvqw4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151524.HTALvqw4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/padata.c:277:13: error: call to undeclared function 'cpumask_next_wrap_old'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     277 |                 pd->cpu = cpumask_next_wrap_old(cpu, pd->cpumask.pcpu, -1, false);
         |                           ^
   kernel/padata.c:277:13: note: did you mean 'cpumask_next_wrap'?
   include/linux/cpumask.h:316:14: note: 'cpumask_next_wrap' declared here
     316 | unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
         |              ^
   1 error generated.


vim +/cpumask_next_wrap_old +277 kernel/padata.c

16295bec6398a3 Steffen Klassert   2010-01-06  237  
0198ffd135f51d Steffen Klassert   2010-05-19  238  /*
bfde23ce200e6d Daniel Jordan      2019-09-05  239   * padata_find_next - Find the next object that needs serialization.
0198ffd135f51d Steffen Klassert   2010-05-19  240   *
bfcdcef8c8e346 Daniel Jordan      2019-12-03  241   * Return:
bfcdcef8c8e346 Daniel Jordan      2019-12-03  242   * * A pointer to the control struct of the next object that needs
0198ffd135f51d Steffen Klassert   2010-05-19  243   *   serialization, if present in one of the percpu reorder queues.
bfcdcef8c8e346 Daniel Jordan      2019-12-03  244   * * NULL, if the next object that needs serialization will
0198ffd135f51d Steffen Klassert   2010-05-19  245   *   be parallel processed by another cpu and is not yet present in
0198ffd135f51d Steffen Klassert   2010-05-19  246   *   the cpu's reorder queue.
0198ffd135f51d Steffen Klassert   2010-05-19  247   */
bfde23ce200e6d Daniel Jordan      2019-09-05  248  static struct padata_priv *padata_find_next(struct parallel_data *pd,
bfde23ce200e6d Daniel Jordan      2019-09-05  249  					    bool remove_object)
16295bec6398a3 Steffen Klassert   2010-01-06  250  {
16295bec6398a3 Steffen Klassert   2010-01-06  251  	struct padata_priv *padata;
16295bec6398a3 Steffen Klassert   2010-01-06  252  	struct padata_list *reorder;
6fc4dbcf027627 Herbert Xu         2019-07-18  253  	int cpu = pd->cpu;
16295bec6398a3 Steffen Klassert   2010-01-06  254  
f601c725a6ac07 Daniel Jordan      2020-07-14  255  	reorder = per_cpu_ptr(pd->reorder_list, cpu);
16295bec6398a3 Steffen Klassert   2010-01-06  256  
de5540d088fe97 Jason A. Donenfeld 2017-03-23  257  	spin_lock(&reorder->lock);
bfde23ce200e6d Daniel Jordan      2019-09-05  258  	if (list_empty(&reorder->list)) {
bfde23ce200e6d Daniel Jordan      2019-09-05  259  		spin_unlock(&reorder->lock);
bfde23ce200e6d Daniel Jordan      2019-09-05  260  		return NULL;
bfde23ce200e6d Daniel Jordan      2019-09-05  261  	}
16295bec6398a3 Steffen Klassert   2010-01-06  262  
bfde23ce200e6d Daniel Jordan      2019-09-05  263  	padata = list_entry(reorder->list.next, struct padata_priv, list);
16295bec6398a3 Steffen Klassert   2010-01-06  264  
bfde23ce200e6d Daniel Jordan      2019-09-05  265  	/*
bfde23ce200e6d Daniel Jordan      2019-09-05  266  	 * Checks the rare case where two or more parallel jobs have hashed to
bfde23ce200e6d Daniel Jordan      2019-09-05  267  	 * the same CPU and one of the later ones finishes first.
bfde23ce200e6d Daniel Jordan      2019-09-05  268  	 */
bfde23ce200e6d Daniel Jordan      2019-09-05  269  	if (padata->seq_nr != pd->processed) {
de5540d088fe97 Jason A. Donenfeld 2017-03-23  270  		spin_unlock(&reorder->lock);
bfde23ce200e6d Daniel Jordan      2019-09-05  271  		return NULL;
16295bec6398a3 Steffen Klassert   2010-01-06  272  	}
16295bec6398a3 Steffen Klassert   2010-01-06  273  
bfde23ce200e6d Daniel Jordan      2019-09-05  274  	if (remove_object) {
bfde23ce200e6d Daniel Jordan      2019-09-05  275  		list_del_init(&padata->list);
bfde23ce200e6d Daniel Jordan      2019-09-05  276  		++pd->processed;
c51c545689593d Yury Norov         2024-10-07 @277  		pd->cpu = cpumask_next_wrap_old(cpu, pd->cpumask.pcpu, -1, false);
16295bec6398a3 Steffen Klassert   2010-01-06  278  	}
16295bec6398a3 Steffen Klassert   2010-01-06  279  
bfde23ce200e6d Daniel Jordan      2019-09-05  280  	spin_unlock(&reorder->lock);
16295bec6398a3 Steffen Klassert   2010-01-06  281  	return padata;
16295bec6398a3 Steffen Klassert   2010-01-06  282  }
16295bec6398a3 Steffen Klassert   2010-01-06  283  

:::::: The code at line 277 was first introduced by commit
:::::: c51c545689593dcd7f0663611444812cd6c902e7 cpumask: deprecate cpumask_next_wrap()

:::::: TO: Yury Norov <yury.norov@gmail.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
