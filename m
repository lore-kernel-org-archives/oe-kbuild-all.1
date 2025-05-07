Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CAD20D519
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612248; cv=none; b=oGF9e2xiPzGZnEBfRYc3p0Hv8oGA6Jc4oXy2cdAQJyCu+3WizwDECcdbcjxa2+fnzYQyRmeJYjB8ARDxAuw8bpUWHYL1/TFjwqC4w75z4AH0H5vT0S/U/z7WlXrlGe0TLB32aK5G6ubkCMPIVgPVVl4PNSxJrDjcVlCqRJR7DeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612248; c=relaxed/simple;
	bh=JorNS6ufGfA7z5IkRfawD60JtFI62oJZ7bVd67MtyWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MC/bF+BmnnSf4bDt3CnFodjVwLh+0fLIjcLgbwX1j1V+PWK+7sq5ocxJ/KMSSOotuNm58uNQnhgFwEXiqkNuxmkfORQue6i9jYSKvQ9CP0Dx44zVZ5MfLKsGzGBvbNrJ47c0fi+w4GErbcLjyi7KaVK0qFsO8ByVGiNpiliMvr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBtXBzam; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBtXBzam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746612247; x=1778148247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JorNS6ufGfA7z5IkRfawD60JtFI62oJZ7bVd67MtyWY=;
  b=VBtXBzamq9WpiF8tBmtHJ0jsiJihdd/MeI5eUUx+esT/0bRU5tWNKoYT
   0eTLKDZ/mVLSB98NQjVY8TuCKt21kfHXCDiP15jzT3sCKk6So6ZJFl4d/
   /x7usz0M/VLydhFNrRhtR6YgZlm2aejDu49dZDeE1Cq5G8TT7dbGufWD9
   BVIqPRwiXsIywRc883LEyoEiKCtL/GSBwOyF/3Lo3n0xSBpPWTmTibqUe
   avEmM4lQA2x2+ws6OkAJyLOrDYD70IB759ChhFBWC61VBRSl5RxtXUfJx
   7c2Fk/Ez5CIOaBNViefhrddFjME2Yj35mE0wP3vctH2NerV6krgWqcrU6
   Q==;
X-CSE-ConnectionGUID: p9u5gTtQQ7GXzT+8P8rHwA==
X-CSE-MsgGUID: auhcFYYOQqaQYlwc/HHxAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52147981"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52147981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:04:06 -0700
X-CSE-ConnectionGUID: uWI9YdynQa6sLR3VjmvxOg==
X-CSE-MsgGUID: RYC5NrOFQR+mW5qGfVYGLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136841523"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2025 03:04:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbdC-0007Yz-1x;
	Wed, 07 May 2025 10:04:02 +0000
Date: Wed, 7 May 2025 18:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:nvme-fpin.v3 13/20] include/linux/nvme-keyring.h:61:8:
 warning: no previous prototype for 'nvme_dhchap_psk_len'
Message-ID: <202505071738.K7VshDWz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git nvme-fpin.v3
head:   931611be0f664cca44e6df3a27f302d0a27a96b9
commit: c15b65f0fa820eb76beeeaed71d861d29b5d7af2 [13/20] nvme-auth: restrict the list of valid algorithms to the provided key lengths
config: i386-randconfig-003-20250501 (https://download.01.org/0day-ci/archive/20250507/202505071738.K7VshDWz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071738.K7VshDWz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071738.K7VshDWz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/target/configfs.c:19:
   include/linux/nvme-keyring.h:54:1: error: expected identifier or '(' before '{' token
      54 | {
         | ^
   include/linux/nvme-keyring.h:57:4: warning: no previous prototype for 'nvme_dhchap_psk_hash' [-Wmissing-prototypes]
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         |    ^~~~~~~~~~~~~~~~~~~~
>> include/linux/nvme-keyring.h:61:8: warning: no previous prototype for 'nvme_dhchap_psk_len' [-Wmissing-prototypes]
      61 | size_t nvme_dhchap_psk_len(struct key *key)
         |        ^~~~~~~~~~~~~~~~~~~
   include/linux/nvme-keyring.h:52:27: warning: 'nvme_dhchap_psk_lookup' declared 'static' but never defined [-Wunused-function]
      52 | static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics


vim +/nvme_dhchap_psk_len +61 include/linux/nvme-keyring.h

    21	
    22	struct key *nvme_dhchap_psk_refresh(struct key *keyring,
    23			const u8 *data, size_t data_len);
    24	struct key *nvme_dhchap_psk_lookup(struct key *keyring, const char *identity);
    25	u8 nvme_dhchap_psk_hash(struct key *key);
    26	size_t nvme_dhchap_psk_len(struct key *key);
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
    54	{
    55		return ERR_PTR(-ENOTSUPP);
    56	}
    57	u8 nvme_dhchap_psk_hash(struct key *key)
    58	{
    59		return 0;
    60	}
  > 61	size_t nvme_dhchap_psk_len(struct key *key)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
