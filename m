Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5CDB67A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 04:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711254152; cv=none; b=TuJRr1OhkxUnhuas+xHsef2UpWV711EGf148HtzJvqPYum2b8IV3q0Es+AI96eGNyyFqbv3UpSg+gRSjcMCYK4BR2z9D3AzO/LDk7YaNqj3MSK8C+aZFCnRG454qm7F48oi1uEfpxm/oynCxbPUbOFxgu4nkpk8rnU1ZuOpTqiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711254152; c=relaxed/simple;
	bh=5P6VwZKrVL8jslCk19DTPwkKi1xKFVh8SwVVfa0Rg7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HerJg78IcbWzSm5MLv1CZOLKF8H7IlkN0TA2J0wxMBmqdcwWFfp42SVcNzbX0Rjbz1ShxDn+6o3tdir2CVAAj1LAAy/97VCDv0peSPobBXyMXSknrgwB2ae+2MeMO3s2Z1VLAxLGo2TqnkIOtgrchfephzdWoWMHPazWkVaPCbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFOHH6sm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFOHH6sm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711254148; x=1742790148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5P6VwZKrVL8jslCk19DTPwkKi1xKFVh8SwVVfa0Rg7s=;
  b=CFOHH6smW+B+6DFEuv3oS+ksMAeAomGAv3G209EXrUdJ+wHj35TNWI7k
   wPpxdv4Fd5MZc/I39g9Pvhyt15kxH6haFRziccJjf7On2DOMVVLmXIWfs
   AUbfTvsaOHsDh3PBCMYQcLMxY1Z3YIgAmSZG8EIwW5uhST5NNdtMWUMcD
   rFe1dVNYe4smS8SGWGyrjJJGMn8WyO2riF4S6791o99IFevqJxtwVFFIj
   +2+CY9ALEA+4S0R2lVY+7fVhT0qeUv1txU5pShtjNLICHvkNnMYuoPZa3
   t2itItACAdpLGd3wJPvpaaahL69zjqU67FL/nSauE6mw+zZCP0kcNltOw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6398065"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="6398065"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 21:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="38397123"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Mar 2024 21:22:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roFNH-000Lf1-2R;
	Sun, 24 Mar 2024 04:22:23 +0000
Date: Sun, 24 Mar 2024 12:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 56/30000]
 crypto/asymmetric_keys/pgp_public_key.c:310:15: error: implicit declaration
 of function 'pgp_parse_packets'
