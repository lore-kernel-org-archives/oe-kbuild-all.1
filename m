Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750E81ACDE0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 05:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725859955; cv=none; b=Tv+x2z0WAA33QEjKJ8SileaKVSm16xNTtpV+LMPBB7QsXPUAZWZJbZWboEYtLCWSn1dRr27j/TAM8ddAiYNy9TmNMWGxk37UH6OTuim/18g3cNbZglJ+bx2quZjWBz++BSupkxE1AUaemihCVxl+MRhScUxK61M7HiyXyKRKIdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725859955; c=relaxed/simple;
	bh=Q8OJeHsyhdKLJFYlZCvDRfN+xKYvIZWBWHHQ3YzlrQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SlNCOLDAwNg3mxuBBuTQ0JXDN4FciU35Cb76XZ2DkvsuLLruFfWXm5U7RSU7/MgbaJUHfIXehrx1si5eRGveBUSLavp4t7uy3//ym61mqFOero68SbgRVoWaotHEQj/XHXwbc7eglyEnXqEX2SLrzTqzlle8IHQ88O3qhv2kT+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQNpKBjg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQNpKBjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725859951; x=1757395951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q8OJeHsyhdKLJFYlZCvDRfN+xKYvIZWBWHHQ3YzlrQ4=;
  b=hQNpKBjghbB+WpHiUWtj22cEotLypE+I0RvVO3vpUYCsodo+NLMJFlgD
   bCiTT4Hw3AlZ9dpWmxC5XKrWvQPSeFUt6OUg5gwQopEQJ/DuEhq/yRPHW
   GtnR1D/GkGkret/dHNEbguX5bqxIb6wE79TYd8+oYE/S1wOQ4hHTIns9e
   mvDUz3l63o2qqBg8ZRX7a/fr89cfZypDKgAYJT96M6RacRXevqhZvJiJM
   qGGcGks0cdAWVY/6QXH67f5Ot/LCqPu/pJz66WMefTnRei+bx/W3J3hEt
   PAawlDoTzT2k2T9NX9Y3rLW4DzxbfcRS2m9VTqgCsLMMqKv7FtqOxFD7m
   A==;
X-CSE-ConnectionGUID: /n1iJObTRP2RJfPQweEusA==
X-CSE-MsgGUID: k+tI37IVS2uZAY647mXDdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35676116"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="35676116"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 22:32:30 -0700
X-CSE-ConnectionGUID: sj5wmqYAQ4W7Z6v5KGXr9g==
X-CSE-MsgGUID: oFvvswxaQxuZroCQRu9eZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66234195"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Sep 2024 22:32:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snX0k-000EKZ-36;
	Mon, 09 Sep 2024 05:32:26 +0000
Date: Mon, 9 Sep 2024 13:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 8/46] crypto/rsassa-pkcs1.c:130:16: error: use of
 undeclared identifier 'HASH_MAX_DIGESTSIZE'
Message-ID: <202409091321.tYl8okx9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   fc9f4270fb1c1618a497f5bc1cf9eef4ac9032d2
commit: ef118934511b94533def9b11a34018b90d942cc9 [8/46] crypto: rsassa-pkcs1 - Harden digest length verification
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240909/202409091321.tYl8okx9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091321.tYl8okx9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091321.tYl8okx9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/rsassa-pkcs1.c:130:16: error: use of undeclared identifier 'HASH_MAX_DIGESTSIZE'
     130 |         static_assert(HASH_MAX_DIGESTSIZE <= 127);
         |                       ^
   1 error generated.


vim +/HASH_MAX_DIGESTSIZE +130 crypto/rsassa-pkcs1.c

   120	
   121	static unsigned int rsassa_pkcs1_hash_len(const struct hash_prefix *p)
   122	{
   123		/*
   124		 * The final byte of the Full Hash Prefix encodes the hash length.
   125		 *
   126		 * This needs to be revisited should hash algorithms with more than
   127		 * 1016 bits (127 bytes * 8) ever be added.  The length would then
   128		 * be encoded into more than one byte by ASN.1.
   129		 */
 > 130		static_assert(HASH_MAX_DIGESTSIZE <= 127);
   131	
   132		return p->data[p->size - 1];
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
