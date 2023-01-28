Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5162F26
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 08:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674895051; x=1706431051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qyNA4niPdG/h93zquZAa4yOEfNEJjZjTIFf8xN03ODQ=;
  b=HDu4b35lh9tK8R1sSvDW9m6o6ZT+NzGyajOiEnT2ngGuZVcV5gNEmoa/
   ixeZosuSfeJW04smknoAm78mm6hxDvTZTKFl/hTzriqK2Nh1aiN5FefBN
   /KUblvIe3vdsdInqUf+pdVH+OIR3oRTlRranb3apv2LOtJxy6GoeTZ2k0
   seykmQMTeQsDypNRLuFNGHg3lmxdGGIi5SKE+8oZDr0HoHKJC6WrgvDas
   vTwg5ZlM3RJcU+QREnTgxfAba8xmJHPipkCL3kV/5TVLAj9qQNfA5tX/2
   brcg/VUx+ZeHDPuIfiXkeHteMhMIvGWtPQ7nlwuD8cC15txQzlaO/5e8m
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="315229716"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="315229716"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 00:37:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="663556633"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="663556633"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2023 00:37:29 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLgiB-0000Wb-0q;
	Sat, 28 Jan 2023 08:37:23 +0000
Date: Sat, 28 Jan 2023 16:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org
Subject: [cxl:for-6.3/cxl-ram-region 17/18] drivers/cxl/port.c:47: undefined
 reference to `cxl_add_to_region'
Message-ID: <202301281643.cInr5zLC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.3/cxl-ram-region
head:   a7cf664d7e997ac36b0f466af2e2be33464ab598
commit: 3c6c8594f9a2bcb4af19bc8de669ed43834b8d7f [17/18] cxl/region: Add region autodiscovery
config: ia64-randconfig-m041-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281643.cInr5zLC-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=3c6c8594f9a2bcb4af19bc8de669ed43834b8d7f
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.3/cxl-ram-region
        git checkout 3c6c8594f9a2bcb4af19bc8de669ed43834b8d7f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ia64-linux-ld: drivers/cxl/port.o: in function `discover_region':
>> drivers/cxl/port.c:47: undefined reference to `cxl_add_to_region'


vim +47 drivers/cxl/port.c

    32	
    33	static int discover_region(struct device *dev, void *data)
    34	{
    35		const unsigned long flags = CXL_DECODER_F_ENABLE | CXL_DECODER_F_AUTO;
    36		struct cxl_endpoint_decoder *cxled;
    37	
    38		if (!is_endpoint_decoder(dev))
    39			return 0;
    40	
    41		cxled = to_cxl_endpoint_decoder(dev);
    42		if ((cxled->cxld.flags & flags) != flags)
    43			return 0;
    44	
    45		cxl_add_to_region(cxled);
    46	
  > 47		return 0;
    48	}
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
