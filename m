Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C564B1ABEB7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728917972; cv=none; b=k1YCruwOCV/Eb5V/bSCOxurC6DQVetDB5OdIQwfgBW9HVJd0vDniUghZbD2nRvZOj0cW+qPtzNd5i8IUk6JJ6GO4X4TEoyfChHeje7ntFjfY4SxRCz+xS53GvuKtT2UMea6Dus0C2IE8Rv6KGS43cYb8hNFXUVrVr9DBblMbkAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728917972; c=relaxed/simple;
	bh=5ai+5Djju1atMmYt6JiEE1PLV8hFiOAXL0MXgJalk6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FCavBGM+Ao9jLD31+Z5GtqxyuWAEwiHJCQTehsXPEj07gAPpxyxAWO3q5Ds0i2FXw0tYjVKTEU8IbAr16AjbAk7K4linKHL9oNUIkwUeFGcQ9qCGVH3Ic51/K8He8+R4cMZElkzDPRFlpnkGkgT72VbSoHbs6Hx0/UWlXyS24l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6GJSxzD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6GJSxzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728917971; x=1760453971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ai+5Djju1atMmYt6JiEE1PLV8hFiOAXL0MXgJalk6Y=;
  b=L6GJSxzDPyllOzNgEbUH1YkmzE7g6XIUaIGj6EiAxxvCZGCafUmCMJEx
   z4Q/3Xg7Xp3M41IQ6tpnNYigGjzx0iIqbTRKDOGQ+w0pSc6WbnZ4lguDq
   kF/bVOtn1ly8ic122Y4iidBcS3TEtSUqvVAb0oIyfrGKqQwkG3XKx0gUh
   ZPIB1gahcquPFHm7ryFNqj4V8URhX+o61ZbLBuo1obhrRt2ZZaIMX+msz
   EtQC4uLSOY4bKwJWe71EFNK+c+IzGcOhvjszWo0jrZyCMKfzLpb9HsJzh
   4qbMJeKZs72klhA70zrwjw+jbIFFfZOSZ2EMJiKIGib5NpiQ/E/5tJg4S
   Q==;
X-CSE-ConnectionGUID: sZM8RfCKSnWhCqnOQUsSDA==
X-CSE-MsgGUID: TS5KftirS8awtPRIzt9vsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28153846"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28153846"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 07:59:30 -0700
X-CSE-ConnectionGUID: 4giX7Rr9Sbe6airty5Qzfg==
X-CSE-MsgGUID: qf1ZMk6SRMGaGImS1hvD4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="77258096"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Oct 2024 07:59:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0MXf-000G5H-0a;
	Mon, 14 Oct 2024 14:59:27 +0000
Date: Mon, 14 Oct 2024 22:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next_wrap4 13/13] kernel/padata.c:277:27: error:
 implicit declaration of function 'cpumask_next_wrap_old'; did you mean
 'cpumask_next_wrap'?
Message-ID: <202410142245.DWSRLFUh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next_wrap4
head:   88192093b9133e4e21485afed62a2779c0025290
commit: 88192093b9133e4e21485afed62a2779c0025290 [13/13] drop cpumask_next_wrap_old
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241014/202410142245.DWSRLFUh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410142245.DWSRLFUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410142245.DWSRLFUh-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/padata.c: In function 'padata_find_next':
>> kernel/padata.c:277:27: error: implicit declaration of function 'cpumask_next_wrap_old'; did you mean 'cpumask_next_wrap'? [-Werror=implicit-function-declaration]
     277 |                 pd->cpu = cpumask_next_wrap_old(cpu, pd->cpumask.pcpu, -1, false);
         |                           ^~~~~~~~~~~~~~~~~~~~~
         |                           cpumask_next_wrap
   cc1: some warnings being treated as errors


vim +277 kernel/padata.c

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
02637a902619a6 Yury Norov         2024-10-07 @277  		pd->cpu = cpumask_next_wrap_old(cpu, pd->cpumask.pcpu, -1, false);
16295bec6398a3 Steffen Klassert   2010-01-06  278  	}
16295bec6398a3 Steffen Klassert   2010-01-06  279  
bfde23ce200e6d Daniel Jordan      2019-09-05  280  	spin_unlock(&reorder->lock);
16295bec6398a3 Steffen Klassert   2010-01-06  281  	return padata;
16295bec6398a3 Steffen Klassert   2010-01-06  282  }
16295bec6398a3 Steffen Klassert   2010-01-06  283  

:::::: The code at line 277 was first introduced by commit
:::::: 02637a902619a6c92c5dc0d39ba1fd9e9f0748e0 cpumask: deprecate cpumask_next_wrap()

:::::: TO: Yury Norov <yury.norov@gmail.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
