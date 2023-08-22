Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D2A2B544
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 17:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692726231; x=1724262231;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wJtLwBBVNTYvFRL2hNbECv9mDay3Kw7ksqvfKpneZMI=;
  b=HJHamnth3P3ePyl/7aQX7bh651VTkgiI+PWkS3M3F6As2t84t7QffA4Y
   XadpszvvA4pG6KSrB6hKoHREsC6bZxrdKSuhU4G3lBzXmjKGLMokeqQyD
   PKw9oOmEsjq8dntZcAhGlWu0CACVsRjdMtQtoL5TI3r5WypywPgTAwXfJ
   4D4JOJvFqaBYRTM0/vO0syHyw+w7C/RWDta3BLyYDfnzteZkCKvidm8gF
   k/LV8h89QLLC+UhQZopeirxBMBaRI7hWinz4FYr+CmzuFB7IjrhAYrmLe
   rZAQ5pthIZKDH3sZWTNEhricunrvgTM1OGQIJPiqRPZVMB1jzObE0J9D9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376687931"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="376687931"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 10:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="860014073"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="860014073"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Aug 2023 10:43:46 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYVPt-0000No-1j;
	Tue, 22 Aug 2023 17:43:45 +0000
Date: Wed, 23 Aug 2023 01:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: Valentine Sinitsyn <valesini@yandex-team.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Vetter <daniel.vetter@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] PCI: Implement custom llseek for sysfs resource
 entries
Message-ID: <202308230126.O8xXYkdt-lkp@intel.com>
References: <20230822115455.310222-2-valesini@yandex-team.ru>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822115455.310222-2-valesini@yandex-team.ru>

Hi Valentine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f7757129e3dea336c407551c98f50057c22bb266]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentine-Sinitsyn/PCI-Implement-custom-llseek-for-sysfs-resource-entries/20230822-205513
base:   f7757129e3dea336c407551c98f50057c22bb266
patch link:    https://lore.kernel.org/r/20230822115455.310222-2-valesini%40yandex-team.ru
patch subject: [PATCH v4 2/2] PCI: Implement custom llseek for sysfs resource entries
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20230823/202308230126.O8xXYkdt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230126.O8xXYkdt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230126.O8xXYkdt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pci-sysfs.c:840:15: warning: 'pci_llseek_resource' used but never defined
     840 | static loff_t pci_llseek_resource(struct file *filep,
         |               ^~~~~~~~~~~~~~~~~~~


vim +/pci_llseek_resource +840 drivers/pci/pci-sysfs.c

   839	
 > 840	static loff_t pci_llseek_resource(struct file *filep,
   841					  struct kobject *kobj,
   842					  struct bin_attribute *attr,
   843					  loff_t offset, int whence);
   844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
