Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A1228F3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682953757; x=1714489757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KxAtkIXD5Lm8M6cqSaegKqMaZ4q49C4PQrxgdE+TLOc=;
  b=WmV0m07QJFI1urTfkTFyEw8JxfSWv/iTxhOtvwn1J73/X5ESgBdbEIjk
   3seAZkhIw8PkUDdcEfdqzg7NGKVGNAImwLnWQ3d/8eCOLHEwz7wKl2srp
   wRB03vFS9U6UhWV99ln1tYMKKadMReQavq1wpGNx72CkUAeoqHxsoD/mo
   tXKa4TGsqo16Y3i/cmT9w7Oc/wheaZ3th6Xq6h0Y46rjYsa4ujcNkMdCe
   SO6mGsBKEHlPtgM8Qr/03R+toLHwLc/X4gevAJCF27T6yvnu6X1x04qQl
   2edp79Z+GEvjpo5LcVgIttquH++9CeKOff9efEUFQV+CBiFmTcCk22uGP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332509078"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="scan'208";a="332509078"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 08:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="1025652415"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="scan'208";a="1025652415"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 May 2023 08:09:07 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptV9G-0000Vd-2q;
	Mon, 01 May 2023 15:09:06 +0000
Date: Mon, 1 May 2023 23:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/new-api-tcx2 2/2] net/core/dev.c:10927: undefined
 reference to `dev_tcx_uninstall'
Message-ID: <202305012336.p6gQfPZg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx2
head:   83fb371f8432de3c2e43cf5cdc60a9de6b419b59
commit: 83fb371f8432de3c2e43cf5cdc60a9de6b419b59 [2/2] bpf: Add generic attach/detach/query API for multi-progs
config: i386-randconfig-a006-20230501 (https://download.01.org/0day-ci/archive/20230501/202305012336.p6gQfPZg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/cilium/linux/commit/83fb371f8432de3c2e43cf5cdc60a9de6b419b59
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/new-api-tcx2
        git checkout 83fb371f8432de3c2e43cf5cdc60a9de6b419b59
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305012336.p6gQfPZg-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/core/dev.o: in function `unregister_netdevice_many_notify':
>> net/core/dev.c:10927: undefined reference to `dev_tcx_uninstall'


vim +10927 net/core/dev.c

 10876	
 10877	void unregister_netdevice_many_notify(struct list_head *head,
 10878					      u32 portid, const struct nlmsghdr *nlh)
 10879	{
 10880		struct net_device *dev, *tmp;
 10881		LIST_HEAD(close_head);
 10882	
 10883		BUG_ON(dev_boot_phase);
 10884		ASSERT_RTNL();
 10885	
 10886		if (list_empty(head))
 10887			return;
 10888	
 10889		list_for_each_entry_safe(dev, tmp, head, unreg_list) {
 10890			/* Some devices call without registering
 10891			 * for initialization unwind. Remove those
 10892			 * devices and proceed with the remaining.
 10893			 */
 10894			if (dev->reg_state == NETREG_UNINITIALIZED) {
 10895				pr_debug("unregister_netdevice: device %s/%p never was registered\n",
 10896					 dev->name, dev);
 10897	
 10898				WARN_ON(1);
 10899				list_del(&dev->unreg_list);
 10900				continue;
 10901			}
 10902			dev->dismantle = true;
 10903			BUG_ON(dev->reg_state != NETREG_REGISTERED);
 10904		}
 10905	
 10906		/* If device is running, close it first. */
 10907		list_for_each_entry(dev, head, unreg_list)
 10908			list_add_tail(&dev->close_list, &close_head);
 10909		dev_close_many(&close_head, true);
 10910	
 10911		list_for_each_entry(dev, head, unreg_list) {
 10912			/* And unlink it from device chain. */
 10913			write_lock(&dev_base_lock);
 10914			unlist_netdevice(dev, false);
 10915			dev->reg_state = NETREG_UNREGISTERING;
 10916			write_unlock(&dev_base_lock);
 10917		}
 10918		flush_all_backlogs();
 10919	
 10920		synchronize_net();
 10921	
 10922		list_for_each_entry(dev, head, unreg_list) {
 10923			struct sk_buff *skb = NULL;
 10924	
 10925			/* Shutdown queueing discipline. */
 10926			dev_shutdown(dev);
 10927			dev_tcx_uninstall(dev);
 10928			dev_xdp_uninstall(dev);
 10929			bpf_dev_bound_netdev_unregister(dev);
 10930	
 10931			netdev_offload_xstats_disable_all(dev);
 10932	
 10933			/* Notify protocols, that we are about to destroy
 10934			 * this device. They should clean all the things.
 10935			 */
 10936			call_netdevice_notifiers(NETDEV_UNREGISTER, dev);
 10937	
 10938			if (!dev->rtnl_link_ops ||
 10939			    dev->rtnl_link_state == RTNL_LINK_INITIALIZED)
 10940				skb = rtmsg_ifinfo_build_skb(RTM_DELLINK, dev, ~0U, 0,
 10941							     GFP_KERNEL, NULL, 0,
 10942							     portid, nlh);
 10943	
 10944			/*
 10945			 *	Flush the unicast and multicast chains
 10946			 */
 10947			dev_uc_flush(dev);
 10948			dev_mc_flush(dev);
 10949	
 10950			netdev_name_node_alt_flush(dev);
 10951			netdev_name_node_free(dev->name_node);
 10952	
 10953			call_netdevice_notifiers(NETDEV_PRE_UNINIT, dev);
 10954	
 10955			if (dev->netdev_ops->ndo_uninit)
 10956				dev->netdev_ops->ndo_uninit(dev);
 10957	
 10958			if (skb)
 10959				rtmsg_ifinfo_send(skb, dev, GFP_KERNEL, portid, nlh);
 10960	
 10961			/* Notifier chain MUST detach us all upper devices. */
 10962			WARN_ON(netdev_has_any_upper_dev(dev));
 10963			WARN_ON(netdev_has_any_lower_dev(dev));
 10964	
 10965			/* Remove entries from kobject tree */
 10966			netdev_unregister_kobject(dev);
 10967	#ifdef CONFIG_XPS
 10968			/* Remove XPS queueing entries */
 10969			netif_reset_xps_queues_gt(dev, 0);
 10970	#endif
 10971		}
 10972	
 10973		synchronize_net();
 10974	
 10975		list_for_each_entry(dev, head, unreg_list) {
 10976			netdev_put(dev, &dev->dev_registered_tracker);
 10977			net_set_todo(dev);
 10978		}
 10979	
 10980		list_del(head);
 10981	}
 10982	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
