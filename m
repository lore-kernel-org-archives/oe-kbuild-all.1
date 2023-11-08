Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9EBD270
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSklPCTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699426086; x=1730962086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVHYPaXTamywbU5+C735OSvUnP4uuUe4vaks06z75bk=;
  b=NSklPCTzi5nhJD6XBv8BvvOK2/f7rkN33wXaYQknsTU6MWKaIpZ0qNJ3
   DPezpOex4TQ4eiSA9Orhl088qoBkCsnDnEaGh2SLtOVsopuHdLtoWtED1
   Ajf4x21M2R52mJ+6yVh32Nbd+qRnhIIE0CnPI2Nyc1XycDBlBapsBZFyl
   z6Jws9Sxvte4PZPfFt+2mBAn2/2pETsdyojRzQUj25FopF5ksj4rG9VYV
   NoXI4wAI+Eid2UUXrQkTNYRjvRoNFENoBIhciu52s/i7fqkPRkApgHajN
   0TpjYwQYrelhOEiSWkwThIyEFpRi95fUr39s+zdh1YUD3fNGDuNqfnzRk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="11256767"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="11256767"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 22:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="712840117"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="712840117"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2023 22:48:03 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0cM4-0007kE-35;
	Wed, 08 Nov 2023 06:48:00 +0000
Date: Wed, 8 Nov 2023 14:47:05 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ipvlan/ipvlan_core.c:57:36: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202311081448.Poltc9om-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   305230142ae0637213bf6e04f6d9f10bbcb74af8
commit: c675e06a98a474f7ad0af32ce467613da818da52 ipvlan: decouple l3s mode dependencies from other modes
date:   4 years, 9 months ago
config: i386-randconfig-062-20230914 (https://download.01.org/0day-ci/archive/20231108/202311081448.Poltc9om-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081448.Poltc9om-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081448.Poltc9om-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ipvlan/ipvlan_core.c:57:36: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] a @@     got restricted __be32 const [usertype] s_addr @@
   drivers/net/ipvlan/ipvlan_core.c:57:36: sparse:     expected unsigned int [usertype] a
   drivers/net/ipvlan/ipvlan_core.c:57:36: sparse:     got restricted __be32 const [usertype] s_addr

vim +57 drivers/net/ipvlan/ipvlan_core.c

2ad7bf3638411c Mahesh Bandewar 2014-11-23  52  
2ad7bf3638411c Mahesh Bandewar 2014-11-23  53  static u8 ipvlan_get_v4_hash(const void *iaddr)
2ad7bf3638411c Mahesh Bandewar 2014-11-23  54  {
2ad7bf3638411c Mahesh Bandewar 2014-11-23  55  	const struct in_addr *ip4_addr = iaddr;
2ad7bf3638411c Mahesh Bandewar 2014-11-23  56  
2ad7bf3638411c Mahesh Bandewar 2014-11-23 @57  	return jhash_1word(ip4_addr->s_addr, ipvlan_jhash_secret) &
2ad7bf3638411c Mahesh Bandewar 2014-11-23  58  	       IPVLAN_HASH_MASK;
2ad7bf3638411c Mahesh Bandewar 2014-11-23  59  }
2ad7bf3638411c Mahesh Bandewar 2014-11-23  60  

:::::: The code at line 57 was first introduced by commit
:::::: 2ad7bf3638411cb547f2823df08166c13ab04269 ipvlan: Initial check-in of the IPVLAN driver.

:::::: TO: Mahesh Bandewar <maheshb@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
