Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D729192B84
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 23:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729378811; cv=none; b=T3KNbafSj4GbwDnqsxJdj4lKLjLCHdm5ofYAXGW4mPZI2aGnzMD0WZdbynDjREbM+YnVgWq20LeWxxT31xf6xuBXuoV0F9GBkm0NIl3SXmGiy8chUhFWzroygbVhlR/0FjD4E2ouEbhhYLXiW9RWePpsSfkSt/0EzuxMrdH9iwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729378811; c=relaxed/simple;
	bh=4Zf0hmLiI660MDGGJCXAGH0gboX7IjSl74L3md8rYRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIxfL3bx7CGSL/DjgaCFD9Cq6bSaXAmK8RYbm4EiZUU7SHU22K1WXkuCyEyH/GN3wXALLEAnEragZuSDOlcNMe1TxKmVog7YAKbqGEmwsboLkUImLXJ6tUsrgU7iXntkMiN/tv+J9HEAMIRoPT2KLRw4XWkdfOasgX3yYzjzbF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4HAXIc1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4HAXIc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729378809; x=1760914809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Zf0hmLiI660MDGGJCXAGH0gboX7IjSl74L3md8rYRU=;
  b=J4HAXIc1fqt7HhfT7c762oi6kWcrrrJqS9HAF92L6zQGOxH6sc26OKwl
   S5fU8eyF571ZpLsvY0KFkB2JlZulXN7L9YNl2VyBvp1B7AxAMCQRZx2PJ
   ICnLucYIaSOOTXj35yZAH7be/vQtR4XHBXCxgw3NjD57V0QsSO3EwrC7y
   nwTod9oSpmrwyPynhx0UlsqZKJYeXCILbpORiXXZ4lyg9blnitcS9b+IJ
   pzBa8XBYl/Udv0Av0HNZSX7vLICKuCQQmo39wwCZaY0hTDSn53x8Ol3+j
   U6wM3s+XNsf/aWXGK76HBjlUzOBMxmjlheAPhD64ehS3AuG7zE74raO8E
   g==;
X-CSE-ConnectionGUID: Ko0lTO8DRjS51EOOPKSGUg==
X-CSE-MsgGUID: 8HwfedCnRE+YUjgDPnZzYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="40282442"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="40282442"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 16:00:07 -0700
X-CSE-ConnectionGUID: k8HbpntBQrCuwhn6GLhP+Q==
X-CSE-MsgGUID: VTp8BjJ9SH+zzDFZYJv1Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="83966234"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Oct 2024 16:00:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2IQT-000PdD-2x;
	Sat, 19 Oct 2024 23:00:01 +0000
Date: Sun, 20 Oct 2024 06:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Kuniyuki Iwashima <kuniyu@amazon.com>
Subject: Re: [PATCH v1 net-next 06/11] ipv4: Convert RTM_DELADDR to per-netns
 RTNL.
Message-ID: <202410200600.GGC28WrU-lkp@intel.com>
References: <20241018012225.90409-7-kuniyu@amazon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018012225.90409-7-kuniyu@amazon.com>

