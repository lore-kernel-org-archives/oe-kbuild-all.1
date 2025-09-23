Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E31A274B51
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 04:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758600405; cv=none; b=FTCZ4m/42ubwNM+kYATiuSLpGdJW0apvi0zitSiarPoxzH4cukxAh7YT70k766OPGvIIUzb4Yuu2LcK6xL3phGkYJXcVaK0dzx0Ye9K87cF+D8hfgQIZlBHO/6SgRl0I5voRBd+P/dLzcFufH01Z68Ur4SOA7VxeZ129xX9IX50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758600405; c=relaxed/simple;
	bh=7FQZouaepFPnsBW7jUa9EIspyBwRi+7+eS3HBNreQDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W27SY/jcgsZ/FdK/b8GXZGgR1VrM7HTlbNyEYqU6lomW3qoCbKGsAqSznBhUCNAUuWdxlw0b4bZ06qJz67iQ+q0MFkjc7otP2J409dENfBrBzb8kK6kAg+KJBIhqSuVPNTla4SdrsiFlIYGDaor2d9aacH5K6SqNGs69Hg1NDEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvLsufvM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvLsufvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758600403; x=1790136403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7FQZouaepFPnsBW7jUa9EIspyBwRi+7+eS3HBNreQDc=;
  b=AvLsufvM53KZhRht2HUGQ27LcQgVrb/Ad/Te/Hhn6x9a7IK/YlCUthkk
   dLZ7PLCwSwLirOr5CtSzEwD5DnXj/t5bTefK8tkr5/7/SvZ3AApyChE6o
   LzzN0gmuNU+tY27fK0qoVoQBqs6rOMOB3s4v/z7Ngg55Ap2F3S2nc1GO/
   Id2ZSBBIvJcYlBlWzRcu1gSKItcEyy2Hz6Lf7SHj+h8mRWbzj5f5YfDzb
   AEIRnDP11KvmsWXBw0PTlq8WZTK/yJy76pOzxqXyNwnRH2us2GppsH8/5
   mkE/exCAQdKggHmwMaEKQy81ViICzFDa7FeuqBBWHH6PB/TUaZJOHaUXt
   Q==;
X-CSE-ConnectionGUID: xdmSO2q5QPybrnUHlmCe/w==
X-CSE-MsgGUID: KgQtRiVqTVGW5eDbXCrDiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61042040"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="61042040"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 21:06:43 -0700
X-CSE-ConnectionGUID: wBCKj5FlSHugf79YjY/2rw==
X-CSE-MsgGUID: mlsYT/j3Q8qv57NbXpKvGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="176495726"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Sep 2025 21:06:42 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0uIW-0002ja-0k;
	Tue, 23 Sep 2025 04:06:37 +0000
Date: Tue, 23 Sep 2025 12:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2909/2909] mm/mem_sampling.c:38:33: sparse:
 sparse: symbol 'mem_sampling_saved_state' was not declared. Should it be
 static?
Message-ID: <202509231143.zSdArtSF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   be758a5796c3d280deb877699c41fd0cd04e1deb
commit: 02f32cc0235e33f7fc3e4910a80d386bc600935c [2909/2909] mm/mem_sampling:: Add proc and cmdline interface to control sampling enable
config: arm64-randconfig-r121-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231143.zSdArtSF-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231143.zSdArtSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231143.zSdArtSF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mem_sampling.c:38:33: sparse: sparse: symbol 'mem_sampling_saved_state' was not declared. Should it be static?
   mm/mem_sampling.c:51:1: sparse: sparse: symbol 'mem_sampling_record_cb_list' was not declared. Should it be static?
   mm/mem_sampling.c:53:6: sparse: sparse: symbol 'mem_sampling_record_cb_register' was not declared. Should it be static?
   mm/mem_sampling.c:70:6: sparse: sparse: symbol 'mem_sampling_record_cb_unregister' was not declared. Should it be static?
   mm/mem_sampling.c:83:1: sparse: sparse: symbol 'mem_sampling_access_hints' was not declared. Should it be static?

vim +/mem_sampling_saved_state +38 mm/mem_sampling.c

    32	
    33	enum mem_sampling_saved_state_e {
    34		MEM_SAMPLING_STATE_ENABLE,
    35		MEM_SAMPLING_STATE_DISABLE,
    36		MEM_SAMPLING_STATE_EMPTY,
    37	};
  > 38	enum mem_sampling_saved_state_e mem_sampling_saved_state = MEM_SAMPLING_STATE_EMPTY;
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
