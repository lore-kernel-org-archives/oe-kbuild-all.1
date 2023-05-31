Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBE7C8E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685544689; x=1717080689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lP8ny2HUAWY+3LONBpNnW2g23sUS0fTWmlMm75d0Ug4=;
  b=lNGEXT0Frysjz7Ub9JKhLg6sRliDTmouaNZUdyI8sEXmNjL2TOn9fmsh
   Uva4sk253SqosR8b9Iyh0CWRoEijU2kVpVKHVFn+MW6cjwQS6ZgYXaE/g
   ELOzq2acQcdRzUk8OpnBBeGH//O7mKqY0jdDmaMyLisjWIDADuzu3WtGV
   iOTjqQULxo46a/1SXQUHn3t5i8keWgBKRqBcStskCic7yKXyY4uSb5lBy
   LdDw5M48BvLbyX94YNVy6Q/Kzkng6FdZo2M5Pk0kOwIxJnzKr3e19ZiCY
   OkTuOhFwXOYkVhT6nEiQO6QpB6r6Fvzx3c9FFtzKSKupyqlzwbBA6RUuS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="354103869"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="354103869"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 07:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="701129748"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="701129748"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 May 2023 07:51:28 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4NAd-0001PH-1B;
	Wed, 31 May 2023 14:51:27 +0000
Date: Wed, 31 May 2023 22:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bobby Eshleman <bobby.eshleman@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v3 4/8] vsock: make vsock bind reusable
Message-ID: <202305312235.q28W20Eh-lkp@intel.com>
References: <20230413-b4-vsock-dgram-v3-4-c2414413ef6a@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413-b4-vsock-dgram-v3-4-c2414413ef6a@bytedance.com>

Hi Bobby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ed72bd5a6790a0c3747cb32b0427f921bd03bb71]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/vsock-dgram-generalize-recvmsg-and-drop-transport-dgram_dequeue/20230531-084049
base:   ed72bd5a6790a0c3747cb32b0427f921bd03bb71
patch link:    https://lore.kernel.org/r/20230413-b4-vsock-dgram-v3-4-c2414413ef6a%40bytedance.com
patch subject: [PATCH RFC net-next v3 4/8] vsock: make vsock bind reusable
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230531/202305312235.q28W20Eh-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f69c7f6d6d618c47334134277ad9a2d3877020f5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bobby-Eshleman/vsock-dgram-generalize-recvmsg-and-drop-transport-dgram_dequeue/20230531-084049
        git checkout f69c7f6d6d618c47334134277ad9a2d3877020f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash net/vmw_vsock/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305312235.q28W20Eh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/vmw_vsock/af_vsock.c:233:14: warning: no previous prototype for 'vsock_find_bound_socket_common' [-Wmissing-prototypes]
     233 | struct sock *vsock_find_bound_socket_common(struct sockaddr_vm *addr,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/vmw_vsock/af_vsock.c:652:5: warning: no previous prototype for 'vsock_bind_common' [-Wmissing-prototypes]
     652 | int vsock_bind_common(struct vsock_sock *vsk,
         |     ^~~~~~~~~~~~~~~~~
>> net/vmw_vsock/af_vsock.c:720:5: warning: no previous prototype for 'vsock_bind_stream' [-Wmissing-prototypes]
     720 | int vsock_bind_stream(struct vsock_sock *vsk,
         |     ^~~~~~~~~~~~~~~~~


vim +/vsock_find_bound_socket_common +233 net/vmw_vsock/af_vsock.c

   232	
 > 233	struct sock *vsock_find_bound_socket_common(struct sockaddr_vm *addr,
   234						    struct list_head *bind_table)
   235	{
   236		struct vsock_sock *vsk;
   237	
   238		list_for_each_entry(vsk, bind_table, bound_table) {
   239			if (vsock_addr_equals_addr(addr, &vsk->local_addr))
   240				return sk_vsock(vsk);
   241	
   242			if (addr->svm_port == vsk->local_addr.svm_port &&
   243			    (vsk->local_addr.svm_cid == VMADDR_CID_ANY ||
   244			     addr->svm_cid == VMADDR_CID_ANY))
   245				return sk_vsock(vsk);
   246		}
   247	
   248		return NULL;
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
