Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CEB30C144
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 04:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782275340; cv=none; b=GjO6Ar4HX+AWK9qKnvvAIu9aQPjaimeHTwbTOQ86bP/2d+NzEO36HOeOjmv5XS9aZsHDY+jcC6Igq+zl17VzB5DOJaq+aCqiOFAdU5Yt6InwYtUQNfU/0G+ovxHXi4CSZk1bg9oO//AHkYPNJysUIflgqn4idhpmQ8OunF2aRHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782275340; c=relaxed/simple;
	bh=mGrqJAVUNK+/qlwKkue3gTNs+JZvk/G5XsG0sPucy9s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rRHxJfGrDG1FI4V24m6yzNlNux4OeWHwH4vJncXuZSZNB2xJUVUMkFf6dreCeWMeiv39GtWeUcEnFufcEfn32BN9GVMs/SC2aI5Iu1o5P2hyKopkLiYow73Y84eQL/iEkBtnNQ0YyiLwGyGVuiTbDqJ7T3wVA6vgWzUbE2dIKz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUBworbx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUBworbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782275339; x=1813811339;
  h=date:from:to:cc:subject:message-id;
  bh=mGrqJAVUNK+/qlwKkue3gTNs+JZvk/G5XsG0sPucy9s=;
  b=VUBworbxukTn1jdOOxjb+wNLdLBYoE1o4OMgWDAEDOjahoLj/v7cB/VU
   XERHFWJZvtQ4Ot986JnXERWpAx+PYB09flTNth/GCmvOmZhP88evVW4sB
   7laLtHBsHjD6xHowscOgl4RfWF9TEEqz5S19lBCwO5SA5qhQ8Kq0w9COf
   3o0AVoBV1Ui8KTv+0KbcZzKZ3ICQy4F1xIczqxBsF9uwv2kODJs8OIc8u
   xZLf2Ad4RDGPQqH265yv5iFDRaQXOrM5zhXucTJgXOUJfWpkGjVJhYpji
   1U7BvF46lE3a8M9zJgSzPWxldVUN/8GQ2ahr7bs9aWtNk2MLQnRwajjAX
   w==;
X-CSE-ConnectionGUID: iLxyC13URSaYFxlV7osYDA==
X-CSE-MsgGUID: JH1lI2jJS66+ziKElSrPgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93620325"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="93620325"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 21:28:58 -0700
X-CSE-ConnectionGUID: yg7e8vPbRuqJxCGPPUa2iA==
X-CSE-MsgGUID: 50QYsKaTTMWyqCi8mwcrCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249818701"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Jun 2026 21:28:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcFEM-00000000375-0mvt;
	Wed, 24 Jun 2026 04:28:54 +0000
Date: Wed, 24 Jun 2026 12:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmck-rcu:puranjay.2026.06.23a 57/62]
 kernel/rcu/rcu_segcblist.c:666:19: error: 'struct rcu_gp_seq' has no member
 named 'exp'
Message-ID: <202606241228.mnZEVVVG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git puranjay.2026.06.23a
head:   6daa08cf676d7c1ff53101073fdedbf3a6762370
commit: 2a07ef0ff9c70d0889e24fd5df792de66c8ae42c [57/62] rcu: Enable RCU callbacks to benefit from expedited grace periods
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260624/202606241228.mnZEVVVG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241228.mnZEVVVG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241228.mnZEVVVG-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/rcu_segcblist.c: In function 'srcu_segcblist_accelerate':
>> kernel/rcu/rcu_segcblist.c:666:19: error: 'struct rcu_gp_seq' has no member named 'exp'
     666 |                 gs.exp = RCU_GET_STATE_NOT_TRACKED;
         |                   ^


vim +666 kernel/rcu/rcu_segcblist.c

   660	
   661	bool srcu_segcblist_accelerate(struct rcu_segcblist *rsclp, unsigned long seq)
   662	{
   663		struct rcu_gp_seq gs = { .norm = seq };
   664	
   665		if (IS_ENABLED(CONFIG_SMP))
 > 666			gs.exp = RCU_GET_STATE_NOT_TRACKED;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
