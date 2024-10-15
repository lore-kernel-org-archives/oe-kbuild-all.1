Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1418F38DC7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 18:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729016084; cv=none; b=WoTw+R2CAjZxMft0ySEs1I+DXpUXzd7N7P7F4MpyzsXN5Ds9THl528iy7ufsyd0uFrhq+FHfvk9oFpMGvV0p5PkxQIa70UiSY7R3AU2qCEIALemq+jQper4gr4+7IR1ga64WsF4adE3lP/NeVEPM7Bt3z1qHlNU69wrbExNMsAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729016084; c=relaxed/simple;
	bh=CTSevKpjNCFCjh9sIsSIbqQffKUscBXYyvh5O+PdJK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=coCQ/4QLRTjHZ1m6UBFBiWpWbtfJ5ATn1gCAUZ82Dpj44oUv9fEcyq14m6tud8WYsYqQ5jKRV5+iyhdaGzYx/V5+J8OfB8jouhQYioAANHxC2L8CMQLZOFgHj0T0wQXFZghYCCst5cOsArdUU9+v9YFw2F51ty/ave9N2pzw0UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYyYyIpq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYyYyIpq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729016083; x=1760552083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CTSevKpjNCFCjh9sIsSIbqQffKUscBXYyvh5O+PdJK8=;
  b=jYyYyIpqR05oSNvtm6sK4vXVmoIVZV/sJvTRrI710+a379yc7f7AUxOm
   KTP802YZ1gjL8C3VnM3mjFlqAy1/OP+ZkbhAnyoPc2kd4TdfyASatXqse
   NELOXhL9DKbqMq+RrIjBsCUTKrcHVpY2H7I4rQlnAG2wEwttdeEaKBc8p
   yJj+Rwl0EUuB/ELcfwNJkeNkxKeSk7pDfmvDhGj5WZ6zTY0bbcOaMB9QL
   lc0wvCj5JZ9gKPoXBouv5/pd4Jv8Ee7G+BVmHurhG1oIw3tLRQnPaQ19C
   jjFsAn+ut/43tf2kqIR1pOddKKeQf+QCpNCXpqsmJeMgWU7LBBRakVi8C
   g==;
X-CSE-ConnectionGUID: KcRVS68VSUmP9AvO1u08Fw==
X-CSE-MsgGUID: WjvHTXnXS26uftYpciKTpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28628946"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="28628946"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 11:14:43 -0700
X-CSE-ConnectionGUID: a7KOUcU/SY+S8FyJrjSK0A==
X-CSE-MsgGUID: TDJNSMxXS9WzwzK4zql4Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="77639224"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Oct 2024 11:14:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0m47-000Jje-1s;
	Tue, 15 Oct 2024 18:14:39 +0000
Date: Wed, 16 Oct 2024 02:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:secure-concat.v10 8/9] include/linux/nvme-keyring.h:14:1:
 error: unknown type name 'key_serial_t'
Message-ID: <202410160250.3JbxU4Q0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v10
head:   a8ba61516ad206eec3f24de36c92722d45e92354
commit: 1437df5a5209c40045e362930c5a0a4eb1c2c33a [8/9] nvmet-tcp: support secure channel concatenation
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241016/202410160250.3JbxU4Q0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160250.3JbxU4Q0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160250.3JbxU4Q0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/target/auth.c:18:
>> include/linux/nvme-keyring.h:14:1: error: unknown type name 'key_serial_t'
      14 | key_serial_t nvme_tls_psk_default(struct key *keyring,
         | ^~~~~~~~~~~~
   include/linux/nvme-keyring.h:17:1: error: unknown type name 'key_serial_t'
      17 | key_serial_t nvme_keyring_id(void);
         | ^~~~~~~~~~~~
   include/linux/nvme-keyring.h:18:33: error: unknown type name 'key_serial_t'
      18 | struct key *nvme_tls_key_lookup(key_serial_t key_id);
         |                                 ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/key_serial_t +14 include/linux/nvme-keyring.h

9d77eb52778499 Hannes Reinecke 2023-08-24  10  
7077fa769151ee Hannes Reinecke 2024-07-18  11  struct key *nvme_tls_psk_refresh(struct key *keyring,
7077fa769151ee Hannes Reinecke 2024-07-18  12  		const char *hostnqn, const char *subnqn, u8 hmac_id,
7077fa769151ee Hannes Reinecke 2024-07-18  13  		u8 *data, size_t data_len, const char *digest);
501cc6f4aca8dc Hannes Reinecke 2023-08-24 @14  key_serial_t nvme_tls_psk_default(struct key *keyring,
501cc6f4aca8dc Hannes Reinecke 2023-08-24  15  		const char *hostnqn, const char *subnqn);
501cc6f4aca8dc Hannes Reinecke 2023-08-24  16  

:::::: The code at line 14 was first introduced by commit
:::::: 501cc6f4aca8dc0958c4d9716f0233ba7cff4830 nvme-keyring: implement nvme_tls_psk_default()

:::::: TO: Hannes Reinecke <hare@suse.de>
:::::: CC: Keith Busch <kbusch@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
