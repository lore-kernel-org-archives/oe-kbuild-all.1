Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66FB2FD7BD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 23:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758671289; cv=none; b=dgvcCYed2MXxXoj1GLBGnwdOrEI+sOU58qxGZ4YfMhgPFZgTXZzUt1OFNvkfanRAjbO4dGfHOR3U2oKgrp6BaHOJbZRJz7XwDZ1eBGFOGBKc5VA5x8RS8hxDaJCDpjPw+S2WvpGWX+vhc9i9c0jX1zZHwLwsQoBSKHTS2RiKCCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758671289; c=relaxed/simple;
	bh=tthjTngH2lOZK42i99a/4vROPgFbnCxECyGPNdU0JtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Up2KWJ3khivVoTNYuHcP1Cx9C0WgP+qXprUUwxB+g8bVZki13it/0DROecW0mALGBMfSwFBa/usnuwBQTkPnZM16HqsZeqHa+Cvm9QUHGKUq+BEKl4nYMDdpyEiRFIQhOfQXZHcnrZSQAh55azkVdS76hGtyBXRxDmUwRyxw0OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbuYSfMz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbuYSfMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758671288; x=1790207288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tthjTngH2lOZK42i99a/4vROPgFbnCxECyGPNdU0JtM=;
  b=nbuYSfMz4uD50u4A5fDjah8Iow6yTFD/K4qdbi9io0O+DPfmtZxncBi2
   3TzzhNXF6+iZDxBhJd4Vn9t1Vfqw6m14opJTym2QNQB5ian+XFHu7RzkP
   so/EZSWnkxbR7VRxOH8Yq52LYosddAPW3MdRebJae286EBWFBRUzbSHji
   wqmuAzSpY8JsRkfO19ozCEXAy8qx2A4s6rnZMTzSHgWXYUge1adhw+hX5
   f/uTFgVjcWQe33zrIL1MNHdziiU3fwFgBghi6gMviLcjO6opu8Vx1k0X6
   L5RPglfKlpFq4U0WzBxwr+InOdvE3BjCTUExHnlEk5MVeYaebf9WXitOP
   w==;
X-CSE-ConnectionGUID: XxKdhpZeQ+CtWykmcB+g1A==
X-CSE-MsgGUID: lgFhtFz2SWGKjB4UZcljTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60902151"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60902151"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 16:48:06 -0700
X-CSE-ConnectionGUID: gH/dOxDMRWOLoXCn4dtnmw==
X-CSE-MsgGUID: 8sDYa+SdQe+H3XmXKdUzNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="181195439"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2025 16:48:05 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Cjq-0003dj-1J;
	Tue, 23 Sep 2025 23:48:02 +0000
Date: Wed, 24 Sep 2025 07:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 422/428]
 fs/bcachefs/nocow_locking.c:151:17: error: implicit declaration of function
 'prefetch'
Message-ID: <202509240901.kdCdh6kU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   4a4522cfaa2600cbc36417bf4849577d0d2688d1
commit: 6bf2f6900b994320da9241180eddf59840071ff2 [422/428] bcachefs: Avoid nocow locking deadlocks
config: csky-randconfig-002-20250924 (https://download.01.org/0day-ci/archive/20250924/202509240901.kdCdh6kU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240901.kdCdh6kU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240901.kdCdh6kU-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/nocow_locking.c: In function 'bch2_bkey_nocow_lock':
>> fs/bcachefs/nocow_locking.c:151:17: error: implicit declaration of function 'prefetch' [-Wimplicit-function-declaration]
     151 |                 prefetch(l);
         |                 ^~~~~~~~


vim +/prefetch +151 fs/bcachefs/nocow_locking.c

   137	
   138	void bch2_bkey_nocow_lock(struct bch_fs *c, struct bkey_ptrs_c ptrs, int flags)
   139	{
   140		if (bch2_bkey_nocow_trylock(c, ptrs, flags))
   141			return;
   142	
   143		DARRAY_PREALLOCATED(struct bucket_to_lock, 3) buckets;
   144		darray_init(&buckets);
   145	
   146		bkey_for_each_ptr(ptrs, ptr) {
   147			struct bch_dev *ca = bch2_dev_have_ref(c, ptr->dev);
   148			u64 b = bucket_to_u64(PTR_BUCKET_POS(ca, ptr));
   149			struct nocow_lock_bucket *l =
   150				bucket_nocow_lock(&c->nocow_locks, b);
 > 151			prefetch(l);
   152	
   153			/* XXX allocating memory with btree locks held - rare */
   154			darray_push_gfp(&buckets, ((struct bucket_to_lock) { .b = b, .l = l, }),
   155					GFP_KERNEL|__GFP_NOFAIL);
   156		}
   157	
   158		bubble_sort(buckets.data, buckets.nr, bucket_to_lock_cmp);
   159	retake_all:
   160		darray_for_each(buckets, i) {
   161			int ret = __bch2_bucket_nocow_trylock(c, i->l, i->b, flags);
   162			if (!ret)
   163				continue;
   164	
   165			u64 start_time = local_clock();
   166	
   167			if (ret == -BCH_ERR_nocow_trylock_contended)
   168				__closure_wait_event(&i->l->wait,
   169						(ret = __bch2_bucket_nocow_trylock(c, i->l, i->b, flags)) != -BCH_ERR_nocow_trylock_contended);
   170			if (!ret) {
   171				bch2_time_stats_update(&c->times[BCH_TIME_nocow_lock_contended], start_time);
   172				continue;
   173			}
   174	
   175			BUG_ON(ret != -BCH_ERR_nocow_trylock_bucket_full);
   176	
   177			darray_for_each(buckets, i2) {
   178				if (i2 == i)
   179					break;
   180				__bch2_bucket_nocow_unlock(&c->nocow_locks, i2->b, flags);
   181			}
   182	
   183			__closure_wait_event(&i->l->wait, nocow_bucket_empty(i->l));
   184			bch2_time_stats_update(&c->times[BCH_TIME_nocow_lock_contended], start_time);
   185			goto retake_all;
   186		}
   187	
   188		darray_exit(&buckets);
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
