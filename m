Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEDF28000B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774016859; cv=none; b=J/AF4JLp+3SjP3+1TwLzwpHyfqAzJFQOmfPaXfV3J+x5gG4GXsaTPJ9qIdAHrSv6YX5KhfMvZP8jA/+J30ITyw0X7VmimgBRldNoigfHAmT0NpnXAuxF6r+JHguJnzs15SH5GD3FEDsFuKuS4M7shvd1gUlWwPH732PJb8yVQ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774016859; c=relaxed/simple;
	bh=qo/lF219USScsojqXF3ovb0dxoKA+lQFLe0cJryYet0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GolTNu433MGJ240jbGFEjchP0EIbUcxI4NhxtUuMT6bq1aPNDPk+wfBNKYmj14ZrkRAGO9+4hk56sx/eL9uUybLEnuRT/El6nY844+rt0klSgb5TpFpCFS019UgINPeh/rbXDz4HVe/6wz/4xb3nNrZEMzjJz2dKsx/qS5/0CRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnTSvO0n; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnTSvO0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774016858; x=1805552858;
  h=date:from:to:cc:subject:message-id;
  bh=qo/lF219USScsojqXF3ovb0dxoKA+lQFLe0cJryYet0=;
  b=MnTSvO0ngWQlGrgWk5AAEWNfPvMwYaFkjXHrn5AeeCZH52xr5RguwRAP
   CgfkpaOTGhvWcMHiNM6iJW3Tk90IHSgacGPz3izHjdvRfXG3iQhb7oOTo
   gKiLrkrdH07D9CZjOUVgVjtrWWDTlNqFhpAGQprlCYFW/t4W8qzigJb8O
   Zc8d3G8xjyjQBGiXvam4xx26HQx3+Bn53zGP2tU578aG9ehsC8pRNiFHZ
   ekgWuGF90jiKrnIHcofjaLwrGPPV3PUgucDdu3UoZJKmPb3vyp+iBZTOi
   069tbKBesQLLJsDsL12qKwg/TS0QmPhOSJH3rdBFXNXLpt6U2lFltlOLr
   A==;
X-CSE-ConnectionGUID: eZ/jrOQwRiOwUAOkNAgtPA==
X-CSE-MsgGUID: 0Lbbuw9kQQabkxZagSOMyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="100557088"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="100557088"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 07:27:37 -0700
X-CSE-ConnectionGUID: YuRRF+XHQfiRNXXteEUpmA==
X-CSE-MsgGUID: N7H4ZXQhST21Ns89Md1lnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="220636322"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Mar 2026 07:27:36 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3aoL-000000002T6-1ucO;
	Fri, 20 Mar 2026 14:27:08 +0000
Date: Fri, 20 Mar 2026 22:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v3 2/8]
 drivers/nvme/common/keyring.c:430 nvme_dhchap_psk_read() warn: unsigned
 'keylen' is never less than zero.
Message-ID: <202603202247.phD8CbPN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v3
head:   7ffdb5e32339cf1e1ba50b8caefaca6dbab4d882
commit: 04e4f1368f8ff23feef8b02cba8c03732228faa7 [2/8] nvme-keyring: add 'dhchap' key type
config: i386-randconfig-141-20260320 (https://download.01.org/0day-ci/archive/20260320/202603202247.phD8CbPN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603202247.phD8CbPN-lkp@intel.com/

smatch warnings:
drivers/nvme/common/keyring.c:430 nvme_dhchap_psk_read() warn: unsigned 'keylen' is never less than zero.

vim +/keylen +430 drivers/nvme/common/keyring.c

   395	
   396	/**
   397	 * nvme_dhchap_psk_read - read callback for dhchap key types
   398	 * @key: key to read from
   399	 * @buffer: buffer for the key contents
   400	 * @buflen: length of @buffer
   401	 *
   402	 * Formets the DH-HMAC-CHAP key in base64-encoded form as
   403	 * defined in the NVM Express TCP Transport Specification Rev 1.1,
   404	 * Section 3.6.1.5 'PSK Interchange Format'. The payload of @key
   405	 * is assumed to be of 'struct user_key_payload', with the data
   406	 * consisting of the key data of length 'upayload->datalen', followed
   407	 * by four bytes of CRC, one byte version, and one byte hmac fields.
   408	 */
   409	static long nvme_dhchap_psk_read(const struct key *key,
   410					 char *buffer, size_t buflen)
   411	{
   412		const struct user_key_payload *upayload;
   413		size_t datalen, keylen;
   414		u8 version, hmac;
   415		long ret;
   416	
   417		upayload = user_key_payload_locked(key);
   418		/*
   419		 * Expected output string length:
   420		 * strlen("DHHC-") +
   421		 * version (= 1) +
   422		 * ':' (= 1) +
   423		 * hmac (= 2) +
   424		 * ':' (= 1) +
   425		 * encoded base64 key length +
   426		 * CRC length (= 4) +
   427		 * ':' (= 1)
   428		 */
   429		keylen = nvme_dhchap_decoded_key_size(upayload->datalen) + 15;
 > 430		if (keylen < 0 || !buffer || buflen == 0)
   431			return keylen;
   432	
   433		if (buflen < keylen)
   434			return -EINVAL;
   435	
   436		memset(buffer, 0, buflen);
   437		version = upayload->data[upayload->datalen + 4];
   438		hmac = upayload->data[upayload->datalen + 5];
   439		ret = sprintf(buffer, "DHHC-%01hhu:%02hhu:", version, hmac);
   440		if (ret < 0)
   441			return -ENOKEY;
   442		/* Include the trailing CRC */
   443		datalen = upayload->datalen + 4;
   444		ret += base64_encode(upayload->data, datalen, buffer + ret,
   445				     true, BASE64_STD);
   446		buffer[ret] = ':';
   447		ret++;
   448		return ret;
   449	}
   450	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
