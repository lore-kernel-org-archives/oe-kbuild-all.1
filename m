Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018571A08BC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 17:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501838; cv=none; b=FhNR/YINgvafl+CeB2AvX+5TSgptMxMO/qMh2hKipA1yD/138Iftq5DqgHTtmkz8Ljcrm6Rr7rC8QCWSMBoHecnzswkCnMeIrIq1VVbSTH936LpblMbZXKw2yIORMG3604Oz6OzqcmX6GuiXDHP4g9yUI4QEHzS4ckUZd8CZN9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501838; c=relaxed/simple;
	bh=+VxdN8VHEFVZCTBsOZXmwNwdJSL5pu3tI0Rji5uS/rA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SNbd5L4QkiiD6QJnA1wyRpw+D9Ow5YqkqyJgoKs8kJL6JKFMNjkwIn0qkWwzmw2lHkf6a7EmeXoxCV+V8eKmBLHF82Si6zusriVUcrQCAHD+TOFSM5BLa5wFksfi2aLt0PJ8GnI4kWwGaM3VKa6MDXQiCkbjHvaGfLA3pjvt1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeLAYTa4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeLAYTa4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754501837; x=1786037837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+VxdN8VHEFVZCTBsOZXmwNwdJSL5pu3tI0Rji5uS/rA=;
  b=FeLAYTa4z8qE5YruPWRzWPLnP1dolHNlqcRW8ndMWcmoebyeT6H4LlnS
   1LKvFlA2fKkWr47L2LEipI81cclT74iMvNqKx8Q++TKL60tIZqj+xPwMx
   FyCBgzBt2jin3P3GvZK7E7dvATQALQqligU55aChK/6+IMFeoOE7G8oPG
   48Z932MvUL6BjWCqkdeXoE5dXFXWldOXDAmebKRVtcHXBHbW1Agoddglq
   +JOdvWl8uUlfj5sRIheRfWCdlU24Uc5EfYhrtbbafiAu6d0gWXaEQSYpb
   7ypsK3kU4+4CzjNz8cfUx6oAlekH27TpCBIbuvexDa4vkdqsVUbUs1I4J
   g==;
X-CSE-ConnectionGUID: DcoYOmCmTBqjRSfsmC35RQ==
X-CSE-MsgGUID: sCr5CpEYQsq4UtYnwOeSUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79376874"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="79376874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 10:37:16 -0700
X-CSE-ConnectionGUID: RftBkmfdRJi9xO2PZc4niQ==
X-CSE-MsgGUID: 5XDyDjz1Q62J6f44QVU5rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="169077069"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Aug 2025 10:37:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uji4e-0001wg-09;
	Wed, 06 Aug 2025 17:37:12 +0000
Date: Thu, 7 Aug 2025 01:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1753/1753] block/bio-integrity.c:41:6:
 warning: no previous prototype for function '__bio_integrity_free'
Message-ID: <202508070154.VYnxHXi4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chengguang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   464c0bf980f96a307759f809825ab0a3b59f8b70
commit: f9c4e7b09f7d51f9256fe51b9c40657cd7302530 [1753/1753] block: release bip in a right way in error path
config: x86_64-buildonly-randconfig-006-20250806 (https://download.01.org/0day-ci/archive/20250807/202508070154.VYnxHXi4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070154.VYnxHXi4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070154.VYnxHXi4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bio-integrity.c:41:6: warning: no previous prototype for function '__bio_integrity_free' [-Wmissing-prototypes]
      41 | void __bio_integrity_free(struct bio_set *bs, struct bio_integrity_payload *bip)
         |      ^
   block/bio-integrity.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | void __bio_integrity_free(struct bio_set *bs, struct bio_integrity_payload *bip)
         | ^
         | static 
   1 warning generated.


vim +/__bio_integrity_free +41 block/bio-integrity.c

    40	
  > 41	void __bio_integrity_free(struct bio_set *bs, struct bio_integrity_payload *bip)
    42	{
    43		if (bs && mempool_initialized(&bs->bio_integrity_pool)) {
    44			if (bip->bip_vec)
    45				bvec_free(&bs->bvec_integrity_pool, bip->bip_vec,
    46					  bip->bip_slab);
    47			mempool_free(bip, &bs->bio_integrity_pool);
    48		} else {
    49			kfree(bip);
    50		}
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
