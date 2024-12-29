Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B833062
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735460906; cv=none; b=A+Yn7WPEakIn7hJs3VWU6vWu4FQXgrsOirL7iOSEnKl7eMA8BdM7g6LlngD94CliUecej11aAaj4gt92utCfZsF1DtkqB9dfREZXBfq/Wn+Y8OlnHlFy/i6Wo6u9B3T3yPE9wcIUcLQo+cMStgfKjU2TVbzupZnAunKfhtYkQt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735460906; c=relaxed/simple;
	bh=CSkuF3rlDzMT/qsEenSvQUdYND5y1E3QIpWis3YT9HY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ERBtium3OgszcGJf458TQYRxfSEOa06Iqhpd3i1n2PZDFo3PGaxZkrVV2+KPg8ixg3+vHaZTF0a80o0HYjxPP019+x/FUIioFkbUAEMEaaD3GQh14J6IVoSTvuYoiSl6yxl/j8cM6IlGMXsn99Kdj4ERTfvmCAxJJajcr1Q3fLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IafvGpYU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IafvGpYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735460904; x=1766996904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSkuF3rlDzMT/qsEenSvQUdYND5y1E3QIpWis3YT9HY=;
  b=IafvGpYU/cNxQsmxS3R2v/He6LaJOmoZtix/y/QuPx6QbivyrlzSsN86
   iIENBY0rRqC0moYhngfHBLwbrsrQkdKTkzNUKQacdMEm/yj8K6op91Ohs
   RcW0m1IO2uQ0oiAT1P9+SlmBQjpp7MgDdzBplVrnxAtuVg20EZx4wX8rt
   j1hK42Px0sDyp1mYHGnCyKO8RgDNLlo009u6+vUJsrf3ctOjW8NQN7PVh
   29HcCerTCJ94tzz4mxNbgyV3KsDv3OvsXNdyvKPTxxRWohPA9Giw0OJlA
   LSaSoIpgJyfGrGgs4xj8Ww9qOUlySpjHGrCiap8gvb9CK02SAk7P1L1GY
   g==;
X-CSE-ConnectionGUID: FNJR7cyATEe/CRsereFoDA==
X-CSE-MsgGUID: 3ahQslueTA+qrHXOEiQawQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="47147492"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="47147492"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 00:28:21 -0800
X-CSE-ConnectionGUID: cHa8zZuuTOKO9Ts3CBiUvg==
X-CSE-MsgGUID: YvidbGEiSz2Fu1eEy3IcaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="131353075"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Dec 2024 00:28:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRoen-0004ZX-1y;
	Sun, 29 Dec 2024 08:28:17 +0000
Date: Sun, 29 Dec 2024 16:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1356/1356] drivers/cpuidle/cpuidle.o:
 warning: objtool: cpuidle_enter_s2idle()+0x2ce: unreachable instruction
Message-ID: <202412291655.V0U37u8Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: c6c4145900fc6828c25ccce943ac3a7ae5de2739 [1356/1356] cpuidle: Fixup IRQ state
config: x86_64-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241229/202412291655.V0U37u8Q-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291655.V0U37u8Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291655.V0U37u8Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpuidle/cpuidle.o: warning: objtool: cpuidle_enter_s2idle()+0x2ce: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
