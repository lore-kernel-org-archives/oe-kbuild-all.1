Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B6D535
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710395064; cv=none; b=fClXCoPnOtPkSxEetPCTDizxxE3vp/tPNonmpVYgMWPdC+GrLO6zAYn+c7CfUb2VK+pp4QfZ6ayAaV1q0ZyqUDSvfIy3GdPKCrKhBmtp/s7WCyw2uKAugsnV332OgHJ0dzKlR7VCUqN77WKEpgY/mYPkTL8mmZILASsIJiYWTwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710395064; c=relaxed/simple;
	bh=BypS6RCuWHwe9rQTm4f/OqhasAjlZqJFM5Gh5Ep2210=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rnBTHNkrP0mYDGAVerwQEzN8dNMbYRtbNXHkUkGCZTY3/HGvcXtmXzIPenoVdSV7ob1aBO8YHsF5SSpEcn52Y+cSZLgo756QCAccotJHUfGoOHvjlrgVQn0yeardyZtgluXddvIltsug820+eX7G4XvubuToo5n8w92tAXlhqzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1eKWBFU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1eKWBFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710395062; x=1741931062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BypS6RCuWHwe9rQTm4f/OqhasAjlZqJFM5Gh5Ep2210=;
  b=V1eKWBFUlnBdg9JJlcej1ZSDul9sF81zPyK1RlfUSCmZ61EFxjNyimlt
   oTalv4dLChnizXxdFp/oOnjPt7H1ZjMdf7/lz3ZPODvmixYpHoqtNYW3q
   mCnmvJnaKFkZmZG2alsjrKSyo4t+8usHDgNnh6AHe/A3xynb2cCDofxvp
   2YGF6ux2iv8FWdkNdeKoDmsGgRVDFAoRHcq0dcZt5zyxi2+yYwpePmlB3
   ebB6bq21NPt7EsQb+UuwwXl8meT0V0dYLYFTjOvW3eATkYbRsbu9vX6YO
   6MxiAVCM3l1N034MCRCq2dt7cNq+7F9UsTooixyyj7qtx67x76O7yMzy8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5321732"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5321732"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 22:44:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="12623746"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Mar 2024 22:44:19 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkdt2-000D9d-2G;
	Thu, 14 Mar 2024 05:44:16 +0000
Date: Thu, 14 Mar 2024 13:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 333/30000]
 crypto/asymmetric_keys/pgp_public_key.c:35:27: error: field has incomplete
 type 'struct pgp_parse_context'
