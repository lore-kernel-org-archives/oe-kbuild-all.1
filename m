Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0DA146D6A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 18:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735151333; cv=none; b=upt9Ons3hK1k+az+x/DEc298M5JnjStCRQfO/uw344aUvKLDCC3VSX6FevWg15xMpnYB9QdZEAjjB9RfKnOjO9XcPB3G74gpfC+HuggkZ8DG46neUsdTBSMAqQ1+JgoNkw9a34bJRu+iouHuX2qarqzsXNASayH5SvA3HMGAgQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735151333; c=relaxed/simple;
	bh=0IHJX+8fJHzF5Tk1F42NYJr7qd0g0HGTz0yNitqXVm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gm39ZQV+X307MeskQaoMXOsVwQv7Y+kWSaSHrgQaOECBzQGJsDowZvEGvHK7FaB+0Tq23HMp/nCiVQsjP8i++TC4w3VZHGdZp+MZ5XSroXyqSvetnLSMf4N961/W8Y3lRTWpMfT6LcP7eJO0A/wAZsryyaqIac8QRSGThkbeEXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrYaWihc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrYaWihc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735151331; x=1766687331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0IHJX+8fJHzF5Tk1F42NYJr7qd0g0HGTz0yNitqXVm0=;
  b=JrYaWihcmszfJjYgdAee1ugHi82qU5VayajwlyqZF9xJP02YR+8s4o2u
   gcEcN91M7i/l2zk+2Al/evj9dlEbd32EsTBo0K5RhP8xZJ0AmLvt0A9tL
   PAGSfuScL1gKqIqX5+D2UwMjvPEYM095FlcYdz/lnSyjVlxdy38BhyJgY
   Tlib5KQIVhP1nKfDjYvphh2hYY4CMPtkaNG4VnUujR/NNmxNGrV04RtoU
   s642cMg6oPIENhEYVbuE0OJD3v9lBr+osDUmPNeTjk1f6ASa5Py/iSnnx
   uXnWToqsl0fB/3N4Ulz6boqnuSNHesw9Y+L3HXOavcyBedKDjaABUcuu+
   A==;
X-CSE-ConnectionGUID: ugvJAsn9SWK4oa/rFV4cNw==
X-CSE-MsgGUID: C2hMxYFZSMOlt8bidRMUDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35708178"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="35708178"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 10:28:51 -0800
X-CSE-ConnectionGUID: MfzvUjXMQaaYg+lqyDSC6Q==
X-CSE-MsgGUID: aSmkGGBZTqCQAZorzs10uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104391072"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Dec 2024 10:28:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQW7i-00024s-0A;
	Wed, 25 Dec 2024 18:28:46 +0000
Date: Thu, 26 Dec 2024 02:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2597/2597] kernel/sched/core.o: warning:
 objtool: sched_set_fifo()+0x4b: unreachable instruction
Message-ID: <202412260244.XgMhUxu4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f5a62ec85c94fa9a6db1aa3393876184382841fb
commit: 3e393ad0efe336af9da4abd7ce7b5b858e9b9b0c [2597/2597] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-randconfig-104-20241225 (https://download.01.org/0day-ci/archive/20241226/202412260244.XgMhUxu4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412260244.XgMhUxu4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260244.XgMhUxu4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.o: warning: objtool: sched_set_fifo()+0x4b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
