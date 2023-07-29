Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807DD7C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 22:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690668840; x=1722204840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t+Q/8jEEv0+0VdpWX737VkYspVixa02bCw6HqiumW4I=;
  b=O+pBFJMSU5+OehA7aPGbQ0xBslNNtGR7nSXPNV1OfQkZKnw9kFBq0Esi
   h57XIA1e2tNWctXn/rKCSMmRfvMuU+ZdvuKyRf94z3MsLDUt4W+hGQdub
   BDC+heuFzQDe2jm7Ga+x6E/2Grr8L3SSGUkllwA6lSoz42FebNSozhpaa
   H+Gr62V9MlFf12F+VEquFQocMe2EjIJVRSp60kHZbOQB4UNUHHR0wrh+w
   XCOWCntYg4oae/eoHlUan7dW6rk8KWhQ5q/VM9OfUzZGRJ5vGfzLWt73O
   qgMh14mbvUMHxvyKjq6UfIsH+LiQdrf6WiUCeZ0QZft/K2pWK2z8MbXWF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="455156354"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="455156354"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 15:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="721631493"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="721631493"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Jul 2023 15:13:52 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPsBZ-0004JT-0u;
	Sat, 29 Jul 2023 22:13:44 +0000
Date: Sun, 30 Jul 2023 06:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Larysa Zaremba <larysa.zaremba@intel.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Larysa Zaremba <larysa.zaremba@intel.com>, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org, David Ahern <dsahern@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Anatoly Burakov <anatoly.burakov@intel.com>,
	Alexander Lobakin <alexandr.lobakin@intel.com>,
	Magnus Karlsson <magnus.karlsson@gmail.com>,
	Maryam Tahhan <mtahhan@redhat.com>, xdp-hints@xdp-project.net,
	netdev@vger.kernel.org,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Simon Horman <simon.horman@corigine.com>
Subject: Re: [PATCH bpf-next v4 17/21] veth: Implement VLAN tag and checksum
 XDP hint
Message-ID: <202307300639.I0c6g7mz-lkp@intel.com>
References: <20230728173923.1318596-18-larysa.zaremba@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728173923.1318596-18-larysa.zaremba@intel.com>

Hi Larysa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Larysa-Zaremba/ice-make-RX-HW-timestamp-reading-code-more-reusable/20230729-023952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230728173923.1318596-18-larysa.zaremba%40intel.com
patch subject: [PATCH bpf-next v4 17/21] veth: Implement VLAN tag and checksum XDP hint
config: openrisc-randconfig-r081-20230730 (https://download.01.org/0day-ci/archive/20230730/202307300639.I0c6g7mz-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300639.I0c6g7mz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307300639.I0c6g7mz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/veth.c:1771:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] checksum @@     got restricted __wsum [usertype] csum @@
   drivers/net/veth.c:1771:37: sparse:     expected unsigned int [usertype] checksum
   drivers/net/veth.c:1771:37: sparse:     got restricted __wsum [usertype] csum

vim +1771 drivers/net/veth.c

  1752	
  1753	static int veth_xdp_rx_csum(const struct xdp_md *ctx,
  1754				    enum xdp_csum_status *csum_status,
  1755				    union xdp_csum_info *csum_info)
  1756	{
  1757		struct veth_xdp_buff *_ctx = (void *)ctx;
  1758		struct sk_buff *skb = _ctx->skb;
  1759	
  1760		if (!skb)
  1761			return -ENODATA;
  1762	
  1763		if (skb->ip_summed == CHECKSUM_UNNECESSARY) {
  1764			*csum_status = XDP_CHECKSUM_VALID_LVL0 + skb->csum_level;
  1765		} else if (skb->ip_summed == CHECKSUM_PARTIAL) {
  1766			*csum_status = XDP_CHECKSUM_PARTIAL;
  1767			csum_info->csum_start = skb_checksum_start_offset(skb);
  1768			csum_info->csum_offset = skb->csum_offset;
  1769		} else if (skb->ip_summed == CHECKSUM_COMPLETE) {
  1770			*csum_status = XDP_CHECKSUM_COMPLETE;
> 1771			csum_info->checksum = skb->csum;
  1772		} else {
  1773			return -ENODATA;
  1774		}
  1775	
  1776		return 0;
  1777	}
  1778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
