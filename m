Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C23B1E511
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 20:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134869; cv=none; b=Ob9RUlri7byfiLheGNShuiMJE3weO+Ri2Ih10gCdtOS8eqFa1tZaZHGirhjLj7IL9eqwpv7i4/S+5ugi0efF5QNrTgjb0qIYEzOQTFNIAY39hFxMjs6As+xnIiNMmB0O/+z3dbyyAl1kxF03BPTLVAuNLP7G/0KLkXKyjNN6odE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134869; c=relaxed/simple;
	bh=eFN5h+F4CaqeaAtkSL1URKR4+VkzXhMNcMCOkKUapxU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CTH9KzFvzEuKwzc8gdh6N6xJm1jL3/RMmpX8QC1PbWncYed/bwIv4FC35B7zoMkpnIeeyvIYaLECpnTlAzlKYmZZeXuibFBZA3E1zXyVBK+aeMfNBhQ8srZg7fxSqQpH4/Z8dtcU1tDdFiGwnzhXKMFXwC/CNvdt1nIoy28ByMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VL5Lmk6X; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VL5Lmk6X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779134867; x=1810670867;
  h=date:from:to:cc:subject:message-id;
  bh=eFN5h+F4CaqeaAtkSL1URKR4+VkzXhMNcMCOkKUapxU=;
  b=VL5Lmk6X6S3LcTvsd67ornahuiMiYputLpovjPpLjFEA5afu1fP0ftql
   VOttRzV6D5kNdzzkN9oTQfWcP0c19kjOuNbd7zFNLPVI36Q4wFneALoQj
   olhue90j9kVOsQOO4xoJYKh+HtIhKq+wBVhKICw8T2xqyQZFqEt9LTgbv
   56sMFbMFtcMYnTq0fMOM9JTwIy6BPlnCz/fd01GhMsCXfd2o7EavIbfwV
   0erjQPEqQ+HDJgINOzAfZom4eLoRe1ZXnICyOQmno6iXJ88y2dHSzSBTv
   hrmh7bJq5VE1u5Y2AOW8P/qCVV0aRDmoyT3HMk57jENcAsQZjr9FzduWr
   w==;
X-CSE-ConnectionGUID: /VhPDiQQT4CLS1LzNTuUbg==
X-CSE-MsgGUID: 3x3wEROdQ4mc27Va+FlZnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97569397"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97569397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 13:07:47 -0700
X-CSE-ConnectionGUID: 3VSjG4EMQSOtHeC7oIZV1w==
X-CSE-MsgGUID: NRkiOOq9Sta4vpazu6RM6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="239604939"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2026 13:07:46 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP4Fb-000000003Ly-1HY3;
	Mon, 18 May 2026 20:07:43 +0000
Date: Tue, 19 May 2026 04:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 27/238]
 drivers/crypto/s5p-sss.c:447:13: warning: variable 'len' set but not used
Message-ID: <202605190356.sVvd2wbs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 56b35d1f3a968b9575b16ce644cfa827cf53fa02 [27/238] crypto: replace __get_free_pages() with kmalloc()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605190356.sVvd2wbs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190356.sVvd2wbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190356.sVvd2wbs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/s5p-sss.c: In function 's5p_free_sg_cpy':
>> drivers/crypto/s5p-sss.c:447:13: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     447 |         int len;
         |             ^~~


vim +/len +447 drivers/crypto/s5p-sss.c

a49e490c7a8a5c6c Vladimir Zapolskiy        2011-04-08  444  
9e4a1100a445671d Krzysztof Kozlowski       2016-03-22  445  static void s5p_free_sg_cpy(struct s5p_aes_dev *dev, struct scatterlist **sg)
9e4a1100a445671d Krzysztof Kozlowski       2016-03-22  446  {
9e4a1100a445671d Krzysztof Kozlowski       2016-03-22 @447  	int len;
9e4a1100a445671d Krzysztof Kozlowski       2016-03-22  448  
9e4a1100a445671d Krzysztof Kozlowski       2016-03-22  449  	if (!*sg)
9e4a1100a445671d Krzysztof Kozlowski       2016-03-22  450  		return;
9e4a1100a445671d Krzysztof Kozlowski       2016-03-22  451  
e6b98ce6145a2c68 Ard Biesheuvel            2019-11-09  452  	len = ALIGN(dev->req->cryptlen, AES_BLOCK_SIZE);
56b35d1f3a968b95 Mike Rapoport (Microsoft  2026-02-10  453) 	kfree((void *)(unsigned long)sg_virt(*sg));
9e4a1100a445671d Krzysztof Kozlowski       2016-03-22  454  
9e4a1100a445671d Krzysztof Kozlowski       2016-03-22  455  	kfree(*sg);
9e4a1100a445671d Krzysztof Kozlowski       2016-03-22  456  	*sg = NULL;
9e4a1100a445671d Krzysztof Kozlowski       2016-03-22  457  }
9e4a1100a445671d Krzysztof Kozlowski       2016-03-22  458  

:::::: The code at line 447 was first introduced by commit
:::::: 9e4a1100a445671dd55ff74dce859221cc1464fa crypto: s5p-sss - Handle unaligned buffers

:::::: TO: Krzysztof Kozlowski <krzk@kernel.org>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
