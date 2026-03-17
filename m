Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF358462
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773705774; cv=none; b=R9D+pPnySxvV8FDGRpiss4sOsi8fDyLHdwgeR/6QUEQRImZWjMKGCB0T7+eDXx75fj4KjnRuQckkrOLLAq0/DzQESupDQC6+syjYi2gAI3MvBnapWtvu4B7WJ5H/H1MTGDkpxAThA4dQTB+S+nKev+KD5HFg2h+EmnL6Pl0I6gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773705774; c=relaxed/simple;
	bh=lyh/fIUfUyV+HOgbYdUsavjX72+IQIat5bN5L7Vc6PU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lBJmhhNXdLKVvGDNXyldpi446D8mWoHwKOPOI8vRVAC0PymtTqXzs33R4lkN1WhkwYnF74TyEEvQqhqYw6FRHxQnNkkFt2ifVg5QdjOuOQB+yfl/BH2UswCbyx8nHr4r02YjudxKQzCqusu4bSb6RELC+OzgYIQrC3D8w8pVW20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/96km4Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/96km4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773705773; x=1805241773;
  h=date:from:to:cc:subject:message-id;
  bh=lyh/fIUfUyV+HOgbYdUsavjX72+IQIat5bN5L7Vc6PU=;
  b=U/96km4ZDFxnTxBia0b1+DwdWkn7v7GbKRrnjxImeZxwIZYhckX/2/M/
   QBCOGvuvT1tNe2uO+k1rCIDpUVY69KAb++kO2AgjL7j+rzJz13zW4F0fm
   yzP5KfgpB9Rmvw17NeOyVT9OKveaJJoNI9ich6IV5/hnML/wOOlY3+RYy
   i2Jh1GjAvyq5Qw4Zy7I/39vtsQzMzD1ddOkQ2vkZdl7NPmoroMMY7YdWr
   xJA6JkOGSOvO+3iwqA7pyazmS2YO3x56XidVb1Z7MWi7Eg1nzAgj/4veB
   A2laq6QGlww5OlkP8qVj/hqoJguaOnP9AZNUXuMNjZtv5sjztFaQGhnEy
   g==;
X-CSE-ConnectionGUID: HYKZJ+6hQcyxOHH0yLlBhw==
X-CSE-MsgGUID: K+er+f4+SI2+XXsmvqk99g==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74621924"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74621924"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 17:02:52 -0700
X-CSE-ConnectionGUID: oojmEUMSRfa+gIPl5P5VsQ==
X-CSE-MsgGUID: CC55+sLKTnSSSJEbIIg69Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="219611286"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 16 Mar 2026 17:02:50 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2HtY-000000004KL-2Q2i;
	Tue, 17 Mar 2026 00:02:48 +0000
Date: Tue, 17 Mar 2026 01:02:12 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 2/8]
 ./include/linux/futex_types.h:52:50: error: expected ':', ',', ';', '}' or
 '__attribute__' before '*' token
Message-ID: <202603170036.GYWq3i8Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   226e6782e81c88b9263e006a356f58dd8c15bef5
commit: 2ace2e1df2b9de73d65c1a11bbb4183c42ba5752 [2/8] futex: Move futex related mm_struct data into a struct
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260317/202603170036.GYWq3i8Z-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603170036.GYWq3i8Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603170036.GYWq3i8Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/sched.h:19,
                    from ./include/linux/ratelimit.h:6,
                    from ./include/linux/dev_printk.h:16,
                    from ./include/linux/device.h:15,
                    from ./include/linux/async.h:14,
                    from init/initramfs.c:3:
>> ./include/linux/futex_types.h:52:50: error: expected ':', ',', ';', '}' or '__attribute__' before '*' token
      52 |         unsigned int                    __percpu *phash_ref;
         |                                                  ^


vim +52 ./include/linux/futex_types.h

    33	
    34	/**
    35	 * struct futex_mm_data - Futex related per MM data
    36	 * @phash_lock:		Mutex to protect the private hash operations
    37	 * @phash:		RCU managed pointer to the private hash
    38	 * @phash_new:		Pointer to a newly allocated private hash
    39	 * @phash_batches:	Batch state for RCU synchronization
    40	 * @phash_rcu:		RCU head for call_rcu()
    41	 * @phash_atomic:	Aggregate value for @phash_ref
    42	 * @phash_ref:		Per CPU reference counter for a private hash
    43	 */
    44	struct futex_mm_data {
    45	#ifdef CONFIG_FUTEX_PRIVATE_HASH
    46		struct mutex			phash_lock;
    47		struct futex_private_hash	__rcu *phash;
    48		struct futex_private_hash	*phash_new;
    49		unsigned long			phash_batches;
    50		struct rcu_head			phash_rcu;
    51		atomic_long_t			phash_atomic;
  > 52		unsigned int			__percpu *phash_ref;
    53	#endif
    54	};
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
