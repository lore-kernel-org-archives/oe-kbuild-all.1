Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8864E79DC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 06:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709447124; cv=none; b=kvY5NuzH8vcya9LfUjeO+DDPhQrqggQwoKZw1bzGKrqZSwSQj1XKhBbBol/g6MipNYF6L9qLjILz3cqzbaoUExAUA4tF+R1CFpjTgi4zWrG/pTGFurzlbatN+l3ZzihXDnatfxEkrRGoMRV9VVx23H0E0kmrirUwSnIlYQrXLw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709447124; c=relaxed/simple;
	bh=yQ5j9ZMiDXDzRNn0N9XRtdj7h2AkycRzF4+/DRWsu4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JiVaqDcNC8TJ9rTZzfOxkZB4+Ly7XXIrLTEzNcZ8IxLnzLJ1kAZogOQKwfzkziOQ4hxAS87EZFWHuUVzGSjlURrlLvQEYjylFBXe/VKLCFcFQmfOJ22DfQDe7U21lA7T1NorvJdC/OVWuL5lWnETvWujeTODSGuTk+TU9PZ9oro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjrmyM1u; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjrmyM1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709447123; x=1740983123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yQ5j9ZMiDXDzRNn0N9XRtdj7h2AkycRzF4+/DRWsu4k=;
  b=cjrmyM1uneek2XLEavX2RLvd+TGMuK58vj9qaZi6oZjPU1wVhLUC8jt7
   r81I6dmcUuG7PqoMNhNE+CN6J7kTzFTNZVXrEv+kSMecqURRmjz3sFBzn
   +2qt5XCcSmpWOdaeieqnUWPhjm2EX6LBHN+NF1ojwgWoq0xCaB8+DpCCV
   5b8NYrykF4CthArG5x8qzw4x3gDQHYv9Gp0jouJhvxmZPISonzuwIm6J0
   6zxmamgusUdRKMgu5VpFFBSQJa1lv5u3R/lbdt4fzekGt91NesAT4xdxF
   VkJ4/Cm4kRzyazYkB5ProNQbXvK8W5ccbV2cBNYLJSUO7MtmZ85WDGTF0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14529980"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="14529980"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 22:25:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8578801"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Mar 2024 22:25:20 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgfHh-0000sg-1I;
	Sun, 03 Mar 2024 06:25:17 +0000
Date: Sun, 3 Mar 2024 14:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@nvidia.com>
Subject: [linux-next:master 9955/11394]
 drivers/net/wireless/ath/ath11k/mac.c:9053:21: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202403031427.SUfiTN3w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1870cdc0e8dee32e3c221704a2977898ba4c10e8
