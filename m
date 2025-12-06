Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF3926E6F8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 02:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764986676; cv=none; b=W43PvaGJB1b49NTB7iW09UdqBJtH6Zi8E1ZS8uxOODVR9i6FNdhKBC4udD40WgimdxO0ZIEIyV33U1Dk4RKHTYxElUdtQSRwyV3RAczm+GU3UZs+dQXyt0CuzWvFKJEQfZlRlhEwH8skc9T9K/99bZGPVxhFdnN8MsyNHHbsHfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764986676; c=relaxed/simple;
	bh=H7AIW15AvwbpWYN+MKqhOF05Cxp9lBXtVSh5iNc+Qek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=slQxIEclRlwTMoTsnSjWGCPdXXW0XDjsWsIUwTecF1vh90tTP7atf4txFjZvpYWz3E/7TN0neMwdp0UKHMSjNkCUf3pKk8XY3EunLYENbphfFKTDqQUQKPA0H0SzU4quoGrWjOVnxTEkFPwR7v416hwvmEUtJkIVgtjTrqD2XH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ek1/QV5I; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ek1/QV5I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764986674; x=1796522674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H7AIW15AvwbpWYN+MKqhOF05Cxp9lBXtVSh5iNc+Qek=;
  b=Ek1/QV5I7sOaRniTyWOuTariILu5cfbwq7DWG3K0VxDs9ZzQI5StyTnr
   rzpNl9dpQ2ToDWsWBPeXtGKTiPBVhjSavSsF36cGlP9dBf6cWjx+KCH+S
   Weji4SlcmlSzBTa5Lyq/4UZtgNI7t5PBvKSfxgszyzkfmy/+VlMh+mxvK
   C8c/4qfvSBuMbcWAA+wKX40l7vIwigH/OpMiHNCWy26Tfi/5tDVKfqrK8
   QroM5/6cTvEuSihL9b0GbfJJx3o0hZZru/rLyehxuVTvjJ5WVF71tFKqN
   81xyFhqZkU/7xcMKPzM8dUtRb6rkLd0fsY/7nffuEnPK0OkELFCz9Jy5X
   w==;
X-CSE-ConnectionGUID: tmKflwOOSgSkNfhUKx5fvw==
X-CSE-MsgGUID: GfKgQXW/TVyMc7Fxifonag==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66021509"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="66021509"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 18:04:33 -0800
X-CSE-ConnectionGUID: Qiy3N/2jQbG+rkp1QI12hQ==
X-CSE-MsgGUID: iZJhx2opRFqA3kQhOMcOxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="195514417"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Dec 2025 18:04:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRhev-00000000FjZ-1dw1;
	Sat, 06 Dec 2025 02:04:29 +0000
Date: Sat, 6 Dec 2025 10:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482] include/linux/pgplib.h:36:23: error:
 field has incomplete type 'enum pgp_key_version'
Message-ID: <202512060959.9M5bsM4J-lkp@intel.com>
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
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [3482/3482] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-randconfig-r112-20251206 (https://download.01.org/0day-ci/archive/20251206/202512060959.9M5bsM4J-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060959.9M5bsM4J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060959.9M5bsM4J-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/pgp_preload.c:19:
>> include/linux/pgplib.h:26:15: warning: declaration of 'enum pgp_packet_tag' will not be visible outside of this function [-Wvisibility]
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
>> crypto/asymmetric_keys/pgp_preload.c:63:10: warning: declaration of 'enum pgp_packet_tag' will not be visible outside of this function [-Wvisibility]
      63 |                                 enum pgp_packet_tag type, u8 headerlen,
         |                                      ^
>> crypto/asymmetric_keys/pgp_preload.c:63:25: error: variable has incomplete type 'enum pgp_packet_tag'
      63 |                                 enum pgp_packet_tag type, u8 headerlen,
         |                                                     ^
   crypto/asymmetric_keys/pgp_preload.c:63:10: note: forward declaration of 'enum pgp_packet_tag'
      63 |                                 enum pgp_packet_tag type, u8 headerlen,
         |                                      ^
>> crypto/asymmetric_keys/pgp_preload.c:107:36: error: use of undeclared identifier 'PGP_PKT_PUBLIC_KEY'
     107 |         ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY);
         |                                           ^
>> crypto/asymmetric_keys/pgp_preload.c:108:25: error: incompatible function pointer types assigning to 'int (*)(struct pgp_parse_context *, enum pgp_packet_tag, u8, const u8 *, size_t)' (aka 'int (*)(struct pgp_parse_context *, enum pgp_packet_tag, unsigned char, const unsigned char *, unsigned long)') from 'int (struct pgp_parse_context *, enum pgp_packet_tag, u8, const u8 *, size_t)' (aka 'int (struct pgp_parse_context *, enum pgp_packet_tag, unsigned char, const unsigned char *, unsigned long)') [-Wincompatible-function-pointer-types]
     108 |         ctx.pgp.process_packet = found_pgp_key;
         |                                ^ ~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_preload.c:101:12: warning: no previous prototype for function 'preload_pgp_keys' [-Wmissing-prototypes]
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
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from crypto/asymmetric_keys/pgp_public_key.c:20:
>> include/linux/pgplib.h:26:15: warning: declaration of 'enum pgp_packet_tag' will not be visible outside of this function [-Wvisibility]
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
>> crypto/asymmetric_keys/pgp_public_key.c:63:2: error: call to undeclared function 'kenter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      63 |         kenter("");
         |         ^
>> crypto/asymmetric_keys/pgp_public_key.c:65:22: error: use of undeclared identifier 'PGP_KEY_VERSION_4'
      65 |         n = (pgp->version < PGP_KEY_VERSION_4) ? 8 : 6;
         |                             ^
>> crypto/asymmetric_keys/pgp_public_key.c:67:9: error: call to undeclared function 'mpi_key_length'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      67 |                 ret = mpi_key_length(key_ptr, keylen, nb + i, nn + i);
         |                       ^
   crypto/asymmetric_keys/pgp_public_key.c:95:21: error: use of undeclared identifier 'PGP_KEY_VERSION_4'
      95 |         if (pgp->version < PGP_KEY_VERSION_4) {
         |                            ^
>> crypto/asymmetric_keys/pgp_public_key.c:115:2: error: call to undeclared function 'kleave'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     115 |         kleave(" = %d", ret);
         |         ^
   crypto/asymmetric_keys/pgp_public_key.c:134:42: error: use of undeclared identifier 'PGP_KEY_VERSION_4'
     134 |         tfm = crypto_alloc_shash(pgp->version < PGP_KEY_VERSION_4 ?
         |                                                 ^
   crypto/asymmetric_keys/pgp_public_key.c:191:2: error: call to undeclared function 'kleave'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     191 |         kleave(" = %d", ret);
         |         ^
>> crypto/asymmetric_keys/pgp_public_key.c:199:12: warning: declaration of 'enum pgp_packet_tag' will not be visible outside of this function [-Wvisibility]
     199 |                                   enum pgp_packet_tag type,
         |                                        ^
>> crypto/asymmetric_keys/pgp_public_key.c:199:27: error: variable has incomplete type 'enum pgp_packet_tag'
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
   7 warnings and 20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [m]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=m]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +36 include/linux/pgplib.h

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
