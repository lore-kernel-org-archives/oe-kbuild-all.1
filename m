Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02717C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680609147; x=1712145147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u8g4LfUQDcDY0UWJRj80FeL78c7MeRknd9Qjb7K6cAc=;
  b=bFdFBJflJsF6+Sds+XS2hckntW31QtHwsQy9bBUmYm8oOO4DFayZv0Jw
   I5cyskkgzFC6G8/F76oGU7R4cfnvHaWw0O5lxqLvFNh3mT+lgEMthAteT
   Iy9UH+MgmcZ4K2gUuXa2++dsUH3Lr4R+epPhX6sVaat5CaqmbAttptGM4
   j7ojF3U4T9764jSCndxkCYi5yCOyu9P7fGcTY2Kp+ZYvb3KCBDiMqYiDB
   C4G2QIrsBIRBKKBukMof6SI0XHBBT1tJQPLA/NK9k4QxHIkz0VPuozzHh
   ynekzq+EKMZO2glBddnuZGHzb2HqGHCy2DD+yO3VHUZRMn/RXHr2dlwv/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340889392"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="340889392"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 04:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636488132"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="636488132"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Apr 2023 04:52:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjfD0-000PdC-03;
	Tue, 04 Apr 2023 11:52:18 +0000
Date: Tue, 4 Apr 2023 19:52:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 11044/29325]
 net/ipv4/netfilter/nf_nat_l3proto_ipv4.c:245:1: warning: no previous
 prototype for function 'nf_nat_ipv4_fn'
Message-ID: <202304041950.rgEl0v3Q-lkp@intel.com>
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
head:   e8676808abe2a4dd79bd76700719c360d84b343d
commit: f0723e3bd598d138a44d342818032e89ed2e11a5 [11044/29325] ANDROID: netfilter: nf_nat: remove static from nf_nat_ipv4_fn
config: x86_64-randconfig-a001-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041950.rgEl0v3Q-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout f0723e3bd598d138a44d342818032e89ed2e11a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/staging/android/ion/ net/ipv4/netfilter/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041950.rgEl0v3Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/netfilter/nf_nat_l3proto_ipv4.c:245:1: warning: no previous prototype for function 'nf_nat_ipv4_fn' [-Wmissing-prototypes]
   nf_nat_ipv4_fn(void *priv, struct sk_buff *skb,
   ^
   net/ipv4/netfilter/nf_nat_l3proto_ipv4.c:244:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int
   ^
   static 
   1 warning generated.


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
https://github.com/intel/lkp-tests
