Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3161DDD2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 13:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqFw8dl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699537024; x=1731073024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qJDJhCo74rCI4qHoiXa5Sq2vpDHdd2A6yQMMNNW6Fqc=;
  b=PqFw8dl0G8r1CLlCfu4LMq7dGZcejQjZ5L+12aTpvf88HR3MXJ/6XYx0
   /32WhXovSj3FyOq9a6/RDNjLrDmhMKbE4aDx66tc4wT1kbGIEw77qBTOS
   XY8XGDAbXKcFXbZ9v2QarGLGLw22qX7NQ0FSqYp4OUoZjJSZZ5mG3tRvE
   f4Z6BgwuxRClhI/GtXAnpA1ZlGmXAsnJRlvfzK2WNEZ+lsv7ZDCl5aiey
   Z4S8H7vDiVZBxbpgXz47To6mI9YgdmDauq4pKzLhzIYWsLim/cdrgpK+X
   f1POGbhDS/4iychSq0zApr72YPK88wB8k0scXoI26KVq9FuOo/o4R+/v5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="389784796"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="389784796"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 05:37:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="739848079"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="739848079"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Nov 2023 05:37:00 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r15DN-0008kl-1t;
	Thu, 09 Nov 2023 13:36:57 +0000
Date: Thu, 9 Nov 2023 21:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 2/3] mm/mempolicy: implement weighted interleave
Message-ID: <202311092123.ohXcbYqn-lkp@intel.com>
References: <20231109002517.106829-3-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109002517.106829-3-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cxl/next]
[also build test ERROR on tj-cgroup/for-next cxl/pending v6.6]
[cannot apply to akpm-mm/mm-everything linus/master next-20231109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-mempolicy-implement-weighted-interleave/20231109-092543
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20231109002517.106829-3-gregory.price%40memverge.com
patch subject: [RFC PATCH v4 2/3] mm/mempolicy: implement weighted interleave
config: arm64-randconfig-004-20231109 (https://download.01.org/0day-ci/archive/20231109/202311092123.ohXcbYqn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092123.ohXcbYqn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092123.ohXcbYqn-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: mm/mempolicy.o: in function `interleave_nodes':
>> mempolicy.c:(.text+0xfe0): undefined reference to `mem_cgroup_get_il_weight'
>> aarch64-linux-ld: mempolicy.c:(.text+0x1054): undefined reference to `mem_cgroup_get_il_weight'
   aarch64-linux-ld: mm/mempolicy.o: in function `alloc_pages_bulk_array_interleave':
>> mempolicy.c:(.text+0x1110): undefined reference to `mem_cgroup_get_il_weights'
   aarch64-linux-ld: mm/mempolicy.o: in function `offset_il_node':
   mempolicy.c:(.text+0x1554): undefined reference to `mem_cgroup_get_il_weights'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
