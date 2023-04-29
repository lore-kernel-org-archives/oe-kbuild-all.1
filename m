Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E22817CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 12:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682769784; x=1714305784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kyQ/NOeaOWKUAJsH9fh6mkONGHbwhr2RWWG2CDYSm18=;
  b=MIo5akazIWKXyy4CDs8n/0N8Xf52YUXV0hCy31NWbdVF04HBZojwey9l
   itrQGqcSlBaryskGWcqc7F4H/KuO77V/C4HEhATBHDyOQtIOZ0yi4XHTe
   NoeZ2XWFof+iKwzvhtvKfcS4I76eM57FJA9ScpF8N+ihNIz4nnMxjRpmu
   X7eetyfjmDU60CeTbFZk+cnTDzajmIIXsRZC8iZS5IfDpJkek6yCPm1Ib
   noHclU1x1xXtK6guBt3y6y0b89dsKnHB5mpiGn00d7VCz29cqUTi2T/ew
   ojc7UoH5RhLiQF6Z+y2uNrkkdLJeYAw66hU0X5sMUC5jlu7Q8TKvoWttI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346717278"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="346717278"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 05:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="689253050"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="689253050"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Apr 2023 05:03:02 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psjI5-00017B-1P;
	Sat, 29 Apr 2023 12:03:01 +0000
Date: Sat, 29 Apr 2023 20:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 05/12] nvme: wire-up register/unregister queue f_op
 callback
Message-ID: <202304291925.J9c5dVau-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master next-20230428]
[cannot apply to v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230429093925.133327-6-joshi.k%40samsung.com
patch subject: [RFC PATCH 05/12] nvme: wire-up register/unregister queue f_op callback
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230429/202304291925.J9c5dVau-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/fb2d573b75b3615d774f841c417790d368b70ccd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
        git checkout fb2d573b75b3615d774f841c417790d368b70ccd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291925.J9c5dVau-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/nvme/host/core.c:4062:5: warning: no previous prototype for 'nvme_register_queue' [-Wmissing-prototypes]
    4062 | int nvme_register_queue(struct file *file)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c: In function 'nvme_register_queue':
>> drivers/nvme/host/core.c:4069:35: error: 'const struct blk_mq_ops' has no member named 'register_queue'
    4069 |         if (q->mq_ops && q->mq_ops->register_queue)
         |                                   ^~
   drivers/nvme/host/core.c:4070:33: error: 'const struct blk_mq_ops' has no member named 'register_queue'
    4070 |                 return q->mq_ops->register_queue(ns);
         |                                 ^~
   drivers/nvme/host/core.c: At top level:
>> drivers/nvme/host/core.c:4074:5: warning: no previous prototype for 'nvme_unregister_queue' [-Wmissing-prototypes]
    4074 | int nvme_unregister_queue(struct file *file, int qid)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/core.c: In function 'nvme_unregister_queue':
>> drivers/nvme/host/core.c:4081:35: error: 'const struct blk_mq_ops' has no member named 'unregister_queue'
    4081 |         if (q->mq_ops && q->mq_ops->unregister_queue)
         |                                   ^~
   drivers/nvme/host/core.c:4082:33: error: 'const struct blk_mq_ops' has no member named 'unregister_queue'
    4082 |                 return q->mq_ops->unregister_queue(ns, qid);
         |                                 ^~


vim +4069 drivers/nvme/host/core.c

  4061	
> 4062	int nvme_register_queue(struct file *file)
  4063	{
  4064		struct nvme_ns *ns = container_of(file_inode(file)->i_cdev,
  4065				struct nvme_ns, cdev);
  4066		struct nvme_ctrl *ctrl = ns->ctrl;
  4067		struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
  4068	
> 4069		if (q->mq_ops && q->mq_ops->register_queue)
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
> 4081		if (q->mq_ops && q->mq_ops->unregister_queue)
  4082			return q->mq_ops->unregister_queue(ns, qid);
  4083		return -EINVAL;
  4084	}
  4085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
