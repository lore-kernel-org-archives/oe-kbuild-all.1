Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE5B189B8C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 04:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740804772; cv=none; b=NfQI4qsg8LLWu7DWrIBhVxBO4I2X0sI3msqNY3BN+67llmYayaMWWLbbV3mlOCJSdyX8kcSBxrtvLVO0Gp9Cl+gBLwogOGeBnMNO7ZuJW2Mck29g8op3l/YlV19JkR6oOkR3ttkfSLBnrjxRVh6GbCqxYr2yjLP3tAUL3zPC1bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740804772; c=relaxed/simple;
	bh=eFHjBgnwQCvyaFXeXyiSbQmZCeh+lRv+z8cUFtw6owg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TtRM+PHVGmYWuhRW22U+7kBs3ZKbekHYPYhnTXsY84u1uh0URM05JpmwfzxgYWau1PlOpoHNk/zh4LQ5uioUfh7C9Z7WE0IFAVa8P8fYk3RdKqjvZipupmvaylqkPOMipN9yB7IuVB5qGEQXLun7E0B0Hn3V0mMTThwbpV+mn30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVuh3nXf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVuh3nXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740804770; x=1772340770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFHjBgnwQCvyaFXeXyiSbQmZCeh+lRv+z8cUFtw6owg=;
  b=hVuh3nXfwUQfWCiC1Angoe769z7uQ0ZWfbY6H2rlXSL5x2DaZ7Aioo6P
   81JeI/Aco6sbzbZf/Wa16x6zxdbHmy1eqnj3SakYrBO2E0P3QUOwQgEQl
   d5OfRC4m1X2P2HW0OOYfadPo0/Am7z5zpveg51nlLfaj4UTDr3DtWxLd7
   uw7q333CiuDzAG2+GXxmJ5MLrgmT5K4xUBawxAiHg56G9ORc/lpUk6+mN
   +cxI03WIUDTQF0F8+UklBXoH8HuXSjfQTU2mdUwlX50Ffy6u8HoDYNY3K
   MVdBWOBmvp5QGiK0d7SjGf8EVPnrZ/5SUK5kziBXY/IDxg6kgrkMuf3+v
   w==;
X-CSE-ConnectionGUID: PXIL+wn8Si2Qga+R1eU7OA==
X-CSE-MsgGUID: stqUyLzqQnGmDmN+LAWiog==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="64199859"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="64199859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 20:52:49 -0800
X-CSE-ConnectionGUID: +a0kcD4KTEKlLXVQ0I3klw==
X-CSE-MsgGUID: PsgdBYcEQpGTeJDVkW1RAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; 
   d="scan'208";a="140745975"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Feb 2025 20:52:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toEqE-000Fsi-1d;
	Sat, 01 Mar 2025 04:52:46 +0000
Date: Sat, 1 Mar 2025 12:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:futex/scope 17/18] kernel/futex/core.c:313:16: error:
 implicit declaration of function '__futex_hash'; did you mean 'futex_hash'?
Message-ID: <202503011211.gseC0XuK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git futex/scope
head:   50063817f6e71b787d3ba96cca9d2fff7b3ea7ff
commit: 07c5880a60a9773964daf0341bb41604efa8cf49 [17/18] futex: Untangle and naming
config: arm-randconfig-001-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011211.gseC0XuK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503011211.gseC0XuK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503011211.gseC0XuK-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/futex/core.c: In function 'futex_hash':
>> kernel/futex/core.c:313:16: error: implicit declaration of function '__futex_hash'; did you mean 'futex_hash'? [-Wimplicit-function-declaration]
     313 |         return __futex_hash(key, NULL);
         |                ^~~~~~~~~~~~
         |                futex_hash
>> kernel/futex/core.c:313:16: error: returning 'int' from a function with return type 'struct futex_hash_bucket *' makes pointer from integer without a cast [-Wint-conversion]
     313 |         return __futex_hash(key, NULL);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/futex/core.c: At top level:
>> kernel/futex/core.c:327:1: error: conflicting types for '__futex_hash'; have 'struct futex_hash_bucket *(union futex_key *, struct futex_private_hash *)'
     327 | __futex_hash(union futex_key *key, struct futex_private_hash *fph)
         | ^~~~~~~~~~~~
   kernel/futex/core.c:313:16: note: previous implicit declaration of '__futex_hash' with type 'int()'
     313 |         return __futex_hash(key, NULL);
         |                ^~~~~~~~~~~~
   kernel/futex/core.c:327:1: warning: '__futex_hash' defined but not used [-Wunused-function]
     327 | __futex_hash(union futex_key *key, struct futex_private_hash *fph)
         | ^~~~~~~~~~~~


vim +313 kernel/futex/core.c

   310	
   311	struct futex_hash_bucket *futex_hash(union futex_key *key)
   312	{
 > 313		return __futex_hash(key, NULL);
   314	}
   315	
   316	#endif /* CONFIG_BASE_SMALL */
   317	
   318	/**
   319	 * futex_hash - Return the hash bucket in the global hash
   320	 * @key:	Pointer to the futex key for which the hash is calculated
   321	 *
   322	 * We hash on the keys returned from get_futex_key (see below) and return the
   323	 * corresponding hash bucket in the global hash. If the FUTEX is private and
   324	 * a local hash table is privated then this one is used.
   325	 */
   326	static struct futex_hash_bucket *
 > 327	__futex_hash(union futex_key *key, struct futex_private_hash *fph)
   328	{
   329		struct futex_hash_bucket *hb;
   330		u32 hash;
   331	
   332		hb = __futex_hash_private(key, fph);
   333		if (hb)
   334			return hb;
   335	
   336		hash = jhash2((u32 *)key,
   337			      offsetof(typeof(*key), both.offset) / 4,
   338			      key->both.offset);
   339		return &futex_queues[hash & futex_hashmask];
   340	}
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
