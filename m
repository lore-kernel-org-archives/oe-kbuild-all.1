Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794634827;
	b=GzPIAlmNzC6g/DE4wz2gBHsSOZtVr3xu2mBRwMm6Q9bXFkg1QwSZbOS3fdvnTPSSqVON
	 je7B2hjrppjLyxrVJF72PiZ/JPOo0lownF+QgEcWJTargz49sAex3K4J7XUUfgy4c3K09
	 FV3XSCGdDRExEaZT89zRSBz7GldRqfLxmVQAbG8eqbutHXuIKX//R3E13qDIsdWpCCHse
	 2VB17pW21ZIE7ebE+dUCxXSVe5Gg+xd8SPrzkX+yHm6uGlmrO+BLNz1QI/4uBbAi96b16
	 g1hJ50m4cerE3oI0/olAV2dW+2cjKdcNXm/a3HXu5OTnJ420SuCG/0SMbwvwAQwIEKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794634827;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SeNeb6oYj5oGoonb9MGZ+Sk4LsaSO6fMvFrmMttvsDI=;
	b=sMqZ8WtBjYmLzRWXPYFIMQVFjpCarocJXv69FlmPDZyGD4TSqn58exL/WBshG9yxoKZ6
	 oTPXFgwfvKkgK8Nw0ZzU9QYwOkmEf9r8zRbkdvH951UhB0NUGDy5nk/BpXJ0IsaWJSuxh
	 JZ09PDkqfSr+nuFXDXXKTDcER1SPBd9TxyRWbs8IEPx5FkJI2fRkSfEAusJ+MTjt3+x48
	 qo7r8UHmuWsvHQYwp5Y6Z071cHl2As4+L7Pd/RJJZZni/FWuGb+VXAea74kMUScpIIGfB
	 WvTSmpUTK0aw3RBkQMAE5R1wKJkWl5Em7HwLAiqa24UgE1UgMZ5CkaCn0CG4Aj4ilGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bIQqjm3c;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2205B606A327
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 05:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2205B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bIQqjm3c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794634827; x=1826170827;
  h=date:from:to:cc:subject:message-id;
  bh=1+VA0oZJ1MlbOFl4iLs3s1djNxwsEg4Q5pEcdAPQXjE=;
  b=bIQqjm3cwmJSKVjGLEbs5zxBYzqSaFEtptgX2JY5LJUEXZlDOSiAOTKZ
   RFi0P8nzTsKwKByjst9jvvi9Hz4Wzif4lY1u5jBRRCj9wJAB6o0IVpA4O
   Wp0RUH/oO+FOpSXlQCSucx/pxb3VXCgNs2kDkIRogvCKfWfI9bXMJSuZB
   xxGpAKL6NmzQG6I8h2YeJk0GeJu2CZq7wLAe3Ttd/8IcVYL63EwwSeQWd
   hiWtxCyZestEO9bwxChjUC4Rj43OqiXv5xjCTJh0j6+R+vGWuNn0e6GfY
   4VRc5VkWTFaWcxwjifXNawwI6Z9Ue3roFsVHTaNXZ0y4KOuYOlR5HNaL0
   w==;
X-CSE-ConnectionGUID: sSjDlUPeSJuU6HZ3RYzFBw==
X-CSE-MsgGUID: R7Be4je8SEq0D/H1Bh9hFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3459371"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3459371"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 21:40:26 -0800
X-CSE-ConnectionGUID: lVXOwViyQz+fLSC4PVUVvA==
X-CSE-MsgGUID: thfTVkHGQ16oM7CYech6BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="10872587"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 13 Nov 2026 21:40:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS6Uw-000000001Up-42Uh;
	Sat, 14 Nov 2026 05:40:22 +0000
Date: Sat, 14 Nov 2026 06:39:48 +0100
From: kernel test robot <lkp@intel.com>
To: Ilya Dryomov <idryomov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, ceph-devel@vger.kernel.org
Subject: [ceph-client:wip-linger-ping-lat 7/7]
 net/ceph/debugfs.c:269:42: warning: unsequenced accesses to volatile
 qualified 'jiffies'
Message-ID: <202611140615.C6i3Z4Ih-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/ceph/ceph-client.git wip-linger-ping-lat
head:   1428966bcb1a1e537f406812f7d91f81a127431a
commit: 1428966bcb1a1e537f406812f7d91f81a127431a [7/7] libceph: include current latency in debugfs osdc dump
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20261114/202611140615.C6i3Z4Ih-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140615.C6i3Z4Ih-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140615.C6i3Z4Ih-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ceph/debugfs.c:269:42: warning: unsequenced accesses to volatile qualified 'jiffies' [-Wunsequenced]
     267 |                    req ? jiffies_to_msecs(jiffies - req->r_start_stamp) : 0,
         |                                           ~~~~~~~
     268 |                    lreq->is_watch && lreq->committed && !lreq->last_error ?
     269 |                         jiffies_to_msecs(jiffies - lreq->watch_valid_thru) : 0,
         |                                          ^
   1 warning generated.


vim +/jiffies +269 net/ceph/debugfs.c

   255	
   256	static void dump_linger_request(struct seq_file *s,
   257					struct ceph_osd_linger_request *lreq)
   258	{
   259		struct ceph_osd_request *req =
   260		    list_first_entry_or_null(&lreq->osd_reqs, struct ceph_osd_request,
   261					     r_private_item);
   262	
   263		seq_printf(s, "%llu\t", lreq->linger_id);
   264		dump_target(s, &lreq->t);
   265	
   266		seq_printf(s, "\t%u\t%u\t%u\t%s%s/%d\n", lreq->register_gen,
   267			   req ? jiffies_to_msecs(jiffies - req->r_start_stamp) : 0,
   268			   lreq->is_watch && lreq->committed && !lreq->last_error ?
 > 269	                        jiffies_to_msecs(jiffies - lreq->watch_valid_thru) : 0,
   270			   lreq->is_watch ? "W" : "N", lreq->committed ? "C" : "",
   271			   lreq->last_error);
   272	}
   273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
