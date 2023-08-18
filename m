Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE428478
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 03:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692329811; x=1723865811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e6mQbkZhJ+crlMj97hR9Gkzu8n2w0+M+4yl1/MdMkHQ=;
  b=H0or6js4eWrMBdMYRNMegKCgXf4VS9EQPnRsGg0MxKfe2H35Vgo41YaX
   gH+uZXaZyFx2g52GfQZJW9fIEPcrriLGmpcVzeGfVvWRc1+I3fYUk0kzB
   Qk+gLEpNqnGxJB4z1Fhwiv0BG+X+BIKOzvXF/Ka3PAfl2v1a7F2JJHUy5
   jJ5vn/iqWxkeXE7QtrXdgspBqVPfxUy/KfzL3Ej8tPXH2urreMEjJ8LWO
   AYWWhrMRHYLlmgfERjsBr+mfWdbOC0rMObjmBgH+uZCDhcMUCj8X2Dt1y
   Loz+kmCf1ZfwlFnIyrrgt5MWyJ7Nj0LJrKo0iXLPnAqdOd+SUKmXrFLr2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363161783"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="363161783"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 20:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="800312178"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="800312178"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 20:36:44 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWqI0-00024a-0n;
	Fri, 18 Aug 2023 03:36:44 +0000
Date: Fri, 18 Aug 2023 11:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, hannes@cmpxchg.org, kernel-team@meta.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, yosryahmed@google.com
Subject: Re: [PATCH v2] workingset: ensure memcg is valid for recency check
Message-ID: <202308181130.VIAl2viu-lkp@intel.com>
References: <20230817190126.3155299-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817190126.3155299-1-nphamcs@gmail.com>

Hi Nhat,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc6 next-20230817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/workingset-ensure-memcg-is-valid-for-recency-check/20230818-030311
base:   linus/master
patch link:    https://lore.kernel.org/r/20230817190126.3155299-1-nphamcs%40gmail.com
patch subject: [PATCH v2] workingset: ensure memcg is valid for recency check
config: x86_64-buildonly-randconfig-r003-20230818 (https://download.01.org/0day-ci/archive/20230818/202308181130.VIAl2viu-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181130.VIAl2viu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181130.VIAl2viu-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/workingset.c: In function 'unpack_shadow':
>> mm/workingset.c:245:32: error: dereferencing pointer to incomplete type 'struct mem_cgroup'
     245 |  if (memcg && css_tryget(&memcg->css))
         |                                ^~


vim +245 mm/workingset.c

   208	
   209	/*
   210	 * Unpacks the stored fields of a shadow entry into the given pointers.
   211	 *
   212	 * The memcg pointer is only populated if the memcg recorded in the shadow
   213	 * entry is valid. In this case, a reference to the memcg will be acquired,
   214	 * and a corresponding mem_cgroup_put() will be needed when we no longer
   215	 * need the memcg.
   216	 */
   217	static void unpack_shadow(void *shadow, struct mem_cgroup **memcgp,
   218				pg_data_t **pgdat, unsigned long *evictionp, bool *workingsetp)
   219	{
   220		unsigned long entry = xa_to_value(shadow);
   221		struct mem_cgroup *memcg;
   222		int memcgid, nid;
   223		bool workingset;
   224	
   225		workingset = entry & ((1UL << WORKINGSET_SHIFT) - 1);
   226		entry >>= WORKINGSET_SHIFT;
   227		nid = entry & ((1UL << NODES_SHIFT) - 1);
   228		entry >>= NODES_SHIFT;
   229		memcgid = entry & ((1UL << MEM_CGROUP_ID_SHIFT) - 1);
   230		entry >>= MEM_CGROUP_ID_SHIFT;
   231	
   232		/*
   233		 * Look up the memcg associated with the stored ID. It might
   234		 * have been deleted since the folio's eviction.
   235		 *
   236		 * Note that in rare events the ID could have been recycled
   237		 * for a new cgroup that refaults a shared folio. This is
   238		 * impossible to tell from the available data. However, this
   239		 * should be a rare and limited disturbance, and activations
   240		 * are always speculative anyway. Ultimately, it's the aging
   241		 * algorithm's job to shake out the minimum access frequency
   242		 * for the active cache.
   243		 */
   244		memcg = mem_cgroup_from_id(memcgid);
 > 245		if (memcg && css_tryget(&memcg->css))
   246			*memcgp = memcg;
   247		else
   248			*memcgp = NULL;
   249	
   250		*pgdat = NODE_DATA(nid);
   251		*evictionp = entry;
   252		*workingsetp = workingset;
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
