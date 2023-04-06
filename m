Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28544A21
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 03:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680752383; x=1712288383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JzjAGfIRYIBu88mzw1lCIJv8NSrCAiuOs9jZOyT0nKs=;
  b=cbUcfFKxKOVGvk/dr6/JUni3bOWyCsyn96qq6nQYyU7gw4T46BJrV7pG
   Mvl9XgGinez6vs2QS8WRwmCqOKhqPa6WBlxXtJArG06Quv7WIQDt5LAAx
   7p2G2huJRhJ7tRME1XeAseCB2ve3rRTCVahNzAdipwKbv8/fgpU3T23b2
   yCLcMYOGd2B5vMehQO0nlnr8l5/2eyulbq5w9qsV9xI36GDQFpKnpaXxp
   PR1DPCuxcnd8M0f+ly8mM96mAjxpkapIJN+9cmvpBQhjktFYGns3+0+tQ
   eWFYGc2a3w3El0gOXzoVTkv8Bb51AI2YEaaisgvbRR8rMOgtzkq0JT11n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="323007011"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="323007011"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 20:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="664278188"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="664278188"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Apr 2023 20:39:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkGTH-000R1g-1M;
	Thu, 06 Apr 2023 03:39:35 +0000
Date: Thu, 6 Apr 2023 11:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 15107/29326]
 drivers/nvmem/core.c:347:5: warning: no previous prototype for function
 'nvmem_add_cells'
Message-ID: <202304061154.rY05TKsN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   c1102a2e31cd2371b5f9ed2b3b5a4f8ac735cd87
commit: e96a10625581a499e8a4218ef504f3f53918408b [15107/29326] UPSTREAM: nvmem: add support for cell info
config: x86_64-randconfig-r005-20230403 (https://download.01.org/0day-ci/archive/20230406/202304061154.rY05TKsN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout e96a10625581a499e8a4218ef504f3f53918408b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvmem/ lib/ sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061154.rY05TKsN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/core.c:347:5: warning: no previous prototype for function 'nvmem_add_cells' [-Wmissing-prototypes]
   int nvmem_add_cells(struct nvmem_device *nvmem,
       ^
   drivers/nvmem/core.c:347:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int nvmem_add_cells(struct nvmem_device *nvmem,
   ^
   static 
   1 warning generated.


vim +/nvmem_add_cells +347 drivers/nvmem/core.c

eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  337  
b3db17e4b864e4 Andrew Lunn         2018-05-11  338  /**
b3db17e4b864e4 Andrew Lunn         2018-05-11  339   * nvmem_add_cells() - Add cell information to an nvmem device
b3db17e4b864e4 Andrew Lunn         2018-05-11  340   *
b3db17e4b864e4 Andrew Lunn         2018-05-11  341   * @nvmem: nvmem device to add cells to.
b3db17e4b864e4 Andrew Lunn         2018-05-11  342   * @info: nvmem cell info to add to the device
b3db17e4b864e4 Andrew Lunn         2018-05-11  343   * @ncells: number of cells in info
b3db17e4b864e4 Andrew Lunn         2018-05-11  344   *
b3db17e4b864e4 Andrew Lunn         2018-05-11  345   * Return: 0 or negative error code on failure.
b3db17e4b864e4 Andrew Lunn         2018-05-11  346   */
b3db17e4b864e4 Andrew Lunn         2018-05-11 @347  int nvmem_add_cells(struct nvmem_device *nvmem,
b3db17e4b864e4 Andrew Lunn         2018-05-11  348  		    const struct nvmem_cell_info *info,
b3db17e4b864e4 Andrew Lunn         2018-05-11  349  		    int ncells)
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  350  {
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  351  	struct nvmem_cell **cells;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  352  	int i, rval;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  353  
b3db17e4b864e4 Andrew Lunn         2018-05-11  354  	cells = kcalloc(ncells, sizeof(*cells), GFP_KERNEL);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  355  	if (!cells)
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  356  		return -ENOMEM;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  357  
b3db17e4b864e4 Andrew Lunn         2018-05-11  358  	for (i = 0; i < ncells; i++) {
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  359  		cells[i] = kzalloc(sizeof(**cells), GFP_KERNEL);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  360  		if (!cells[i]) {
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  361  			rval = -ENOMEM;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  362  			goto err;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  363  		}
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  364  
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  365  		rval = nvmem_cell_info_to_nvmem_cell(nvmem, &info[i], cells[i]);
287980e49ffc0f Arnd Bergmann       2016-05-27  366  		if (rval) {
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  367  			kfree(cells[i]);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  368  			goto err;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  369  		}
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  370  
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  371  		nvmem_cell_add(cells[i]);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  372  	}
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  373  
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  374  	/* remove tmp array */
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  375  	kfree(cells);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  376  
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  377  	return 0;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  378  err:
dfdf141429f089 Rasmus Villemoes    2016-02-08  379  	while (i--)
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  380  		nvmem_cell_drop(cells[i]);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  381  
dfdf141429f089 Rasmus Villemoes    2016-02-08  382  	kfree(cells);
dfdf141429f089 Rasmus Villemoes    2016-02-08  383  
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  384  	return rval;
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  385  }
b3db17e4b864e4 Andrew Lunn         2018-05-11  386  EXPORT_SYMBOL_GPL(nvmem_add_cells);
eace75cfdcf7d9 Srinivas Kandagatla 2015-07-27  387  

:::::: The code at line 347 was first introduced by commit
:::::: b3db17e4b864e46ad150ebef69c0e0130a1c5fca drivers: nvmem: Export nvmem_add_cells()

:::::: TO: Andrew Lunn <andrew@lunn.ch>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
