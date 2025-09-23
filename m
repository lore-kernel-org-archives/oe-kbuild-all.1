Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA694194A6C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 05:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758605349; cv=none; b=Aq2Incbdf46bDJypRPIaO00Nv73sAJEXefOmlixse1wF1gsKcUFg3JHCvI2DIT5cNeYa3u+qPMhXvWLsmHt5ZQmyPymbvd7Nps9VGZT536ypclO2VC1JVDCS71HC9QIgKU0PNYHQZks5zyygG4xkL0paP5coIL+L1in4E6ZnHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758605349; c=relaxed/simple;
	bh=gLjX/lrl8YG1suM7iIWhTWAxDrK9UZjZfQa0EK0dgDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6V72XwwZqR00BR3ad6k+zL909H+9CeyV932sIi8E0Y1+2T2yOM5G2sygPJ7WUHAEZWq9OtCxPApxwWYINTVTMG5x9JVWZsfojbmWaO3/QQGrxc/MtMggCnHeYPj4aBQVDrrwy64EKnhs2Hjo3Ah9nHYGgSDFGzEWT4lnDLgPeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVBu7FtG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVBu7FtG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758605348; x=1790141348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gLjX/lrl8YG1suM7iIWhTWAxDrK9UZjZfQa0EK0dgDo=;
  b=SVBu7FtGsVsUV3X8xpqGU+MW41HnhZ7q/DuBAzdtTXvJEe4t33RU0so7
   rcLDTOGouvVl4VH9IIbyPXgiX3GB72176i0DpW1M088l61Kskw3gvGYqT
   UmzsVsGvdD3Y6EQm82+1e311lN9cCdbm6S2Pj6sO8c9XeMNOqynaAlbzF
   Fo8ni+bdxsV0ue/KEZ1A3/PuNPOixxKhllEwDqM2OXrhKIHK7vmu4Ha5Y
   QYm5Y8F4TLw5TQzliRJemfHrY5ln2MW8cMT2d51uhVDWE0kNxCtXJSztw
   Hs9htb1zosn7fS6z6je+FSNPS14q5AJNwXTv53xJPN9cDrkuZBtMhTKqq
   Q==;
X-CSE-ConnectionGUID: /RayZr6jSryrAMgOKpTpNQ==
X-CSE-MsgGUID: 36NZrJcnTkK89CWKLIedgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="59917475"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="59917475"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 22:29:07 -0700
X-CSE-ConnectionGUID: yXwTWRBKSHGOwc6QoHikVg==
X-CSE-MsgGUID: dYUe4kDmQYKpDrpwBmrUWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="181835879"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 22 Sep 2025 22:29:05 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0vaJ-0000000044t-14xf;
	Tue, 23 Sep 2025 05:29:03 +0000
Date: Tue, 23 Sep 2025 07:29:02 +0200
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2-session 14/14]
 security/keys/trusted-keys/trusted_tpm2.c:489:21: warning: the comparison
 will always evaluate as 'true' for the address of 'blobauth' will never be
 NULL
Message-ID: <202509230748.evWsUrty-lkp@intel.com>
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
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20250923/202509230748.evWsUrty-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230748.evWsUrty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509230748.evWsUrty-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/keys/trusted-keys/trusted_tpm2.c: In function 'tpm2_unseal_cmd':
>> security/keys/trusted-keys/trusted_tpm2.c:489:21: warning: the comparison will always evaluate as 'true' for the address of 'blobauth' will never be NULL [-Waddress]
     489 |                 if (options->blobauth)
         |                     ^~~~~~~
   In file included from security/keys/trusted-keys/trusted_tpm2.c:14:
   include/keys/trusted-type.h:41:23: note: 'blobauth' declared here
      41 |         unsigned char blobauth[TPM_DIGEST_SIZE];
         |                       ^~~~~~~~


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
