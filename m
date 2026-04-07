Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07263A9628
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562281; cv=none; b=HSebxc3lQ/iLqxAdUebBZEpCd68Pe81q2LmIErRsXAIj5VGDbv89gINiH0/X0k/Tumkd7FG72f5Tj7ABbbGhjDXn5H+IRn+cm0woMinD6sCOMpvnRW1R6aAkGrUX099vHpXxGsCYvHvAMnGf3PHqw/7FmwrJy0rRUq04mt+nw+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562281; c=relaxed/simple;
	bh=RjtcSwRYgYtgUOHjB5w0Veky1jao+R/vSyC9jiZubNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hh/SGEQq3ZIQswnraH0A/JErJMIuST/sydJunrh8koIvW7wpN9fXs2ovj7uFzj5zqZKJ8HaJwqPUFij6xDWiCTVkRf6vaLy4agIsO1ou908P3Fl94OkRobX2pQqiM62bOhRgq3QfQHGbPs1gtQbKMhMs/er9aPMDA6GSocqeSz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYKLunS4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYKLunS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775562279; x=1807098279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RjtcSwRYgYtgUOHjB5w0Veky1jao+R/vSyC9jiZubNs=;
  b=iYKLunS4vLP/hnHX4MR89r9SXWBc4vA+sDmC3Iq3H25O1SkseIv5OPf8
   ykoo/bhg8dZxQ72o/kc0SwTfMOsE2mnZisDYbdm57ROc+YNGocZWGQEdx
   AsNw/x4YR+86w3CxhEikDLQ7vqdfv5AbnhTuc8P949yqMWGO2F/Nc6648
   l/tJlTs/PaA5SWiO+W+R8z1zdo3a7tJpnLVKcKQMHYxpcokl7eH2nfwkH
   jTO68R4zn+5LowNvttQmOSfjZYVNbuqhVdxMe6Kd3CIU6mH4CXGdc6pEs
   C54a/7eNN3bWjx6dq+vLWKe6H8obKZaAymiNRY00sF4Wk+VPT2ETj4cFQ
   g==;
X-CSE-ConnectionGUID: /nVkK+KXSzOpnclzSgBtwA==
X-CSE-MsgGUID: hKOZfWfIQzez2mkL4K2M7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76405073"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76405073"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 04:44:39 -0700
X-CSE-ConnectionGUID: elfRy3mGQ6q95nFL2OIOoQ==
X-CSE-MsgGUID: qsKB1a2dRXigTdXZ6WAidQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223361885"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2026 04:44:36 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA4rB-00000000AHF-3uaf;
	Tue, 07 Apr 2026 11:44:33 +0000
Date: Tue, 7 Apr 2026 13:43:46 +0200
From: kernel test robot <lkp@intel.com>
To: Yingnan Zhang <342144303@qq.com>, horms@verge.net.au, ja@ssi.bg
Cc: oe-kbuild-all@lists.linux.dev, pablo@netfilter.org, fw@strlen.de,
	phil@nwl.cc, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, linux-kernel@vger.kernel.org,
	Yingnan Zhang <342144303@qq.com>
Subject: Re: [PATCH net v2] ipvs: fix MTU check for GSO packets in tunnel mode
Message-ID: <202604071309.RskiawHA-lkp@intel.com>
References: <tencent_CA2C1C219C99D315086BE55E8654AF7E6009@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_CA2C1C219C99D315086BE55E8654AF7E6009@qq.com>

Hi Yingnan,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Yingnan-Zhang/ipvs-fix-MTU-check-for-GSO-packets-in-tunnel-mode/20260407-141549
base:   net/main
patch link:    https://lore.kernel.org/r/tencent_CA2C1C219C99D315086BE55E8654AF7E6009%40qq.com
patch subject: [PATCH net v2] ipvs: fix MTU check for GSO packets in tunnel mode
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260407/202604071309.RskiawHA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071309.RskiawHA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071309.RskiawHA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> net/netfilter/ipvs/ip_vs_xmit.c:115:11: error: expected identifier or '(' before 'else'
     115 |         } else if (skb->len > mtu &&
         |           ^~~~
>> net/netfilter/ipvs/ip_vs_xmit.c:119:9: error: expected identifier or '(' before 'return'
     119 |         return false;
         |         ^~~~~~
>> net/netfilter/ipvs/ip_vs_xmit.c:120:1: error: expected identifier or '(' before '}' token
     120 | }
         | ^
   net/netfilter/ipvs/ip_vs_xmit.c: In function '__mtu_check_toobig_v6':
>> net/netfilter/ipvs/ip_vs_xmit.c:115:9: warning: control reaches end of non-void function [-Wreturn-type]
     115 |         } else if (skb->len > mtu &&
         |         ^


vim +115 net/netfilter/ipvs/ip_vs_xmit.c

   104	
   105	static inline bool
   106	__mtu_check_toobig_v6(const struct sk_buff *skb, u32 mtu)
   107	{
   108		if (IP6CB(skb)->frag_max_size) {
   109			/* frag_max_size tell us that, this packet have been
   110			 * defragmented by netfilter IPv6 conntrack module.
   111			 */
   112			if (IP6CB(skb)->frag_max_size > mtu)
   113				return true; /* largest fragment violate MTU */
   114		}
 > 115		} else if (skb->len > mtu &&
   116			   !(skb_is_gso(skb) && skb_gso_validate_network_len(skb, mtu))) {
   117			return true; /* Packet size violate MTU size */
   118		}
 > 119		return false;
 > 120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
