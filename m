Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B4C2914
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 04:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732854013; cv=none; b=oIYclwrMsamDLO93wtIh4HU3tyl6Ii+xwqy5ri4oApkgojf+p5rLjJ3UHt6hmRiD/BUfb/n7sO4Gn3OOL1Hr9HjljrKenSPIYTRXxWuv/B1amJAt+zV1ITIa8CtE+cGdBKXsofsvdGrUn27plm7bh2dhfH7UhB1cZqVgqYgfdNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732854013; c=relaxed/simple;
	bh=heDis4hKpdtXJxQ/Yb77DZyRWimdNFBxZWCKXmmgQtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mQzB2eNnVIgATec6/kyxhq9sNyGwtUdNSPxROv9SNl6UsXTAr5tQbe3V0UaJeKvkEfqb7Mi0aaERircL/MN1RNOPWkVCwde4gBAtGI7yOTZegJ00FYqYFm2hDhM/3HyHefyvaDjKF7+nWGBLXHY+//2o9NymN62AmY2SLwhdIE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErvehN26; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErvehN26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732854010; x=1764390010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=heDis4hKpdtXJxQ/Yb77DZyRWimdNFBxZWCKXmmgQtM=;
  b=ErvehN26k73W+gKkRl1LcQQb9C5qBCYQ6dqwqekMNNmGzJ2GTjhRfmWf
   7FdsaLKftHVjGcF9l24k68gaqD4wBgmtqnsBGvpbm/PjoXeWb4HhHV31t
   5PCPFuxZnlLuE1roejuPgEjVRNCfLvlfOoay1Foz1Vjc9GfttGCgVhZ9L
   Hur8Ij3+yQdrJxYM8a8MyzZKpDKPBzNPoF+YNgXSSwy3XXE1iAHN3oZBi
   QQRylaNFKUb/7LXlK9JCIcixw6Fi8C3GIs6I+C191dZRuwMoUA9oC8e/g
   2ku1G8+Ayg8GMyQ04X5HJWReOoZed1ADcl1C9Pmk8seXyCuXVpe+OyB+U
   Q==;
X-CSE-ConnectionGUID: qMffDWbiQQehuc6cvBNrhA==
X-CSE-MsgGUID: 5UH1cPn9SNGs09YocDwGtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33333240"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="33333240"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:20:10 -0800
X-CSE-ConnectionGUID: BOqYTfGJR4WPYNA8VSI3OQ==
X-CSE-MsgGUID: r5hMpvooQKGh1UbmHp5xaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="97361368"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Nov 2024 20:20:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGsUA-000AKe-02;
	Fri, 29 Nov 2024 04:20:06 +0000
Date: Fri, 29 Nov 2024 12:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1484/1484] include/linux/pgplib.h:36:30: error:
 field 'version' has incomplete type
