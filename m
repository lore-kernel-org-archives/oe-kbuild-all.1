Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8607417BA6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 01:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734051991; cv=none; b=shgCqJIfy4meLLvYFvQ6DO4lhxm4PFnbnDkfrERzcn/GSPi36zBqKYFNhAlJKdxhIdzIyfcmKZKNiU2XvbUh3M+1QhJ5JhVUEPOPkWRNrgw4FQCu/wSsj3O6SmWguHe+C1c7mMCrNX5miI8C72qeoB+c3xik7bTAFdp+i5BRLDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734051991; c=relaxed/simple;
	bh=kEhT3cHrRqZum8/GdbPwwMJVo6O9ERxDn9Z+cBEJ+To=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ggrB8q5U2WuWbsbnqULTmZXqrD9KL8L7bBDKQlba7CotTvv8v2ovKlpugiNRH8g/nZYAIHVCwflKrqW6V6s7rXrW5dyJTYoyEqiFFMNb6Vmd03xxQDOB2wRiVOGa/GLaaL0YCqrULTTWX2MS5AAlE9k0qJ427kcKdodvE72n0ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1njpcrS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1njpcrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734051990; x=1765587990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kEhT3cHrRqZum8/GdbPwwMJVo6O9ERxDn9Z+cBEJ+To=;
  b=M1njpcrSt5TMDPLKB9NVe4pM5LEia5HyGTXJvgTiRAzYzJxzCJw2LsgU
   oubTFf4+pJDvqlhxv9ThkF0+NxQPWn2jfyZFtofhyMcERt/m5apyr737X
   qTBWmvQMN0g+Qx8Dkd9z8E5GS0Z4qBmpJQaUTz+K93kRYv7vpUVhmZaUq
   nS3Ln8wrDOpFLPC75VThw5bQv3GahGkKiY4JZSHosIa6/e8hJ4yVIY3e4
   R2O43oL2QHn4JQf/GJsHqVLF4/3EwhaEFXg2Q/nG8RVK3/sNl13hveMfo
   IEkmGPAGHSDEa5uFFwQLQwr6PeMWuXSiGrSLri+kGjuKhRPwSS4uRC8Xb
   Q==;
X-CSE-ConnectionGUID: y2w1iqYzR1a3Kgj5KAZ09A==
X-CSE-MsgGUID: xeR92o4GTUex4igN8E6few==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="51913789"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="51913789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 17:06:29 -0800
X-CSE-ConnectionGUID: RlKiOcAfSRSlU5huFI6USg==
X-CSE-MsgGUID: m1KlcDwXQA2una4pb82TWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96245541"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Dec 2024 17:06:28 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLu8P-000BZd-22;
	Fri, 13 Dec 2024 01:06:25 +0000
Date: Fri, 13 Dec 2024 09:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 11151/30000]
 drivers/nvmem/core.c:347:5: warning: no previous prototype for function
 'nvmem_add_cells'
Message-ID: <202412130858.2YMWSKhd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: e96a10625581a499e8a4218ef504f3f53918408b [11151/30000] UPSTREAM: nvmem: add support for cell info
config: x86_64-buildonly-randconfig-004-20241212 (https://download.01.org/0day-ci/archive/20241213/202412130858.2YMWSKhd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130858.2YMWSKhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130858.2YMWSKhd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/core.c:347:5: warning: no previous prototype for function 'nvmem_add_cells' [-Wmissing-prototypes]
     347 | int nvmem_add_cells(struct nvmem_device *nvmem,
         |     ^
   drivers/nvmem/core.c:347:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     347 | int nvmem_add_cells(struct nvmem_device *nvmem,
         | ^
         | static 
   1 warning generated.


vim +/nvmem_add_cells +347 drivers/nvmem/core.c

eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  337  
b3db17e4b864e46 Andrew Lunn         2018-05-11  338  /**
b3db17e4b864e46 Andrew Lunn         2018-05-11  339   * nvmem_add_cells() - Add cell information to an nvmem device
b3db17e4b864e46 Andrew Lunn         2018-05-11  340   *
b3db17e4b864e46 Andrew Lunn         2018-05-11  341   * @nvmem: nvmem device to add cells to.
b3db17e4b864e46 Andrew Lunn         2018-05-11  342   * @info: nvmem cell info to add to the device
b3db17e4b864e46 Andrew Lunn         2018-05-11  343   * @ncells: number of cells in info
b3db17e4b864e46 Andrew Lunn         2018-05-11  344   *
b3db17e4b864e46 Andrew Lunn         2018-05-11  345   * Return: 0 or negative error code on failure.
b3db17e4b864e46 Andrew Lunn         2018-05-11  346   */
b3db17e4b864e46 Andrew Lunn         2018-05-11 @347  int nvmem_add_cells(struct nvmem_device *nvmem,
b3db17e4b864e46 Andrew Lunn         2018-05-11  348  		    const struct nvmem_cell_info *info,
b3db17e4b864e46 Andrew Lunn         2018-05-11  349  		    int ncells)
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  350  {
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  351  	struct nvmem_cell **cells;
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  352  	int i, rval;
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  353  
b3db17e4b864e46 Andrew Lunn         2018-05-11  354  	cells = kcalloc(ncells, sizeof(*cells), GFP_KERNEL);
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  355  	if (!cells)
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  356  		return -ENOMEM;
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  357  
b3db17e4b864e46 Andrew Lunn         2018-05-11  358  	for (i = 0; i < ncells; i++) {
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  359  		cells[i] = kzalloc(sizeof(**cells), GFP_KERNEL);
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  360  		if (!cells[i]) {
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  361  			rval = -ENOMEM;
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  362  			goto err;
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  363  		}
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  364  
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  365  		rval = nvmem_cell_info_to_nvmem_cell(nvmem, &info[i], cells[i]);
287980e49ffc0f6 Arnd Bergmann       2016-05-27  366  		if (rval) {
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  367  			kfree(cells[i]);
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  368  			goto err;
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  369  		}
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  370  
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  371  		nvmem_cell_add(cells[i]);
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  372  	}
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  373  
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  374  	/* remove tmp array */
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  375  	kfree(cells);
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  376  
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  377  	return 0;
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  378  err:
dfdf141429f0895 Rasmus Villemoes    2016-02-08  379  	while (i--)
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  380  		nvmem_cell_drop(cells[i]);
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  381  
dfdf141429f0895 Rasmus Villemoes    2016-02-08  382  	kfree(cells);
dfdf141429f0895 Rasmus Villemoes    2016-02-08  383  
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  384  	return rval;
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  385  }
b3db17e4b864e46 Andrew Lunn         2018-05-11  386  EXPORT_SYMBOL_GPL(nvmem_add_cells);
eace75cfdcf7d99 Srinivas Kandagatla 2015-07-27  387  

:::::: The code at line 347 was first introduced by commit
:::::: b3db17e4b864e46ad150ebef69c0e0130a1c5fca drivers: nvmem: Export nvmem_add_cells()

:::::: TO: Andrew Lunn <andrew@lunn.ch>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
