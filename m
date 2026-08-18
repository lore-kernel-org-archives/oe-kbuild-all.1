Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91AA4207A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 04:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787026413; cv=none; b=UhV8z5j60tWREgVsNtvvRbXgNC9XSyC+xV1oNVJh1/tx2ovkJF+rxK+NctHvromYzSauGZKFueaA/fj/7e2I09uS4cIxoJe0l8f0KZaorKZlc2XYdMRtaGhxSNusvZxmWfwselFiLtQ5C+BAzixUtm3f+NA1NElkMYAy45ze3Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787026413; c=relaxed/simple;
	bh=XiX4E34VdozkAjZ0gRxp6uIaRSfVr0/elTidj4Rrymk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QBxdMmCM/I8djX3eisXBym4MKHbxkME57AndA2NS5BRq0XDC4kCJmdYVmV4BhWiImXOzUOqFE98ly98w1O0+9WkUIfdTyPkFzS1UwvYL53JS3mM7Wh0JO9lICQPFGNsq5ci0m3VTSaXJm/RjRvLlDBzHECg8CzHZ0LGtw6a1rLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbgfRfwZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbgfRfwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787026411; x=1818562411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XiX4E34VdozkAjZ0gRxp6uIaRSfVr0/elTidj4Rrymk=;
  b=JbgfRfwZCnUQs2O3DY6G6/j5aTnkiG38jSiOVRxGC7iglXP2nYbdMa/7
   gdoo7KjCw6drNUciTiY+SH/s73JPLJncSL5bJEZ8ADGMUmA0jXTLgOFmo
   VEYhBlROqOlX9WbTQi7exqg6EiSNBPYrrHXx8de0sgWJ/wOsqpr2gxqbl
   TFrdqpIafP77DBRtEQwSDunBmL8FabOiltA169Cw/1KzACTtiVLEo4Wfh
   r0OjxZcYlvG/+3oTeY2Gtj60Yk7N852erOB6P7BKIyENKenzwAd9XiFlE
   UxQmlZNQENTC1E6WW87B6PMsnp9QjT3LM8Sb2ExGDDz0JfLK2x2j0cDcI
   w==;
X-CSE-ConnectionGUID: iTRrEnSuTxeOLfL1NCsGyQ==
X-CSE-MsgGUID: CWk2Rva9RqONh8G5+LJ8xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="110293206"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="110293206"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 21:13:31 -0700
X-CSE-ConnectionGUID: CCI08VU0TCKwKS+dgNQzNQ==
X-CSE-MsgGUID: WV1wL1TBQ6mJR0QaZhrJ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263366832"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Aug 2026 21:13:28 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwBCY-00000000e5o-283O;
	Tue, 18 Aug 2026 04:13:26 +0000
Date: Tue, 18 Aug 2026 12:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 6/21]
 kernel/bpf/verifier.c:19799:48: error: passing argument 4 of
 'folio_pool_init_key' from incompatible pointer type
Message-ID: <202608181109.MGRSLihF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git folio-pool-v2-lockdep
head:   e77ee8289ea0755b0ee299348504d4568f942d71
commit: ae43aea8c1fa99e61d57341384a5f99c293d1f5f [6/21] bpf/verifier: Route verifier stack state node allocations to folio_pool
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260818/202608181109.MGRSLihF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181109.MGRSLihF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181109.MGRSLihF-lkp@intel.com/

Note: the jimc/folio-pool-v2-lockdep HEAD e77ee8289ea0755b0ee299348504d4568f942d71 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'bpf_check':
>> kernel/bpf/verifier.c:19799:48: error: passing argument 4 of 'folio_pool_init_key' from incompatible pointer type [-Wincompatible-pointer-types]
   19799 |                             get_order(SZ_64K), &bpf_state_pool_key);
         |                                                ^~~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                struct static_key_true *
   In file included from include/linux/bpf_verifier.h:901,
                    from kernel/bpf/verifier.c:13:
   include/linux/folio_pool.h:240:45: note: expected 'struct static_key *' but argument is of type 'struct static_key_true *'
     240 |                          struct static_key *key);
         |                          ~~~~~~~~~~~~~~~~~~~^~~


vim +/folio_pool_init_key +19799 kernel/bpf/verifier.c

 19776	
 19777	int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr,
 19778		      struct bpf_log_attr *attr_log)
 19779	{
 19780		u64 start_time = ktime_get_ns();
 19781		struct bpf_verifier_env *env;
 19782		int i, len, ret = -EINVAL, err;
 19783		bool is_priv;
 19784	
 19785		BTF_TYPE_EMIT(enum bpf_features);
 19786	
 19787		/* no program is valid */
 19788		if (ARRAY_SIZE(bpf_verifier_ops) == 0)
 19789			return -EINVAL;
 19790	
 19791		/* 'struct bpf_verifier_env' can be global, but since it's not small,
 19792		 * allocate/free it every time bpf_check() is called
 19793		 */
 19794		env = kvzalloc_obj(struct bpf_verifier_env, GFP_KERNEL_ACCOUNT);
 19795		if (!env)
 19796			return -ENOMEM;
 19797	
 19798		folio_pool_init_key(&env->state_pool, sizeof(struct bpf_verifier_stack_elem),
 19799				    get_order(SZ_64K), &bpf_state_pool_key);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
