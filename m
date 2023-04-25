Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998C963D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682435333; x=1713971333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ky7KJGI4aLZYjVllbPoqj14yZoSvetXm60Y3WBsa/yk=;
  b=Xr9znOC1BABjiFcgfNNyze75mpNhew0IWB2h2qaRi1jZ9hIQpHwPMARk
   nIQhdbKz3Z3fRtUguyxyFV8LCq5UvbmGt1mXp0DqXUBHYkA4YIV2yKMxI
   XU34paoCvI+oWBYrRr/t61226GZp8yjmG866KMNG8cOnU+aHMjW/Q1f5w
   EGnqK4MCSnR2Nk++YOa6OmMV+LXy+TyWsa7FpVZ8bOgP+CE0Cja1kyNeM
   IktdhJtrrYMchIGc/RRO+gQreHiY01UGVSbyFhmDE/m0Y3N1WHE8H/CUN
   lPXrMTLcERZH10OfqleWHWUv07VB1LW6q46C7iQR1+pADjcDNnpYnskZi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="348708194"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="348708194"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 08:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="817722995"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="817722995"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Apr 2023 08:03:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prKCl-000jTQ-2D;
	Tue, 25 Apr 2023 15:03:43 +0000
Date: Tue, 25 Apr 2023 23:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 3/4] Input: st1232 - add virtual touchscreen and buttons
 handling
Message-ID: <202304252259.331PTIli-lkp@intel.com>
References: <20230425115049.870003-4-javier.carrasco@wolfvision.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425115049.870003-4-javier.carrasco@wolfvision.net>

Hi Javier,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Carrasco/Input-ts-virtobj-Add-touchsreen-virtual-object-handling-to-the-core/20230425-195306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20230425115049.870003-4-javier.carrasco%40wolfvision.net
patch subject: [RFC v1 3/4] Input: st1232 - add virtual touchscreen and buttons handling
config: i386-randconfig-a011-20230424 (https://download.01.org/0day-ci/archive/20230425/202304252259.331PTIli-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2ba680aa42922270aa2c3c4747b0d17505cbca49
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Javier-Carrasco/Input-ts-virtobj-Add-touchsreen-virtual-object-handling-to-the-core/20230425-195306
        git checkout 2ba680aa42922270aa2c3c4747b0d17505cbca49
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/input/touchscreen/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304252259.331PTIli-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/input/touchscreen/st1232.c:25:
>> include/linux/input/ts-virtobj.h:17:27: warning: 'ts_virtobj_names' defined but not used [-Wunused-const-variable=]
      17 | static const char * const ts_virtobj_names[] = {
         |                           ^~~~~~~~~~~~~~~~


vim +/ts_virtobj_names +17 include/linux/input/ts-virtobj.h

6da665c20fe75e Javier Carrasco 2023-04-25  16  
6da665c20fe75e Javier Carrasco 2023-04-25 @17  static const char * const ts_virtobj_names[] = {
6da665c20fe75e Javier Carrasco 2023-04-25  18  	[TOUCHSCREEN] = "virtual-touchscreen",
6da665c20fe75e Javier Carrasco 2023-04-25  19  	[BUTTON] = "virtual-buttons",
6da665c20fe75e Javier Carrasco 2023-04-25  20  };
6da665c20fe75e Javier Carrasco 2023-04-25  21  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
