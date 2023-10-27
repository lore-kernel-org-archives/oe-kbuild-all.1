Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1295160
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 00:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEkbN2WN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698365211; x=1729901211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oysOhTsBLugkwgRhg9ng4gXDoixiOarCP7yrjdDlsLE=;
  b=DEkbN2WNRyIGoXIm5V1ZGqpJTrO0WJCDqarRvz+BTuxgsv/YZefo53Id
   OIrcmva1bfDXCk27OdDOAI4ahV1QJMQdxl+SLDYxUAf+LBZsOW74GFiXf
   roWc4aTKVjQi0RGD4PUz4JB4mEfSD9cIlkx7JMriqNMzitsdi526nmUX9
   M5OufgLOaoNsFX9gaLhMB+ET+HfDPuXG74Xo/YSHc1tIs5izskaVEJc6k
   D9bxnWK/zyJYR5vap/LUmm6Olk3xWFVKPCliTAA+l3Z4e2d20zToWQGqG
   GHN1t8q8qPJCdlesFQCv55PSuGvzYmSKqzDlKtqlPxh/bdbJIfKpkCj58
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="378046089"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="378046089"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 17:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="709256830"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="709256830"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Oct 2023 17:06:50 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwANE-000AF1-0k;
	Fri, 27 Oct 2023 00:06:48 +0000
Date: Fri, 27 Oct 2023 08:05:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 2/3] firmware/efi: Process CXL Component Events
Message-ID: <202310270728.UjFWVMun-lkp@intel.com>
References: <20230601-cxl-cper-v2-2-314d9c36ab02@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601-cxl-cper-v2-2-314d9c36ab02@intel.com>

Hi Ira,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 1c8b86a3799f7e5be903c3f49fcdaee29fd385b5]

url:    https://github.com/intel-lab-lkp/linux/commits/Ira-Weiny/cxl-trace-Remove-uuid-from-event-trace-known-events/20231027-022447
base:   1c8b86a3799f7e5be903c3f49fcdaee29fd385b5
patch link:    https://lore.kernel.org/r/20230601-cxl-cper-v2-2-314d9c36ab02%40intel.com
patch subject: [PATCH RFC v2 2/3] firmware/efi: Process CXL Component Events
config: x86_64-buildonly-randconfig-001-20231027 (https://download.01.org/0day-ci/archive/20231027/202310270728.UjFWVMun-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270728.UjFWVMun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270728.UjFWVMun-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/cper_cxl.c:218:5: error: redefinition of 'register_cxl_cper_notifier'
     218 | int register_cxl_cper_notifier(struct notifier_block *nb)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/efi/cper_cxl.h:13,
                    from drivers/firmware/efi/cper_cxl.c:11:
   include/linux/efi.h:1409:19: note: previous definition of 'register_cxl_cper_notifier' with type 'int(struct notifier_block *)'
    1409 | static inline int register_cxl_cper_notifier(struct notifier_block *nb)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/efi/cper_cxl.c:224:6: error: redefinition of 'unregister_cxl_cper_notifier'
     224 | void unregister_cxl_cper_notifier(struct notifier_block *nb)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/efi.h:1414:20: note: previous definition of 'unregister_cxl_cper_notifier' with type 'void(struct notifier_block *)'
    1414 | static inline void unregister_cxl_cper_notifier(struct notifier_block *nb) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/register_cxl_cper_notifier +218 drivers/firmware/efi/cper_cxl.c

   217	
 > 218	int register_cxl_cper_notifier(struct notifier_block *nb)
   219	{
   220		return blocking_notifier_chain_register(&cxl_cper_chain_head, nb);
   221	}
   222	EXPORT_SYMBOL(register_cxl_cper_notifier);
   223	
 > 224	void unregister_cxl_cper_notifier(struct notifier_block *nb)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
