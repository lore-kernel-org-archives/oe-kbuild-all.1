Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8D6209F2E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754473455; cv=none; b=rtoswFYw4w/lcpY3scmG4ujsSHPan1Ui1ksVGGa7sdTO6v80FshXgLmyYBD0T+ctf1BtPZxEwFqaPpKHNpCC+cuQ162M7DwFqW/+jv6u6v2C4K7zn7q0Rz8269DuLqJws9lFwT7OwEjMKszzt9ugmngiPFvmrb50sqHbQ0q/d5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754473455; c=relaxed/simple;
	bh=0ZV7Y/KILlduvG/MfAwgtD6i5hw6gq1g+DTBIebzwAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LHFBuVncPYht95qhMjtdIbsOVoFqOnrlkf5hGlN/ZrD7jjS/4ZR+vHYETLF9YLPxiNbo9Hi+fJ/GvgoNUdkcBBDvIpgwVDCaxBwOO5QN5y501L3i+42BdyONGvmaoVjyToS2t8MgQBHSb3Y5dtHMDQcj6aNQt2UxVe1NBx3SG2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzgEKv9v; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzgEKv9v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754473454; x=1786009454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ZV7Y/KILlduvG/MfAwgtD6i5hw6gq1g+DTBIebzwAU=;
  b=KzgEKv9vGUUyshJ0JAFjc8Z3hbT4j+r9u0Jd6Hcm9gv8Nr8hmMizUkLY
   iERp71KcY1NsgIuSTZaC4V+dZdQ6CE5Wk9JJyymwowKMw32SkzdxTZlfG
   aGAyDPXdSMcto2VWYIYbLQ1aTP6+sWMcLj8lM7IAZQ5gIziKxaYromYJn
   dVE1Zn7/3VWzRvj5calIULChZt/Q0rfCuyLoQxpZsw4MhAgmGps1dvHbt
   GrbO5pSVfwmEQ4Gk0C3DyIgiiFxZOn3xocweZZy0SRHeR54hdikN1dJ1M
   kVwPYq32e9qRK37nhde8nyB6H/qS6AgCdK2lPITiVo55Vgv+lLC5sYgXr
   w==;
X-CSE-ConnectionGUID: RQxKXfP6TLqRV30ZyZ1xug==
X-CSE-MsgGUID: GrwOD8x4QEaiOtxQL+iZBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79333971"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="79333971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 02:44:14 -0700
X-CSE-ConnectionGUID: wfZ2XWu8Q+Wy63Wz23fNJQ==
X-CSE-MsgGUID: uC9l9RppRFS8SdeEfDeuqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="201901033"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Aug 2025 02:44:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujagV-0001UG-2Q;
	Wed, 06 Aug 2025 09:43:54 +0000
Date: Wed, 6 Aug 2025 17:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-libcrypto 26/29] fs/smb/server/auth.c:82: undefined
 reference to `hmac_md5_init_usingrawkey'
Message-ID: <202508061716.tsXPYEkA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-libcrypto
head:   7fbf88966943cc7f22f9dade58354f59b70be55d
commit: 4f84d682e6846b063101d09a9228291b5c381255 [26/29] smb: server: Use HMAC-MD5 library instead of crypto_shash
config: x86_64-randconfig-077-20250806 (https://download.01.org/0day-ci/archive/20250806/202508061716.tsXPYEkA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061716.tsXPYEkA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061716.tsXPYEkA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/smb/server/auth.o: in function `calc_ntlmv2_hash':
>> fs/smb/server/auth.c:82: undefined reference to `hmac_md5_init_usingrawkey'
   ld: fs/smb/server/auth.o: in function `hmac_md5_update':
   include/crypto/md5.h:164: undefined reference to `md5_update'
>> ld: include/crypto/md5.h:164: undefined reference to `md5_update'
   ld: fs/smb/server/auth.o: in function `calc_ntlmv2_hash':
>> fs/smb/server/auth.c:119: undefined reference to `hmac_md5_final'
   ld: fs/smb/server/auth.o: in function `ksmbd_auth_ntlmv2':
   fs/smb/server/auth.c:152: undefined reference to `hmac_md5_init_usingrawkey'
   ld: fs/smb/server/auth.o: in function `hmac_md5_update':
   include/crypto/md5.h:164: undefined reference to `md5_update'
>> ld: include/crypto/md5.h:164: undefined reference to `md5_update'
   ld: fs/smb/server/auth.o: in function `ksmbd_auth_ntlmv2':
   fs/smb/server/auth.c:155: undefined reference to `hmac_md5_final'
>> ld: fs/smb/server/auth.c:158: undefined reference to `hmac_md5_usingrawkey'
   ld: crypto/md5.o: in function `crypto_hmac_md5_setkey':
   crypto/md5.c:99: undefined reference to `hmac_md5_preparekey'
   ld: crypto/md5.o: in function `crypto_hmac_md5_digest':
   crypto/md5.c:125: undefined reference to `hmac_md5'
   ld: crypto/md5.o: in function `crypto_hmac_md5_final':
   crypto/md5.c:118: undefined reference to `hmac_md5_final'
   ld: crypto/md5.o: in function `hmac_md5_update':
   include/crypto/md5.h:164: undefined reference to `md5_update'
   ld: crypto/md5.o: in function `crypto_md5_update':
   crypto/md5.c:66: undefined reference to `md5_update'
   ld: crypto/md5.o: in function `crypto_hmac_md5_init':
   crypto/md5.c:105: undefined reference to `hmac_md5_init'
   ld: crypto/md5.o: in function `crypto_md5_digest':
   crypto/md5.c:79: undefined reference to `md5'
   ld: crypto/md5.o: in function `crypto_md5_final':
   crypto/md5.c:72: undefined reference to `md5_final'
   ld: crypto/md5.o: in function `crypto_md5_init':
   crypto/md5.c:59: undefined reference to `md5_init'


