Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C369780034
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 19:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724701351; cv=none; b=Fna2AnYUmgBS8+pQeC/4eI6Yd68Et2NtEa5e1nvJygby/HjlkcmD0ATlH/TG796gIuODXgjFr7N8L9BKgvHUgprUs6qse6zDIBS4QsgzcLSpm9geVgP22SIJO1I85nHKf9jkKHFI5uqfcVJqFQp+4wPee1v/hF32RhFaU5mzI74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724701351; c=relaxed/simple;
	bh=N6uqC26S97aUFR1rg8f1I8E6keV2GaAv/apRdjorlnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6vGfzq11zvri0OnpgMYU0xUtyKRb5C0efyAASLqgDYh8WvEMKSw2aWyI0wlCYkUFAUSw2TznlivgcSinv5SesnZf9NfsDqBmz3QcFN5niAZ3QpDe/Ue31I0mCzdi4Oj2nZcdhszonLurv+15aCPQ0y6nc0Yu0ARt0PmsUgRgZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0xH8Tip; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0xH8Tip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724701348; x=1756237348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N6uqC26S97aUFR1rg8f1I8E6keV2GaAv/apRdjorlnc=;
  b=L0xH8Tip1Fqfs/2I+JhCehNHuzM1MZ0oPld+D4I3YaU5YuUNHvuNKKcb
   IFkS0P5grpnlcIOoroydDgh6241o86QtmjSVMlZK37JpcuIGi77Me14p+
   PwBE/LWHoj5hgVXbZM1YIZxtTauewW3Oj7QtUOc/0KULURPUUPcflLV0E
   Q+wn/vJG8QUxQwGSjwRyaDs5zBgQCl29cz5nePaa9pTJrl4gCL/xCTVIp
   8ZEsDvuJaw5sPD1h0JKKG1V2DXBJV6FjGW3LoNNH9hFk04ajV+i3ZQ8w5
   7Z4z+3KZ7N6pmTAZKttFwhSAdlXDrlxm6pevHRQB7LDNHbGxlZB9R+BzA
   w==;
X-CSE-ConnectionGUID: yiC7/Ti4SaCNda1lc9MkBw==
X-CSE-MsgGUID: mqvh+4NORfGf9csp5GdBxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="34523040"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="34523040"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 12:42:28 -0700
X-CSE-ConnectionGUID: m0nwf7tOR3O/3DRz/5Tgsw==
X-CSE-MsgGUID: TEMci3R3Rv6uqTxwNFRxvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="100121295"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Aug 2024 12:42:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sifbb-000HXy-1t;
	Mon, 26 Aug 2024 19:42:23 +0000
Date: Tue, 27 Aug 2024 03:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: jiping huang <huangjiping95@qq.com>, davem@davemloft.net,
	dsahern@kernel.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, jiping huang <huangjiping95@qq.com>
Subject: Re: [PATCH] net: Remove a local variable with the same name as the
 parameter.
Message-ID: <202408270307.mdO3OvJy-lkp@intel.com>
References: <tencent_155F5603C098FE823F48F8918122C3783107@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_155F5603C098FE823F48F8918122C3783107@qq.com>

Hi jiping,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master v6.11-rc5 next-20240826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jiping-huang/net-Remove-a-local-variable-with-the-same-name-as-the-parameter/20240826-165617
base:   net-next/main
patch link:    https://lore.kernel.org/r/tencent_155F5603C098FE823F48F8918122C3783107%40qq.com
patch subject: [PATCH] net: Remove a local variable with the same name as the parameter.
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240827/202408270307.mdO3OvJy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408270307.mdO3OvJy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408270307.mdO3OvJy-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/fib_semantics.c: In function 'fib_dump_info':
>> net/ipv4/fib_semantics.c:1832:57: error: passing argument 4 of 'fib_nexthop_info' from incompatible pointer type [-Wincompatible-pointer-types]
    1832 |                 if (fib_nexthop_info(skb, nhc, AF_INET, &rtm->rtm_flags, false) < 0)
         |                                                         ^~~~~~~~~~~~~~~
         |                                                         |
         |                                                         unsigned int *
   net/ipv4/fib_semantics.c:1635:51: note: expected 'unsigned char *' but argument is of type 'unsigned int *'
    1635 |                      u8 rt_family, unsigned char *flags, bool skip_oif)
         |                                    ~~~~~~~~~~~~~~~^~~~~


vim +/fib_nexthop_info +1832 net/ipv4/fib_semantics.c

  1777	
  1778	int fib_dump_info(struct sk_buff *skb, u32 portid, u32 seq, int event,
  1779			  const struct fib_rt_info *fri, unsigned int flags)
  1780	{
  1781		unsigned int nhs = fib_info_num_path(fri->fi);
  1782		struct fib_info *fi = fri->fi;
  1783		u32 tb_id = fri->tb_id;
  1784		struct nlmsghdr *nlh;
  1785		struct rtmsg *rtm;
  1786	
  1787		nlh = nlmsg_put(skb, portid, seq, event, sizeof(*rtm), flags);
  1788		if (!nlh)
  1789			return -EMSGSIZE;
  1790	
  1791		rtm = nlmsg_data(nlh);
  1792		rtm->rtm_family = AF_INET;
  1793		rtm->rtm_dst_len = fri->dst_len;
  1794		rtm->rtm_src_len = 0;
  1795		rtm->rtm_tos = inet_dscp_to_dsfield(fri->dscp);
  1796		if (tb_id < 256)
  1797			rtm->rtm_table = tb_id;
  1798		else
  1799			rtm->rtm_table = RT_TABLE_COMPAT;
  1800		if (nla_put_u32(skb, RTA_TABLE, tb_id))
  1801			goto nla_put_failure;
  1802		rtm->rtm_type = fri->type;
  1803		rtm->rtm_flags = fi->fib_flags;
  1804		rtm->rtm_scope = fi->fib_scope;
  1805		rtm->rtm_protocol = fi->fib_protocol;
  1806	
  1807		if (rtm->rtm_dst_len &&
  1808		    nla_put_in_addr(skb, RTA_DST, fri->dst))
  1809			goto nla_put_failure;
  1810		if (fi->fib_priority &&
  1811		    nla_put_u32(skb, RTA_PRIORITY, fi->fib_priority))
  1812			goto nla_put_failure;
  1813		if (rtnetlink_put_metrics(skb, fi->fib_metrics->metrics) < 0)
  1814			goto nla_put_failure;
  1815	
  1816		if (fi->fib_prefsrc &&
  1817		    nla_put_in_addr(skb, RTA_PREFSRC, fi->fib_prefsrc))
  1818			goto nla_put_failure;
  1819	
  1820		if (fi->nh) {
  1821			if (nla_put_u32(skb, RTA_NH_ID, fi->nh->id))
  1822				goto nla_put_failure;
  1823			if (nexthop_is_blackhole(fi->nh))
  1824				rtm->rtm_type = RTN_BLACKHOLE;
  1825			if (!READ_ONCE(fi->fib_net->ipv4.sysctl_nexthop_compat_mode))
  1826				goto offload;
  1827		}
  1828	
  1829		if (nhs == 1) {
  1830			const struct fib_nh_common *nhc = fib_info_nhc(fi, 0);
  1831	
> 1832			if (fib_nexthop_info(skb, nhc, AF_INET, &rtm->rtm_flags, false) < 0)
  1833				goto nla_put_failure;
  1834	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
