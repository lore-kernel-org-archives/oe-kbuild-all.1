Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E16226286
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 23:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710286589; cv=none; b=TsF3HrfkoyadbiInSkkovIgeZbJVL8oSsuTLCOD1tNJosNxZTz6JuoyBAE+08gq6oCYeOEN8tc5zXFNnRylx1ISsKhnvxCOyjTI0n66HBj0nt/dhLA/56u9PNWpg/6K0bSqMQ56m/JHCO1W48AHXhP+ktlBYP8k5irmcpkhLiOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710286589; c=relaxed/simple;
	bh=YO0nwRbuSKfxHCgjTfexS6L/Ys9CoadV0/JQalQ7GrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bC95kReir7N0uOkAViaGqZUnk6WN56U6IPtLutteAk4fxoffe0p8DpDqO/vD7Xl350uF3aOOYq7pPxPmfRMbYKaYoIW2zQ9rWL+HedbnIq2WnjuWLBaykNLytppgraX6R6NdOuXs8IcpCSAXpvyL/kxgFQr7zpHJ2DpcigSOpHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c6BXsUft; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c6BXsUft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710286587; x=1741822587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YO0nwRbuSKfxHCgjTfexS6L/Ys9CoadV0/JQalQ7GrA=;
  b=c6BXsUftMGcaNxmIxCLJCW2771dBLB+md07MxMvfGukyx6zRZCkAQqg1
   Z0xwsBHb221U99DhWktKij4c21hl5cv0IMB+CsKro4DosHqR1IaI6KGNf
   u07oikLmKsL0kBIxpXeC2hUpFQZAx0xIFmd6Mmi8mC2s7mEGJP1M7etJ2
   X1DpeH9TBvIyGVwMRCdLfgx4apsqc4WY1zUa+c22kxDpiX1en/2DxGpZE
   XH+DLzST/w1KFrSGdHZQ2cArGwpRT/Ig7AJJzhM7GOD6DwrDVe093imGA
   TwwL83FTRCvjnyV0jTHRifv60VgJs06NXowX+6yg3wByTKjbPxQHAxUQL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16171459"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16171459"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 16:36:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16354687"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Mar 2024 16:36:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkBfS-000Bmx-2c;
	Tue, 12 Mar 2024 23:36:22 +0000
Date: Wed, 13 Mar 2024 07:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>, Ulrich Hecht <uli@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rc 1999/2011]
 drivers/net/bonding/bond_alb.c:989:12: warning: 'return' with a value, in
 function returning void
