Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE96125DE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 02:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725849441; cv=none; b=tgGhtRYLft88lgTIg1IBf+mKhkaNCTjkZLaVq7Kt2a4VsZgxjoUToG/kYcaM4GAeUhtZyvyXJgK7Y/42KXodj3AsdXCEi+oAzEal4rDHwKls+jETOp6OeXn9qKz2pA+cInFslC3M/uBWNYrF7yqq+ck/+6LB1lllfKUt/2jPAos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725849441; c=relaxed/simple;
	bh=PztzjSqy6/TOtcLQpM+t9JZdFIi8cHtH3SsaIxwtq+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=drwhIo96StGojjzbWdJJF/dkRiO6tCPXNm43qtoQj3/aXV6J1M2u9pDlOPl/Ln9GfbPKiZUwjbLyfOUPESKlhKDjrouruBplctXSEYHYsE4BVCJbEsPAArMDb9O5oXU+nUpsJs3hAQSmj9VBCcij6YwVmouEwyCK0StLfrsg2Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMteuh6k; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMteuh6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725849440; x=1757385440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PztzjSqy6/TOtcLQpM+t9JZdFIi8cHtH3SsaIxwtq+w=;
  b=IMteuh6kStAPvcZupV+kdynaZT7OCv1+DIdVK8mHLPsXI2VWFm1oWrfY
   Hz+VLb0UGvIoOMFZKZav/w2oeGnWUX73FUFjF4y8knowfR3ojmOCF6nSr
   iCyhQ5ptHKWiqDhftorhwKcKmhZcxn1O4CCLUu2nd5WGdlGzDr+EgU8cs
   shB7Q3sSQeZGZ6GvAHaq+ZDZYl19XfRddZfvdkdYZOHzB9xaTiaCnQFqB
   3LyLHRBYS3+sLuKS/mUPyQgxKWSSNHc3LcmPB8H9M6fF4TYD/TXYLKbvq
   mkoDwLGTZKPok/eWWz4YFktnZ4D/dHRTkmGM8FnzOhZ78BneQg2KV81P6
   Q==;
X-CSE-ConnectionGUID: ckpqHMK5Sq+uNWHqgAsHIQ==
X-CSE-MsgGUID: BT5ma25pTj6e6mFfRrZX1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35116334"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="35116334"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 19:37:19 -0700
X-CSE-ConnectionGUID: Y0gSbhxfQ/qLOItMPhPcqQ==
X-CSE-MsgGUID: kY6emscLTVSrDBI9Z+vJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66511104"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2024 19:37:18 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snUHE-000EDX-1E;
	Mon, 09 Sep 2024 02:37:16 +0000
Date: Mon, 9 Sep 2024 10:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 8/46] crypto/rsassa-pkcs1.c:130:16: error: use of
 undeclared identifier 'HASH_MAX_DIGESTSIZE'
Message-ID: <202409091010.3xG5pgGy-lkp@intel.com>
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
commit: d914ced0850f948355ba747485769199437c620c [8/46] crypto: rsassa-pkcs1 - Harden digest length verification
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240909/202409091010.3xG5pgGy-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091010.3xG5pgGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091010.3xG5pgGy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/rsassa-pkcs1.c:130:16: error: use of undeclared identifier 'HASH_MAX_DIGESTSIZE'
           static_assert(HASH_MAX_DIGESTSIZE <= 127);
                         ^
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
