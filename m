Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84D2C0287
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766265469; cv=none; b=nGYuG8Oi1FpKfSmQtNQ9JYn2jpeQYDrd4sI3b5gnk+rmLdMLsLR4VbUOXcqtrosGED4JK0kuUk4mfaCb+sVOyFBpqy2kV2BZyAka1WOHBrTw00MyBLGmsUBgHd1Ur6fwb5A8Er9OeaYd3EMmbQGFXjxKQohvOMA2pbDjspOmK5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766265469; c=relaxed/simple;
	bh=FXrOnqlc4WYPvKHKcrc3PI9Dv3w7QuLgqVECu8wq7KA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XHmPPDy5gquFwYC27XvW7sHRWi8ToFeSan4NErBy8JyHyPVPO82DNZ/oIrG/SJJkfwCN43KzNDYcoNMI+sH5/n15pyFBU1n/2SyfySNY5kh5DoqfkWZwbfDJFyaO9dJE62MsLz1ho7E4belUcBfNGT3RMC8NimlUDT5yInl1CdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V32oAVvz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V32oAVvz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766265467; x=1797801467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FXrOnqlc4WYPvKHKcrc3PI9Dv3w7QuLgqVECu8wq7KA=;
  b=V32oAVvz9BWKGR+zkYjf8YsHsBDuGgMelOBbM2kg1e90uOmKDZAmesg/
   BRTdIGgkjc0x0ha4wimohFiu5l+wtgv1Nzn3K4+fWq56ldb/PBrmbfwkS
   kFSDoHJ/pZOUwwellnGtg3YnlMks/cweLr6r2luVyMGaLVJYZHsLFwspw
   edgdQ8Rrwf/BkjMmyM/y+HsV7EZWE2peVucGeAg34pnbKwjHI7ODeoyaD
   93fAK20210FqO/GkdZ8zyyDJtI4pR02L9OB97ODwz6WDZO74sQ9AfsLz3
   Tl34cpkwWknk+hNV+FP/IS5+vziRILtroleZ4AnnPV5c/jGfFIc4gQa9N
   Q==;
X-CSE-ConnectionGUID: Z1PnU3c+QIWJKUmt0dnpzQ==
X-CSE-MsgGUID: 0+ZolqaBSsKmo6khq/3ApQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79304522"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79304522"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 13:17:45 -0800
X-CSE-ConnectionGUID: vbAaEfGTSRyYDru+VjZDFA==
X-CSE-MsgGUID: 9QaftXSwSomkg3txu7Mdkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="222646932"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2025 13:17:44 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX4Kc-0000000058R-1Oyu;
	Sat, 20 Dec 2025 21:17:42 +0000
Date: Sun, 21 Dec 2025 05:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:queue 12/12]
 security/keys/trusted-keys/trusted_tpm2.c:248:3: error: cannot jump from
 this goto statement to its label
Message-ID: <202512210536.ssFoIz37-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git queue
head:   31e6df282451558afbaf74a329dc31932c0b0a7b
commit: 31e6df282451558afbaf74a329dc31932c0b0a7b [12/12] tpm-buf: Implement managed allocations
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251221/202512210536.ssFoIz37-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210536.ssFoIz37-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210536.ssFoIz37-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/keys/trusted-keys/trusted_tpm2.c:248:3: error: cannot jump from this goto statement to its label
     248 |                 goto out_put;
         |                 ^
   security/keys/trusted-keys/trusted_tpm2.c:253:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     253 |         struct tpm_buf *sized __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
         |                         ^
   security/keys/trusted-keys/trusted_tpm2.c:239:3: error: cannot jump from this goto statement to its label
     239 |                 goto out_put;
         |                 ^
   security/keys/trusted-keys/trusted_tpm2.c:253:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     253 |         struct tpm_buf *sized __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
         |                         ^
   security/keys/trusted-keys/trusted_tpm2.c:233:3: error: cannot jump from this goto statement to its label
     233 |                 goto out_put;
         |                 ^
   security/keys/trusted-keys/trusted_tpm2.c:253:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     253 |         struct tpm_buf *sized __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
         |                         ^
   security/keys/trusted-keys/trusted_tpm2.c:235:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     235 |         struct tpm_buf *buf __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
         |                         ^
   security/keys/trusted-keys/trusted_tpm2.c:227:3: error: cannot jump from this goto statement to its label
     227 |                 goto out_put;
         |                 ^
   security/keys/trusted-keys/trusted_tpm2.c:253:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     253 |         struct tpm_buf *sized __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
         |                         ^
   security/keys/trusted-keys/trusted_tpm2.c:235:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     235 |         struct tpm_buf *buf __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
         |                         ^
   4 errors generated.


