Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185899;
	b=0HzCCEvEm5mBaBSD/SaGY+ZkrNhmcYz9Bahs0RjGsGoKmkxXTdSKt6FjGfyy4Qu+DqqW
	 o6x4WGtu2iZUpktGYDjuQAxfbsglAn7MHNWfSfA/q1wgPI4qyprpLBaaklgmdCp59f2mr
	 wbBdmewu+rsIbwXM7SiugbR99ymArrhrhdpGhKSzmj8NCIvmu8TcWks/OdWKGZ8Xf5Q/i
	 lrdz68pOrM3q5qmJiDvy4ys1quUl3dZ68E0lSd7W7rl5OV2XxCfo0cdNzAeVC1FER24EI
	 C+udns9H8YmDmKUpSiwtI1ioJYnXsHhkiJZc7Ui6aMWeRreZsP2+0YmO6GCUtIBX+gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185899;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mTj8ZcD4FIIdQEEtJeIj8XLAo8LWenqrthIPbO63rFg=;
	b=Dw/esKF2iq6DNS0qzLWuJ81fm/HOM7MrQitwIYBwwqR0jGw29UQA5+G1H0Tb9E8+aXov
	 14hwKRqpCM0WGF/ZPNuiYB383a3EegmtEJ//J0yuo6ki9Dl1jT276HlUQEPHKTAXdpCSA
	 jfRwMwetjxd80ZfkPUV2vG33C6qTEQdPK29QLdVwnbmS/QvnGgSn3dOtEIG3HGt/ZPNbt
	 aghmBlt3U7+p8q53TFgNPRSngQgkSx6Es14kjuH0wzptk3i1Zefv8DPw+dBC1kQPTpKWa
	 YO1lcpCpS3tajnyenKMTLvwJp8gRvjt10MX4fB3e3RBB7hWem86g4+TjYOevTHzZvCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HHOWHCV2;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DA3606A325
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 14:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03DA3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HHOWHCV2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795185899; x=1826721899;
  h=date:from:to:cc:subject:message-id;
  bh=J9zCWT1bFLogWhzPgkc4VKp3MVaFaWFiOjTfqLg2NK4=;
  b=HHOWHCV2IVE0z4npLqQNkuYhxopT8RPwQvNeuTBYCifm10hOghcEn/Vp
   +Wc63XL2SualhwsKdVa/TH8QvOnRLtM9VdS4SEJehyS9H6P+1MjNlsRq9
   GFNTxCg0+VISClXE4m75Awlh7mdM1rn4mi3/W09QSbBXK29xhzf6Jk4Gm
   L5Thyd8KCuToQ3QS9+QYby7oMYzIrUfyai5z9FKh3pfXqzVfQ/eME35mW
   pRsX/HyyAGNAfP19St00CG9CA3MMkoUBNYcLmYlEN866B+xvj8Vo02NTa
   EuKa5D2hKS8AuDYB4gXVq1W+33L5qq7T9RgmybSRV+TUDXHYyJgNU1GCk
   w==;
X-CSE-ConnectionGUID: 1BSSFP9DSB+tHfl47mvEiw==
X-CSE-MsgGUID: iH7mNEkhTIurJPltaWbudg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3954179"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3954179"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:44:58 -0800
X-CSE-ConnectionGUID: uO6ItqPkT0CZ5b4XA33BNQ==
X-CSE-MsgGUID: Ek5kFcy3RsOxb9Wmp1IVCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10696196"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2026 06:44:57 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUPrB-0000000043B-23Aq;
	Fri, 20 Nov 2026 14:44:53 +0000
Date: Fri, 20 Nov 2026 15:44:46 +0100
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v4 3/9]
 include/linux/nvme-keyring.h:54:1: error: expected identifier or '(' before
 '{' token
Message-ID: <20261120153351.AVFMzFoj-lkp@intel.com>
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
commit: a4ba99532949b46aa13cd6d71ccf791cbd692390 [3/9] nvme-auth: switch to use 'struct key'
config: xtensa-randconfig-2200-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120153351.AVFMzFoj-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120153351.AVFMzFoj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120153351.AVFMzFoj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/nvme/target/configfs.c:19:
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
    31		return ERR_PTR(-EOPNOTSUPP);
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
    44		return ERR_PTR(-EOPNOTSUPP);
    45	}
    46	static inline struct key *nvme_dhchap_psk_refresh(struct key *keyring,
    47			const char *hostnqn, const char *subnqn,
    48			u8 *data, size_t data_len)
    49	{
    50		return ERR_PTR(-EOPNOTSUPP);
    51	}
  > 52	static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
    53			const char *hostnqn, const char *subnqn, u8 hmac);
  > 54	{
    55		return ERR_PTR(-EOPNOTSUPP);
    56	}
  > 57	u8 nvme_dhchap_psk_hash(struct key *key)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
