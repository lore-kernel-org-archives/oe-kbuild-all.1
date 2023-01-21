Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B2A3207
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 18:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674325960; x=1705861960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cwQGvTHDJZsOv1k46KsIb6qv7e7i02QTgVUbafxecqg=;
  b=E0OUetpXTHvGn2CKGj7yt6LG2QlX+SJKnXKNcEF9bKKdysenZRhTO93N
   zWa/Ez78Ng+lltr9/Ye4jo/nHXLTYnEp9ghvwRUf6ZgBpAdRoeNb7hKEi
   HmqGfR6UT1fJm/VUHlIRTYcAM1AjFVIjuKe28KcVnCIY9RYhWCRB8lv9z
   nPRIQ8nSTn5Nb/AdeNpRdYW+EQJpRFW/SUp7+3yU/ZR0CYiaJMnKcK+te
   RJ3D/pBQsCqPd9vrjini+0dLFEEjgIYTKpN9XM/R/fH3XMWm11zgKu6KI
   +6DF4vn+Ae8xVh67OV4SQxWAeOZuf6M1jkw17tu5vtSUDGlD9xIC0M+0i
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="327903819"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="327903819"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 10:32:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="989746473"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="989746473"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Jan 2023 10:32:39 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJIfO-0004Lu-1U;
	Sat, 21 Jan 2023 18:32:38 +0000
Date: Sun, 22 Jan 2023 02:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:pciehp_deadlock_v2_attempt_per_dev_rwsem 3/3]
 drivers/pci/doe.c:225:18: error: 'pdev' undeclared; did you mean 'cdev'?
Message-ID: <202301220227.uHeeBgJC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux pciehp_deadlock_v2_attempt_per_dev_rwsem
head:   b3340b13fc2a0ff0d4bc5cd92dc957910e5304db
commit: b3340b13fc2a0ff0d4bc5cd92dc957910e5304db [3/3] PCI/DOE: Protect DOE exchanges against concurrent reset.
config: parisc-buildonly-randconfig-r002-20230122 (https://download.01.org/0day-ci/archive/20230122/202301220227.uHeeBgJC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/b3340b13fc2a0ff0d4bc5cd92dc957910e5304db
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k pciehp_deadlock_v2_attempt_per_dev_rwsem
        git checkout b3340b13fc2a0ff0d4bc5cd92dc957910e5304db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pci/doe.c: In function 'signal_task_complete':
>> drivers/pci/doe.c:225:18: error: 'pdev' undeclared (first use in this function); did you mean 'cdev'?
     225 |         up_read(&pdev->reset_lock);
         |                  ^~~~
         |                  cdev
   drivers/pci/doe.c:225:18: note: each undeclared identifier is reported only once for each function it appears in


vim +225 drivers/pci/doe.c

   222	
   223	static void signal_task_complete(struct pci_doe_task *task, int rv)
   224	{
 > 225		up_read(&pdev->reset_lock);
   226		task->rv = rv;
   227		task->complete(task);
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
