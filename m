Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35089620
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 02:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681438214; x=1712974214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vh6XVk3+2+ejZ2BJtXpi0sm4cgs6aD5DScfB3a0YItk=;
  b=ASZY1yMgOMoPa5HmJXrF6VMyBroNMBBQ0YYNpBrIYLvjdIQU8m2kAC7I
   I/94cZC+5qFFDwPmrtTOVAqCNCb3KzPfOC/UiSKKgdfaKRlhZbGocfuvJ
   wkN8pfIBnPIJTgSkgkE0BcIZI8YFcs3ztpeEKysPw4/xVo6SekVZRlZKb
   ltGvHsiUesjXOCiDKZhRfE4lxy5MkN+x3+YBgrJv0+8SK4j36av7i3V8k
   PeJDamZU0FAFOoWc2++NtPoiuypYZFhfbF02VmBmzfuzPMidRRHjVIRHq
   UpCyp537CmC6DNleaoWNYw4CLKBLUisSF7xNVSInJHP2dxjUKjGvB7+ON
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="323990682"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="323990682"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 19:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="754271853"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="754271853"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2023 19:10:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn8t8-000Z8J-11;
	Fri, 14 Apr 2023 02:10:10 +0000
Date: Fri, 14 Apr 2023 10:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bobby Eshleman <bobby.eshleman@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v2 3/4] vsock: Add lockless sendmsg() support
Message-ID: <202304140923.cXElTOcl-lkp@intel.com>
References: <20230413-b4-vsock-dgram-v2-3-079cc7cee62e@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413-b4-vsock-dgram-v2-3-079cc7cee62e@bytedance.com>

Hi Bobby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ed72bd5a6790a0c3747cb32b0427f921bd03bb71]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/virtio-vsock-support-dgram/20230414-082831
base:   ed72bd5a6790a0c3747cb32b0427f921bd03bb71
patch link:    https://lore.kernel.org/r/20230413-b4-vsock-dgram-v2-3-079cc7cee62e%40bytedance.com
patch subject: [PATCH RFC net-next v2 3/4] vsock: Add lockless sendmsg() support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230414/202304140923.cXElTOcl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/de4d5e13dd5c747996abbc4e9ce38eeb3093ea01
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bobby-Eshleman/virtio-vsock-support-dgram/20230414-082831
        git checkout de4d5e13dd5c747996abbc4e9ce38eeb3093ea01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash net/vmw_vsock/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140923.cXElTOcl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/vmw_vsock/af_vsock.c:247:5: warning: no previous prototype for 'vsock_remote_addr_update' [-Wmissing-prototypes]
     247 | int vsock_remote_addr_update(struct vsock_sock *vsk, struct sockaddr_vm *src)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/vsock_remote_addr_update +247 net/vmw_vsock/af_vsock.c

   245	
   246	/* The socket lock must be held by the caller */
 > 247	int vsock_remote_addr_update(struct vsock_sock *vsk, struct sockaddr_vm *src)
   248	{
   249		struct sockaddr_vm_rcu *old, *new;
   250	
   251		new = kmalloc(sizeof(*new), GFP_KERNEL);
   252		if (!new)
   253			return -ENOMEM;
   254	
   255		memcpy(&new->addr, src, sizeof(new->addr));
   256		old = rcu_replace_pointer(vsk->remote_addr, new, lockdep_sock_is_held(sk_vsock(vsk)));
   257		kfree_rcu(old, rcu);
   258	
   259		return 0;
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
