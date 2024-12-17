Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9961E529
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 07:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734420222; cv=none; b=PYB5pRZOoy84lGadgY+UryCvozxy20L3njk1F1xOsgbieZ12/CSHiHImsGuJvXjauCK3HyAsmeRbo+h1kxDjCe5PxOzi7pJs5rPh1S7MlI/KKEn7qSDvLuX3AH3oFOKfqgIqkhkxSc24h26veDgTjp4yKis8VcaheyZnkhCBNtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734420222; c=relaxed/simple;
	bh=eMJb6ZeVrDa8v3yuSxRZ2UoJZIpuhjSapJrKPH43bhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dnw+pEcl+B8N8HAy9N6u4lEXpNsIBUgBVlvoM6eEpmRTJwmU9jCXukvk3co47h+rKT5GJcsK+HTY+VsDDGp5eqUlTBbnoCCFFNzDJlVS6fdM2vm4Q5bIV33iMn9WmhYd7rjA1rXn2iQaV38m1D7yLSNqG5I/SGiEH6X2r8QOlWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtISEHlH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtISEHlH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734420221; x=1765956221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eMJb6ZeVrDa8v3yuSxRZ2UoJZIpuhjSapJrKPH43bhY=;
  b=dtISEHlHbzOXSeQS+xexQtXiAPfrIHH1pAcpkQv9xBfORZDg696BxBaL
   QtXz76Fvqsp+nO+w+jF5f0DBctQCvNxfHoxjZhwW960ER1Yqg3Xn4T6SP
   vwHbYUIf3Ol+elpB5/e0qDfj/ccT+tE6ShxTCaLm02BKX7lqHog41vPgm
   V4CX8RJHXkaGdjJSbB8d+K8AWaakKMJf3yWvJOLrqtWVB5/Ol2trxjxjT
   9/RWEWkUj57KjWhAw1Fr7UdexfnMoqsw/LB4sUSFLKOz33KfPT9weW0eL
   sb2uT71h4P1ChUk3YBhTbLKVDdEFkyuk23FKjVjTqPCL5LaqgBK3W7V6A
   g==;
X-CSE-ConnectionGUID: WLsr1QcFQWOREN+SbWRcYQ==
X-CSE-MsgGUID: LFr5Zc0jQHSc7bkPdOFf5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="57310972"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="57310972"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 23:23:39 -0800
X-CSE-ConnectionGUID: UzVwRnLSSMm2UT1dFsKg9Q==
X-CSE-MsgGUID: hsahHwpsQGOSg5BsxGx8wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="97688536"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Dec 2024 23:23:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNRvb-000Emu-1H;
	Tue, 17 Dec 2024 07:23:35 +0000
Date: Tue, 17 Dec 2024 15:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Ido Schimmel <idosch@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 53/60] net/bridge/br.c:58:25: error:
 implicit declaration of function 'br_vlan_vlan_upper_event'
