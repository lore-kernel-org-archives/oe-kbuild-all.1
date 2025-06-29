Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B481D5CDE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751221828; cv=none; b=A2vbJKp6/XGb8M7Hs3/FMELxEzbvlALKgGb4eg5tDtAU7n+butD7vX+K3tGSla9SUgoXDDAlsNrEb5QnWxVuIL+Tz8rUI77DvW8tFJcB+D8d8o/nwYnjGJ9GIspVVZuhapo6jS5m+TaEGmJV4K/vtbtu8rWue7YTwnxgnaFgNR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751221828; c=relaxed/simple;
	bh=BhIBTvrMgsYNGDfpGF1uxTJ4JQgfKlmMzNuTYYWm450=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=subDGeE629T3sgw189beubrTpbDzSqIfQ2BYdX2UXP+mtF2q/s5+TsqPoIBbesyo8IfubN9P4jnVaRTev1mXHHgY5BgDPcU4SqtCEIHWi13eOO7niY95INUH1GsVmQzjHRO0yGYDV8hbjt73PqWrmx+vIQlo6hNx5Y/7Xa3suRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWZsiA+7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWZsiA+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751221827; x=1782757827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BhIBTvrMgsYNGDfpGF1uxTJ4JQgfKlmMzNuTYYWm450=;
  b=eWZsiA+7yMueM9vl1s2uW/Ya0UfJiKoUlPT+TtY9j99cDGwO+Jwo/iCr
   xrWBIwyX7LSmRL+ARmZfysOoHvO/OpxXSMp4BjrzKN4Rpw4cQ7vBQh135
   cxZmEDYD/UfjfP8AYJrYv1WPcjNhvZZbrkYr5nsfHz7Mq1pOsxyDxIxQ5
   EjM4Lk+0mxhk61dVe86gYKqJBkqr0wx5e2rzmpPcWyBToO/ksLNIvROVL
   o8pZFwxzTBC+x/C6ueHxv+Y3CyLglymypYBhE5vIEz3gT1WBjmNx+/nWi
   laVfZUfl+frvt4O0Dsfv1v/zpIWL5nYlYv1T6IEt3zQ/HoK6/z3Y3ZG1q
   g==;
X-CSE-ConnectionGUID: 6FYySkTnQwCnkF2Wd3TJWw==
X-CSE-MsgGUID: f/IFdxinTC2UzvoaM40rdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53175792"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="53175792"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 11:30:19 -0700
X-CSE-ConnectionGUID: 7TvhHny/Tp+8jfs7ipFBeg==
X-CSE-MsgGUID: L4TcSxAzR7mIRt/nkR5FGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="152652623"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jun 2025 11:30:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVwnA-000Y9C-0H;
	Sun, 29 Jun 2025 18:30:16 +0000
