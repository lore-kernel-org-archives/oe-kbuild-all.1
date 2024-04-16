Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20C43A29C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 05:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713244189; cv=none; b=B0Ke7NZzBaK60Axz9xL5czhe/bt6FFFKpw5hhHayQE1ENf54ArG8dIMvth7qrYxxB7VYOVHGAnWsb7cEDLgShXIJ7eRS/bejiOnDZr4P16n9lIqOCSJ7U33ANNsqeC+K7vDr4avHqHhNHfuhwmtclJa43e9HixOEYqIP4hmJNZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713244189; c=relaxed/simple;
	bh=B0+SqKQkCFp7BOme9i6En7/oev2A7Q5vDNE6lqM5DcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rp1PhIvZc6qcdKQpisy3mJUpaitYbjx57dGkesyl/4aNim61+gWbPbU3jXMLo2sm7RnpqTutEG5lrwZWCbcF/990q31OkqF0DCBXE54mxXhpK8i/pOKxwGRVBZm30App08HChvaZQwDoNVN7OYM/sylGSlWrBfXjz60MnYpuRV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7knNHY7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7knNHY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713244188; x=1744780188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B0+SqKQkCFp7BOme9i6En7/oev2A7Q5vDNE6lqM5DcM=;
  b=k7knNHY7wn5yooRsxLKIKq/pN/hkLDApuK10qWxMH7DAzSdvnMxgB5ZK
   rgatepawSTuQC6nPq3jkHeDu6+PgP0ehKn9+sQoG9h6KG3etJCUntz/QW
   VPe0NZ5eHBWKbyeZOzNSPDSVAJDBz+10ls7+A9eC+iiqyJcuemaZ3fuQW
   xSisklIFEtWUvqX+b4pUscJKVXOhwoEjmZI6CgcGBbAdfOxjpDv8A+uWv
   yzmYFoc+ibptM2krBYkXexOWLXzVDoBxJ695Sk+I6/ZtXzPSFdXbAoQif
   8qyf2wG8BitmQOkpJLNF1aJZsQfCx9KrVDZTxAp3nNIleN5D+tjjSJrfQ
   g==;
X-CSE-ConnectionGUID: Re9ei+ibQ3eaovKX8fUvKg==
X-CSE-MsgGUID: YVxTpnokQC2UCkECIWsufQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="11607906"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="11607906"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 22:09:47 -0700
X-CSE-ConnectionGUID: hTL87v8zSmiE01LjKtUa5w==
X-CSE-MsgGUID: k/NMK4VKQ5yXM2bDsv+6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="26919520"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Apr 2024 22:09:46 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwb4h-0004yK-2q;
	Tue, 16 Apr 2024 05:09:43 +0000
Date: Tue, 16 Apr 2024 13:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/5] mm/pgsize_migration.c:22:1:
 sparse: sparse: symbol 'pgsize_migration_enabled' was not declared. Should
 it be static?
Message-ID: <202404161322.alawBRaY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   084d22016ccabe60338ea69b0a1c4c264551bd4c
commit: 9274c308d8469e26a5f3fb8b598000edcff6b135 [1/5] ANDROID: 16K: Introduce /sys/kernel/mm/pgsize_miration/enabled
config: x86_64-randconfig-123-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161322.alawBRaY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161322.alawBRaY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161322.alawBRaY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/pgsize_migration.c:22:1: sparse: sparse: symbol 'pgsize_migration_enabled' was not declared. Should it be static?

vim +/pgsize_migration_enabled +22 mm/pgsize_migration.c

    19	
    20	#ifdef CONFIG_64BIT
    21	#if PAGE_SIZE == SZ_4K
  > 22	DEFINE_STATIC_KEY_TRUE(pgsize_migration_enabled);
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
