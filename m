Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430684;
	b=w8zYNuCNXAkzECblBPSSsdj9l7sT0bVTiEJOkbQXYNCjjVF427mJQTMDgRrlgLqGV0y8
	 9tKbv0oNZMNXWS+dvV05bE24GTZy276+FfiOshcNuodbhAWtWgcJgLUl0Irx5c30zfrg9
	 OtKsDqbNlAxO1kKbwstRi6qeWmJxB+KX8MSV6FFftizfsjFq7Cln3ID44UlwoIl/ZI+uw
	 XlatjACbzBaLiAMwpZq8AqywPwLipwa4Zg2FFZwLfpxL5hWViRn9FvfUyub1Nv4GYFWjr
	 KaKy6SNchp4hsj1O6PzQXkh5iBc1nqfG+cJh3eboCoQ24a5n3YPX+guvdHn6GqFfvYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430684;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DvmQgqpcifPi2ihP2UeEMVhHvnA6vU0DhRsK/JYR2/Y=;
	b=5DVQBHyqh+mzHfeddOSHttPkCrRqbbGCgeKSM91kN890pTKsMnAyYBHbp49ebauQFpTk
	 i1sN4f05hvabNWTL6bwW2lARmuPLwHswUPQvkF0NQlVTzpMfHOV8ENfG7D3MTHmsIG2yD
	 9pzIQbr2+W/2nuQjx2A6KQlYKmtA1XqrdScDnkdyKAT8dW2h/oBGFXjHmWFsN0vKKWmTp
	 d1sOuwXaln7nhwNjGMGEwjmy/MS/PYV/0/d4AZrS13H06e186p1rwRnX0lzAVryhvrXkN
	 Z4rjgAIc8Y0trHimWKwjrSGoMUxGtW0F046nUWQmKlU1/hVHAITtZWxuNol1NBHOJfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dhsWWpyV;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115A0606A330
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 20:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 115A0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dhsWWpyV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794430682; x=1825966682;
  h=date:from:to:cc:subject:message-id;
  bh=HyExy1AaEi0kP077pAONwBfqSAzOsSI+n8CdQaltjyM=;
  b=dhsWWpyViYoLD2JXSpoRZYZ6yQSA8GtsExuUXJnwVOgDgCEbDUWmS2QN
   lLabRMRs5tZ7PEixF2NEG/uH9azEIzgOL0C8EBDaO/T9ZePRyNuSHyClB
   CLx8688nqwhgbHheI37ZMPC7H9P2YCzvU30ppWlgLzIfewNK6k4yIraiI
   lwsbURsYuLeLIdxcwB+5XhAYhwycevq/R1iU86Nq476Nbgu/czec5vSNz
   n2FhqN6WUbAghsFYBMa1nLx+/xKCW3hSW53kq8qEIlwfb+fwsfY7KJv34
   iDShPlZSUVMiRdeDceZjr98BIwt9BIY1oaVtm7wwQ0jU+LIwzGosefd36
   A==;
X-CSE-ConnectionGUID: c8tA4P4ZTnSoacr4vqx+Aw==
X-CSE-MsgGUID: aeP03amzQ4C6cZrWHndNBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3205329"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3205329"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 12:58:02 -0800
X-CSE-ConnectionGUID: zAIKF5qTToSQFIdAvCZdLg==
X-CSE-MsgGUID: dvUqB/vuQlqLIdw7o2dTcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8934585"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2026 12:58:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRFOI-000000000ep-0TOF;
	Wed, 11 Nov 2026 20:57:58 +0000
Date: Wed, 11 Nov 2026 21:57:07 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-p3s 120/120]
 kernel/sched/fair.c:715 avg_vruntime() warn: inconsistent indenting
Message-ID: <202611112148.m4miUrmD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-p3s
head:   a0185ce3543f042a5f4d567e2b318314104ecac7
commit: 1eb5dc8d1c44e2bf7b36a101c62dad962d673a8b [120/120] UPSTREAM: sched/fair: Fix zero_vruntime tracking
config: arm64-randconfig-2200-20261110 (https://download.01.org/0day-ci/archive/20261111/202611112148.m4miUrmD-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 053b4a894ceaebc2eed76a7fa09f58cf7e313a69)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611112148.m4miUrmD-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:715 avg_vruntime() warn: inconsistent indenting
kernel/sched/fair.c:697 update_zero_vruntime() warn: inconsistent indenting

vim +715 kernel/sched/fair.c

   689	
   690	static inline
   691	void update_zero_vruntime(struct cfs_rq *cfs_rq, s64 delta)
   692	{
   693		/*
   694		 * v' = v + d ==> avg_vruntime' = avg_vruntime - d*avg_load
   695		 */
   696		cfs_rq->avg_vruntime -= cfs_rq->avg_load * delta;
 > 697	       cfs_rq->zero_vruntime += delta;
   698	}
   699	
   700	/*
   701	 * Specifically: avg_vruntime() + 0 must result in entity_eligible() := true
   702	 * For this to be so, the result of this function must have a left bias.
   703	 *
   704	 * Called in:
   705	 *  - place_entity()      -- before enqueue
   706	 *  - update_entity_lag() -- before dequeue
   707	 *  - entity_tick()
   708	 *
   709	 * This means it is one entry 'behind' but that puts it close enough to where
   710	 * the bound on entity_key() is at most two lag bounds.
   711	 */
   712	u64 avg_vruntime(struct cfs_rq *cfs_rq)
   713	{
   714		struct sched_entity *curr = cfs_rq->curr;
 > 715	       long weight = cfs_rq->avg_load;
   716	       s64 delta = 0;
   717	
   718	       if (curr && !curr->on_rq)
   719	               curr = NULL;
   720	
   721	       if (weight) {
   722	               s64 runtime = cfs_rq->avg_vruntime;
   723	
   724	               if (curr) {
   725	                       unsigned long w = scale_load_down(curr->load.weight);
   726	
   727	                       runtime += entity_key(cfs_rq, curr) * w;
   728	                       weight += w;
   729	               }
   730	
   731			/* sign flips effective floor / ceiling */
   732	               if (runtime < 0)
   733	                       runtime -= (weight - 1);
   734	
   735	               delta = div_s64(runtime, weight);
   736	       } else if (curr) {
   737	               /*
   738	                * When there is but one element, it is the average.
   739	                */
   740	               delta = curr->vruntime - cfs_rq->zero_vruntime;
   741		}
   742	
   743	       update_zero_vruntime(cfs_rq, delta);
   744	
   745	       return cfs_rq->zero_vruntime;
   746	}
   747	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
