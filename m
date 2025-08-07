Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B032526C39F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 17:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754587991; cv=none; b=ZObBegX4ARDea8InofS/0hWp+s0z/Ps6Zp+EWMvHBQvPGas7sPNeMXKCxlZXxYpNMGfuzBGE4/0pHBHGD9uGJWljDI/7lrtrkqt1GpE4crUIS8lcdjnJbbTaxfldGwAvB7ASqsa9nG4OZWlA6Q2ZdwsmS3N55ba84JdcXULp9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754587991; c=relaxed/simple;
	bh=DZ6NOr0ehfLg9BnUOTsa6g/71Hf2SIfO/iwKjdaAA7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTdzy6xFsgW6kyKPHVM/iBgGpVJZx+piQbwggXrmQbrUlLGalnHgNQscLZHvQR0M1qDiQhYtrI0bEtZpX2tVgKjE1ubEEop6rBlI5eStOJeR5V7G7TUb8ypzXoXfcaQ6o1VxWhoDapFDgciW9vrIyyjgtu06A8eNzuxH260a3QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWXIaSWl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWXIaSWl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754587990; x=1786123990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DZ6NOr0ehfLg9BnUOTsa6g/71Hf2SIfO/iwKjdaAA7w=;
  b=QWXIaSWlGgJqt2vegQ47cNOTvCOFpHGUgj9GFcXZFiPsX1RyJPJ0R5K/
   y2a0Y17GLAq+S7zlXmeSlBOCUYe7RpOdJg85rWocqNUmCrFc8BcJWjV5R
   QT98idDw79NKkp9+Q0OnF1cSkfKW2qIfEW03qVVHavKNITX7+UC2bqm/l
   aik9S/Y5ZNLkIvyWKdvJsQH+DvOLF8gf9JkNONWkoDm5VCGr2Fh7C7sOl
   igEPX1BBxpWBHFG/NmJykRClkvn6q2Xbljsvq46KdMVoUsjn/msw2VOGa
   vmG5DlYzCrm5JMcje6uCJt65bS29td8++lrTYc7zISYuFGKrfX4RTngfU
   Q==;
X-CSE-ConnectionGUID: IJTbZjDfT6aw+pN2Cw4dIg==
X-CSE-MsgGUID: hGrMB1RmS0OyE5mvScf+4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67524286"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67524286"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 10:33:06 -0700
X-CSE-ConnectionGUID: Mtwx5TdMQy6/jwJ7WC8qBg==
X-CSE-MsgGUID: GbNqTIhZQ2KbqsOwRT42hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164367144"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Aug 2025 10:33:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk4U2-000338-31;
	Thu, 07 Aug 2025 17:32:59 +0000
Date: Fri, 8 Aug 2025 01:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <menglong8.dong@gmail.com>, idosch@idosch.org
Cc: oe-kbuild-all@lists.linux.dev, dsahern@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	sdf@fomichev.me, kuniyu@google.com, ahmed.zaki@intel.com,
	aleksander.lobakin@intel.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: vrf: don't down the interface when add
 slave
Message-ID: <202508080147.1G52KerV-lkp@intel.com>
References: <20250807055634.113753-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807055634.113753-1-dongml2@chinatelecom.cn>

