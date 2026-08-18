Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF073C3787
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044897; cv=none; b=SKCS2hXq49I1m7S6CHkDnJYd9rzpImvduDs5qdEMeQqSlWJipFCt+fX3XSCblZ9/rgZUdfE42M2idPbBXHQ8vMC0z0KafpJgL/awFMV+hEdHq528m7PTd3XwYeTErAbSz+7tLefjkMHABfsYu8Cuc22mSABTVbjqQZiwOs7q9Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044897; c=relaxed/simple;
	bh=wa9/ABYvL7fZMLbyY9+8Vq4eJ23M2iVjkuPa2j589d8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O+KQuRsUZQKjBYx7te1g+i140dmG97+8gzbi4UeM/dMv2TgSQQ2YQ2sHUPhb6EQt+N1IIdDesebU+Wd8POYeN3bXhOdKGbwFoK0CuFYNl6KpOG3Q/or/AH7EgH31IhtITp7FbDEt947pCt+NQCbKqiY9QMtPdfeYviP5Yti/wLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzAv+EOF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzAv+EOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787044896; x=1818580896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wa9/ABYvL7fZMLbyY9+8Vq4eJ23M2iVjkuPa2j589d8=;
  b=QzAv+EOFBSbLGIoKr1ue6o2xdNDf+JNQc8iGJgD9l7jgT+qCX1pA4o0s
   oR+abe0xSCge4d/ITjyzpwrjbAEYRdiqqwn/tyuXa2aR73Km5QNJlshLl
   eDeR/5PVu3Z8twUx5e8fDeW0TWNzX4ve3T/iSIXZYk7bDsvj7KAGUU4xB
   etYGEif435FcZErG5gLxUJb2gY99lnem7oLgH+ReBM4pdaBmvReGslEs7
   rt56e84vVwL87EMQ3kEmFuXLSO6Cw6xCW6KvCDJPwBP6WOEmwyFkAiKCn
   TnoRyLi1q/72vZYejv2Gr9u7bYRCXMXZhEdZPc3IpoJbsk4LBWR14EFlc
   w==;
X-CSE-ConnectionGUID: Ur8AQCacRoSKyPIeb0EqeQ==
X-CSE-MsgGUID: XDwNhTB5SzSc2XH694qQQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98199192"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98199192"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 02:21:33 -0700
X-CSE-ConnectionGUID: V+3v3vo0RpGsWAIKyBoTWw==
X-CSE-MsgGUID: y1syanvxSIuUXBvi1Akf3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="267142522"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 02:21:32 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwG0f-00000000eDs-3s8L;
	Tue, 18 Aug 2026 09:21:29 +0000
Date: Tue, 18 Aug 2026 17:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 6/21]
 kernel/bpf/verifier.c:19799:27: error: incompatible pointer types passing
 'struct static_key_true *' to parameter of type 'struct static_key *'
Message-ID: <202608181709.ruVYmi71-lkp@intel.com>
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
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260818/202608181709.ruVYmi71-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181709.ruVYmi71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181709.ruVYmi71-lkp@intel.com/

Note: the jimc/folio-pool-v2-lockdep HEAD e77ee8289ea0755b0ee299348504d4568f942d71 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/bpf/verifier.c:19799:27: error: incompatible pointer types passing 'struct static_key_true *' to parameter of type 'struct static_key *' [-Wincompatible-pointer-types]
    19799 |                             get_order(SZ_64K), &bpf_state_pool_key);
          |                                                ^~~~~~~~~~~~~~~~~~~
   include/linux/folio_pool.h:240:24: note: passing argument to parameter 'key' here
     240 |                          struct static_key *key);
         |                                             ^
   1 error generated.


vim +19799 kernel/bpf/verifier.c

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
