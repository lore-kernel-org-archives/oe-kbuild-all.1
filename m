Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8538A720
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000712; cv=none; b=aUkb3BOQQnNLMZRtQVN3rh0JNDHEaeTto1w0Y3CO5cEwIFjGk5lO1Nhw206EtWkTBrUF1vjUyOGhcHgVHz5wZAJMiygRDebDNev9bbLmyucTMxvYdkW2i3qVaenq8X+xIfHx2JfDaOyZgDNOXArUkRjz3KW6RMz1Sx0Nv7sfuSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000712; c=relaxed/simple;
	bh=Cg0MPZ7W/M2hl3y5m/48r3hYSAcknpJaal2N6ek5HbU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XY/vXzegE6uobknX+lt5Bh0EWfYm4q/McfcX0HFNKJfYiSEG0kCt+is2W9bQhYR8uQnnkaSMhoP3oQhVZSp6ZE0CxI/47kkaLYMfHeasbSVPhadZ6gYqJKP8dCeTNHlhup3sW8/AhHmMkixb1ZEic/VbXTEd7CnDI+ClxWqK2j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6An5MlI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6An5MlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774000712; x=1805536712;
  h=date:from:to:cc:subject:message-id;
  bh=Cg0MPZ7W/M2hl3y5m/48r3hYSAcknpJaal2N6ek5HbU=;
  b=n6An5MlIMcaMxPRnGj0EEDER6XMLdADyMpNycBe92O9hPvbr8VAnWD6L
   L1ilA5Gxnn76iiOyR5oJ370QORVYmmTTySp7aLIFGJztZCeDfqZEiXTq/
   gpPyVQcbTHVDH2n+LF/3U1wiFD/H5ZTWwN8AOutvBEUM0ku25+TgKtGn8
   6mWi0FOnJK1WdeAk/9birK502acZW3UHRt6DJXGedzaF+k99oCjinPyAf
   /gtcXt45WnZ2TQeSNQe4S5AkENpIpnJS55B062aU2/Z7ZPTQWWFOC1koc
   KswzHJy9uMK6KnRirPibKbt96vALe897PE1+qWiaZyhi7uq0q4Or40BLP
   A==;
X-CSE-ConnectionGUID: SOicutYfRjiVuCeoacbusA==
X-CSE-MsgGUID: y1zN/GNBT4Gb9/SkN9B8Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78941621"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="78941621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 02:58:32 -0700
X-CSE-ConnectionGUID: wYLc7iWbQSqht8bS1RWmaw==
X-CSE-MsgGUID: Mu1TUTVkQSmFOWwDtJFe2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="219063234"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Mar 2026 02:58:30 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Wc5-000000002F1-0maf;
	Fri, 20 Mar 2026 09:58:05 +0000
Date: Fri, 20 Mar 2026 17:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v3 3/8]
 include/linux/nvme-keyring.h:54:1: error: expected identifier or '('
Message-ID: <202603201740.3VDfq9qx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v3
head:   7ffdb5e32339cf1e1ba50b8caefaca6dbab4d882
commit: c565ba283d6746247485bb78e72220029586a0d1 [3/8] nvme-auth: switch to use 'struct key'
config: mips-randconfig-r072-20260320 (https://download.01.org/0day-ci/archive/20260320/202603201740.3VDfq9qx-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201740.3VDfq9qx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201740.3VDfq9qx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/fabrics.c:15:
>> include/linux/nvme-keyring.h:54:1: error: expected identifier or '('
      54 | {
         | ^
>> include/linux/nvme-keyring.h:57:4: warning: no previous prototype for function 'nvme_dhchap_psk_hash' [-Wmissing-prototypes]
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         |    ^
   include/linux/nvme-keyring.h:57:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         | ^
         | static 
   1 warning and 1 error generated.


vim +54 include/linux/nvme-keyring.h

    26	
    27	#else
    28	static inline struct key *nvme_tls_psk_refresh(struct key *keyring,
    29			u8 *data, size_t data_len, const char *digest)
    30	{
    31		return ERR_PTR(-ENOTSUPP);
    32	}
    33	static inline key_serial_t nvme_tls_psk_default(struct key *keyring,
    34			const char *hostnqn, const char *subnqn)
    35	{
    36		return 0;
    37	}
    38	static inline key_serial_t nvme_keyring_id(void)
    39	{
    40		return 0;
    41	}
    42	static inline struct key *nvme_tls_key_lookup(key_serial_t key_id)
    43	{
    44		return ERR_PTR(-ENOTSUPP);
    45	}
    46	static inline struct key *nvme_dhchap_psk_refresh(struct key *keyring,
    47			const char *hostnqn, const char *subnqn,
    48			u8 *data, size_t data_len)
    49	{
    50		return ERR_PTR(-ENOTSUPP);
    51	}
    52	static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
    53			const char *hostnqn, const char *subnqn, u8 hmac);
  > 54	{
    55		return ERR_PTR(-ENOTSUPP);
    56	}
  > 57	u8 nvme_dhchap_psk_hash(struct key *key)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
