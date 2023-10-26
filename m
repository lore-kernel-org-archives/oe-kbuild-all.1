Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AB711CB3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 18:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRghC1T3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698344858; x=1729880858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QfX2Tei1E7Lbf4E6UBVv4USQi6woUXorg3PKK+4jrVU=;
  b=YRghC1T3a0gwLdN/sw44kY0RL4MbhVukBzexT8SOV0k/1czNY7Dalxv/
   V5BYq7VKa+o6bkkBsiBbGOsDuLivm0xjpRLTMxvzASgL7fLSxKmxxGM3O
   BpFEAiLs/Mn6VsZLRQbsTsNxkRHJtz+BhKIeniit2T2JBfmfgB06QaFma
   9EjDvZYUOOC0HSFtyfznrHsOdig+yLuP+R4weIs3Q5ED4GKwJ2QVlLS8Q
   b5vgBnVMlx4NxIr6hWDzMc0X8vd0OeOs21g982q1O7SqNu7NAOF28PXEz
   LkMrvEN+s+LeNWo/FGimxOnQhZSyt9nhrbD2YkdPI2EJamjqmSFruFQhA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="372667604"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="372667604"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 11:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="7374637"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2023 11:27:25 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw54v-000A2F-1k;
	Thu, 26 Oct 2023 18:27:33 +0000
Date: Fri, 27 Oct 2023 02:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Simon Glass <sjg@chromium.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [robh:for-next 14/19] dtbs_check: ERROR: dtschema minimum version is
 v2023.9
Message-ID: <202310270254.99Gj7l9R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   a31226cdc877133081b131c2e7c79fc94890b1c7
commit: b32dcf23a03eb170dfaa482fc28d4b01d39eda80 [14/19] dt-bindings: Drop kernel copy of common reserved-memory bindings
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231027/202310270254.99Gj7l9R-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310270254.99Gj7l9R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270254.99Gj7l9R-lkp@intel.com/

All errors (new ones prefixed by >>):

   sort: -:2: disorder: 2023.8.dev2+gd5e5147
>> ERROR: dtschema minimum version is v2023.9

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
