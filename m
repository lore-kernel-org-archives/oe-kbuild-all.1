Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9C86D1C1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720427623; cv=none; b=TjgoWMfVcRKB8I943hGiPf1IwTR4XdYuodvx1bzubPjqy4wP6AjKhgfxGMYAWFM6TkYeWdeC7+HIC3pSNY7fb8u9QO2w9BDf1azTtUM7unVH3XV4wPE18EEeYPyFP8ZiaYFZpPuBHIX7l8hpmYs50z4Cfa6KJq2ja2SSSchVPG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720427623; c=relaxed/simple;
	bh=AWXTgKa5lN6ObVuExkC0DVuX7TSbAX+ecA1GngnZbBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S9uOZjChQfR+UOkmfAsyigKlVNYWomdwH1sBQYTvK4cOyN1f8AOZ3nSG3RdzwIDxpIco25EsPaRlmO5JDvC8I0sqqEq3dPLFHWFJLv+C/cpd+yuTBxHy74UgeP+aUvhAzeRbnAgELl1LpGvft03+wroRk4+jN0NYa/ToKhnVLV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAjQjhYn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAjQjhYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720427622; x=1751963622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AWXTgKa5lN6ObVuExkC0DVuX7TSbAX+ecA1GngnZbBI=;
  b=RAjQjhYnmHMzZ7rwnrpZjZGWwucKDlACN2hgXRREVAe9+tQ/qs7vT8Dq
   qUM4rF9UYOjUzAhKOqFiqcoWRyAoyfMOCvrlwhQu4n0OlW1Fw29eI432L
   XLfiHYCXU4z7BI5QKlFBiWk29xUs06rnD8cI3yARQuqVuFp7GH/DArSGp
   h98dRaloB+oxIcm2bMAcYF94MtWmR9IoY0FqT5yV/L9YqeXlJluXlAzRL
   K6q0sxl4kTGWAWpWKOuWfS6Ory3uLxOs4de+6E8cRRa7sUM2QXBvHDDy5
   ug7aNwGaBvUbhIyNmHcHc8xLCiW33ZEGqTVuLWPcRmEv3n6HAzXHi1FuO
   Q==;
X-CSE-ConnectionGUID: zK/CThftQ4euyS1WSPuhxg==
X-CSE-MsgGUID: bYPZnN80SwWnh2l4pbPYGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="20517866"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="20517866"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 01:33:41 -0700
X-CSE-ConnectionGUID: z46ilkGZQ/ucdbZcd7fsDw==
X-CSE-MsgGUID: n1CvbZ/LSviOgo1ZJF4P8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="78576980"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jul 2024 01:33:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQjoX-000Vcg-0U;
	Mon, 08 Jul 2024 08:33:37 +0000
Date: Mon, 8 Jul 2024 16:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3342/10598] include/linux/pgplib.h:36:23: error:
 field has incomplete type 'enum pgp_key_version'
