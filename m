Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191730;
	b=FukRUpX5ZaLzRHHuyGULHp2gIjrcWTxz9Om5JNaiEMWm83GMQjdPWNLJhvvJJPdrDzLe
	 cgmZE4EPLogrOGubBDbDJ0NZllRIZ6D44f5QEaKdtYm/JBuCNT908vLyUOJ248rzxNXfH
	 JYd6h0gwh2VBTGQ9FoujisYOdoJ4AxLtQVZf4QCVU/D3B9rjcELi/AekCWVNG9558N6KU
	 OY+vevCUPLa3peZDzgcCnhRxaoy42X6fVCITP9kDHQUkOwAtQeFEkH3pNCMzKsuICrZ+W
	 A5nOs0ZfWcoUhPORf6a3vuirtJD8pyKbNoRJbPAcQI2M8rrJOid3dURbtwzuiPmtkgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191730;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bm2DZCl72Qz+xwhszddslUVu5244nZW9l+CvLG7o6uA=;
	b=w1wjlDbjeH5NVBbh6oS8svtv4E1lMU3en7hC5c7ahH6b9GLCWTyr3Anc4/lF4hM6b4SX
	 TQKkBREkLOVVRwOC3EoO3Sa7iVWhKSrOr66QPZwWjPlxgL36a/+QcEz8CzQzmvffIOPFB
	 Hhh0DxWyzTT7r/lIlzq1OxCTym+sykk6zG/0Lx0vA+IUUBoAzdJV/s8xRtpQEKJEdj62p
	 XikNOBSNS5K7HJTUtNS/ENnL7ihAerQoxbFxHr6KY/k4AG3nkPv7KxKBAs1QwYNYHs2kL
	 W8sj+J770UJZ3SheRvOB57PYT0d4uvbQi++ig6XRGbAxpAJyWm3SNOMxkNlxUs805BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XJJ9cErn;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1800606A325
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 16:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1800606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XJJ9cErn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795191730; x=1826727730;
  h=date:from:to:cc:subject:message-id;
  bh=TlbsmQA68hnxLh+c6USIyn6iRyChStYlXLMEKcOzDmw=;
  b=XJJ9cErnm1noanJB+Px+drPH+Kh6cWAtjbkv1+iwICapGPM9eIVVPg1y
   HtrWK1szKAxoZFMN6KyDvF6RI3WDpWB7qDBJgEKVgu0b4rmQkwEXUIO1S
   vQUfP7DhkO4Gtt3jNaTcmOG+/iTRVqoEsid3ULZMbueEz4OYaTQZmQzCN
   ImZm94H0CT51sTcamGv3mc5fHlRPzVwyhFJDRkbFxxRCMHHQE3cK0Qz2D
   AbMyR7FISOSd+FqtfqyJGgTaAT5RGZ88d6LlyRj4IONu1qdlBFFsrdIbc
   Ds23uKDskR3o2E+BtVBlMfTF+02RbvrMuIl6n5WNXxs50FKtosd3AdST6
   w==;
X-CSE-ConnectionGUID: I1dqFTG9QNmC7LHqTEVOZg==
X-CSE-MsgGUID: KgfxTdPTT2mQCV2z5KXN9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3956238"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3956238"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 08:22:09 -0800
X-CSE-ConnectionGUID: PtzPKcJORUaE2MgTv+My+w==
X-CSE-MsgGUID: Gv/xhaAMQrevWIg3HGH+Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11062777"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 20 Nov 2026 08:22:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xURNF-0000000045R-47zU;
	Fri, 20 Nov 2026 16:22:05 +0000
Date: Fri, 20 Nov 2026 17:21:33 +0100
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v4 2/9]
 drivers/nvme/common/keyring.c:431:22: sparse: sparse: unsigned value that
 used to be signed checked against zero?
Message-ID: <20261120172009.jxwIXru2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v4
head:   1b78746d90bfa570d96e88475983421f24c38b0d
commit: a6c7217c8a4b404d6107aeaf07b1323df6adbf32 [2/9] nvme-keyring: add 'dhchap' key type
config: s390-randconfig-r2302-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120172009.jxwIXru2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.4.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120172009.jxwIXru2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120172009.jxwIXru2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/common/keyring.c:431:22: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/nvme/common/keyring.c:430:68: sparse: signed value source

vim +431 drivers/nvme/common/keyring.c

   396	
   397	/**
   398	 * nvme_dhchap_psk_read - read callback for dhchap key types
   399	 * @key: key to read from
   400	 * @buffer: buffer for the key contents
   401	 * @buflen: length of @buffer
   402	 *
   403	 * Formets the DH-HMAC-CHAP key in base64-encoded form as
   404	 * defined in the NVM Express TCP Transport Specification Rev 1.1,
   405	 * Section 3.6.1.5 'PSK Interchange Format'. The payload of @key
   406	 * is assumed to be of 'struct user_key_payload', with the data
   407	 * consisting of the key data of length 'upayload->datalen', followed
   408	 * by four bytes of CRC, one byte version, and one byte hmac fields.
   409	 */
   410	static long nvme_dhchap_psk_read(const struct key *key,
   411					 char *buffer, size_t buflen)
   412	{
   413		const struct user_key_payload *upayload;
   414		size_t datalen, keylen;
   415		u8 version, hmac;
   416		long ret;
   417	
   418		upayload = user_key_payload_locked(key);
   419		/*
   420		 * Expected output string length:
   421		 * strlen("DHHC-") +
   422		 * version (= 1) +
   423		 * ':' (= 1) +
   424		 * hmac (= 2) +
   425		 * ':' (= 1) +
   426		 * encoded base64 key length +
   427		 * CRC length (= 4) +
   428		 * ':' (= 1)
   429		 */
   430		keylen = nvme_dhchap_decoded_key_size(upayload->datalen) + 15;
 > 431		if (keylen < 0 || !buffer || buflen == 0)
   432			return keylen;
   433	
   434		if (buflen < keylen)
   435			return -EINVAL;
   436	
   437		memset(buffer, 0, buflen);
   438		version = upayload->data[upayload->datalen + 4];
   439		hmac = upayload->data[upayload->datalen + 5];
   440		ret = sprintf(buffer, "DHHC-%01hhu:%02hhu:", version, hmac);
   441		if (ret < 0)
   442			return -ENOKEY;
   443		/* Include the trailing CRC */
   444		datalen = upayload->datalen + 4;
   445		ret += base64_encode(upayload->data, datalen, buffer + ret,
   446				     true, BASE64_STD);
   447		buffer[ret] = ':';
   448		ret++;
   449		return ret;
   450	}
   451	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
