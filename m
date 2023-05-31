Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA00114289
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685547811; x=1717083811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EBRfkxX6bmCV1f0t1s10j+7RGuuWfU5Wvq04EO/atDI=;
  b=cXLji7EUO4PweqRjwW96TsOrW8bZEfwpgMok6r4rW6Dhh5y7qlN6+G0E
   WYTr/9ceQ3w9tP3sIoTujAP9S3DZIkdY0uKHCBK4/Qep5XiobuBNTuFWq
   YY8GIGOvn3vFmJC4oFeiFDMXacjDXxcIcOZxXHKryc/BIvaosDV3stJXQ
   IQ48Q6DtkXxevFYTyhsoJHPJ6vQu106x+Oz1DrW6pI1C4q4irtLmIJtp9
   09bppKa4TLp8ztbiBemqHZDSXpMfzMJQYfHLG7lW+Enb2W/InHEs8Xfor
   RD6MWg+YfrZIgHIOTbmAm4HsSBmvwwKbz9BEpPoWHewycJ0V1tRSQ1ZoA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="357667132"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="357667132"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 08:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="796758009"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="796758009"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 May 2023 08:43:30 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Nyz-0001R6-0n;
	Wed, 31 May 2023 15:43:29 +0000
Date: Wed, 31 May 2023 23:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bobby Eshleman <bobby.eshleman@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v3 7/8] vsock: Add lockless sendmsg() support
Message-ID: <202305312309.o1HevXs3-lkp@intel.com>
References: <20230413-b4-vsock-dgram-v3-7-c2414413ef6a@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413-b4-vsock-dgram-v3-7-c2414413ef6a@bytedance.com>

Hi Bobby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ed72bd5a6790a0c3747cb32b0427f921bd03bb71]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/vsock-dgram-generalize-recvmsg-and-drop-transport-dgram_dequeue/20230531-084049
base:   ed72bd5a6790a0c3747cb32b0427f921bd03bb71
patch link:    https://lore.kernel.org/r/20230413-b4-vsock-dgram-v3-7-c2414413ef6a%40bytedance.com
patch subject: [PATCH RFC net-next v3 7/8] vsock: Add lockless sendmsg() support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230531/202305312309.o1HevXs3-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4e9bf74675652b253b0ba5d9a7c4a505f25fcc7e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bobby-Eshleman/vsock-dgram-generalize-recvmsg-and-drop-transport-dgram_dequeue/20230531-084049
        git checkout 4e9bf74675652b253b0ba5d9a7c4a505f25fcc7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash net/vmw_vsock/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305312309.o1HevXs3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/vmw_vsock/af_vsock.c:221:5: warning: no previous prototype for 'vsock_set_remote_info' [-Wmissing-prototypes]
     221 | int vsock_set_remote_info(struct vsock_sock *vsk,
         |     ^~~~~~~~~~~~~~~~~~~~~
   net/vmw_vsock/af_vsock.c:383:14: warning: no previous prototype for 'vsock_find_bound_socket_common' [-Wmissing-prototypes]
     383 | struct sock *vsock_find_bound_socket_common(struct sockaddr_vm *addr,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/vmw_vsock/af_vsock.c:474:6: warning: no previous prototype for 'vsock_remove_dgram_bound' [-Wmissing-prototypes]
     474 | void vsock_remove_dgram_bound(struct vsock_sock *vsk)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   net/vmw_vsock/af_vsock.c:835:5: warning: no previous prototype for 'vsock_bind_common' [-Wmissing-prototypes]
     835 | int vsock_bind_common(struct vsock_sock *vsk,
         |     ^~~~~~~~~~~~~~~~~
   net/vmw_vsock/af_vsock.c:903:5: warning: no previous prototype for 'vsock_bind_stream' [-Wmissing-prototypes]
     903 | int vsock_bind_stream(struct vsock_sock *vsk,
         |     ^~~~~~~~~~~~~~~~~


vim +/vsock_set_remote_info +221 net/vmw_vsock/af_vsock.c

   219	
   220	/* The socket lock must be held by the caller */
 > 221	int vsock_set_remote_info(struct vsock_sock *vsk,
   222				  const struct vsock_transport *transport,
   223				  struct sockaddr_vm *addr)
   224	{
   225		struct vsock_remote_info *old, *new;
   226	
   227		if (addr || transport) {
   228			new = kmalloc(sizeof(*new), GFP_KERNEL);
   229			if (!new)
   230				return -ENOMEM;
   231	
   232			if (addr)
   233				memcpy(&new->addr, addr, sizeof(new->addr));
   234	
   235			if (transport)
   236				new->transport = transport;
   237		} else {
   238			new = NULL;
   239		}
   240	
   241		old = rcu_replace_pointer(vsk->remote_info, new, lockdep_sock_is_held(sk_vsock(vsk)));
   242		kfree_rcu(old, rcu);
   243	
   244		return 0;
   245	}
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
