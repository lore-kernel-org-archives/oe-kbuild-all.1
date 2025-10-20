Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C53EEC3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 02:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760928389; cv=none; b=DQKDRYvJr4OrLM4pGuK36JKa1wJkMZ/hZBgm7u9zwCzYeUkzO4FzX6wOGYOf7vokl3BWdyiKLPDd9jJrguHXHAUDCZda+GCQ/6kifHkc3lkk3vHPjIXMEu2cpGgYmyA/b5HoB0K5M9vaX6sSxNOxRVyRhY9ZSAdzegVcweWqun8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760928389; c=relaxed/simple;
	bh=KBi530TboniJaTwCeE2a1WutuImuDnUYQMOA/rqd4vU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sph28sdn6gt2hcWYEnxaLk89OFfFkWVOfsTBRVKjCp1CUxTZQSYfK/cfdcvIhyVhjucarVC6iUgkTUMnbv+MHZa2aIs9rn0Mb4lNNpMm1rspA3q5ZS4pqFW5crpDicrQuJj15HBNesqg3+l5Z+7vI0+icSGPF6huMPPJrT9a8o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bl+iX4Bg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bl+iX4Bg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760928387; x=1792464387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KBi530TboniJaTwCeE2a1WutuImuDnUYQMOA/rqd4vU=;
  b=Bl+iX4Bgaf/0Xs5DuQZn8EU4eGzfipHVprxD9EVhMRTWxhu88QXF37sr
   alJoX75soS16jNKwMTYR+1QHcjevXMqwVSWON0bm95wmLHo+/2M63+usf
   q2mKbvO6aq4L4RrXidIvEH47CDMdcaN2t7H1tBvGX81JzjdwVZN+SOrwh
   kMmki+rouU3DkQLQ/IIGdXDwI2ImweQACgk5TlAtqy4HNPcSqTd6ODbWb
   D3u1WTshgGRE8AjKTUo4d3AkFxE6/AdtWFxdaTRmDdzD3+1lrvbXpPc5H
   1mfUhOWgvHbUaPkNukl4XMiDg//Gbfi3FURrXMp4Hrvn4bX7HkemqJ3Ph
   g==;
X-CSE-ConnectionGUID: 8T8ooVAMQk6i9XmisqlDHw==
X-CSE-MsgGUID: Xvcdqk/7S5efqKzganMVwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="74391604"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="74391604"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 19:46:26 -0700
X-CSE-ConnectionGUID: X8J2QU/DRb+eGoeOouac6Q==
X-CSE-MsgGUID: aHubJ0hdRG+2HW0f6xFFqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="183992621"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Oct 2025 19:46:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAfuf-0009RD-15;
	Mon, 20 Oct 2025 02:46:21 +0000
Date: Mon, 20 Oct 2025 10:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2-session 14/14]
 security/keys/trusted-keys/trusted_tpm2.c:223:3: error: cannot jump from
 this goto statement to its label
