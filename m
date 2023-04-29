Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480472F4D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 12:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682769789; x=1714305789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mWLbl01B4LoLVR3LWy6BpRrQgLtSowEYwA72zLUN3zk=;
  b=Sy12Lo1aM+LG60WWrXoOvWZ/KJLwG+UY/QP4xVO49rgv+CTXaAD1lGmy
   JgiesbhR/c5P1khTpODsNZN/hWPcvz/rDCf+fzRy5Htjw89IumD0Bp26w
   TCSAe67qHUvvihR9GiEctqa91WJeRKAkjqi+4q3IxocTrwDNkB+zyeNeR
   Ih9+F8KpUPSKrF+Rqj6X6A28av21E3AB4dl5/03xTMjBJkSKFz9Kq5EjA
   FyAIuS37dkFaFCXiOK/de6JkQUem9aKk8q/kA8yp1Ol8lp7F1FYdF4Viz
   YHkhSh3ysMIwl3g6674LHZQ7zm3zVyszaZVJ2h8zjeiPQC86SzCeJUjxA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346717283"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="346717283"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 05:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="727910738"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="727910738"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Apr 2023 05:03:07 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psjI5-00017F-1X;
	Sat, 29 Apr 2023 12:03:01 +0000
Date: Sat, 29 Apr 2023 20:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 05/12] nvme: wire-up register/unregister queue f_op
 callback
Message-ID: <202304291931.mAMjfqtH-lkp@intel.com>
References: <20230429093925.133327-6-joshi.k@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429093925.133327-6-joshi.k@samsung.com>

Hi Kanchan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master next-20230428]
[cannot apply to hch-configfs/for-next v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230429093925.133327-6-joshi.k%40samsung.com
patch subject: [RFC PATCH 05/12] nvme: wire-up register/unregister queue f_op callback
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230429/202304291931.mAMjfqtH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fb2d573b75b3615d774f841c417790d368b70ccd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
        git checkout fb2d573b75b3615d774f841c417790d368b70ccd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291931.mAMjfqtH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/core.c:4062:5: warning: no previous prototype for 'nvme_register_queue' [-Wmissing-prototypes]
    4062 | int nvme_register_queue(struct file *file)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/core.c:4074:5: warning: no previous prototype for 'nvme_unregister_queue' [-Wmissing-prototypes]
    4074 | int nvme_unregister_queue(struct file *file, int qid)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/nvme_register_queue +4062 drivers/nvme/host/core.c

  4061	
> 4062	int nvme_register_queue(struct file *file)
  4063	{
  4064		struct nvme_ns *ns = container_of(file_inode(file)->i_cdev,
  4065				struct nvme_ns, cdev);
  4066		struct nvme_ctrl *ctrl = ns->ctrl;
  4067		struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
  4068	
  4069		if (q->mq_ops && q->mq_ops->register_queue)
  4070			return q->mq_ops->register_queue(ns);
  4071		return -EINVAL;
  4072	}
  4073	
> 4074	int nvme_unregister_queue(struct file *file, int qid)
  4075	{
  4076		struct nvme_ns *ns = container_of(file_inode(file)->i_cdev,
  4077				struct nvme_ns, cdev);
  4078		struct nvme_ctrl *ctrl = ns->ctrl;
  4079		struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
  4080	
  4081		if (q->mq_ops && q->mq_ops->unregister_queue)
  4082			return q->mq_ops->unregister_queue(ns, qid);
  4083		return -EINVAL;
  4084	}
  4085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
