Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B841A1401B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 04:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731817377; cv=none; b=p8J3OZ0TVsnzQ8AxlZhdnc8IPdR+W/AEixJp1Q6xA2CChxRdmlhyIcI/c9jA0SBTFl4gGIBYgsRS3fhJdQ3gKST9H2IshlQ+yF58Pi7LG0zYMR7AklpM2Uxh4zTD7zTAObgOjxY3lg36Bnot/tVj6H2q1BYCancDDBIRda2ls9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731817377; c=relaxed/simple;
	bh=vUvMlFbUX0QiaPmD1QeTHC7tbGYCk60nGF3Q/Mh/g7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+9PiME2l4d+GmY45kW2ngcy9eGI8bkEIygtWNmGUZvJ8F4eIPLPyNoLjLwzuoYC21r4h8a2FZxs61HJgrOctIGHYbcOGZdQQgVp2WtizDG7SPomqv+mm6TFOYsztENCFZ63rv7qBieeFF8YPKwZ97jo2LlrSrLPR3KjVORFCww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qeu5fLIw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qeu5fLIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731817376; x=1763353376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vUvMlFbUX0QiaPmD1QeTHC7tbGYCk60nGF3Q/Mh/g7s=;
  b=Qeu5fLIw3ADZeZCm0V/El+zXkclh0Nd8cHXz59cZcfvKNy3R0WpyIccZ
   ItgalZ/qnBl0tuC5JWoNtrz/xwRA/73OBLf5aXpUVkZY0pfbP/Ua2DyPZ
   vR1Ny81kOHa1hxToWvAn/5C3Fue1YnWy+yCBGUc9Du6Fh/0ceXyeW2gaQ
   PJ9ZlGEtIQBeCbbzD8ddhPe9HHKvneBmVp9ioSI9M/mkGhSd9WCW1h52M
   mJAAoG7rLfD20noC5oRtJNnSnWZQVndo+lsZx8cCJHFW3HWVtY00JRB1m
   dTeH/Te30GvCsr19r1v8MO4DL8bYGmfbq98zPL9j4dK3zDd+bi1+pfq/7
   A==;
X-CSE-ConnectionGUID: Diz6HyGXSiuuwaT5Gqtogw==
X-CSE-MsgGUID: AkM5WkJ8TVid+U4A8xgU0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="54290834"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="54290834"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 20:22:51 -0800
X-CSE-ConnectionGUID: VIYZd6vrQpSAoXyJ3cGQsg==
X-CSE-MsgGUID: n+shh4tlSDSbrHBr+x8XEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="89325859"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Nov 2024 20:22:48 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCWoA-0001RZ-0y;
	Sun, 17 Nov 2024 04:22:46 +0000
Date: Sun, 17 Nov 2024 12:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: alejandro.lucero-palau@amd.com, linux-cxl@vger.kernel.org,
	dan.j.williams@intel.com
Cc: oe-kbuild-all@lists.linux.dev,
	Alejandro Lucero <alejandro.lucero-palau@amd.com>
Subject: Re: [PATCH] cxl: avoid driver data for obtaining cxl_dev_state
 reference
Message-ID: <202411171240.wwR1wRdZ-lkp@intel.com>
References: <20241114112435.45593-1-alejandro.lucero-palau@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114112435.45593-1-alejandro.lucero-palau@amd.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cxl/next]
[also build test WARNING on linus/master v6.12-rc7 next-20241115]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alejandro-lucero-palau-amd-com/cxl-avoid-driver-data-for-obtaining-cxl_dev_state-reference/20241114-192818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20241114112435.45593-1-alejandro.lucero-palau%40amd.com
patch subject: [PATCH] cxl: avoid driver data for obtaining cxl_dev_state reference
config: alpha-randconfig-r051-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171240.wwR1wRdZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171240.wwR1wRdZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171240.wwR1wRdZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/perf/../cxl/cxlpci.h:6,
                    from drivers/perf/cxl_pmu.c:23:
>> drivers/perf/../cxl/cxl.h:823:32: warning: 'struct cxl_dev_state' declared inside parameter list will not be visible outside of this definition or declaration
     823 | int cxl_dvsec_rr_decode(struct cxl_dev_state *cxlds,
         |                                ^~~~~~~~~~~~~


vim +823 drivers/perf/../cxl/cxl.h

   816	
   817	struct cxl_hdm;
   818	struct cxl_hdm *devm_cxl_setup_hdm(struct cxl_port *port,
   819					   struct cxl_endpoint_dvsec_info *info);
   820	int devm_cxl_enumerate_decoders(struct cxl_hdm *cxlhdm,
   821					struct cxl_endpoint_dvsec_info *info);
   822	int devm_cxl_add_passthrough_decoder(struct cxl_port *port);
 > 823	int cxl_dvsec_rr_decode(struct cxl_dev_state *cxlds,
   824				struct cxl_endpoint_dvsec_info *info);
   825	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