Message-ID: <202510201052.noFlq0an-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-session
head:   6052ba5bcb761d01668af291ca6d9951b3408c33
commit: 6052ba5bcb761d01668af291ca6d9951b3408c33 [14/14] tpm-buf: Enable managed and stack allocations.
config: i386-buildonly-randconfig-005-20251020 (https://download.01.org/0day-ci/archive/20251020/202510201052.noFlq0an-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510201052.noFlq0an-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510201052.noFlq0an-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/keys/trusted-keys/trusted_tpm2.c:223:3: error: cannot jump from this goto statement to its label
     223 |                 goto out_put;
         |                 ^
   security/keys/trusted-keys/trusted_tpm2.c:235:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     235 |         struct tpm_buf *sized __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
         |                         ^
   security/keys/trusted-keys/trusted_tpm2.c:225:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     225 |         struct tpm_buf *buf __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
         |                         ^
   1 error generated.


vim +223 security/keys/trusted-keys/trusted_tpm2.c

f2219745250f38 James Bottomley 2021-01-27  190  
2e19e10131a08d Sumit Garg      2019-10-16  191  /**
2e19e10131a08d Sumit Garg      2019-10-16  192   * tpm2_seal_trusted() - seal the payload of a trusted key
2e19e10131a08d Sumit Garg      2019-10-16  193   *
2e19e10131a08d Sumit Garg      2019-10-16  194   * @chip: TPM chip to use
2e19e10131a08d Sumit Garg      2019-10-16  195   * @payload: the key data in clear and encrypted form
2e19e10131a08d Sumit Garg      2019-10-16  196   * @options: authentication values and other options
2e19e10131a08d Sumit Garg      2019-10-16  197   *
2e19e10131a08d Sumit Garg      2019-10-16  198   * Return: < 0 on error and 0 on success.
2e19e10131a08d Sumit Garg      2019-10-16  199   */
2e19e10131a08d Sumit Garg      2019-10-16  200  int tpm2_seal_trusted(struct tpm_chip *chip,
2e19e10131a08d Sumit Garg      2019-10-16  201  		      struct trusted_key_payload *payload,
2e19e10131a08d Sumit Garg      2019-10-16  202  		      struct trusted_key_options *options)
2e19e10131a08d Sumit Garg      2019-10-16  203  {
40813f1879e7b7 Jarkko Sakkinen 2024-04-29  204  	off_t offset = TPM_HEADER_SIZE;
f2219745250f38 James Bottomley 2021-01-27  205  	int blob_len = 0;
8d4ac9f8e47cf0 Jarkko Sakkinen 2025-10-18  206  	int hash;
e5fb5d2c5a03e2 James Bottomley 2021-01-27  207  	u32 flags;
2e19e10131a08d Sumit Garg      2019-10-16  208  	int rc;
2e19e10131a08d Sumit Garg      2019-10-16  209  
f2219745250f38 James Bottomley 2021-01-27  210  	if (!options->keyhandle)
f2219745250f38 James Bottomley 2021-01-27  211  		return -EINVAL;
f2219745250f38 James Bottomley 2021-01-27  212  
8d4ac9f8e47cf0 Jarkko Sakkinen 2025-10-18  213  	hash = tpm2_find_hash_alg(options->hash);
8d4ac9f8e47cf0 Jarkko Sakkinen 2025-10-18  214  	if (hash)
8d4ac9f8e47cf0 Jarkko Sakkinen 2025-10-18  215  		return hash;
8d4ac9f8e47cf0 Jarkko Sakkinen 2025-10-18  216  
9d5171eab462a6 James Bottomley 2021-04-21  217  	rc = tpm_try_get_ops(chip);
2e19e10131a08d Sumit Garg      2019-10-16  218  	if (rc)
2e19e10131a08d Sumit Garg      2019-10-16  219  		return rc;
2e19e10131a08d Sumit Garg      2019-10-16  220  
52ce7d9731ed8f James Bottomley 2024-04-29  221  	rc = tpm2_start_auth_session(chip);
52ce7d9731ed8f James Bottomley 2024-04-29  222  	if (rc)
52ce7d9731ed8f James Bottomley 2024-04-29 @223  		goto out_put;
52ce7d9731ed8f James Bottomley 2024-04-29  224  
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  225  	struct tpm_buf *buf __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  226  	if (!buf)
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  227  		return -ENOMEM;
40813f1879e7b7 Jarkko Sakkinen 2024-04-29  228  
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  229  	tpm_buf_init(buf, TPM_BUFSIZE);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  230  	tpm_buf_reset(buf, TPM2_ST_SESSIONS, TPM2_CC_CREATE);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  231  	tpm_buf_append_name(chip, buf, options->keyhandle, NULL);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  232  	tpm_buf_append_hmac_session(chip, buf, TPM2_SA_DECRYPT,
52ce7d9731ed8f James Bottomley 2024-04-29  233  				    options->keyauth, TPM_DIGEST_SIZE);
2e19e10131a08d Sumit Garg      2019-10-16  234  
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  235  	struct tpm_buf *sized __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  236  	if (!sized)
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  237  		return -ENOMEM;
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  238  
2e19e10131a08d Sumit Garg      2019-10-16  239  	/* sensitive */
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  240  	tpm_buf_init_sized(sized, TPM_BUFSIZE);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  241  	tpm_buf_append_u16(sized, options->blobauth_len);
de66514d934d70 James Bottomley 2021-01-27  242  
de66514d934d70 James Bottomley 2021-01-27  243  	if (options->blobauth_len)
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  244  		tpm_buf_append(sized, options->blobauth, options->blobauth_len);
2e19e10131a08d Sumit Garg      2019-10-16  245  
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  246  	tpm_buf_append_u16(sized, payload->key_len);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  247  	tpm_buf_append(sized, payload->key, payload->key_len);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  248  	tpm_buf_append(buf, sized->data, sized->length);
2e19e10131a08d Sumit Garg      2019-10-16  249  
2e19e10131a08d Sumit Garg      2019-10-16  250  	/* public */
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  251  	tpm_buf_init_sized(sized, TPM_BUFSIZE);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  252  	tpm_buf_append_u16(sized, TPM_ALG_KEYEDHASH);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  253  	tpm_buf_append_u16(sized, hash);
2e19e10131a08d Sumit Garg      2019-10-16  254  
e5fb5d2c5a03e2 James Bottomley 2021-01-27  255  	/* key properties */
e5fb5d2c5a03e2 James Bottomley 2021-01-27  256  	flags = 0;
e5fb5d2c5a03e2 James Bottomley 2021-01-27  257  	flags |= options->policydigest_len ? 0 : TPM2_OA_USER_WITH_AUTH;
40813f1879e7b7 Jarkko Sakkinen 2024-04-29  258  	flags |= payload->migratable ? 0 : (TPM2_OA_FIXED_TPM | TPM2_OA_FIXED_PARENT);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  259  	tpm_buf_append_u32(sized, flags);
e5fb5d2c5a03e2 James Bottomley 2021-01-27  260  
2e19e10131a08d Sumit Garg      2019-10-16  261  	/* policy */
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  262  	tpm_buf_append_u16(sized, options->policydigest_len);
e5fb5d2c5a03e2 James Bottomley 2021-01-27  263  	if (options->policydigest_len)
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  264  		tpm_buf_append(sized, options->policydigest, options->policydigest_len);
2e19e10131a08d Sumit Garg      2019-10-16  265  
2e19e10131a08d Sumit Garg      2019-10-16  266  	/* public parameters */
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  267  	tpm_buf_append_u16(sized, TPM_ALG_NULL);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  268  	tpm_buf_append_u16(sized, 0);
40813f1879e7b7 Jarkko Sakkinen 2024-04-29  269  
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  270  	tpm_buf_append(buf, sized->data, sized->length);
2e19e10131a08d Sumit Garg      2019-10-16  271  
2e19e10131a08d Sumit Garg      2019-10-16  272  	/* outside info */
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  273  	tpm_buf_append_u16(buf, 0);
2e19e10131a08d Sumit Garg      2019-10-16  274  
2e19e10131a08d Sumit Garg      2019-10-16  275  	/* creation PCR */
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  276  	tpm_buf_append_u32(buf, 0);
2e19e10131a08d Sumit Garg      2019-10-16  277  
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  278  	if (buf->flags & TPM_BUF_INVALID) {
2e19e10131a08d Sumit Garg      2019-10-16  279  		rc = -E2BIG;
52ce7d9731ed8f James Bottomley 2024-04-29  280  		tpm2_end_auth_session(chip);
2e19e10131a08d Sumit Garg      2019-10-16  281  		goto out;
2e19e10131a08d Sumit Garg      2019-10-16  282  	}
2e19e10131a08d Sumit Garg      2019-10-16  283  
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  284  	tpm_buf_fill_hmac_session(chip, buf);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  285  	rc = tpm_transmit_cmd(chip, buf, 4, "sealing data");
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  286  	rc = tpm_buf_check_hmac_response(chip, buf, rc);
2e19e10131a08d Sumit Garg      2019-10-16  287  	if (rc)
2e19e10131a08d Sumit Garg      2019-10-16  288  		goto out;
2e19e10131a08d Sumit Garg      2019-10-16  289  
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  290  	blob_len = tpm_buf_read_u32(buf, &offset);
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  291  	if (blob_len > MAX_BLOB_SIZE || buf->flags & TPM_BUF_INVALID) {
2e19e10131a08d Sumit Garg      2019-10-16  292  		rc = -E2BIG;
2e19e10131a08d Sumit Garg      2019-10-16  293  		goto out;
2e19e10131a08d Sumit Garg      2019-10-16  294  	}
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  295  	if (buf->length - offset < blob_len) {
2e19e10131a08d Sumit Garg      2019-10-16  296  		rc = -EFAULT;
2e19e10131a08d Sumit Garg      2019-10-16  297  		goto out;
2e19e10131a08d Sumit Garg      2019-10-16  298  	}
2e19e10131a08d Sumit Garg      2019-10-16  299  
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  300  	blob_len = tpm2_key_encode(payload, options, &buf->data[offset],
6052ba5bcb761d Jarkko Sakkinen 2025-10-18  301  				   blob_len);
908afede190b2a Jarkko Sakkinen 2025-09-30  302  	if (blob_len < 0)
908afede190b2a Jarkko Sakkinen 2025-09-30  303  		rc = blob_len;
2e19e10131a08d Sumit Garg      2019-10-16  304  
2e19e10131a08d Sumit Garg      2019-10-16  305  out:
908afede190b2a Jarkko Sakkinen 2025-09-30  306  	if (!rc)
f2219745250f38 James Bottomley 2021-01-27  307  		payload->blob_len = blob_len;
2e19e10131a08d Sumit Garg      2019-10-16  308  
52ce7d9731ed8f James Bottomley 2024-04-29  309  out_put:
8c657a0590de58 Jarkko Sakkinen 2021-01-29  310  	tpm_put_ops(chip);
908afede190b2a Jarkko Sakkinen 2025-09-30  311  	return tpm_ret_to_err(rc);
2e19e10131a08d Sumit Garg      2019-10-16  312  }
2e19e10131a08d Sumit Garg      2019-10-16  313  

:::::: The code at line 223 was first introduced by commit
:::::: 52ce7d9731ed8fada505b5ac33fb1df0190fb8c3 KEYS: trusted: Add session encryption protection to the seal/unseal path

:::::: TO: James Bottomley <James.Bottomley@HansenPartnership.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