Message-ID: <202403130724.dcllwgDI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
head:   140bf69dc64d0cace758052e3af9e9cc3e90a09f
commit: 70118efdad67c6a58eb26267dc4cf53794687180 [1999/2011] bonding: return -ENOMEM instead of BUG in alb_upper_dev_walk
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240313/202403130724.dcllwgDI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403130724.dcllwgDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403130724.dcllwgDI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/netdevice.h:3310:37: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >= (sizeof(u32) * 8))
                                        ^~
   In file included from include/linux/writeback.h:192:0,
                    from include/linux/memcontrol.h:30,
                    from include/net/sock.h:58,
                    from include/linux/tcp.h:22,
                    from include/linux/ipv6.h:72,
                    from drivers/net/bonding/bond_alb.c:30:
   include/linux/bio.h: In function 'bio_next_split':
   include/linux/bio.h:424:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (sectors >= bio_sectors(bio))
                 ^~
   In file included from include/net/rtnetlink.h:5:0,
                    from include/net/sch_generic.h:12,
                    from include/linux/filter.h:16,
                    from include/net/sock.h:62,
                    from include/linux/tcp.h:22,
                    from include/linux/ipv6.h:72,
                    from drivers/net/bonding/bond_alb.c:30:
   include/net/netlink.h: In function 'nlmsg_ok':
   include/net/netlink.h:337:18: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      nlh->nlmsg_len <= remaining);
                     ^~
   include/net/netlink.h: In function 'nlmsg_parse':
   include/net/netlink.h:372:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
                        ^
   include/net/netlink.h: In function 'nlmsg_validate':
   include/net/netlink.h:405:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
                        ^
   In file included from include/net/sch_generic.h:12:0,
                    from include/linux/filter.h:16,
                    from include/net/sock.h:62,
                    from include/linux/tcp.h:22,
                    from include/linux/ipv6.h:72,
                    from drivers/net/bonding/bond_alb.c:30:
   include/net/rtnetlink.h: In function 'rtnl_msg_family':
   include/net/rtnetlink.h:20:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlmsg_len(nlh) >= sizeof(struct rtgenmsg))
                        ^~
   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from include/linux/skbuff.h:17,
                    from drivers/net/bonding/bond_alb.c:22:
   include/net/sch_generic.h: In function 'qdisc_cb_private_validate':
   include/net/sch_generic.h:267:33: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     BUILD_BUG_ON(sizeof(qcb->data) < sz);
                                    ^
   include/linux/compiler.h:493:19: note: in definition of macro '__compiletime_assert'
      bool __cond = !(condition);    \
                      ^~~~~~~~~
   include/linux/compiler.h:513:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/bug.h:50:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bug.h:74:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/net/sch_generic.h:267:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(sizeof(qcb->data) < sz);
     ^~~~~~~~~~~~
   In file included from include/net/sock.h:62:0,
                    from include/linux/tcp.h:22,
                    from include/linux/ipv6.h:72,
                    from drivers/net/bonding/bond_alb.c:30:
   include/linux/filter.h: In function 'bpf_needs_clear_a':
   include/linux/filter.h:517:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (first->k == SKF_AD_OFF + SKF_AD_ALU_XOR_X)
                   ^~
   In file included from include/linux/tcp.h:22:0,
                    from include/linux/ipv6.h:72,
                    from drivers/net/bonding/bond_alb.c:30:
   include/net/sock.h: In function 'skb_do_copy_data_nocache':
   include/net/sock.h:1859:54: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (csum_and_copy_from_iter(to, copy, &csum, from) != copy)
                                                         ^~
   include/net/sock.h:1863:46: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (copy_from_iter_nocache(to, copy, from) != copy)
                                                 ^~
   include/net/sock.h:1865:44: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     } else if (copy_from_iter(to, copy, from) != copy)
                                               ^~
   In file included from include/linux/tcp.h:23:0,
                    from include/linux/ipv6.h:72,
                    from drivers/net/bonding/bond_alb.c:30:
   include/net/inet_connection_sock.h: In function 'inet_csk_reqsk_queue_is_full':
   include/net/inet_connection_sock.h:294:38: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return inet_csk_reqsk_queue_len(sk) >= sk->sk_max_ack_backlog;
                                         ^~
   In file included from include/net/bonding.h:29:0,
                    from drivers/net/bonding/bond_alb.c:40:
   include/net/bond_3ad.h: In function 'bond_3ad_churn_desc':
   include/net/bond_3ad.h:288:12: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (state >= max_size)
               ^~
   drivers/net/bonding/bond_alb.c: In function 'alb_send_learning_packets':
>> drivers/net/bonding/bond_alb.c:989:12: warning: 'return' with a value, in function returning void
        return -ENOMEM;
               ^
   drivers/net/bonding/bond_alb.c:953:13: note: declared here
    static void alb_send_learning_packets(struct slave *slave, u8 mac_addr[],
                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_alb.c:1213: warning: No description found for parameter 'bond'


vim +/return +989 drivers/net/bonding/bond_alb.c

   952	
   953	static void alb_send_learning_packets(struct slave *slave, u8 mac_addr[],
   954					      bool strict_match)
   955	{
   956		struct bonding *bond = bond_get_bond_by_slave(slave);
   957		struct net_device *upper;
   958		struct list_head *iter;
   959		struct bond_vlan_tag *tags;
   960	
   961		/* send untagged */
   962		alb_send_lp_vid(slave, mac_addr, 0, 0);
   963	
   964		/* loop through all devices and see if we need to send a packet
   965		 * for that device.
   966		 */
   967		rcu_read_lock();
   968		netdev_for_each_all_upper_dev_rcu(bond->dev, upper, iter) {
   969			if (is_vlan_dev(upper) && vlan_get_encap_level(upper) == 0) {
   970				if (strict_match &&
   971				    ether_addr_equal_64bits(mac_addr,
   972							    upper->dev_addr)) {
   973					alb_send_lp_vid(slave, mac_addr,
   974							vlan_dev_vlan_proto(upper),
   975							vlan_dev_vlan_id(upper));
   976				} else if (!strict_match) {
   977					alb_send_lp_vid(slave, upper->dev_addr,
   978							vlan_dev_vlan_proto(upper),
   979							vlan_dev_vlan_id(upper));
   980				}
   981			}
   982	
   983			/* If this is a macvlan device, then only send updates
   984			 * when strict_match is turned off.
   985			 */
   986			if (netif_is_macvlan(upper) && !strict_match) {
   987				tags = bond_verify_device_path(bond->dev, upper, 0);
   988				if (IS_ERR_OR_NULL(tags))
 > 989					return -ENOMEM;
   990	
   991				alb_send_lp_vid(slave, upper->dev_addr,
   992						tags[0].vlan_proto, tags[0].vlan_id);
   993				kfree(tags);
   994			}
   995		}
   996		rcu_read_unlock();
   997	}
   998	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