Date: Mon, 30 Jun 2025 02:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] tpm: Cleanup class for tpm_buf
Message-ID: <202506300442.B7u3tOmo-lkp@intel.com>
References: <20250626101935.1007898-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626101935.1007898-1-jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm-Cleanup-class-for-tpm_buf/20250626-182148
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250626101935.1007898-1-jarkko%40kernel.org
patch subject: [PATCH v2] tpm: Cleanup class for tpm_buf
config: sh-randconfig-r111-20250629 (https://download.01.org/0day-ci/archive/20250630/202506300442.B7u3tOmo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250630/202506300442.B7u3tOmo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300442.B7u3tOmo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/keys/trusted-keys/trusted_tpm2.c:244:9: sparse: sparse: cast truncates bits from constant value (10000 becomes 0)
   security/keys/trusted-keys/trusted_tpm2.c:245:9: sparse: sparse: cast truncates bits from constant value (10000 becomes 0)
   security/keys/trusted-keys/trusted_tpm2.c:381:9: sparse: sparse: cast truncates bits from constant value (10000 becomes 0)
   security/keys/trusted-keys/trusted_tpm2.c:482:9: sparse: sparse: cast truncates bits from constant value (10000 becomes 0)
--
   security/keys/trusted-keys/trusted_tpm1.c:194:19: sparse: sparse: cast to restricted __be32
   security/keys/trusted-keys/trusted_tpm1.c:195:15: sparse: sparse: cast to restricted __be16
   security/keys/trusted-keys/trusted_tpm1.c:282:19: sparse: sparse: cast to restricted __be32
   security/keys/trusted-keys/trusted_tpm1.c:283:15: sparse: sparse: cast to restricted __be16
   security/keys/trusted-keys/trusted_tpm1.c:430:21: sparse: sparse: cast to restricted __be32
   security/keys/trusted-keys/trusted_tpm1.c:454:19: sparse: sparse: cast to restricted __be32
   security/keys/trusted-keys/trusted_tpm1.c:519:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ordinal @@     got restricted __be32 [usertype] @@
   security/keys/trusted-keys/trusted_tpm1.c:519:17: sparse:     expected unsigned int [usertype] ordinal
   security/keys/trusted-keys/trusted_tpm1.c:519:17: sparse:     got restricted __be32 [usertype]
   security/keys/trusted-keys/trusted_tpm1.c:520:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] datsize @@     got restricted __be32 [usertype] @@
   security/keys/trusted-keys/trusted_tpm1.c:520:17: sparse:     expected unsigned int [usertype] datsize
   security/keys/trusted-keys/trusted_tpm1.c:520:17: sparse:     got restricted __be32 [usertype]
   security/keys/trusted-keys/trusted_tpm1.c:521:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] pcrsize @@     got restricted __be32 [usertype] @@
   security/keys/trusted-keys/trusted_tpm1.c:521:17: sparse:     expected unsigned int [usertype] pcrsize
   security/keys/trusted-keys/trusted_tpm1.c:521:17: sparse:     got restricted __be32 [usertype]
   security/keys/trusted-keys/trusted_tpm1.c:567:24: sparse: sparse: cast to restricted __be32
   security/keys/trusted-keys/trusted_tpm1.c:568:23: sparse: sparse: cast to restricted __be32
   security/keys/trusted-keys/trusted_tpm1.c:620:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ordinal @@     got restricted __be32 [usertype] @@
   security/keys/trusted-keys/trusted_tpm1.c:620:17: sparse:     expected unsigned int [usertype] ordinal
   security/keys/trusted-keys/trusted_tpm1.c:620:17: sparse:     got restricted __be32 [usertype]
   security/keys/trusted-keys/trusted_tpm1.c:659:20: sparse: sparse: cast to restricted __be32
>> security/keys/trusted-keys/trusted_tpm1.c:359:9: sparse: sparse: cast truncates bits from constant value (10000 becomes 0)
   security/keys/trusted-keys/trusted_tpm1.c:680:9: sparse: sparse: cast truncates bits from constant value (10000 becomes 0)
   security/keys/trusted-keys/trusted_tpm1.c:704:9: sparse: sparse: cast truncates bits from constant value (10000 becomes 0)

