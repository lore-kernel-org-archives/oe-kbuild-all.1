Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D344620690
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 22:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687471851; x=1719007851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BKdj/JadWCFUxAEp/Fu2mYUFLMkg1UeER0yJgeOg5Og=;
  b=Ty5XUMB0p0Aee+nFSh39Mb6U8wGhGrwo2H3sZzbsbekYFq321lVLraD0
   tOxs+B/aJGYfqNRGsA9MNXfp9LTjplerrh0ERGk4gLMsHfqyD+V5FaJIm
   uKm/RUCIKM0v8xYqFXD8+M5Qy093XF8nPY2e6aWiLu9O/RY2alHk/cO0D
   yYPJHCCYOA6oECykjQjUAuQF0PHaX6aBwm6gVlf74XoLwaO0XM9jju54s
   CfTMvYZQStbLiph6kgUSo5E+5WZ1rstngxcqATlD6FWw7o+Y/O98QcDS7
   2XetQh/F9hF65WNWKujC9U/fpiHS6PdL5ZPv5kZPFbqGa6TQc7plQkY5w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350388255"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="350388255"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 15:10:51 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="749508768"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="749508768"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Jun 2023 15:10:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCSVr-0007mx-06;
	Thu, 22 Jun 2023 22:10:47 +0000
Date: Fri, 23 Jun 2023 06:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, James Houghton <jthoughton@google.com>,
	Jerome Marchand <jmarchan@redhat.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Junxiao Chang <junxiao.chang@intel.com>,
	Muchun Song <muchun.song@linux.dev>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Michal Hocko <mhocko@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v1 2/2] udmabuf: Add back support for mapping hugetlb
 pages
Message-ID: <202306230534.TIq82gef-lkp@intel.com>
References: <20230622072710.3707315-3-vivek.kasireddy@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622072710.3707315-3-vivek.kasireddy@intel.com>

Hi Vivek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master next-20230622]
[cannot apply to drm-misc/drm-misc-next drm-tip/drm-tip v6.4-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udmabuf-Use-vmf_insert_pfn-and-VM_PFNMAP-for-handling-mmap/20230622-155402
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230622072710.3707315-3-vivek.kasireddy%40intel.com
patch subject: [PATCH v1 2/2] udmabuf: Add back support for mapping hugetlb pages
config: openrisc-randconfig-c044-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230534.TIq82gef-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230534.TIq82gef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230534.TIq82gef-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma-buf/udmabuf.c:172:2-7: WARNING: NULL check before some freeing functions is not needed.
   drivers/dma-buf/udmabuf.c:360:2-7: WARNING: NULL check before some freeing functions is not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
