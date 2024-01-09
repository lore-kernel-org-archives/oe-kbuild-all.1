Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387DC13AE2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jan 2024 03:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPUwW/6L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704771241; x=1736307241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r1/V/Q/VbvJvX735ytG3Ysh4o8esIAtCrcXC73TR+Z4=;
  b=ZPUwW/6LHGovR7TZin8rGEZ/DLIYbxQdAOM46oZW8G7zITZwRNZNlOh6
   1G1jUkJ4TJAA54oVDwKl/cc6vTvAw1SdZrS0vEDGHJMIVxUoSB+R647lR
   +VWhUIGqF9I1smuPDcWyBQPxhZ2rS1fR/zCeSET1NH59Yp934VmBiMhfT
   5eoQFAkuoHbMgcbEW54pzgmAg012oX00DJfEi1AtkvmiYMNVmt68T6G6o
   ZZWZRkWGj95UlGIvibCBhRVWGIbpFWf1+Lnb0CNa+d/Kh/QZvnlyIxrvO
   2DsT9K5q61S/rVfr+aoKurklyXb+V6DpeE49NwbNrkjwHzF2TecT1MWbK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4832406"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="4832406"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 19:33:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="872098191"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="872098191"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jan 2024 19:33:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN2sE-0005Q7-2S;
	Tue, 09 Jan 2024 03:33:54 +0000
Date: Tue, 9 Jan 2024 11:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>, Honggyu Kim <honggyu.kim@sk.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>,
	Srinivasulu Thanneeru <sthanneeru.opensrc@micron.com>,
	Ravi Jonnalagadda <ravis.opensrc@micron.com>
Subject: [gmprice:mempolicy2_mbind2 3/12] mm/mempolicy.c:1992:17: warning:
 ISO C90 forbids variable length array 'weights'
Message-ID: <202401091136.phEq6Fi8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux mempolicy2_mbind2
head:   4aff1aeabff106d25029a57f52d961d703588bc3
commit: fcf523ffd2839c474457c3af29555129848d8eb3 [3/12] mm/mempolicy: introduce MPOL_WEIGHTED_INTERLEAVE for weighted interleaving
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240109/202401091136.phEq6Fi8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401091136.phEq6Fi8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401091136.phEq6Fi8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mempolicy.c: In function 'weighted_interleave_nid':
>> mm/mempolicy.c:1992:17: warning: ISO C90 forbids variable length array 'weights' [-Wvla]
    1992 |                 u8 weights[nr_nodes];
         |                 ^~
   mm/mempolicy.c: In function 'alloc_pages_bulk_array_weighted_interleave':
   mm/mempolicy.c:2419:17: warning: ISO C90 forbids variable length array 'weights' [-Wvla]
    2419 |                 u8 weights[nnodes];
         |                 ^~
   mm/mempolicy.c: In function 'mpol_parse_str':
   mm/mempolicy.c:3237:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    3237 |                 *--flags = '=';
         |                 ~~~~~~~~~^~~~~
   mm/mempolicy.c:3119:26: note: destination object 'str' of size [0, 9223372036854775807]
    3119 | int mpol_parse_str(char *str, struct mempolicy **mpol)
         |                    ~~~~~~^~~
   mm/mempolicy.c:3237:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    3237 |                 *--flags = '=';
         |                 ~~~~~~~~~^~~~~
   mm/mempolicy.c:3119:26: note: destination object 'str' of size [0, 9223372036854775807]
    3119 | int mpol_parse_str(char *str, struct mempolicy **mpol)
         |                    ~~~~~~^~~
   mm/mempolicy.c:3237:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    3237 |                 *--flags = '=';
         |                 ~~~~~~~~~^~~~~
   mm/mempolicy.c:3119:26: note: destination object 'str' of size [0, 9223372036854775807]
    3119 | int mpol_parse_str(char *str, struct mempolicy **mpol)
         |                    ~~~~~~^~~
   mm/mempolicy.c:3237:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    3237 |                 *--flags = '=';
         |                 ~~~~~~~~~^~~~~
   mm/mempolicy.c:3119:26: note: destination object 'str' of size [0, 9223372036854775807]
    3119 | int mpol_parse_str(char *str, struct mempolicy **mpol)
         |                    ~~~~~~^~~
   mm/mempolicy.c:3237:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    3237 |                 *--flags = '=';
         |                 ~~~~~~~~~^~~~~
   mm/mempolicy.c:3119:26: note: destination object 'str' of size [0, 9223372036854775807]
    3119 | int mpol_parse_str(char *str, struct mempolicy **mpol)
         |                    ~~~~~~^~~
   mm/mempolicy.c:3237:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    3237 |                 *--flags = '=';
         |                 ~~~~~~~~~^~~~~
   mm/mempolicy.c:3119:26: note: destination object 'str' of size [0, 9223372036854775807]
    3119 | int mpol_parse_str(char *str, struct mempolicy **mpol)
         |                    ~~~~~~^~~


vim +/weights +1992 mm/mempolicy.c

  1981	
  1982	static unsigned int weighted_interleave_nid(struct mempolicy *pol, pgoff_t ilx)
  1983	{
  1984		nodemask_t nodemask;
  1985		unsigned int target, weight_total, nr_nodes, cur_node;
  1986		int nid = numa_node_id();
  1987		u8 weight;
  1988	
  1989		nr_nodes = read_once_policy_nodemask(pol, &nodemask);
  1990	
  1991		if (nr_nodes) {
> 1992			u8 weights[nr_nodes];
  1993	
  1994			weight_total = read_once_interleave_weights(pol, weights,
  1995								    &nodemask);
  1996			if (!weight_total)
  1997				return nid;
  1998	
  1999			/* Finally, calculate the node offset based on totals */
  2000			target = ilx % weight_total;
  2001			nid = first_node(nodemask);
  2002			cur_node = 0;
  2003			while (target) {
  2004				weight = weights[cur_node++];
  2005				if (target < weight)
  2006					break;
  2007				target -= weight;
  2008				nid = next_node_in(nid, nodemask);
  2009			}
  2010		}
  2011		return nid;
  2012	}
  2013	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
