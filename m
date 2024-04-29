Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7757D14A8D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 08:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714377817; cv=none; b=fM0toMLu2zjQAXM+28h/ArDLeOrr7O1U48/PijCAwaJQMIWEPzF12bHI2VAUJAC1aBvpcV4s9spa+0ns0wV6WR+OVZ9zdJCujfxvZzq4dXgy3/oc4qxFwspceGUKvHH2nrM2hHPti6Tl6PgDyKCfGqV9VEIEi/66HDOdJK6n0w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714377817; c=relaxed/simple;
	bh=luHhnUcgX9gO96tm1u6DRVO4Z4UognHFSqZMiYi1MrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MEmfOOukzQ+8IX6sL2Z13QaoAQn1o7TqU6znHMFJ3EnU1jHn+aUo3+KxPoahwOEZPciIFnZySwsCIy1RMMJfVNliOxB0wt7KXv0mczj6tycDdbola0GTpHT/oZVnDsodSatOOErHsBT4qwke3uaT25kGaRLTQKBqJQNELJoBooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMzjfiC0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMzjfiC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714377816; x=1745913816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=luHhnUcgX9gO96tm1u6DRVO4Z4UognHFSqZMiYi1MrQ=;
  b=ZMzjfiC0QWqV7ms0jYa6KMNyhT50bpAOFeFnYa9tG+QM3Uq++5gSR51W
   9/+7e+TK2t+4SFWR19ynmFuybjrnM+WjHQn80H5Lzzcnc8i9dVfC4VuWI
   edOIxMpb6B0qFDzkHENumAWdTN0ciKoVhnH1dJ3ObNZ6Rh0mncuOYttZb
   nnB1vQuR4k/d9Hi/3K/T2La3ab/0NNaIozmKabzoaOm+kF71RHHJGGQqB
   XmJHLECuzj0XVW12SC68d/zhX4ivi3JJkO0kptb1tlaVyjtZRBdZWYOHu
   SW3VciqE9mfvpGOd2Ke6ie4R+ZmfamA9YG99oNFM8PfeIr4pjK8MMdC4o
   w==;
X-CSE-ConnectionGUID: w3nnJ3BLSP6h9c8OWy93Bg==
X-CSE-MsgGUID: fa9JMQtwTo24tsDyCQB44A==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10194191"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="10194191"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 01:03:34 -0700
X-CSE-ConnectionGUID: vyaxqv5dQ3awsB4IcXOkOQ==
X-CSE-MsgGUID: goe8+r+hSb+FP2zl0S6i4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30717490"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Apr 2024 01:03:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Lz0-000730-10;
	Mon, 29 Apr 2024 08:03:30 +0000
Date: Mon, 29 Apr 2024 16:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3342/7624] pgp_public_key.c:undefined reference
 to `public_key_subtype'
Message-ID: <202404291535.lMPHnx0n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7de1e2ce6e0d61fe34dd11c691619245f1b83db2
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [3342/7624] KEYS: Provide a function to load keys from a PGP keyring blob
config: arm64-randconfig-r063-20240429 (https://download.01.org/0day-ci/archive/20240429/202404291535.lMPHnx0n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291535.lMPHnx0n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291535.lMPHnx0n-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: crypto/asymmetric_keys/pgp_public_key.o: in function `pgp_key_parse':
>> pgp_public_key.c:(.text+0xc24): undefined reference to `public_key_subtype'
   aarch64-linux-ld: crypto/asymmetric_keys/pgp_public_key.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `public_key_subtype' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> pgp_public_key.c:(.text+0xc24): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: pgp_public_key.c:(.text+0xc28): undefined reference to `public_key_subtype'
>> aarch64-linux-ld: pgp_public_key.c:(.text+0xcec): undefined reference to `public_key_free'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
