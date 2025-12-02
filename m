Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88FE305E37
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 08:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664876; cv=none; b=lSfWn1dqfviFSqJzhrHgF1bHLXzLWDtHYTyTq0qz3PH9Axe7rubyHWNCIHEvkUkmhE4qJdUGxSAdJRMCdoILaodJeo5Xo0+SWAt4RdSCtqQoSXnppI6KHva7XVcnlq7r0WYuIFn2n8qSCul6r5Tf2vxRgdvXTbjkgFxOLbI4SsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664876; c=relaxed/simple;
	bh=g+nklhye4q9aHXw3iFljbBjJEt+O0QXk2GoIaCgBDQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hw5ySebAL07ni7knj/t4LyJWw/zpsShAW+yysGJUV2VsFx8AD+rZRXrOw3dANdyluGCZwDlyYP4NUxhfLszqbfEKw+EywmVkSYDuNP/+4MaUZle/bCzkD9Q1y5dN8bSLw3xIvXrpnTU2YHadJsoAvmDgtkZDm0nSL979u8+Nok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGh0mrWq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGh0mrWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764664874; x=1796200874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g+nklhye4q9aHXw3iFljbBjJEt+O0QXk2GoIaCgBDQY=;
  b=CGh0mrWqlhfVlqsL3DzHgvIHvyMzAdFu9AY703UA2lCU+kAaocFAnpyI
   Us6Hb6xT9ldwmuT5lO+Mi4aoTmHuY1fjW0XfsmANyfqq84KZzkLQDFcLM
   T6IA2H4nGeHD8asRB+PwE0gkej3fUz8pYWQMLzYh1lisqPay5MAvaykrl
   bURrk/Pkgt7vtX/FdG6xSxFbNgzo/KwZ1uWflXMt4AkTj9vQQERLm8zaE
   Xp5Rfeq+kYVv1uoV3p8dVFQacpCsP59oxx5n6a1mlCbTwCzc7c3FLjnTB
   rgrtoa7CJKqWQvQTN/EB48rcNYxBXglIrMefHQBtC1RNLE0XU/yy43yM/
   A==;
X-CSE-ConnectionGUID: QghRbrFsRYC72xXLfMUkHw==
X-CSE-MsgGUID: K8Rfv4KfRq+zoJYAJn9kuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66661813"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="66661813"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 00:41:11 -0800
X-CSE-ConnectionGUID: xOIVapr0RaGLSTIYXZTuCQ==
X-CSE-MsgGUID: S9uBhOKBQFq2LTMFT1a4Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="198782174"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Dec 2025 00:41:10 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQLwZ-000000009b7-48CV;
	Tue, 02 Dec 2025 08:41:07 +0000
Date: Tue, 2 Dec 2025 16:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2-session 18/19]
 security/keys/trusted-keys/trusted_tpm2.c:240:3: error: cannot jump from
 this goto statement to its label
