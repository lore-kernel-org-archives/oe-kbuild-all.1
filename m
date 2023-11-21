Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713F221A16
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 07:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLAJMXuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700551814; x=1732087814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LHry4xt4GQ8uZ5EGHooJb4B+WQkGa2GgJ7+5gdP2UaE=;
  b=OLAJMXuG7XhRXuA8lU/JNCfYoJyWFxV5WMcoScWBzbsLiHPHPOL+1mO4
   dNSKx1J0EAasV4PyIrEmvQ6lW8hLToGeDOf+9ymvM9hUryyB5uJ1zwutD
   IsWkSbFxIIBf25qaLjPDKsPjC0QMCCFJCXPrqov0FwPC1uA6ND1jplfJ+
   Pl1D3LE9KqmtA8XgMtMR4Z5R+H7MRi1aXUiKb2Xxscct4YW8cFEKeGdVa
   g0Fp0hCZHkBGCCVx22uE9GUJdcvd5VTYGnZs8tuY0NXM/uitusR9Sjjtg
   v0lYl9kviI+/9fxpRgg5jOfEdMY71yJejMiM/2zZHdFIhtwGIOTd7srfh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422883118"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="422883118"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 23:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="770164652"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="770164652"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Nov 2023 23:30:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5LD0-0007Vb-2F;
	Tue, 21 Nov 2023 07:30:10 +0000
Date: Tue, 21 Nov 2023 15:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v6-devel-v4 22/26]
 security/integrity/evm/evm_main.c:1061:12: warning: no previous prototype
 for 'init_evm_lsm'
Message-ID: <202311211509.ueK6MHkk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v6-devel-v4
head:   58605e8f9256d446ad8fa46474f4a402a68715a5
commit: ab43d28d22d09d87c91646df14890fa542f9dc3d [22/26] evm: Move to LSM infrastructure
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231121/202311211509.ueK6MHkk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211509.ueK6MHkk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211509.ueK6MHkk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/evm/evm_main.c:1061:12: warning: no previous prototype for 'init_evm_lsm' [-Wmissing-prototypes]
    1061 | int __init init_evm_lsm(void)
         |            ^~~~~~~~~~~~


vim +/init_evm_lsm +1061 security/integrity/evm/evm_main.c

  1054	
  1055	/*
  1056	 * Since with the LSM_ORDER_LAST there is no guarantee about the ordering
  1057	 * within the .lsm_info.init section, ensure that IMA hooks are before EVM
  1058	 * ones, by letting the 'integrity' LSM call init_evm_lsm() to initialize the
  1059	 * 'ima' and 'evm' LSMs in this sequence.
  1060	 */
> 1061	int __init init_evm_lsm(void)
  1062	{
  1063		security_add_hooks(evm_hooks, ARRAY_SIZE(evm_hooks), &evm_lsmid);
  1064		return 0;
  1065	}
  1066	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
