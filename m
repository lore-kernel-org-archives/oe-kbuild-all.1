Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8093812D1F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 18:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726251918; cv=none; b=qVnghwOr4TvhnRi4LBc1FqLuh0O/ZMqE699aQIArDVjG6XaqyQpNPXoAMc1OchhcmXBtaYfYIYDwU143OTRqYrxp2PWrt7AtaVfIhirt0ahFiPS+fASUJgWZtjFuq0Hy7SjfpSaQPKQkR6D2AZJtGgDSWcL0YjVTxQbm6yQFkPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726251918; c=relaxed/simple;
	bh=jzX6jvGLQgSLvNZfYRi5Zq0yFTj4mHutWClp2zgkZjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pXb8J2d1Fvy9Z4hJo12EaNHEdxt1s6b5oVW4sVZ/U4KFr/5HB1aJwZoKlQnxNckhs4rALlcQDdPVXDtSBwnwecAMrhnrgMQ5Rf8K94eOpKYD3O1dRCjqAWx3tE4d56PdQMrssjy+Q6njTxB3UgVzEREi3cYEkKtyUmYOfXgtPt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSxptwp3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSxptwp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726251916; x=1757787916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jzX6jvGLQgSLvNZfYRi5Zq0yFTj4mHutWClp2zgkZjk=;
  b=kSxptwp3cGP48Bf8vsT+EyDjjo9CDmKDHS6Al9VZFK3v5mEe5VfI7Hrv
   HZkCOLKluepUN9KasJqmRer+gMcTIbWKDDjaKUpJTOcf+/QfGyMVvMmkF
   2Zqu1TZWXNFbBu4fWlkqJsDG+khMKNiGE0vw9mTm8K4QUf35oqFU+qUFx
   WNeWoo/LN5Zfp0mHJ70bTfNKaum18eW0HsxbCuAtmlYChpYBWE4fN/uGB
   scAtdvmWF40aXHo6OyndeW8AuphV/LbA1NZs44d8scJiLZtjgwY0lfHQR
   DMRJd5S+e/3juicvtuLNzI3hdQ8IxGAs/R/9EXsnclvEowMtT1lg1MrIH
   Q==;
X-CSE-ConnectionGUID: YRFnyhqPSF2ZMpjQWgb0dg==
X-CSE-MsgGUID: 9ttJBj2sRqmMzng07muGTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24988730"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="24988730"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 11:25:15 -0700
X-CSE-ConnectionGUID: fZu7ylM3TY6ggpIVxoEMSw==
X-CSE-MsgGUID: FCwRL/RvTGydTO/Pl/+r/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68088056"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Sep 2024 11:25:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spAyl-0006p1-2t;
	Fri, 13 Sep 2024 18:25:11 +0000
Date: Sat, 14 Sep 2024 02:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27796/30000] mm/mem_sampling.c:164:35: error:
 'sysctl_mem_sampling_enable' undeclared here (not in a function); did you
 mean 'sysctl_mem_sampling_mode'?
Message-ID: <202409140253.h1BCVyaA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5a1d9701155c6908c76c68951170f10279685143
commit: 9878268b0b9f6144b3bf066fa54124ce9c401072 [27796/30000] mm/mem_sampling.c: Add controlling interface for mem_sampling
config: arm64-randconfig-001-20240914 (https://download.01.org/0day-ci/archive/20240914/202409140253.h1BCVyaA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140253.h1BCVyaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140253.h1BCVyaA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mem_sampling.c:164:35: error: 'sysctl_mem_sampling_enable' undeclared here (not in a function); did you mean 'sysctl_mem_sampling_mode'?
     164 |                 .proc_handler   = sysctl_mem_sampling_enable,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   sysctl_mem_sampling_mode


vim +164 mm/mem_sampling.c

   157	
   158	static struct ctl_table ctl_table[] = {
   159		{
   160			.procname       = "mem_sampling_enable",
   161			.data           = NULL, /* filled in by handler */
   162			.maxlen		= sizeof(unsigned int),
   163			.mode		= 0644,
 > 164			.proc_handler   = sysctl_mem_sampling_enable,
   165			.extra1		= SYSCTL_ZERO,
   166			.extra2		= SYSCTL_ONE,
   167		},
   168		{}
   169	};
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