vim +244 security/keys/trusted-keys/trusted_tpm2.c

   230	
   231	/**
   232	 * tpm2_seal_trusted() - seal the payload of a trusted key
   233	 *
   234	 * @chip: TPM chip to use
   235	 * @payload: the key data in clear and encrypted form
   236	 * @options: authentication values and other options
   237	 *
   238	 * Return: < 0 on error and 0 on success.
   239	 */
   240	int tpm2_seal_trusted(struct tpm_chip *chip,
   241			      struct trusted_key_payload *payload,
   242			      struct trusted_key_options *options)
   243	{
 > 244		CLASS_TPM_BUF(buf, PAGE_SIZE);
   245		CLASS_TPM_BUF(sized, PAGE_SIZE);
   246		off_t offset = TPM_HEADER_SIZE;
   247		int blob_len = 0;
   248		u32 hash;
   249		u32 flags;
   250		int i;
   251		int rc;
   252	
   253		if (!buf || !sized)
   254			return -ENOMEM;
   255	
   256		for (i = 0; i < ARRAY_SIZE(tpm2_hash_map); i++) {
   257			if (options->hash == tpm2_hash_map[i].crypto_id) {
   258				hash = tpm2_hash_map[i].tpm_id;
   259				break;
   260			}
   261		}
   262	
   263		if (i == ARRAY_SIZE(tpm2_hash_map))
   264			return -EINVAL;
   265	
   266		if (!options->keyhandle)
   267			return -EINVAL;
   268	
   269		rc = tpm_try_get_ops(chip);
   270		if (rc)
   271			return rc;
   272	
   273		rc = tpm2_start_auth_session(chip);
   274		if (rc)
   275			goto out_put;
   276	
   277		tpm_buf_reset(buf, TPM2_ST_SESSIONS, TPM2_CC_CREATE);
   278		tpm_buf_reset_sized(sized);
   279		tpm_buf_append_name(chip, buf, options->keyhandle, NULL);
   280		tpm_buf_append_hmac_session(chip, buf, TPM2_SA_DECRYPT,
   281					    options->keyauth, TPM_DIGEST_SIZE);
   282	
   283		/* sensitive */
   284		tpm_buf_append_u16(sized, options->blobauth_len);
   285	
   286		if (options->blobauth_len)
   287			tpm_buf_append(sized, options->blobauth, options->blobauth_len);
   288	
   289		tpm_buf_append_u16(sized, payload->key_len);
   290		tpm_buf_append(sized, payload->key, payload->key_len);
   291		tpm_buf_append(buf, sized->data, sized->length);
   292	
   293		/* public */
   294		tpm_buf_reset_sized(sized);
   295		tpm_buf_append_u16(sized, TPM_ALG_KEYEDHASH);
   296		tpm_buf_append_u16(sized, hash);
   297	
   298		/* key properties */
   299		flags = 0;
   300		flags |= options->policydigest_len ? 0 : TPM2_OA_USER_WITH_AUTH;
   301		flags |= payload->migratable ? 0 : (TPM2_OA_FIXED_TPM | TPM2_OA_FIXED_PARENT);
   302		tpm_buf_append_u32(sized, flags);
   303	
   304		/* policy */
   305		tpm_buf_append_u16(sized, options->policydigest_len);
   306		if (options->policydigest_len)
   307			tpm_buf_append(sized, options->policydigest, options->policydigest_len);
   308	
   309		/* public parameters */
   310		tpm_buf_append_u16(sized, TPM_ALG_NULL);
   311		tpm_buf_append_u16(sized, 0);
   312	
   313		tpm_buf_append(buf, sized->data, sized->length);
   314	
   315		/* outside info */
   316		tpm_buf_append_u16(buf, 0);
   317	
   318		/* creation PCR */
   319		tpm_buf_append_u32(buf, 0);
   320	
   321		if (buf->flags & TPM_BUF_OVERFLOW) {
   322			rc = -E2BIG;
   323			tpm2_end_auth_session(chip);
   324			goto out;
   325		}
   326	
   327		tpm_buf_fill_hmac_session(chip, buf);
   328		rc = tpm_transmit_cmd(chip, buf, 4, "sealing data");
   329		rc = tpm_buf_check_hmac_response(chip, buf, rc);
   330		if (rc)
   331			goto out;
   332	
   333		blob_len = tpm_buf_read_u32(buf, &offset);
   334		if (blob_len > MAX_BLOB_SIZE || buf->flags & TPM_BUF_BOUNDARY_ERROR) {
   335			rc = -E2BIG;
   336			goto out;
   337		}
   338		if (buf->length - offset < blob_len) {
   339			rc = -EFAULT;
   340			goto out;
   341		}
   342	
   343		blob_len = tpm2_key_encode(payload, options, &buf->data[offset],
   344					   blob_len);
   345	
   346	out:
   347		if (rc > 0) {
   348			if (tpm2_rc_value(rc) == TPM2_RC_HASH)
   349				rc = -EINVAL;
   350			else
   351				rc = -EPERM;
   352		}
   353		if (blob_len < 0)
   354			rc = blob_len;
   355		else
   356			payload->blob_len = blob_len;
   357	
   358	out_put:
   359		tpm_put_ops(chip);
   360		return rc;
   361	}
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