Message-ID: <202407081638.r5xQjyqM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   01c2a11a75f4f8b273ef3e34cca3974b10314a3a
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [3342/10598] KEYS: Provide a function to load keys from a PGP keyring blob
config: arm64-randconfig-r131-20240707 (https://download.01.org/0day-ci/archive/20240708/202407081638.r5xQjyqM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240708/202407081638.r5xQjyqM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407081638.r5xQjyqM-lkp@intel.com/

Note: the openeuler/OLK-6.6 HEAD 01c2a11a75f4f8b273ef3e34cca3974b10314a3a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/pgp_preload.c:19:
   include/linux/pgplib.h:26:15: warning: declaration of 'enum pgp_packet_tag' will not be visible outside of this function [-Wvisibility]
      26 |                               enum pgp_packet_tag type,
         |                                    ^
>> include/linux/pgplib.h:36:23: error: field has incomplete type 'enum pgp_key_version'
      36 |         enum pgp_key_version version : 8;
         |                              ^
   include/linux/pgplib.h:36:7: note: forward declaration of 'enum pgp_key_version'
      36 |         enum pgp_key_version version : 8;
         |              ^
>> include/linux/pgplib.h:37:23: error: field has incomplete type 'enum pgp_pubkey_algo'
      37 |         enum pgp_pubkey_algo pubkey_algo : 8;
         |                              ^
   include/linux/pgplib.h:37:7: note: forward declaration of 'enum pgp_pubkey_algo'
      37 |         enum pgp_pubkey_algo pubkey_algo : 8;
         |              ^
   crypto/asymmetric_keys/pgp_preload.c:63:10: warning: declaration of 'enum pgp_packet_tag' will not be visible outside of this function [-Wvisibility]
      63 |                                 enum pgp_packet_tag type, u8 headerlen,
         |                                      ^
   crypto/asymmetric_keys/pgp_preload.c:63:25: error: variable has incomplete type 'enum pgp_packet_tag'
      63 |                                 enum pgp_packet_tag type, u8 headerlen,
         |                                                     ^
   crypto/asymmetric_keys/pgp_preload.c:63:10: note: forward declaration of 'enum pgp_packet_tag'
      63 |                                 enum pgp_packet_tag type, u8 headerlen,
         |                                      ^
   crypto/asymmetric_keys/pgp_preload.c:107:36: error: use of undeclared identifier 'PGP_PKT_PUBLIC_KEY'
     107 |         ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY);
         |                                           ^
