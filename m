Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D0C36B08
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 20:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710967307; cv=none; b=ieV0a6EcsvC3KxVzOSD1tgz9Nw5WpnRlma9mpMwrKr2Gx0s70b0ktH67W9iysaWqepotn2Th9N4FAYgjDZ3sm17wQvI6Wm3F4mU+uLNQwD4Sio8LRHOjABsn/rFjakA2q7/Uehi/3K3oR0bxxgzvbXaRv3Es3LbsgEYrLr/S7Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710967307; c=relaxed/simple;
	bh=6nwdc/guQyjuIEl+UyozyCr3ko5DNfrr7Nf2w1DiRvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b3fcepbmMJjumDXZ2Vaxg7kSS6U0LCR8CDOrmQv3CxA+KkBIiwAdQh5P7CJ8Q3CKxHBUcy/fyeFctZ2QwNLK3ndyJizFpV3IHHYQsXTfi7LJdsQ67CBl7Sbnhfu1xip4A7zAQIdJwzEV8PQ68xjSaQQDSFWYiEooRG7z4kDP7o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFKLVrCD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFKLVrCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710967305; x=1742503305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6nwdc/guQyjuIEl+UyozyCr3ko5DNfrr7Nf2w1DiRvI=;
  b=MFKLVrCDbW77fM9Wv0rRDHV8wvNhXKTZ4eucWLdXVMWXZvy308O/uLbW
   SsBXzvUu/ayFwy/owsiuCOredBrO+FHnP8Xe0vh7oA5u0gvf6oMfMgWOe
   rcarDznqLMWcefUIdDtqclSEL+4PhwMQMRH5UejpqNhA+qM1kdTT+J/80
   dEIKoFbgTbR/F1royXM2D8+Oqn0Sc0EF003kXC8qfquMAwdYfUy90u5Uz
   xIqht/YLPAybXMzjFaMbKP+8ULtAMPfudJmd5dsTLcq7BYtVqZHd4LLtP
   5tJVjcmmyhtUIaN1lzdYBu4xOzo8KZxYfLGjCGSJGlb60TbdVr9/WRLKt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16461472"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="16461472"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 13:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="18748370"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2024 13:41:22 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rn2kS-000Iux-1h;
	Wed, 20 Mar 2024 20:41:20 +0000
Date: Thu, 21 Mar 2024 04:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-2024-03-20 20/28] csky-linux-ld: extent.c:undefined
 reference to `cxl_region_notify_extent'
Message-ID: <202403210451.N0VJYUs9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-2024-03-20
head:   8a3f02fa89dfa853c12a8bbd8abb2dd73a5d320d
commit: 2b5129529c2d1ff1ca757ebda1c46288f554bd40 [20/28] cxl/mem: Handle DCD add and release capacity events.
config: csky-randconfig-001-20240320 (https://download.01.org/0day-ci/archive/20240321/202403210451.N0VJYUs9-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403210451.N0VJYUs9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403210451.N0VJYUs9-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/cxl/core/mbox.o: in function `cxl_dev_get_dc_extents':
   mbox.c:(.text+0x191c): undefined reference to `cxl_ed_add_one_extent'
   csky-linux-ld: drivers/cxl/core/mbox.o: in function `cxl_read_dc_extents':
   mbox.c:(.text+0x19fc): undefined reference to `cxl_ed_add_one_extent'
   csky-linux-ld: drivers/cxl/core/extent.o: in function `dax_region_create_ext':
   extent.c:(.text+0x198): undefined reference to `cxl_region_notify_extent'
>> csky-linux-ld: extent.c:(.text+0x1f4): undefined reference to `cxl_region_notify_extent'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
