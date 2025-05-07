Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F2C273F9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606227; cv=none; b=ILQJjegssf6zyQjvSUQ2/eNv621XZgd/yTE8jV7MoRa7gfnCr+K1najhZq90ThfPiWlpNrs+ru5Gb5yUAlpDp/roX4oTsxT2ZwOQ+qWGrm4KfGZgXBQ90DxC8ZM1wLkcIaVmZcNkP9/6zxXe1ZOo1TlHQGPCL/vogeXOj59VozI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606227; c=relaxed/simple;
	bh=/ucAazRzvx1YkdlRU4yQ8YTBqExrRbhLIeDpwmo+Zzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jcy4CJ5H991Ja6gNPYMxQat2m67KUxzQuhJ9Lmo3r2Pd5L6bLzdZnXcie5oqP2vABCslDLRiZ8MgdgRygyRW5VBIx5KxsWTC/3CcVEo/Qmk/2AmNfWAggoWZgscxx6qOJniIMPkVkSuCyHJv/VdcRp0iN2G36cizzTAn5BRfCpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y775gxOV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y775gxOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746606225; x=1778142225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ucAazRzvx1YkdlRU4yQ8YTBqExrRbhLIeDpwmo+Zzc=;
  b=Y775gxOVYYpG8UHF3nh23BTe/D3gxH6jTVTgd3SldplR6B15NAxKt5kz
   AlrtJEdxwFqVQxZt4CirVvjnWsUnicfeG5O2Z6sDbkdF6ir0t+tM5hANN
   kjmfsPUUcctNhANZOLY8nN5Oqi28KV9wsh0/fJu9nlOQjF/S8eyFua3E5
   v8GBLcW6Rnq9f6omiMh1c4pNJsFESRvtp4QVh+xpWznhmDTFPMq4C3wKO
   LYQuflUqYUxIQ78+iC+BV7Lk0+/rIar7qLq+YAL9IyDxRIMKcPYekskej
   fhG4/ruLagy4xfauTDku+sFtH7mPM432ppv31xuIC7Zj6VZl5vdML+DxD
   g==;
X-CSE-ConnectionGUID: vuIKno9VTCmxXIriD9cTGw==
X-CSE-MsgGUID: 4VdCdDYuR5qrKd2Xzcr41A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="51973855"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="51973855"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:23:44 -0700
X-CSE-ConnectionGUID: 3iL14YTESbSKfap0gFcLyw==
X-CSE-MsgGUID: Xl/LSmyiSliozX6S73DjWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="166922851"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 May 2025 01:23:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCa45-0007PI-1c;
	Wed, 07 May 2025 08:23:41 +0000
Date: Wed, 7 May 2025 16:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:nvme-fpin.v3 5/20] include/linux/nvme-keyring.h:57:4:
 warning: no previous prototype for 'nvme_dhchap_psk_hash'
Message-ID: <202505071636.ZdgjyPu2-lkp@intel.com>
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
commit: da153105b999dda340dde78bba86e7335065c9b0 [5/20] nvme-keyring: add 'dhchap' key type
config: i386-randconfig-003-20250501 (https://download.01.org/0day-ci/archive/20250507/202505071636.ZdgjyPu2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071636.ZdgjyPu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071636.ZdgjyPu2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/target/configfs.c:18:
   include/linux/nvme-keyring.h:54:1: error: expected identifier or '(' before '{' token
      54 | {
         | ^
>> include/linux/nvme-keyring.h:57:4: warning: no previous prototype for 'nvme_dhchap_psk_hash' [-Wmissing-prototypes]
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         |    ^~~~~~~~~~~~~~~~~~~~
   include/linux/nvme-keyring.h:52:27: warning: 'nvme_dhchap_psk_lookup' declared 'static' but never defined [-Wunused-function]
      52 | static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics


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
    53			const char *hostnqn, const char *subnqn, u8 hmac);
    54	{
    55		return ERR_PTR(-ENOTSUPP);
    56	}
  > 57	u8 nvme_dhchap_psk_hash(struct key *key)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
