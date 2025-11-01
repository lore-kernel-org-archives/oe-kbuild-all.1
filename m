Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FD1221FDA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 03:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761967993; cv=none; b=QOdG4qwH3nbfXXNhbOMbTvByizu5ZI6D6Q2qSi49waSmPwLLwClit4glCv8q0Yo83zTG+hU/R7DX8qXVMM+ZjVVLR3TaPnDbmJZrtiyaX/IkvSqHm9KGGrm9Kz9v3WTTsvMU038j8lW9XOPMze6ydNhnH5QcCbXMqPvfpBHhlVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761967993; c=relaxed/simple;
	bh=pCPySdY/ROxOVw4ncYYkPPIQj4/VH0UKs33os8K253k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TMtbYwiCd42Al8EhJlz1YFSlqEV4fq1lkYlDxhMn46X9Lk1zf+eCk41fvQ8q6haAsJP1+k1qZ8wZNRCi6C5+2Ws0r4FJKhDzKpSpyH1dRcqONOpVI8BEhb057NYCZts0y19rQA6IMXlfVQbAOgHVW2Z7k6SfZ5VElumCowWjSBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xck+QzJe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xck+QzJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761967992; x=1793503992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pCPySdY/ROxOVw4ncYYkPPIQj4/VH0UKs33os8K253k=;
  b=Xck+QzJeok9n9ii/gtlGnWmen8eApwIyTrpN3i33Rys9yRCNlJ3B/8yy
   44a/Tdh5tfrvyqw4w9w6Ny6bhwp1hY1KXQr96EHl6FXOqjs/UkxC+NPcX
   TCQ4K/XGQovSRCO4mebKalLiDhTSk+t/A9z0mxq1qfS2owGP9rOGvjO3M
   hWtQ5FxdrDlrhiFqf07E92NPmzULyipp/Q35yrr42FJU16Mgvxldic6eD
   g3Yv7FDdoDJOBddHOn6eAmigzrlghl1Zx5NiiCpMVZau3YKC1r5vfUtWr
   id3o6BEPLQgFS2jtYuZUrhsEDyQaJYFFFmnptxruQTuWnQ2UYDn8GiHfb
   A==;
X-CSE-ConnectionGUID: i7SQaCMpS+uszNi4pXOWGw==
X-CSE-MsgGUID: 1z/A9uuJQKuf3qoxYDpgzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75247227"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="75247227"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 20:33:09 -0700
X-CSE-ConnectionGUID: hbbAuAWlRLyOtAoMSZQflA==
X-CSE-MsgGUID: 1v/nY786TfORHYtNLthOeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="190733839"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 31 Oct 2025 20:33:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF2MT-000Ntg-27;
	Sat, 01 Nov 2025 03:33:05 +0000
Date: Sat, 1 Nov 2025 11:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>
Subject: [linux-nvme:nvme-6.19 4/21] include/linux/nvme-keyring.h:57:4:
 warning: no previous prototype for function 'nvme_dhchap_psk_hash'
Message-ID: <202511011103.e6eXLAln-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.19
head:   453ba3089d4570c2be2e230e1e7a287eac4b306b
commit: 8d9937531a4d3cb6d2d352c46dd807bfa52988b6 [4/21] nvme-keyring: add 'dhchap' key type
config: x86_64-randconfig-121-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011103.e6eXLAln-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011103.e6eXLAln-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011103.e6eXLAln-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/fabrics.c:15:
>> include/linux/nvme-keyring.h:57:4: warning: no previous prototype for function 'nvme_dhchap_psk_hash' [-Wmissing-prototypes]
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         |    ^
   include/linux/nvme-keyring.h:57:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         | ^
         | static 
   1 warning generated.


vim +/nvme_dhchap_psk_hash +57 include/linux/nvme-keyring.h

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
    53			const char *hostnqn, const char *subnqn, u8 hmac)
    54	{
    55		return ERR_PTR(-ENOTSUPP);
    56	}
  > 57	u8 nvme_dhchap_psk_hash(struct key *key)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