vim +82 fs/smb/server/auth.c

    73	
    74	static int calc_ntlmv2_hash(struct ksmbd_conn *conn, struct ksmbd_session *sess,
    75				    char *ntlmv2_hash, char *dname)
    76	{
    77		int ret = 0, len, conv_len;
    78		wchar_t *domain = NULL;
    79		__le16 *uniname = NULL;
    80		struct hmac_md5_ctx ctx;
    81	
  > 82		hmac_md5_init_usingrawkey(&ctx, user_passkey(sess->user),
    83					  CIFS_ENCPWD_SIZE);
    84	
    85		/* convert user_name to unicode */
    86		len = strlen(user_name(sess->user));
    87		uniname = kzalloc(2 + UNICODE_LEN(len), KSMBD_DEFAULT_GFP);
    88		if (!uniname) {
    89			ret = -ENOMEM;
    90			goto out;
    91		}
    92	
    93		conv_len = smb_strtoUTF16(uniname, user_name(sess->user), len,
    94					  conn->local_nls);
    95		if (conv_len < 0 || conv_len > len) {
    96			ret = -EINVAL;
    97			goto out;
    98		}
    99		UniStrupr(uniname);
   100	
   101		hmac_md5_update(&ctx, (const u8 *)uniname, UNICODE_LEN(conv_len));
   102	
   103		/* Convert domain name or conn name to unicode and uppercase */
   104		len = strlen(dname);
   105		domain = kzalloc(2 + UNICODE_LEN(len), KSMBD_DEFAULT_GFP);
   106		if (!domain) {
   107			ret = -ENOMEM;
   108			goto out;
   109		}
   110	
   111		conv_len = smb_strtoUTF16((__le16 *)domain, dname, len,
   112					  conn->local_nls);
   113		if (conv_len < 0 || conv_len > len) {
   114			ret = -EINVAL;
   115			goto out;
   116		}
   117	
   118		hmac_md5_update(&ctx, (const u8 *)domain, UNICODE_LEN(conv_len));
 > 119		hmac_md5_final(&ctx, ntlmv2_hash);
   120	out:
   121		kfree(uniname);
   122		kfree(domain);
   123		return ret;
   124	}
   125	
   126	/**
   127	 * ksmbd_auth_ntlmv2() - NTLMv2 authentication handler
   128	 * @conn:		connection
   129	 * @sess:		session of connection
   130	 * @ntlmv2:		NTLMv2 challenge response
   131	 * @blen:		NTLMv2 blob length
   132	 * @domain_name:	domain name
   133	 * @cryptkey:		session crypto key
   134	 *
   135	 * Return:	0 on success, error number on error
   136	 */
   137	int ksmbd_auth_ntlmv2(struct ksmbd_conn *conn, struct ksmbd_session *sess,
   138			      struct ntlmv2_resp *ntlmv2, int blen, char *domain_name,
   139			      char *cryptkey)
   140	{
   141		char ntlmv2_hash[CIFS_ENCPWD_SIZE];
   142		char ntlmv2_rsp[CIFS_HMAC_MD5_HASH_SIZE];
   143		struct hmac_md5_ctx ctx;
   144		int rc;
   145	
   146		rc = calc_ntlmv2_hash(conn, sess, ntlmv2_hash, domain_name);
   147		if (rc) {
   148			ksmbd_debug(AUTH, "could not get v2 hash rc %d\n", rc);
   149			return rc;
   150		}
   151	
   152		hmac_md5_init_usingrawkey(&ctx, ntlmv2_hash, CIFS_HMAC_MD5_HASH_SIZE);
   153		hmac_md5_update(&ctx, cryptkey, CIFS_CRYPTO_KEY_SIZE);
   154		hmac_md5_update(&ctx, (const u8 *)&ntlmv2->blob_signature, blen);
   155		hmac_md5_final(&ctx, ntlmv2_rsp);
   156	
   157		/* Generate the session key */
 > 158		hmac_md5_usingrawkey(ntlmv2_hash, CIFS_HMAC_MD5_HASH_SIZE,
   159				     ntlmv2_rsp, SMB2_NTLMV2_SESSKEY_SIZE,
   160				     sess->sess_key);
   161	
   162		if (memcmp(ntlmv2->ntlmv2_hash, ntlmv2_rsp, CIFS_HMAC_MD5_HASH_SIZE) != 0)
   163			return -EINVAL;
   164		return 0;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
