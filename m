Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16BF1DA4E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459578; cv=none; b=g1hxkYZllNPmtyEYOI47x1vHi5JAuMVPzM51rjrkPSCBx/dzStvmTOQP7f9AVxulrYouCtBcz2UHeaZfhDdMFbepOZ72eCOaQLfi8kLOS2Dw8Jke3VSzjE9ogbIWCb8l8k224P8AtqEGjFNVlR6nLIDMW2pPUrRf4IkguJTpCME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459578; c=relaxed/simple;
	bh=gLpippVETh2ZzoIiTsz8kbBuxHZruQa7IJTMf3nInIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hMnFRH4DpxQXxbxszZTMpACaJHNs5yemxmUe6xr4LC+5MECmsRzMmv26ypOttjzgYv4S9rjl8lmaND3KgrkhBdi0VeKLYhIrQEZIgYC/Wc+JPv+yONrwSpRthnaTEQs2EPZeiY/qiQvOI+rIsPS9bL2mvWIr0jrILxJ7RbsNyC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1Svq9MG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1Svq9MG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751459576; x=1782995576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gLpippVETh2ZzoIiTsz8kbBuxHZruQa7IJTMf3nInIU=;
  b=l1Svq9MGPPp3rGNSxNwHbgZ7/36ZLt5d95nyVUdaW74WTdR38L7pJD8P
   +SYzBdpDR7oQwt25iizvHtw1Gh03+9juWuSWQpvnO6SL+nv9YlLi+0yKC
   KBxoECM+nvx4mhyVXk6SdiOTAHrzf/4yeYnh6p3SLsVlzJPRz+++LGBs3
   de+QuG3ch5gNZee/Jr/y5gMqmo1U/vWdqjbhTluzFe+0XiBOkdl6aLiBv
   /Hi74lcUPuZKHHUiaMABz7p4jrGijqtuxCLtZitOYEKcJu2sbf8GJEjVA
   YqQHEc+S+QGkONSCC8J0MKLQij/MmtLCNZzi1FRF3KT75u41KhMF5AQSQ
   w==;
X-CSE-ConnectionGUID: DsTqf/CpQsKRc29ja5VwmA==
X-CSE-MsgGUID: fAYvgwNdTH+LNTUJlUB6rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53860815"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53860815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:32:56 -0700
X-CSE-ConnectionGUID: DKtfNKy3Q2a7knWINI9rGg==
X-CSE-MsgGUID: fp3d9S8aTEqwZQic7dL2kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="191232142"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 02 Jul 2025 05:32:54 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWwdw-0000Hh-0x;
	Wed, 02 Jul 2025 12:32:52 +0000
Date: Wed, 2 Jul 2025 14:32:16 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] block/bio-integrity.c:41:6:
 warning: no previous prototype for function '__bio_integrity_free'
Message-ID: <202507021458.HwvZj3Sk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: f9c4e7b09f7d51f9256fe51b9c40657cd7302530 [1605/1605] block: release bip in a right way in error path
config: x86_64-buildonly-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507021458.HwvZj3Sk-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021458.HwvZj3Sk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021458.HwvZj3Sk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bio-integrity.c:41:6: warning: no previous prototype for function '__bio_integrity_free' [-Wmissing-prototypes]
      41 | void __bio_integrity_free(struct bio_set *bs, struct bio_integrity_payload *bip)
         |      ^
   block/bio-integrity.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | void __bio_integrity_free(struct bio_set *bs, struct bio_integrity_payload *bip)
         | ^
         | static 
   1 warning generated.
   block/bio-integrity.o: warning: objtool: missing symbol for section .init.text


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
