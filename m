Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE653A7857
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005990; cv=none; b=r8zvIK80I1sEDQn8cczq0rs6X/r4Y4vD9HFH1MTFLZjX4e/zD1JiVgeqXZnAh9vCmmrLlddPM9ly6dGSKnReGbrqe3RAjHtxJ+6D0jT9M/Ic/1WWel0iB0iN+6sYmI8oFe5BZER3EQZzf714DSKhMEztIiVKL/62MZVDq6Wn7Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005990; c=relaxed/simple;
	bh=Vm9U9CNeAjjuGJtZmiOGqUAFpnFAJnNGuRGLtuwR1kI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eYNVPJ8nnmTZd/m1+1dOKTS3ll2avbInMRZNyduJOOW6ANs9tAY5iCysMZK8WZ7pe3W1biBacFSI1DclA9otrbY9VoSQ8rS5hYB9L3AI5ZA2VK+dDxMmGuNEl+8Il6zjZKPWZ2QNhc5EJ/+2Jws/9soxKBB3/KGDlC2ukplY42g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBOu2qm/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBOu2qm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774005986; x=1805541986;
  h=date:from:to:cc:subject:message-id;
  bh=Vm9U9CNeAjjuGJtZmiOGqUAFpnFAJnNGuRGLtuwR1kI=;
  b=SBOu2qm/GWxU/5nN9qenIxEnnqXy5r7kHYZbRy7BvAPuZV8U8YdKMQA2
   b52kUNhHuqnOVF5B1Ja1uuubSRnCGndeHuEn9l3GOdCmk7DoFg2C1Futs
   LgF8TerDyc3GnQ+Nk7swmmde1kOABjcdY/6JxHa7U93uZltP045XjnIhH
   G/tMkXX103QKPPJg8ecx6fssXyds3Ey401gUBmszHd8Dn+KDfJ7VTaegi
   XaciUTIHLWHY6yUFXJOORO41c6uBtzDEapEtmfUwBZJEss0AamIlqX55c
   AuAwLw3Lptcr0uYyHEHa0ArAe5lWtuMIlfsU39IWC11bN68z9SSIfK6Mw
   Q==;
X-CSE-ConnectionGUID: EMz9HxxhSG2QoTbl3OgZOg==
X-CSE-MsgGUID: Gb+ATMDHQxmyAN4gy+Ow/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="100543757"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="100543757"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 04:25:55 -0700
X-CSE-ConnectionGUID: ndv8GX+DSNegITtsFda81A==
X-CSE-MsgGUID: u73TF7HeQCKlIvWMOTmn1A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Mar 2026 04:25:53 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3XzD-000000002Il-09EY;
	Fri, 20 Mar 2026 11:25:51 +0000
Date: Fri, 20 Mar 2026 19:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v3 3/8]
 include/linux/nvme-keyring.h:54:1: error: expected identifier or '(' before
 '{' token
Message-ID: <202603201936.ionzS9Ix-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v3
head:   7ffdb5e32339cf1e1ba50b8caefaca6dbab4d882
commit: c565ba283d6746247485bb78e72220029586a0d1 [3/8] nvme-auth: switch to use 'struct key'
config: i386-buildonly-randconfig-004-20260320 (https://download.01.org/0day-ci/archive/20260320/202603201936.ionzS9Ix-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201936.ionzS9Ix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201936.ionzS9Ix-lkp@intel.com/

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