Hi Menglong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/net-vrf-don-t-down-the-interface-when-add-slave/20250807-140407
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250807055634.113753-1-dongml2%40chinatelecom.cn
patch subject: [PATCH net-next v2] net: vrf: don't down the interface when add slave
config: arc-randconfig-001-20250808 (https://download.01.org/0day-ci/archive/20250808/202508080147.1G52KerV-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080147.1G52KerV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080147.1G52KerV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/lock_debug.c: In function 'netdev_debug_event':
>> net/core/lock_debug.c:20:9: warning: enumeration value 'NETDEV_VRF_MASTER' not handled in switch [-Wswitch]
      20 |         switch (cmd) {
         |         ^~~~~~


vim +/NETDEV_VRF_MASTER +20 net/core/lock_debug.c

03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  11  
1901066aab7654 net/core/lock_debug.c     Stanislav Fomichev 2025-04-01  12  int netdev_debug_event(struct notifier_block *nb, unsigned long event,
1901066aab7654 net/core/lock_debug.c     Stanislav Fomichev 2025-04-01  13  		       void *ptr)
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  14  {
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  15  	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  16  	struct net *net = dev_net(dev);
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  17  	enum netdev_cmd cmd = event;
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  18  
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  19  	/* Keep enum and don't add default to trigger -Werror=switch */
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04 @20  	switch (cmd) {
22cbc1ee268b7e net/core/lock_debug.c     Jakub Kicinski     2025-04-15  21  	case NETDEV_XDP_FEAT_CHANGE:
22cbc1ee268b7e net/core/lock_debug.c     Jakub Kicinski     2025-04-15  22  		netdev_assert_locked(dev);
22cbc1ee268b7e net/core/lock_debug.c     Jakub Kicinski     2025-04-15  23  		fallthrough;
cb7103298d1c5d net/core/lock_debug.c     Jakub Kicinski     2025-04-10  24  	case NETDEV_CHANGE:
1901066aab7654 net/core/lock_debug.c     Stanislav Fomichev 2025-04-01  25  	case NETDEV_REGISTER:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  26  	case NETDEV_UP:
1901066aab7654 net/core/lock_debug.c     Stanislav Fomichev 2025-04-01  27  		netdev_ops_assert_locked(dev);
1901066aab7654 net/core/lock_debug.c     Stanislav Fomichev 2025-04-01  28  		fallthrough;
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  29  	case NETDEV_DOWN:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  30  	case NETDEV_REBOOT:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  31  	case NETDEV_UNREGISTER:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  32  	case NETDEV_CHANGEMTU:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  33  	case NETDEV_CHANGEADDR:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  34  	case NETDEV_PRE_CHANGEADDR:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  35  	case NETDEV_GOING_DOWN:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  36  	case NETDEV_FEAT_CHANGE:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  37  	case NETDEV_BONDING_FAILOVER:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  38  	case NETDEV_PRE_UP:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  39  	case NETDEV_PRE_TYPE_CHANGE:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  40  	case NETDEV_POST_TYPE_CHANGE:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  41  	case NETDEV_POST_INIT:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  42  	case NETDEV_PRE_UNINIT:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  43  	case NETDEV_RELEASE:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  44  	case NETDEV_NOTIFY_PEERS:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  45  	case NETDEV_JOIN:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  46  	case NETDEV_CHANGEUPPER:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  47  	case NETDEV_RESEND_IGMP:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  48  	case NETDEV_PRECHANGEMTU:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  49  	case NETDEV_CHANGEINFODATA:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  50  	case NETDEV_BONDING_INFO:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  51  	case NETDEV_PRECHANGEUPPER:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  52  	case NETDEV_CHANGELOWERSTATE:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  53  	case NETDEV_UDP_TUNNEL_PUSH_INFO:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  54  	case NETDEV_UDP_TUNNEL_DROP_INFO:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  55  	case NETDEV_CHANGE_TX_QUEUE_LEN:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  56  	case NETDEV_CVLAN_FILTER_PUSH_INFO:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  57  	case NETDEV_CVLAN_FILTER_DROP_INFO:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  58  	case NETDEV_SVLAN_FILTER_PUSH_INFO:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  59  	case NETDEV_SVLAN_FILTER_DROP_INFO:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  60  	case NETDEV_OFFLOAD_XSTATS_ENABLE:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  61  	case NETDEV_OFFLOAD_XSTATS_DISABLE:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  62  	case NETDEV_OFFLOAD_XSTATS_REPORT_USED:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  63  	case NETDEV_OFFLOAD_XSTATS_REPORT_DELTA:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  64  		ASSERT_RTNL();
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  65  		break;
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  66  
be94cfdb993ff0 net/core/rtnl_net_debug.c Kuniyuki Iwashima  2025-01-15  67  	case NETDEV_CHANGENAME:
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  68  		ASSERT_RTNL_NET(net);
be94cfdb993ff0 net/core/rtnl_net_debug.c Kuniyuki Iwashima  2025-01-15  69  		break;
be94cfdb993ff0 net/core/rtnl_net_debug.c Kuniyuki Iwashima  2025-01-15  70  	}
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  71  
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  72  	return NOTIFY_DONE;
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  73  }
1901066aab7654 net/core/lock_debug.c     Stanislav Fomichev 2025-04-01  74  EXPORT_SYMBOL_NS_GPL(netdev_debug_event, "NETDEV_INTERNAL");
03fa534856593b net/core/rtnl_net_debug.c Kuniyuki Iwashima  2024-10-04  75  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
