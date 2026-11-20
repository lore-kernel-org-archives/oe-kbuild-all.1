Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185958;
	b=v8Vt8Xl0vtDN8+kblMpv9iXrUx9mAHiYMkRrfNDQn+zjxYOq5rpPUtNuq+TFFf0E1WYA
	 QqHLQ+yLWBJBk5zL8HcJZ1sckdHSMoXpUO7CpWFOsQC+xrQcnCdR53IAPtcx0jf4sqx3m
	 SObZX+bT7LzPLLQ6aUds8+Ye5tWh+2RPXQOfVWH1g3dH86PrvW50+tebrAsVV7qCOtqhS
	 n3ghu76Q9MwCOfNn5HB4RQJ131n33ubM26v9phgmfWtaoaignI1TVM29ZzwV+vVThmYZW
	 syJ/Z/PCLiU+kAq+P7IQLEesIZdHWZ+3piLH6ru2u3oqEfzb0QmSBFr5tC7HhZ67BsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185958;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=upP/9jcjzpgojKZWabP2fvdTvUT/4yR3uia3ViVSkWY=;
	b=BYQ4ZwfdmMwuqPttA2XKl3fvNNeuw7MwS94AFiOSAzDMUWcQ7izr5rvQqnPXCVG0mhps
	 CuSgtcIDpvZEW/SRelNnlIiZY39TZseCt11PqYtJpgyd6A8p8F+WeTdwXj7eqdPOg662P
	 WPpr5s0a4uhHAVu4P4OY+TjhS0Ag6TXAreo/YJm+ycXEE7XmlwzpUO9HkNLRSIJp8v8Gu
	 A6Q2AgB2WSqhwYA1C3vpahYhTR8caVUL+0tJmK1tkUxnWzaWv3i3CqRiDNmiGn3sziKWf
	 fW8IDVtsDTxD6q+asGsO5Tgq16TxBGAdpY5dxnU/fVdeexFJiV7BaQyY1UYOmm8DzTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QLa0fIY9;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38311606A32C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 14:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38311606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QLa0fIY9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795185959; x=1826721959;
  h=date:from:to:cc:subject:message-id;
  bh=WAvoVALZG13zHuWnYu2DMoOhBhgAoggUf28XFIRR3Xg=;
  b=QLa0fIY9il38/eooa82Gc0Pp6ST7sN768JUCwOh0Ck2fY7GEPwsubL3i
   I2Pm2S9Asus+dmhnRtzNmGrlDmntgKl+yHLu1z48nEYk7dDQwz6TUtDaK
   kklZ6yKzxjOxdr9QhGcuX3bMVBokag0Gdjj0ezvFLHn6tZi0g5MAWEjqT
   6/8o+oAX9K89KmULN8UxbjukF2xQqn2HhzAVMzbQmeKL22Df0fB+dfW6L
   +gk1GdOZgcRY7twB7YvMaNFPqmxUXnFzbKLY58Rvf0kpGhK9W8Epigl04
   3D1qEqy/q1cXmnuEt+5Qlck500N1fHoG9vxxyIj+rll0nSdU4LfcOJE32
   w==;
X-CSE-ConnectionGUID: Fya+FVY6SWic8gaUnDBKwA==
X-CSE-MsgGUID: gQBVVJUMTSyb1ERCM7wuFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4093272"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4093272"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:45:58 -0800
X-CSE-ConnectionGUID: yjXzvNAPQQmBRIjLeM6kmQ==
X-CSE-MsgGUID: DRUzkQMhSVyKFkt9Z2RcYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="12714334"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 20 Nov 2026 06:45:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUPs9-0000000043F-2DpQ;
	Fri, 20 Nov 2026 14:45:53 +0000
Date: Fri, 20 Nov 2026 15:44:54 +0100
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v4 2/9]
 drivers/nvme/common/keyring.c:431 nvme_dhchap_psk_read() warn: unsigned
 'keylen' is never less than zero.
Message-ID: <20261120154221.OPwO7MEW-lkp@intel.com>
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
config: m68k-randconfig-2200-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120154221.OPwO7MEW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120154221.OPwO7MEW-lkp@intel.com/

smatch warnings:
drivers/nvme/common/keyring.c:431 nvme_dhchap_psk_read() warn: unsigned 'keylen' is never less than zero.

vim +/keylen +431 drivers/nvme/common/keyring.c

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
