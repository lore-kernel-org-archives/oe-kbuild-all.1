Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6CCA3D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 00:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bg0AxR1N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705279166; x=1736815166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9t1MaggR5CYDYkbCe9dvDID88aIWshEB/aaB/U6G6+U=;
  b=bg0AxR1NkIeuuVEML+ddTiipaD46VJsPYUVukY3mewBdtc2xtJrtLOuE
   6lf/xodNdFqe2FvjaTbNvI/YkDWiZbzZRLjXKk4UrOjjHA82LYK7HtLp6
   tTKRji7eha+lBxepl5ZT5o3sBpnw6hxQHZSuaic0C0fAOhkly5ICN07jk
   JuuMA4eqJr5LneV52yzn/xA1rRWRF3GWGFNZtd/FEvSRbRVcGHC1VBlTA
   MGoytbFiMWyL7rmIB2djkCY6K7qeWflWC8CXWZ2hXEYV5aUu0QsmlDwlr
   Ca3e2OcVXuhfU4+ipYX4rVX1bWl49t0Ye+MshxVSpgKJmFyRPBdxBSIv/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6220943"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="6220943"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 16:39:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="1030497750"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="1030497750"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Jan 2024 16:39:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPB0Z-000BxY-0N;
	Mon, 15 Jan 2024 00:39:20 +0000
Date: Mon, 15 Jan 2024 08:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: alison.schofield@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] cxl/region: Allow out of order assembly of
 autodiscovered regions
Message-ID: <202401150855.1cEJYwiX-lkp@intel.com>
References: <20240113050421.1622533-1-alison.schofield@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240113050421.1622533-1-alison.schofield@intel.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 3601311593eb44d34f142b993cb6f38f9a7863b3]

url:    https://github.com/intel-lab-lkp/linux/commits/alison-schofield-intel-com/cxl-region-Allow-out-of-order-assembly-of-autodiscovered-regions/20240113-130553
base:   3601311593eb44d34f142b993cb6f38f9a7863b3
patch link:    https://lore.kernel.org/r/20240113050421.1622533-1-alison.schofield%40intel.com
patch subject: [RFC PATCH] cxl/region: Allow out of order assembly of autodiscovered regions
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240115/202401150855.1cEJYwiX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150855.1cEJYwiX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150855.1cEJYwiX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/region.c:756:6: warning: no previous prototype for 'auto_order_ok' [-Wmissing-prototypes]
     756 | bool auto_order_ok(struct cxl_port *port, struct cxl_region *cxlr_a,
         |      ^~~~~~~~~~~~~


vim +/auto_order_ok +756 drivers/cxl/core/region.c

   755	
 > 756	bool auto_order_ok(struct cxl_port *port, struct cxl_region *cxlr_a,
   757			   struct cxl_region *cxlr_b)
   758	{
   759		struct cxl_region_ref *cxl_rr;
   760		struct cxl_decoder *cxld_a, *cxld_b;
   761	
   762		/*
   763		 * Allow the out of order assembly of auto-discovered regions as
   764		 * long as correct decoder programming order can be verified.
   765		 *
   766		 * Per CXL Spec 3.1 8.2.4.20.12 Committing Decoder Programming,
   767		 * software must commit decoders in HPA order. Therefore it is
   768		 * sufficient to sanity check that the lowered number decoder
   769		 * has the lower HPA starting address.
   770		 */
   771		if (!test_bit(CXL_REGION_F_AUTO, &cxlr_a->flags))
   772			return false;
   773	
   774		cxld_a = cxl_region_find_decoder(port, cxlr_a);
   775		cxl_rr = cxl_rr_load(port, cxlr_b);
   776		cxld_b = cxl_rr->decoder;
   777	
   778		if (cxld_b->id > cxld_a->id) {
   779			dev_dbg(&cxlr_a->dev,
   780				"allow out of order region ref alloc\n");
   781			return true;
   782		}
   783	
   784		return false;
   785	}
   786	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
