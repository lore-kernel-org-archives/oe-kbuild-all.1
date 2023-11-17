Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5043B30646
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 21:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONoArD1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700257216; x=1731793216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f5qRy44lUGGRDDEIKWTWdVUa9s0JqfBcvmyjWEdeN+E=;
  b=ONoArD1iFkQJKcO2v2WsKtjulgP10ui5sImd177AdzTsym8WTPegNMn5
   eWA7gzFe/SD5qbj5AVq9rnOHp+gvJFFPEQ5mU26GtpcQEYg89gVBamk4Y
   hrFMXLI4+mrqzEPShGHeVqejk3Ty8pjBzSdLlh08coEHBr+8jPnob5Cs1
   S76bAU7llhSlpxNvzZWZ29WzYxb1uCyTfjziNxCAiNpiotHuGhMzWvKn5
   jxjywNpWTYXbmehytx7RAuczuBUZMSVLadBT5TW/trQrKQkh/3sK1Qgax
   AcgQjF2v62FvW2YNdh8OGpvIXmEPyW2bcEeZfGaHy14u2h2XT6wCTia2L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="376420733"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="376420733"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 13:40:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="6970021"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Nov 2023 13:40:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r46ZN-0003B2-0f;
	Fri, 17 Nov 2023 21:40:09 +0000
Date: Sat, 18 Nov 2023 05:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sumanth Korikkar <sumanthk@linux.ibm.com>,
	linux-mm <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	linux-s390 <linux-s390@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/8] mm: use vmem_altmap code without CONFIG_ZONE_DEVICE
Message-ID: <202311180545.VeyRXEDq-lkp@intel.com>
References: <20231114180238.1522782-4-sumanthk@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114180238.1522782-4-sumanthk@linux.ibm.com>

Hi Sumanth,

kernel test robot noticed the following build errors:

[auto build test ERROR on s390/features]
[also build test ERROR on kvms390/next linus/master v6.7-rc1]
[cannot apply to akpm-mm/mm-everything next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sumanth-Korikkar/mm-memory_hotplug-fix-memory-hotplug-locking-order/20231115-035455
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/20231114180238.1522782-4-sumanthk%40linux.ibm.com
patch subject: [PATCH 3/8] mm: use vmem_altmap code without CONFIG_ZONE_DEVICE
config: x86_64-buildonly-randconfig-002-20231118 (https://download.01.org/0day-ci/archive/20231118/202311180545.VeyRXEDq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180545.VeyRXEDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180545.VeyRXEDq-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/mm/init_64.o: in function `remove_pagetable':
>> init_64.c:(.meminit.text+0xfc7): undefined reference to `vmem_altmap_free'
   ld: mm/memory_hotplug.o: in function `__add_pages':
>> memory_hotplug.c:(.ref.text+0xc01): undefined reference to `vmem_altmap_offset'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
