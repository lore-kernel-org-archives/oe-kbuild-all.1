Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104252C15B7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 21:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762204150; cv=none; b=rULweMP4GSUJCYuBpNslPgpd6m4YcL3LqLGWa4219aGzVV+uliUqwCViN+orBwwLNYEa95AuB1Et4Ru0No4YsG4OOwOpG6gKEpYMNM0f4F+hut/wjw7Ps8dX3nNveONADGpmrEkTcQ+zYWwDRCMdggJHPCmHgM9NJf6NO2sot3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762204150; c=relaxed/simple;
	bh=4+pHb6YEkUYuy5W3xDp2Knj0gj5GXE55Em6AUax/DCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F28za+b4fZ8qNTEWy3tW0CHzTc61VkBPt+71WWo06LSmBlnCILWPdOtdyXiVpOu38/ivyZg4POPusFsC55wAkG3b7V3WlDI8cDT1C5ePzbjfgTRtLq0RwqllmbXP8sH81D4itZ/VZ6C65IU7/7++zRS4VPEzaXUSgjA1Ae9KqFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CM4fkS1d; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CM4fkS1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762204147; x=1793740147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+pHb6YEkUYuy5W3xDp2Knj0gj5GXE55Em6AUax/DCg=;
  b=CM4fkS1dBiblZBf39QzlCSU0UAz5o7kc3Y4prJfYtyIDD+IqCfU/qiCs
   0lsSecUb+usPaf5F5S18gs3CDJD9hg2vQ9L5aNQVRc80t8YgHbdazKSe3
   M75TnmSL/w0h1PpFf7mW3Cz0y5y2HpT3TZZi5+cWko4d1T1WKWV4OQyo9
   BKPFgGyPaoJBtf2C4UxTozqlpMWNMW29ieE0nH8EuZ4NrN4uupUJ5cUa/
   yHRMbJ1l9Yy3Yr6ctwfbENTLI0lOnaMQ/EbbxIqKORbwPOey/pMp24+7M
   grwBpb6QX42lf6xamS88cQr0PL9fNXJ8IELWWYJQEy0H9QnJdRuX6l+28
   A==;
X-CSE-ConnectionGUID: ulEt2MoaRqqgmT1q5iVsnA==
X-CSE-MsgGUID: Dgr6Q0fiRM+xRuVT+UUFMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81698752"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="81698752"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 13:09:05 -0800
X-CSE-ConnectionGUID: d3/dEfb7QMKp96u3SDaOPQ==
X-CSE-MsgGUID: mmolxgdsTgi4eXmax3Ndaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="224220691"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2025 13:09:03 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG1nQ-000QYa-3D;
	Mon, 03 Nov 2025 21:09:01 +0000
