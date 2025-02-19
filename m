Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B651DED51
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 11:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739962919; cv=none; b=RmLdoGcMIZoyBEV0RRCtVanSf7hEiyWcnd0uphckuDck93D4eb/XFg/UiZu2P1qoGAdRbXVzqmLlikiI4BSULuY5JAnWqYMR9Lp6m/GCordYrgkZgLi5JHrrS0ls81mZEt9HTtjsa4+FxTGt6GEsMkmqI3GiArdpB9JcGK0+yC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739962919; c=relaxed/simple;
	bh=tUCMCO82BGEsMT3286MqzFwYvnKyIwv7Y3nVsbgR//I=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TR5b0u4HQ92fK/hBOJ076i/da1vECUBxGT58P0jOgIJEuANo5mGQTCyKOToQAt+25OK+NHN0O2eI79NhProUF/VJMi4kjHyV6ALWtV6fnrRm/idVOFSmmqwd7qfawhM4njRAyWqNjxgZA3y2NupkzUPp5dFc5+h+TvpZznI11Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbvTPy36; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbvTPy36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739962917; x=1771498917;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tUCMCO82BGEsMT3286MqzFwYvnKyIwv7Y3nVsbgR//I=;
  b=JbvTPy36GbfSibvY7y5nDRTmTtwJ+8Y0fnUyT5gFyE2fRE28nYDE7Df/
   mqH0XLvP2nmvQj0+pwh7qY54XHbPXvop7j4IujGWV3d9aABwpQ2vkQA7t
   GQhxH8PAzAT51NxxR7/IuKPRM3NTs9KLjdVNDXtslkn7Wayk0hYqTvWUJ
   Xqi13UhA0/PhCIISxX/0Ycy4v5lz91R7b9O4uqCdo94116eqnq+w/WabL
   Sxl+PJ45p/iCvwaWmSIqdKAIwGHpfILvmNBEQL95lS8lVeEHzuzqWQQEr
   I7D6qxlR2cDU3yGDbRUCRrZFjMUcP4GMZ9FNk3eID5mqv1p/7W0cVrN66
   A==;
X-CSE-ConnectionGUID: T3v8dwWOQhWc1eagfDkIpQ==
X-CSE-MsgGUID: abgAW62BSUKtXC+07porZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44610488"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="44610488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 03:01:57 -0800
X-CSE-ConnectionGUID: 9GjelNyzQ16KilYoikWJNg==
X-CSE-MsgGUID: YTObMF4oT/u/VFM1eZotrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="145540108"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Feb 2025 03:01:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkhpx-0002o7-1W
	for oe-kbuild-all@lists.linux.dev;
	Wed, 19 Feb 2025 11:01:53 +0000
Date: Wed, 19 Feb 2025 19:01:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] net/ipv4/ip_gre.c:944:6: warning: variable
 't_hlen' set but not used
