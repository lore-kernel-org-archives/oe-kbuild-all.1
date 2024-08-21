Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052A37482
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 00:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724199972; cv=none; b=DAOYNQyAFiIQEZiadUD4khr49CaDLwPLM/Kb4WG/4oJ4WYdI1mfDbIDYzsBJy33+WLEYSUU2wVvOUx31SooEDxODtTMs0QLI6021wrirOHYeT4V8HDUgQCJHHxeAXrBSWvEdlIfqVg6Kys8kFUPJaIQ9cUSV+ObOQ2nfrTkmX78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724199972; c=relaxed/simple;
	bh=yiOrsKpKHnfpWAPkH1T1M3NIWSoBOmf55VQx29FXUfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0YacLsIdeFK/Hl2GKetvzDd7KCQuJvejMTHtKcYR8O66hUVMPosYmdekm3L3XN2zZfZ2I1Dt4Tbun9qSs7QSqZ6C0BziOiGfrJNGOw2XAiCPK7T65gtyyQM0r6WIGX9xynbVox012bZbPm4RNsBc6j1+9Qs5ezEV7tkk1O7AJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQ0e0aME; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQ0e0aME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724199970; x=1755735970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yiOrsKpKHnfpWAPkH1T1M3NIWSoBOmf55VQx29FXUfI=;
  b=hQ0e0aMEBraCZTbGUEWB2o5joGLhQRrKX4Wrw6xTxZKnG85BdqAdpy13
   1Bz2zvW8+uo2Tev65VMtgYKHghd/GJDKmuWZZZh4NbCa5Kee5mORLF4M8
   F8tDMUh+H8/V6UIZCJ6YzArjN6twQA+Kdux8Z3XAgSAaQmDKWbstIWQqd
   IZjBl4y5UCtcoF/YuwUoUHeONoS0j0hNUYDbdcl800ULuUwQzm5v+IhiN
   xdG37LredtPRXkaEoYyNYV284L/LYEgx+kl17FG9u92ZoLNuaPbLpKeDF
   IG56SIp20FlduPq1OzK9pBzUSnK2Mejv720QeMzuZUZNsb74tZ+c1KAZ6
   w==;
X-CSE-ConnectionGUID: bCSmCs30SlGL5W4uon2Gfg==
X-CSE-MsgGUID: BN7u10JbQnOqbwPTuy8pRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33102269"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="33102269"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 17:26:10 -0700
X-CSE-ConnectionGUID: nubAASboTKCuHX2AnKUcoQ==
X-CSE-MsgGUID: uwh7sdDLT5GzWAY+UF2bFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="61679439"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Aug 2024 17:25:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgZAi-000Aio-0M;
	Wed, 21 Aug 2024 00:25:56 +0000
Date: Wed, 21 Aug 2024 08:25:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jeongjun Park <aha310510@gmail.com>, wenjia@linux.ibm.com,
	jaka@linux.ibm.com, alibuda@linux.alibaba.com,
	tonylu@linux.alibaba.com, guwen@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, utz.bacher@de.ibm.com,
	dust.li@linux.alibaba.com, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller <syzkaller@googlegroups.com>,
	Jeongjun Park <aha310510@gmail.com>
Subject: Re: [PATCH net,v6,2/2] net/smc: initialize ipv6_pinfo_offset in
 smc_inet6_prot and add smc6_sock structure
Message-ID: <202408210816.Z0iGhrhb-lkp@intel.com>
References: <20240820121548.380342-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820121548.380342-1-aha310510@gmail.com>

Hi Jeongjun,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc4 next-20240820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeongjun-Park/net-smc-modify-smc_sock-structure/20240820-201856
base:   linus/master
patch link:    https://lore.kernel.org/r/20240820121548.380342-1-aha310510%40gmail.com
patch subject: [PATCH net,v6,2/2] net/smc: initialize ipv6_pinfo_offset in smc_inet6_prot and add smc6_sock structure
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240821/202408210816.Z0iGhrhb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408210816.Z0iGhrhb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408210816.Z0iGhrhb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/smc/smc_inet.c:78:68: error: expected '}' before ';' token
      78 |         .ipv6_pinfo_offset      = offsetof(struct smc6_sock, inet6);
         |                                                                    ^
   net/smc/smc_inet.c:68:38: note: to match this '{'
      68 | static struct proto smc_inet6_prot = {
         |                                      ^


vim +78 net/smc/smc_inet.c

    67	
    68	static struct proto smc_inet6_prot = {
    69		.name		= "INET6_SMC",
    70		.owner		= THIS_MODULE,
    71		.init		= smc_inet_init_sock,
    72		.hash		= smc_hash_sk,
    73		.unhash		= smc_unhash_sk,
    74		.release_cb	= smc_release_cb,
    75		.obj_size	= sizeof(struct smc6_sock),
    76		.h.smc_hash	= &smc_v6_hashinfo,
    77		.slab_flags	= SLAB_TYPESAFE_BY_RCU,
  > 78		.ipv6_pinfo_offset	= offsetof(struct smc6_sock, inet6);
    79	};
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
