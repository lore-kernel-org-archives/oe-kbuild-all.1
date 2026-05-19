Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9CF29D268
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 03:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779162396; cv=none; b=M5EnJmvkUsHTf1NzNkOwlr97srywo+CgBQZVB/B+SlNZOd6sV25uL+hQFuhD7MfKq6EIgPubCDPyQYZhVEJfCHhVQg7UqvS9H+DNFNaEW56lZM+p7QUISM57C6HTS+h7oBx03ioS9RLdPGMtSDw0dwi/P1Amktgz38PJ+JJ6xEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779162396; c=relaxed/simple;
	bh=xX4u2dqjBXgdmbul3nPAEdVsiK1fLq6oXXKJ0D7tHtw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XR8cnk55IDF1Er7iJVGzKuRyzPAk4u9Tv7GnVShkpYwwVEeKNsxVPvwq+A3eg5qE7tsoekq3hSf8e2nbXjHINLokQjmknumxjo695HBsPgTi3gNHoCxW4wKgRGo83dEJg5IlfYR5SSRVib6YXfooyhg34b9pXGm+eROTvdUkHa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xm8cglnF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xm8cglnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779162394; x=1810698394;
  h=date:from:to:cc:subject:message-id;
  bh=xX4u2dqjBXgdmbul3nPAEdVsiK1fLq6oXXKJ0D7tHtw=;
  b=Xm8cglnFu4AMA9Mw7e9lpVwhteMy+yfFcjSkBz4uNFlKwx5IOFDhJaLN
   I/7jDEiyVngQoR6kG5e0F7oyYAvRkIMzND1Xy016Wit0tRSTgUrFr0JL2
   6mWCrmi8oV+/GNtS3Kyl0lUvVWrLoLT0NWIRmXOP+WlJISaQvsWr2hRm9
   0h24mgdgmnhCw8vSQEbA5tYWhovuY/gD6Gm5H6EpgiH7q8PHbTdVN/NGw
   L+u0AEjDBIQ/XokaHfiE+YCCodupVoDoNANAB1tG83ElVk5MdUzKHllrb
   alek0cx4J8pa7HlMUOijfUG4pGFByoerWzeTdp6suHpDB3qvrS55QZ/mT
   w==;
X-CSE-ConnectionGUID: h6vF7GLcT76P8mdo4Y2Y3Q==
X-CSE-MsgGUID: /Jfk3k5zQy+h64xfC+Kakw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90610512"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90610512"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 20:46:33 -0700
X-CSE-ConnectionGUID: b1OQbWc2Sm+SmeRY4eTA+g==
X-CSE-MsgGUID: PzZEbr/WSWuRbmxw79P6EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239699209"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2026 20:46:32 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPBPZ-000000000No-1ssk;
	Tue, 19 May 2026 03:46:29 +0000
Date: Tue, 19 May 2026 11:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 31/238]
 drivers/crypto/omap-crypto.c:203:13: warning: variable 'pages' set but not
 used
Message-ID: <202605191114.jmlkNqPP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 5f08b1335289414f3cc968309c42569264ac33e7 [31/238] crypto: replace __get_free_pages() with kmalloc()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260519/202605191114.jmlkNqPP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191114.jmlkNqPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191114.jmlkNqPP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/omap-crypto.c: In function 'omap_crypto_cleanup':
>> drivers/crypto/omap-crypto.c:203:13: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
     203 |         int pages;
         |             ^~~~~


vim +/pages +203 drivers/crypto/omap-crypto.c

839bb2a9ca73a9 Tero Kristo               2019-11-05  197  
74ed87e7e7f719 Tero Kristo               2017-05-24  198  void omap_crypto_cleanup(struct scatterlist *sg, struct scatterlist *orig,
74ed87e7e7f719 Tero Kristo               2017-05-24  199  			 int offset, int len, u8 flags_shift,
74ed87e7e7f719 Tero Kristo               2017-05-24  200  			 unsigned long flags)
74ed87e7e7f719 Tero Kristo               2017-05-24  201  {
74ed87e7e7f719 Tero Kristo               2017-05-24  202  	void *buf;
74ed87e7e7f719 Tero Kristo               2017-05-24 @203  	int pages;
74ed87e7e7f719 Tero Kristo               2017-05-24  204  
74ed87e7e7f719 Tero Kristo               2017-05-24  205  	flags >>= flags_shift;
74ed87e7e7f719 Tero Kristo               2017-05-24  206  	flags &= OMAP_CRYPTO_COPY_MASK;
74ed87e7e7f719 Tero Kristo               2017-05-24  207  
74ed87e7e7f719 Tero Kristo               2017-05-24  208  	if (!flags)
74ed87e7e7f719 Tero Kristo               2017-05-24  209  		return;
74ed87e7e7f719 Tero Kristo               2017-05-24  210  
74ed87e7e7f719 Tero Kristo               2017-05-24  211  	buf = sg_virt(sg);
74ed87e7e7f719 Tero Kristo               2017-05-24  212  	pages = get_order(len);
74ed87e7e7f719 Tero Kristo               2017-05-24  213  
ffe3ee8bb68aa6 Ben Hutchings             2021-08-11  214  	if (orig && (flags & OMAP_CRYPTO_DATA_COPIED))
839bb2a9ca73a9 Tero Kristo               2019-11-05  215  		omap_crypto_copy_data(sg, orig, offset, len);
74ed87e7e7f719 Tero Kristo               2017-05-24  216  
74ed87e7e7f719 Tero Kristo               2017-05-24  217  	if (flags & OMAP_CRYPTO_DATA_COPIED)
5f08b133528941 Mike Rapoport (Microsoft  2026-02-10  218) 		kfree((void *)(unsigned long)buf);
74ed87e7e7f719 Tero Kristo               2017-05-24  219  	else if (flags & OMAP_CRYPTO_SG_COPIED)
74ed87e7e7f719 Tero Kristo               2017-05-24  220  		kfree(sg);
74ed87e7e7f719 Tero Kristo               2017-05-24  221  }
74ed87e7e7f719 Tero Kristo               2017-05-24  222  EXPORT_SYMBOL_GPL(omap_crypto_cleanup);
74ed87e7e7f719 Tero Kristo               2017-05-24  223  

:::::: The code at line 203 was first introduced by commit
:::::: 74ed87e7e7f7197137164738dd0610ccd5ec5ed1 crypto: omap - add base support library for common routines

:::::: TO: Tero Kristo <t-kristo@ti.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