Message-ID: <202502191913.qwbtwNjH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xin,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 29764acd50d33678883b1955334040bef563cd11 [1/1] ip_gre: fix IFLA_MTU ignored on NEWLINK
config: s390-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250219/202502191913.qwbtwNjH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191913.qwbtwNjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191913.qwbtwNjH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/percpu.h:13:0,
                    from include/linux/topology.h:34,
                    from include/linux/gfp.h:9,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from net/ipv4/ip_gre.c:16:
   include/net/sch_generic.h: In function 'qdisc_qstats_cpu_drop':
   arch/s390/include/asm/percpu.h:74:21: warning: comparison is always true due to limited range of data type [-Wtype-limits]
         ((szcast)val__ > -129) && ((szcast)val__ < 128)) {  \
                        ^
   arch/s390/include/asm/percpu.h:91:34: note: in expansion of macro 'arch_this_cpu_add'
    #define this_cpu_add_8(pcp, val) arch_this_cpu_add(pcp, val, "laag", "agsi", long)
                                     ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:367:11: note: in expansion of macro 'this_cpu_add_8'
      case 8: stem##8(variable, __VA_ARGS__);break;  \
              ^~~~
   include/linux/percpu-defs.h:496:33: note: in expansion of macro '__pcpu_size_call'
    #define this_cpu_add(pcp, val)  __pcpu_size_call(this_cpu_add_, pcp, val)
                                    ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:507:28: note: in expansion of macro 'this_cpu_add'
    #define this_cpu_inc(pcp)  this_cpu_add(pcp, 1)
                               ^~~~~~~~~~~~
   include/net/sch_generic.h:651:2: note: in expansion of macro 'this_cpu_inc'
     this_cpu_inc(sch->cpu_qstats->drops);
     ^~~~~~~~~~~~
   net/ipv4/ip_gre.c: In function 'ipgre_err':
   net/ipv4/ip_gre.c:145:15: warning: variable 'data_len' set but not used [-Wunused-but-set-variable]
     unsigned int data_len = 0;
                  ^~~~~~~~
   net/ipv4/ip_gre.c: In function '__gre_tunnel_init':
>> net/ipv4/ip_gre.c:944:6: warning: variable 't_hlen' set but not used [-Wunused-but-set-variable]
     int t_hlen;
         ^~~~~~
   net/ipv4/ip_gre.c: In function 'erspan_tunnel_init':
   net/ipv4/ip_gre.c:1245:6: warning: variable 't_hlen' set but not used [-Wunused-but-set-variable]
     int t_hlen;
         ^~~~~~


vim +/t_hlen +944 net/ipv4/ip_gre.c

c5441932145563 Pravin B Shelar 2013-03-25  940  
c5441932145563 Pravin B Shelar 2013-03-25  941  static void __gre_tunnel_init(struct net_device *dev)
c5441932145563 Pravin B Shelar 2013-03-25  942  {
c5441932145563 Pravin B Shelar 2013-03-25  943  	struct ip_tunnel *tunnel;
4565e9919cda74 Tom Herbert     2014-09-17 @944  	int t_hlen;
c5441932145563 Pravin B Shelar 2013-03-25  945  
c5441932145563 Pravin B Shelar 2013-03-25  946  	tunnel = netdev_priv(dev);
95f5c64c3c13a6 Tom Herbert     2016-04-29  947  	tunnel->tun_hlen = gre_calc_hlen(tunnel->parms.o_flags);
c5441932145563 Pravin B Shelar 2013-03-25  948  	tunnel->parms.iph.protocol = IPPROTO_GRE;
^1da177e4c3f41 Linus Torvalds  2005-04-16  949  
4565e9919cda74 Tom Herbert     2014-09-17  950  	tunnel->hlen = tunnel->tun_hlen + tunnel->encap_hlen;
4565e9919cda74 Tom Herbert     2014-09-17  951  
4565e9919cda74 Tom Herbert     2014-09-17  952  	t_hlen = tunnel->hlen + sizeof(struct iphdr);
4565e9919cda74 Tom Herbert     2014-09-17  953  
b57708add31494 Nicolas Dichtel 2014-04-22  954  	dev->features		|= GRE_FEATURES;
6b78f16e4bdde3 Eric Dumazet    2012-09-13  955  	dev->hw_features	|= GRE_FEATURES;
c5441932145563 Pravin B Shelar 2013-03-25  956  
c5441932145563 Pravin B Shelar 2013-03-25  957  	if (!(tunnel->parms.o_flags & TUNNEL_SEQ)) {
a0ca153f98db8c Alexander Duyck 2016-04-05  958  		/* TCP offload with GRE SEQ is not supported, nor
a0ca153f98db8c Alexander Duyck 2016-04-05  959  		 * can we support 2 levels of outer headers requiring
a0ca153f98db8c Alexander Duyck 2016-04-05  960  		 * an update.
a0ca153f98db8c Alexander Duyck 2016-04-05  961  		 */
a0ca153f98db8c Alexander Duyck 2016-04-05  962  		if (!(tunnel->parms.o_flags & TUNNEL_CSUM) ||
a0ca153f98db8c Alexander Duyck 2016-04-05  963  		    (tunnel->encap.type == TUNNEL_ENCAP_NONE)) {
c5441932145563 Pravin B Shelar 2013-03-25  964  			dev->features    |= NETIF_F_GSO_SOFTWARE;
c5441932145563 Pravin B Shelar 2013-03-25  965  			dev->hw_features |= NETIF_F_GSO_SOFTWARE;
a0ca153f98db8c Alexander Duyck 2016-04-05  966  		}
a0ca153f98db8c Alexander Duyck 2016-04-05  967  
c5441932145563 Pravin B Shelar 2013-03-25  968  		/* Can use a lockless transmit, unless we generate
c5441932145563 Pravin B Shelar 2013-03-25  969  		 * output sequences
c5441932145563 Pravin B Shelar 2013-03-25  970  		 */
c5441932145563 Pravin B Shelar 2013-03-25  971  		dev->features |= NETIF_F_LLTX;
c5441932145563 Pravin B Shelar 2013-03-25  972  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  973  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  974  

:::::: The code at line 944 was first introduced by commit
:::::: 4565e9919cda747815547e2e5d7b78f15efbffdf gre: Setup and TX path for gre/UDP foo-over-udp encapsulation

:::::: TO: Tom Herbert <therbert@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