Message-ID: <202403241216.myVe6NZX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b670dd901cbbf97745380d373b1d2607b3235590
commit: c283657144c1475e571f0c1f34477af1f682a12f [56/30000] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-buildonly-randconfig-001-20240324 (https://download.01.org/0day-ci/archive/20240324/202403241216.myVe6NZX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241216.myVe6NZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241216.myVe6NZX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> crypto/asymmetric_keys/pgp_public_key.c:35:34: error: field 'pgp' has incomplete type
      35 |         struct pgp_parse_context pgp;
         |                                  ^~~
>> crypto/asymmetric_keys/pgp_public_key.c:48:39: warning: 'struct pgp_parse_pubkey' declared inside parameter list will not be visible outside of this definition or declaration
      48 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_calc_pkey_keyid':
>> crypto/asymmetric_keys/pgp_public_key.c:63:17: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      63 |         n = (pgp->version < PGP_KEY_VERSION_4) ? 8 : 6;
         |                 ^~
   crypto/asymmetric_keys/pgp_public_key.c:85:32: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      85 |         digest_putc(digest, pgp->version);
         |                                ^~
   crypto/asymmetric_keys/pgp_public_key.c:87:18: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      87 |         a32 = pgp->creation_time;
         |                  ^~
   crypto/asymmetric_keys/pgp_public_key.c:93:16: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      93 |         if (pgp->version < PGP_KEY_VERSION_4) {
         |                ^~
   crypto/asymmetric_keys/pgp_public_key.c:96:24: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      96 |                 if (pgp->expires_at)
         |                        ^~
   crypto/asymmetric_keys/pgp_public_key.c:97:35: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      97 |                         a16 = (pgp->expires_at - pgp->creation_time) / 86400UL;
         |                                   ^~
   crypto/asymmetric_keys/pgp_public_key.c:97:53: error: invalid use of undefined type 'struct pgp_parse_pubkey'
      97 |                         a16 = (pgp->expires_at - pgp->creation_time) / 86400UL;
         |                                                     ^~
   crypto/asymmetric_keys/pgp_public_key.c:104:32: error: invalid use of undefined type 'struct pgp_parse_pubkey'
     104 |         digest_putc(digest, pgp->pubkey_algo);
         |                                ^~
   crypto/asymmetric_keys/pgp_public_key.c: At top level:
   crypto/asymmetric_keys/pgp_public_key.c:121:44: warning: 'struct pgp_parse_pubkey' declared inside parameter list will not be visible outside of this definition or declaration
     121 |                                     struct pgp_parse_pubkey *pgp,
         |                                            ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_generate_fingerprint':
   crypto/asymmetric_keys/pgp_public_key.c:132:37: error: invalid use of undefined type 'struct pgp_parse_pubkey'
     132 |         tfm = crypto_alloc_shash(pgp->version < PGP_KEY_VERSION_4 ?
         |                                     ^~
>> crypto/asymmetric_keys/pgp_public_key.c:148:43: error: passing argument 2 of 'pgp_calc_pkey_keyid' from incompatible pointer type [-Werror=incompatible-pointer-types]
     148 |         ret = pgp_calc_pkey_keyid(digest, pgp, pub);
         |                                           ^~~
         |                                           |
         |                                           struct pgp_parse_pubkey *
   crypto/asymmetric_keys/pgp_public_key.c:48:57: note: expected 'struct pgp_parse_pubkey *' but argument is of type 'struct pgp_parse_pubkey *'
      48 |                                struct pgp_parse_pubkey *pgp,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_process_public_key':
>> crypto/asymmetric_keys/pgp_public_key.c:201:33: error: storage size of 'pgp' isn't known
     201 |         struct pgp_parse_pubkey pgp;
         |                                 ^~~
>> crypto/asymmetric_keys/pgp_public_key.c:224:15: error: implicit declaration of function 'pgp_parse_public_key'; did you mean 'pgp_process_public_key'? [-Werror=implicit-function-declaration]
     224 |         ret = pgp_parse_public_key(&data, &datalen, &pgp);
         |               ^~~~~~~~~~~~~~~~~~~~
         |               pgp_process_public_key
>> crypto/asymmetric_keys/pgp_public_key.c:201:33: warning: unused variable 'pgp' [-Wunused-variable]
     201 |         struct pgp_parse_pubkey pgp;
         |                                 ^~~
   crypto/asymmetric_keys/pgp_public_key.c: In function 'pgp_key_parse':
>> crypto/asymmetric_keys/pgp_public_key.c:310:15: error: implicit declaration of function 'pgp_parse_packets' [-Werror=implicit-function-declaration]
     310 |         ret = pgp_parse_packets(prep->data, prep->datalen, &ctx.pgp);
         |               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> crypto/asymmetric_keys/pgp_preload.c:23:34: error: field 'pgp' has incomplete type
      23 |         struct pgp_parse_context pgp;
         |                                  ^~~
   crypto/asymmetric_keys/pgp_preload.c: In function 'preload_pgp_keys':
>> crypto/asymmetric_keys/pgp_preload.c:110:15: error: implicit declaration of function 'pgp_parse_packets' [-Werror=implicit-function-declaration]
     110 |         ret = pgp_parse_packets(pgpdata, pgpdatalen, &ctx.pgp);
         |               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/pgp_parse_packets +310 crypto/asymmetric_keys/pgp_public_key.c

4006f47d4e2171 Roberto Sassu 2021-03-03  116  
4006f47d4e2171 Roberto Sassu 2021-03-03  117  /*
4006f47d4e2171 Roberto Sassu 2021-03-03  118   * Calculate the public key ID fingerprint
4006f47d4e2171 Roberto Sassu 2021-03-03  119   */
4006f47d4e2171 Roberto Sassu 2021-03-03  120  static int pgp_generate_fingerprint(struct pgp_key_data_parse_context *ctx,
4006f47d4e2171 Roberto Sassu 2021-03-03  121  				    struct pgp_parse_pubkey *pgp,
4006f47d4e2171 Roberto Sassu 2021-03-03  122  				    struct public_key *pub)
4006f47d4e2171 Roberto Sassu 2021-03-03  123  {
4006f47d4e2171 Roberto Sassu 2021-03-03  124  	struct crypto_shash *tfm;
4006f47d4e2171 Roberto Sassu 2021-03-03  125  	struct shash_desc *digest;
4006f47d4e2171 Roberto Sassu 2021-03-03  126  	char *fingerprint;
4006f47d4e2171 Roberto Sassu 2021-03-03  127  	u8 *raw_fingerprint;
4006f47d4e2171 Roberto Sassu 2021-03-03  128  	int digest_size, offset;
4006f47d4e2171 Roberto Sassu 2021-03-03  129  	int ret, i;
4006f47d4e2171 Roberto Sassu 2021-03-03  130  
4006f47d4e2171 Roberto Sassu 2021-03-03  131  	ret = -ENOMEM;
4006f47d4e2171 Roberto Sassu 2021-03-03  132  	tfm = crypto_alloc_shash(pgp->version < PGP_KEY_VERSION_4 ?
4006f47d4e2171 Roberto Sassu 2021-03-03  133  				 "md5" : "sha1", 0, 0);
4006f47d4e2171 Roberto Sassu 2021-03-03  134  	if (!tfm)
4006f47d4e2171 Roberto Sassu 2021-03-03  135  		goto cleanup;
4006f47d4e2171 Roberto Sassu 2021-03-03  136  
4006f47d4e2171 Roberto Sassu 2021-03-03  137  	digest = kmalloc(sizeof(*digest) + crypto_shash_descsize(tfm),
4006f47d4e2171 Roberto Sassu 2021-03-03  138  			 GFP_KERNEL);
4006f47d4e2171 Roberto Sassu 2021-03-03  139  	if (!digest)
4006f47d4e2171 Roberto Sassu 2021-03-03  140  		goto cleanup_tfm;
4006f47d4e2171 Roberto Sassu 2021-03-03  141  
4006f47d4e2171 Roberto Sassu 2021-03-03  142  	digest->tfm = tfm;
4006f47d4e2171 Roberto Sassu 2021-03-03  143  	crypto_shash_set_flags(digest->tfm, CRYPTO_TFM_REQ_MAY_SLEEP);
4006f47d4e2171 Roberto Sassu 2021-03-03  144  	ret = crypto_shash_init(digest);
4006f47d4e2171 Roberto Sassu 2021-03-03  145  	if (ret < 0)
4006f47d4e2171 Roberto Sassu 2021-03-03  146  		goto cleanup_hash;
4006f47d4e2171 Roberto Sassu 2021-03-03  147  
4006f47d4e2171 Roberto Sassu 2021-03-03 @148  	ret = pgp_calc_pkey_keyid(digest, pgp, pub);
4006f47d4e2171 Roberto Sassu 2021-03-03  149  	if (ret < 0)
4006f47d4e2171 Roberto Sassu 2021-03-03  150  		goto cleanup_hash;
4006f47d4e2171 Roberto Sassu 2021-03-03  151  
4006f47d4e2171 Roberto Sassu 2021-03-03  152  	digest_size = crypto_shash_digestsize(tfm);
4006f47d4e2171 Roberto Sassu 2021-03-03  153  
4006f47d4e2171 Roberto Sassu 2021-03-03  154  	raw_fingerprint = kmalloc(digest_size, GFP_KERNEL);
4006f47d4e2171 Roberto Sassu 2021-03-03  155  	if (!raw_fingerprint)
4006f47d4e2171 Roberto Sassu 2021-03-03  156  		goto cleanup_hash;
4006f47d4e2171 Roberto Sassu 2021-03-03  157  
4006f47d4e2171 Roberto Sassu 2021-03-03  158  	ret = crypto_shash_final(digest, raw_fingerprint);
4006f47d4e2171 Roberto Sassu 2021-03-03  159  	if (ret < 0)
4006f47d4e2171 Roberto Sassu 2021-03-03  160  		goto cleanup_raw_fingerprint;
4006f47d4e2171 Roberto Sassu 2021-03-03  161  
a98cb7a4b757b7 David Howells 2021-03-03  162  	ctx->fingerprint_len = digest_size * 2;
4006f47d4e2171 Roberto Sassu 2021-03-03  163  	fingerprint = kmalloc(digest_size * 2 + 1, GFP_KERNEL);
4006f47d4e2171 Roberto Sassu 2021-03-03  164  	if (!fingerprint)
4006f47d4e2171 Roberto Sassu 2021-03-03  165  		goto cleanup_raw_fingerprint;
4006f47d4e2171 Roberto Sassu 2021-03-03  166  
4006f47d4e2171 Roberto Sassu 2021-03-03  167  	offset = digest_size - 8;
4006f47d4e2171 Roberto Sassu 2021-03-03  168  	pr_debug("offset %u/%u\n", offset, digest_size);
4006f47d4e2171 Roberto Sassu 2021-03-03  169  
4006f47d4e2171 Roberto Sassu 2021-03-03  170  	for (i = 0; i < digest_size; i++)
4006f47d4e2171 Roberto Sassu 2021-03-03  171  		sprintf(fingerprint + i * 2, "%02x", raw_fingerprint[i]);
4006f47d4e2171 Roberto Sassu 2021-03-03  172  	pr_debug("fingerprint %s\n", fingerprint);
4006f47d4e2171 Roberto Sassu 2021-03-03  173  
4006f47d4e2171 Roberto Sassu 2021-03-03  174  	ctx->raw_fingerprint = raw_fingerprint;
4006f47d4e2171 Roberto Sassu 2021-03-03  175  	ctx->fingerprint = fingerprint;
4006f47d4e2171 Roberto Sassu 2021-03-03  176  	ret = 0;
4006f47d4e2171 Roberto Sassu 2021-03-03  177  cleanup_raw_fingerprint:
4006f47d4e2171 Roberto Sassu 2021-03-03  178  	if (ret < 0)
4006f47d4e2171 Roberto Sassu 2021-03-03  179  		kfree(raw_fingerprint);
4006f47d4e2171 Roberto Sassu 2021-03-03  180  cleanup_hash:
4006f47d4e2171 Roberto Sassu 2021-03-03  181  	kfree(digest);
4006f47d4e2171 Roberto Sassu 2021-03-03  182  cleanup_tfm:
4006f47d4e2171 Roberto Sassu 2021-03-03  183  	crypto_free_shash(tfm);
4006f47d4e2171 Roberto Sassu 2021-03-03  184  cleanup:
4006f47d4e2171 Roberto Sassu 2021-03-03  185  	kleave(" = %d", ret);
4006f47d4e2171 Roberto Sassu 2021-03-03  186  	return ret;
4006f47d4e2171 Roberto Sassu 2021-03-03  187  }
4006f47d4e2171 Roberto Sassu 2021-03-03  188  
4006f47d4e2171 Roberto Sassu 2021-03-03  189  /*
4006f47d4e2171 Roberto Sassu 2021-03-03  190   * Extract a public key or public subkey from the PGP stream.
4006f47d4e2171 Roberto Sassu 2021-03-03  191   */
4006f47d4e2171 Roberto Sassu 2021-03-03  192  static int pgp_process_public_key(struct pgp_parse_context *context,
4006f47d4e2171 Roberto Sassu 2021-03-03  193  				  enum pgp_packet_tag type,
4006f47d4e2171 Roberto Sassu 2021-03-03  194  				  u8 headerlen,
4006f47d4e2171 Roberto Sassu 2021-03-03  195  				  const u8 *data,
4006f47d4e2171 Roberto Sassu 2021-03-03  196  				  size_t datalen)
4006f47d4e2171 Roberto Sassu 2021-03-03  197  {
4006f47d4e2171 Roberto Sassu 2021-03-03  198  	const char *algo;
4006f47d4e2171 Roberto Sassu 2021-03-03  199  	struct pgp_key_data_parse_context *ctx =
4006f47d4e2171 Roberto Sassu 2021-03-03  200  		container_of(context, struct pgp_key_data_parse_context, pgp);
4006f47d4e2171 Roberto Sassu 2021-03-03 @201  	struct pgp_parse_pubkey pgp;
4006f47d4e2171 Roberto Sassu 2021-03-03  202  	struct public_key *pub;
4006f47d4e2171 Roberto Sassu 2021-03-03  203  	int ret;
4006f47d4e2171 Roberto Sassu 2021-03-03  204  
4006f47d4e2171 Roberto Sassu 2021-03-03  205  	kenter(",%u,%u,,%zu", type, headerlen, datalen);
4006f47d4e2171 Roberto Sassu 2021-03-03  206  
a98cb7a4b757b7 David Howells 2021-03-03  207  	if (type == PGP_PKT_USER_ID) {
a98cb7a4b757b7 David Howells 2021-03-03  208  		ctx->user_id = data;
a98cb7a4b757b7 David Howells 2021-03-03  209  		ctx->user_id_len = datalen;
a98cb7a4b757b7 David Howells 2021-03-03  210  		kleave(" = 0 [user ID]");
a98cb7a4b757b7 David Howells 2021-03-03  211  		return 0;
a98cb7a4b757b7 David Howells 2021-03-03  212  	}
a98cb7a4b757b7 David Howells 2021-03-03  213  
4006f47d4e2171 Roberto Sassu 2021-03-03  214  	if (ctx->fingerprint) {
4006f47d4e2171 Roberto Sassu 2021-03-03  215  		kleave(" = -ENOKEY [already]");
4006f47d4e2171 Roberto Sassu 2021-03-03  216  		return -EBADMSG;
4006f47d4e2171 Roberto Sassu 2021-03-03  217  	}
4006f47d4e2171 Roberto Sassu 2021-03-03  218  
4006f47d4e2171 Roberto Sassu 2021-03-03  219  	pub = kzalloc(sizeof(struct public_key), GFP_KERNEL);
4006f47d4e2171 Roberto Sassu 2021-03-03  220  	if (!pub)
4006f47d4e2171 Roberto Sassu 2021-03-03  221  		return -ENOMEM;
4006f47d4e2171 Roberto Sassu 2021-03-03  222  	pub->id_type = "PGP";
4006f47d4e2171 Roberto Sassu 2021-03-03  223  
4006f47d4e2171 Roberto Sassu 2021-03-03 @224  	ret = pgp_parse_public_key(&data, &datalen, &pgp);
4006f47d4e2171 Roberto Sassu 2021-03-03  225  	if (ret < 0)
4006f47d4e2171 Roberto Sassu 2021-03-03  226  		goto cleanup;
4006f47d4e2171 Roberto Sassu 2021-03-03  227  
4006f47d4e2171 Roberto Sassu 2021-03-03  228  	if (pgp.pubkey_algo >= PGP_PUBKEY__LAST)
4006f47d4e2171 Roberto Sassu 2021-03-03  229  		goto cleanup_unsupported_pkey_algo;
4006f47d4e2171 Roberto Sassu 2021-03-03  230  	algo = pgp_to_public_key_algo[pgp.pubkey_algo];
4006f47d4e2171 Roberto Sassu 2021-03-03  231  	if (!algo)
4006f47d4e2171 Roberto Sassu 2021-03-03  232  		goto cleanup_unsupported_pkey_algo;
4006f47d4e2171 Roberto Sassu 2021-03-03  233  	pub->pkey_algo = algo;
4006f47d4e2171 Roberto Sassu 2021-03-03  234  
4006f47d4e2171 Roberto Sassu 2021-03-03  235  	pub->key = kmemdup(data, datalen, GFP_KERNEL);
4006f47d4e2171 Roberto Sassu 2021-03-03  236  	if (!pub->key)
4006f47d4e2171 Roberto Sassu 2021-03-03  237  		goto cleanup_nomem;
4006f47d4e2171 Roberto Sassu 2021-03-03  238  
4006f47d4e2171 Roberto Sassu 2021-03-03  239  	pub->keylen = datalen;
4006f47d4e2171 Roberto Sassu 2021-03-03  240  
4006f47d4e2171 Roberto Sassu 2021-03-03  241  	ret = pgp_generate_fingerprint(ctx, &pgp, pub);
4006f47d4e2171 Roberto Sassu 2021-03-03  242  	if (ret < 0)
4006f47d4e2171 Roberto Sassu 2021-03-03  243  		goto cleanup;
4006f47d4e2171 Roberto Sassu 2021-03-03  244  
4006f47d4e2171 Roberto Sassu 2021-03-03  245  	ctx->pub = pub;
4006f47d4e2171 Roberto Sassu 2021-03-03  246  	kleave(" = 0 [use]");
4006f47d4e2171 Roberto Sassu 2021-03-03  247  	return 0;
4006f47d4e2171 Roberto Sassu 2021-03-03  248  
4006f47d4e2171 Roberto Sassu 2021-03-03  249  cleanup_unsupported_pkey_algo:
4006f47d4e2171 Roberto Sassu 2021-03-03  250  	pr_debug("Unsupported public key algorithm %u\n",
4006f47d4e2171 Roberto Sassu 2021-03-03  251  		 pgp.pubkey_algo);
4006f47d4e2171 Roberto Sassu 2021-03-03  252  	ret = -ENOPKG;
4006f47d4e2171 Roberto Sassu 2021-03-03  253  	goto cleanup;
4006f47d4e2171 Roberto Sassu 2021-03-03  254  cleanup_nomem:
4006f47d4e2171 Roberto Sassu 2021-03-03  255  	ret = -ENOMEM;
4006f47d4e2171 Roberto Sassu 2021-03-03  256  	goto cleanup;
4006f47d4e2171 Roberto Sassu 2021-03-03  257  cleanup:
4006f47d4e2171 Roberto Sassu 2021-03-03  258  	pr_devel("cleanup");
4006f47d4e2171 Roberto Sassu 2021-03-03  259  	kfree(pub->key);
4006f47d4e2171 Roberto Sassu 2021-03-03  260  	kfree(pub);
4006f47d4e2171 Roberto Sassu 2021-03-03  261  	kleave(" = %d", ret);
4006f47d4e2171 Roberto Sassu 2021-03-03  262  	return ret;
4006f47d4e2171 Roberto Sassu 2021-03-03  263  }
4006f47d4e2171 Roberto Sassu 2021-03-03  264  
4006f47d4e2171 Roberto Sassu 2021-03-03  265  static struct asymmetric_key_ids *pgp_key_generate_id(
4006f47d4e2171 Roberto Sassu 2021-03-03  266  					struct pgp_key_data_parse_context *ctx)
4006f47d4e2171 Roberto Sassu 2021-03-03  267  {
4006f47d4e2171 Roberto Sassu 2021-03-03  268  	struct asymmetric_key_ids *kids;
4006f47d4e2171 Roberto Sassu 2021-03-03  269  	struct asymmetric_key_id *kid;
4006f47d4e2171 Roberto Sassu 2021-03-03  270  	int fingerprint_len = strlen(ctx->fingerprint) / 2;
4006f47d4e2171 Roberto Sassu 2021-03-03  271  
4006f47d4e2171 Roberto Sassu 2021-03-03  272  	kids = kzalloc(sizeof(struct asymmetric_key_ids), GFP_KERNEL);
4006f47d4e2171 Roberto Sassu 2021-03-03  273  	if (!kids)
4006f47d4e2171 Roberto Sassu 2021-03-03  274  		return kids;
4006f47d4e2171 Roberto Sassu 2021-03-03  275  
4006f47d4e2171 Roberto Sassu 2021-03-03  276  	kid = asymmetric_key_generate_id(ctx->raw_fingerprint, fingerprint_len,
4006f47d4e2171 Roberto Sassu 2021-03-03  277  					 NULL, 0);
4006f47d4e2171 Roberto Sassu 2021-03-03  278  	if (IS_ERR(kid))
4006f47d4e2171 Roberto Sassu 2021-03-03  279  		goto error;
4006f47d4e2171 Roberto Sassu 2021-03-03  280  
4006f47d4e2171 Roberto Sassu 2021-03-03  281  	kids->id[0] = kid;
4006f47d4e2171 Roberto Sassu 2021-03-03  282  	kids->id[1] = kmemdup(kid, sizeof(kid) + fingerprint_len, GFP_KERNEL);
4006f47d4e2171 Roberto Sassu 2021-03-03  283  	if (!kids->id[1])
4006f47d4e2171 Roberto Sassu 2021-03-03  284  		goto error;
4006f47d4e2171 Roberto Sassu 2021-03-03  285  
4006f47d4e2171 Roberto Sassu 2021-03-03  286  	return kids;
4006f47d4e2171 Roberto Sassu 2021-03-03  287  error:
4006f47d4e2171 Roberto Sassu 2021-03-03  288  	kfree(kids->id[0]);
4006f47d4e2171 Roberto Sassu 2021-03-03  289  	kfree(kids);
4006f47d4e2171 Roberto Sassu 2021-03-03  290  
4006f47d4e2171 Roberto Sassu 2021-03-03  291  	return NULL;
4006f47d4e2171 Roberto Sassu 2021-03-03  292  }
4006f47d4e2171 Roberto Sassu 2021-03-03  293  
4006f47d4e2171 Roberto Sassu 2021-03-03  294  /*
4006f47d4e2171 Roberto Sassu 2021-03-03  295   * Attempt to parse the instantiation data blob for a key as a PGP packet
4006f47d4e2171 Roberto Sassu 2021-03-03  296   * message holding a key.
4006f47d4e2171 Roberto Sassu 2021-03-03  297   */
4006f47d4e2171 Roberto Sassu 2021-03-03  298  static int pgp_key_parse(struct key_preparsed_payload *prep)
4006f47d4e2171 Roberto Sassu 2021-03-03  299  {
4006f47d4e2171 Roberto Sassu 2021-03-03  300  	struct pgp_key_data_parse_context ctx;
4006f47d4e2171 Roberto Sassu 2021-03-03  301  	int ret;
4006f47d4e2171 Roberto Sassu 2021-03-03  302  
4006f47d4e2171 Roberto Sassu 2021-03-03  303  	kenter("");
4006f47d4e2171 Roberto Sassu 2021-03-03  304  
4006f47d4e2171 Roberto Sassu 2021-03-03  305  	memset(&ctx, 0, sizeof(ctx));
a98cb7a4b757b7 David Howells 2021-03-03  306  	ctx.pgp.types_of_interest = (1 << PGP_PKT_PUBLIC_KEY) |
a98cb7a4b757b7 David Howells 2021-03-03  307  				    (1 << PGP_PKT_USER_ID);
4006f47d4e2171 Roberto Sassu 2021-03-03  308  	ctx.pgp.process_packet = pgp_process_public_key;
4006f47d4e2171 Roberto Sassu 2021-03-03  309  
4006f47d4e2171 Roberto Sassu 2021-03-03 @310  	ret = pgp_parse_packets(prep->data, prep->datalen, &ctx.pgp);
4006f47d4e2171 Roberto Sassu 2021-03-03  311  	if (ret < 0)
4006f47d4e2171 Roberto Sassu 2021-03-03  312  		goto error;
4006f47d4e2171 Roberto Sassu 2021-03-03  313  
a98cb7a4b757b7 David Howells 2021-03-03  314  	if (ctx.user_id && ctx.user_id_len > 0) {
a98cb7a4b757b7 David Howells 2021-03-03  315  		/* Propose a description for the key
a98cb7a4b757b7 David Howells 2021-03-03  316  		 * (user ID without the comment)
a98cb7a4b757b7 David Howells 2021-03-03  317  		 */
a98cb7a4b757b7 David Howells 2021-03-03  318  		size_t ulen = ctx.user_id_len, flen = ctx.fingerprint_len;
a98cb7a4b757b7 David Howells 2021-03-03  319  		const char *p;
a98cb7a4b757b7 David Howells 2021-03-03  320  
a98cb7a4b757b7 David Howells 2021-03-03  321  		p = memchr(ctx.user_id, '(', ulen);
a98cb7a4b757b7 David Howells 2021-03-03  322  		if (p) {
a98cb7a4b757b7 David Howells 2021-03-03  323  			/* Remove the comment */
a98cb7a4b757b7 David Howells 2021-03-03  324  			do {
a98cb7a4b757b7 David Howells 2021-03-03  325  				p--;
a98cb7a4b757b7 David Howells 2021-03-03  326  			} while (*p == ' ' && p > ctx.user_id);
a98cb7a4b757b7 David Howells 2021-03-03  327  			if (*p != ' ')
a98cb7a4b757b7 David Howells 2021-03-03  328  				p++;
a98cb7a4b757b7 David Howells 2021-03-03  329  			ulen = p - ctx.user_id;
a98cb7a4b757b7 David Howells 2021-03-03  330  		}
a98cb7a4b757b7 David Howells 2021-03-03  331  
a98cb7a4b757b7 David Howells 2021-03-03  332  		if (ulen > 255 - 9)
a98cb7a4b757b7 David Howells 2021-03-03  333  			ulen = 255 - 9;
a98cb7a4b757b7 David Howells 2021-03-03  334  		prep->description = kmalloc(ulen + 1 + 8 + 1, GFP_KERNEL);
a98cb7a4b757b7 David Howells 2021-03-03  335  		ret = -ENOMEM;
a98cb7a4b757b7 David Howells 2021-03-03  336  		if (!prep->description)
a98cb7a4b757b7 David Howells 2021-03-03  337  			goto error;
a98cb7a4b757b7 David Howells 2021-03-03  338  		memcpy(prep->description, ctx.user_id, ulen);
a98cb7a4b757b7 David Howells 2021-03-03  339  		prep->description[ulen] = ' ';
a98cb7a4b757b7 David Howells 2021-03-03  340  		memcpy(prep->description + ulen + 1,
a98cb7a4b757b7 David Howells 2021-03-03  341  		       ctx.fingerprint + flen - 8, 8);
a98cb7a4b757b7 David Howells 2021-03-03  342  		prep->description[ulen + 9] = 0;
a98cb7a4b757b7 David Howells 2021-03-03  343  		pr_debug("desc '%s'\n", prep->description);
a98cb7a4b757b7 David Howells 2021-03-03  344  	}
a98cb7a4b757b7 David Howells 2021-03-03  345  
4006f47d4e2171 Roberto Sassu 2021-03-03  346  	/* We're pinning the module by being linked against it */
4006f47d4e2171 Roberto Sassu 2021-03-03  347  	__module_get(public_key_subtype.owner);
4006f47d4e2171 Roberto Sassu 2021-03-03  348  	prep->payload.data[asym_subtype] = &public_key_subtype;
4006f47d4e2171 Roberto Sassu 2021-03-03  349  	prep->payload.data[asym_key_ids] = pgp_key_generate_id(&ctx);
4006f47d4e2171 Roberto Sassu 2021-03-03  350  	prep->payload.data[asym_crypto] = ctx.pub;
4006f47d4e2171 Roberto Sassu 2021-03-03  351  	prep->quotalen = 100;
4006f47d4e2171 Roberto Sassu 2021-03-03  352  	kfree(ctx.fingerprint);
4006f47d4e2171 Roberto Sassu 2021-03-03  353  	kfree(ctx.raw_fingerprint);
4006f47d4e2171 Roberto Sassu 2021-03-03  354  	return 0;
4006f47d4e2171 Roberto Sassu 2021-03-03  355  
4006f47d4e2171 Roberto Sassu 2021-03-03  356  error:
4006f47d4e2171 Roberto Sassu 2021-03-03  357  	public_key_free(ctx.pub);
4006f47d4e2171 Roberto Sassu 2021-03-03  358  	kfree(ctx.fingerprint);
4006f47d4e2171 Roberto Sassu 2021-03-03  359  	kfree(ctx.raw_fingerprint);
4006f47d4e2171 Roberto Sassu 2021-03-03  360  	return ret;
4006f47d4e2171 Roberto Sassu 2021-03-03  361  }
4006f47d4e2171 Roberto Sassu 2021-03-03  362  

:::::: The code at line 310 was first introduced by commit
:::::: 4006f47d4e2171af60bfb5daab2bcce8bc02c309 KEYS: PGP data parser

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
