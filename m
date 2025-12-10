Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB5C326D5D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 17:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765387542; cv=none; b=P/OrACUhEn4IG/urln/x2C31wyj1Vii76bLlNcaNSVIF7JkUClYCffqIcalFjfeXP8n41SSx8lPBGHUR1iFptrrf4AkAUpqo2qnZ1nAPT2rYDiyWcEkJGxOHjonrmIahlEvXCq6QifTE4DvUVOtUKKIHfYTfJTd35fYikHoATYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765387542; c=relaxed/simple;
	bh=fe6XZ7pzj2CmFdPsvaLbnJxufCz9/KxURgOm5+Tdejk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GTaK13lSX2gTz7DpmBYk9WP0Hz83vyTWwgl9YCxuiIFactp1i4TQM9/7KfspIvBvTZo5JVT/T4WYDnXYIMGlACIfaGhPqA7tkXBya9pa+htQ6u4sCXYiLh+HWJ/fNuWTDfIhx1A4Eo1ozIkr36rtMEySRb61pQPokntVYA29Q6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSJ+hgbj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSJ+hgbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765387540; x=1796923540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fe6XZ7pzj2CmFdPsvaLbnJxufCz9/KxURgOm5+Tdejk=;
  b=KSJ+hgbjCkYSN/4AM8Ffd2K5B3NH0uZGyfpKDNRMEJw2zg8IzhlQFlCg
   8D7zgaTjT6wCIFWxA348nw3ScZsoWzebmdM+ku0BcdQS7YognllVGZIbx
   +IiMlipMFdDLsr5TwlQSqHsUcMW8hRqzM3Ett15Y+XNEoy80UVza60fUk
   yCiO/zyMNcp9Q1aWs+YGyu5LE93lH1uly1Da3mVlKjNVTGDMgCSskhqVq
   k2j3BaqBalwPZlPKfaRO8/F8jFzDVKdc/gCrDcX/yk1gMD1B81ZA+ngNs
   J2LV39fYEB8NkUhTHeKZRYBys6gxxmPE1zBpyAuHORePmORrIpy0qr3JV
   w==;
X-CSE-ConnectionGUID: KaJDINLTRTaXRmpHpeWhTw==
X-CSE-MsgGUID: mdOznNGhQ3uRCOfSOql7Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84969867"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="84969867"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 09:25:39 -0800
X-CSE-ConnectionGUID: OXS5WQ4oSXawMfVmVPK43A==
X-CSE-MsgGUID: Mrv7BeTkQ3Kyh9XzZGJfjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="197062537"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Dec 2025 09:25:38 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTNwW-000000003Vp-0nxb;
	Wed, 10 Dec 2025 17:25:36 +0000
Date: Thu, 11 Dec 2025 01:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-03 1/1] fs/ksmbd/auth.c:219:
 warning: Function parameter or member 'cryptkey' not described in
 'ksmbd_auth_ntlmv2'
Message-ID: <202512110158.hEwB8F8s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Namjae,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-03
head:   47909498d6058ee12b13bdfee22c80b73a979254
commit: f86a1a74d9a7f6ecad21c4ba3c1ebc045d90c888 [1/1] ksmbd: fix multi session connection failure
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251211/202512110158.hEwB8F8s-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110158.hEwB8F8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110158.hEwB8F8s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ksmbd/auth.c:219: warning: Function parameter or member 'cryptkey' not described in 'ksmbd_auth_ntlmv2'
   fs/ksmbd/auth.c:300: warning: Function parameter or member 'blob_len' not described in 'ksmbd_decode_ntlmssp_auth_blob'
   fs/ksmbd/auth.c:300: warning: Function parameter or member 'conn' not described in 'ksmbd_decode_ntlmssp_auth_blob'
   fs/ksmbd/auth.c:300: warning: Excess function parameter 'usr' description in 'ksmbd_decode_ntlmssp_auth_blob'
   fs/ksmbd/auth.c:353: warning: Function parameter or member 'blob_len' not described in 'ksmbd_decode_ntlmssp_neg_blob'
>> fs/ksmbd/auth.c:353: warning: Function parameter or member 'conn' not described in 'ksmbd_decode_ntlmssp_neg_blob'
   fs/ksmbd/auth.c:353: warning: Excess function parameter 'rsp' description in 'ksmbd_decode_ntlmssp_neg_blob'
   fs/ksmbd/auth.c:353: warning: Excess function parameter 'sess' description in 'ksmbd_decode_ntlmssp_neg_blob'
   fs/ksmbd/auth.c:381: warning: Function parameter or member 'conn' not described in 'ksmbd_build_ntlmssp_challenge_blob'
   fs/ksmbd/auth.c:381: warning: Excess function parameter 'rsp' description in 'ksmbd_build_ntlmssp_challenge_blob'
   fs/ksmbd/auth.c:381: warning: Excess function parameter 'sess' description in 'ksmbd_build_ntlmssp_challenge_blob'


vim +219 fs/ksmbd/auth.c

