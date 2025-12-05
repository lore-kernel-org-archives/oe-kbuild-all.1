Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C7313790B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 17:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764954853; cv=none; b=eZhiKp+ks/qtptGOyI5fk3xUZeoWPXxKgGtYsUowPy8z1WKbnB/v2HTN3nIb5vRgeIOenQ7FDsKYT3ThOILdmX429yEGd81FD2wY0xCgCxgrMLwU4YNhry46khQOcPQjtQxmJlmysfUAfJsiShg10F/N4eQTHr31Zi/y8/lgC2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764954853; c=relaxed/simple;
	bh=F/RBXVm2T/9DSm65rpJJtHYnwJOy+4qgpFqhAH2VI1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iWH9CrKvWffi15MuZgJ5Abmka1wim/JYUCcVp7HG00H9G/gD/465dg96qJ/e+s+CP8MvB2gR0OgNP0Xie39bi144TavAlVFFO7EiVXO3szX8U1jmL9raPKnXuWSPqULC6b5tOYreTVQUSqjAmuhp57TZTw3PiLv/a5yxkTM7r3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BK9U4voz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BK9U4voz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764954848; x=1796490848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F/RBXVm2T/9DSm65rpJJtHYnwJOy+4qgpFqhAH2VI1c=;
  b=BK9U4voz/TGOGJsYjrNrJHhJP1WiPn33kwta2vqVQMe9cgrEZ7RW5W4E
   JPWbhVnXX8/LsXkc/fJwH4aaP2pa+ol/b6tEM6U8K8nUTnnP99YRWpCSb
   Z57OIgJggml78TUuyOslwOXcLIB91opcjC6MZo7N70LrxpPCu55Ygw3nV
   1tGSS8KVgzG1hSgV0awQhM3mWV+jFrPLwUqQ+EckIjV5kGi8npWkYnw1m
   hmf4rrAuS/PIDIvGqQjjOs+IYjwr1Mixo6u4BLAtg9+SfEWjstVbE2hhC
   NxP4COqPzthMlpikRmue6jmYgzr+Fn8DrOMeXa+evCol/csDlu3/s+zkS
   w==;
X-CSE-ConnectionGUID: OT8gppfOTqC4AGcn2ANWxQ==
X-CSE-MsgGUID: 8AXEL2hNSWuhi0/rU4j34w==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66952001"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="66952001"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 09:14:04 -0800
X-CSE-ConnectionGUID: MAtsD1K6Tx2dq25K5DlHUw==
X-CSE-MsgGUID: lEuUNm7CQ/i6kC4Em5I78w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="226345223"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Dec 2025 09:14:02 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRZNX-00000000FGb-3WyH;
	Fri, 05 Dec 2025 17:13:59 +0000
Date: Sat, 6 Dec 2025 01:13:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3479/3479]
 drivers/ub/urma/ubcore/ubcore_tp.c:16:5: warning: no previous prototype for
 'ubcore_get_tp_list'
Message-ID: <202512060140.vNbFPUxu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: ea9d81b3942d8f0336b9207b594a748e20ec16dd [3479/3479] ubcore: add ubcore_umem and ubcore_tp implementations
config: arm64-randconfig-r061-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060140.vNbFPUxu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060140.vNbFPUxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060140.vNbFPUxu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_tp.c:16:5: warning: no previous prototype for 'ubcore_get_tp_list' [-Wmissing-prototypes]
      16 | int ubcore_get_tp_list(struct ubcore_device *dev, struct ubcore_get_tp_cfg *cfg,
         |     ^~~~~~~~~~~~~~~~~~
--
>> drivers/ub/urma/ubcore/ubcore_tp_table.c:18:5: warning: no previous prototype for 'ubcore_destroy_tp' [-Wmissing-prototypes]
      18 | int ubcore_destroy_tp(struct ubcore_tp *tp)
         |     ^~~~~~~~~~~~~~~~~
--
>> drivers/ub/urma/ubcore/ubcm/ub_cm.c:56:37: warning: 'g_ubcm_ops' defined but not used [-Wunused-const-variable=]
      56 | static const struct file_operations g_ubcm_ops = {
         |                                     ^~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/ubcore_get_tp_list +16 drivers/ub/urma/ubcore/ubcore_tp.c

    15	
  > 16	int ubcore_get_tp_list(struct ubcore_device *dev, struct ubcore_get_tp_cfg *cfg,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
