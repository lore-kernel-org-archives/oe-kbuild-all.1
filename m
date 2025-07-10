Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A8412CDA5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 22:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752184985; cv=none; b=Aaukua/uxMLJ0hhmCY3AY1a1RojEz8Tz8bRocnyk7hm4ZxSTYMat/HZzxvvWN179lFxDP96XbnpfoSP9473Rf9xi3TURGmg+CitICC8Hr1Eaayx/DYFczf6Pksb+ipTDjwJwt1bdYLdwsOdu3unM/uEeVV9iMGa5vfAnX/9Abg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752184985; c=relaxed/simple;
	bh=RNfL6xXua6BldJx8pgCExOG+bjcuoCUjjrTaGgP5OFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nm8vgljgnLkTNhaV/wKC5beM4KesL2fPaRCKB6jToiI7in6VMhAIc6jo0r0dZAjjiPDQuaE+DHjqBZ4zFE6AbtApjQyF+t4+tCtdLRXE4eOsY1aQaPIaG4nyGCdLcoasqKjg7rO0UGtgqrnWz9uNB332MdjArnMDxwMrbLhr3lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGMVIElJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGMVIElJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752184984; x=1783720984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RNfL6xXua6BldJx8pgCExOG+bjcuoCUjjrTaGgP5OFE=;
  b=mGMVIElJwuKlAgqWpCBu9y/mJe95l5yB/F5nKk6/2fzTDYowxbH8H6Hb
   zMU+tXIX6KCnD1ZMs5o4u6+pNaGE/4UEbsYwdZvBae+r4j3ajHcuJ58Cm
   YBKkYUBAsnkuqvL3I8FPz539TK1ycrZtUMRUu60tgI+I26AqoDpAA/ZnP
   AnWh6in5d6aLNX/Og+vBFF5xTJgtrYlFH8LLMTEe7KBUFdM4J52D26Zsz
   /bYI33x6Mh+W4nQ3/dctRHPRV99Po4iuRhw5dvsi+4NQEuOg0eenw1Xql
   2IMgtQ18RJ7KTjTrJpY/DH5qGUnZ7rsXlr48lG5T6AP3rvtFuzjDhrB3r
   Q==;
X-CSE-ConnectionGUID: cGDBIeDjQbGpsGjD8bp4Ew==
X-CSE-MsgGUID: Du6C+TzYTT2PuT88atcpgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65178725"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="65178725"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 15:03:03 -0700
X-CSE-ConnectionGUID: 5l/p8POnQwaghtPqoeXJuQ==
X-CSE-MsgGUID: Mnq+8THgSmyoLGmcLsLFZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="160221451"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jul 2025 15:03:01 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZzM3-0005Vv-1H;
	Thu, 10 Jul 2025 22:02:59 +0000
Date: Fri, 11 Jul 2025 06:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Mahe Tardy <mahe.tardy@gmail.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, martin.lau@linux.dev,
	daniel@iogearbox.net, john.fastabend@gmail.com, ast@kernel.org,
	andrii@kernel.org, Mahe Tardy <mahe.tardy@gmail.com>
Subject: Re: [PATCH bpf-next v1 2/4] net: move netfilter
 nf_reject6_fill_skb_dst to core ipv6
Message-ID: <202507110529.9ZuNSyQU-lkp@intel.com>
References: <20250710102607.12413-3-mahe.tardy@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710102607.12413-3-mahe.tardy@gmail.com>

Hi Mahe,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Mahe-Tardy/net-move-netfilter-nf_reject_fill_skb_dst-to-core-ipv4/20250710-182905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250710102607.12413-3-mahe.tardy%40gmail.com
patch subject: [PATCH bpf-next v1 2/4] net: move netfilter nf_reject6_fill_skb_dst to core ipv6
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250711/202507110529.9ZuNSyQU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507110529.9ZuNSyQU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110529.9ZuNSyQU-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv6/netfilter/nf_reject_ipv6.c: In function 'nf_send_unreach6':
>> net/ipv6/netfilter/nf_reject_ipv6.c:386:13: error: implicit declaration of function 'ip6_reply_fill_dst' [-Werror=implicit-function-declaration]
     386 |             ip6_reply_fill_dst(skb_in) < 0)
         |             ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ip6_reply_fill_dst +386 net/ipv6/netfilter/nf_reject_ipv6.c

   375	
   376	void nf_send_unreach6(struct net *net, struct sk_buff *skb_in,
   377			      unsigned char code, unsigned int hooknum)
   378	{
   379		if (!reject6_csum_ok(skb_in, hooknum))
   380			return;
   381	
   382		if (hooknum == NF_INET_LOCAL_OUT && skb_in->dev == NULL)
   383			skb_in->dev = net->loopback_dev;
   384	
   385		if ((hooknum == NF_INET_PRE_ROUTING || hooknum == NF_INET_INGRESS) &&
 > 386		    ip6_reply_fill_dst(skb_in) < 0)
   387			return;
   388	
   389		icmpv6_send(skb_in, ICMPV6_DEST_UNREACH, code, 0);
   390	}
   391	EXPORT_SYMBOL_GPL(nf_send_unreach6);
   392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
