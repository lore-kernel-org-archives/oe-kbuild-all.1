Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBE8358A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 07:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQHEp8QA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700553550; x=1732089550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQbQLSc3Y+6NpPAq4ss4b4atTe+fTpIcfp1urGdPNGc=;
  b=hQHEp8QAhTiFuFnOKvbwE6an6elHRu90+SKPJckaVnQU9pQ+DnMN8MSL
   wloFWIw9qaGM5GjxSNr5+MbinfofS1Kh7E04lYyb9nXhScH5uGqlof9we
   nv/AqQv+X6faYefVknCLM94NP6ORYiOwipvUUr52WCEJFmYTeu1paTMvN
   dzSwIDiAkdLKV0rIV/NHh3zIPDlaCXvNf0b0juQ1wQfGZ7BRQHusqlMqr
   Sf4vzkHJqXaocz2bOT4Z4N1oWAmOr/yj9BlG9o07JnMEZA/SS+zNu++HX
   TrBWBqwamWbX8Pb1Fy9As/UHY64CJKZdjZcSHSiiw+nuWjIVOhuRjtuIo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="477992215"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="477992215"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 23:59:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="890174888"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="890174888"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Nov 2023 23:59:08 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Ler-0007X4-0I;
	Tue, 21 Nov 2023 07:59:03 +0000
Date: Tue, 21 Nov 2023 15:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v6-devel-v4 22/26]
 security/integrity/evm/evm_main.c:1061:12: sparse: sparse: symbol
 'init_evm_lsm' was not declared. Should it be static?
Message-ID: <202311211507.Jm5KCvvz-lkp@intel.com>
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
config: i386-randconfig-062-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211507.Jm5KCvvz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211507.Jm5KCvvz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211507.Jm5KCvvz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/integrity/evm/evm_main.c:1061:12: sparse: sparse: symbol 'init_evm_lsm' was not declared. Should it be static?

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
