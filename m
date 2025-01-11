Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0361494CC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 20:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736627165; cv=none; b=ktvp3y1vcVIXydzpNCCfIhtE9r0oHZUmxWS6JPeBsJPirUzD9oidieS6Ghg8tnxWKxxHbn5byobhmUCuwmBH13rSVXBH21+f54wCQMfaPaYLiZP1Sfi/nx570HaJy+sHoZjCLhWVjyf0EyQsGJ5XXqktlVaKsX7qWiCRPRp4aUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736627165; c=relaxed/simple;
	bh=uX/ZZt0Z5c3PrvnGT2vqWCr+st7jGgkv6hqxL577+p4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hBlfHmlsTQjas3jZi6r2HicucbaIzNs5291DFMWocOZaHnqMy+xgDj5nXnExKK3d/BzF+26OAvTOeOMrQKrwntTEhVXlE6c7tiGklCA7kYKBVQGiLqto2JmrDEolHOVtxGmVU2xVawsclb3PJeYuqcQHcjHR8Abz5K3tMhjKE/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3L3KLbG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3L3KLbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736627162; x=1768163162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uX/ZZt0Z5c3PrvnGT2vqWCr+st7jGgkv6hqxL577+p4=;
  b=Q3L3KLbGbEp1DPureadJF9YkFAz5bXUkh+frTUuo7Ryc1WYZrBRVPX+L
   K2zrLB1alR3UZVpFvj9amZHNCb3gFmNO5+GbhRkuiX8NPK+BRCMxgpcjl
   70JdBQSWgSp10xwnEtU6jR1h9s1MwZLtRrzcboD7/Uw67mcnoZjWgLL3/
   DVyTs70uldT0Dra7NZRG9IlcVRvBMNv6CVzWjC6u8ShYisizBgdQVQPDr
   pYmZHNgEGClQDsKhU+IYFFTrhbH81Qq8escBbcgRhiDV2PivEzV3ohPmJ
   XyWh6NiejsddPCMzeFOn+8efqfcpZwhSe7DpzZwU7VDiRhYVtyChQJRIq
   g==;
X-CSE-ConnectionGUID: AX97/UgNT6Oe+eaT+CLcrw==
X-CSE-MsgGUID: UH2/sCX4QxKF3qzuiU3qww==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36918040"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="36918040"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 12:26:02 -0800
X-CSE-ConnectionGUID: 34J3CqdfTB2Ponb7rpPayA==
X-CSE-MsgGUID: BUGwc1ncRa+sZSy9+FWgVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="109078665"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jan 2025 12:26:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWi3S-000LAx-0T;
	Sat, 11 Jan 2025 20:25:58 +0000
Date: Sun, 12 Jan 2025 04:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1402/1402] block/bio-integrity.c:41:6:
 warning: no previous prototype for function '__bio_integrity_free'
Message-ID: <202501120402.JKRrtYy6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   97f98c391a1fd153ae010a2faf73f9e03270da6e
commit: f9c4e7b09f7d51f9256fe51b9c40657cd7302530 [1402/1402] block: release bip in a right way in error path
config: x86_64-buildonly-randconfig-004-20250109 (https://download.01.org/0day-ci/archive/20250112/202501120402.JKRrtYy6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120402.JKRrtYy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120402.JKRrtYy6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/bio-integrity.c:23:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> block/bio-integrity.c:41:6: warning: no previous prototype for function '__bio_integrity_free' [-Wmissing-prototypes]
      41 | void __bio_integrity_free(struct bio_set *bs, struct bio_integrity_payload *bip)
         |      ^
   block/bio-integrity.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      41 | void __bio_integrity_free(struct bio_set *bs, struct bio_integrity_payload *bip)
         | ^
         | static 
   2 warnings generated.
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
