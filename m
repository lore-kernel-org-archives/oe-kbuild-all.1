Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B55187EB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862828; cv=none; b=GTrlpiDg1rHmOmeL6VQwtZSbijcAAaUjG0axsPEeOe9l5v4qgQ74v/BABS0FdjIOHA6kH4P9PeuXrBoBf6L6y/aXgNaNCjSXpHfWR5HPxCnY9Zijly2IOhxUCVgf8K1KHR8KC/zGGQMxTIj0sc437FmXymk/vh/roi/oB6XMq8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862828; c=relaxed/simple;
	bh=wgP7zCTto+FidBlOhOlgSqwTZKiDVrAjju3B3AqGdO4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uO05AxPSQ3+yVlJhYnIgXAflcCTtfRLYuiXaq/600F6GaAevce1CpIPvjFImQQHUExWz4G/5NqgTlZsHsOeSvf2EkJlvDxtyuFzhR9s4Wi306A7CvPCVIB7Cb08Gz3dXT6QO70fiXAS1AKeV6HP7SxIsBvTrvZjnNsARMQwIsjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xfi4SJXN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xfi4SJXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790862824; x=1822398824;
  h=date:from:to:cc:subject:message-id;
  bh=wgP7zCTto+FidBlOhOlgSqwTZKiDVrAjju3B3AqGdO4=;
  b=Xfi4SJXNiNhf4+mrM4lT64wkn0fi58Fi9E34czf5Mnj7Br13ree8MHJs
   ea0cn2kPyU6HrmU7YXuZgnEian4Bq/7hMVdwT/V3JYSnUlZGssjBolSWs
   B0YmbJUrq104Wd4sngTVxtt4RU97cfgHdKukXqa+y1S8ItObC9yo/Fbiz
   EPezxSp+oht0DvnlrNrsveu2XO3bCD4+dkIusXY3SI2kSHhTe7C74uDlT
   vsy2BzgOSF4CO4+7HLt3NafP+/FkRaNRXbsvpEnsRMYiZYrXVULnuAk6N
   yTY6vnhhY8aen/rwkJgZuvziHVmVFsQKu41ZD1b/2jEbIgehphOiRvsUm
   g==;
X-CSE-ConnectionGUID: BpK4RZ3CSmeoqhp6HW2bNg==
X-CSE-MsgGUID: ZNSr1BICR2WortYiVHiB1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="101781534"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="101781534"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 06:53:42 -0700
X-CSE-ConnectionGUID: YDQDpJlXTx+JEu9tdB96RA==
X-CSE-MsgGUID: HoODPOvPTg+vnnSJ6gT0OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="273820136"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 01 Oct 2026 06:53:41 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCHEA-0000000006x-0zLF;
	Thu, 01 Oct 2026 13:53:38 +0000
Date: Thu, 01 Oct 2026 15:52:38 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 5/5] fs/crypto/bio.c:67:17:
 sparse: sparse: cast from restricted blk_status_t
Message-ID: <202610011559.kdim7aEy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   33fe3cb897e729ee4c6d4314f94c00039029fca3
commit: adcf6597b9c87ccb9fbcab9607e89e64f2b6a468 [5/5] UPSTREAM: fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt
config: arm64-randconfig-r2303-20261001 (https://download.01.org/0day-ci/archive/20261001/202610011559.kdim7aEy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011559.kdim7aEy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011559.kdim7aEy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
   fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted blk_status_t

vim +67 fs/crypto/bio.c

    61	
    62	static void fscrypt_zeroout_range_end_io(struct bio *bio)
    63	{
    64		struct fscrypt_zero_done *done = bio->bi_private;
    65	
    66		if (bio->bi_status)
  > 67			cmpxchg(&done->status, 0, bio->bi_status);
    68		fscrypt_zeroout_range_done(done);
    69		bio_put(bio);
    70	}
    71	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
