Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF0A2D979C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 19:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771530649; cv=none; b=XSL5z9s8Z/nqkocRkG906OlMb1UTadEEbyBGtUwyRFzW+u0UqVtcUNUMG+rCq0vRp+AsEbXBhk92H3Yr6Qe1yJ4nbrEhtY6ZKk8BcN4dgYZpiQRfKN9co0mOlF91qrnBwcAHeivrHuuTiNzlQcY7lml6xyznSNxoAYiZMiVuRPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771530649; c=relaxed/simple;
	bh=ZUVIQtL+c9Ziqw+DdVc3pxcvRLQ/0ttP6trroyJXQII=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U0fC2zLK0POcg20d24MEiOcwlbleeK6fXKC+AFshuJQMeegVTmV96GI9YnuoqQN7O2KWD/GGpxKbBxzY2IqEa59VfmhAqXP5aGCSaaP20UAIOIP0Gy6hmz5LDQe2QXJdJ9rH9hQXhs1ttivGDxnRtHr5GemRrOAc2aQCau3oKQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enHV48lk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enHV48lk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771530648; x=1803066648;
  h=date:from:to:cc:subject:message-id;
  bh=ZUVIQtL+c9Ziqw+DdVc3pxcvRLQ/0ttP6trroyJXQII=;
  b=enHV48lktG18SSMWeSEHAbXgEUmxINNL6+xS3P2P/koDXps0VfGL9hvB
   xTQcgxnJD4ucP2bPF3npNusCbH21j8fuTqDAi56HDirGFyuY6w2ogt7qs
   8Un4AlxYsMAhAkaMvb9UylbzTHzSGOM8FTojqKXddevXSfIzDm92Hv9Mg
   PTq/Mgnm88BWW8BATsYwdpRT0hJeTnw1cwb8NJX4dvC7WzuhOMvm0ZcS0
   +JNNlq9xi8ZuINehDAqotqq9m7Ashx296UkR/U1bGgZk6TpYr0m3/K+K3
   kErjsdbef7hwTQDXyC0VMnlI2B9uia9jlo7xE2I5O7XH+gEq477hIB1tc
   Q==;
X-CSE-ConnectionGUID: PVay8mRKS6GmFQ9jV8P9rA==
X-CSE-MsgGUID: SyaQhUi4TCqJ91/scADSNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83345413"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="83345413"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 11:50:47 -0800
X-CSE-ConnectionGUID: 2S5hm4mNT/GJl45ZM7NNmw==
X-CSE-MsgGUID: 6HWtYAFHRs6I9BYK+kQlqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="245222213"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 11:50:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtA2t-000000013VU-3W7B;
	Thu, 19 Feb 2026 19:50:43 +0000
Date: Fri, 20 Feb 2026 03:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:dtor 2/2] kernel/bpf/bpf_local_storage.c:226:39:
 warning: variable 'smap' set but not used
Message-ID: <202602200331.GvTb9a3P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux dtor
head:   9c7a74fe9209d84e47db395e5dc36759509139fd
commit: 9c7a74fe9209d84e47db395e5dc36759509139fd [2/2] bpf: Delay freeing fields in local storage
config: i386-buildonly-randconfig-004-20260220 (https://download.01.org/0day-ci/archive/20260220/202602200331.GvTb9a3P-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200331.GvTb9a3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200331.GvTb9a3P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/bpf_local_storage.c: In function 'bpf_selem_free':
>> kernel/bpf/bpf_local_storage.c:226:39: warning: variable 'smap' set but not used [-Wunused-but-set-variable]
     226 |         struct bpf_local_storage_map *smap;
         |                                       ^~~~


vim +/smap +226 kernel/bpf/bpf_local_storage.c

0fe4b381a59ebc5 KP Singh         2021-12-24  222  
c0d63f309186d84 Martin KaFai Lau 2023-03-07  223  void bpf_selem_free(struct bpf_local_storage_elem *selem,
c0d63f309186d84 Martin KaFai Lau 2023-03-07  224  		    bool reuse_now)
c0d63f309186d84 Martin KaFai Lau 2023-03-07  225  {
e76a33e1c718652 Amery Hung       2025-11-14 @226  	struct bpf_local_storage_map *smap;
e76a33e1c718652 Amery Hung       2025-11-14  227  
e76a33e1c718652 Amery Hung       2025-11-14  228  	smap = rcu_dereference_check(SDATA(selem)->smap, bpf_rcu_lock_held());
e76a33e1c718652 Amery Hung       2025-11-14  229  
c8be3da14718f1e Amery Hung       2026-02-05  230  	if (!selem->use_kmalloc_nolock) {
f484f4a3e058b56 Amery Hung       2025-11-14  231  		/*
f484f4a3e058b56 Amery Hung       2025-11-14  232  		 * No uptr will be unpin even when reuse_now == false since uptr
f484f4a3e058b56 Amery Hung       2025-11-14  233  		 * is only supported in task local storage, where
f484f4a3e058b56 Amery Hung       2025-11-14  234  		 * smap->use_kmalloc_nolock == true.
9bac675e6368b96 Martin KaFai Lau 2024-10-23  235  		 */
08a7ce384e33e53 Martin KaFai Lau 2023-03-22  236  		__bpf_selem_free(selem, reuse_now);
08a7ce384e33e53 Martin KaFai Lau 2023-03-22  237  		return;
08a7ce384e33e53 Martin KaFai Lau 2023-03-22  238  	}
08a7ce384e33e53 Martin KaFai Lau 2023-03-22  239  
9bac675e6368b96 Martin KaFai Lau 2024-10-23  240  	if (reuse_now) {
f484f4a3e058b56 Amery Hung       2025-11-14  241  		/*
f484f4a3e058b56 Amery Hung       2025-11-14  242  		 * While it is okay to call bpf_obj_free_fields() that unpins uptr when
f484f4a3e058b56 Amery Hung       2025-11-14  243  		 * reuse_now == true, keep it in bpf_selem_free_rcu() for simplicity.
08a7ce384e33e53 Martin KaFai Lau 2023-03-22  244  		 */
f484f4a3e058b56 Amery Hung       2025-11-14  245  		call_rcu(&selem->rcu, bpf_selem_free_rcu);
9bac675e6368b96 Martin KaFai Lau 2024-10-23  246  		return;
08a7ce384e33e53 Martin KaFai Lau 2023-03-22  247  	}
9bac675e6368b96 Martin KaFai Lau 2024-10-23  248  
9bac675e6368b96 Martin KaFai Lau 2024-10-23  249  	call_rcu_tasks_trace(&selem->rcu, bpf_selem_free_trace_rcu);
c0d63f309186d84 Martin KaFai Lau 2023-03-07  250  }
c0d63f309186d84 Martin KaFai Lau 2023-03-07  251  

:::::: The code at line 226 was first introduced by commit
:::::: e76a33e1c7186526c2c133af73ea70da9275e1ba bpf: Remove smap argument from bpf_selem_free()

:::::: TO: Amery Hung <ameryhung@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
