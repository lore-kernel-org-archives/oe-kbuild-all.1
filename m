Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4123D17FE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 03:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711252352; cv=none; b=Rmel6RJGOcmdoSEOfyzdlDdcEOGgwvw0ILiY7ifRRckiy9I/+45VJd86muP4wwaoaxS32o5L1GvkjXR24IAe+Y+btwCVXwAiDulQpM1Z0A2JDKNZShZjKfS0XIb1WSstwWfntLrvXJ3dvFSGyyauleftrbrcbaRR7A6bwG9v+1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711252352; c=relaxed/simple;
	bh=VZ1P34hgoC2I2hDFbbf5QY6ulvVeAWKeKvy/FTiGILU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=itP6mvu5FPwot5fMcdKxVWg4sdGH+OIdoHXpCBNkyHl3aP4GlWn3vZGHWuLzYzOo/+NN7nXodJkQIvdU+x4Vy3ABGsLDuBZ77MyalecR/68atboqLIpLNgNNcC9QwFiOm4Uy38eF2XOUJonGNfsd/bprweEoIv/VxL0kt7zRtXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTVR7v0X; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTVR7v0X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711252350; x=1742788350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VZ1P34hgoC2I2hDFbbf5QY6ulvVeAWKeKvy/FTiGILU=;
  b=KTVR7v0XOb2k7s0Y0YCauKGUz/hyoho/52h+YjSuYhQRH2K4PR7FDCRF
   Pp13IJz1y1PLv4nq5nzN78+lLOF9cf7Rxw9jmxCMhISaJh+Ne6omfzc0l
   MlkW8qcqbVLI6qXdwPnxHdJFKrm4vwRdeq9hl/N6vTNiTpvhNm2PcQtCn
   WKB1Lysd8Zuy0hnnqS+ffd73byLrnle00g1ST9wtrHfb8X+WUerN3RTdm
   R75oezIyzvCfkJ7ZuzN88KB8Kagez5oVIBWq/9/Uf1jjbz9HOOAdt4VO4
   zo8D6KtuCEdEFXFh0PhUK43fgviuf84B+JWHM6h2kzlBEjjRGvcMoJNTC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="23758105"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="23758105"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 20:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="15949464"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2024 20:52:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roEuF-000Ldz-0T;
	Sun, 24 Mar 2024 03:52:23 +0000
Date: Sun, 24 Mar 2024 11:51:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3338/6857]
 crypto/asymmetric_keys/pgp_preload.c:63:25: error: variable has incomplete
 type 'enum pgp_packet_tag'
