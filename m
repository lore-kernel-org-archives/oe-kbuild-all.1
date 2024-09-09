Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8541F3D76
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 03:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725851903; cv=none; b=sq/3i0yDrYUr8of52XMXi2TizLOqxby+sRfbMTiuRLISxdh/FxSb4h2uG/98hO0PojnlkKPt2TgZJTWbtl1ogtPVZejmmyMu2JPMVtkV+PPsS6k5csqhZpiP338uNyG0HWTTlVaEzE5/qIg7bXUcenMI0Ik6XxiTRPLAXzj6P4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725851903; c=relaxed/simple;
	bh=C19zLkzRtT44ZylEPkjEwbC0tzPom3s4QVsK301wgNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sYm+rEroblXHI37nWnNW0GzbYtgN8g9n2qwhYYO0c2Q+13OaHg12LhSfJ7zsd5eIuPEnRRQI34bydzD8f+USArsWe8cz2hti101ECbe9wwWgaGQgnbQ6DyjiUaUCYHThZeOqkJe2Shd7WUsYJjBbwgEyDTmpveEILgOM8EUwMDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjfNovJt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjfNovJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725851901; x=1757387901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C19zLkzRtT44ZylEPkjEwbC0tzPom3s4QVsK301wgNM=;
  b=PjfNovJtUm+ONBKRfwOYmJrw/uUQo3+h5zNulfMejbiRoWNUMeEaf10D
   ZATjq4Puab2eSFOuPHVMtIjyyatTrmpzIl5Ova/+uy3H1sD+C429Fe2NL
   GZEBzAamLM44fxHiIbyKbPZ2faT6m6hAyCqLE4akDN/ZQ7Mdkp0PTdNcS
   e/fc3zwntrlOp/iJS+Wpt2s71VYIhykdxDRTVBGI1Lj8mtjdb4k2BBs10
   ZokAmorM3HTZSCMEgODMf7xo1NTwV9mTZECQ1bSz5GXHqaPXDuyTSqAmM
   xByXGITPhrimuDXm5ai8Bf0SiV/V9lE/83AliY0aaYDlTem1DHbuUDhji
   g==;
X-CSE-ConnectionGUID: uk3R2LlqTBaAwFyrK9dE8Q==
X-CSE-MsgGUID: q2ceFVwCTEm9y7/356yhTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24074722"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24074722"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 20:18:20 -0700
X-CSE-ConnectionGUID: J3FPfdnkRIa0LDYqOZ8uKA==
X-CSE-MsgGUID: P4r23T6pQy2MoWXhTNO1Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66159609"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2024 20:18:20 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snUuv-000EEd-2a;
	Mon, 09 Sep 2024 03:18:17 +0000
Date: Mon, 9 Sep 2024 11:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 8/46] crypto/rsassa-pkcs1.c:130:23: error:
 'HASH_MAX_DIGESTSIZE' undeclared
