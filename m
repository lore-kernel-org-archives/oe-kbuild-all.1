Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16721326945
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140598; cv=none; b=dMKjWVIH54m/k8VrmdO8Kbxvl0rz4n6XNVPlSBxJ09g2EN3+WBET72ORfoSiSKFROPwWNtzA00x1D3eObE5TtwHg2hKwCC+VlGmGYBAZNHP9sK2e4xW9XHIeoDE5qeFQjYI7F04LcxoT47kv24ZcwZBG25GCRNqMQ4J2nEQUjk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140598; c=relaxed/simple;
	bh=sdNxe5b2LFEB0h1KncYXlPpn8el1NWzwszh7QsL8awk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rwGl5QIdGzjWBMTtwaMVBKemeEPD2UumpPuVCh59g1/9jcCSzoRH0Oq4mVv7wrWhhJXTQ2DgP4TdZ+dSBVjT4gbmCu9iOHBoDOIE5l+S1X1k4OnOsP8pu1xOVNBW9pe1bM/OgeOvNpWfQO+tKnbKMTKQaQKvZnSptLrtN8VlL5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZnaeiOk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZnaeiOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782140597; x=1813676597;
  h=date:from:to:cc:subject:message-id;
  bh=sdNxe5b2LFEB0h1KncYXlPpn8el1NWzwszh7QsL8awk=;
  b=aZnaeiOkov5OFo+O4nd6jSrCOeVVUPl5tLSSKISrPqdcA+H7oyYquVHV
   UNcQLlt2UJYlAb2/exJVTc/cRcca1d/zJia0RHpH6jKYgxG5HHWNfV9kQ
   IEqOEhg6xQG8Y8Kh9lBv/IuO+KV6RbRrqCRwUO6W+HSQCCngCf63o4IiT
   5jQiRHAt85wD50RMinmYaa9QyZ3Umo0KaCIj+fN1fVDh8sqLo9zxVT8DW
   bsUJ6TIspwzuJqxdJoS8IWIOJsKm+/ANvm6SsWjojVpytnf7hdSpcSaBT
   PWHItkE81Fr31kaAw2J0di7kQ2wmCNrSGjj0e8fxrtO9oSw7Top3yFPxy
   Q==;
X-CSE-ConnectionGUID: fJjCIBbpQTG+2pDeTALuTg==
X-CSE-MsgGUID: k5bh5ElmTAK9usYhZjfk4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100423098"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="100423098"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 08:03:16 -0700
X-CSE-ConnectionGUID: OVdikcVeTzmug3Gs5ymDXQ==
X-CSE-MsgGUID: McGRo8DmSRG9yDXLthXBSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249105242"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Jun 2026 08:03:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbgB6-000000001Lr-05PS;
	Mon, 22 Jun 2026 15:03:12 +0000
Date: Mon, 22 Jun 2026 23:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@kernel.org>
Subject: block/blk-crypto-fallback.c:154:17: sparse: sparse: cast to
 restricted blk_status_t
Message-ID: <202606222211.Xt0AGJNd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: b37fbce460ad60b0c4449c1c7566cf24f3016713 blk-crypto: optimize bio splitting in blk_crypto_fallback_encrypt_bio
date:   5 months ago
config: powerpc-randconfig-r131-20260622 (https://download.01.org/0day-ci/archive/20260622/202606222211.Xt0AGJNd-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222211.Xt0AGJNd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b37fbce460ad ("blk-crypto: optimize bio splitting in blk_crypto_fallback_encrypt_bio")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222211.Xt0AGJNd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-crypto-fallback.c:154:17: sparse: sparse: cast from restricted blk_status_t
   block/blk-crypto-fallback.c:154:17: sparse: sparse: cast from restricted blk_status_t
>> block/blk-crypto-fallback.c:154:17: sparse: sparse: cast to restricted blk_status_t

vim +154 block/blk-crypto-fallback.c

   143	
   144	static void blk_crypto_fallback_encrypt_endio(struct bio *enc_bio)
   145	{
   146		struct bio *src_bio = enc_bio->bi_private;
   147		int i;
   148	
   149		for (i = 0; i < enc_bio->bi_vcnt; i++)
   150			mempool_free(enc_bio->bi_io_vec[i].bv_page,
   151				     blk_crypto_bounce_page_pool);
   152	
   153		if (enc_bio->bi_status)
 > 154			cmpxchg(&src_bio->bi_status, 0, enc_bio->bi_status);
   155	
   156		bio_put(enc_bio);
   157		bio_endio(src_bio);
   158	}
   159	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
