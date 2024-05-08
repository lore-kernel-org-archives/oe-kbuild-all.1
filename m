Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3248411C94
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 04:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715142368; cv=none; b=DDOmk/m+oY9Aj2wTQn7a2zI38K5eabqgqo1dZI0+IZ9DaKzVmwhezn2euodGV9JUa6o4yxhHQ3umGqRWeXs26D3a8akApcTrq8MzsW11JKGCJu/QJUE8duqq3cFgTUnJPYGDzN8+BvnMd1lo1RFXKyrc49NYG/XKOlHiAf8tnp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715142368; c=relaxed/simple;
	bh=WWT1zU0k0cpRsAzqmcBzMTj5Xo24GfEOwsnjaTjKO8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jq9qpJig3P2ZSSWL+6fd+nSMpK9Zrhqtm6rukrL7VoOTLRclgoq7VX4hMzS5Edsu9yHVtLU5kVkPPqSwnC4CCej9i4op1fAkyPeol7xcNm4Mavxchkgau3LE1HTo56oeJFhzhXhTlXv/N0aycAwSNy2qKHEoNZ9jr/n7LK/oRWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZGukyhO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZGukyhO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715142367; x=1746678367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWT1zU0k0cpRsAzqmcBzMTj5Xo24GfEOwsnjaTjKO8w=;
  b=ZZGukyhOiXjuth5RLyHwVwjmXx762rUCU6/tx5KxOgoJVQs+0MJkijvs
   krQnysNfR8txrWMDKD9Dkze8jOJ34SGG57vusf5BIlcH3mz3Lu5EecHEI
   Hzrdinek7y7tFy57jQPgUteGNB8i/dJkNf3Px3c/8B2uOpasbEYt31RuQ
   MToxrn9g3ZhPiroRyJb4yDK1jVcTG6V73HFagoSmi0RZ5C5w6otnFYg0O
   7tY6Z5GVha06+D3+86ErfBoU0v3qAJn4k78tCmKf//T75/BQzhU9so9V/
   IUoRtmllFqcKoIWTufhC7FzJpacCLpPK82SdzQkxm4Ee16fey6ln7KqJc
   w==;
X-CSE-ConnectionGUID: 3eMnDi6lRQ2njjS4ac57hQ==
X-CSE-MsgGUID: Fm+NxBDuRyGboejSKpH9NQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22387663"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="22387663"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 21:26:06 -0700
X-CSE-ConnectionGUID: mhlgliO6QeWWHBR5PwcP/A==
X-CSE-MsgGUID: OdtPEHmxSuuPbeU9HUr1xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="59599438"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2024 21:26:04 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4YsU-0002xt-1E;
	Wed, 08 May 2024 04:26:02 +0000
Date: Wed, 8 May 2024 12:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zgzxx <zhangguangzhi3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3342/7652] ld.lld: error: undefined symbol:
 public_key_free
Message-ID: <202405081222.HGBT9mha-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   afd82dd979acad2f99b9d30f8ce8463ca4153a05
commit: 43d4042e06d2bf96adf67d25e8d91653507a4cf9 [3342/7652] KEYS: Provide a function to load keys from a PGP keyring blob
config: x86_64-buildonly-randconfig-006-20240508 (https://download.01.org/0day-ci/archive/20240508/202405081222.HGBT9mha-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081222.HGBT9mha-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081222.HGBT9mha-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: public_key_free
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(pgp_key_parse)
--
>> ld.lld: error: undefined symbol: public_key_subtype
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(pgp_key_parse)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