commit: c3718936ec47ae811a7ce9a618b6cb1cda835bab [9955/11394] ipv6: anycast: complete RCU handling of struct ifacaddr6
config: i386-randconfig-r121-20240302 (https://download.01.org/0day-ci/archive/20240303/202403031427.SUfiTN3w-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031427.SUfiTN3w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031427.SUfiTN3w-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath11k/mac.c:9053:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ifacaddr6 *ifaca6 @@     got struct ifacaddr6 [noderef] __rcu *ac_list @@
   drivers/net/wireless/ath/ath11k/mac.c:9053:21: sparse:     expected struct ifacaddr6 *ifaca6
   drivers/net/wireless/ath/ath11k/mac.c:9053:21: sparse:     got struct ifacaddr6 [noderef] __rcu *ac_list
>> drivers/net/wireless/ath/ath11k/mac.c:9053:53: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ifacaddr6 *ifaca6 @@     got struct ifacaddr6 [noderef] __rcu *aca_next @@
   drivers/net/wireless/ath/ath11k/mac.c:9053:53: sparse:     expected struct ifacaddr6 *ifaca6
   drivers/net/wireless/ath/ath11k/mac.c:9053:53: sparse:     got struct ifacaddr6 [noderef] __rcu *aca_next

vim +9053 drivers/net/wireless/ath/ath11k/mac.c

c3c36bfe998b3a Carl Huang 2022-03-14  9005  
c3c36bfe998b3a Carl Huang 2022-03-14  9006  static void ath11k_mac_op_ipv6_changed(struct ieee80211_hw *hw,
c3c36bfe998b3a Carl Huang 2022-03-14  9007  				       struct ieee80211_vif *vif,
c3c36bfe998b3a Carl Huang 2022-03-14  9008  				       struct inet6_dev *idev)
c3c36bfe998b3a Carl Huang 2022-03-14  9009  {
c3c36bfe998b3a Carl Huang 2022-03-14  9010  	struct ath11k *ar = hw->priv;
c3c36bfe998b3a Carl Huang 2022-03-14  9011  	struct ath11k_arp_ns_offload *offload;
c3c36bfe998b3a Carl Huang 2022-03-14  9012  	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
c3c36bfe998b3a Carl Huang 2022-03-14  9013  	struct inet6_ifaddr *ifa6;
c3c36bfe998b3a Carl Huang 2022-03-14  9014  	struct ifacaddr6 *ifaca6;
c3c36bfe998b3a Carl Huang 2022-03-14  9015  	struct list_head *p;
c3c36bfe998b3a Carl Huang 2022-03-14  9016  	u32 count, scope;
c3c36bfe998b3a Carl Huang 2022-03-14  9017  
fc3b984a7d99bc Kalle Valo 2023-06-09  9018  	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "op ipv6 changed\n");
c3c36bfe998b3a Carl Huang 2022-03-14  9019  
c3c36bfe998b3a Carl Huang 2022-03-14  9020  	offload = &arvif->arp_ns_offload;
c3c36bfe998b3a Carl Huang 2022-03-14  9021  	count = 0;
c3c36bfe998b3a Carl Huang 2022-03-14  9022  
c3c36bfe998b3a Carl Huang 2022-03-14  9023  	read_lock_bh(&idev->lock);
c3c36bfe998b3a Carl Huang 2022-03-14  9024  
c3c36bfe998b3a Carl Huang 2022-03-14  9025  	memset(offload->ipv6_addr, 0, sizeof(offload->ipv6_addr));
c3c36bfe998b3a Carl Huang 2022-03-14  9026  	memset(offload->self_ipv6_addr, 0, sizeof(offload->self_ipv6_addr));
c3c36bfe998b3a Carl Huang 2022-03-14  9027  	memcpy(offload->mac_addr, vif->addr, ETH_ALEN);
c3c36bfe998b3a Carl Huang 2022-03-14  9028  
c3c36bfe998b3a Carl Huang 2022-03-14  9029  	/* get unicast address */
c3c36bfe998b3a Carl Huang 2022-03-14  9030  	list_for_each(p, &idev->addr_list) {
c3c36bfe998b3a Carl Huang 2022-03-14  9031  		if (count >= ATH11K_IPV6_MAX_COUNT)
c3c36bfe998b3a Carl Huang 2022-03-14  9032  			goto generate;
c3c36bfe998b3a Carl Huang 2022-03-14  9033  
c3c36bfe998b3a Carl Huang 2022-03-14  9034  		ifa6 = list_entry(p, struct inet6_ifaddr, if_list);
c3c36bfe998b3a Carl Huang 2022-03-14  9035  		if (ifa6->flags & IFA_F_DADFAILED)
c3c36bfe998b3a Carl Huang 2022-03-14  9036  			continue;
c3c36bfe998b3a Carl Huang 2022-03-14  9037  		scope = ipv6_addr_src_scope(&ifa6->addr);
c3c36bfe998b3a Carl Huang 2022-03-14  9038  		if (scope == IPV6_ADDR_SCOPE_LINKLOCAL ||
c3c36bfe998b3a Carl Huang 2022-03-14  9039  		    scope == IPV6_ADDR_SCOPE_GLOBAL) {
c3c36bfe998b3a Carl Huang 2022-03-14  9040  			memcpy(offload->ipv6_addr[count], &ifa6->addr.s6_addr,
c3c36bfe998b3a Carl Huang 2022-03-14  9041  			       sizeof(ifa6->addr.s6_addr));
c3c36bfe998b3a Carl Huang 2022-03-14  9042  			offload->ipv6_type[count] = ATH11K_IPV6_UC_TYPE;
fc3b984a7d99bc Kalle Valo 2023-06-09  9043  			ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "count %d ipv6 uc %pI6 scope %d\n",
c3c36bfe998b3a Carl Huang 2022-03-14  9044  				   count, offload->ipv6_addr[count],
c3c36bfe998b3a Carl Huang 2022-03-14  9045  				   scope);
c3c36bfe998b3a Carl Huang 2022-03-14  9046  			count++;
c3c36bfe998b3a Carl Huang 2022-03-14  9047  		} else {
c3c36bfe998b3a Carl Huang 2022-03-14  9048  			ath11k_warn(ar->ab, "Unsupported ipv6 scope: %d\n", scope);
c3c36bfe998b3a Carl Huang 2022-03-14  9049  		}
c3c36bfe998b3a Carl Huang 2022-03-14  9050  	}
c3c36bfe998b3a Carl Huang 2022-03-14  9051  
c3c36bfe998b3a Carl Huang 2022-03-14  9052  	/* get anycast address */
c3c36bfe998b3a Carl Huang 2022-03-14 @9053  	for (ifaca6 = idev->ac_list; ifaca6; ifaca6 = ifaca6->aca_next) {
c3c36bfe998b3a Carl Huang 2022-03-14  9054  		if (count >= ATH11K_IPV6_MAX_COUNT)
c3c36bfe998b3a Carl Huang 2022-03-14  9055  			goto generate;
c3c36bfe998b3a Carl Huang 2022-03-14  9056  
c3c36bfe998b3a Carl Huang 2022-03-14  9057  		scope = ipv6_addr_src_scope(&ifaca6->aca_addr);
c3c36bfe998b3a Carl Huang 2022-03-14  9058  		if (scope == IPV6_ADDR_SCOPE_LINKLOCAL ||
c3c36bfe998b3a Carl Huang 2022-03-14  9059  		    scope == IPV6_ADDR_SCOPE_GLOBAL) {
c3c36bfe998b3a Carl Huang 2022-03-14  9060  			memcpy(offload->ipv6_addr[count], &ifaca6->aca_addr,
c3c36bfe998b3a Carl Huang 2022-03-14  9061  			       sizeof(ifaca6->aca_addr));
c3c36bfe998b3a Carl Huang 2022-03-14  9062  			offload->ipv6_type[count] = ATH11K_IPV6_AC_TYPE;
fc3b984a7d99bc Kalle Valo 2023-06-09  9063  			ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "count %d ipv6 ac %pI6 scope %d\n",
c3c36bfe998b3a Carl Huang 2022-03-14  9064  				   count, offload->ipv6_addr[count],
c3c36bfe998b3a Carl Huang 2022-03-14  9065  				   scope);
c3c36bfe998b3a Carl Huang 2022-03-14  9066  			count++;
c3c36bfe998b3a Carl Huang 2022-03-14  9067  		} else {
c3c36bfe998b3a Carl Huang 2022-03-14  9068  			ath11k_warn(ar->ab, "Unsupported ipv scope: %d\n", scope);
c3c36bfe998b3a Carl Huang 2022-03-14  9069  		}
c3c36bfe998b3a Carl Huang 2022-03-14  9070  	}
c3c36bfe998b3a Carl Huang 2022-03-14  9071  
c3c36bfe998b3a Carl Huang 2022-03-14  9072  generate:
c3c36bfe998b3a Carl Huang 2022-03-14  9073  	offload->ipv6_count = count;
c3c36bfe998b3a Carl Huang 2022-03-14  9074  	read_unlock_bh(&idev->lock);
c3c36bfe998b3a Carl Huang 2022-03-14  9075  
c3c36bfe998b3a Carl Huang 2022-03-14  9076  	/* generate ns multicast address */
c3c36bfe998b3a Carl Huang 2022-03-14  9077  	ath11k_generate_ns_mc_addr(ar, offload);
c3c36bfe998b3a Carl Huang 2022-03-14  9078  }
67888630addeaa YueHaibing 2022-04-11  9079  #endif
c3c36bfe998b3a Carl Huang 2022-03-14  9080  

:::::: The code at line 9053 was first introduced by commit
:::::: c3c36bfe998b3ad14aa87a57037a05d861889ac8 ath11k: support ARP and NS offload

:::::: TO: Carl Huang <quic_cjhuang@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
