Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1E93FBA7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 02:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745546602; cv=none; b=fYDfcaMOHuZi0rYOBSs5pOFn0jUIlLTgJ0O+6ecPOYVozhhG0eEM7gf9EGUy4oGzL742ffoxUJG2RkUhXVEXP6Ywp4VM/O2TuqX3wAL4AD2+t51Y180U9wzyfVKWdN1KFVQtv7rHqeJh04ylRssVlRKH6GGG+XLG+PZwhc53Nj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745546602; c=relaxed/simple;
	bh=t1jEBUtKnqaCuB2uqdNvSe/Hsf3PCCLigHTm9DC/NJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HlQySnvcRuiTRKJ/sMhp7RswiRzrmXvq+9RcGpE8kB64cQe70aiFdDRVue7wMMU9z/Ejs4HlD/hzY+OSJTGkOuyuIiihBxmg/qDG5+E8SHme3T7OvqVEtGaAHlCX+t7wy2TSYLlOmNIZjblaooCpjHOX5bthSuyozhVea7fZyWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cogdKCO3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cogdKCO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745546600; x=1777082600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t1jEBUtKnqaCuB2uqdNvSe/Hsf3PCCLigHTm9DC/NJ4=;
  b=cogdKCO3891xT3Bozf0qs/YNaQy5XeKAyvXYrB/+DiL9m+mSKUvSTiK+
   zHvFy4SuSlerb+En+Z8eiSsAFBpLEKkiV4EC9/mVXo05SECmlKxrANlUk
   sQlyYEIVZwbGPHEar8wIZOMoknRSpO4dpO9+H4NN4w41xChZR2Vp2r2aQ
   a/nFHNH8Uu86oTNjvTgKSvNJJ2UuGNcUhyEAnfM/9s07ZSDj00wdCHvus
   T2XepoWbZN8nOxvoie3SXLzoSOn7YY9Gu3w1gFC6jFA9PCajk16fR5NNx
   FKcErm12a7KRLiIiq5JldQ00DkXWGsxw71AeskP20ygUBPIoP6PKbFOSH
   g==;
X-CSE-ConnectionGUID: PfZVI15ySVaE4yhLvubDBA==
X-CSE-MsgGUID: SHhrDqMSSBGxJ1glTw589g==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57848633"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="57848633"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 19:03:18 -0700
X-CSE-ConnectionGUID: aEOoQLNYSzmiqAkWbPYmEw==
X-CSE-MsgGUID: frUc+zsiRUm/H+DVWrF9iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="137939718"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Apr 2025 19:03:16 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u88PK-0004jB-0H;
	Fri, 25 Apr 2025 02:03:14 +0000
Date: Fri, 25 Apr 2025 10:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1593/1593] block/bio-integrity.c:41:6:
 warning: no previous prototype for '__bio_integrity_free'
Message-ID: <202504250942.HWyvS6HD-lkp@intel.com>
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
head:   08111f03f1ec65598372cfe9bf64f366d575671e
commit: f9c4e7b09f7d51f9256fe51b9c40657cd7302530 [1593/1593] block: release bip in a right way in error path
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250425/202504250942.HWyvS6HD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250942.HWyvS6HD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250942.HWyvS6HD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bio-integrity.c:41:6: warning: no previous prototype for '__bio_integrity_free' [-Wmissing-prototypes]
      41 | void __bio_integrity_free(struct bio_set *bs, struct bio_integrity_payload *bip)
         |      ^~~~~~~~~~~~~~~~~~~~


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
