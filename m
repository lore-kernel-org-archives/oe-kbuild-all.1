Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B5F1798C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 00:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731975828; cv=none; b=gW7tIZJjT8SLEqQXxwpALh0by5ndWvMckhPVa9JBHLvMjolrOk5qQB06E/rdA0v8SCfjND75E/keYhT4beMSziiGiBEtGZeaszWvmsn/u/E311BX+iJJgEa5313YY40LRZO36e8Mt4mphfpHmVwh73VNwYyGjIA1ZwgqHbBcRyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731975828; c=relaxed/simple;
	bh=9AkHPjRYAr5NsJ0MQfXYJqtNjgsPk7fjmkyxWyguAPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAf7RS/sr9MH7CAJnIk2K3YciFYQLyIn3+SxtzwHepX8O9p+PnGBLP6pYw1khKIbszUvoYpG+6v1hxBKTDll63S3+kLeTQDN4leD9Xxfr54fhKUjVxXoWJlUUbFCC3NlWaC0bEMarxH9Iz80084SOWVoq04qoC8iIHiG2wPJWnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDSlWycJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDSlWycJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731975826; x=1763511826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9AkHPjRYAr5NsJ0MQfXYJqtNjgsPk7fjmkyxWyguAPY=;
  b=CDSlWycJciuLs9Tm2R5/+YZLDWhQnsckCkGD9CTZfu1pMBewxidG+ijS
   /SANrXmulo6p04EygHtvdpnSOmKgzaE1pyG2I52hZD0qaIAQ8PndHAz64
   eXennWLpNEP6917L5AZTZ2sJMCR8aI8zGMrZqbwXajThfLsf5pYaN0ioE
   ID2b6Qi+Pi6YlevY/PEz4nsrAU7V+4hrPkC6F6g5KU4F6yNaiNU6vhIzY
   WN3to+7b+3ieBSukkCrz2YDkPUiaOSUyLwJetb0kV503ZD9le8FnfyPBa
   upeohrulU67TwS9Tq6G2PIsYtJqlnmWEWxIAhBvEBxnhZA3nUYGQCs1qA
   Q==;
X-CSE-ConnectionGUID: 7hyiDnG0TDCuav1hF4jZfQ==
X-CSE-MsgGUID: yn3Y40l/SrGFxEabgMDM3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31804584"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31804584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:23:46 -0800
X-CSE-ConnectionGUID: Kzum0weVQhmDvgL3wvIlgw==
X-CSE-MsgGUID: bnY/zEuGTJeaGByhtSyqMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89774751"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Nov 2024 16:23:45 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDC1t-0002iH-1d;
	Tue, 19 Nov 2024 00:23:41 +0000
Date: Tue, 19 Nov 2024 08:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1484/1484] include/linux/pgplib.h:36:30: error:
 field 'version' has incomplete type
Message-ID: <202411190849.ohZKmN0Z-lkp@intel.com>
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
head:   8a039651010897592567f5751c4e706ab794e9c0
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [1484/1484] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-randconfig-074-20241119 (https://download.01.org/0day-ci/archive/20241119/202411190849.ohZKmN0Z-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190849.ohZKmN0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190849.ohZKmN0Z-lkp@intel.com/

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
