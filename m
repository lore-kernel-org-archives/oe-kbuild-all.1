Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0C57494
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 00:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725842594; cv=none; b=ZWrQ9YwOv9EmQd2mAnxX0rYSdhfAfWfcSfDqB50f3jrOSP9zIXf7fysglNC/1rRb+7Sj4Bkw306HhR8tjmas/UiWbxzy/D07k9kDauF/LVONZYJKkUdBEPrVxXweVm/IThxDNn5nChkTFWBvQTGo8xuvM7/5X+E6zpWTrg6ojrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725842594; c=relaxed/simple;
	bh=kxnTOYKXxMRXl5d3O44EcVH6Daf5N6AK4UKzEYWfgQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cNFIs+ayOGmGgmYe98Qkv1niYGGybt3o6mAdpWwqk60hzLa/1ZS87sKGCq7wzIQuvu1K4BCftfQN0U3saUe5Lnc5dj47R7BOIYhGgnEAvAOjgD8dJU3tOLdsUuM2IWxs6oBrFUYhWR3oYRaLG2BU9kcFdfo9q3nexWFOh+VXhqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNcMvyZy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNcMvyZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725842592; x=1757378592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kxnTOYKXxMRXl5d3O44EcVH6Daf5N6AK4UKzEYWfgQ0=;
  b=MNcMvyZyeJrYN0qmJYtnQ71umPOyLT9iFPml9JXLLMc/PWSXy5+zG7ms
   gkkf5Wk8OIzGS+cokEz3RVTTScDMCWcxiX6m2yduJ0ZlALNOZ0zjgKyA1
   Kp5SVkSbUA2MsR7fGOPtJOfTS+cawTrIlvKWJjes3fyPeHss8LYqggKlU
   MLbWVbliGI4fkWrv1GabmCpxJLwpCQO6rshC0+pTjwYivacV8E3q4nlBR
   9Zam2qirSzku+Mg3H0d7HedWorhCRgC0HaRF+jCQbNm8eLtBnGQCIpgBa
   nLzSOi2DL2SLc5DNkr8JUE/baWA5xKovqOckCJZerxV24gxtkcNZBUEn6
   w==;
X-CSE-ConnectionGUID: w5mQh64gQNKVVKVA4aWKJg==
X-CSE-MsgGUID: zU6xjFAsSLC+L3H2+UEyvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24380694"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24380694"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 17:43:11 -0700
X-CSE-ConnectionGUID: 2W8AjfUWSKSf4GLtVY2fVQ==
X-CSE-MsgGUID: fdu2/1skTSKMmWSgBIyJKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="89764061"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Sep 2024 17:43:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snSUl-000E7r-2n;
	Mon, 09 Sep 2024 00:43:07 +0000
Date: Mon, 9 Sep 2024 08:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 8/46] crypto/rsassa-pkcs1.c:130:23: error:
 'HASH_MAX_DIGESTSIZE' undeclared
Message-ID: <202409090809.qikckswh-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-002-20240909 (https://download.01.org/0day-ci/archive/20240909/202409090809.qikckswh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090809.qikckswh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090809.qikckswh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from crypto/rsassa-pkcs1.c:10:
   crypto/rsassa-pkcs1.c: In function 'rsassa_pkcs1_hash_len':
>> crypto/rsassa-pkcs1.c:130:23: error: 'HASH_MAX_DIGESTSIZE' undeclared (first use in this function)
     130 |         static_assert(HASH_MAX_DIGESTSIZE <= 127);
         |                       ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   crypto/rsassa-pkcs1.c:130:9: note: in expansion of macro 'static_assert'
     130 |         static_assert(HASH_MAX_DIGESTSIZE <= 127);
         |         ^~~~~~~~~~~~~
   crypto/rsassa-pkcs1.c:130:23: note: each undeclared identifier is reported only once for each function it appears in
     130 |         static_assert(HASH_MAX_DIGESTSIZE <= 127);
         |                       ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   crypto/rsassa-pkcs1.c:130:9: note: in expansion of macro 'static_assert'
     130 |         static_assert(HASH_MAX_DIGESTSIZE <= 127);
         |         ^~~~~~~~~~~~~
>> crypto/rsassa-pkcs1.c:130:23: error: expression in static assertion is not an integer
     130 |         static_assert(HASH_MAX_DIGESTSIZE <= 127);
         |                       ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   crypto/rsassa-pkcs1.c:130:9: note: in expansion of macro 'static_assert'
     130 |         static_assert(HASH_MAX_DIGESTSIZE <= 127);
         |         ^~~~~~~~~~~~~


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
