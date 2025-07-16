Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8391D5CED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 06:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752647199; cv=none; b=QTXwQlXwxUIJo7DKyw9YrUVIO13/+CR6jJj4MYujsNIT3bpfyIqi40QPe6iyaOJlAWxuvSbSvg8KajMmfEwSkoO8HWyKGN7xFQXUMTZt0wlc4N0X3aSQhVrLggqtntDd9jWN1GZglz0o8YjiICa/jFypQnz1Awjk0glgX0JeU7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752647199; c=relaxed/simple;
	bh=iXYggQez6Ewq8A6hYtFHEZy9e62NjX2TPCHPxSqhzlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aj8/W7DmWunlMuDMwSkZD2YUBlPxqj/2w3M5KhHc+a2By1HnsnfxIm/88ailf/dCqEwYflMwA7gIbWlHY4JRyJjkbB7Vwdfv2gQMisC/Sw4eBX71TirLmXTrV29Te0zVDwSEtBe7fcA7jylSdN3Uil3d4sw+Z1wApirmnm5D/z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jelf/rFr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jelf/rFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752647197; x=1784183197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iXYggQez6Ewq8A6hYtFHEZy9e62NjX2TPCHPxSqhzlk=;
  b=Jelf/rFrq80Z/U8+R1OUgw6zx/WL1Mz3eNdVoLc9HXphyggMoaSYC70l
   xgocEsvCbIpFRwWKJ4fZXjjkfVJKMyU+IcCJ1jkLk4npHNw0meRZ/c1OU
   3jjcm8JzUx+wSd5pM21dAht+sklVtTE0Ea0O4WUa6Nagb69w4P5tiD9O0
   KnyGw5/5rmA/qzZd/5DbEyv++GNHr+TvN/1Uf5HFt83mTO7hBkwY1bE0P
   bBE3ObkNo8l6lPZmy4MpXBIEcXW7N0ZPlv5UuBkW+OSN9P29e/enSz8wE
   XDvPBTFOZCq/EGQEIm32Q9LsT3ygIWt/8PDdenflYwqNAffwf6Tm9cviK
   A==;
X-CSE-ConnectionGUID: vE8BWdkeSnWQFGmK4NG7CQ==
X-CSE-MsgGUID: kh+vyRpJQImsOsmDW8R27A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="66235729"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="66235729"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 23:26:36 -0700
X-CSE-ConnectionGUID: RC6c4iTyTSuQ7qiV+T4tJA==
X-CSE-MsgGUID: aiRI7MaqS9aMZpyjjn6TjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="157521705"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Jul 2025 23:26:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubvb6-000C07-2J;
	Wed, 16 Jul 2025 06:26:32 +0000
Date: Wed, 16 Jul 2025 14:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [ast-bpf:kmalloc_nolock 2/7]
 kernel/rcu/../locking/rtmutex_common.h:220:35: error: redefinition of
 'rt_mutex_owner'
Message-ID: <202507161450.FAlonVwD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git kmalloc_nolock
head:   412a51611b2bfab5078bbb42e31a8a6fd8825d26
commit: 6d5e91e79e1f9a623ca1c40725fcf2688b251edc [2/7] locking/local_lock: Introduce local_lock_is_locked().
config: powerpc-randconfig-003-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161450.FAlonVwD-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161450.FAlonVwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161450.FAlonVwD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree_plugin.h:14,
                    from kernel/rcu/tree.c:4868:
>> kernel/rcu/../locking/rtmutex_common.h:220:35: error: redefinition of 'rt_mutex_owner'
     220 | static inline struct task_struct *rt_mutex_owner(struct rt_mutex_base *lock)
         |                                   ^~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.h:15,
                    from kernel/rcu/tree.c:69:
   include/linux/rtmutex.h:49:35: note: previous definition of 'rt_mutex_owner' with type 'struct task_struct *(struct rt_mutex_base *)'
      49 | static inline struct task_struct *rt_mutex_owner(struct rt_mutex_base *lock)
         |                                   ^~~~~~~~~~~~~~


vim +/rt_mutex_owner +220 kernel/rcu/../locking/rtmutex_common.h

c014ef69b3acdb Thomas Gleixner 2021-08-15  217  
531ae4b06a737e Thomas Gleixner 2021-08-15  218  #else /* CONFIG_RT_MUTEXES */
531ae4b06a737e Thomas Gleixner 2021-08-15  219  /* Used in rcu/tree_plugin.h */
830e6acc8a1caf Peter Zijlstra  2021-08-15 @220  static inline struct task_struct *rt_mutex_owner(struct rt_mutex_base *lock)
531ae4b06a737e Thomas Gleixner 2021-08-15  221  {
531ae4b06a737e Thomas Gleixner 2021-08-15  222  	return NULL;
531ae4b06a737e Thomas Gleixner 2021-08-15  223  }
531ae4b06a737e Thomas Gleixner 2021-08-15  224  #endif  /* !CONFIG_RT_MUTEXES */
531ae4b06a737e Thomas Gleixner 2021-08-15  225  

:::::: The code at line 220 was first introduced by commit
:::::: 830e6acc8a1cafe153a0d88f9b2455965b396131 locking/rtmutex: Split out the inner parts of 'struct rtmutex'

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
