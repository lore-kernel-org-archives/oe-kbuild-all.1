Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F085698
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZo8JbaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697974077; x=1729510077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6LYTmI1wbNQ70SyfglzIU7ph91hc4WxWBq9ywCAt/1I=;
  b=fZo8JbaUg+VvkNKwjjr96PwMOPHCGIWIYwGVnDJztFMrf6C9SCs1Qmzk
   KiDXjWS9Iz+/1nI/t0NV6VXkPpW4V79hGyZ4s64RXVKUy/f59jHcSZz84
   lYwU/YvoIwDerV+0TCKXqzlvx+WWiW3JEUSCymTx5OoALbM+DQebGt2WX
   AhSyiPPzn9eB+kFNAfutNy22ISF+HMZWfeIerDyd8gQRrh45MVmeY7Ndm
   vd0bRugscK0dTjzlt/WJGfvW38/QVkDEatNC3KPOV5gKYggFeXSxYb2hK
   GzYJ8rngWz9FR7xjdg0HNf4xwTJgg5ENCfCprPb4i3TBVNxZbnl0vyN3c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="417827857"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="417827857"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 04:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="707658950"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="707658950"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Oct 2023 04:27:53 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quWcZ-0005ui-1N;
	Sun, 22 Oct 2023 11:27:51 +0000
Date: Sun, 22 Oct 2023 19:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Saeed Mahameed <saeed@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>
Subject: Re: [PATCH 3/5] misc: mlx5ctl: Add info ioctl
Message-ID: <202310221931.r1vsjtys-lkp@intel.com>
References: <20231018081941.475277-4-saeed@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018081941.475277-4-saeed@kernel.org>

Hi Saeed,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next rdma/for-next linus/master v6.6-rc6]
[cannot apply to next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Saeed-Mahameed/mlx5-Add-aux-dev-for-ctl-interface/20231018-162610
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20231018081941.475277-4-saeed%40kernel.org
patch subject: [PATCH 3/5] misc: mlx5ctl: Add info ioctl
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231022/202310221931.r1vsjtys-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310221931.r1vsjtys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221931.r1vsjtys-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/mlx5ctl/main.c:276:27: error: initialization of 'long int (*)(struct file *, unsigned int,  long unsigned int)' from incompatible pointer type 'ssize_t (*)(struct file *, unsigned int,  long unsigned int)' {aka 'int (*)(struct file *, unsigned int,  long unsigned int)'} [-Werror=incompatible-pointer-types]
     276 |         .unlocked_ioctl = mlx5ctl_ioctl,
         |                           ^~~~~~~~~~~~~
   drivers/misc/mlx5ctl/main.c:276:27: note: (near initialization for 'mlx5ctl_fops.unlocked_ioctl')
   cc1: some warnings being treated as errors


vim +276 drivers/misc/mlx5ctl/main.c

   271	
   272	static const struct file_operations mlx5ctl_fops = {
   273		.owner = THIS_MODULE,
   274		.open = mlx5ctl_open,
   275		.release = mlx5ctl_release,
 > 276		.unlocked_ioctl = mlx5ctl_ioctl,
   277	};
   278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
