Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51DFC08
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 11:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745408186; cv=none; b=ePWc2CeU2KHDcJovWDKEFeGgQyPUDtbBKjWRjUr0zpbg7u5S1JfksELoKy5AC6vFFxKCNtBMOpp8ICTfWmMigMx83tYO9FbWGrMW5KEG4lUZ06/cyIMxuMQDz4grIWbDiyrq+iHjFkRoSKuNasD598QAl1mqhOLfBa0PSH6ixcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745408186; c=relaxed/simple;
	bh=K9+k+QCVTbnATLSXGW31A7B1Z3QLVjdijDsyUSoVx04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U4YlgmfCSiiM62ey+Mjvrt+LevZtiUAkbEKfGEfDW3g/lcMSLrGyoWj7v/xU/7syIRzzbvlW1vyBX3FdTlFciJuiXf7wnDca+kNSCwm0AcFf02nov4RE5OSWxhYvZ53H6CvPJa73Xbf+jlb5BQupMtbkyMRoOb0e9ROoX0xToAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YeWYpIOM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YeWYpIOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745408185; x=1776944185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K9+k+QCVTbnATLSXGW31A7B1Z3QLVjdijDsyUSoVx04=;
  b=YeWYpIOM7R5jFef1+rgMhJt65Gl5NBdFJ3TrePfXly0HfZmSp9LWNbjo
   jjuRtc6RZXg9otfQ3xyojoDBLNvTbZLnIR+Hnf10mxZUtOHk2Am4rAnTa
   Pk17c8HCmBbbcpy/bqpfLvX5uDhmOpzNosjU6qeBg0iAWmkSp3jhZNLB7
   TXnHLaFHgNC8itucE3AOZVLUnh/alQBSo44+J+FBVYFToYxGhIUkSK6iO
   RFiPS7YkoO4zJUGAnwJtrbOGnAJ2GYDoqOtM73P0TsWoXIhCW98ASXvZk
   bSZgukEMqGc3CVh297lHBTlk2MlbXTK0vlKIPJUK+fRljAw0dOY02KwCa
   g==;
X-CSE-ConnectionGUID: ppEjKmA9QQOGenb2ymWXvw==
X-CSE-MsgGUID: yDdqW2OpRGe9auSnDrpXgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50826060"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="50826060"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 04:36:24 -0700
X-CSE-ConnectionGUID: LdQWrE6lROK8ShwIIiL9Aw==
X-CSE-MsgGUID: 4IUHFqbYRpWFoSzbRJ2m0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132597590"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Apr 2025 04:36:23 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7YOr-0001wZ-0i;
	Wed, 23 Apr 2025 11:36:21 +0000
Date: Wed, 23 Apr 2025 19:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1591/1591] mm/.tmp_memblock.o: warning:
 objtool: missing symbol for section .text.unlikely
Message-ID: <202504231901.3Ew1u0FK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a92bdca2eb7009cae80d7e42f4e8573d27cb19be
commit: 775947c125d5bd6e00e0dcf9d12c57fd5d44d07f [1591/1591] asm-generic: fix -Wtype-limits compiler warnings
config: x86_64-buildonly-randconfig-003-20250423 (https://download.01.org/0day-ci/archive/20250423/202504231901.3Ew1u0FK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504231901.3Ew1u0FK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504231901.3Ew1u0FK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/.tmp_memblock.o: warning: objtool: missing symbol for section .text.unlikely
--
>> arch/x86/kernel/.tmp_e820.o: warning: objtool: missing symbol for section .text.unlikely
--
>> drivers/thermal/.tmp_x86_pkg_temp_thermal.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
