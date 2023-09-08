Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DB21106
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 01:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694135329; x=1725671329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QbM3sVygzFS+G/Vikp+E1nyryUlAPZwOQ+NKCjmXBuE=;
  b=LtYhBurGX+siq7dOW5yT1mAVV/mJ9h6XTJbTqlBehHl20lu+HS9Jl3Yw
   8vJaZwS1yRBSvH3CPaTySXN7Pw8AvRTH3Gf3W3vu5Mzi3bZYZ/tXvMGC3
   hA6G7F35lB7IejmqUcT8ejDkBZBDxtM+5S4jEQ+PqE9UC8sWfYqSwOCQx
   AF6+evxxK7OG294rCSVdYlIK5yEru1Bd2pjR6ou7pfp7xLLAD9zOO0XWM
   lvX3J56Vp2gFKdA7bXn9a7gv38PsKXjGWoqvXBzN+wdJCV/czj3X9pTXR
   td/Xft9et5ot5dk+tyTh91xI7h9fgOQPsTxQp7Lh8U1la7rxyOBlaO3QP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="376432835"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="376432835"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 18:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="807760886"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="807760886"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Sep 2023 18:08:42 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qePzD-0001li-2U;
	Fri, 08 Sep 2023 01:08:39 +0000
Date: Fri, 8 Sep 2023 09:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Zeng <zengyhkyle@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
	dsahern@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, davem@davemloft.net,
	netdev@vger.kernel.org, ssuryaextr@gmail.com
Subject: Re: [PATCH] fix null-deref in ipv4_link_failure
Message-ID: <202309080837.urhzWjw6-lkp@intel.com>
References: <ZPpUfm/HhFet3ejH@westworld>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPpUfm/HhFet3ejH@westworld>

Hi Kyle,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5 next-20230907]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyle-Zeng/fix-null-deref-in-ipv4_link_failure/20230908-065510
base:   linus/master
patch link:    https://lore.kernel.org/r/ZPpUfm%2FHhFet3ejH%40westworld
patch subject: [PATCH] fix null-deref in ipv4_link_failure
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230908/202309080837.urhzWjw6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080837.urhzWjw6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080837.urhzWjw6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/route.c: In function 'ipv4_send_dest_unreach':
   net/ipv4/route.c:1235:52: error: 'net' undeclared (first use in this function)
    1235 |                 res = __ip_options_compile(dev_net(net), &opt, skb, NULL);
         |                                                    ^~~
   net/ipv4/route.c:1235:52: note: each undeclared identifier is reported only once for each function it appears in
>> net/ipv4/route.c:1218:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
    1218 |         struct net_device *dev;
         |                            ^~~


vim +/dev +1218 net/ipv4/route.c

  1213	
  1214	static void ipv4_send_dest_unreach(struct sk_buff *skb)
  1215	{
  1216		struct ip_options opt;
  1217		int res;
> 1218		struct net_device *dev;
  1219	
  1220		/* Recompile ip options since IPCB may not be valid anymore.
  1221		 * Also check we have a reasonable ipv4 header.
  1222		 */
  1223		if (!pskb_network_may_pull(skb, sizeof(struct iphdr)) ||
  1224		    ip_hdr(skb)->version != 4 || ip_hdr(skb)->ihl < 5)
  1225			return;
  1226	
  1227		memset(&opt, 0, sizeof(opt));
  1228		if (ip_hdr(skb)->ihl > 5) {
  1229			if (!pskb_network_may_pull(skb, ip_hdr(skb)->ihl * 4))
  1230				return;
  1231			opt.optlen = ip_hdr(skb)->ihl * 4 - sizeof(struct iphdr);
  1232	
  1233			rcu_read_lock();
  1234			dev = skb->dev ? skb->dev : skb_rtable(skb)->dst.dev;
  1235			res = __ip_options_compile(dev_net(net), &opt, skb, NULL);
  1236			rcu_read_unlock();
  1237	
  1238			if (res)
  1239				return;
  1240		}
  1241		__icmp_send(skb, ICMP_DEST_UNREACH, ICMP_HOST_UNREACH, 0, &opt);
  1242	}
  1243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
