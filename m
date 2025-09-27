Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AB52DF6E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758978010; cv=none; b=gAc8KRaAXwxZAtrk3fIXioMwvKqCzoFbql41p4MGtdogjKj75x65WyYnGvSMUDrttiw4iRUp6IoN2BOSbHyXW2tiS5aEsijfVO8ZN2s12CoZ0oD+MhlRglBr35PPkbz8fJc9Nx2DMamKwat8SXgjlAjIL7sK9bd4bDuUUmaM33E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758978010; c=relaxed/simple;
	bh=O0wHQRZbClOVvcyOTlPcCz4vb4DeUHWF0N6tqCdJSYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hkX3mrWGAldgsEWlknFDClgPxb8qegFAY07cujtq3RuvJRwj9Hm9q1iGNIxXb8B8H9VUgyUmJ5v0qPjk4P+xTmaYo1yeahGvLJ1foquEnQ1gK6oGRH4tF0zeY0lFB3UMXhZwJ7szBBH7SB8f09UVonEb42e8J4HgYjaqIzfEbNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOilXjqC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOilXjqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758978009; x=1790514009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O0wHQRZbClOVvcyOTlPcCz4vb4DeUHWF0N6tqCdJSYI=;
  b=dOilXjqCv9nM+kVf2CWZqG16SvxiebtvFvbruTWAK4wBxSTABckF/qd4
   JojwOWGoVPArq4XzjszMALxw2SjtEMknxKf846BkW5ocF9W0KPrJGYonB
   m4QTeKc9reuQF5NRIZ93iLs+Vn+AfvLiPYhlyAaLkEiKWxrafXiEUgOgl
   G+kQ97D/TElrOTUzlkzWPktFXSMm3oF9K+lGbSi3Kbmov9PwfjNC7JcKt
   PT32E7U9LqUrIEY5MBLWkFfWsYpLw2QKq03l+I8dcn0eWcYpJ026+LftT
   woyPtLGPfCFvCqcXhGq92fLgUW90ebQ0wYzBfL8mQEmWu69gkd8tCox2A
   Q==;
X-CSE-ConnectionGUID: H4qZFe/9QzG/9ZgUstcdSg==
X-CSE-MsgGUID: M3+ARYBITaWyzhHUFuGujg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61246380"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61246380"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 06:00:08 -0700
X-CSE-ConnectionGUID: fWrlH91LQ1m37/oLisRvbg==
X-CSE-MsgGUID: KJ3sUrpxQhu0xsBcIBX8GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="183108926"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Sep 2025 06:00:07 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2UWy-00074H-37;
	Sat, 27 Sep 2025 13:00:04 +0000
Date: Sat, 27 Sep 2025 20:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_dmabuf 2/7] ERROR: modpost: module iommufd uses
 symbol dma_buf_unpin from namespace DMA_BUF, but does not import it.
Message-ID: <202509272043.JjNOORAb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_dmabuf
head:   529f06c16cad5243825e488f9bc555be09e924eb
commit: 2edad14f2cea09830a4fbaf4352834f474ce4394 [2/7] iommufd: Add dmabuf to iopt_pages
config: arm-randconfig-003-20250927 (https://download.01.org/0day-ci/archive/20250927/202509272043.JjNOORAb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272043.JjNOORAb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509272043.JjNOORAb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module iommufd uses symbol dma_buf_unpin from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module iommufd uses symbol dma_buf_dynamic_attach from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module iommufd uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module iommufd uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module iommufd uses symbol dma_buf_pin from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module iommufd uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