>> crypto/asymmetric_keys/pgp_preload.c:108:25: error: incompatible function pointer types assigning to 'int (*)(struct pgp_parse_context *, enum pgp_packet_tag, u8, const u8 *, size_t)' (aka 'int (*)(struct pgp_parse_context *, enum pgp_packet_tag, unsigned char, const unsigned char *, unsigned long)') from 'int (struct pgp_parse_context *, enum pgp_packet_tag, u8, const u8 *, size_t)' (aka 'int (struct pgp_parse_context *, enum pgp_packet_tag, unsigned char, const unsigned char *, unsigned long)') [-Wincompatible-function-pointer-types]
     108 |         ctx.pgp.process_packet = found_pgp_key;
         |                                ^ ~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_preload.c:101:12: warning: no previous prototype for function 'preload_pgp_keys' [-Wmissing-prototypes]
     101 | int __init preload_pgp_keys(const u8 *pgpdata, size_t pgpdatalen,
         |            ^
   crypto/asymmetric_keys/pgp_preload.c:101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     101 | int __init preload_pgp_keys(const u8 *pgpdata, size_t pgpdatalen,
         | ^
         | static 
   3 warnings and 5 errors generated.
--
   In file included from crypto/asymmetric_keys/pgp_public_key.c:19:
   In file included from include/linux/mpi.h:21:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from crypto/asymmetric_keys/pgp_public_key.c:20:
   include/linux/pgplib.h:26:15: warning: declaration of 'enum pgp_packet_tag' will not be visible outside of this function [-Wvisibility]
      26 |                               enum pgp_packet_tag type,
         |                                    ^
>> include/linux/pgplib.h:36:23: error: field has incomplete type 'enum pgp_key_version'
      36 |         enum pgp_key_version version : 8;
         |                              ^
   include/linux/pgplib.h:36:7: note: forward declaration of 'enum pgp_key_version'
      36 |         enum pgp_key_version version : 8;
         |              ^
>> include/linux/pgplib.h:37:23: error: field has incomplete type 'enum pgp_pubkey_algo'
      37 |         enum pgp_pubkey_algo pubkey_algo : 8;
         |                              ^
   include/linux/pgplib.h:37:7: note: forward declaration of 'enum pgp_pubkey_algo'
      37 |         enum pgp_pubkey_algo pubkey_algo : 8;
         |              ^
   crypto/asymmetric_keys/pgp_public_key.c:63:2: error: call to undeclared function 'kenter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      63 |         kenter("");
         |         ^
   crypto/asymmetric_keys/pgp_public_key.c:65:22: error: use of undeclared identifier 'PGP_KEY_VERSION_4'
      65 |         n = (pgp->version < PGP_KEY_VERSION_4) ? 8 : 6;
         |                             ^
   crypto/asymmetric_keys/pgp_public_key.c:67:9: error: call to undeclared function 'mpi_key_length'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      67 |                 ret = mpi_key_length(key_ptr, keylen, nb + i, nn + i);
         |                       ^
   crypto/asymmetric_keys/pgp_public_key.c:95:21: error: use of undeclared identifier 'PGP_KEY_VERSION_4'
      95 |         if (pgp->version < PGP_KEY_VERSION_4) {
         |                            ^
   crypto/asymmetric_keys/pgp_public_key.c:115:2: error: call to undeclared function 'kleave'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     115 |         kleave(" = %d", ret);
         |         ^
   crypto/asymmetric_keys/pgp_public_key.c:134:42: error: use of undeclared identifier 'PGP_KEY_VERSION_4'
     134 |         tfm = crypto_alloc_shash(pgp->version < PGP_KEY_VERSION_4 ?
         |                                                 ^
   crypto/asymmetric_keys/pgp_public_key.c:191:2: error: call to undeclared function 'kleave'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     191 |         kleave(" = %d", ret);
         |         ^
   crypto/asymmetric_keys/pgp_public_key.c:199:12: warning: declaration of 'enum pgp_packet_tag' will not be visible outside of this function [-Wvisibility]
     199 |                                   enum pgp_packet_tag type,
         |                                        ^
   crypto/asymmetric_keys/pgp_public_key.c:199:27: error: variable has incomplete type 'enum pgp_packet_tag'
     199 |                                   enum pgp_packet_tag type,
         |                                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:199:12: note: forward declaration of 'enum pgp_packet_tag'
     199 |                                   enum pgp_packet_tag type,
         |                                        ^
   crypto/asymmetric_keys/pgp_public_key.c:211:2: error: call to undeclared function 'kenter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     211 |         kenter(",%u,%u,,%zu", type, headerlen, datalen);
         |         ^
>> crypto/asymmetric_keys/pgp_public_key.c:213:14: error: use of undeclared identifier 'PGP_PKT_USER_ID'
     213 |         if (type == PGP_PKT_USER_ID) {
         |                     ^
   crypto/asymmetric_keys/pgp_public_key.c:216:3: error: call to undeclared function 'kleave'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     216 |                 kleave(" = 0 [user ID]");
         |                 ^
   crypto/asymmetric_keys/pgp_public_key.c:221:3: error: call to undeclared function 'kleave'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     221 |                 kleave(" = -ENOKEY [already]");
         |                 ^
>> crypto/asymmetric_keys/pgp_public_key.c:234:25: error: use of undeclared identifier 'PGP_PUBKEY__LAST'
     234 |         if (pgp.pubkey_algo >= PGP_PUBKEY__LAST)
         |                                ^
>> crypto/asymmetric_keys/pgp_public_key.c:236:9: error: use of undeclared identifier 'pgp_to_public_key_algo'
     236 |         algo = pgp_to_public_key_algo[pgp.pubkey_algo];
         |                ^
   crypto/asymmetric_keys/pgp_public_key.c:252:2: error: call to undeclared function 'kleave'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     252 |         kleave(" = 0 [use]");
         |         ^
   crypto/asymmetric_keys/pgp_public_key.c:310:2: error: call to undeclared function 'kenter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     310 |         kenter("");
         |         ^
>> crypto/asymmetric_keys/pgp_public_key.c:313:36: error: use of undeclared identifier 'PGP_PKT_PUBLIC_KEY'
     313 |         ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY) |
         |                                           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   3 warnings and 20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +36 include/linux/pgplib.h

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