Date: Tue, 4 Nov 2025 05:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098]
 crypto/asymmetric_keys/pgp_preload.c:63:38: warning: 'enum pgp_packet_tag'
 declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202511040423.NnaZjkS6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a29fc03bd0ddaf7388cf31604ef5bd9807585109
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [3098/3098] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-randconfig-003-20251104 (https://download.01.org/0day-ci/archive/20251104/202511040423.NnaZjkS6-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040423.NnaZjkS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040423.NnaZjkS6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/asymmetric_keys/pgp_preload.c:25:34: error: field 'pgp' has incomplete type
      25 |         struct pgp_parse_context pgp;
         |                                  ^~~
>> crypto/asymmetric_keys/pgp_preload.c:63:38: warning: 'enum pgp_packet_tag' declared inside parameter list will not be visible outside of this definition or declaration
      63 |                                 enum pgp_packet_tag type, u8 headerlen,
         |                                      ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_preload.c:63:53: error: parameter 2 ('type') has incomplete type
      63 |                                 enum pgp_packet_tag type, u8 headerlen,
         |                                 ~~~~~~~~~~~~~~~~~~~~^~~~
   crypto/asymmetric_keys/pgp_preload.c:62:19: error: function declaration isn't a prototype [-Werror=strict-prototypes]
      62 | static int __init found_pgp_key(struct pgp_parse_context *context,
         |                   ^~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from crypto/asymmetric_keys/pgp_preload.c:17:
   crypto/asymmetric_keys/pgp_preload.c: In function 'found_pgp_key':
   include/linux/compiler_types.h:374:27: error: expression in static assertion is not an integer
     374 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   crypto/asymmetric_keys/pgp_preload.c:67:17: note: in expansion of macro 'container_of'
      67 |                 container_of(context, struct preload_pgp_keys_context, pgp);
         |                 ^~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_preload.c: At top level:
>> crypto/asymmetric_keys/pgp_preload.c:101:12: warning: no previous prototype for 'preload_pgp_keys' [-Wmissing-prototypes]
     101 | int __init preload_pgp_keys(const u8 *pgpdata, size_t pgpdatalen,
         |            ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_preload.c: In function 'preload_pgp_keys':
   crypto/asymmetric_keys/pgp_preload.c:107:43: error: 'PGP_PKT_PUBLIC_KEY' undeclared (first use in this function)
     107 |         ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY);
         |                                           ^~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_preload.c:107:43: note: each undeclared identifier is reported only once for each function it appears in
   crypto/asymmetric_keys/pgp_preload.c:112:15: error: implicit declaration of function 'pgp_parse_packets' [-Werror=implicit-function-declaration]
     112 |         ret = pgp_parse_packets(pgpdata, pgpdatalen, &ctx.pgp);
         |               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   crypto/asymmetric_keys/pgp_public_key.c:37:34: error: field 'pgp' has incomplete type
      37 |         struct pgp_parse_context pgp;
         |                                  ^~~
>> crypto/asymmetric_keys/pgp_public_key.c:50:39: warning: 'struct pgp_parse_pubkey' declared inside parameter list will not be visible outside of this definition or declaration
      50 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_calc_pkey_keyid':
   crypto/asymmetric_keys/pgp_public_key.c:63:9: error: implicit declaration of function 'kenter' [-Werror=implicit-function-declaration]
      63 |         kenter("");
         |         ^~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:65:17: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      65 |         n = (pgp->version < PGP_KEY_VERSION_4) ? 8 : 6;
         |                 ^~
   crypto/asymmetric_keys/pgp_public_key.c:65:29: error: 'PGP_KEY_VERSION_4' undeclared (first use in this function)
      65 |         n = (pgp->version < PGP_KEY_VERSION_4) ? 8 : 6;
         |                             ^~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:65:29: note: each undeclared identifier is reported only once for each function it appears in
   crypto/asymmetric_keys/pgp_public_key.c:67:23: error: implicit declaration of function 'mpi_key_length' [-Werror=implicit-function-declaration]
      67 |                 ret = mpi_key_length(key_ptr, keylen, nb + i, nn + i);
         |                       ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:87:32: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      87 |         digest_putc(digest, pgp->version);
         |                                ^~
   crypto/asymmetric_keys/pgp_public_key.c:89:18: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      89 |         a32 = pgp->creation_time;
         |                  ^~
   crypto/asymmetric_keys/pgp_public_key.c:95:16: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      95 |         if (pgp->version < PGP_KEY_VERSION_4) {
         |                ^~
   crypto/asymmetric_keys/pgp_public_key.c:98:24: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      98 |                 if (pgp->expires_at)
         |                        ^~
   crypto/asymmetric_keys/pgp_public_key.c:99:35: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      99 |                         a16 = (pgp->expires_at - pgp->creation_time) / 86400UL;
         |                                   ^~
   crypto/asymmetric_keys/pgp_public_key.c:99:53: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      99 |                         a16 = (pgp->expires_at - pgp->creation_time) / 86400UL;
         |                                                     ^~
   crypto/asymmetric_keys/pgp_public_key.c:106:32: error: invalid use of undefined type 'struct pgp_parse_pubkey'
     106 |         digest_putc(digest, pgp->pubkey_algo);
         |                                ^~
   crypto/asymmetric_keys/pgp_public_key.c:115:9: error: implicit declaration of function 'kleave' [-Werror=implicit-function-declaration]
     115 |         kleave(" = %d", ret);
         |         ^~~~~~
   crypto/asymmetric_keys/pgp_public_key.c: At top level:
   crypto/asymmetric_keys/pgp_public_key.c:123:44: warning: 'struct pgp_parse_pubkey' declared inside parameter list will not be visible outside of this definition or declaration
     123 |                                     struct pgp_parse_pubkey *pgp,
         |                                            ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_generate_fingerprint':
   crypto/asymmetric_keys/pgp_public_key.c:134:37: error: invalid use of undefined type 'struct pgp_parse_pubkey'
     134 |         tfm = crypto_alloc_shash(pgp->version < PGP_KEY_VERSION_4 ?
         |                                     ^~
   crypto/asymmetric_keys/pgp_public_key.c:134:49: error: 'PGP_KEY_VERSION_4' undeclared (first use in this function)
     134 |         tfm = crypto_alloc_shash(pgp->version < PGP_KEY_VERSION_4 ?
         |                                                 ^~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:150:43: error: passing argument 2 of 'pgp_calc_pkey_keyid' from incompatible pointer type [-Werror=incompatible-pointer-types]
     150 |         ret = pgp_calc_pkey_keyid(digest, pgp, pub);
         |                                           ^~~
         |                                           |
         |                                           struct pgp_parse_pubkey *
   crypto/asymmetric_keys/pgp_public_key.c:50:57: note: expected 'struct pgp_parse_pubkey *' but argument is of type 'struct pgp_parse_pubkey *'
      50 |                                struct pgp_parse_pubkey *pgp,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   crypto/asymmetric_keys/pgp_public_key.c: At top level:
>> crypto/asymmetric_keys/pgp_public_key.c:199:40: warning: 'enum pgp_packet_tag' declared inside parameter list will not be visible outside of this definition or declaration
     199 |                                   enum pgp_packet_tag type,
         |                                        ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:199:55: error: parameter 2 ('type') has incomplete type
     199 |                                   enum pgp_packet_tag type,
         |                                   ~~~~~~~~~~~~~~~~~~~~^~~~
   crypto/asymmetric_keys/pgp_public_key.c:198:12: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     198 | static int pgp_process_public_key(struct pgp_parse_context *context,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from crypto/asymmetric_keys/pgp_public_key.c:16:
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_process_public_key':
   include/linux/compiler_types.h:374:27: error: expression in static assertion is not an integer
     374 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:206:17: note: in expansion of macro 'container_of'
     206 |                 container_of(context, struct pgp_key_data_parse_context, pgp);
         |                 ^~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:207:33: error: storage size of 'pgp' isn't known
     207 |         struct pgp_parse_pubkey pgp;
         |                                 ^~~
   crypto/asymmetric_keys/pgp_public_key.c:213:21: error: 'PGP_PKT_USER_ID' undeclared (first use in this function)
     213 |         if (type == PGP_PKT_USER_ID) {
         |                     ^~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:230:15: error: implicit declaration of function 'pgp_parse_public_key'; did you mean 'pgp_process_public_key'? [-Werror=implicit-function-declaration]
     230 |         ret = pgp_parse_public_key(&data, &datalen, &pgp);
         |               ^~~~~~~~~~~~~~~~~~~~
         |               pgp_process_public_key
   crypto/asymmetric_keys/pgp_public_key.c:234:32: error: 'PGP_PUBKEY__LAST' undeclared (first use in this function)
     234 |         if (pgp.pubkey_algo >= PGP_PUBKEY__LAST)
         |                                ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:236:16: error: 'pgp_to_public_key_algo' undeclared (first use in this function)
     236 |         algo = pgp_to_public_key_algo[pgp.pubkey_algo];
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/pgp_public_key.c:207:33: warning: unused variable 'pgp' [-Wunused-variable]
     207 |         struct pgp_parse_pubkey pgp;
         |                                 ^~~
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_key_parse':
   crypto/asymmetric_keys/pgp_public_key.c:313:43: error: 'PGP_PKT_PUBLIC_KEY' undeclared (first use in this function)
     313 |         ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY) |
         |                                           ^~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:314:43: error: 'PGP_PKT_USER_ID' undeclared (first use in this function)
     314 |                                     (1 << PGP_PKT_USER_ID);
         |                                           ^~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c:317:15: error: implicit declaration of function 'pgp_parse_packets' [-Werror=implicit-function-declaration]
     317 |         ret = pgp_parse_packets(prep->data, prep->datalen, &ctx.pgp);
         |               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +63 crypto/asymmetric_keys/pgp_preload.c

    58	
    59	/*
    60	 * Extract a public key or subkey from the PGP stream.
    61	 */
    62	static int __init found_pgp_key(struct pgp_parse_context *context,
  > 63					enum pgp_packet_tag type, u8 headerlen,
    64					const u8 *data, size_t datalen)
    65	{
    66		struct preload_pgp_keys_context *ctx =
    67			container_of(context, struct preload_pgp_keys_context, pgp);
    68		int ret;
    69	
    70		if (ctx->found_key) {
    71			ctx->key_end = data - headerlen;
    72			ret = create_pgp_key(ctx);
    73			if (ret < 0)
    74				return ret;
    75		}
    76	
    77		ctx->key_start = data - headerlen;
    78		ctx->found_key = true;
    79		return 0;
    80	}
    81	
    82	/**
    83	 * preload_pgp_keys - Load keys from a PGP keyring blob
    84	 * @pgpdata: The PGP keyring blob containing the keys.
    85	 * @pgpdatalen: The size of the @pgpdata blob.
    86	 * @keyring: The keyring to add the new keys to.
    87	 *
    88	 * Preload a pack of keys from a PGP keyring blob.
    89	 *
    90	 * The keys have their descriptions generated from the user ID and fingerprint
    91	 * in the PGP stream.  Since keys can be matched on their key IDs independently
    92	 * of the key description, the description is mostly irrelevant apart from the
    93	 * fact that keys of the same description displace one another from a keyring.
    94	 *
    95	 * The caller should override the current creds if they want the keys to be
    96	 * owned by someone other than the current process's owner.  Keys will not be
    97	 * accounted towards the owner's quota.
    98	 *
    99	 * This function may only be called whilst the kernel is booting.
   100	 */
 > 101	int __init preload_pgp_keys(const u8 *pgpdata, size_t pgpdatalen,
   102				    struct key *keyring)
   103	{
   104		struct preload_pgp_keys_context ctx;
   105		int ret;
   106	
   107		ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY);
   108		ctx.pgp.process_packet = found_pgp_key;
   109		ctx.keyring = make_key_ref(keyring, 1);
   110		ctx.found_key = false;
   111	
   112		ret = pgp_parse_packets(pgpdata, pgpdatalen, &ctx.pgp);
   113		if (ret < 0)
   114			return ret;
   115	
   116		if (ctx.found_key) {
   117			ctx.key_end = pgpdata + pgpdatalen;
   118			return create_pgp_key(&ctx);
   119		}
   120		return 0;
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
