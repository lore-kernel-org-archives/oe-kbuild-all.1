Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82A91BDE3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Nov 2023 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G15ZH/tP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699869934; x=1731405934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fwT9ZCx8qEwyxziVUtopTVHdcw2NHX46p8hVWQQv2MU=;
  b=G15ZH/tPbZMxrqFmrkVY/0TZL9/xLQutofjejXjfDC+nKtZkSKauvy4K
   IZwAp8p0CA3PdvVruYQD2xuU49uexvGIhTgd+I+2TBkdgzbhaSoFB+y2u
   X9pKkrq0/TlKQfO/fBysjgMM3UaG8UEJxrxurarNMFX4SEGqYClgfsVGa
   YDhAx6eih0JypS0Ns7LLGYN9wCSn2O/olNhAIalyr0c8ejlFcj6R2sQX1
   M3eThQkZZ7px3AcXIqwK4t9kONPOUnbtW5VBqyazXJsSOaoko/EIHpW7o
   IcEhlTAY5vkDiaXZhsvcn6ysa8swIluXRR9s7uBvghCALGOjtTEpM7IAz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="394306560"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="394306560"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 02:05:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="767860428"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="767860428"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Nov 2023 02:05:33 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2Tow-000C18-2K;
	Mon, 13 Nov 2023 10:05:30 +0000
Date: Mon, 13 Nov 2023 18:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hopps <chopps@chopps.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC ipsec-next v2 8/8] iptfs: impl: add new iptfs xfrm mode impl
Message-ID: <202311131710.pFEZgGgP-lkp@intel.com>
References: <20231113035219.920136-9-chopps@chopps.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113035219.920136-9-chopps@chopps.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on klassert-ipsec-next/master]
[also build test WARNING on klassert-ipsec/master netfilter-nf/main linus/master v6.7-rc1 next-20231113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hopps/iptfs-config-add-CONFIG_XFRM_IPTFS/20231113-115642
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git master
patch link:    https://lore.kernel.org/r/20231113035219.920136-9-chopps%40chopps.org
patch subject: [RFC ipsec-next v2 8/8] iptfs: impl: add new iptfs xfrm mode impl
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20231113/202311131710.pFEZgGgP-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311131710.pFEZgGgP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311131710.pFEZgGgP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/xfrm/xfrm_iptfs.c:468:17: warning: no previous prototype for 'iptfs_pskb_add_frags' [-Wmissing-prototypes]
     468 | struct sk_buff *iptfs_pskb_add_frags(struct sk_buff *tpl,
         |                 ^~~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_iptfs.c: In function '__iptfs_reassem_done':
   net/xfrm/xfrm_iptfs.c:629:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     629 |         int ret;
         |             ^~~
   net/xfrm/xfrm_iptfs.c: In function '__reorder_drop':
   net/xfrm/xfrm_iptfs.c:1234:13: warning: variable 'wantseq' set but not used [-Wunused-but-set-variable]
    1234 |         u64 wantseq = xtfs->w_wantseq;
         |             ^~~~~~~
   net/xfrm/xfrm_iptfs.c: In function '__reorder_this':
   net/xfrm/xfrm_iptfs.c:1283:13: warning: variable 'wantseq' set but not used [-Wunused-but-set-variable]
    1283 |         u64 wantseq = xtfs->w_wantseq;
         |             ^~~~~~~
   net/xfrm/xfrm_iptfs.c: In function '__reorder_future_shifts':
   net/xfrm/xfrm_iptfs.c:1405:13: warning: variable 'last_drop_seq' set but not used [-Wunused-but-set-variable]
    1405 |         u64 last_drop_seq = xtfs->w_wantseq;
         |             ^~~~~~~~~~~~~
   net/xfrm/xfrm_iptfs.c: In function 'iptfs_drop_timer':
   net/xfrm/xfrm_iptfs.c:1625:20: warning: variable 'fcount' set but not used [-Wunused-but-set-variable]
    1625 |         u32 count, fcount;
         |                    ^~~~~~
   net/xfrm/xfrm_iptfs.c: In function 'iptfs_delay_timer':
   net/xfrm/xfrm_iptfs.c:2357:16: warning: variable 'osize' set but not used [-Wunused-but-set-variable]
    2357 |         size_t osize;
         |                ^~~~~
   net/xfrm/xfrm_iptfs.c: In function 'iptfs_encap_add_ipv4':
   net/xfrm/xfrm_iptfs.c:2405:13: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
    2405 |         int flags;
         |             ^~~~~
   net/xfrm/xfrm_iptfs.c: At top level:
   net/xfrm/xfrm_iptfs.c:100:12: warning: '__trace_ip_proto_seq' defined but not used [-Wunused-function]
     100 | static u32 __trace_ip_proto_seq(struct iphdr *iph)
         |            ^~~~~~~~~~~~~~~~~~~~
>> net/xfrm/xfrm_iptfs.c:93:12: warning: '__trace_ip_proto' defined but not used [-Wunused-function]
      93 | static u32 __trace_ip_proto(struct iphdr *iph)
         |            ^~~~~~~~~~~~~~~~


vim +/__trace_ip_proto +93 net/xfrm/xfrm_iptfs.c

    92	
  > 93	static u32 __trace_ip_proto(struct iphdr *iph)
    94	{
    95		if (iph->version == 4)
    96			return iph->protocol;
    97		return ((struct ipv6hdr *)iph)->nexthdr;
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
