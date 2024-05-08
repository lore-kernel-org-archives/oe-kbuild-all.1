Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED1A3FE3F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715163024; cv=none; b=SrOZBqtfRY9HbkGw8qw0xBopYBi6vTce6EcN/W9TWIz2Heewdd7WRfaEMEyLwctkH19w287j2F7FvyI07t0smVGxzHA8Hg0TX0X2qbq/ZXtxuTXT9FRVl9ITvx/nWvqvrVstjZk0Mxi3Mixa7TNsnybihrWdIGihpN3avFbXrtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715163024; c=relaxed/simple;
	bh=n3VjK2FviSh1EIVnZoXWbVrG1XIr6UYrwOLQ3UB4Re0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cuEmoOZCZLbhpgVM6/fYh9D1HA9HsgAxPf9FPT9f22f2oj+DXeHB0BA4zB1vNlwv3VfyheyXZCtdGd27zNbW3URubSjNpEL0oF4rKpfa/9imfTIDInnPF8/i7c1S3lxOqVbfJ7pqk45fbKsv5gZHGBhfXJ1MES1mR88oqFh/VrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4RaKOL4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4RaKOL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715163023; x=1746699023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n3VjK2FviSh1EIVnZoXWbVrG1XIr6UYrwOLQ3UB4Re0=;
  b=F4RaKOL4di2zuONsl5qiR37CpJOOa17Bnzp056T8FvFvUqu4TJEE1h6w
   s8lAdP/5MkyiXaEeYlEFHYN8ULnTJfyvdvyE+lHwUWMbXUTQiFeDWlhC9
   B93QOlrsb2+VlTojxayGw5gCgqR9iS2osmZ70h0wpYZloGNOupfHH/UYV
   YaEkTw4/5o4t1PbiM+S5TI4F96ARRqIkdV2ajkMBly2QTDyjplxaOWRQQ
   Z5sUzA9jikatvE6m7oVX1qTPMdtezfHe0K5S3wsUT71+DGDhmfi+jOA6v
   3YG6RXSdBqR0xa8K6FD1AfYdO5+PKIMuVdjWy/TJEE70v+YoNTzlUCvbW
   Q==;
X-CSE-ConnectionGUID: 6ebJDrKnRL2ygSxE2T2HTA==
X-CSE-MsgGUID: F/ys6ahZQta1UekUUhWSbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11167655"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="11167655"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 03:10:23 -0700
X-CSE-ConnectionGUID: K0iuIDoeTq2f3ZPiU+P5bg==
X-CSE-MsgGUID: OeLkXCM7TQuEPmx/Wbcd5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="28897464"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2024 03:10:20 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4eFe-0003Gc-1g;
	Wed, 08 May 2024 10:10:18 +0000
Date: Wed, 8 May 2024 18:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 8557/22306]
 drivers/dma/qcom/.tmp_hidma_mgmt.o: warning: objtool: missing symbol for
 section .text.unlikely
Message-ID: <202405081832.WRSU6yPp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   76f29355ee875b8515aded65ea6001681d4afc0c
commit: 775947c125d5bd6e00e0dcf9d12c57fd5d44d07f [8557/22306] asm-generic: fix -Wtype-limits compiler warnings
config: x86_64-buildonly-randconfig-005-20240508 (https://download.01.org/0day-ci/archive/20240508/202405081832.WRSU6yPp-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081832.WRSU6yPp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081832.WRSU6yPp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/qcom/.tmp_hidma_mgmt.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
