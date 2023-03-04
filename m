Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E01A20
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 02:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677897997; x=1709433997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l/A99rMM5WHL0wv+tSavfNrlLcDVEGZfVCVXimd15eM=;
  b=QRbrKdJLASYBGg43jqdrnWhLz9gNq9klTVBL8AeZQb2U6Bib4CfJ79TR
   CZEHxBjW5a41K3p4FlzQgOegJzoOqI7k+CkF9UoH8fKnES5UZ3sPsdiig
   hMH2yUVBjxaggOfA9+EsmLbiVBUDtqTUX1aCk6K9cBAOIslKrAmeNlJfh
   Dc1qOsdjtZK/JV0+wepV5SUxIIIil+Ex+IFS1s1p79CKa+o44G+6j9rjf
   kEbv3yPjONrgoQke0VFYooKKh3AmokvP5UyMrCXXNhHGn5nKhNUgJTzt3
   0b5F/qb1Y2fzVLrufDaHjSCMhESJDiDN8VVV/5sjxvG8wCCP5ujIdG1KK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="421484487"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="421484487"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 18:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="705850369"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="705850369"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Mar 2023 18:46:32 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYHup-0001oS-2O;
	Sat, 04 Mar 2023 02:46:31 +0000
Date: Sat, 4 Mar 2023 10:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-cxl@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, peterz@infradead.org, mingo@redhat.com,
	acme@kernel.org, mark.rutland@arm.com, will@kernel.org,
	dan.j.williams@intel.com, bwidawsk@kernel.org, ira.weiny@intel.com,
	vishal.l.verma@intel.com, alison.schofield@intel.com,
	linuxarm@huawei.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] cxl/pci: Find and register CXL PMU devices
Message-ID: <202303041001.G9OUGQ6l-lkp@intel.com>
References: <20230303175022.10806-3-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303175022.10806-3-Jonathan.Cameron@huawei.com>

Hi Jonathan,

I love your patch! Yet something to improve:

[auto build test ERROR on cxl/next]
[also build test ERROR on cxl/pending linus/master next-20230303]
[cannot apply to v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/cxl-Add-function-to-count-regblocks-of-a-given-type/20230304-015342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20230303175022.10806-3-Jonathan.Cameron%40huawei.com
patch subject: [PATCH 2/4] cxl/pci: Find and register CXL PMU devices
config: alpha-randconfig-r003-20230302 (https://download.01.org/0day-ci/archive/20230304/202303041001.G9OUGQ6l-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0790ed82bb7adf04c834e8c03008b92c1b23945e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Cameron/cxl-Add-function-to-count-regblocks-of-a-given-type/20230304-015342
        git checkout 0790ed82bb7adf04c834e8c03008b92c1b23945e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/cxl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041001.G9OUGQ6l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/regs.c:9:10: fatal error: cpmu.h: No such file or directory
       9 | #include <cpmu.h>
         |          ^~~~~~~~
   compilation terminated.
--
>> drivers/cxl/core/cpmu.c:8:10: fatal error: cpmu.h: No such file or directory
       8 | #include <cpmu.h>
         |          ^~~~~~~~
   compilation terminated.


vim +9 drivers/cxl/core/regs.c

   > 9	#include <cpmu.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
