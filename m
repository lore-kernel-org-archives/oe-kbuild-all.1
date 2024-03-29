Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC0A4086C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711696603; cv=none; b=i81hoJyYePqklJfIZI0qFPFn0Cg3DoJ0WFCT9STJVORWE0fzq3wJL07/riojqZBbT0kawhrkA8/zbGXxXBs+s6r86fLeOACSJmFDYaAY15LVsZzhCBAkVtEjq33WYZKugVSVWRTqhbN3v1z84ksvak7bdqneVJjioff4woUrx8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711696603; c=relaxed/simple;
	bh=pJQ3ujiu5+6egSjYkOAM9aaxWYfzFOmlok3duYHNOQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=niZt/Vqd4gU0dXsR6A9JrqsOwlZGAFzbBAPtuolfytymWaJEGV+4bJOgwRwaMYZJltIMtroJaQnv7OZIjOlmjdpAtJtsz0U17YkaA1+kBTyJm/sbwyqd4DkQ4hiTvfM6T1mdLGLu7cMhCZQKLb2tMMGBlsQDQhYC/s85xWb4g3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juLJMecy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juLJMecy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711696602; x=1743232602;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pJQ3ujiu5+6egSjYkOAM9aaxWYfzFOmlok3duYHNOQc=;
  b=juLJMecyKgQDF82BW8LqupWQLKVTlyNZGtk3orUt1U1ZrAPWgAqv93rq
   VpFAz4YpGPptbB+bgh9pqtU8i39MYMgi3UuyMNAkYcNrZEjKSGJ8QGMg+
   jMbfQd3wjjLLgQ8L5IyGFrqRLaJbKcQUPMsog868BUkmyRBvsgtgyQOUH
   eNoWasG0ca+C7R7QVPI/FTS007uqknu5uj80iB8fP7ImuD11jnPszcnEd
   zS8YjEStUYvDsX/OCoNB988LeGnuIq8JoQz/0z6CMzWlZb33B/NRqUfUl
   4ft0ipiQJcYLSkRv7Ldt+ZjIcXlVI4A85kcQ+wQMisoCMh3r37UUuPnrr
   A==;
X-CSE-ConnectionGUID: 7ZCVTs0WTjCnrJWDRVgjJw==
X-CSE-MsgGUID: qEyW3/xrTSi9l9UXTTmfaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6776611"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="6776611"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 00:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="16950076"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Mar 2024 00:16:40 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq6Td-0002wg-0W;
	Fri, 29 Mar 2024 07:16:37 +0000
Date: Fri, 29 Mar 2024 15:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:ddt-43 9/40] drivers/crypto/caam/caamalg.c:1489:9: sparse:
 sparse: Initializer entry defined twice
Message-ID: <202403291500.HwjDzFUh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/jimc/linux.git ddt-43
head:   d4987a1b1c82c472ec96062343af3ad72aaab3fd
commit: f51dae97cfef30ec06b75fd1e16f8a09031b985c [9/40] dyndbg: move flags field to a new structure
config: arm64-randconfig-r123-20240328 (https://download.01.org/0day-ci/archive/20240329/202403291500.HwjDzFUh-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 79ba323bdd0843275019e16b6e9b35133677c514)
reproduce: (https://download.01.org/0day-ci/archive/20240329/202403291500.HwjDzFUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291500.HwjDzFUh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/crypto/caam/caamalg.c: note: in included file:
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
>> drivers/crypto/caam/caamalg.c:1489:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/caamalg.c:1489:9: sparse:   also defined here
   drivers/crypto/caam/caamalg.c:1523:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/caamalg.c:1523:9: sparse:   also defined here
   drivers/crypto/caam/caamalg.c:1582:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/caamalg.c:1582:9: sparse:   also defined here
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/sg_sw_sec4.h:39:9: sparse:   also defined here
   drivers/crypto/caam/caamalg.c:1853:9: sparse: sparse: Initializer entry defined twice
   drivers/crypto/caam/caamalg.c:1853:9: sparse:   also defined here

vim +1489 drivers/crypto/caam/caamalg.c

1c24022667130e Iuliana Prodan 2020-02-12  1471  
b7f17fe281442d Iuliana Prodan 2020-02-12  1472  static inline int chachapoly_crypt(struct aead_request *req, bool encrypt)
d6bbd4eea24395 Horia Geantă   2018-11-08  1473  {
d6bbd4eea24395 Horia Geantă   2018-11-08  1474  	struct aead_edesc *edesc;
d6bbd4eea24395 Horia Geantă   2018-11-08  1475  	struct crypto_aead *aead = crypto_aead_reqtfm(req);
4cb4f7c11deef5 Herbert Xu     2022-11-25  1476  	struct caam_ctx *ctx = crypto_aead_ctx_dma(aead);
d6bbd4eea24395 Horia Geantă   2018-11-08  1477  	struct device *jrdev = ctx->jrdev;
d6bbd4eea24395 Horia Geantă   2018-11-08  1478  	bool all_contig;
d6bbd4eea24395 Horia Geantă   2018-11-08  1479  	u32 *desc;
d6bbd4eea24395 Horia Geantă   2018-11-08  1480  
d6bbd4eea24395 Horia Geantă   2018-11-08  1481  	edesc = aead_edesc_alloc(req, CHACHAPOLY_DESC_JOB_IO_LEN, &all_contig,
b7f17fe281442d Iuliana Prodan 2020-02-12  1482  				 encrypt);
d6bbd4eea24395 Horia Geantă   2018-11-08  1483  	if (IS_ERR(edesc))
d6bbd4eea24395 Horia Geantă   2018-11-08  1484  		return PTR_ERR(edesc);
d6bbd4eea24395 Horia Geantă   2018-11-08  1485  
d6bbd4eea24395 Horia Geantă   2018-11-08  1486  	desc = edesc->hw_desc;
d6bbd4eea24395 Horia Geantă   2018-11-08  1487  
b7f17fe281442d Iuliana Prodan 2020-02-12  1488  	init_chachapoly_job(req, edesc, all_contig, encrypt);
d6bbd4eea24395 Horia Geantă   2018-11-08 @1489  	print_hex_dump_debug("chachapoly jobdesc@" __stringify(__LINE__)": ",
d6bbd4eea24395 Horia Geantă   2018-11-08  1490  			     DUMP_PREFIX_ADDRESS, 16, 4, desc, desc_bytes(desc),
d6bbd4eea24395 Horia Geantă   2018-11-08  1491  			     1);
d6bbd4eea24395 Horia Geantă   2018-11-08  1492  
1c24022667130e Iuliana Prodan 2020-02-12  1493  	return aead_enqueue_req(jrdev, req);
d6bbd4eea24395 Horia Geantă   2018-11-08  1494  }
d6bbd4eea24395 Horia Geantă   2018-11-08  1495  

:::::: The code at line 1489 was first introduced by commit
:::::: d6bbd4eea243951d2543a0f427c9a6bf2835b6f5 crypto: caam/jr - add support for Chacha20 + Poly1305

:::::: TO: Horia Geantă <horia.geanta@nxp.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