Message-ID: <202412171507.3dIYJOXr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   eed0968cc93b75eeb363ea89d1834928a77e6fdc
commit: dae14d4697667bf658c29a01c0aac9c8f305e478 [53/60] net: bridge: Handle changes in VLAN_FLAG_BRIDGE_BINDING
config: arm-randconfig-004-20241217 (https://download.01.org/0day-ci/archive/20241217/202412171507.3dIYJOXr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412171507.3dIYJOXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412171507.3dIYJOXr-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/bridge/br.c: In function 'br_device_event':
>> net/bridge/br.c:58:25: error: implicit declaration of function 'br_vlan_vlan_upper_event' [-Wimplicit-function-declaration]
      58 |                         br_vlan_vlan_upper_event(real_dev, dev, event);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/br_vlan_vlan_upper_event +58 net/bridge/br.c

    21	
    22	/*
    23	 * Handle changes in state of network devices enslaved to a bridge.
    24	 *
    25	 * Note: don't care about up/down if bridge itself is down, because
    26	 *     port state is checked when bridge is brought up.
    27	 */
    28	static int br_device_event(struct notifier_block *unused, unsigned long event, void *ptr)
    29	{
    30		struct netlink_ext_ack *extack = netdev_notifier_info_to_extack(ptr);
    31		struct netdev_notifier_pre_changeaddr_info *prechaddr_info;
    32		struct net_device *dev = netdev_notifier_info_to_dev(ptr);
    33		struct net_bridge_port *p;
    34		struct net_bridge *br;
    35		bool notified = false;
    36		bool changed_addr;
    37		int err;
    38	
    39		if (netif_is_bridge_master(dev)) {
    40			err = br_vlan_bridge_event(dev, event, ptr);
    41			if (err)
    42				return notifier_from_errno(err);
    43	
    44			if (event == NETDEV_REGISTER) {
    45				/* register of bridge completed, add sysfs entries */
    46				err = br_sysfs_addbr(dev);
    47				if (err)
    48					return notifier_from_errno(err);
    49	
    50				return NOTIFY_DONE;
    51			}
    52		}
    53	
    54		if (is_vlan_dev(dev)) {
    55			struct net_device *real_dev = vlan_dev_real_dev(dev);
    56	
    57			if (netif_is_bridge_master(real_dev))
  > 58				br_vlan_vlan_upper_event(real_dev, dev, event);
    59		}
    60	
    61		/* not a port of a bridge */
    62		p = br_port_get_rtnl(dev);
    63		if (!p)
    64			return NOTIFY_DONE;
    65	
    66		br = p->br;
    67	
    68		switch (event) {
    69		case NETDEV_CHANGEMTU:
    70			br_mtu_auto_adjust(br);
    71			break;
    72	
    73		case NETDEV_PRE_CHANGEADDR:
    74			if (br->dev->addr_assign_type == NET_ADDR_SET)
    75				break;
    76			prechaddr_info = ptr;
    77			err = dev_pre_changeaddr_notify(br->dev,
    78							prechaddr_info->dev_addr,
    79							extack);
    80			if (err)
    81				return notifier_from_errno(err);
    82			break;
    83	
    84		case NETDEV_CHANGEADDR:
    85			spin_lock_bh(&br->lock);
    86			br_fdb_changeaddr(p, dev->dev_addr);
    87			changed_addr = br_stp_recalculate_bridge_id(br);
    88			spin_unlock_bh(&br->lock);
    89	
    90			if (changed_addr)
    91				call_netdevice_notifiers(NETDEV_CHANGEADDR, br->dev);
    92	
    93			break;
    94	
    95		case NETDEV_CHANGE:
    96			br_port_carrier_check(p, &notified);
    97			break;
    98	
    99		case NETDEV_FEAT_CHANGE:
   100			netdev_update_features(br->dev);
   101			break;
   102	
   103		case NETDEV_DOWN:
   104			spin_lock_bh(&br->lock);
   105			if (br->dev->flags & IFF_UP) {
   106				br_stp_disable_port(p);
   107				notified = true;
   108			}
   109			spin_unlock_bh(&br->lock);
   110			break;
   111	
   112		case NETDEV_UP:
   113			if (netif_running(br->dev) && netif_oper_up(dev)) {
   114				spin_lock_bh(&br->lock);
   115				br_stp_enable_port(p);
   116				notified = true;
   117				spin_unlock_bh(&br->lock);
   118			}
   119			break;
   120	
   121		case NETDEV_UNREGISTER:
   122			br_del_if(br, dev);
   123			break;
   124	
   125		case NETDEV_CHANGENAME:
   126			err = br_sysfs_renameif(p);
   127			if (err)
   128				return notifier_from_errno(err);
   129			break;
   130	
   131		case NETDEV_PRE_TYPE_CHANGE:
   132			/* Forbid underlying device to change its type. */
   133			return NOTIFY_BAD;
   134	
   135		case NETDEV_RESEND_IGMP:
   136			/* Propagate to master device */
   137			call_netdevice_notifiers(event, br->dev);
   138			break;
   139		}
   140	
   141		if (event != NETDEV_UNREGISTER)
   142			br_vlan_port_event(p, event);
   143	
   144		/* Events that may cause spanning tree to refresh */
   145		if (!notified && (event == NETDEV_CHANGEADDR || event == NETDEV_UP ||
   146				  event == NETDEV_CHANGE || event == NETDEV_DOWN))
   147			br_ifinfo_notify(RTM_NEWLINK, NULL, p);
   148	
   149		return NOTIFY_DONE;
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