vim +248 security/keys/trusted-keys/trusted_tpm2.c

   192	
   193	/**
   194	 * tpm2_seal_trusted() - seal the payload of a trusted key
   195	 *
   196	 * @chip: TPM chip to use
   197	 * @payload: the key data in clear and encrypted form
   198	 * @options: authentication values and other options
   199	 *
   200	 * Return: < 0 on error and 0 on success.
   201	 */
   202	int tpm2_seal_trusted(struct tpm_chip *chip,
   203			      struct trusted_key_payload *payload,
   204			      struct trusted_key_options *options)
   205	{
   206		u8 parent_name[TPM2_MAX_NAME_SIZE];
   207		off_t offset = TPM_HEADER_SIZE;
   208		u16 parent_name_size;
   209		int blob_len = 0;
   210		int hash;
   211		u32 flags;
   212		int rc;
   213	
   214		hash = tpm2_find_hash_alg(options->hash);
   215		if (hash < 0)
   216			return hash;
   217	
   218		if (!options->keyhandle)
   219			return -EINVAL;
   220	
   221		rc = tpm_try_get_ops(chip);
   222		if (rc)
   223			return rc;
   224	
   225		rc = tpm2_read_public(chip, options->keyhandle, parent_name);
   226		if (rc < 0)
   227			goto out_put;
   228	
   229		parent_name_size = rc;
   230	
   231		rc = tpm2_start_auth_session(chip);
   232		if (rc)
   233			goto out_put;
   234	
   235		struct tpm_buf *buf __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
   236		if (!buf) {
   237			rc = -ENOMEM;
   238			tpm2_end_auth_session(chip);
   239			goto out_put;
   240		}
   241	
   242		tpm_buf_init(buf, TPM_BUFSIZE);
   243		tpm_buf_reset(buf, TPM2_ST_SESSIONS, TPM2_CC_CREATE);
   244	
   245		rc = tpm_buf_append_name(chip, buf, options->keyhandle, parent_name,
   246					 parent_name_size);
   247		if (rc)
 > 248			goto out_put;
   249	
   250		tpm_buf_append_hmac_session(chip, buf, TPM2_SA_DECRYPT,
   251					    options->keyauth, TPM_DIGEST_SIZE);
   252	
   253		struct tpm_buf *sized __free(kfree) = kzalloc(TPM_BUFSIZE, GFP_KERNEL);
   254		if (!sized) {
   255			rc = -ENOMEM;
   256			tpm2_end_auth_session(chip);
   257			goto out_put;
   258		}
   259	
   260		/* sensitive */
   261		tpm_buf_init_sized(sized, TPM_BUFSIZE);
   262		tpm_buf_append_u16(sized, options->blobauth_len);
   263	
   264		if (options->blobauth_len)
   265			tpm_buf_append(sized, options->blobauth, options->blobauth_len);
   266	
   267		tpm_buf_append_u16(sized, payload->key_len);
   268		tpm_buf_append(sized, payload->key, payload->key_len);
   269		tpm_buf_append(buf, sized->data, sized->length);
   270	
   271		/* public */
   272		tpm_buf_init_sized(sized, TPM_BUFSIZE);
   273		tpm_buf_append_u16(sized, TPM_ALG_KEYEDHASH);
   274		tpm_buf_append_u16(sized, hash);
   275	
   276		/* key properties */
   277		flags = 0;
   278		flags |= options->policydigest_len ? 0 : TPM2_OA_USER_WITH_AUTH;
   279		flags |= payload->migratable ? 0 : (TPM2_OA_FIXED_TPM | TPM2_OA_FIXED_PARENT);
   280		tpm_buf_append_u32(sized, flags);
   281	
   282		/* policy */
   283		tpm_buf_append_u16(sized, options->policydigest_len);
   284		if (options->policydigest_len)
   285			tpm_buf_append(sized, options->policydigest, options->policydigest_len);
   286	
   287		/* public parameters */
   288		tpm_buf_append_u16(sized, TPM_ALG_NULL);
   289		tpm_buf_append_u16(sized, 0);
   290	
   291		tpm_buf_append(buf, sized->data, sized->length);
   292	
   293		/* outside info */
   294		tpm_buf_append_u16(buf, 0);
   295	
   296		/* creation PCR */
   297		tpm_buf_append_u32(buf, 0);
   298	
   299		if (buf->flags & TPM_BUF_INVALID) {
   300			rc = -E2BIG;
   301			tpm2_end_auth_session(chip);
   302			goto out;
   303		}
   304	
   305		rc = tpm_buf_fill_hmac_session(chip, buf);
   306		if (rc)
   307			goto out;
   308	
   309		rc = tpm_transmit_cmd(chip, buf, 4, "sealing data");
   310		rc = tpm_buf_check_hmac_response(chip, buf, rc);
   311		if (rc)
   312			goto out;
   313	
   314		blob_len = tpm_buf_read_u32(buf, &offset);
   315		if (blob_len > MAX_BLOB_SIZE || buf->flags & TPM_BUF_INVALID) {
   316			rc = -E2BIG;
   317			goto out;
   318		}
   319		if (buf->length - offset < blob_len) {
   320			rc = -EFAULT;
   321			goto out;
   322		}
   323	
   324		blob_len = tpm2_key_encode(payload, options, &buf->data[offset], blob_len);
   325		if (blob_len < 0)
   326			rc = blob_len;
   327	
   328	out:
   329		if (!rc)
   330			payload->blob_len = blob_len;
   331	
   332	out_put:
   333		tpm_put_ops(chip);
   334		return tpm_ret_to_err(rc);
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