Message-ID: <202411291248.k6zanntO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [1484/1484] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-randconfig-074-20241119 (https://download.01.org/0day-ci/archive/20241129/202411291248.k6zanntO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291248.k6zanntO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291248.k6zanntO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/pgp_public_key.c:20:
>> include/linux/pgplib.h:26:36: warning: 'enum pgp_packet_tag' declared inside parameter list will not be visible outside of this definition or declaration
      26 |                               enum pgp_packet_tag type,
         |                                    ^~~~~~~~~~~~~~
>> include/linux/pgplib.h:36:30: warning: 'version' is narrower than values of its type
      36 |         enum pgp_key_version version : 8;
         |                              ^~~~~~~
>> include/linux/pgplib.h:36:30: error: field 'version' has incomplete type
>> include/linux/pgplib.h:37:30: warning: 'pubkey_algo' is narrower than values of its type
      37 |         enum pgp_pubkey_algo pubkey_algo : 8;
         |                              ^~~~~~~~~~~
>> include/linux/pgplib.h:37:30: error: field 'pubkey_algo' has incomplete type
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_calc_pkey_keyid':
>> crypto/asymmetric_keys/pgp_public_key.c:63:9: error: implicit declaration of function 'kenter' [-Werror=implicit-function-declaration]
      63 |         kenter("");
         |         ^~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:65:29: error: 'PGP_KEY_VERSION_4' undeclared (first use in this function)
      65 |         n = (pgp->version < PGP_KEY_VERSION_4) ? 8 : 6;
         |                             ^~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:65:29: note: each undeclared identifier is reported only once for each function it appears in
>> crypto/asymmetric_keys/pgp_public_key.c:67:23: error: implicit declaration of function 'mpi_key_length' [-Werror=implicit-function-declaration]
      67 |                 ret = mpi_key_length(key_ptr, keylen, nb + i, nn + i);
         |                       ^~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:115:9: error: implicit declaration of function 'kleave' [-Werror=implicit-function-declaration]
     115 |         kleave(" = %d", ret);
         |         ^~~~~~
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_generate_fingerprint':
   crypto/asymmetric_keys/pgp_public_key.c:134:49: error: 'PGP_KEY_VERSION_4' undeclared (first use in this function)
     134 |         tfm = crypto_alloc_shash(pgp->version < PGP_KEY_VERSION_4 ?
         |                                                 ^~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c: At top level:
>> crypto/asymmetric_keys/pgp_public_key.c:199:40: warning: 'enum pgp_packet_tag' declared inside parameter list will not be visible outside of this definition or declaration
     199 |                                   enum pgp_packet_tag type,
         |                                        ^~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:199:55: error: parameter 2 ('type') has incomplete type
     199 |                                   enum pgp_packet_tag type,
         |                                   ~~~~~~~~~~~~~~~~~~~~^~~~
>> crypto/asymmetric_keys/pgp_public_key.c:198:12: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     198 | static int pgp_process_public_key(struct pgp_parse_context *context,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_process_public_key':
>> crypto/asymmetric_keys/pgp_public_key.c:213:21: error: 'PGP_PKT_USER_ID' undeclared (first use in this function)
     213 |         if (type == PGP_PKT_USER_ID) {
         |                     ^~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:234:32: error: 'PGP_PUBKEY__LAST' undeclared (first use in this function)
     234 |         if (pgp.pubkey_algo >= PGP_PUBKEY__LAST)
         |                                ^~~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:236:16: error: 'pgp_to_public_key_algo' undeclared (first use in this function); did you mean 'pgp_pubkey_algo'?
     236 |         algo = pgp_to_public_key_algo[pgp.pubkey_algo];
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                pgp_pubkey_algo
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_key_parse':
>> crypto/asymmetric_keys/pgp_public_key.c:313:43: error: 'PGP_PKT_PUBLIC_KEY' undeclared (first use in this function)
     313 |         ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY) |
         |                                           ^~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:314:43: error: 'PGP_PKT_USER_ID' undeclared (first use in this function)
     314 |                                     (1 << PGP_PKT_USER_ID);
         |                                           ^~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:315:32: error: assignment to 'int (*)(struct pgp_parse_context *, enum pgp_packet_tag,  u8,  const u8 *, size_t)' {aka 'int (*)(struct pgp_parse_context *, enum pgp_packet_tag,  unsigned char,  const unsigned char *, long unsigned int)'} from incompatible pointer type 'int (*)()' [-Werror=incompatible-pointer-types]
     315 |         ctx.pgp.process_packet = pgp_process_public_key;
         |                                ^
   cc1: some warnings being treated as errors
--
   In file included from crypto/asymmetric_keys/pgp_preload.c:19:
>> include/linux/pgplib.h:26:36: warning: 'enum pgp_packet_tag' declared inside parameter list will not be visible outside of this definition or declaration
      26 |                               enum pgp_packet_tag type,
         |                                    ^~~~~~~~~~~~~~
>> include/linux/pgplib.h:36:30: warning: 'version' is narrower than values of its type
      36 |         enum pgp_key_version version : 8;
         |                              ^~~~~~~
>> include/linux/pgplib.h:36:30: error: field 'version' has incomplete type
>> include/linux/pgplib.h:37:30: warning: 'pubkey_algo' is narrower than values of its type
      37 |         enum pgp_pubkey_algo pubkey_algo : 8;
         |                              ^~~~~~~~~~~
>> include/linux/pgplib.h:37:30: error: field 'pubkey_algo' has incomplete type
>> crypto/asymmetric_keys/pgp_preload.c:63:38: warning: 'enum pgp_packet_tag' declared inside parameter list will not be visible outside of this definition or declaration
      63 |                                 enum pgp_packet_tag type, u8 headerlen,
         |                                      ^~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_preload.c:63:53: error: parameter 2 ('type') has incomplete type
      63 |                                 enum pgp_packet_tag type, u8 headerlen,
         |                                 ~~~~~~~~~~~~~~~~~~~~^~~~
>> crypto/asymmetric_keys/pgp_preload.c:62:19: error: function declaration isn't a prototype [-Werror=strict-prototypes]
      62 | static int __init found_pgp_key(struct pgp_parse_context *context,
         |                   ^~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_preload.c:101:12: warning: no previous prototype for 'preload_pgp_keys' [-Wmissing-prototypes]
     101 | int __init preload_pgp_keys(const u8 *pgpdata, size_t pgpdatalen,
         |            ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_preload.c: In function 'preload_pgp_keys':
>> crypto/asymmetric_keys/pgp_preload.c:107:43: error: 'PGP_PKT_PUBLIC_KEY' undeclared (first use in this function)
     107 |         ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY);
         |                                           ^~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_preload.c:107:43: note: each undeclared identifier is reported only once for each function it appears in
>> crypto/asymmetric_keys/pgp_preload.c:108:32: error: assignment to 'int (*)(struct pgp_parse_context *, enum pgp_packet_tag,  u8,  const u8 *, size_t)' {aka 'int (*)(struct pgp_parse_context *, enum pgp_packet_tag,  unsigned char,  const unsigned char *, long unsigned int)'} from incompatible pointer type 'int (*)()' [-Werror=incompatible-pointer-types]
     108 |         ctx.pgp.process_packet = found_pgp_key;
         |                                ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [m]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=m]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/version +36 include/linux/pgplib.h

b78af6579e15dc David Howells 2023-09-12  19  
b78af6579e15dc David Howells 2023-09-12  20  /*
b78af6579e15dc David Howells 2023-09-12  21   * PGP library packet parser
b78af6579e15dc David Howells 2023-09-12  22   */
b78af6579e15dc David Howells 2023-09-12  23  struct pgp_parse_context {
b78af6579e15dc David Howells 2023-09-12  24  	u64 types_of_interest;
b78af6579e15dc David Howells 2023-09-12  25  	int (*process_packet)(struct pgp_parse_context *context,
b78af6579e15dc David Howells 2023-09-12 @26  			      enum pgp_packet_tag type,
b78af6579e15dc David Howells 2023-09-12  27  			      u8 headerlen,
b78af6579e15dc David Howells 2023-09-12  28  			      const u8 *data,
b78af6579e15dc David Howells 2023-09-12  29  			      size_t datalen);
b78af6579e15dc David Howells 2023-09-12  30  };
b78af6579e15dc David Howells 2023-09-12  31  
b78af6579e15dc David Howells 2023-09-12  32  extern int pgp_parse_packets(const u8 *data, size_t datalen,
b78af6579e15dc David Howells 2023-09-12  33  			     struct pgp_parse_context *ctx);
b78af6579e15dc David Howells 2023-09-12  34  
b78af6579e15dc David Howells 2023-09-12  35  struct pgp_parse_pubkey {
b78af6579e15dc David Howells 2023-09-12 @36  	enum pgp_key_version version : 8;
b78af6579e15dc David Howells 2023-09-12 @37  	enum pgp_pubkey_algo pubkey_algo : 8;
b78af6579e15dc David Howells 2023-09-12  38  	__kernel_old_time_t creation_time;
b78af6579e15dc David Howells 2023-09-12  39  	__kernel_old_time_t expires_at;
b78af6579e15dc David Howells 2023-09-12  40  };
b78af6579e15dc David Howells 2023-09-12  41  

:::::: The code at line 36 was first introduced by commit
:::::: b78af6579e15dcdff86504da90af77f3e890270e PGPLIB: Basic packet parser

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: zgzxx <zhangguangzhi3@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
