Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C09D7EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 03:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVI1xcUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699585834; x=1731121834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9r5/8GoIy/ZNWcBZl0AGl/u3BSOnlVxrSTCY+WaKb4s=;
  b=ZVI1xcURK146oO+7D20sLVtrchfFbuc45oPvRAGJ91ihBZXNPRxivTfW
   tpoAYKJDWR5ZzKkRZmu02ZZrxGewYd6dl3nBn3Z3f6dW4av05yvOROayt
   sjqfLhSaokKOEp6oaqhgkrY/fFZIjGZuE6Z9BsUK6Osi6ZcDrURHQ9+k+
   cDbSReLxQCGvrYMmLQI5kpb46I8hd8JdzAE8M387VHbx7tOxSpUDGt7yq
   VuGw9qQ43ns9Mr+vb60H8LNVU5ym/44wUc8vl4yE5peOZCH6iW+kg7/7n
   eXs9Zly/s2uYfhQZruy5Ig9H4QFMZT2jFMu86s46JFaeXJU8ImQ/fAEc7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3103997"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="3103997"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 19:10:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="1095071689"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="1095071689"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Nov 2023 19:10:32 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Hug-0009OY-1d;
	Fri, 10 Nov 2023 03:10:30 +0000
Date: Fri, 10 Nov 2023 11:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-hmem-report 19/21] drivers/cxl/core/region.c:2937:26:
 warning: variable 'port' set but not used
Message-ID: <202311101136.cwMDMtiI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   167b3dd4513b62b4368475dc81bc6161da35f80b
commit: b7b0a5af232dfa7d5c73cb690b5648c6c4f3200b [19/21] cxl/region: Calculate performance data for a region
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231110/202311101136.cwMDMtiI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101136.cwMDMtiI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101136.cwMDMtiI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cxl/core/region.c: In function 'cxl_region_perf_data_calculate':
>> drivers/cxl/core/region.c:2937:26: warning: variable 'port' set but not used [-Wunused-but-set-variable]
    2937 |         struct cxl_port *port;
         |                          ^~~~


vim +/port +2937 drivers/cxl/core/region.c

  2928	
  2929	static int cxl_region_perf_data_calculate(struct cxl_region *cxlr)
  2930	{
  2931		struct cxl_region_params *p = &cxlr->params;
  2932		struct cxl_endpoint_decoder *cxled;
  2933		unsigned int rd_bw = 0, rd_lat = 0;
  2934		unsigned int wr_bw = 0, wr_lat = 0;
  2935		struct access_coordinate *coord;
  2936		struct list_head *perf_list;
> 2937		struct cxl_port *port;
  2938		int rc = 0, i;
  2939	
  2940		lockdep_assert_held(&cxl_region_rwsem);
  2941	
  2942		/* No need to proceed if hmem attributes are already present */
  2943		if (cxlr->coord)
  2944			return 0;
  2945	
  2946		coord = devm_kzalloc(&cxlr->dev, sizeof(*coord), GFP_KERNEL);
  2947		if (!coord)
  2948			return -ENOMEM;
  2949	
  2950		cxled = p->targets[0];
  2951		port = cxled_to_port(cxled);
  2952	
  2953		for (i = 0; i < p->nr_targets; i++) {
  2954			struct range dpa = {
  2955				.start = cxled->dpa_res->start,
  2956				.end = cxled->dpa_res->end,
  2957			};
  2958			struct cxl_memdev_state *mds;
  2959			struct perf_prop_entry *perf;
  2960			struct cxl_dev_state *cxlds;
  2961			struct cxl_memdev *cxlmd;
  2962			bool found = false;
  2963	
  2964			cxled = p->targets[i];
  2965			cxlmd = cxled_to_memdev(cxled);
  2966			cxlds = cxlmd->cxlds;
  2967			mds = to_cxl_memdev_state(cxlds);
  2968	
  2969			switch (cxlr->mode) {
  2970			case CXL_DECODER_RAM:
  2971				perf_list = &mds->ram_perf_list;
  2972				break;
  2973			case CXL_DECODER_PMEM:
  2974				perf_list = &mds->pmem_perf_list;
  2975				break;
  2976			default:
  2977				rc = -EINVAL;
  2978				goto err;
  2979			}
  2980	
  2981			if (list_empty(perf_list)) {
  2982				rc = -ENOENT;
  2983				goto err;
  2984			}
  2985	
  2986			list_for_each_entry(perf, perf_list, list) {
  2987				if (range_contains(&perf->dpa_range, &dpa)) {
  2988					found = true;
  2989					break;
  2990				}
  2991			}
  2992	
  2993			if (!found) {
  2994				rc = -ENOENT;
  2995				goto err;
  2996			}
  2997	
  2998			/* Get total bandwidth and the worst latency for the cxl region */
  2999			rd_lat = max_t(unsigned int, rd_lat,
  3000				       perf->coord.read_latency);
  3001			rd_bw += perf->coord.read_bandwidth;
  3002			wr_lat = max_t(unsigned int, wr_lat,
  3003				       perf->coord.write_latency);
  3004			wr_bw += perf->coord.write_bandwidth;
  3005		}
  3006	
  3007		*coord = (struct access_coordinate) {
  3008			.read_latency = rd_lat,
  3009			.read_bandwidth = rd_bw,
  3010			.write_latency = wr_lat,
  3011			.write_bandwidth = wr_bw,
  3012		};
  3013	
  3014		cxlr->coord = coord;
  3015	
  3016		return 0;
  3017	
  3018	err:
  3019		devm_kfree(&cxlr->dev, coord);
  3020		return rc;
  3021	}
  3022	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
