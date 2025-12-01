Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4830536D4EB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 04:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764563958; cv=none; b=sGvUF2RROWj/+JgLZfRKCrzsSQlHIiE3KNHKYm6xsDpfjD7ni1gTAg8L7wfmzDAmtvQPYhSBdLq0+UGQpUpITANkQcMTqWjKgFshRoZ/vBylZ1dARVF/eHdi8Y+EnDMehhCxAB4jrApfX2nADiQ+NoLX5Dqcs3gJ0Q7ji9e4yqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764563958; c=relaxed/simple;
	bh=MvgJnLmAxbEQDmTzGuFWrp5woXHIodEyjHUzYAurx0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pj4PFFy2YXtCd8PrbzzaVPo080QUHdsEhjcU+8V7GhKcb9OCFGbWTovLlAASQKjtuNmoDErSGJ9kaCpcrbOKRIgAeWqNeBSwU1FNudEB1DuhB2n1WnTHEXamUIc7CLDAsAoVj8D38kyn4DzhcyAazdQKXoaX9Gd44n/aPMXBDzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekXspapb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekXspapb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764563957; x=1796099957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MvgJnLmAxbEQDmTzGuFWrp5woXHIodEyjHUzYAurx0E=;
  b=ekXspapbMNh9jxf5vdyco8h19QiQfantF3ApSTfTwq4FFn4my/+FnAPF
   Dm/iiKjk3cSRJf+E1lH+A+T2uXMhJ5Kdot9vliWZ5e5zmNVSixXqIr8pq
   sNK5fJ4xIt19ZlXlH5JeiL/Kg3gvlSuYWZnAkHh3Rn8j3XEQ/oIO+H919
   DIQHMz+aOcpYiAnbRN8zxQeEp7LhFz+Rnk30UFgXVRvuY7iO0HZQh9pAa
   J/nhR41UEJ3iawf2vRFYhTFydxdWpT6eCC/uDJfqBxojMwMacvVPx9eM0
   EBno0MYF5dSzCyKv5RzMThC90AKsAHKRp8VHuP0/PEwuumUIpxyz0Jl62
   g==;
X-CSE-ConnectionGUID: /+MpgTELT3ufR8nR/Nh0kg==
X-CSE-MsgGUID: xFVOwiq9TvaxZJ/OedoOmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77598119"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="77598119"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 20:39:16 -0800
X-CSE-ConnectionGUID: rlkhyA2tTg+GebTTBCk6Yg==
X-CSE-MsgGUID: GQLCoxN4QqSdLGgYyeV04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="194752248"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Nov 2025 20:39:14 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPvgu-000000008KN-2HQ2;
	Mon, 01 Dec 2025 04:39:12 +0000
Date: Mon, 1 Dec 2025 12:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:keys-trusted-next 1/2]
 drivers/char/tpm/tpm2-cmd.c:21:18: sparse: sparse: symbol 'tpm2_hash_map'
 was not declared. Should it be static?
Message-ID: <202512011230.GZr3HSNP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git keys-trusted-next
head:   62cd5d480b9762ce70d720a81fa5b373052ae05f
commit: 127fa2ae9e2b1f9b9d876dfaa39fe3640cec5764 [1/2] KEYS: trusted: Replace a redundant instance of tpm2_hash_map
config: um-randconfig-r112-20251201 (https://download.01.org/0day-ci/archive/20251201/202512011230.GZr3HSNP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011230.GZr3HSNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512011230.GZr3HSNP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/tpm/tpm2-cmd.c:21:18: sparse: sparse: symbol 'tpm2_hash_map' was not declared. Should it be static?

vim +/tpm2_hash_map +21 drivers/char/tpm/tpm2-cmd.c

    20	
  > 21	struct tpm2_hash tpm2_hash_map[] = {
    22		{HASH_ALGO_SHA1, TPM_ALG_SHA1},
    23		{HASH_ALGO_SHA256, TPM_ALG_SHA256},
    24		{HASH_ALGO_SHA384, TPM_ALG_SHA384},
    25		{HASH_ALGO_SHA512, TPM_ALG_SHA512},
    26		{HASH_ALGO_SM3_256, TPM_ALG_SM3_256},
    27	};
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
