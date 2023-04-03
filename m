Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A38920F2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680513240; x=1712049240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6+SAyrxuNamj1Gz85be/Ibt2hM7RxeSogWrKgGtCiUQ=;
  b=nCiou3y2nEyUCcYcYRbo82/f0GqXT4brxvU2LLuRWsMQV21k2rNVQR8I
   GAvTIQXJK679/uN/BBnTMAwq6YmQtfKCeww9CR2Zjk92FonW8R94M4kYO
   bMJ3dCt8/PpQBUTeFW49gOi+LRLTEj1V8rLR2DyGtHXziYMxgtgNIf9Xr
   1SebQQFc+YDsjlZ1wA1EXJUmsC1M1D9aaUlV02JIKSD07YulEKLgKiYaT
   kCH+Au4i+0bPvUuj163mXh0D9R2CzuAiDBSNfEcZCovwXrS7Ls23FY8TS
   u6xxIRO1dggH9Ech/C6Ch7w9ab5JelWoq1VXI8CTTcHngR+iUTCfKFODe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="344401044"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="344401044"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 02:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="663136721"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="663136721"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Apr 2023 02:13:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjGGD-000O95-04;
	Mon, 03 Apr 2023 09:13:57 +0000
Date: Mon, 3 Apr 2023 17:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Cheng <chenwei.0515@bytedance.com>, willemdebruijn.kernel@gmail.com,
	dsahern@kernel.org, davem@davemloft.net,
	netfilter-devel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, chenwei.0515@bytedance.com
Subject: Re: [PATCH]     udp:nat:vxlan tx after nat should recsum if vxlan tx
 offload on
Message-ID: <202304031611.3W21vgtb-lkp@intel.com>
References: <20230401023029.967357-1-chenwei.0515@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230401023029.967357-1-chenwei.0515@bytedance.com>

Hi Fei,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc5]
[cannot apply to next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fei-Cheng/udp-nat-vxlan-tx-after-nat-should-recsum-if-vxlan-tx-offload-on/20230401-103127
patch link:    https://lore.kernel.org/r/20230401023029.967357-1-chenwei.0515%40bytedance.com
patch subject: [PATCH]     udp:nat:vxlan tx after nat should recsum if vxlan tx offload on
config: microblaze-randconfig-s052-20230402 (https://download.01.org/0day-ci/archive/20230403/202304031611.3W21vgtb-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/58c404cd43734d67706e3dc48c04a3e11e9dd8e8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Fei-Cheng/udp-nat-vxlan-tx-after-nat-should-recsum-if-vxlan-tx-offload-on/20230401-103127
        git checkout 58c404cd43734d67706e3dc48c04a3e11e9dd8e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze SHELL=/bin/bash net/netfilter/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304031611.3W21vgtb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nf_nat_proto.c:81:43: sparse: sparse: cast from restricted __be16
>> net/netfilter/nf_nat_proto.c:81:43: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected int len @@     got restricted __be16 [usertype] @@
   net/netfilter/nf_nat_proto.c:81:43: sparse:     expected int len
   net/netfilter/nf_nat_proto.c:81:43: sparse:     got restricted __be16 [usertype]

vim +81 net/netfilter/nf_nat_proto.c

    65	
    66	static bool udp_manip_pkt(struct sk_buff *skb,
    67				  unsigned int iphdroff, unsigned int hdroff,
    68				  const struct nf_conntrack_tuple *tuple,
    69				  enum nf_nat_manip_type maniptype)
    70	{
    71		struct udphdr *hdr;
    72	
    73		if (skb_ensure_writable(skb, hdroff + sizeof(*hdr)))
    74			return false;
    75	
    76		hdr = (struct udphdr *)(skb->data + hdroff);
    77		__udp_manip_pkt(skb, iphdroff, hdr, tuple, maniptype, !!hdr->check);
    78	
    79		if (skb->csum_local) {
    80			hdr->check = 0;
  > 81			hdr->check = udp_v4_check(htons(hdr->len), tuple->src.u3.ip, tuple->dst.u3.ip,
    82						  lco_csum(skb));
    83			if (hdr->check == 0)
    84				hdr->check = CSUM_MANGLED_0;
    85		}
    86	
    87		return true;
    88	}
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
