Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045A1182C8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 21:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692221817; x=1723757817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tQYGWTZaebxGvxOLzPYrKfEIDUqh1i9xQVmol9Tt1KA=;
  b=P7/aPx7AI74FcNuGejXNMAlCJ+W+LJt9Jrj/XHjyyKp050idBtWSVr2u
   +mHeZWudgcb2npT+e3wEx1CBewwcALNiYt5WNxVz3JuaTAM4NuIGBKF2Z
   x/nOLLORcdaP/2InuSC+3kQtPnm55Q4WD1SCp6yhsXxBJ9Tg73fC8+EjV
   6s0XCYhAh3vk+9d7jK5a69S5i60RUrXT9urYMrwGZvYvHkv5hZbB+FfzA
   MLR6i+gPy+VJF+yp/l5b22MMKaIuUtX+F+QNZaFdAx3uGZfX1emIt/TOW
   ZOLxZz+tdoH/8OIviPf1JesTeYMz6/HS/fT51wzSwnooTzyse7lVAZKMS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362794204"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="362794204"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 14:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980868446"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="980868446"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Aug 2023 14:36:55 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWOCE-0000aX-3C;
	Wed, 16 Aug 2023 21:36:54 +0000
Date: Thu, 17 Aug 2023 05:36:32 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 7330/10518] htmldocs:
 ./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1: warning: 'product_name' not
 found
Message-ID: <202308170544.f6zj62AL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef66bf8aeb91fd331cf8f5dca8f9d7bca9ab2849
commit: 7957ec80ef97e983bb87782757c9dd74c34acc27 [7330/10518] drm/amdgpu: Add FRU sysfs nodes only if needed
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170544.f6zj62AL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170544.f6zj62AL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1: warning: 'product_name' not found
>> ./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1: warning: 'serial_number' not found

vim +/product_name +1 ./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

d38ceaf99ed015 Alex Deucher          2015-04-20  @1  /*
d38ceaf99ed015 Alex Deucher          2015-04-20   2   * Copyright 2008 Advanced Micro Devices, Inc.
d38ceaf99ed015 Alex Deucher          2015-04-20   3   * Copyright 2008 Red Hat Inc.
d38ceaf99ed015 Alex Deucher          2015-04-20   4   * Copyright 2009 Jerome Glisse.
d38ceaf99ed015 Alex Deucher          2015-04-20   5   *
d38ceaf99ed015 Alex Deucher          2015-04-20   6   * Permission is hereby granted, free of charge, to any person obtaining a
d38ceaf99ed015 Alex Deucher          2015-04-20   7   * copy of this software and associated documentation files (the "Software"),
d38ceaf99ed015 Alex Deucher          2015-04-20   8   * to deal in the Software without restriction, including without limitation
d38ceaf99ed015 Alex Deucher          2015-04-20   9   * the rights to use, copy, modify, merge, publish, distribute, sublicense,
d38ceaf99ed015 Alex Deucher          2015-04-20  10   * and/or sell copies of the Software, and to permit persons to whom the
d38ceaf99ed015 Alex Deucher          2015-04-20  11   * Software is furnished to do so, subject to the following conditions:
d38ceaf99ed015 Alex Deucher          2015-04-20  12   *
d38ceaf99ed015 Alex Deucher          2015-04-20  13   * The above copyright notice and this permission notice shall be included in
d38ceaf99ed015 Alex Deucher          2015-04-20  14   * all copies or substantial portions of the Software.
d38ceaf99ed015 Alex Deucher          2015-04-20  15   *
d38ceaf99ed015 Alex Deucher          2015-04-20  16   * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
d38ceaf99ed015 Alex Deucher          2015-04-20  17   * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
d38ceaf99ed015 Alex Deucher          2015-04-20  18   * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
d38ceaf99ed015 Alex Deucher          2015-04-20  19   * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
d38ceaf99ed015 Alex Deucher          2015-04-20  20   * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
d38ceaf99ed015 Alex Deucher          2015-04-20  21   * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
d38ceaf99ed015 Alex Deucher          2015-04-20  22   * OTHER DEALINGS IN THE SOFTWARE.
d38ceaf99ed015 Alex Deucher          2015-04-20  23   *
d38ceaf99ed015 Alex Deucher          2015-04-20  24   * Authors: Dave Airlie
d38ceaf99ed015 Alex Deucher          2015-04-20  25   *          Alex Deucher
d38ceaf99ed015 Alex Deucher          2015-04-20  26   *          Jerome Glisse
d38ceaf99ed015 Alex Deucher          2015-04-20  27   */
b1ddf548472729 Rex Zhu               2018-06-04  28  #include <linux/power_supply.h>
0875dc9e80eb3b Chunming Zhou         2016-06-12  29  #include <linux/kthread.h>
fdf2f6c56e5e28 Sam Ravnborg          2019-06-10  30  #include <linux/module.h>
d38ceaf99ed015 Alex Deucher          2015-04-20  31  #include <linux/console.h>
d38ceaf99ed015 Alex Deucher          2015-04-20  32  #include <linux/slab.h>
4a74c38cd67b3e Philip Yang           2021-12-06  33  #include <linux/iommu.h>
901e2be20dc550 Alex Deucher          2022-01-24  34  #include <linux/pci.h>
3d8785f6c04a95 Somalapuram Amaranath 2022-06-02  35  #include <linux/devcoredump.h>
3d8785f6c04a95 Somalapuram Amaranath 2022-06-02  36  #include <generated/utsrelease.h>
08a2fd23c6c21e Ramesh Errabolu       2022-05-26  37  #include <linux/pci-p2pdma.h>
d37a3929ca0363 Orlando Chamberlain   2023-03-03  38  #include <linux/apple-gmux.h>
fdf2f6c56e5e28 Sam Ravnborg          2019-06-10  39  

:::::: The code at line 1 was first introduced by commit
:::::: d38ceaf99ed015f2a0b9af3499791bd3a3daae21 drm/amdgpu: add core driver (v4)

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
