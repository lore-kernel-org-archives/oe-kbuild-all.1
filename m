Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515AD2EAE1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 23:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQjJYqsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698362031; x=1729898031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UNlsouLXuqPHGZhUwvcdOBn2pM81x5UAkLYQdBgNElc=;
  b=WQjJYqspy6OwRsem3xrAxRNew0MdNuTiwK+xV44KzqsLtyQmDuhpOHXx
   plcWnYrQJJYtQVoYQaMYH8ZIW8jHAXdZ6DKJGMR2P0XurtZTe/AxP3bEq
   8d7Kt9lAAaSgnJ6XIL7c+UX83+/4SG3pXCTpCOwOtbqm/jQLTq4wuXxEC
   hz6Vv0rXngt5IuOetmlj2eyuOEVmymSJRuZAp0SRon7WtcBYcZazkDFfu
   5WlirN1nAX7ExNYh9ifKjUwdmG6pi9Bg1nhCY7y7HisT9ylaEh99VnHF7
   6sjkUp1dW9UXTEeo2Qf73NLO8PTTqW9eOVRbGHlTX7dNikTJLVbGvJ4WG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="418783288"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="418783288"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 16:13:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="850070231"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="850070231"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Oct 2023 16:13:49 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw9Xv-000ADP-0T;
	Thu, 26 Oct 2023 23:13:47 +0000
Date: Fri, 27 Oct 2023 07:13:10 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v4-devel-v10 22/26]
 security/integrity/ima/ima_main.c:1156:12: warning: no previous prototype
 for 'dummy_init_ima_lsm'
Message-ID: <202310270736.GCuPmFaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v4-devel-v10
head:   b56de9fb8f4f26ea450fa3e533685d61089d559a
commit: f08ce9726b1afbfa835cf9599d772636f8dada1c [22/26] ima: Move to LSM infrastructure
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231027/202310270736.GCuPmFaZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270736.GCuPmFaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270736.GCuPmFaZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_main.c:1156:12: warning: no previous prototype for 'dummy_init_ima_lsm' [-Wmissing-prototypes]
    1156 | int __init dummy_init_ima_lsm(void)
         |            ^~~~~~~~~~~~~~~~~~


vim +/dummy_init_ima_lsm +1156 security/integrity/ima/ima_main.c

  1154	
  1155	/* Introduce a dummy function as 'ima' init function (it cannot be NULL). */
> 1156	int __init dummy_init_ima_lsm(void)
  1157	{
  1158		return 0;
  1159	}
  1160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
