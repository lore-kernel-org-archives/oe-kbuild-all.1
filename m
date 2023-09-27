Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD5711C8A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 21:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695851575; x=1727387575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5rd9c2G2nbwDrhBhF0VK9+j+G4N7JEohiX+gsyBdZpE=;
  b=GD9oe3VkWM5op4RplRGzGzMJNFvShlygVzxBVwNwVCXU3CvPFFdZeIue
   KIryjtepltnK7NiQgH4WmqyAfhgzbSngB5JcdaC9BrsO3+q/XPH+KU2Rd
   zcys5ddBnUBL92q/32g47a207hmp+hcqgTcqrRkC/ORXGQkn7z5uWcpx4
   u0CI9NFC8f57yd9y3thETdK8IX0F4pfar15RLpEtItNgAkidtr+joDnYY
   SxKJRfOzmudupffybGw5lNCLCqgBRNd6qdauAY/otQuaKFYr26ybAFSC6
   BuyV7UQiWd/GhO05c8FRF5q1Lp2lILkvToEMz4VSNu85yzjdKt00ZNFHK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="379208583"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="379208583"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 14:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752744872"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="752744872"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2023 14:52:53 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlcSg-0000hZ-2O;
	Wed, 27 Sep 2023 21:52:50 +0000
Date: Thu, 28 Sep 2023 05:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 10448/30000]
 net/ipv4/netfilter/nf_nat_l3proto_ipv4.c:245:1: warning: no previous
 prototype for 'nf_nat_ipv4_fn'
Message-ID: <202309280525.nScdyq3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sami,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   4d08c0d1d18d85ca933dc3194519127515828746
commit: f0723e3bd598d138a44d342818032e89ed2e11a5 [10448/30000] ANDROID: netfilter: nf_nat: remove static from nf_nat_ipv4_fn
config: i386-randconfig-012-20230926 (https://download.01.org/0day-ci/archive/20230928/202309280525.nScdyq3K-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280525.nScdyq3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280525.nScdyq3K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/netfilter/nf_nat_l3proto_ipv4.c:245:1: warning: no previous prototype for 'nf_nat_ipv4_fn' [-Wmissing-prototypes]
     245 | nf_nat_ipv4_fn(void *priv, struct sk_buff *skb,
         | ^~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/nf_nat_ipv4_fn +245 net/ipv4/netfilter/nf_nat_l3proto_ipv4.c

c7232c9979cba6 Patrick McHardy   2012-08-26  243  
f0723e3bd598d1 Sami Tolvanen     2019-12-06  244  unsigned int
06198b34a3e09e Eric W. Biederman 2015-09-18 @245  nf_nat_ipv4_fn(void *priv, struct sk_buff *skb,
9971a514ed2697 Florian Westphal  2018-05-14  246  	       const struct nf_hook_state *state)
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  247  {
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  248  	struct nf_conn *ct;
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  249  	enum ip_conntrack_info ctinfo;
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  250  
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  251  	ct = nf_ct_get(skb, &ctinfo);
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  252  	if (!ct)
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  253  		return NF_ACCEPT;
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  254  
1f55236bd8dde6 Florian Westphal  2018-05-14  255  	if (ctinfo == IP_CT_RELATED || ctinfo == IP_CT_RELATED_REPLY) {
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  256  		if (ip_hdr(skb)->protocol == IPPROTO_ICMP) {
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  257  			if (!nf_nat_icmp_reply_translation(skb, ct, ctinfo,
082a758f042e1c Eric W. Biederman 2015-09-18  258  							   state->hook))
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  259  				return NF_DROP;
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  260  			else
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  261  				return NF_ACCEPT;
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  262  		}
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  263  	}
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  264  
9971a514ed2697 Florian Westphal  2018-05-14  265  	return nf_nat_inet_fn(priv, skb, state);
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  266  }
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  267  EXPORT_SYMBOL_GPL(nf_nat_ipv4_fn);
30766f4c2d60dd Pablo Neira Ayuso 2014-08-05  268  

:::::: The code at line 245 was first introduced by commit
:::::: 06198b34a3e09e06d9aecaa3727e0d37206cea77 netfilter: Pass priv instead of nf_hook_ops to netfilter hooks

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
