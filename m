Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185177;
	b=InV7/l1OwifbwUqqKRPscGk/rUkbhzQTyp2v/BFNVsgLwaKGIB1cCI+LbwGidxerB97I
	 NENXzAERVs2nhvNKCZ3FDqVlhsdP+ty7hBUhCK6tKUESLsubjBcFOdRnZILXaqTbhOP6Z
	 sQH3CEJDnqJgP5rd1aCgCoecVdvqZPdKFQ362s7mpUoJkhvsYaIUGpfKNx0Uh9zNI7qvr
	 0jXL0UCO+3A9fPlnmASwEeBGBg3J33nBhnttP7DVo+KOuUR4WGtW8yWe7NZRmD2JRX31y
	 iyVrYySX/67sVtBqiqCrgjK47t6YWQDSNKagAqlyxvcN69XGxWPi9eIte4ZitHa8EhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185177;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=t9+OUxImhFCh/3lBYQbitGqtnEo3YSlL/WbWJ2XxOLA=;
	b=hyxSS9tBH/UCMJaZx6BgUrZm5Ihc9qGnwVY1P46oZwndn+h2x+IlUvRx8e4Uwp/12mez
	 oKvhkLLPcb7BNtVuGq7Hlhh76zsw/BlJ16kllzpNjvCDlzCvBmUpZxX5M9pfOIj2nJYkV
	 48YsWCzDHooNRQ8pM/3tOXIAzhJds1SejW5/3gQQa9zX6kDGXVq0TLipRbhieFe5Z8Ob8
	 W+YC8ZaWxSiF+nU3KglXblN2iuS9sExqLM9n8nG4hEPLWVgmSxxQWO6EZD6kNRKUl75Eu
	 ytGfiOhIPw24Hsj4hMR7fQM3yi1rMumZEpXUnN94jWKHqUCLDMfdfPNELYtAbvFqNjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="BvgID/rc";
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8090E606A320
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 14:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8090E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BvgID/rc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795185177; x=1826721177;
  h=date:from:to:cc:subject:message-id;
  bh=r5LfmBVBM5uLyvnlrsps/n84MPI4ngz07xym3BTBUFk=;
  b=BvgID/rcv+xD9PFS8dwnbTExlRiOo90E4GN+Msv37ZHj4WNUnUAbrBFy
   J9h9zt7KAqrM1w5s8eob+1oIzDXzalZ7zBAKHUuFGYVlRz/gUW+5gjJHi
   NqI7ktHg+R6VTeBsiPHnxUDn3yyzhObUsT+mCZYFXxdd/1/dbgLUJJlU+
   b1NsaZcWQ4ySkUSkYqyNmHlxbzs+/rtxdxz98HVZXWvh6s9iKD55SQHrL
   qYaY09rzSrSzVGfstuNcEZu/ncivD2bv3D/E9bzPNBp4EIyEvtO5lgi/f
   tZOnigmw7JOjBPtEDGs2lxhwxmNhzsPoXI6pmTB/ImPlHn9cTpHjlrd97
   g==;
X-CSE-ConnectionGUID: Qh1ahJF5R6WqhDgF9G6yLQ==
X-CSE-MsgGUID: n90J3XhYTbC6pyeA2gUzFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4164088"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4164088"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:32:56 -0800
X-CSE-ConnectionGUID: upJ++asVSGSwGbIzl/Mh7Q==
X-CSE-MsgGUID: 9w4pwasZSKOxGifxGP+yzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10699071"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2026 06:32:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUPfY-00000000433-1Mvf;
	Fri, 20 Nov 2026 14:32:52 +0000
Date: Fri, 20 Nov 2026 15:32:40 +0100
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v4 2/9]
 drivers/nvme/common/keyring.c:348:19: warning: variable 'keylen' is
 uninitialized when used here
Message-ID: <20261120152842.Al8VXK6X-lkp@intel.com>
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
config: i386-randconfig-2200-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120152842.Al8VXK6X-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120152842.Al8VXK6X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120152842.Al8VXK6X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/common/keyring.c:348:19: warning: variable 'keylen' is uninitialized when used here [-Wuninitialized]
     348 |         prep->quotalen = keylen;
         |                          ^~~~~~
   drivers/nvme/common/keyring.c:310:40: note: initialize the variable 'keylen' to silence this warning
     310 |         size_t datalen = prep->datalen, keylen;
         |                                               ^
         |                                                = 0
   1 warning generated.


vim +/keylen +348 drivers/nvme/common/keyring.c

   293	
   294	/**
   295	 * nvme_dhchap_psk_preparse - prepare DH-HMAC-CHAP key data
   296	 * @prep: preparsed payload of the key data
   297	 *
   298	 * Decode the DH-HMAC-CHAP key data passed in @prep and
   299	 * store the resulting binary data. The binary data includes
   300	 * space for the CRC, the version, and the hmac identifier,
   301	 * but the data length is just the key data without the CRC.
   302	 * This allows the user to read the key data via the
   303	 * 'user_read()' function. The additional 'version' ahd 'hmac'
   304	 * data is used in the ->read() callback to generate the
   305	 * base64 encoded key.
   306	 */
   307	static int nvme_dhchap_psk_preparse(struct key_preparsed_payload *prep)
   308	{
   309		struct user_key_payload *upayload;
   310		size_t datalen = prep->datalen, keylen;
   311		int ret;
   312		u32 crc;
   313		u8 version, hmac;
   314	
   315		if (!prep->data) {
   316			pr_debug("%s: Empty data", __func__);
   317			prep->payload.data[0] = NULL;
   318			prep->quotalen = 0;
   319			return -EINVAL;
   320		}
   321	
   322		if (sscanf(prep->data, "DHHC-%01hhu:%02hhu:%*s",
   323			   &version, &hmac) != 2) {
   324			pr_debug("%s: invalid key data '%s'\n", __func__,
   325				 (char *)prep->data);
   326			prep->payload.data[0] = NULL;
   327			prep->quotalen = 0;
   328			return -EINVAL;
   329		}
   330	
   331		/* skip header and final ':' character */
   332		datalen -= 11;
   333	
   334		/*
   335		 * payload is < key | version | hmac >
   336		 * base64 decode will always return less data
   337		 * than the encoded data, so allocating the size
   338		 * of the encoded data will be large enough.
   339		 */
   340		upayload = kzalloc(sizeof(*upayload) + datalen, GFP_KERNEL);
   341		if (!upayload) {
   342			prep->payload.data[0] = NULL;
   343			prep->quotalen = 0;
   344			return -ENOMEM;
   345		}
   346	
   347		/* decode the data */
 > 348		prep->quotalen = keylen;
   349		prep->payload.data[0] = upayload;
   350		ret = base64_decode(prep->data + 10, datalen, upayload->data,
   351				    true, BASE64_STD);
   352		if (ret < 0) {
   353			pr_debug("%s: Failed to decode key %s\n",
   354				 __func__, (char *)prep->data + 10);
   355			return ret;
   356		}
   357		ret -= 4;
   358		crc = ~crc32(~0, upayload->data, ret);
   359		if (get_unaligned_le32(upayload->data + ret) != crc) {
   360			pr_debug("%s: CRC mismatch for key\n", __func__);
   361			/* CRC mismatch */
   362			return -EKEYREJECTED;
   363		}
   364		/* append version and hmac to the payload */
   365		upayload->data[ret + 4] = version;
   366		upayload->data[ret + 5] = hmac;
   367		upayload->datalen = ret;
   368		return 0;
   369	}
   370	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
