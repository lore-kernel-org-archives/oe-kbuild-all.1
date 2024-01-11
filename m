Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5092723AA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 02:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBdpCcPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704939805; x=1736475805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NgZ7rJyZmxTkR7FL+snQ3IzAwjhgd8yQ7c1vr9pp67s=;
  b=dBdpCcPwxHH5zltwgCtIFLEO94LeJ9X6/CjcqQMOyfPd5JA5iMiCQ4H7
   HgO9y+uiu1fSb285Vqq/gS8baDkgFyY///OVT9NLsC+9ZgIgGUnQ5Ob/R
   /wmNBMuHeIGJ/wT4SPtDvRuLl6F2Bcu+Zf1DUZodNmNvq14fl9hRCeJKX
   4NVOiC3dfMR2V68Pc3EGfPi0OzDvTcM659MCefvZqdarF2vJ/NFcxtyX+
   ECf5HI4uRENjnY/xi5JQTTOOA3ueN5Y9kUh7nja/6O0AflBwkdYAo7x72
   GHaaYtwz6OMwHRXoPLdvPL/35a2nX19mzx1VhuLOAjTmm12QmdUIOwv4w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="12202802"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="12202802"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 18:23:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="955575692"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="955575692"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 10 Jan 2024 18:23:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNkj2-0007iC-30;
	Thu, 11 Jan 2024 02:23:20 +0000
Date: Thu, 11 Jan 2024 10:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>, Honggyu Kim <honggyu.kim@sk.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>,
	Srinivasulu Thanneeru <sthanneeru.opensrc@micron.com>,
	Ravi Jonnalagadda <ravis.opensrc@micron.com>
Subject: [gmprice:mempolicy2_mbind2 3/13] mm/mempolicy.c:1965:40: warning:
 variable 'cur_node' set but not used
Message-ID: <202401111048.C45IHXRI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux mempolicy2_mbind2
head:   5dc13fbba4bf6f4a96d78938d99006aebed9613e
commit: cabe4e50f46d000ff06b4702d62be0c0a51a128c [3/13] mm/mempolicy: introduce MPOL_WEIGHTED_INTERLEAVE for weighted interleaving
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240111/202401111048.C45IHXRI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111048.C45IHXRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111048.C45IHXRI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mempolicy.c: In function 'weighted_interleave_nid':
>> mm/mempolicy.c:1965:40: warning: variable 'cur_node' set but not used [-Wunused-but-set-variable]
    1965 |         unsigned int target, nr_nodes, cur_node;
         |                                        ^~~~~~~~
   mm/mempolicy.c: In function 'mpol_parse_str':
   mm/mempolicy.c:3236:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    3236 |                 *--flags = '=';
         |                 ~~~~~~~~~^~~~~
   mm/mempolicy.c:3118:26: note: destination object 'str' of size [0, 9223372036854775807]
    3118 | int mpol_parse_str(char *str, struct mempolicy **mpol)
         |                    ~~~~~~^~~
   mm/mempolicy.c:3236:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    3236 |                 *--flags = '=';
         |                 ~~~~~~~~~^~~~~
   mm/mempolicy.c:3118:26: note: destination object 'str' of size [0, 9223372036854775807]
    3118 | int mpol_parse_str(char *str, struct mempolicy **mpol)
         |                    ~~~~~~^~~
   mm/mempolicy.c:3236:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    3236 |                 *--flags = '=';
         |                 ~~~~~~~~~^~~~~
   mm/mempolicy.c:3118:26: note: destination object 'str' of size [0, 9223372036854775807]
    3118 | int mpol_parse_str(char *str, struct mempolicy **mpol)
         |                    ~~~~~~^~~
   mm/mempolicy.c:3236:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    3236 |                 *--flags = '=';
         |                 ~~~~~~~~~^~~~~
   mm/mempolicy.c:3118:26: note: destination object 'str' of size [0, 9223372036854775807]
    3118 | int mpol_parse_str(char *str, struct mempolicy **mpol)
         |                    ~~~~~~^~~
   mm/mempolicy.c:3236:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    3236 |                 *--flags = '=';
         |                 ~~~~~~~~~^~~~~
   mm/mempolicy.c:3118:26: note: destination object 'str' of size [0, 9223372036854775807]
    3118 | int mpol_parse_str(char *str, struct mempolicy **mpol)
         |                    ~~~~~~^~~
   mm/mempolicy.c:3236:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
    3236 |                 *--flags = '=';
         |                 ~~~~~~~~~^~~~~
   mm/mempolicy.c:3118:26: note: destination object 'str' of size [0, 9223372036854775807]
    3118 | int mpol_parse_str(char *str, struct mempolicy **mpol)
         |                    ~~~~~~^~~


vim +/cur_node +1965 mm/mempolicy.c

  1961	
  1962	static unsigned int weighted_interleave_nid(struct mempolicy *pol, pgoff_t ilx)
  1963	{
  1964		nodemask_t nodemask;
> 1965		unsigned int target, nr_nodes, cur_node;
  1966		struct iw_table *table;
  1967		unsigned int weight_total = 0;
  1968		u8 weight;
  1969		int nid;
  1970	
  1971		nr_nodes = read_once_policy_nodemask(pol, &nodemask);
  1972		if (!nr_nodes)
  1973			return numa_node_id();
  1974	
  1975		rcu_read_lock();
  1976		table = rcu_dereference(iw_table);
  1977		/* calculate the total weight */
  1978		for_each_node_mask(nid, nodemask)
  1979			weight_total += table->weights[nid];
  1980	
  1981		/* Calculate the node offset based on totals */
  1982		target = ilx % weight_total;
  1983		nid = first_node(nodemask);
  1984		cur_node = 0;
  1985		while (target) {
  1986			weight = table->weights[nid];
  1987			if (target < weight)
  1988				break;
  1989			target -= weight;
  1990			nid = next_node_in(nid, nodemask);
  1991		}
  1992		rcu_read_unlock();
  1993		return nid;
  1994	}
  1995	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
