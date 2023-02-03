Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921C61FBC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 10:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675421879; x=1706957879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3uvNBe42ilRcIJrlY3Y23M7FkjLR3gOvjtrUa5gy33Q=;
  b=FuDu5RZKUkCZulxH1p1bVbZFcOLrAJJSaFefbKWLRI0lPyT6NSIKbuQO
   g4RYAsUchZD7jEUBNxZ5WIkT3o66kA30x5n2iNL33BURARuiUeK4Nk9gH
   1+Oll+0DrShPwNVApLIL72nSrYYdzXHY9v173n85c+//J/9z7b1veEgos
   ADZQ9H9gN9cO1RcJzIMTuX+5VM0Nky+DJKsI3Dl0wZdfXVFYMfGPr6AnP
   OAtTZaMLSLV9qzLdzlsZUNGm1OWJiJ3V4z4aVUwia250wEDJFJWfdlEm7
   IksHPLykITW9qxwG2gRjw3GmPeofbUDji6XyvRvSJ6TFXKTzWCYgh+s20
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="312375671"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="312375671"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 02:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="643236131"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="643236131"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Feb 2023 02:57:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNtlT-0000Ph-1N;
	Fri, 03 Feb 2023 10:57:55 +0000
Date: Fri, 3 Feb 2023 18:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 1/2] mm: vmscan: refactor updating reclaimed pages
 in reclaim_state
Message-ID: <202302031836.3HfDGZJu-lkp@intel.com>
References: <20230202233229.3895713-2-yosryahmed@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202233229.3895713-2-yosryahmed@google.com>

Hi Yosry,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on linus/master v6.2-rc6 next-20230203]
[cannot apply to vbabka-slab/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/mm-vmscan-refactor-updating-reclaimed-pages-in-reclaim_state/20230203-073330
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20230202233229.3895713-2-yosryahmed%40google.com
patch subject: [RFC PATCH v1 1/2] mm: vmscan: refactor updating reclaimed pages in reclaim_state
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20230203/202302031836.3HfDGZJu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/cfdb5fa3107c03c8e0ef434d181c115b770f7c99
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yosry-Ahmed/mm-vmscan-refactor-updating-reclaimed-pages-in-reclaim_state/20230203-073330
        git checkout cfdb5fa3107c03c8e0ef434d181c115b770f7c99
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "report_freed_pages" [fs/xfs/xfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
