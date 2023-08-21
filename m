Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77E21173A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 21:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692652050; x=1724188050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=otTjFHqChK7PNuNL+kNud6Dkoko8odtgZGw741mdke0=;
  b=gjMMXjZbPrBKGw04BYH2WzYvk3yaR+9YWrNnYGZ+xkioniezY7bJGWv+
   fBr/kMOAPOGAj0Puomw3FwI/vQySQYMDnmTyhmuVGzjVP2FgFOXRGjYqL
   8Z9jpG+6rq7nDHHLDCL0S6MNkq1H5l34MY0OJwzPpUtvSuNYW+G/ZwKUJ
   nsVDkyn7mF4F6pZFVHD8rfeCPxZfnuHVyG73c2MdLcpQte6UI+WIJ7Zty
   aNQh+uDGKOb6A8O3J7x/+2mG3ymS1c7qxLLu1eu60W9KF6/uqzMttd7qb
   09XsvwqEGzjGfsUQn3p4X16/slznR1NbEsPHcNKQKhOGp2xrEjFVd8TEO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353275411"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="353275411"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 14:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="909846004"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="909846004"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Aug 2023 14:07:27 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYC7S-0000vW-2K;
	Mon, 21 Aug 2023 21:07:26 +0000
Date: Tue, 22 Aug 2023 05:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Huang Rui <ray.huang@amd.com>
Subject: [rui:upstream-fox-pvh 1/8] include/xen/pci.h:12:5: warning: no
 previous prototype for 'xen_reset_device'
Message-ID: <202308220416.mTEIEPGt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git upstream-fox-pvh
head:   d8772168691b2c723955f566a1211fba9afd19e5
commit: e6b6dcbe4274449d4468c8a1aa3e355d4e5dc5f5 [1/8] xen/pci: Add xen_reset_device function
config: x86_64-buildonly-randconfig-004-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220416.mTEIEPGt-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220416.mTEIEPGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220416.mTEIEPGt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/xen/xen-pciback/pci_stub.c:22:
>> include/xen/pci.h:12:5: warning: no previous prototype for 'xen_reset_device' [-Wmissing-prototypes]
      12 | int xen_reset_device(struct device *dev)
         |     ^~~~~~~~~~~~~~~~


vim +/xen_reset_device +12 include/xen/pci.h

     5	
     6	#if defined(CONFIG_XEN_DOM0)
     7	int xen_reset_device(struct device *dev);
     8	int xen_find_device_domain_owner(struct pci_dev *dev);
     9	int xen_register_device_domain_owner(struct pci_dev *dev, uint16_t domain);
    10	int xen_unregister_device_domain_owner(struct pci_dev *dev);
    11	#else
  > 12	int xen_reset_device(struct device *dev)
    13	{
    14		return -1;
    15	}
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
