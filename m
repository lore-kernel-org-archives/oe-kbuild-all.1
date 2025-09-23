Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E464D26B2C8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 15:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758642476; cv=none; b=t4ENO8cjB9CobClrsjYUTgJzQGPKlHdk3cJMbvLFGUnI0//hUM0SRXgcmSH4xuT1/EuTZetm6HA2UjnnOPIVTPUnPf+KHXsPWgNbbAtRarTwFlVMeXeVOuUpD3MgsUZwzlybzdhOjOeZaxm6EJDAnlweMQMSdOP5sBNAb6RDbuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758642476; c=relaxed/simple;
	bh=3C9pjKTWlADwyG26SLp2Lq/BrT4al6f3sHo/0tQRN3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bKB50NW9CiWONUweCKy9bYIkGNeoozYAhvDyNr6XrXkc+fQFuOVqqbja2+Sa41SXFMQFAelKeHYxu3e9tNlpRYgZXw1wvpk0h6JVW7nYTV850+TMDqtwf62pcw8sABRajxF+ap2Y6zjlY1gRGPh7J3Mu1t9YG7CIWH71b+Y3eNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CB7luetI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CB7luetI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758642475; x=1790178475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3C9pjKTWlADwyG26SLp2Lq/BrT4al6f3sHo/0tQRN3I=;
  b=CB7luetIQOvisNhcf+o2ODdtBkhthZ2c3j3yxl07qHh3HR0buNGUvkNw
   YA+YNJP+qVt0eG0zAd5fnq/HlFnbDlBuLDpCww/qeyp+3Hf9NpEVtGQtv
   AcvMV6+oFRv5bqPZH7FArFwDvn41P1I9fY40xODNy/cKy6lJyvgRScurq
   zRTgnYnQNS1aB1WGKCK1RIRdblnnOqsv9z21RDILg0IwOPv9fELZxNrSg
   i8QVfcZFSaqh19OUBmio5zmIkrRvsnDZM/r+Gg+IKb6Nx73CQwfSwfQoM
   KLYvlI52APfdhVmJJAH6JqN2Ry+1SQaBjDx9eN3Mkm8PQOrlMPWPHNwJ6
   Q==;
X-CSE-ConnectionGUID: tINmFgt+QfWwF0MvryvTwQ==
X-CSE-MsgGUID: zcAVI4qfTbeD9rHBQLK6+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60844249"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60844249"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 08:47:55 -0700
X-CSE-ConnectionGUID: uMQxhjQiQHKuPGzPXFW9pQ==
X-CSE-MsgGUID: EyeiOBo1SXuzLq/W2i/5ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="177238629"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2025 08:47:53 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v15F8-0003Gn-36;
	Tue, 23 Sep 2025 15:47:50 +0000
Date: Tue, 23 Sep 2025 23:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2-session 14/14]
 security/keys/trusted-keys/trusted_tpm2.c:489:16: warning: address of array
 'options->blobauth' will always evaluate to 'true'
Message-ID: <202509232324.o53bfgsg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-session
head:   8443d24da35ca59b7be6056fa1ebe74070eb9e4a
commit: 8443d24da35ca59b7be6056fa1ebe74070eb9e4a [14/14] keys, trusted: Remove redundant helper
config: i386-randconfig-011-20250923 (https://download.01.org/0day-ci/archive/20250923/202509232324.o53bfgsg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509232324.o53bfgsg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509232324.o53bfgsg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/keys/trusted-keys/trusted_tpm2.c:489:16: warning: address of array 'options->blobauth' will always evaluate to 'true' [-Wpointer-bool-conversion]
     489 |                 if (options->blobauth)
         |                 ~~  ~~~~~~~~~^~~~~~~~
   1 warning generated.


vim +489 security/keys/trusted-keys/trusted_tpm2.c

   437	
   438	/**
   439	 * tpm2_unseal_cmd() - execute a TPM2_Unload command
   440	 *
   441	 * @chip: TPM chip to use
   442	 * @payload: the key data in clear and encrypted form
   443	 * @options: authentication values and other options
   444	 * @blob_handle: blob handle
   445	 *
   446	 * Return: 0 on success
   447	 *         -EPERM on tpm error status
   448	 *         < 0 error from tpm_send
   449	 */
   450	static int tpm2_unseal_cmd(struct tpm_chip *chip,
   451				   struct trusted_key_payload *payload,
   452				   struct trusted_key_options *options,
   453				   u32 blob_handle)
   454	{
   455		struct tpm_header *head;
   456		struct tpm_buf buf;
   457		u16 data_len;
   458		int offset;
   459		u8 *data;
   460		int rc;
   461	
   462		rc = tpm2_start_auth_session(chip);
   463		if (rc)
   464			return rc;
   465	
   466		rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_UNSEAL);
   467		if (rc) {
   468			tpm2_end_auth_session(chip);
   469			return rc;
   470		}
   471	
   472		tpm_buf_append_name(chip, &buf, blob_handle, NULL);
   473	
   474		if (!options->policyhandle) {
   475			tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_ENCRYPT,
   476						    options->blobauth,
   477						    options->blobauth_len);
   478		} else {
   479			/*
   480			 * The policy session is generated outside the kernel, and thus
   481			 * the password will end up being unencrypted on the bus, as
   482			 * HMAC nonce cannot be calculated for it.
   483			 */
   484			tpm_buf_append_u32(&buf, 9 + options->blobauth_len);
   485			tpm_buf_append_u32(&buf, options->policyhandle);
   486			tpm_buf_append_u16(&buf, 0);
   487			tpm_buf_append_u8(&buf, 0);
   488			tpm_buf_append_u16(&buf, options->blobauth_len);
 > 489			if (options->blobauth)
   490				tpm_buf_append(&buf, options->blobauth, options->blobauth_len);
   491			if (tpm2_chip_auth(chip)) {
   492				tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_ENCRYPT, NULL, 0);
   493			} else  {
   494				offset = buf.handles * 4 + TPM_HEADER_SIZE;
   495				head = (struct tpm_header *)buf.data;
   496				if (tpm_buf_length(&buf) == offset)
   497					head->tag = cpu_to_be16(TPM2_ST_NO_SESSIONS);
   498			}
   499		}
   500	
   501		tpm_buf_fill_hmac_session(chip, &buf);
   502		rc = tpm_transmit_cmd(chip, &buf, 6, "unsealing");
   503		rc = tpm_buf_check_hmac_response(chip, &buf, rc);
   504	
   505		if (!rc) {
   506			data_len = be16_to_cpup(
   507				(__be16 *) &buf.data[TPM_HEADER_SIZE + 4]);
   508			if (data_len < MIN_KEY_SIZE ||  data_len > MAX_KEY_SIZE) {
   509				rc = -EFAULT;
   510				goto out;
   511			}
   512	
   513			if (tpm_buf_length(&buf) < TPM_HEADER_SIZE + 6 + data_len) {
   514				rc = -EFAULT;
   515				goto out;
   516			}
   517			data = &buf.data[TPM_HEADER_SIZE + 6];
   518	
   519			if (payload->old_format) {
   520				/* migratable flag is at the end of the key */
   521				memcpy(payload->key, data, data_len - 1);
   522				payload->key_len = data_len - 1;
   523				payload->migratable = data[data_len - 1];
   524			} else {
   525				/*
   526				 * migratable flag already collected from key
   527				 * attributes
   528				 */
   529				memcpy(payload->key, data, data_len);
   530				payload->key_len = data_len;
   531			}
   532		}
   533	
   534	out:
   535		tpm_buf_destroy(&buf);
   536		return tpm_ret_to_err(rc);
   537	}
   538	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