Message-ID: <202409091143.VuJ67ZGY-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240909/202409091143.VuJ67ZGY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409091143.VuJ67ZGY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091143.VuJ67ZGY-lkp@intel.com/

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

  > 10	#include <linux/module.h>
    11	#include <linux/scatterlist.h>
    12	#include <crypto/akcipher.h>
    13	#include <crypto/algapi.h>
    14	#include <crypto/sig.h>
    15	#include <crypto/internal/akcipher.h>
    16	#include <crypto/internal/rsa.h>
    17	#include <crypto/internal/sig.h>
    18	
    19	/*
    20	 * Full Hash Prefix for EMSA-PKCS1-v1_5 encoding method (RFC 9580 table 24)
    21	 *
    22	 * RSA keys are usually much larger than the hash of the message to be signed.
    23	 * The hash is therefore prepended by the Full Hash Prefix and a 0xff padding.
    24	 * The Full Hash Prefix is an ASN.1 SEQUENCE containing the hash algorithm OID.
    25	 *
    26	 * https://www.rfc-editor.org/rfc/rfc9580#table-24
    27	 */
    28	
    29	static const u8 hash_prefix_md5[] = {
    30		0x30, 0x20, 0x30, 0x0c, 0x06, 0x08,	  /* SEQUENCE (SEQUENCE (OID */
    31		0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x02, 0x05,	/*	<algorithm>, */
    32		0x05, 0x00, 0x04, 0x10		      /* NULL), OCTET STRING <hash>) */
    33	};
    34	
    35	static const u8 hash_prefix_sha1[] = {
    36		0x30, 0x21, 0x30, 0x09, 0x06, 0x05,
    37		0x2b, 0x0e, 0x03, 0x02, 0x1a,
    38		0x05, 0x00, 0x04, 0x14
    39	};
    40	
    41	static const u8 hash_prefix_rmd160[] = {
    42		0x30, 0x21, 0x30, 0x09, 0x06, 0x05,
    43		0x2b, 0x24, 0x03, 0x02, 0x01,
    44		0x05, 0x00, 0x04, 0x14
    45	};
    46	
    47	static const u8 hash_prefix_sha224[] = {
    48		0x30, 0x2d, 0x30, 0x0d, 0x06, 0x09,
    49		0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x04,
    50		0x05, 0x00, 0x04, 0x1c
    51	};
    52	
    53	static const u8 hash_prefix_sha256[] = {
    54		0x30, 0x31, 0x30, 0x0d, 0x06, 0x09,
    55		0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x01,
    56		0x05, 0x00, 0x04, 0x20
    57	};
    58	
    59	static const u8 hash_prefix_sha384[] = {
    60		0x30, 0x41, 0x30, 0x0d, 0x06, 0x09,
    61		0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x02,
    62		0x05, 0x00, 0x04, 0x30
    63	};
    64	
    65	static const u8 hash_prefix_sha512[] = {
    66		0x30, 0x51, 0x30, 0x0d, 0x06, 0x09,
    67		0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x03,
    68		0x05, 0x00, 0x04, 0x40
    69	};
    70	
    71	static const u8 hash_prefix_sha3_256[] = {
    72		0x30, 0x31, 0x30, 0x0d, 0x06, 0x09,
    73		0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x08,
    74		0x05, 0x00, 0x04, 0x20
    75	};
    76	
    77	static const u8 hash_prefix_sha3_384[] = {
    78		0x30, 0x41, 0x30, 0x0d, 0x06, 0x09,
    79		0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x09,
    80		0x05, 0x00, 0x04, 0x30
    81	};
    82	
    83	static const u8 hash_prefix_sha3_512[] = {
    84		0x30, 0x51, 0x30, 0x0d, 0x06, 0x09,
    85		0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x0a,
    86		0x05, 0x00, 0x04, 0x40
    87	};
    88	
    89	static const struct hash_prefix {
    90		const char	*name;
    91		const u8	*data;
    92		size_t		size;
    93	} hash_prefixes[] = {
    94	#define _(X) { #X, hash_prefix_##X, sizeof(hash_prefix_##X) }
    95		_(md5),
    96		_(sha1),
    97		_(rmd160),
    98		_(sha256),
    99		_(sha384),
   100		_(sha512),
   101		_(sha224),
   102	#undef _
   103	#define _(X) { "sha3-" #X, hash_prefix_sha3_##X, sizeof(hash_prefix_sha3_##X) }
   104		_(256),
   105		_(384),
   106		_(512),
   107	#undef _
   108		{ NULL }
   109	};
   110	
   111	static const struct hash_prefix *rsassa_pkcs1_find_hash_prefix(const char *name)
   112	{
   113		const struct hash_prefix *p;
   114	
   115		for (p = hash_prefixes; p->name; p++)
   116			if (strcmp(name, p->name) == 0)
   117				return p;
   118		return NULL;
   119	}
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
