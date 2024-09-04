Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92A31E009E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725468095; cv=none; b=G4yCx6ThWayetHl4ytAmbJvXeo+eBrbG9jzCCAO4m6ctgvtxuKV4mA0fbFJuxGR0+RHWBXWGgPIdb2jGBLHZQy1mgaCchlbTd/nJpodtg7eHQpMEdevvfmQzGQlDfdvu73QXVDfSZuTdWsQltAFIHG9EAXEQVtMxEwdLarS8qNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725468095; c=relaxed/simple;
	bh=4Db/ImwLnXpeUW/xVwkUAniKVOiSFfoq+63dm+ODGmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIpFMn2r7GizK3uxq8AIbCkpNcJBv/6m3N/sg8k/335SGmxb8Ppvp1xZC6GbVULHsmU8llIKFIIXpbVYPkQqk7nD+5dCI8guM1HooNGgPqop0X7V3/weKIuRSS/SFm6+ybfYDrccwvSXKyPqpvzY8H0FcxoUBzhCwZUDbru+r1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E21E5Bhu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E21E5Bhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725468093; x=1757004093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Db/ImwLnXpeUW/xVwkUAniKVOiSFfoq+63dm+ODGmo=;
  b=E21E5BhuM8fxToL1Bktwnf4CjNdCtUSUIZ959jZmgO1UiWYw5WHz1Bqh
   DQvNck/pKGSeIPpbI8QRC2DiO4PXEGw4x/fkNr76/WedCY6Vly8PcM0Wi
   h2NumJIQvzJ3ivSf8CC+vca7F7WxRXh3Pimp9I0oaqPLyWigfYMOR+5Ax
   OFxQ4ZQW+jez7tIg561yrgMRRdMp5uUjoCIuPwahWi5XlLOf5ivDKd1RE
   fnw0n4McqTI9/nJm1Y6VWQ93r4001AOMpSmNfs7XwI3NUNA0YC+Qj2/UA
   Unp4mmG8riJJieqE2Ae/8tEShTrqhUKafQAMjTMBb/OtpShE3gmrJtczQ
   Q==;
X-CSE-ConnectionGUID: OVKNcoiqTtqfD3RqZ7aOIQ==
X-CSE-MsgGUID: QP9iZtQGTsSWJpVm1yA6fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="46673576"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="46673576"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 09:41:31 -0700
X-CSE-ConnectionGUID: BqP0IcUcQr2pZ9bZ/iF+oQ==
X-CSE-MsgGUID: mO4xEq/3TaWoMyNhER9VQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="70123600"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Sep 2024 09:41:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slt4S-0008L9-0w;
	Wed, 04 Sep 2024 16:41:28 +0000
Date: Thu, 5 Sep 2024 00:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 2/3] cxl: Calculate region bandwidth of targets with
 shared upstream link
Message-ID: <202409050030.MPrmHP6n-lkp@intel.com>
References: <20240904001316.1688225-3-dave.jiang@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904001316.1688225-3-dave.jiang@intel.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.11-rc6 next-20240904]
[cannot apply to cxl/next cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/cxl-Preserve-the-CDAT-access_coordinate-for-an-endpoint/20240904-081534
base:   linus/master
patch link:    https://lore.kernel.org/r/20240904001316.1688225-3-dave.jiang%40intel.com
patch subject: [PATCH v8 2/3] cxl: Calculate region bandwidth of targets with shared upstream link
config: loongarch-randconfig-r071-20240904 (https://download.01.org/0day-ci/archive/20240905/202409050030.MPrmHP6n-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409050030.MPrmHP6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409050030.MPrmHP6n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/cdat.c:975: warning: Function parameter or struct member 'cxlr' not described in 'cxl_region_shared_upstream_bandwidth_update'
>> drivers/cxl/core/cdat.c:975: warning: expecting prototype for cxl_region_shared_upstream_perf_update(). Prototype was for cxl_region_shared_upstream_bandwidth_update() instead


vim +975 drivers/cxl/core/cdat.c

   965	
   966	/**
   967	 * cxl_region_shared_upstream_perf_update - Recalculate the bandwidth for the region
   968	 * @cxl_region: the cxl region to recalculate
   969	 *
   970	 * The function walks the topology from bottom up and calculates the bandwidth. It
   971	 * starts at the endpoints, processes at the switches if any, processes at the rootport
   972	 * level, at the host bridge level, and finally aggregates at the region.
   973	 */
   974	void cxl_region_shared_upstream_bandwidth_update(struct cxl_region *cxlr)
 > 975	{
   976		struct xarray *working_xa;
   977		int root_count = 0;
   978		bool is_root;
   979		int rc;
   980	
   981		lockdep_assert_held(&cxl_dpa_rwsem);
   982	
   983		struct xarray *usp_xa __free(free_perf_xa) =
   984			kzalloc(sizeof(*usp_xa), GFP_KERNEL);
   985	
   986		if (!usp_xa)
   987			return;
   988	
   989		xa_init(usp_xa);
   990	
   991		/* Collect bandwidth data from all the endpoints. */
   992		for (int i = 0; i < cxlr->params.nr_targets; i++) {
   993			struct cxl_endpoint_decoder *cxled = cxlr->params.targets[i];
   994	
   995			is_root = false;
   996			rc = cxl_endpoint_gather_bandwidth(cxlr, cxled, usp_xa, &is_root);
   997			if (rc)
   998				return;
   999			root_count += is_root;
  1000		}
  1001	
  1002		/* Detect asymmetric hierachy with some direct attached endpoints. */
  1003		if (root_count && root_count != cxlr->params.nr_targets) {
  1004			dev_dbg(&cxlr->dev,
  1005				"Asymmetric hierachy detected, bandwidth not updated\n");
  1006			return;
  1007		}
  1008	
  1009		/*
  1010		 * Walk up one or more switches to deal with the bandwidth of the
  1011		 * switches if they exist. Endpoints directly attached to RPs skip
  1012		 * over this part.
  1013		 */
  1014		if (!root_count) {
  1015			do {
  1016				working_xa = cxl_switch_gather_bandwidth(cxlr, usp_xa,
  1017									 &is_root);
  1018				if (IS_ERR(working_xa))
  1019					return;
  1020				free_perf_xa(usp_xa);
  1021				usp_xa = working_xa;
  1022			} while (!is_root);
  1023		}
  1024	
  1025		/* Handle the bandwidth at the root port of the hierachy */
  1026		working_xa = cxl_rp_gather_bandwidth(usp_xa);
  1027		if (IS_ERR(working_xa))
  1028			return;
  1029		free_perf_xa(usp_xa);
  1030		usp_xa = working_xa;
  1031	
  1032		/* Handle the bandwidth at the host bridge of the hierachy */
  1033		working_xa = cxl_hb_gather_bandwidth(usp_xa);
  1034		if (IS_ERR(working_xa))
  1035			return;
  1036		free_perf_xa(usp_xa);
  1037		usp_xa = working_xa;
  1038	
  1039		/*
  1040		 * Aggregate all the bandwidth collected per CFMWS (ACPI0017) and
  1041		 * update the region bandwidth with the final calculated values.
  1042		 */
  1043		cxl_region_update_bandwidth(cxlr, usp_xa);
  1044	}
  1045	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
