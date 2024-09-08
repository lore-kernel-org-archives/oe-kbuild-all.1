Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EFC2B9B7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725812188; cv=none; b=QQOxjZpdRiSlnukM0YNQ+t8AGM/f49GehDOKaNEcWi59uwqnWP1GL1/ePUGaHfD8ifKxP69f1LsZqro49D4K/wDiEK70A5yGiAaQW3ivqYZLvNrgpKEjXmTPEhaULoC5ng6esKitNnH3IVphZQIHH/Mps3HROSzf6HIuFbgWHpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725812188; c=relaxed/simple;
	bh=OwilESTbhR18AkWYVULXsri4AqZixw1gNtP6LqICTKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EZkZRx/MOYCsq+5WaCp09JeUoJH4/ibgJGSLkdxaUQ1ncruMBv80pawHvyqwP8W5nxd8KVTIWEHSKWDdSPBurRaUNUJBRbuav7z5NHLagCN+A+vaqwG3KOl5FVLrvJNa/RNcciV+eMdxXBY0Nuovql5QXtEDrkgPggEEusN54v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGJmx2xP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGJmx2xP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725812187; x=1757348187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OwilESTbhR18AkWYVULXsri4AqZixw1gNtP6LqICTKw=;
  b=RGJmx2xPnYwIklpfq+lyc0lmFks8KKdh0d+vSIQ1UBsxUZcBEi3Pkh1T
   LvoIPp20TFXXYpkDeBOjI6d7c8I5ppuZs1HpF8+2Bnb3igm2pKPzfmTQZ
   yNYVpH7Zs+PFpqe8+X960xSW5Tw8+0nh8Ft3U0sjUqDgB13Fgd01bBHxV
   FYKIjZRhRwas3RgCSQKWHdMEohjKtvD1cTtfVlREUN1THwM1fyIapW+8l
   DMYMfz3jFOlzuHnOufXEVOjaZ4rxVMnxZHITMQzO74WJQ/1+lTsfvRALa
   +lZQDMHlwYEExV/dWsenumOZTOskBvtLyTt9huMy5CHUeR9MKEzDiczOM
   A==;
X-CSE-ConnectionGUID: cW9CpWoBQqm4vnE583DtGA==
X-CSE-MsgGUID: cpK/E3HmTJ67EaTFZMNPsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24447438"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="24447438"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 09:16:26 -0700
X-CSE-ConnectionGUID: dkAhHLFtTtuxiAFL4+TEoA==
X-CSE-MsgGUID: 0W0+76WxSt+cUVipoa4VdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="70839319"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Sep 2024 09:16:25 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snKaM-000DiT-2t;
	Sun, 08 Sep 2024 16:16:22 +0000
Date: Mon, 9 Sep 2024 00:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 15/39] net/ipv6/fib6_rules.c:468:52:
 sparse: sparse: restricted dscp_t degrades to integer
Message-ID: <202409090037.Do9MgsqP-lkp@intel.com>
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
commit: bfaae3e80b53d50093ec86eab85e522fb658e162 [15/39] ipv6: fib_rules: Add DSCP selector support
config: i386-randconfig-r111-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090037.Do9MgsqP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090037.Do9MgsqP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090037.Do9MgsqP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv6/fib6_rules.c:468:52: sparse: sparse: restricted dscp_t degrades to integer

vim +468 net/ipv6/fib6_rules.c

   457	
   458	static int fib6_rule_fill(struct fib_rule *rule, struct sk_buff *skb,
   459				  struct fib_rule_hdr *frh)
   460	{
   461		struct fib6_rule *rule6 = (struct fib6_rule *) rule;
   462	
   463		frh->dst_len = rule6->dst.plen;
   464		frh->src_len = rule6->src.plen;
   465	
   466		if (rule6->dscp_full) {
   467			frh->tos = 0;
 > 468			if (nla_put_u8(skb, FRA_DSCP, rule6->dscp >> 2))
   469				goto nla_put_failure;
   470		} else {
   471			frh->tos = inet_dscp_to_dsfield(rule6->dscp);
   472		}
   473	
   474		if ((rule6->dst.plen &&
   475		     nla_put_in6_addr(skb, FRA_DST, &rule6->dst.addr)) ||
   476		    (rule6->src.plen &&
   477		     nla_put_in6_addr(skb, FRA_SRC, &rule6->src.addr)))
   478			goto nla_put_failure;
   479		return 0;
   480	
   481	nla_put_failure:
   482		return -ENOBUFS;
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