Message-ID: <202403241144.mKTk9zUl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1b4212c630731d88b07d5b6e28ecaff1a76d3839
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [3338/6857] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-randconfig-071-20240323 (https://download.01.org/0day-ci/archive/20240324/202403241144.mKTk9zUl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241144.mKTk9zUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241144.mKTk9zUl-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/asymmetric_keys/pgp_preload.c:25:27: error: field has incomplete type 'struct pgp_parse_context'
      25 |         struct pgp_parse_context pgp;
         |                                  ^
   crypto/asymmetric_keys/pgp_preload.c:25:9: note: forward declaration of 'struct pgp_parse_context'
      25 |         struct pgp_parse_context pgp;
         |                ^
   crypto/asymmetric_keys/pgp_preload.c:63:10: warning: declaration of 'enum pgp_packet_tag' will not be visible outside of this function [-Wvisibility]
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
>> crypto/asymmetric_keys/pgp_preload.c:112:8: error: call to undeclared function 'pgp_parse_packets'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     112 |         ret = pgp_parse_packets(pgpdata, pgpdatalen, &ctx.pgp);
         |               ^
   crypto/asymmetric_keys/pgp_preload.c:101:12: warning: no previous prototype for function 'preload_pgp_keys' [-Wmissing-prototypes]
     101 | int __init preload_pgp_keys(const u8 *pgpdata, size_t pgpdatalen,
         |            ^
   crypto/asymmetric_keys/pgp_preload.c:101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     101 | int __init preload_pgp_keys(const u8 *pgpdata, size_t pgpdatalen,
         | ^
         | static 
   2 warnings and 4 errors generated.
--
   crypto/asymmetric_keys/pgp_public_key.c:37:27: error: field has incomplete type 'struct pgp_parse_context'
      37 |         struct pgp_parse_context pgp;
         |                                  ^
   crypto/asymmetric_keys/pgp_public_key.c:37:9: note: forward declaration of 'struct pgp_parse_context'
      37 |         struct pgp_parse_context pgp;
         |                ^
   crypto/asymmetric_keys/pgp_public_key.c:50:18: warning: declaration of 'struct pgp_parse_pubkey' will not be visible outside of this function [-Wvisibility]
      50 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
>> crypto/asymmetric_keys/pgp_public_key.c:63:2: error: call to undeclared function 'kenter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      63 |         kenter("");
         |         ^
   crypto/asymmetric_keys/pgp_public_key.c:65:10: error: incomplete definition of type 'struct pgp_parse_pubkey'
      65 |         n = (pgp->version < PGP_KEY_VERSION_4) ? 8 : 6;
         |              ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:50:18: note: forward declaration of 'struct pgp_parse_pubkey'
      50 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
>> crypto/asymmetric_keys/pgp_public_key.c:65:22: error: use of undeclared identifier 'PGP_KEY_VERSION_4'
      65 |         n = (pgp->version < PGP_KEY_VERSION_4) ? 8 : 6;
         |                             ^
>> crypto/asymmetric_keys/pgp_public_key.c:67:9: error: call to undeclared function 'mpi_key_length'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      67 |                 ret = mpi_key_length(key_ptr, keylen, nb + i, nn + i);
         |                       ^
   crypto/asymmetric_keys/pgp_public_key.c:87:25: error: incomplete definition of type 'struct pgp_parse_pubkey'
      87 |         digest_putc(digest, pgp->version);
         |                             ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:50:18: note: forward declaration of 'struct pgp_parse_pubkey'
      50 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:89:11: error: incomplete definition of type 'struct pgp_parse_pubkey'
      89 |         a32 = pgp->creation_time;
         |               ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:50:18: note: forward declaration of 'struct pgp_parse_pubkey'
      50 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:95:9: error: incomplete definition of type 'struct pgp_parse_pubkey'
      95 |         if (pgp->version < PGP_KEY_VERSION_4) {
         |             ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:50:18: note: forward declaration of 'struct pgp_parse_pubkey'
      50 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:95:21: error: use of undeclared identifier 'PGP_KEY_VERSION_4'
      95 |         if (pgp->version < PGP_KEY_VERSION_4) {
         |                            ^
   crypto/asymmetric_keys/pgp_public_key.c:98:10: error: incomplete definition of type 'struct pgp_parse_pubkey'
      98 |                 if (pgp->expires_at)
         |                     ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:50:18: note: forward declaration of 'struct pgp_parse_pubkey'
      50 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:99:14: error: incomplete definition of type 'struct pgp_parse_pubkey'
      99 |                         a16 = (pgp->expires_at - pgp->creation_time) / 86400UL;
         |                                ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:50:18: note: forward declaration of 'struct pgp_parse_pubkey'
      50 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:99:32: error: incomplete definition of type 'struct pgp_parse_pubkey'
      99 |                         a16 = (pgp->expires_at - pgp->creation_time) / 86400UL;
         |                                                  ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:50:18: note: forward declaration of 'struct pgp_parse_pubkey'
      50 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:106:25: error: incomplete definition of type 'struct pgp_parse_pubkey'
     106 |         digest_putc(digest, pgp->pubkey_algo);
         |                             ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:50:18: note: forward declaration of 'struct pgp_parse_pubkey'
      50 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
>> crypto/asymmetric_keys/pgp_public_key.c:115:2: error: call to undeclared function 'kleave'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     115 |         kleave(" = %d", ret);
         |         ^
   crypto/asymmetric_keys/pgp_public_key.c:123:16: warning: declaration of 'struct pgp_parse_pubkey' will not be visible outside of this function [-Wvisibility]
     123 |                                     struct pgp_parse_pubkey *pgp,
         |                                            ^
   crypto/asymmetric_keys/pgp_public_key.c:134:30: error: incomplete definition of type 'struct pgp_parse_pubkey'
     134 |         tfm = crypto_alloc_shash(pgp->version < PGP_KEY_VERSION_4 ?
         |                                  ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:123:16: note: forward declaration of 'struct pgp_parse_pubkey'
     123 |                                     struct pgp_parse_pubkey *pgp,
         |                                            ^
   crypto/asymmetric_keys/pgp_public_key.c:134:42: error: use of undeclared identifier 'PGP_KEY_VERSION_4'
     134 |         tfm = crypto_alloc_shash(pgp->version < PGP_KEY_VERSION_4 ?
         |                                                 ^
   crypto/asymmetric_keys/pgp_public_key.c:150:36: error: incompatible pointer types passing 'struct pgp_parse_pubkey *' to parameter of type 'struct pgp_parse_pubkey *' [-Werror,-Wincompatible-pointer-types]
     150 |         ret = pgp_calc_pkey_keyid(digest, pgp, pub);
         |                                           ^~~
   crypto/asymmetric_keys/pgp_public_key.c:50:36: note: passing argument to parameter 'pgp' here
      50 |                                struct pgp_parse_pubkey *pgp,
         |                                                         ^
   crypto/asymmetric_keys/pgp_public_key.c:191:2: error: call to undeclared function 'kleave'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     191 |         kleave(" = %d", ret);
         |         ^
   crypto/asymmetric_keys/pgp_public_key.c:199:12: warning: declaration of 'enum pgp_packet_tag' will not be visible outside of this function [-Wvisibility]
     199 |                                   enum pgp_packet_tag type,
         |                                        ^
>> crypto/asymmetric_keys/pgp_public_key.c:199:27: error: variable has incomplete type 'enum pgp_packet_tag'
     199 |                                   enum pgp_packet_tag type,
         |                                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:199:12: note: forward declaration of 'enum pgp_packet_tag'
     199 |                                   enum pgp_packet_tag type,
         |                                        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   3 warnings and 20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]
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
   101	int __init preload_pgp_keys(const u8 *pgpdata, size_t pgpdatalen,
   102				    struct key *keyring)
   103	{
   104		struct preload_pgp_keys_context ctx;
   105		int ret;
   106	
 > 107		ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY);
   108		ctx.pgp.process_packet = found_pgp_key;
   109		ctx.keyring = make_key_ref(keyring, 1);
   110		ctx.found_key = false;
   111	
 > 112		ret = pgp_parse_packets(pgpdata, pgpdatalen, &ctx.pgp);
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
