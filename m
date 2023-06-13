Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAE617C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 02:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686622228; x=1718158228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4+5HWTTmkvilRvoxRZHjl/gdkJiMi/IXhlhos7MjOzM=;
  b=hZKhCrxHC62Js33+pscVoeS3vcTioZrun861b/Ty8tPpESfhtmrTIPXu
   WNH/Bx/U0ZIuhGVf8WXWg1zGlj8tj8I3YFoB72afMgW1YM7Lh5VgMUza9
   Ps9+j9pSG6DbW0VnyOGm06AiU8pHV3xKPfgAldnERgUQSOt55LlMy4UYp
   XwzZgsKOt4NdJEu95pVYbwKDKRR6kegoNA4GxGYwx8ofTTtZ+a80+DaN0
   VUWWTadrfpuHTobIaqMJa641tiw1yxj0blvXWVBhOze5IPFNbZzRbVlc4
   OYoTbIDI71yGTslt1qBgtblEea8uzr6qcbQfJU9QMxOLG3jJnUZjvZz+i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="361577345"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="361577345"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 19:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="835703855"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="835703855"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Jun 2023 19:10:26 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8tUH-0000vI-2B;
	Tue, 13 Jun 2023 02:10:25 +0000
Date: Tue, 13 Jun 2023 10:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 3/7] bpf: implement devtx hook points
Message-ID: <202306130953.PG26Cgga-lkp@intel.com>
References: <20230612172307.3923165-4-sdf@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612172307.3923165-4-sdf@google.com>

Hi Stanislav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/bpf-rename-some-xdp-metadata-functions-into-dev-bound/20230613-012928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230612172307.3923165-4-sdf%40google.com
patch subject: [RFC bpf-next 3/7] bpf: implement devtx hook points
config: i386-randconfig-r016-20230612 (https://download.01.org/0day-ci/archive/20230613/202306130953.PG26Cgga-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
        git fetch bpf-next master
        git checkout bpf-next/master
        b4 shazam https://lore.kernel.org/r/20230612172307.3923165-4-sdf@google.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130953.PG26Cgga-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/core/dev.o: in function `unregister_netdevice_many_notify':
>> net/core/dev.c:10879: undefined reference to `devtx_shutdown'


vim +10879 net/core/dev.c

 10826	
 10827	void unregister_netdevice_many_notify(struct list_head *head,
 10828					      u32 portid, const struct nlmsghdr *nlh)
 10829	{
 10830		struct net_device *dev, *tmp;
 10831		LIST_HEAD(close_head);
 10832	
 10833		BUG_ON(dev_boot_phase);
 10834		ASSERT_RTNL();
 10835	
 10836		if (list_empty(head))
 10837			return;
 10838	
 10839		list_for_each_entry_safe(dev, tmp, head, unreg_list) {
 10840			/* Some devices call without registering
 10841			 * for initialization unwind. Remove those
 10842			 * devices and proceed with the remaining.
 10843			 */
 10844			if (dev->reg_state == NETREG_UNINITIALIZED) {
 10845				pr_debug("unregister_netdevice: device %s/%p never was registered\n",
 10846					 dev->name, dev);
 10847	
 10848				WARN_ON(1);
 10849				list_del(&dev->unreg_list);
 10850				continue;
 10851			}
 10852			dev->dismantle = true;
 10853			BUG_ON(dev->reg_state != NETREG_REGISTERED);
 10854		}
 10855	
 10856		/* If device is running, close it first. */
 10857		list_for_each_entry(dev, head, unreg_list)
 10858			list_add_tail(&dev->close_list, &close_head);
 10859		dev_close_many(&close_head, true);
 10860	
 10861		list_for_each_entry(dev, head, unreg_list) {
 10862			/* And unlink it from device chain. */
 10863			write_lock(&dev_base_lock);
 10864			unlist_netdevice(dev, false);
 10865			dev->reg_state = NETREG_UNREGISTERING;
 10866			write_unlock(&dev_base_lock);
 10867		}
 10868		flush_all_backlogs();
 10869	
 10870		synchronize_net();
 10871	
 10872		list_for_each_entry(dev, head, unreg_list) {
 10873			struct sk_buff *skb = NULL;
 10874	
 10875			/* Shutdown queueing discipline. */
 10876			dev_shutdown(dev);
 10877	
 10878			dev_xdp_uninstall(dev);
 10879			devtx_shutdown(dev);
 10880			bpf_dev_bound_netdev_unregister(dev);
 10881	
 10882			netdev_offload_xstats_disable_all(dev);
 10883	
 10884			/* Notify protocols, that we are about to destroy
 10885			 * this device. They should clean all the things.
 10886			 */
 10887			call_netdevice_notifiers(NETDEV_UNREGISTER, dev);
 10888	
 10889			if (!dev->rtnl_link_ops ||
 10890			    dev->rtnl_link_state == RTNL_LINK_INITIALIZED)
 10891				skb = rtmsg_ifinfo_build_skb(RTM_DELLINK, dev, ~0U, 0,
 10892							     GFP_KERNEL, NULL, 0,
 10893							     portid, nlh);
 10894	
 10895			/*
 10896			 *	Flush the unicast and multicast chains
 10897			 */
 10898			dev_uc_flush(dev);
 10899			dev_mc_flush(dev);
 10900	
 10901			netdev_name_node_alt_flush(dev);
 10902			netdev_name_node_free(dev->name_node);
 10903	
 10904			call_netdevice_notifiers(NETDEV_PRE_UNINIT, dev);
 10905	
 10906			if (dev->netdev_ops->ndo_uninit)
 10907				dev->netdev_ops->ndo_uninit(dev);
 10908	
 10909			if (skb)
 10910				rtmsg_ifinfo_send(skb, dev, GFP_KERNEL, portid, nlh);
 10911	
 10912			/* Notifier chain MUST detach us all upper devices. */
 10913			WARN_ON(netdev_has_any_upper_dev(dev));
 10914			WARN_ON(netdev_has_any_lower_dev(dev));
 10915	
 10916			/* Remove entries from kobject tree */
 10917			netdev_unregister_kobject(dev);
 10918	#ifdef CONFIG_XPS
 10919			/* Remove XPS queueing entries */
 10920			netif_reset_xps_queues_gt(dev, 0);
 10921	#endif
 10922		}
 10923	
 10924		synchronize_net();
 10925	
 10926		list_for_each_entry(dev, head, unreg_list) {
 10927			netdev_put(dev, &dev->dev_registered_tracker);
 10928			net_set_todo(dev);
 10929		}
 10930	
 10931		list_del(head);
 10932	}
 10933	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
