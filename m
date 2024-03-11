Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1641802E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710150944; cv=none; b=DHUokHnURI6xl9kOohxnxpwO9GXnHLDqxv8kVrv/eZe4yjN09YUy03VGSCagtGVt2w3HFms/3cQnAkYnuMJRUfQhDNIBK4QkSCunkp3uAtiMRx3n5IAKzbuHkiuF7Jswh6gXaeTg8IoLklcLI+DlTYf4cfPRgLe8U/jYsC0HpjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710150944; c=relaxed/simple;
	bh=cp+2qMEL9/G++KKMQwga4x5aiq3+9rCvXP8HVe8Ijbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hM5TaxCZZtXpE7snQzoFFpb+bSn9gpW+LCWRN6mhQvr9MEajfojNiwLc6uIcpDrOxyd+O5hUPmMkk33s5hCmBLrcImynD7FnaonE2UdJC6ZhenwrvmGkzb+hn7zGlNRQExLWhY3WZBempmj5Vl2pZBiyQvAwol5xplfqekdL1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEjORVrz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEjORVrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710150942; x=1741686942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cp+2qMEL9/G++KKMQwga4x5aiq3+9rCvXP8HVe8Ijbw=;
  b=lEjORVrzgQVtIC13CxrXQrtYOWVrCKvsrQlRi/8/MfA8aYipR4EPfoM7
   d+w098vQl5sPwhtaFu4LnRhN5zpFCDJuXXpexYKj5y1guDZfKJVafy8qx
   Xdqt+8cj6+2Fih8WGkqc1pOWVkuBFVZqiXyfCZ8hHRNVCJ/jNE9zmukhp
   M7ATRsPfxLFn8P7TYU6h8yGAKOZRdqhiFgPrVn1o1aRvPbyf6EP8GyjWK
   O2+auNIR79D5SV6QyQ180K2UX362xrUXvGtGxhxYterr9taBZ1qrPL4VZ
   7eMNlBX+WxucdJTVlLry1OsDK+DwEiJljSN9o5+e4gKq3J7A8Ny+FrbQQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4940539"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4940539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 02:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="11539614"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Mar 2024 02:55:41 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjcNe-00093R-1L;
	Mon, 11 Mar 2024 09:55:38 +0000
Date: Mon, 11 Mar 2024 17:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-2024-03-10 19/26] drivers/cxl/core/mbox.c:931:6: error:
 redefinition of 'cxl_dc_extent_in_ed'
Message-ID: <202403111733.nMeuKJqp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-2024-03-10
head:   0dd99bd79b33de8f6e293c9a2373ca321dad33c7
commit: c05653085f433c3915e353d76c2e8bbc5402ca1a [19/26] cxl/mem: Handle DCD add and release capacity events.
config: i386-randconfig-141-20240311 (https://download.01.org/0day-ci/archive/20240311/202403111733.nMeuKJqp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111733.nMeuKJqp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111733.nMeuKJqp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/mbox.c:931:6: error: redefinition of 'cxl_dc_extent_in_ed'
     931 | bool cxl_dc_extent_in_ed(struct cxl_endpoint_decoder *cxled,
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/cxl/cxlpci.h:6,
                    from drivers/cxl/core/mbox.c:8:
   drivers/cxl/cxl.h:984:20: note: previous definition of 'cxl_dc_extent_in_ed' with type 'bool(struct cxl_endpoint_decoder *, struct cxl_dc_extent *)' {aka '_Bool(struct cxl_endpoint_decoder *, struct cxl_dc_extent *)'}
     984 | static inline bool cxl_dc_extent_in_ed(struct cxl_endpoint_decoder *cxled,
         |                    ^~~~~~~~~~~~~~~~~~~


vim +/cxl_dc_extent_in_ed +931 drivers/cxl/core/mbox.c

   930	
 > 931	bool cxl_dc_extent_in_ed(struct cxl_endpoint_decoder *cxled,
   932				 struct cxl_dc_extent *extent)
   933	{
   934		uint64_t start = le64_to_cpu(extent->start_dpa);
   935		uint64_t length = le64_to_cpu(extent->length);
   936		struct range ext_range = (struct range){
   937			.start = start,
   938			.end = start + length - 1,
   939		};
   940		struct range ed_range = (struct range) {
   941			.start = cxled->dpa_res->start,
   942			.end = cxled->dpa_res->end,
   943		};
   944	
   945		dev_dbg(&cxled->cxld.dev, "Checking ED (%pr) for extent DPA:%#llx LEN:%#llx\n",
   946			cxled->dpa_res, start, length);
   947	
   948		return range_contains(&ed_range, &ext_range);
   949	}
   950	EXPORT_SYMBOL_NS_GPL(cxl_dc_extent_in_ed, CXL);
   951	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