Message-ID: <202512021615.4sOxmepy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-session
head:   d27b16c65831821c7dc489619da7a4f22e5d95e1
commit: 9e1990f86d12b41f0b37d9414385587a5e79591c [18/19] tpm-buf: Enable managed and stack allocations.
config: x86_64-randconfig-161-20251202 (https://download.01.org/0day-ci/archive/20251202/202512021615.4sOxmepy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021615.4sOxmepy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021615.4sOxmepy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/keys/trusted-keys/trusted_tpm2.c:240:3: error: cannot jump from this goto statement to its label
     240 |                 goto out_put;
         |                 ^
   security/keys/trusted-keys/trusted_tpm2.c:246:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     246 |         struct tpm_buf *sized __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
         |                         ^
   security/keys/trusted-keys/trusted_tpm2.c:231:3: error: cannot jump from this goto statement to its label
     231 |                 goto out_put;
         |                 ^
   security/keys/trusted-keys/trusted_tpm2.c:246:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     246 |         struct tpm_buf *sized __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
         |                         ^
   security/keys/trusted-keys/trusted_tpm2.c:225:3: error: cannot jump from this goto statement to its label
     225 |                 goto out_put;
         |                 ^
   security/keys/trusted-keys/trusted_tpm2.c:246:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     246 |         struct tpm_buf *sized __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
         |                         ^
   security/keys/trusted-keys/trusted_tpm2.c:227:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     227 |         struct tpm_buf *buf __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
         |                         ^
   3 errors generated.


vim +240 security/keys/trusted-keys/trusted_tpm2.c

f2219745250f38 James Bottomley 2021-01-27  192  
2e19e10131a08d Sumit Garg      2019-10-16  193  /**
2e19e10131a08d Sumit Garg      2019-10-16  194   * tpm2_seal_trusted() - seal the payload of a trusted key
2e19e10131a08d Sumit Garg      2019-10-16  195   *
2e19e10131a08d Sumit Garg      2019-10-16  196   * @chip: TPM chip to use
2e19e10131a08d Sumit Garg      2019-10-16  197   * @payload: the key data in clear and encrypted form
2e19e10131a08d Sumit Garg      2019-10-16  198   * @options: authentication values and other options
2e19e10131a08d Sumit Garg      2019-10-16  199   *
2e19e10131a08d Sumit Garg      2019-10-16  200   * Return: < 0 on error and 0 on success.
2e19e10131a08d Sumit Garg      2019-10-16  201   */
2e19e10131a08d Sumit Garg      2019-10-16  202  int tpm2_seal_trusted(struct tpm_chip *chip,
2e19e10131a08d Sumit Garg      2019-10-16  203  		      struct trusted_key_payload *payload,
2e19e10131a08d Sumit Garg      2019-10-16  204  		      struct trusted_key_options *options)
2e19e10131a08d Sumit Garg      2019-10-16  205  {
40813f1879e7b7 Jarkko Sakkinen 2024-04-29  206  	off_t offset = TPM_HEADER_SIZE;
f2219745250f38 James Bottomley 2021-01-27  207  	int blob_len = 0;
d184cbf94f1fef Jarkko Sakkinen 2025-10-18  208  	int hash;
e5fb5d2c5a03e2 James Bottomley 2021-01-27  209  	u32 flags;
2e19e10131a08d Sumit Garg      2019-10-16  210  	int rc;
2e19e10131a08d Sumit Garg      2019-10-16  211  
d184cbf94f1fef Jarkko Sakkinen 2025-10-18  212  	hash = tpm2_find_hash_alg(options->hash);
d184cbf94f1fef Jarkko Sakkinen 2025-10-18  213  	if (hash < 0)
d184cbf94f1fef Jarkko Sakkinen 2025-10-18  214  		return hash;
2e19e10131a08d Sumit Garg      2019-10-16  215  
f2219745250f38 James Bottomley 2021-01-27  216  	if (!options->keyhandle)
f2219745250f38 James Bottomley 2021-01-27  217  		return -EINVAL;
f2219745250f38 James Bottomley 2021-01-27  218  
9d5171eab462a6 James Bottomley 2021-04-21  219  	rc = tpm_try_get_ops(chip);
2e19e10131a08d Sumit Garg      2019-10-16  220  	if (rc)
2e19e10131a08d Sumit Garg      2019-10-16  221  		return rc;
2e19e10131a08d Sumit Garg      2019-10-16  222  
52ce7d9731ed8f James Bottomley 2024-04-29  223  	rc = tpm2_start_auth_session(chip);
52ce7d9731ed8f James Bottomley 2024-04-29  224  	if (rc)
52ce7d9731ed8f James Bottomley 2024-04-29  225  		goto out_put;
52ce7d9731ed8f James Bottomley 2024-04-29  226  
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  227  	struct tpm_buf *buf __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  228  	if (!buf) {
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  229  		rc = -ENOMEM;
52ce7d9731ed8f James Bottomley 2024-04-29  230  		tpm2_end_auth_session(chip);
52ce7d9731ed8f James Bottomley 2024-04-29  231  		goto out_put;
8c657a0590de58 Jarkko Sakkinen 2021-01-29  232  	}
8c657a0590de58 Jarkko Sakkinen 2021-01-29  233  
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  234  	tpm_buf_init(buf, TPM_BUFSIZE);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  235  	tpm_buf_reset(buf, TPM2_ST_SESSIONS, TPM2_CC_CREATE);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  236  
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  237  	rc = tpm_buf_append_name(chip, buf, options->keyhandle, NULL);
40813f1879e7b7 Jarkko Sakkinen 2024-04-29  238  	if (rc) {
52ce7d9731ed8f James Bottomley 2024-04-29  239  		tpm2_end_auth_session(chip);
52ce7d9731ed8f James Bottomley 2024-04-29 @240  		goto out_put;
40813f1879e7b7 Jarkko Sakkinen 2024-04-29  241  	}
40813f1879e7b7 Jarkko Sakkinen 2024-04-29  242  
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  243  	tpm_buf_append_hmac_session(chip, buf, TPM2_SA_DECRYPT,
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  244  				    options->keyauth, TPM_DIGEST_SIZE);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  245  
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  246  	struct tpm_buf *sized __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  247  	if (!sized) {
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  248  		rc = -ENOMEM;
c094b019ad8943 Jarkko Sakkinen 2025-11-30  249  		tpm2_end_auth_session(chip);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  250  		goto out_put;
c094b019ad8943 Jarkko Sakkinen 2025-11-30  251  	}
c094b019ad8943 Jarkko Sakkinen 2025-11-30  252  
2e19e10131a08d Sumit Garg      2019-10-16  253  	/* sensitive */
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  254  	tpm_buf_init_sized(sized, TPM_BUFSIZE);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  255  	tpm_buf_append_u16(sized, options->blobauth_len);
de66514d934d70 James Bottomley 2021-01-27  256  
de66514d934d70 James Bottomley 2021-01-27  257  	if (options->blobauth_len)
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  258  		tpm_buf_append(sized, options->blobauth, options->blobauth_len);
2e19e10131a08d Sumit Garg      2019-10-16  259  
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  260  	tpm_buf_append_u16(sized, payload->key_len);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  261  	tpm_buf_append(sized, payload->key, payload->key_len);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  262  	tpm_buf_append(buf, sized->data, sized->length);
2e19e10131a08d Sumit Garg      2019-10-16  263  
2e19e10131a08d Sumit Garg      2019-10-16  264  	/* public */
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  265  	tpm_buf_init_sized(sized, TPM_BUFSIZE);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  266  	tpm_buf_append_u16(sized, TPM_ALG_KEYEDHASH);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  267  	tpm_buf_append_u16(sized, hash);
2e19e10131a08d Sumit Garg      2019-10-16  268  
e5fb5d2c5a03e2 James Bottomley 2021-01-27  269  	/* key properties */
e5fb5d2c5a03e2 James Bottomley 2021-01-27  270  	flags = 0;
e5fb5d2c5a03e2 James Bottomley 2021-01-27  271  	flags |= options->policydigest_len ? 0 : TPM2_OA_USER_WITH_AUTH;
40813f1879e7b7 Jarkko Sakkinen 2024-04-29  272  	flags |= payload->migratable ? 0 : (TPM2_OA_FIXED_TPM | TPM2_OA_FIXED_PARENT);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  273  	tpm_buf_append_u32(sized, flags);
e5fb5d2c5a03e2 James Bottomley 2021-01-27  274  
2e19e10131a08d Sumit Garg      2019-10-16  275  	/* policy */
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  276  	tpm_buf_append_u16(sized, options->policydigest_len);
e5fb5d2c5a03e2 James Bottomley 2021-01-27  277  	if (options->policydigest_len)
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  278  		tpm_buf_append(sized, options->policydigest, options->policydigest_len);
2e19e10131a08d Sumit Garg      2019-10-16  279  
2e19e10131a08d Sumit Garg      2019-10-16  280  	/* public parameters */
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  281  	tpm_buf_append_u16(sized, TPM_ALG_NULL);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  282  	tpm_buf_append_u16(sized, 0);
40813f1879e7b7 Jarkko Sakkinen 2024-04-29  283  
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  284  	tpm_buf_append(buf, sized->data, sized->length);
2e19e10131a08d Sumit Garg      2019-10-16  285  
2e19e10131a08d Sumit Garg      2019-10-16  286  	/* outside info */
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  287  	tpm_buf_append_u16(buf, 0);
2e19e10131a08d Sumit Garg      2019-10-16  288  
2e19e10131a08d Sumit Garg      2019-10-16  289  	/* creation PCR */
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  290  	tpm_buf_append_u32(buf, 0);
2e19e10131a08d Sumit Garg      2019-10-16  291  
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  292  	if (buf->flags & TPM_BUF_INVALID) {
2e19e10131a08d Sumit Garg      2019-10-16  293  		rc = -E2BIG;
52ce7d9731ed8f James Bottomley 2024-04-29  294  		tpm2_end_auth_session(chip);
2e19e10131a08d Sumit Garg      2019-10-16  295  		goto out;
2e19e10131a08d Sumit Garg      2019-10-16  296  	}
2e19e10131a08d Sumit Garg      2019-10-16  297  
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  298  	rc = tpm_buf_fill_hmac_session(chip, buf);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  299  	if (rc) {
c094b019ad8943 Jarkko Sakkinen 2025-11-30  300  		tpm2_end_auth_session(chip);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  301  		goto out;
c094b019ad8943 Jarkko Sakkinen 2025-11-30  302  	}
c094b019ad8943 Jarkko Sakkinen 2025-11-30  303  
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  304  	rc = tpm_transmit_cmd(chip, buf, 4, "sealing data");
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  305  	rc = tpm_buf_check_hmac_response(chip, buf, rc);
2e19e10131a08d Sumit Garg      2019-10-16  306  	if (rc)
2e19e10131a08d Sumit Garg      2019-10-16  307  		goto out;
2e19e10131a08d Sumit Garg      2019-10-16  308  
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  309  	blob_len = tpm_buf_read_u32(buf, &offset);
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  310  	if (blob_len > MAX_BLOB_SIZE || buf->flags & TPM_BUF_INVALID) {
2e19e10131a08d Sumit Garg      2019-10-16  311  		rc = -E2BIG;
2e19e10131a08d Sumit Garg      2019-10-16  312  		goto out;
2e19e10131a08d Sumit Garg      2019-10-16  313  	}
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  314  	if (buf->length - offset < blob_len) {
2e19e10131a08d Sumit Garg      2019-10-16  315  		rc = -EFAULT;
2e19e10131a08d Sumit Garg      2019-10-16  316  		goto out;
2e19e10131a08d Sumit Garg      2019-10-16  317  	}
2e19e10131a08d Sumit Garg      2019-10-16  318  
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  319  	blob_len = tpm2_key_encode(payload, options, &buf->data[offset],
9e1990f86d12b4 Jarkko Sakkinen 2025-10-18  320  				   blob_len);
6bd23dd7108d47 Jarkko Sakkinen 2025-09-30  321  	if (blob_len < 0)
6bd23dd7108d47 Jarkko Sakkinen 2025-09-30  322  		rc = blob_len;
2e19e10131a08d Sumit Garg      2019-10-16  323  
2e19e10131a08d Sumit Garg      2019-10-16  324  out:
6bd23dd7108d47 Jarkko Sakkinen 2025-09-30  325  	if (!rc)
f2219745250f38 James Bottomley 2021-01-27  326  		payload->blob_len = blob_len;
2e19e10131a08d Sumit Garg      2019-10-16  327  
52ce7d9731ed8f James Bottomley 2024-04-29  328  out_put:
8c657a0590de58 Jarkko Sakkinen 2021-01-29  329  	tpm_put_ops(chip);
6bd23dd7108d47 Jarkko Sakkinen 2025-09-30  330  	return tpm_ret_to_err(rc);
2e19e10131a08d Sumit Garg      2019-10-16  331  }
2e19e10131a08d Sumit Garg      2019-10-16  332  

:::::: The code at line 240 was first introduced by commit
:::::: 52ce7d9731ed8fada505b5ac33fb1df0190fb8c3 KEYS: trusted: Add session encryption protection to the seal/unseal path

:::::: TO: James Bottomley <James.Bottomley@HansenPartnership.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
