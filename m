Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F96310771
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 12:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767183100; cv=none; b=KXIpgX6X5LQDyyNvqP/62vWZ731Q2ucHYbv7GdnthhyrdXD9im7Zmk5Zm4yZWRV3uWtyOsPGkNJI9PTo8n3a6Y48cQaiaLhrE68nPK6FJ66kz6ZBZ7Nhu9P7fGPsxSa7nM7d/v+gbGKlI0ePZUIw7T/YE6Ear3yN1h1nxZSrETw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767183100; c=relaxed/simple;
	bh=TdhHwd/thgvCQJcc4nLbbXuQ/cWf/qjIIxFFYAe3gIk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YsFmoa4JLootpPHfK67jnbguUnhF9HHKaiRfZFSMFyNPjM7lDWWai6CC2arb37b62yyYOvQwrzGk+AGM5jPmYom0palLoJMVwLdMW84S3bzxBkJX37Vd+qA1N3hmxz8Ib+5rQfw1ofmnEqAqFhAvBr/TeCjUod98PvIH+nU+ApA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ls024sHL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ls024sHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767183099; x=1798719099;
  h=date:from:to:cc:subject:message-id;
  bh=TdhHwd/thgvCQJcc4nLbbXuQ/cWf/qjIIxFFYAe3gIk=;
  b=ls024sHLiBB583d9QC0GqUFPxp1gbyZNuekdibxoVvsHcn9IgmklBt3r
   zkTb6eZKqGEDt1D5eCchdZWIrXCyNAPLeR/SHF7Jxt96Io4cRI8ELl0yw
   4KHPYqWTSadDM8nl4KDo88vvSwC1XQQA+9RJVhpCEsHpE6QvbJH5cS0CZ
   rem6W7rOT0XUwscb7Sw2rSiJJaEuQKdPrUWE3H2oWsxVPjCHPAe/A1Ksi
   d1HXDdNXzVM+T0RYktSdcmVGsxT6sgFn4y92jpajRpXXi0mY0JPMVXEul
   lD47b6Y3Nd5QyRu0h7sYwqufSWjSF8vjE6p5Mk6IT6LPQXjMmZQ41Y89i
   g==;
X-CSE-ConnectionGUID: ZAUUbmL2Q7qYsiUVtmRgjQ==
X-CSE-MsgGUID: vPVM43QmQKKiQMlsIl1Jzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="86329321"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="86329321"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 04:11:38 -0800
X-CSE-ConnectionGUID: Qd5+tqiZS+qROMNqm9TDPQ==
X-CSE-MsgGUID: hpOe7eJqQdmV7uhAxsSGUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="201665742"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Dec 2025 04:11:36 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vav38-000000001BB-2mgx;
	Wed, 31 Dec 2025 12:11:34 +0000
Date: Wed, 31 Dec 2025 20:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 mm/pgsize_migration.c:26:1: sparse: sparse: symbol 'pgsize_migration_enabled'
 was not declared. Should it be static?
Message-ID: <202512312054.EmMyN6A1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ecd8c13eebd9ac39eaa1b45d9fe23ff020c4e68c
commit: 918c98f267d6a1512cb5d671523bb408da4b070a [2/2] ANDROID: 16K: Introduce /sys/kernel/mm/pgsize_migration/enabled
config: arm64-randconfig-r123-20251231 (https://download.01.org/0day-ci/archive/20251231/202512312054.EmMyN6A1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512312054.EmMyN6A1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512312054.EmMyN6A1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/pgsize_migration.c:26:1: sparse: sparse: symbol 'pgsize_migration_enabled' was not declared. Should it be static?

vim +/pgsize_migration_enabled +26 mm/pgsize_migration.c

    23	
    24	#define is_pgsize_migration_enabled() 	(static_branch_likely(&pgsize_migration_enabled))
    25	#else /* PAGE_SIZE != SZ_4K */
  > 26	DEFINE_STATIC_KEY_FALSE(pgsize_migration_enabled);
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