Message-ID: <202403141305.rj6VMLiN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9e82708a746dc5d4ec8995a3e6edace2cf23c6fd
commit: c283657144c1475e571f0c1f34477af1f682a12f [333/30000] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-buildonly-randconfig-003-20240314 (https://download.01.org/0day-ci/archive/20240314/202403141305.rj6VMLiN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141305.rj6VMLiN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141305.rj6VMLiN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> crypto/asymmetric_keys/pgp_public_key.c:35:27: error: field has incomplete type 'struct pgp_parse_context'
      35 |         struct pgp_parse_context pgp;
         |                                  ^
   crypto/asymmetric_keys/pgp_public_key.c:35:9: note: forward declaration of 'struct pgp_parse_context'
      35 |         struct pgp_parse_context pgp;
         |                ^
>> crypto/asymmetric_keys/pgp_public_key.c:48:18: warning: declaration of 'struct pgp_parse_pubkey' will not be visible outside of this function [-Wvisibility]
      48 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
>> crypto/asymmetric_keys/pgp_public_key.c:63:10: error: incomplete definition of type 'struct pgp_parse_pubkey'
      63 |         n = (pgp->version < PGP_KEY_VERSION_4) ? 8 : 6;
         |              ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:48:18: note: forward declaration of 'struct pgp_parse_pubkey'
      48 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:85:25: error: incomplete definition of type 'struct pgp_parse_pubkey'
      85 |         digest_putc(digest, pgp->version);
         |                             ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:48:18: note: forward declaration of 'struct pgp_parse_pubkey'
      48 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:87:11: error: incomplete definition of type 'struct pgp_parse_pubkey'
      87 |         a32 = pgp->creation_time;
         |               ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:48:18: note: forward declaration of 'struct pgp_parse_pubkey'
      48 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:93:9: error: incomplete definition of type 'struct pgp_parse_pubkey'
      93 |         if (pgp->version < PGP_KEY_VERSION_4) {
         |             ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:48:18: note: forward declaration of 'struct pgp_parse_pubkey'
      48 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:96:10: error: incomplete definition of type 'struct pgp_parse_pubkey'
      96 |                 if (pgp->expires_at)
         |                     ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:48:18: note: forward declaration of 'struct pgp_parse_pubkey'
      48 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:97:14: error: incomplete definition of type 'struct pgp_parse_pubkey'
      97 |                         a16 = (pgp->expires_at - pgp->creation_time) / 86400UL;
         |                                ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:48:18: note: forward declaration of 'struct pgp_parse_pubkey'
      48 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:97:32: error: incomplete definition of type 'struct pgp_parse_pubkey'
      97 |                         a16 = (pgp->expires_at - pgp->creation_time) / 86400UL;
         |                                                  ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:48:18: note: forward declaration of 'struct pgp_parse_pubkey'
      48 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:104:25: error: incomplete definition of type 'struct pgp_parse_pubkey'
     104 |         digest_putc(digest, pgp->pubkey_algo);
         |                             ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:48:18: note: forward declaration of 'struct pgp_parse_pubkey'
      48 |                                struct pgp_parse_pubkey *pgp,
         |                                       ^
   crypto/asymmetric_keys/pgp_public_key.c:121:16: warning: declaration of 'struct pgp_parse_pubkey' will not be visible outside of this function [-Wvisibility]
     121 |                                     struct pgp_parse_pubkey *pgp,
         |                                            ^
   crypto/asymmetric_keys/pgp_public_key.c:132:30: error: incomplete definition of type 'struct pgp_parse_pubkey'
     132 |         tfm = crypto_alloc_shash(pgp->version < PGP_KEY_VERSION_4 ?
         |                                  ~~~^
   crypto/asymmetric_keys/pgp_public_key.c:121:16: note: forward declaration of 'struct pgp_parse_pubkey'
     121 |                                     struct pgp_parse_pubkey *pgp,
         |                                            ^
>> crypto/asymmetric_keys/pgp_public_key.c:148:36: error: incompatible pointer types passing 'struct pgp_parse_pubkey *' to parameter of type 'struct pgp_parse_pubkey *' [-Werror,-Wincompatible-pointer-types]
     148 |         ret = pgp_calc_pkey_keyid(digest, pgp, pub);
         |                                           ^~~
   crypto/asymmetric_keys/pgp_public_key.c:48:36: note: passing argument to parameter 'pgp' here
      48 |                                struct pgp_parse_pubkey *pgp,
         |                                                         ^
>> crypto/asymmetric_keys/pgp_public_key.c:201:26: error: variable has incomplete type 'struct pgp_parse_pubkey'
     201 |         struct pgp_parse_pubkey pgp;
         |                                 ^
   crypto/asymmetric_keys/pgp_public_key.c:201:9: note: forward declaration of 'struct pgp_parse_pubkey'
     201 |         struct pgp_parse_pubkey pgp;
         |                ^
>> crypto/asymmetric_keys/pgp_public_key.c:224:8: error: implicit declaration of function 'pgp_parse_public_key' [-Werror,-Wimplicit-function-declaration]
     224 |         ret = pgp_parse_public_key(&data, &datalen, &pgp);
         |               ^
   crypto/asymmetric_keys/pgp_public_key.c:224:8: note: did you mean 'pgp_process_public_key'?
   crypto/asymmetric_keys/pgp_public_key.c:192:12: note: 'pgp_process_public_key' declared here
     192 | static int pgp_process_public_key(struct pgp_parse_context *context,
         |            ^
>> crypto/asymmetric_keys/pgp_public_key.c:310:8: error: implicit declaration of function 'pgp_parse_packets' [-Werror,-Wimplicit-function-declaration]
     310 |         ret = pgp_parse_packets(prep->data, prep->datalen, &ctx.pgp);
         |               ^
   2 warnings and 14 errors generated.
--
>> crypto/asymmetric_keys/pgp_preload.c:23:27: error: field has incomplete type 'struct pgp_parse_context'
      23 |         struct pgp_parse_context pgp;
         |                                  ^
   crypto/asymmetric_keys/pgp_preload.c:23:9: note: forward declaration of 'struct pgp_parse_context'
      23 |         struct pgp_parse_context pgp;
         |                ^
>> crypto/asymmetric_keys/pgp_preload.c:110:8: error: implicit declaration of function 'pgp_parse_packets' [-Werror,-Wimplicit-function-declaration]
     110 |         ret = pgp_parse_packets(pgpdata, pgpdatalen, &ctx.pgp);
         |               ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +35 crypto/asymmetric_keys/pgp_public_key.c

4006f47d4e2171 Roberto Sassu 2021-03-03   33  
4006f47d4e2171 Roberto Sassu 2021-03-03   34  struct pgp_key_data_parse_context {
4006f47d4e2171 Roberto Sassu 2021-03-03  @35  	struct pgp_parse_context pgp;
4006f47d4e2171 Roberto Sassu 2021-03-03   36  	struct public_key *pub;
4006f47d4e2171 Roberto Sassu 2021-03-03   37  	unsigned char *raw_fingerprint;
4006f47d4e2171 Roberto Sassu 2021-03-03   38  	char *fingerprint;
a98cb7a4b757b7 David Howells 2021-03-03   39  	const char *user_id;
a98cb7a4b757b7 David Howells 2021-03-03   40  	size_t user_id_len;
a98cb7a4b757b7 David Howells 2021-03-03   41  	size_t fingerprint_len;
4006f47d4e2171 Roberto Sassu 2021-03-03   42  };
4006f47d4e2171 Roberto Sassu 2021-03-03   43  
4006f47d4e2171 Roberto Sassu 2021-03-03   44  /*
4006f47d4e2171 Roberto Sassu 2021-03-03   45   * Calculate the public key ID (RFC4880 12.2)
4006f47d4e2171 Roberto Sassu 2021-03-03   46   */
4006f47d4e2171 Roberto Sassu 2021-03-03   47  static int pgp_calc_pkey_keyid(struct shash_desc *digest,
4006f47d4e2171 Roberto Sassu 2021-03-03  @48  			       struct pgp_parse_pubkey *pgp,
4006f47d4e2171 Roberto Sassu 2021-03-03   49  			       struct public_key *pub)
4006f47d4e2171 Roberto Sassu 2021-03-03   50  {
4006f47d4e2171 Roberto Sassu 2021-03-03   51  	unsigned int nb[MAX_MPI];
4006f47d4e2171 Roberto Sassu 2021-03-03   52  	unsigned int nn[MAX_MPI];
4006f47d4e2171 Roberto Sassu 2021-03-03   53  	unsigned int n;
4006f47d4e2171 Roberto Sassu 2021-03-03   54  	size_t keylen = pub->keylen;
4006f47d4e2171 Roberto Sassu 2021-03-03   55  	u8 *key_ptr = pub->key;
4006f47d4e2171 Roberto Sassu 2021-03-03   56  	u8 *pp[MAX_MPI];
4006f47d4e2171 Roberto Sassu 2021-03-03   57  	u32 a32;
4006f47d4e2171 Roberto Sassu 2021-03-03   58  	int npkey;
4006f47d4e2171 Roberto Sassu 2021-03-03   59  	int i, ret;
4006f47d4e2171 Roberto Sassu 2021-03-03   60  
4006f47d4e2171 Roberto Sassu 2021-03-03   61  	kenter("");
4006f47d4e2171 Roberto Sassu 2021-03-03   62  
4006f47d4e2171 Roberto Sassu 2021-03-03  @63  	n = (pgp->version < PGP_KEY_VERSION_4) ? 8 : 6;
4006f47d4e2171 Roberto Sassu 2021-03-03   64  	for (i = 0; i < MAX_MPI && keylen > 0; i++) {
4006f47d4e2171 Roberto Sassu 2021-03-03   65  		ret = mpi_key_length(key_ptr, keylen, nb + i, nn + i);
4006f47d4e2171 Roberto Sassu 2021-03-03   66  		if (ret < 0)
4006f47d4e2171 Roberto Sassu 2021-03-03   67  			return ret;
4006f47d4e2171 Roberto Sassu 2021-03-03   68  
4006f47d4e2171 Roberto Sassu 2021-03-03   69  		pp[i] = key_ptr + 2;
4006f47d4e2171 Roberto Sassu 2021-03-03   70  		key_ptr += 2 + nn[i];
4006f47d4e2171 Roberto Sassu 2021-03-03   71  		keylen -= 2 + nn[i];
4006f47d4e2171 Roberto Sassu 2021-03-03   72  		n += 2 + nn[i];
4006f47d4e2171 Roberto Sassu 2021-03-03   73  	}
4006f47d4e2171 Roberto Sassu 2021-03-03   74  
4006f47d4e2171 Roberto Sassu 2021-03-03   75  	if (keylen != 0) {
4006f47d4e2171 Roberto Sassu 2021-03-03   76  		pr_debug("excess %zu\n", keylen);
4006f47d4e2171 Roberto Sassu 2021-03-03   77  		return -EBADMSG;
4006f47d4e2171 Roberto Sassu 2021-03-03   78  	}
4006f47d4e2171 Roberto Sassu 2021-03-03   79  
4006f47d4e2171 Roberto Sassu 2021-03-03   80  	npkey = i;
4006f47d4e2171 Roberto Sassu 2021-03-03   81  
4006f47d4e2171 Roberto Sassu 2021-03-03   82  	digest_putc(digest, 0x99);     /* ctb */
4006f47d4e2171 Roberto Sassu 2021-03-03   83  	digest_putc(digest, n >> 8);   /* 16-bit header length */
4006f47d4e2171 Roberto Sassu 2021-03-03   84  	digest_putc(digest, n);
4006f47d4e2171 Roberto Sassu 2021-03-03   85  	digest_putc(digest, pgp->version);
4006f47d4e2171 Roberto Sassu 2021-03-03   86  
4006f47d4e2171 Roberto Sassu 2021-03-03   87  	a32 = pgp->creation_time;
4006f47d4e2171 Roberto Sassu 2021-03-03   88  	digest_putc(digest, a32 >> 24);
4006f47d4e2171 Roberto Sassu 2021-03-03   89  	digest_putc(digest, a32 >> 16);
4006f47d4e2171 Roberto Sassu 2021-03-03   90  	digest_putc(digest, a32 >>  8);
4006f47d4e2171 Roberto Sassu 2021-03-03   91  	digest_putc(digest, a32 >>  0);
4006f47d4e2171 Roberto Sassu 2021-03-03   92  
4006f47d4e2171 Roberto Sassu 2021-03-03   93  	if (pgp->version < PGP_KEY_VERSION_4) {
4006f47d4e2171 Roberto Sassu 2021-03-03   94  		u16 a16;
4006f47d4e2171 Roberto Sassu 2021-03-03   95  
4006f47d4e2171 Roberto Sassu 2021-03-03   96  		if (pgp->expires_at)
4006f47d4e2171 Roberto Sassu 2021-03-03   97  			a16 = (pgp->expires_at - pgp->creation_time) / 86400UL;
4006f47d4e2171 Roberto Sassu 2021-03-03   98  		else
4006f47d4e2171 Roberto Sassu 2021-03-03   99  			a16 = 0;
4006f47d4e2171 Roberto Sassu 2021-03-03  100  		digest_putc(digest, a16 >> 8);
4006f47d4e2171 Roberto Sassu 2021-03-03  101  		digest_putc(digest, a16 >> 0);
4006f47d4e2171 Roberto Sassu 2021-03-03  102  	}
4006f47d4e2171 Roberto Sassu 2021-03-03  103  
4006f47d4e2171 Roberto Sassu 2021-03-03  104  	digest_putc(digest, pgp->pubkey_algo);
4006f47d4e2171 Roberto Sassu 2021-03-03  105  
4006f47d4e2171 Roberto Sassu 2021-03-03  106  	for (i = 0; i < npkey; i++) {
4006f47d4e2171 Roberto Sassu 2021-03-03  107  		digest_putc(digest, nb[i] >> 8);
4006f47d4e2171 Roberto Sassu 2021-03-03  108  		digest_putc(digest, nb[i]);
4006f47d4e2171 Roberto Sassu 2021-03-03  109  		crypto_shash_update(digest, pp[i], nn[i]);
4006f47d4e2171 Roberto Sassu 2021-03-03  110  	}
4006f47d4e2171 Roberto Sassu 2021-03-03  111  	ret = 0;
4006f47d4e2171 Roberto Sassu 2021-03-03  112  
4006f47d4e2171 Roberto Sassu 2021-03-03  113  	kleave(" = %d", ret);
4006f47d4e2171 Roberto Sassu 2021-03-03  114  	return ret;
4006f47d4e2171 Roberto Sassu 2021-03-03  115  }
4006f47d4e2171 Roberto Sassu 2021-03-03  116  
4006f47d4e2171 Roberto Sassu 2021-03-03  117  /*
4006f47d4e2171 Roberto Sassu 2021-03-03  118   * Calculate the public key ID fingerprint
4006f47d4e2171 Roberto Sassu 2021-03-03  119   */
4006f47d4e2171 Roberto Sassu 2021-03-03  120  static int pgp_generate_fingerprint(struct pgp_key_data_parse_context *ctx,
4006f47d4e2171 Roberto Sassu 2021-03-03 @121  				    struct pgp_parse_pubkey *pgp,
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

:::::: The code at line 35 was first introduced by commit
:::::: 4006f47d4e2171af60bfb5daab2bcce8bc02c309 KEYS: PGP data parser

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