e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  207  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  208  /**
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  209   * ksmbd_auth_ntlmv2() - NTLMv2 authentication handler
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  210   * @sess:	session of connection
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  211   * @ntlmv2:		NTLMv2 challenge response
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  212   * @blen:		NTLMv2 blob length
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  213   * @domain_name:	domain name
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  214   *
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  215   * Return:	0 on success, error number on error
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  216   */
64b39f4a2fd293 fs/cifsd/auth.c Namjae Jeon       2021-03-30  217  int ksmbd_auth_ntlmv2(struct ksmbd_session *sess, struct ntlmv2_resp *ntlmv2,
f86a1a74d9a7f6 fs/ksmbd/auth.c Namjae Jeon       2021-12-15  218  		      int blen, char *domain_name, char *cryptkey)
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16 @219  {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  220  	char ntlmv2_hash[CIFS_ENCPWD_SIZE];
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  221  	char ntlmv2_rsp[CIFS_HMAC_MD5_HASH_SIZE];
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  222  	struct ksmbd_crypto_ctx *ctx;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  223  	char *construct = NULL;
0e579cd17f8e9c fs/cifsd/auth.c Namjae Jeon       2021-05-26  224  	int rc, len;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  225  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  226  	ctx = ksmbd_crypto_ctx_find_hmacmd5();
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  227  	if (!ctx) {
0e579cd17f8e9c fs/cifsd/auth.c Namjae Jeon       2021-05-26  228  		ksmbd_debug(AUTH, "could not crypto alloc hmacmd5\n");
0e579cd17f8e9c fs/cifsd/auth.c Namjae Jeon       2021-05-26  229  		return -ENOMEM;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  230  	}
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  231  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  232  	rc = calc_ntlmv2_hash(sess, ntlmv2_hash, domain_name);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  233  	if (rc) {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  234  		ksmbd_debug(AUTH, "could not get v2 hash rc %d\n", rc);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  235  		goto out;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  236  	}
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  237  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  238  	rc = crypto_shash_setkey(CRYPTO_HMACMD5_TFM(ctx),
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  239  				 ntlmv2_hash,
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  240  				 CIFS_HMAC_MD5_HASH_SIZE);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  241  	if (rc) {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  242  		ksmbd_debug(AUTH, "Could not set NTLMV2 Hash as a key\n");
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  243  		goto out;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  244  	}
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  245  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  246  	rc = crypto_shash_init(CRYPTO_HMACMD5(ctx));
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  247  	if (rc) {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  248  		ksmbd_debug(AUTH, "Could not init hmacmd5\n");
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  249  		goto out;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  250  	}
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  251  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  252  	len = CIFS_CRYPTO_KEY_SIZE + blen;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  253  	construct = kzalloc(len, GFP_KERNEL);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  254  	if (!construct) {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  255  		rc = -ENOMEM;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  256  		goto out;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  257  	}
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  258  
f86a1a74d9a7f6 fs/ksmbd/auth.c Namjae Jeon       2021-12-15  259  	memcpy(construct, cryptkey, CIFS_CRYPTO_KEY_SIZE);
192cc732c65a7c fs/cifsd/auth.c Namjae Jeon       2021-05-26  260  	memcpy(construct + CIFS_CRYPTO_KEY_SIZE, &ntlmv2->blob_signature, blen);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  261  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  262  	rc = crypto_shash_update(CRYPTO_HMACMD5(ctx), construct, len);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  263  	if (rc) {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  264  		ksmbd_debug(AUTH, "Could not update with response\n");
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  265  		goto out;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  266  	}
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  267  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  268  	rc = crypto_shash_final(CRYPTO_HMACMD5(ctx), ntlmv2_rsp);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  269  	if (rc) {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  270  		ksmbd_debug(AUTH, "Could not generate md5 hash\n");
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  271  		goto out;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  272  	}
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  273  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  274  	rc = ksmbd_gen_sess_key(sess, ntlmv2_hash, ntlmv2_rsp);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  275  	if (rc) {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  276  		ksmbd_debug(AUTH, "Could not generate sess key\n");
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  277  		goto out;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  278  	}
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  279  
b72802aa77dc27 fs/cifsd/auth.c Namjae Jeon       2021-05-26  280  	if (memcmp(ntlmv2->ntlmv2_hash, ntlmv2_rsp, CIFS_HMAC_MD5_HASH_SIZE) != 0)
b72802aa77dc27 fs/cifsd/auth.c Namjae Jeon       2021-05-26  281  		rc = -EINVAL;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  282  out:
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  283  	ksmbd_release_crypto_ctx(ctx);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  284  	kfree(construct);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  285  	return rc;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  286  }
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  287  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  288  /**
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  289   * ksmbd_decode_ntlmssp_auth_blob() - helper function to construct
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  290   * authenticate blob
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  291   * @authblob:	authenticate blob source pointer
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  292   * @usr:	user details
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  293   * @sess:	session of connection
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  294   *
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  295   * Return:	0 on success, error number on error
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  296   */
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  297  int ksmbd_decode_ntlmssp_auth_blob(struct authenticate_message *authblob,
f86a1a74d9a7f6 fs/ksmbd/auth.c Namjae Jeon       2021-12-15  298  				   int blob_len, struct ksmbd_conn *conn,
f86a1a74d9a7f6 fs/ksmbd/auth.c Namjae Jeon       2021-12-15  299  				   struct ksmbd_session *sess)
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  300  {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  301  	char *domain_name;
0d994cd482ee4e fs/ksmbd/auth.c Marios Makassikis 2021-10-19  302  	unsigned int nt_off, dn_off;
0d994cd482ee4e fs/ksmbd/auth.c Marios Makassikis 2021-10-19  303  	unsigned short nt_len, dn_len;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  304  	int ret;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  305  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  306  	if (blob_len < sizeof(struct authenticate_message)) {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  307  		ksmbd_debug(AUTH, "negotiate blob len %d too small\n",
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  308  			    blob_len);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  309  		return -EINVAL;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  310  	}
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  311  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  312  	if (memcmp(authblob->Signature, "NTLMSSP", 8)) {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  313  		ksmbd_debug(AUTH, "blob signature incorrect %s\n",
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  314  			    authblob->Signature);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  315  		return -EINVAL;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  316  	}
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  317  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  318  	nt_off = le32_to_cpu(authblob->NtChallengeResponse.BufferOffset);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  319  	nt_len = le16_to_cpu(authblob->NtChallengeResponse.Length);
0d994cd482ee4e fs/ksmbd/auth.c Marios Makassikis 2021-10-19  320  	dn_off = le32_to_cpu(authblob->DomainName.BufferOffset);
0d994cd482ee4e fs/ksmbd/auth.c Marios Makassikis 2021-10-19  321  	dn_len = le16_to_cpu(authblob->DomainName.Length);
0d994cd482ee4e fs/ksmbd/auth.c Marios Makassikis 2021-10-19  322  
e32f867b37da79 fs/ksmbd/auth.c William Liu       2022-12-30  323  	if (blob_len < (u64)dn_off + dn_len || blob_len < (u64)nt_off + nt_len ||
e32f867b37da79 fs/ksmbd/auth.c William Liu       2022-12-30  324  	    nt_len < CIFS_ENCPWD_SIZE)
0d994cd482ee4e fs/ksmbd/auth.c Marios Makassikis 2021-10-19  325  		return -EINVAL;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  326  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  327  	/* TODO : use domain name that imported from configuration file */
0d994cd482ee4e fs/ksmbd/auth.c Marios Makassikis 2021-10-19  328  	domain_name = smb_strndup_from_utf16((const char *)authblob + dn_off,
f86a1a74d9a7f6 fs/ksmbd/auth.c Namjae Jeon       2021-12-15  329  					     dn_len, true, conn->local_nls);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  330  	if (IS_ERR(domain_name))
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  331  		return PTR_ERR(domain_name);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  332  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  333  	/* process NTLMv2 authentication */
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  334  	ksmbd_debug(AUTH, "decode_ntlmssp_authenticate_blob dname%s\n",
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  335  		    domain_name);
070fb21e5912b6 fs/cifsd/auth.c Namjae Jeon       2021-05-26  336  	ret = ksmbd_auth_ntlmv2(sess, (struct ntlmv2_resp *)((char *)authblob + nt_off),
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  337  				nt_len - CIFS_ENCPWD_SIZE,
f86a1a74d9a7f6 fs/ksmbd/auth.c Namjae Jeon       2021-12-15  338  				domain_name, conn->ntlmssp.cryptkey);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  339  	kfree(domain_name);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  340  	return ret;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  341  }
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  342  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  343  /**
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  344   * ksmbd_decode_ntlmssp_neg_blob() - helper function to construct
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  345   * negotiate blob
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  346   * @negblob: negotiate blob source pointer
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  347   * @rsp:     response header pointer to be updated
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  348   * @sess:    session of connection
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  349   *
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  350   */
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  351  int ksmbd_decode_ntlmssp_neg_blob(struct negotiate_message *negblob,
f86a1a74d9a7f6 fs/ksmbd/auth.c Namjae Jeon       2021-12-15  352  				  int blob_len, struct ksmbd_conn *conn)
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16 @353  {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  354  	if (blob_len < sizeof(struct negotiate_message)) {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  355  		ksmbd_debug(AUTH, "negotiate blob len %d too small\n",
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  356  			    blob_len);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  357  		return -EINVAL;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  358  	}
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  359  
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  360  	if (memcmp(negblob->Signature, "NTLMSSP", 8)) {
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  361  		ksmbd_debug(AUTH, "blob signature incorrect %s\n",
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  362  			    negblob->Signature);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  363  		return -EINVAL;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  364  	}
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  365  
f86a1a74d9a7f6 fs/ksmbd/auth.c Namjae Jeon       2021-12-15  366  	conn->ntlmssp.client_flags = le32_to_cpu(negblob->NegotiateFlags);
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  367  	return 0;
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  368  }
e2f34481b24db2 fs/cifsd/auth.c Namjae Jeon       2021-03-16  369  

:::::: The code at line 219 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
