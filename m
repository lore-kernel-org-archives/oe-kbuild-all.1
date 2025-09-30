Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB37305055
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242872; cv=none; b=Zkk2axRTcNuIjwcukUbt7u8M7aDcJE0a1+dtvhztTKA165LpzPS3rI9EHz55WwszsCpXnELbVWfZK6zX0m3yYjddcY52O9l9KuwsbR6wwcbxp8gVr+wVcxNSUiEtwCOV6K2+gfBVxvC2pWcJOWoctajwOGa8uYgg0rHhXc7agHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242872; c=relaxed/simple;
	bh=PIZYDGLB/EvkvEb0kX4IRMqFUE4mUfaQpfC4QTkZzbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=giYQPaq3dC9Yu36z4Y4kP0rO1K2h96Ee1IiOcUiwIvuxswiL+C1D+Q1AxOOcH7U77UZpovgVeDIbCGuoy+QMNTUBPFISdVAGD4N8Pewqj0Fv3vKXC3m5sU1xomR/TN8rvHMhS7fh3KNuLLrJTpY1tyUrxxDEKplb2jC7kXxqKYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vm4GsIAo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vm4GsIAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759242871; x=1790778871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PIZYDGLB/EvkvEb0kX4IRMqFUE4mUfaQpfC4QTkZzbo=;
  b=Vm4GsIAoXPsdxYz+60pz95+zwh4i5zwE4nAvr6okIve6U0CvcnubYHNi
   If7wCtp6YLkBpGMlKIkPrN8Rnm6/VcQLKH172Al5w8c7+cSNqhJ24Ktfu
   4Pl3qrp2bCY0HL6qb2ce7fEdwWPukxAoGyA/AzvPpsmcCamK08AtyStBM
   xFox0RtU9lghwf9zRGiHEssSvR6FReRqcZiy8+u0iRTJsSUksDzYcwAHM
   JboRRpTIS5ny2J2kuCkXbbY60Odju047N9xRFQH1/FiKy1rEp5rtChTmo
   lvalq/AKUOjgTLtkVwvzvfVD2cT6/JS9oCPFqJCntpLEqOflxplN9BPjx
   w==;
X-CSE-ConnectionGUID: Qf5oIzCLRhCn01QB+2pC1g==
X-CSE-MsgGUID: q4rr2GAXRwyP4PROJvfeIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65140429"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="65140429"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 07:34:30 -0700
X-CSE-ConnectionGUID: 4HXVOdTQSW6O6ZXwhKVi8Q==
X-CSE-MsgGUID: iCUDpUu4Tyi6J8RQ8D0C5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="178570816"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Sep 2025 07:34:28 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3bQw-0001QB-0A;
	Tue, 30 Sep 2025 14:34:26 +0000
Date: Tue, 30 Sep 2025 22:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>
Subject: [linux-nvme:nvme-6.18 4/11] include/linux/nvme-keyring.h:54:1:
 error: expected identifier or '(' before '{' token
Message-ID: <202509302259.Yku13u90-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.18
head:   876f5e3e3b1e3e78aec9b7e53bec4b949a13ce09
commit: 2907c26f418da9a46deae686598e3006958fb1c5 [4/11] nvme-keyring: add 'dhchap' key type
config: arm-randconfig-001-20250930 (https://download.01.org/0day-ci/archive/20250930/202509302259.Yku13u90-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509302259.Yku13u90-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509302259.Yku13u90-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/fabrics.c:15:
>> include/linux/nvme-keyring.h:54:1: error: expected identifier or '(' before '{' token
      54 | {
         | ^
>> include/linux/nvme-keyring.h:57:4: warning: no previous prototype for 'nvme_dhchap_psk_hash' [-Wmissing-prototypes]
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         |    ^~~~~~~~~~~~~~~~~~~~
>> include/linux/nvme-keyring.h:52:27: warning: 'nvme_dhchap_psk_lookup' declared 'static' but never defined [-Wunused-function]
      52 | static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
         |                           ^~~~~~~~~~~~~~~~~~~~~~


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
  > 52	static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
    53			const char *hostnqn, const char *subnqn, u8 hmac);
  > 54	{
    55		return ERR_PTR(-ENOTSUPP);
    56	}
  > 57	u8 nvme_dhchap_psk_hash(struct key *key)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
