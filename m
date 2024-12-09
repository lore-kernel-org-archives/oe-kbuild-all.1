Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ED917625C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719548; cv=none; b=rXwlpeiCHp1J0lWMxLSGhBL/rW3J8V6g/HHXNLBeYYHsV/P0rFzT+8MIQC2ptX2UFW1bJAO4SZOrkhSgqqz4492CZxuYsTSxnVxjrls6zDo17bCaSpbbhuNJxzTY8A0O4umCPzOWQHSgzJCDLZCzxGAAEd/8KYy7+y6dAvg3SAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719548; c=relaxed/simple;
	bh=AzHA/hMClI3MRWClxdhjCeAlhT69zRbOOw0yN3/YVe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEI2ZiyV5y0S10Ln+2M1Wl0bXkf2Jcpog8f0hIRruhAym/fjQ9V9TxDBUwBeAlJuhNdBftGiuoovrBvA9/2t8Fqju+VJmHaXg2cq/yxD3aWB8hssMSLwPB1LzzrLoIkzd+rtjqim6GczG0O3QXUSDNqefvtKzdAfey9POraM9ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJodu+CV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJodu+CV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719544; x=1765255544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AzHA/hMClI3MRWClxdhjCeAlhT69zRbOOw0yN3/YVe4=;
  b=CJodu+CVKynExTFNcARx+V5ZzkTdj3k8+hUQtLIMi9/LFbIxkUKk7yZB
   8Uj66XSDNPbIdfDwANmL+OUH/AnAA444WKmx4axjp1bJg6QBi8Ky+UZeH
   urGr4RmW0LI8tu1u30YeEdujA76QTQdOcAt/SGNf8iCV5VuoMyD+Vk2AX
   U12WyR2sjVBPrOLRqfiemepASQcJXnQbf6kVIKtCttDxN5maRIjOHvEbL
   BoIHqtJmoFxwpF5dy+cnHU7W1zdq/Z2HPaOBTvcg6BaCnRPVvWgOWUJtE
   wC/KND/XkZzHJzmQKk8PpvEnB4HnPNAiuMyhdDpWCw8kCaNb7cn0Bmz48
   g==;
X-CSE-ConnectionGUID: ANqgLc6NTWWI3c9BDlIoXg==
X-CSE-MsgGUID: YUXjQ8CzTDSDO+1JBVA7BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="56484237"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="56484237"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:45:42 -0800
X-CSE-ConnectionGUID: oUByNaDNQkSJFp3APZlZ3w==
X-CSE-MsgGUID: FhysvzurSaKKgZ295Irfgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="100012724"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Dec 2024 20:45:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVeK-0003ub-21;
	Mon, 09 Dec 2024 04:45:36 +0000
Date: Mon, 9 Dec 2024 12:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Antonio Quartulli <antonio@openvpn.net>, netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>, sd@queasysnail.net,
	ryazanov.s.a@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v13 07/22] ovpn: implement basic TX path (UDP)
Message-ID: <202412081739.56GeY9xL-lkp@intel.com>
References: <20241206-b4-ovpn-v13-7-67fb4be666e2@openvpn.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-b4-ovpn-v13-7-67fb4be666e2@openvpn.net>

Hi Antonio,

kernel test robot noticed the following build errors:

[auto build test ERROR on 152d00a913969514967ad3f962b3b1c8983eb2d7]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonio-Quartulli/net-introduce-OpenVPN-Data-Channel-Offload-ovpn/20241207-054712
base:   152d00a913969514967ad3f962b3b1c8983eb2d7
patch link:    https://lore.kernel.org/r/20241206-b4-ovpn-v13-7-67fb4be666e2%40openvpn.net
patch subject: [PATCH net-next v13 07/22] ovpn: implement basic TX path (UDP)
config: nios2-randconfig-r131-20241208 (https://download.01.org/0day-ci/archive/20241208/202412081739.56GeY9xL-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241208/202412081739.56GeY9xL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412081739.56GeY9xL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ovpn/io.c:18:
   drivers/net/ovpn/skb.h: In function 'ovpn_ip_check_protocol':
>> drivers/net/ovpn/skb.h:46:56: error: invalid application of 'sizeof' to incomplete type 'struct ipv6hdr'
      46 |                 if (!pskb_network_may_pull(skb, sizeof(struct ipv6hdr)))
         |                                                        ^~~~~~


vim +46 drivers/net/ovpn/skb.h

    29	
    30	/* Return IP protocol version from skb header.
    31	 * Return 0 if protocol is not IPv4/IPv6 or cannot be read.
    32	 */
    33	static inline __be16 ovpn_ip_check_protocol(struct sk_buff *skb)
    34	{
    35		__be16 proto = 0;
    36	
    37		/* skb could be non-linear,
    38		 * make sure IP header is in non-fragmented part
    39		 */
    40		if (!pskb_network_may_pull(skb, sizeof(struct iphdr)))
    41			return 0;
    42	
    43		if (ip_hdr(skb)->version == 4) {
    44			proto = htons(ETH_P_IP);
    45		} else if (ip_hdr(skb)->version == 6) {
  > 46			if (!pskb_network_may_pull(skb, sizeof(struct ipv6hdr)))
    47				return 0;
    48			proto = htons(ETH_P_IPV6);
    49		}
    50	
    51		return proto;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
