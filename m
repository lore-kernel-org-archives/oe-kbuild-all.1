Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FCC5FEE3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 23:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbXUmKtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701385880; x=1732921880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/zDZebRP6kR5XTNYVFXpj/IyiWSswjE1F2gXupX/vpg=;
  b=JbXUmKtTF3fGlru18PAdF5bZXzK4Me32TX7+6GANpFWrmWdN7wwUQb3K
   nN11qCCzYaPt4o2HDleRzk8aCUFwaABVacUEJTia1wLKXWJwyO91naSaz
   Fdfucj/mSsOUfFmItkNLl3EX6lu12+AKoJ8m4qhApGH7UQtG7NH2yBQS/
   wvcuHvk4/nMEZHcJ/JJcdlKbonf+H6O4QR+IIFCCgGZH1o5f0524Ewwh9
   7vAeXvBqVGWhITZ/JgmQhRlDwzoudltyv9xSFQeWVCTJP/eF8w1mWF81j
   nCgpbJPWOQD7P/bhR2lZlbSN6OykL1kfVP1IHsZS8AUPJrROQcdTh+McB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="392274283"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="392274283"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 15:11:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942878253"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="942878253"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 15:11:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8qBa-0002mk-1L;
	Thu, 30 Nov 2023 23:11:14 +0000
Date: Fri, 1 Dec 2023 07:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vincent-guittot:scmi/ffa-transport 1/2] ffa.c:undefined reference
 to `tee_shm_get_va'
Message-ID: <202312010756.zpLgaNem-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git scmi/ffa-transport
head:   58f815a694fe99b6067c8e74a23f7ef193a7f76e
commit: 4e6e5543e62399d3e18c26257137593114fb63cc [1/2] scmi/ffa: add a new scmi transport layer based on ffa
config: arm64-randconfig-001-20231130 (https://download.01.org/0day-ci/archive/20231201/202312010756.zpLgaNem-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312010756.zpLgaNem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312010756.zpLgaNem-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/firmware/arm_scmi/ffa.o: in function `ffa_shm_alloc_kernel_buf':
>> ffa.c:(.text+0x974): undefined reference to `tee_shm_get_va'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
