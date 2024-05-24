Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA4E3BBCF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716574512; cv=none; b=QbO/O/WS+hMZGAW4MAjYznGBsSnqIjDm6srnUJ0LHVSt2FNpYSxVi0EHg02woG9fqL9iVGG762w9/Zot7FKLo/fuanBamIjWhfvdE6pqMRla/NtYfe269DrFNMrXQUeNUZxSEElvjPQ5V5/aKD0uHfjQWJRUgr82VaHInrLu+Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716574512; c=relaxed/simple;
	bh=JxNqYpQcM/PoDVpO+3HN76WvrwFygnpBgoCo84KZFUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p3thx+Zn7J6RcamkUXnKykzSfHOOdPMxngTBIZ0LG0PVAIWgyhcwH83LpzyMJi2QtsW9RGYwQVHSoacwWGC/p5aJo5SkN+x0qFJJk5AfQdih/hdgFBBwWM4Kkxl+gedjPyRDCVEuvHnv7op14ilOstRk2kVCqnEjibPu7lPQ7EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBy/J2rW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBy/J2rW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716574510; x=1748110510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JxNqYpQcM/PoDVpO+3HN76WvrwFygnpBgoCo84KZFUM=;
  b=BBy/J2rWi+UXwX7n8Dg0/MWyNox6dYRCGyinF/DF0KtEWoAJO7IqSdQ3
   98At5+2FY8ZXLasGah+zt5Kc9qTCPETgkuYxRHcrBX+Ii4gvWbKTeE8zo
   0mfZWU7FJ/QSrzjNl6mAOhiY6zMzdmg6suS+up3OTN0yE/1vPFUGEY5K6
   Ld893G6MG8ivx/sFKsKFhWuv8i2sRvf+8YuV4eb5LaWLpYu5RW3ewIxQs
   /TG3DaiKojJN/S0ofQn9ZSRZThBG3dY0mVVjv4jtK774a/YhQAKYwFj/1
   rZy8St9+tVwBvaJBzx2m2x92SE5vs8Pbl7OYUl+6oB4cawNr65c4eO8Wn
   Q==;
X-CSE-ConnectionGUID: m0oba6JTTvWrQeii7hnWqg==
X-CSE-MsgGUID: KDu1zwM1RYO0/fC+knmjrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12748854"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="12748854"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 11:15:08 -0700
X-CSE-ConnectionGUID: LSH42OtNSb+eBBhB4KF5hg==
X-CSE-MsgGUID: tYnANxSGSc2ZTmFlBtUZMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="71518681"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 May 2024 11:15:08 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAZRa-0005mV-0k;
	Fri, 24 May 2024 18:15:06 +0000
Date: Sat, 25 May 2024 02:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v6 5/8] ld: tpm2_key.c:undefined reference to
 `sprint_oid'
Message-ID: <202405250224.txzZs5qu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   e757613ecd3146679925b1d4fcdaf8da2332d5a2
commit: 089e702b901d8ce0346a9915431dbf42c90a3f82 [5/8] KEYS: trusted: Move tpm2_key_decode() to the TPM driver
config: x86_64-buildonly-randconfig-001-20240524 (https://download.01.org/0day-ci/archive/20240525/202405250224.txzZs5qu-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250224.txzZs5qu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250224.txzZs5qu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/char/tpm/tpm2_key.o: in function `tpm2_key_type':
   tpm2_key.c:(.text+0x258): undefined reference to `look_up_OID'
>> ld: tpm2_key.c:(.text+0x2c4): undefined reference to `sprint_oid'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
