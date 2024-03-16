Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6C7168BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 15:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710602094; cv=none; b=keXDuAOR6EjHFHRtLbo081+UO9Ve+GTAgfph68Pw4WsPOQyiy3FHPUDmGBE+Kj1vNAcsG5uXvCHwD3gDNX7ZndFeXD36GufW6Aoa5tQkhsT0ER8UP8X+5VFnqeuLh0d0giME0ZZuy+C13YDMc8aLvNaaVIr9lW1JKIzkBqgZEOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710602094; c=relaxed/simple;
	bh=5YW0/yJ90oByPAlDMTLMukA1FtfGgdrUAw7e43CV1xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kkl9U240S84ez45f4OYebrNK9eNqZd6iwVwsH3NIVS0QzQiHujt6/6PQfZ6TjNFPOjBPhLfA5Px/78+zjGxemx9+lp0gXRaIPpCn/y67SshIFFcBbv0yo5o2yrWjKDy2SHhxy2NBA7zGD2mEiXrLVdtLoZ6zuK2EhIk+/tuVIF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7RnL0me; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7RnL0me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710602092; x=1742138092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5YW0/yJ90oByPAlDMTLMukA1FtfGgdrUAw7e43CV1xQ=;
  b=i7RnL0meTk1XAluBp1RQYQSia1aKknz6JSm83nXVmS28YOnUWbShsPR+
   1vyH6gMg6wOx6Rmhy0rbdSEcddWwPNdnFTyASCR6oCV72jrDfxTDXPHcv
   w6/XxJl8QHj0vIPGR8t/8fVS+ySMuaJdDTanZR1kLti13t3d+RLgJQfPC
   /bZFEv1gZ4pyOu5fbfxC/BuwywjAx4Ice0V00SLhUGgdKu1Eqju9Scmxr
   QfSZTU8rvREkXcoZwsmU5RO31IyjQJvx3+Bo5MO1wvuVzaCGH520CYsw0
   KRVQtiBYQtcUKY8ns4KQF01wOAo/AW4Efh6+F3sf+yiruJox2RbslYmuY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="27941035"
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="27941035"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 08:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="12924482"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Mar 2024 08:14:50 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlVkF-000FWf-3B;
	Sat, 16 Mar 2024 15:14:47 +0000
Date: Sat, 16 Mar 2024 23:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24813/30000]
 drivers/ub/urma/ubcore/ubcore_dp.c:26:5: warning: no previous prototype for
 'ubcore_rearm_jfc'
Message-ID: <202403162310.RbkbvVYd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   32bb7b0a7c87769858fbb9d60574b830383c28f7
commit: ad84f0a92e3fe282d8280d8c45f8d5b8aab1a2b4 [24813/30000] ub: ubcore add event api and add jetty and event api impls to compile
config: arm64-randconfig-003-20240312 (https://download.01.org/0day-ci/archive/20240316/202403162310.RbkbvVYd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403162310.RbkbvVYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403162310.RbkbvVYd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_dp.c:26:5: warning: no previous prototype for 'ubcore_rearm_jfc' [-Wmissing-prototypes]
      26 | int ubcore_rearm_jfc(struct ubcore_jfc *jfc, bool solicited_only)
         |     ^~~~~~~~~~~~~~~~


vim +/ubcore_rearm_jfc +26 drivers/ub/urma/ubcore/ubcore_dp.c

    25	
  > 26	int ubcore_rearm_jfc(struct ubcore_jfc *jfc, bool solicited_only)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
