Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66A480A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 06:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWn2lSii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705301094; x=1736837094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1bnk9xkizFHHKu4BpcNjt1lKLIbDtMg02Ha28E+g0NU=;
  b=VWn2lSii9HPpvSeSroGqVvoArJeSjE/r02cucZ5C31k4cINPJvnm1dMg
   LUUA8Y6vE/ZarCKTq5l7KYel7NQjos4R0GHouTfEVfjDYukYU3R0Uks3v
   ClwZ33+5LlGehYkQ3suLDg2WU33MNUisgzc9duMfEAouULudyq+C6CKrU
   LNrxeyNpCWosUuBKorBoVOeqZYnqONVdB8aO3/xkWT8ALDykUhlC1DWzp
   r/BV1+Ie7OEIKEGJPj2Q5P67mC+Q6REn/5nEItiHnug7eDPAYwFRzCghL
   R3gQh3Fn4L01wkLBh3n1DDLn4ODumAiXHv8UwEWiB/ZxLVtWotI5zv4FN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="465927485"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="465927485"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 22:44:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="1114849532"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="1114849532"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jan 2024 22:44:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPGgE-000CFk-0T;
	Mon, 15 Jan 2024 06:43:07 +0000
Date: Mon, 15 Jan 2024 14:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28886/30000] arch/arm64/kernel/fpsimd.c:158:12:
 warning: 'get_sve_default_vl' defined but not used
Message-ID: <202401151428.ChiVzdKB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1b1f50a7b636e0394b4347e141c6176980b837d2
commit: bf04fdf1fcc0040e6c81b413cdae84c0eb9212b9 [28886/30000] arm64/sve: Track vector lengths for tasks in an array
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240115/202401151428.ChiVzdKB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401151428.ChiVzdKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401151428.ChiVzdKB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/fpsimd.c:158:12: warning: 'get_sve_default_vl' defined but not used [-Wunused-function]
     158 | static int get_sve_default_vl(void)
         |            ^~~~~~~~~~~~~~~~~~


vim +/get_sve_default_vl +158 arch/arm64/kernel/fpsimd.c

1e570f512cbdc5 Dave Martin 2020-06-10  157  
1e570f512cbdc5 Dave Martin 2020-06-10 @158  static int get_sve_default_vl(void)
1e570f512cbdc5 Dave Martin 2020-06-10  159  {
68da302c8ae303 Mark Brown  2023-11-28  160  	return get_default_vl(ARM64_VEC_SVE);
1e570f512cbdc5 Dave Martin 2020-06-10  161  }
79ab047c75d6a9 Dave Martin 2017-10-31  162  

:::::: The code at line 158 was first introduced by commit
:::::: 1e570f512cbdc5e9e401ba640d9827985c1bea1e arm64/sve: Eliminate data races on sve_default_vl

:::::: TO: Dave Martin <Dave.Martin@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
