Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67F81FAE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678692127; x=1710228127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TCkmUKwixNgPcSmVxcnK3SjHRb+zCuB4uLZUFVoY3y0=;
  b=BM/mQ+M11KLRdPiYEovm6ouPfWT/V62eNKxo2nBKSpvTIE+Op7F+Eo3n
   cWMOie42884kztNEkcZWyaXZKSGqeDjurg6dk1jF1B785AwLXHP/F+5MQ
   TUJrzDG5LDYf+rJP8ovLh7ML2HCDCdyimjQXMqeAD16dizr89U/QA1BdX
   up5QKKLn9dXT1guwGPuIhfo/gBgSFSkeEDB1YxZXeBueqkT1lNSK5oVQV
   28yC7TNmkNN25WEP336RPtHCuhFaspfwaiEheNNCHM4yPAywJiZ1wlJVU
   bYSewHrx2B/sAhH0EZIzAX/0Q+7KGR5dV1krkgBYd+6I/ptY2VdcGhI4j
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="337101567"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="337101567"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 00:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711024026"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="711024026"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Mar 2023 00:22:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbcVN-0005Qs-1a;
	Mon, 13 Mar 2023 07:22:01 +0000
Date: Mon, 13 Mar 2023 15:21:26 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Wang <zyytlz.wz@163.com>, ericvh@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, lucho@ionkov.net, asmadeus@codewreck.org,
	linux_oss@crudebyte.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	v9fs-developer@lists.sourceforge.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, hackerzheng666@gmail.com,
	1395428693sheep@gmail.com, alex000young@gmail.com,
	Zheng Wang <zyytlz.wz@163.com>
Subject: Re: [PATCH net] 9p/xen : Fix use after free bug in
 xen_9pfs_front_remove due to race condition
Message-ID: <202303131508.drILo2xA-lkp@intel.com>
References: <20230313041303.3158458-1-zyytlz.wz@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313041303.3158458-1-zyytlz.wz@163.com>

Hi Zheng,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Zheng-Wang/9p-xen-Fix-use-after-free-bug-in-xen_9pfs_front_remove-due-to-race-condition/20230313-121534
patch link:    https://lore.kernel.org/r/20230313041303.3158458-1-zyytlz.wz%40163.com
patch subject: [PATCH net] 9p/xen : Fix use after free bug in xen_9pfs_front_remove due to race condition
config: arm-randconfig-r046-20230313 (https://download.01.org/0day-ci/archive/20230313/202303131508.drILo2xA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/bf2159b54bb14c42221106b8681c471d005e7345
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zheng-Wang/9p-xen-Fix-use-after-free-bug-in-xen_9pfs_front_remove-due-to-race-condition/20230313-121534
        git checkout bf2159b54bb14c42221106b8681c471d005e7345
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/9p/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131508.drILo2xA-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/9p/trans_xen.c: In function 'xen_9pfs_front_free':
>> net/9p/trans_xen.c:284:24: error: incompatible types when assigning to type 'struct xen_9pfs_dataring *' from type 'struct xen_9pfs_dataring'
     284 |                 ring = priv->rings[i];
         |                        ^~~~


vim +284 net/9p/trans_xen.c

   273	
   274	static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
   275	{
   276		int i, j;
   277		struct xen_9pfs_dataring *ring = NULL;
   278	
   279		write_lock(&xen_9pfs_lock);
   280		list_del(&priv->list);
   281		write_unlock(&xen_9pfs_lock);
   282	
   283		for (i = 0; i < priv->num_rings; i++) {
 > 284			ring = priv->rings[i];
   285			if (!priv->rings[i].intf)
   286				break;
   287			if (priv->rings[i].irq > 0)
   288				unbind_from_irqhandler(priv->rings[i].irq, priv->dev);
   289	
   290			cancel_work_sync(&ring->work);
   291	
   292			if (priv->rings[i].data.in) {
   293				for (j = 0;
   294				     j < (1 << priv->rings[i].intf->ring_order);
   295				     j++) {
   296					grant_ref_t ref;
   297	
   298					ref = priv->rings[i].intf->ref[j];
   299					gnttab_end_foreign_access(ref, NULL);
   300				}
   301				free_pages_exact(priv->rings[i].data.in,
   302					   1UL << (priv->rings[i].intf->ring_order +
   303						   XEN_PAGE_SHIFT));
   304			}
   305			gnttab_end_foreign_access(priv->rings[i].ref, NULL);
   306			free_page((unsigned long)priv->rings[i].intf);
   307		}
   308		kfree(priv->rings);
   309		kfree(priv->tag);
   310		kfree(priv);
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
