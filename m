Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DCA31961A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 02:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769136285; cv=none; b=FlG38KMou32/knuayzoCPGVpudZPnGNkRfyDVo/vTwvqRNsOYny9M2YeFWb6MjYnRqzlc+tk37z7tam3AE35OKJ8aCPcYfx424ARVKXTLoelpVo3SjsQAGsm8C0ub53LxIliMlZ1C/FxF/c68p9PD4wtTd8Em+YpruLO36H5aBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769136285; c=relaxed/simple;
	bh=8ndyNJikJsEpVSc9dj51nBXSlOB/gf6TZifRUHaN9w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5PqH6dURPaN84c+9pvg532wNf1d4O57p6FLZmUjGj4t25yLc7c+7dejHOilfHLkk9ejxeyjfJINETenAK9X2LCJOhlVO1642HoegrU83DcJCz/L/TlAHhWyx5BMYe1PB/ZKk2FaXKyimPHW2hITA+ZlSqD1gdAztl7ZpMJgo8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5za1WRq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5za1WRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769136278; x=1800672278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ndyNJikJsEpVSc9dj51nBXSlOB/gf6TZifRUHaN9w0=;
  b=c5za1WRqtq/kF7UqhKfbI1nY9Pd2Kjcv0dDC8FGMMaI0KakxgOIhB2mG
   ykgPqmfo5nZz7RL5Vq/ThSbxfZ/Z/sg6gTlHRdu8jL8600/hiwQjrcjsL
   KnP/LByNf6ndgLQDLM4xu9agcnW94xpXjYv2AEF5izv+xp1BXiR5CJD3L
   8T5i/VCxMWXENfOobZT4K6yxG1ollWERIhQ+cB2XYWCNBKU0F3pkW06eK
   aa2oA3GVqJ6N4qk4gTwYFOK34olIVO6iLxUq/U11obXl8N+Ds2v6fV1Ys
   eb5s+dj0n6aNtr7EFPUECi1olEB1cee/E/J+UUlfCAlBy6m6qq32YBmNE
   Q==;
X-CSE-ConnectionGUID: qr+0x5jPR9yfExHhrT61Tg==
X-CSE-MsgGUID: WoupLt5pQAeVLB9QggfDBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70440036"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="70440036"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:44:34 -0800
X-CSE-ConnectionGUID: /cURpc/CT/q72pVQuMgWrw==
X-CSE-MsgGUID: VLZI25VOQ0uqjgYyO5JaEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="211361570"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jan 2026 18:44:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj79v-00000000TS2-33aC;
	Fri, 23 Jan 2026 02:44:27 +0000
Date: Fri, 23 Jan 2026 10:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
Message-ID: <202601231051.5GWCp3mt-lkp@intel.com>
References: <20260122161009.3865888-5-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122161009.3865888-5-thierry.reding@kernel.org>

Hi Thierry,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20260122]
[cannot apply to drm-misc/drm-misc-next robh/for-next linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/dt-bindings-reserved-memory-Document-Tegra-VPR/20260123-001244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260122161009.3865888-5-thierry.reding%40kernel.org
patch subject: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
config: i386-buildonly-randconfig-003-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231051.5GWCp3mt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231051.5GWCp3mt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231051.5GWCp3mt-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/cma_debug.c: In function 'cma_debugfs_init':
>> mm/cma_debug.c:207:25: error: 'cma_area_count' undeclared (first use in this function)
     207 |         for (i = 0; i < cma_area_count; i++)
         |                         ^~~~~~~~~~~~~~
   mm/cma_debug.c:207:25: note: each undeclared identifier is reported only once for each function it appears in
>> mm/cma_debug.c:208:38: error: 'cma_areas' undeclared (first use in this function); did you mean 'cma_free'?
     208 |                 cma_debugfs_add_one(&cma_areas[i], cma_debugfs_root);
         |                                      ^~~~~~~~~
         |                                      cma_free


vim +/cma_area_count +207 mm/cma_debug.c

28b24c1fc8c22c Sasha Levin 2015-04-14  199  
28b24c1fc8c22c Sasha Levin 2015-04-14  200  static int __init cma_debugfs_init(void)
28b24c1fc8c22c Sasha Levin 2015-04-14  201  {
5a7f1b2f2fbeb4 Yue Hu      2019-03-05  202  	struct dentry *cma_debugfs_root;
28b24c1fc8c22c Sasha Levin 2015-04-14  203  	int i;
28b24c1fc8c22c Sasha Levin 2015-04-14  204  
28b24c1fc8c22c Sasha Levin 2015-04-14  205  	cma_debugfs_root = debugfs_create_dir("cma", NULL);
28b24c1fc8c22c Sasha Levin 2015-04-14  206  
28b24c1fc8c22c Sasha Levin 2015-04-14 @207  	for (i = 0; i < cma_area_count; i++)
5a7f1b2f2fbeb4 Yue Hu      2019-03-05 @208  		cma_debugfs_add_one(&cma_areas[i], cma_debugfs_root);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
