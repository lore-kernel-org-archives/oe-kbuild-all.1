Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35C917C6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 04:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692764373; x=1724300373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I42y9s/t2B8dtlehzkpI6aZHEByJN3Yt0W18Yr8fsl0=;
  b=UgLu8LAeqzkKY8zvcj6g6KXtinUjAxtgH/CpSZPFYJF3WutYNSM+CbCz
   npbrZc6OZuY913Tom/wjNXqv7w6SYNU5HLLj7G9bxe0KjrA5cH+TQmGbx
   diOF8ja17/84fUsILrvEL4rbhc/5vu2vU8p6/VTZUgxj4l90mn7sbK84q
   udpgUqtBrAj0TPqai+4EDiqWIGI4yz7QRVzFbL0QMz8AE7vCrdMMogqjQ
   PCeUr/fEtYW5NnPAfM7KZMmo4qWOP42Bh0XOa2mVdJPcbonn3HMWynuuF
   LKncVjtmY6hZqlDdFDmcguRXSLY+NqlHzdWs+jLwDBiUG6ua1ihj5afCE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372951086"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="372951086"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 21:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880254372"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2023 21:17:05 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYfId-0000q0-0c;
	Wed, 23 Aug 2023 04:16:56 +0000
Date: Wed, 23 Aug 2023 12:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 1/2] net: bpf: Make xdp and cls_bpf use
 bpf_prog_put_dev()
Message-ID: <202308231206.VVgK5KFw-lkp@intel.com>
References: <55ffbb77cd34d3460b16a3d79877d41ad7c43a34.1692748902.git.dxu@dxuuu.xyz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55ffbb77cd34d3460b16a3d79877d41ad7c43a34.1692748902.git.dxu@dxuuu.xyz>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Xu/net-bpf-Make-xdp-and-cls_bpf-use-bpf_prog_put_dev/20230823-081039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/55ffbb77cd34d3460b16a3d79877d41ad7c43a34.1692748902.git.dxu%40dxuuu.xyz
patch subject: [RFC PATCH bpf-next 1/2] net: bpf: Make xdp and cls_bpf use bpf_prog_put_dev()
config: loongarch-randconfig-r023-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231206.VVgK5KFw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231206.VVgK5KFw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231206.VVgK5KFw-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/dev.c: In function 'generic_xdp_install':
>> net/core/dev.c:5679:25: error: implicit declaration of function 'bpf_prog_put_dev'; did you mean 'bpf_prog_put'? [-Werror=implicit-function-declaration]
    5679 |                         bpf_prog_put_dev(old);
         |                         ^~~~~~~~~~~~~~~~
         |                         bpf_prog_put
   cc1: some warnings being treated as errors


vim +5679 net/core/dev.c

  5668	
  5669	static int generic_xdp_install(struct net_device *dev, struct netdev_bpf *xdp)
  5670	{
  5671		struct bpf_prog *old = rtnl_dereference(dev->xdp_prog);
  5672		struct bpf_prog *new = xdp->prog;
  5673		int ret = 0;
  5674	
  5675		switch (xdp->command) {
  5676		case XDP_SETUP_PROG:
  5677			rcu_assign_pointer(dev->xdp_prog, new);
  5678			if (old)
> 5679				bpf_prog_put_dev(old);
  5680	
  5681			if (old && !new) {
  5682				static_branch_dec(&generic_xdp_needed_key);
  5683			} else if (new && !old) {
  5684				static_branch_inc(&generic_xdp_needed_key);
  5685				dev_disable_lro(dev);
  5686				dev_disable_gro_hw(dev);
  5687			}
  5688			break;
  5689	
  5690		default:
  5691			ret = -EINVAL;
  5692			break;
  5693		}
  5694	
  5695		return ret;
  5696	}
  5697	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
