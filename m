Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4F2170A2C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 20:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725827622; cv=none; b=kI9lxpQM8nfPnUbB8AYUSOl3giPlbbfzsVBJRkBrmhILvJlc0k09JnQRyTF93EaJWhsFNxLRYF0hyhfeb93/qSDAq8HIVFPBs2a70ubn/c+KRX/8k3kIJvQ+IW5+nyAQXmmP2N+7TLJLooMaTpKPuKHJwHPPEuOal/TgCK+qO4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725827622; c=relaxed/simple;
	bh=/x8D13OlnClewCfMRfr42r7n87v4oTQxjbmWl/rFOA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g524djuKMMjQc6X1UiH9J9icp5cqIkVj76/B2uOdg+zfyOcWlXZN4E1j83M6SAr9tRUNULlQX6lMyYeLaJi4yNjefDfeCgEs82WUMzHpLKMNtVKacbkpAUBltgAIL1H1N4R0v2fR08wMHAHx8R/17PuuyxU/rCNCqkEiQBkhJK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmJMNrxJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmJMNrxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725827621; x=1757363621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/x8D13OlnClewCfMRfr42r7n87v4oTQxjbmWl/rFOA4=;
  b=VmJMNrxJgV8JE8+bCzE4Be8YSUoamVZa6OaPOam8QwqhhNmHe3KhG8c+
   noU+KWuw4DwLFKGC7EoLLCvOqNhz3ryIShZW3x5PIcEoqXbyIRMHh/kS5
   shZD55bvpQ+cCSDlt+up+oZcU6znWzZ56EoXRe0dKRRybcZAgGj3l8xZp
   Rh8O0hf80TLCeK80Seo39LPdshBHPfK4oUWBdYCy3JNsY3SDOYbysMXl7
   C1QNSe6x7iG6MoYAdTQBBvG3MENlaWKJYlRdpBOx1x1GsqmLORKxm3MQD
   jirmoAdTtUZ3c9XDGgLZixTIB00Ix9Rx/eHjCXrsv8jCcKTlP47pRjwCl
   A==;
X-CSE-ConnectionGUID: RJsrNw2QS72Z4trKmJ/6Nw==
X-CSE-MsgGUID: 7RfW7FpAR56IAUMRKlsrmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35174743"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="35174743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 13:33:40 -0700
X-CSE-ConnectionGUID: Abmo6hqfRqO9TUinUyw4XQ==
X-CSE-MsgGUID: Uu47vd9LQM641stwOUvIQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="70867989"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Sep 2024 13:33:39 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snObI-000DxT-29;
	Sun, 08 Sep 2024 20:33:36 +0000
Date: Mon, 9 Sep 2024 04:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 14/39] net/ipv4/fib_rules.c:387:52:
 sparse: sparse: restricted dscp_t degrades to integer
Message-ID: <202409090444.UEg822QQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   1e442c563723a4ecdef463c14b10ba919b27acdf
commit: 9a03a6c1671e79ebe2d7d47738a9014cc6c32359 [14/39] ipv4: fib_rules: Add DSCP selector support
config: parisc-randconfig-r111-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090444.UEg822QQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240909/202409090444.UEg822QQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090444.UEg822QQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/fib_rules.c:387:52: sparse: sparse: restricted dscp_t degrades to integer
   net/ipv4/fib_rules.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/stackdepot.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +387 net/ipv4/fib_rules.c

   376	
   377	static int fib4_rule_fill(struct fib_rule *rule, struct sk_buff *skb,
   378				  struct fib_rule_hdr *frh)
   379	{
   380		struct fib4_rule *rule4 = (struct fib4_rule *) rule;
   381	
   382		frh->dst_len = rule4->dst_len;
   383		frh->src_len = rule4->src_len;
   384	
   385		if (rule4->dscp_full) {
   386			frh->tos = 0;
 > 387			if (nla_put_u8(skb, FRA_DSCP, rule4->dscp >> 2))
   388				goto nla_put_failure;
   389		} else {
   390			frh->tos = inet_dscp_to_dsfield(rule4->dscp);
   391		}
   392	
   393		if ((rule4->dst_len &&
   394		     nla_put_in_addr(skb, FRA_DST, rule4->dst)) ||
   395		    (rule4->src_len &&
   396		     nla_put_in_addr(skb, FRA_SRC, rule4->src)))
   397			goto nla_put_failure;
   398	#ifdef CONFIG_IP_ROUTE_CLASSID
   399		if (rule4->tclassid &&
   400		    nla_put_u32(skb, FRA_FLOW, rule4->tclassid))
   401			goto nla_put_failure;
   402	#endif
   403		return 0;
   404	
   405	nla_put_failure:
   406		return -ENOBUFS;
   407	}
   408	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
