Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DF117CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 07:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674198227; x=1705734227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=psJe1wpKnhxTH9xqxLt9ldPPvqCBYGTv5UGJeZmN0gg=;
  b=dwBNGP9mNkAvqX3QohH8AL1Q+dxH1OhdTAzfnVZ2OAFQ3dOWOsEBVdPH
   7pV4X6LhdbbSlTIUln02V93pY17qP4MGwbTS10HkgEg/I5GYKKvixwKSV
   YBszdkg+tdpyUviroB5vCVpfbGMNG6aYw4sFsDjwAcMrvdvjKH7AXnzqU
   3PO272Bo8ao1Zuy/tJk0P4HXbbc9KR1PqlY4yzs/PTHfi4jSLkrUFvjXa
   /cMH0jG+fe56BfLEKlp3ED2NfZqo2Oukz9dRlVtKwBMsDDWrtRP7hOICz
   S0UHSf1YdVcTOtyHBcfWGNssp4XKO7sdtuP2jdVOPwd0MHN/U0f2feKeG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326798226"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="326798226"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 23:03:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="905868827"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="905868827"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jan 2023 23:03:45 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIlRA-0002Is-1j;
	Fri, 20 Jan 2023 07:03:44 +0000
Date: Fri, 20 Jan 2023 15:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH rdma-rc] IB/IPoIB: Fix legacy IPoIB due to wrong number
 of queues
Message-ID: <202301201405.FsqslBeu-lkp@intel.com>
References: <4a7ecec08ee30ad8004019818fadf1e58057e945.1674137153.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a7ecec08ee30ad8004019818fadf1e58057e945.1674137153.git.leon@kernel.org>

Hi Leon,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on linus/master v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Romanovsky/IB-IPoIB-Fix-legacy-IPoIB-due-to-wrong-number-of-queues/20230120-133424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/4a7ecec08ee30ad8004019818fadf1e58057e945.1674137153.git.leon%40kernel.org
patch subject: [PATCH rdma-rc] IB/IPoIB: Fix legacy IPoIB due to wrong number of queues
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230120/202301201405.FsqslBeu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/deaa657911ce6ed4f118cb6a9653fb74d6550ac7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Leon-Romanovsky/IB-IPoIB-Fix-legacy-IPoIB-due-to-wrong-number-of-queues/20230120-133424
        git checkout deaa657911ce6ed4f118cb6a9653fb74d6550ac7
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 ARCH=m68k 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/infiniband/ulp/ipoib/ipoib_netlink.c: In function 'ipoib_new_child_link':
>> drivers/infiniband/ulp/ipoib/ipoib_netlink.c:137:94: warning: unknown escape sequence: '\m'
     137 |                 ipoib_warn(ppriv, "failed setting the child rx queue count based on parent\m");
         |                                                                                              ^
>> drivers/infiniband/ulp/ipoib/ipoib_netlink.c:137:94: warning: unknown escape sequence: '\m'
>> drivers/infiniband/ulp/ipoib/ipoib_netlink.c:137:94: warning: unknown escape sequence: '\m'
   In file included from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/ktime.h:26,
                    from include/linux/timer.h:6,
                    from include/linux/netdevice.h:24,
                    from drivers/infiniband/ulp/ipoib/ipoib_netlink.c:33:
>> include/linux/printk.h:393:41: warning: unknown escape sequence: '\m'
     393 |                                 .line = __LINE__,                       \
         |                                         ^~~~~~~~
   include/linux/printk.h:428:17: note: in expansion of macro '__printk_index_emit'
     428 |                 __printk_index_emit(_fmt, NULL, NULL);                  \
         |                 ^~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:457:26: note: in expansion of macro 'printk_index_wrap'
     457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   drivers/infiniband/ulp/ipoib/ipoib.h:795:9: note: in expansion of macro 'printk'
     795 |         printk(level "%s: " format, ((struct ipoib_dev_priv *) priv)->dev->name , ## arg)
         |         ^~~~~~
   drivers/infiniband/ulp/ipoib/ipoib.h:802:17: note: in expansion of macro 'ipoib_printk'
     802 |                 ipoib_printk(KERN_WARNING, priv, format , ## arg);\
         |                 ^~~~~~~~~~~~
   drivers/infiniband/ulp/ipoib/ipoib_netlink.c:137:17: note: in expansion of macro 'ipoib_warn'
     137 |                 ipoib_warn(ppriv, "failed setting the child rx queue count based on parent\m");
         |                 ^~~~~~~~~~


vim +/m +137 drivers/infiniband/ulp/ipoib/ipoib_netlink.c

    99	
   100	static int ipoib_new_child_link(struct net *src_net, struct net_device *dev,
   101					struct nlattr *tb[], struct nlattr *data[],
   102					struct netlink_ext_ack *extack)
   103	{
   104		struct net_device *pdev;
   105		struct ipoib_dev_priv *ppriv;
   106		u16 child_pkey;
   107		int err;
   108	
   109		if (!tb[IFLA_LINK])
   110			return -EINVAL;
   111	
   112		pdev = __dev_get_by_index(src_net, nla_get_u32(tb[IFLA_LINK]));
   113		if (!pdev || pdev->type != ARPHRD_INFINIBAND)
   114			return -ENODEV;
   115	
   116		ppriv = ipoib_priv(pdev);
   117	
   118		if (test_bit(IPOIB_FLAG_SUBINTERFACE, &ppriv->flags)) {
   119			ipoib_warn(ppriv, "child creation disallowed for child devices\n");
   120			return -EINVAL;
   121		}
   122	
   123		if (!data || !data[IFLA_IPOIB_PKEY]) {
   124			ipoib_dbg(ppriv, "no pkey specified, using parent pkey\n");
   125			child_pkey  = ppriv->pkey;
   126		} else
   127			child_pkey  = nla_get_u16(data[IFLA_IPOIB_PKEY]);
   128	
   129		err = netif_set_real_num_tx_queues(dev, pdev->real_num_tx_queues);
   130		if (err) {
   131			ipoib_warn(ppriv, "failed setting the child tx queue count based on parent\n");
   132			return err;
   133		}
   134	
   135		err = netif_set_real_num_rx_queues(dev, pdev->real_num_rx_queues);
   136		if (err) {
 > 137			ipoib_warn(ppriv, "failed setting the child rx queue count based on parent\m");
   138			return err;
   139		}
   140	
   141		err = ipoib_intf_init(ppriv->ca, ppriv->port, dev->name, dev);
   142		if (err) {
   143			ipoib_warn(ppriv, "failed to initialize pkey device\n");
   144			return err;
   145		}
   146	
   147		err = __ipoib_vlan_add(ppriv, ipoib_priv(dev),
   148				       child_pkey, IPOIB_RTNL_CHILD);
   149		if (err)
   150			return err;
   151	
   152		if (data) {
   153			err = ipoib_changelink(dev, tb, data, extack);
   154			if (err) {
   155				unregister_netdevice(dev);
   156				return err;
   157			}
   158		}
   159	
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