Hi Kuniyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/rtnetlink-Define-RTNL_FLAG_DOIT_PERNET-for-per-netns-RTNL-doit/20241018-092802
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241018012225.90409-7-kuniyu%40amazon.com
patch subject: [PATCH v1 net-next 06/11] ipv4: Convert RTM_DELADDR to per-netns RTNL.
config: x86_64-randconfig-122-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200600.GGC28WrU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200600.GGC28WrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200600.GGC28WrU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/devinet.c:676:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *p @@     got struct in_ifaddr [noderef] __rcu * @@
   net/ipv4/devinet.c:676:47: sparse:     expected void *p
   net/ipv4/devinet.c:676:47: sparse:     got struct in_ifaddr [noderef] __rcu *
   net/ipv4/devinet.c:946:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *p @@     got struct in_ifaddr [noderef] __rcu *ifa_list @@
   net/ipv4/devinet.c:946:9: sparse:     expected void *p
   net/ipv4/devinet.c:946:9: sparse:     got struct in_ifaddr [noderef] __rcu *ifa_list
   net/ipv4/devinet.c:946:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *p @@     got struct in_ifaddr [noderef] __rcu *ifa_next @@
   net/ipv4/devinet.c:946:9: sparse:     expected void *p
   net/ipv4/devinet.c:946:9: sparse:     got struct in_ifaddr [noderef] __rcu *ifa_next
   net/ipv4/devinet.c: note: in included file (through include/linux/inetdevice.h):
   include/linux/rtnetlink.h:147:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rtnetlink.h:147:16: sparse:    void [noderef] __rcu *
   include/linux/rtnetlink.h:147:16: sparse:    void *
   include/linux/rtnetlink.h:147:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rtnetlink.h:147:16: sparse:    void [noderef] __rcu *
   include/linux/rtnetlink.h:147:16: sparse:    void *
   include/linux/rtnetlink.h:147:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rtnetlink.h:147:16: sparse:    void [noderef] __rcu *
   include/linux/rtnetlink.h:147:16: sparse:    void *
   include/linux/rtnetlink.h:147:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rtnetlink.h:147:16: sparse:    void [noderef] __rcu *
   include/linux/rtnetlink.h:147:16: sparse:    void *

vim +676 net/ipv4/devinet.c

   647	
   648	static int inet_rtm_deladdr(struct sk_buff *skb, struct nlmsghdr *nlh,
   649				    struct netlink_ext_ack *extack)
   650	{
   651		struct net *net = sock_net(skb->sk);
   652		struct in_ifaddr __rcu **ifap;
   653		struct nlattr *tb[IFA_MAX+1];
   654		struct in_device *in_dev;
   655		struct ifaddrmsg *ifm;
   656		struct in_ifaddr *ifa;
   657		int err;
   658	
   659		err = nlmsg_parse_deprecated(nlh, sizeof(*ifm), tb, IFA_MAX,
   660					     ifa_ipv4_policy, extack);
   661		if (err < 0)
   662			goto out;
   663	
   664		ifm = nlmsg_data(nlh);
   665	
   666		rtnl_net_lock(net);
   667	
   668		in_dev = inetdev_by_index(net, ifm->ifa_index);
   669		if (!in_dev) {
   670			NL_SET_ERR_MSG(extack, "ipv4: Device not found");
   671			err = -ENODEV;
   672			goto unlock;
   673		}
   674	
   675		for (ifap = &in_dev->ifa_list;
 > 676		     (ifa = rtnl_net_dereference(net, *ifap)) != NULL;
   677		     ifap = &ifa->ifa_next) {
   678			if (tb[IFA_LOCAL] &&
   679			    ifa->ifa_local != nla_get_in_addr(tb[IFA_LOCAL]))
   680				continue;
   681	
   682			if (tb[IFA_LABEL] && nla_strcmp(tb[IFA_LABEL], ifa->ifa_label))
   683				continue;
   684	
   685			if (tb[IFA_ADDRESS] &&
   686			    (ifm->ifa_prefixlen != ifa->ifa_prefixlen ||
   687			    !inet_ifa_match(nla_get_in_addr(tb[IFA_ADDRESS]), ifa)))
   688				continue;
   689	
   690			if (ipv4_is_multicast(ifa->ifa_address))
   691				ip_mc_autojoin_config(net, false, ifa);
   692	
   693			__inet_del_ifa(in_dev, ifap, 1, nlh, NETLINK_CB(skb).portid);
   694			goto unlock;
   695		}
   696	
   697		NL_SET_ERR_MSG(extack, "ipv4: Address not found");
   698		err = -EADDRNOTAVAIL;
   699	unlock:
   700		rtnl_net_unlock(net);
   701	out:
   702		return err;
   703	}
   704	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
