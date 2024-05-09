Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A454613BC1B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715223717; cv=none; b=LM3oseydgSSM69xOUOFrzj+WTVjbPbAJMPZqqV6CwN938+eBjIBx6sG5uFJ4IpPNbxbKjG47pyiWSHBUY6+eVq/DXfzl/1kPVDEnbieGnZarpjS5RaJvR0M7RHeA6oWCVGqHTI7MxR68d9sXOaoGdCn/f074FSugGFzj8EMTOOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715223717; c=relaxed/simple;
	bh=Zlw4KkNhMi51YFVouGJsewNKdKfKDjtcFDpXJa7AWC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lx7DRtcN71BCoq4ep6ivi8Np4bD4PeOgGHLVhQHzB2EKgPfaih6TLcLjpjH19QxlrgSmYTPFaWp3B7DdPE9AS0FjhjPCAvkuT+mNt9U92PsogxrBQqcW0sGBw54ae5uVTDGelidD4Z5LCQD+aZUuxP5KJRoJC6WTxCe8IghR8Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bao7lgNb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bao7lgNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715223716; x=1746759716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zlw4KkNhMi51YFVouGJsewNKdKfKDjtcFDpXJa7AWC0=;
  b=bao7lgNbqgq6yot08CKbjh2M8EJYRhpVhg49hhep2CwJbP7KJg/+8JFn
   egRAYk3jAl5/W2EGZu7EOLk6i07oD313INcmCjXEyGbIcS4iKk9VTn3p1
   GB09B3t6gqdagZ5wNE621emVRl05xcvnmMl7VhMa9HLolRSnttbLO4rUu
   61rG6BmK77WBVw163c1C+s1ey0ypaVVXoqGiaxViT1iP5hHFBTlbYjXep
   DP4kgQkav+HweaIyzjrwQECPBAjB97FX0cc69aTgnC/Xo9A+JCZEH0x0W
   ixiU/vE4Vbk+JGq9x4zUExA242rDc+4jmL2SHckjCX2b0XtWYNFqrmwpQ
   Q==;
X-CSE-ConnectionGUID: jG0tik7VQlKAdVM/botQ+w==
X-CSE-MsgGUID: YzSzp98CQG6WSNOglbNJvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="21689197"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="21689197"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 20:01:55 -0700
X-CSE-ConnectionGUID: xj6sZKBsR4CxrmN792Jtdw==
X-CSE-MsgGUID: c8kfgXLjQQqkJWZSjq+wdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="29618252"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2024 20:01:55 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4u2Z-0004NM-2H;
	Thu, 09 May 2024 03:01:51 +0000
Date: Thu, 9 May 2024 11:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Steven Song <steven.song@3snic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21328/22325]
 drivers/scsi/sssraid/sssraid_os.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202405091039.NCGh5Ism-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c95e10512c79660564907e3ba0c6403dcbd99d18
commit: 2e2a4edd9d4a725c5474dc278b090913d9b5bfd5 [21328/22325] SCSI: SSSRAID: Support 3SNIC 3S5XX serial RAID/HBA  controllers
config: x86_64-buildonly-randconfig-005-20240509 (https://download.01.org/0day-ci/archive/20240509/202405091039.NCGh5Ism-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405091039.NCGh5Ism-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405091039.NCGh5Ism-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/sssraid/sssraid_os.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
