Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2E91BB6A4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 14:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893428; cv=none; b=a+aPJEP8uwyayUmymYEESeeqtm11YTQQ89g4JG25EWOvSg+eNXfUKFDa/G4vvZRmsaTPm1OAui7nfmdx7j3pmzGVT1NS0/xo35X5zgjc2hiv9jlWkcqRzlUv9fELnPj8bdIogT3KI4REb0SecD/RuW8baxNhZaBEBrMH0snzIpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893428; c=relaxed/simple;
	bh=5yaU2huBrojkJLQBmFEOcC7IvRG2ddhsMptH1XhfjcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HE4OFvdPulMO+8S/TJ6pPQEHIF1T5mtSR2LoDGJVQSWsfRTdYcbRFmyYmtdnFFitPqzepmOAMAowrUHCxNGUYKmSt7cJqUgJ0Iml7Fu6B2Otv0wQaqYu1g4qEWD1USn5GkpnfX7nVGRRCi9dzD87aQu7xtg39oURguDediPnVgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHef6PfE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHef6PfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725893427; x=1757429427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yaU2huBrojkJLQBmFEOcC7IvRG2ddhsMptH1XhfjcY=;
  b=UHef6PfE1OAvU6n9xrICJUlsR9GgWZEVVqusyusa+HLj2h+HsHnd9jyS
   EJb9seVG3nkhzKV4dJsR+V7rXuMCbU7lhvv27+s6eopXChm/830KmFmP4
   gxW9DjBBw6sMcf8WqJ7IeuJdGqrb0/0dQ8xHmdztLYtbj+jwuewobz67v
   PlueKd0BOtuxRVWsP/Rf6cEW0c+kEhZY9LsB0iEliO4ayeQ62nqpWB9xy
   aKfzpaEz21DPGM+LKIgqQGJUnuaK6F/nC8ULiOSNffKBSnH5qFNG6kSmZ
   krGSzhdTQWTWnbp3/I995G9trdbzUCbKVxBzjGsveeefEiHYlJn5apoRZ
   A==;
X-CSE-ConnectionGUID: b2UNXSJwQ66Lq2pWddQGAw==
X-CSE-MsgGUID: OZr+D9DCRlarzLwETZ0WYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24461190"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24461190"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 07:50:26 -0700
X-CSE-ConnectionGUID: drFBIyfARyeNZMIGMrm6Ww==
X-CSE-MsgGUID: 7cz27t4LTNKzGX6Jg1WphA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="89978682"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Sep 2024 07:50:25 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snfih-000Er6-0O;
	Mon, 09 Sep 2024 14:50:23 +0000
Date: Mon, 9 Sep 2024 22:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 194/258] arc-elf-ld:
 main.c:undefined reference to `kvfree_rcu_pending_init'
Message-ID: <202409092238.tJPjq9rG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 66de14f67dd993fb93e846432af241600f522d83 [194/258] rcu: Switch kvfree_rcu() to new rcu_pending
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20240909/202409092238.tJPjq9rG-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409092238.tJPjq9rG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409092238.tJPjq9rG-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: init/main.o: in function `start_kernel':
   main.c:(.init.text+0x942): undefined reference to `kvfree_rcu_pending_init'
>> arc-elf-ld: main.c:(.init.text+0x942): undefined reference to `kvfree_rcu_pending_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
