Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532AE29B0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 21:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680989535; x=1712525535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QuwdFX6klNsm28S7LPUH4HmWDivVgfCEAn74FcAI2vE=;
  b=IGFMQXVDHMVFmSbdEmwvuki8QEkSI/Sc8LCUOk7dsTMUes+A6+orfSLa
   9i4SuEnH+bctdHjTXcaPqds5lJVQn9M8+IgvOo5+WoDSemtu5KvHPTH5o
   ebese9E3fvArznJHf7cyKEVOWTkN8lXUZwBmckgBA9HFqTGYQfEvlDvJ8
   8FH0RmmgXuroYcGMtO+ZlImKmByHhUUyIJzN9RFbWCOejdd/kTtrMqDhm
   IfVHI//CwWx5Nuy7RqhhbIOglFGuiRGt4WewrzauRruJ0GTXqpnvEh4Iy
   IFjSr2dsV6SQVwy33SzU20bldPxXbDGeQoSplXQHkk7+XhrGoX+a+c9Qy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="429453022"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="429453022"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 14:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="638043898"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="638043898"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Apr 2023 14:32:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plGAO-000U7f-2b;
	Sat, 08 Apr 2023 21:32:12 +0000
Date: Sun, 9 Apr 2023 05:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [dcui-tdx:decui/michaelv7dda/tdx/v4 7/9] arch/x86/hyperv/ivm.c:427:
 undefined reference to `__tdx_hypercall_ret'
Message-ID: <202304090508.tfYofNCk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/michaelv7dda/tdx/v4
head:   2b60813362c753115b00958ef9f772d1fa233909
commit: ef13d358744383e7ca0dae7edc7c7890ca0da872 [7/9] x86/hyperv: Support hypercalls for TDX guests
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20230409/202304090508.tfYofNCk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/dcui/tdx/commit/ef13d358744383e7ca0dae7edc7c7890ca0da872
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/michaelv7dda/tdx/v4
        git checkout ef13d358744383e7ca0dae7edc7c7890ca0da872
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304090508.tfYofNCk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/hyperv/ivm.o: in function `hv_tdx_hypercall':
>> arch/x86/hyperv/ivm.c:427: undefined reference to `__tdx_hypercall_ret'


vim +427 arch/x86/hyperv/ivm.c

   418	
   419	u64 hv_tdx_hypercall(u64 control, u64 param1, u64 param2)
   420	{
   421		struct tdx_hypercall_args args = { };
   422	
   423		args.r10 = control;
   424		args.rdx = param1;
   425		args.r8  = param2;
   426	
 > 427		(void)__tdx_hypercall_ret(&args);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
