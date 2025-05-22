Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5578725E476
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905148; cv=none; b=eyRjJhRMV9uxVlvILCDtNh0LGai9y9sauvmynbtbpe3g3jtl8xxuueuVZWF03rM94QoskvIi8XKyRoni1O1ChQMyev7YvHEoe7wKCpPjIot1uFaw3TprmxNwScNERxN5JyaRc1LVqm8QOFHpxh/jReT8oYYKB/M8RvxUXm2F4Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905148; c=relaxed/simple;
	bh=rJnP+t15B6uNxa11eOYG5FaMVPbK9X/QWAy+fJ3upEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5YJ3Fiw+bmcz4l18DsuK57z59TBCvhVY1VYPiONtztqInx6r7cIdQeOqwCf1wedWdxxik5oh9YqY+P+eWgpWhZHlTGR5vtALInddhRjGRefp2lBxsc49m2smzwzH8SQ5S3Xbty2UTbF8rlhXHUk847wf6TAajESQNvafs+ujfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/M5jkrt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/M5jkrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747905146; x=1779441146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rJnP+t15B6uNxa11eOYG5FaMVPbK9X/QWAy+fJ3upEg=;
  b=i/M5jkrtUNhT6qx1wN6l7wlWi60gSVnuQlM71nFNpwY+ewjUh7MmeJtR
   aOdEbRaWRmkmhOSRc0VPe4KffpVirdMSEV5+rL2cNiv0m+CHwjPrU4l5k
   7PuCMRMXBUSni1zwwi90XYYtdoFp9AeKdY+v3gt6yL9lrcvt51djtDT7A
   HDnXdCLAhCh4NVtQWS76uDhFam8ZMtMbo+rSJ9cPPETdvwAvBRUBCj9dp
   3tJ87tndQoF9icBDc+N+H0rzZKkNibrVUbUXeyIzOQYtvz7CGCB9V0Znh
   FqoZJYojb51Zrz34sw1ixIVLwhItoEsOsJ4uvpxFxgm4IFgGBE5kggW4G
   A==;
X-CSE-ConnectionGUID: YePBpCdWRFKq4iUOk0js2Q==
X-CSE-MsgGUID: G/IqAjghSnaKdIaAZuxE/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49794590"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49794590"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 02:12:25 -0700
X-CSE-ConnectionGUID: L65dyNvSQuW74HHaWXVfFg==
X-CSE-MsgGUID: EtwjwvpbTDu9AtserQiWLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140379791"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 May 2025 02:12:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI1yQ-000P9Q-2D;
	Thu, 22 May 2025 09:12:22 +0000
Date: Thu, 22 May 2025 17:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 3/9] tee: implement protected DMA-heap
Message-ID: <202505221909.3JxkwSHB-lkp@intel.com>
References: <20250520152436.474778-4-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520152436.474778-4-jens.wiklander@linaro.org>

Hi Jens,

kernel test robot noticed the following build errors:

[auto build test ERROR on b4432656b36e5cc1d50a1f2dc15357543add530e]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Wiklander/optee-sync-secure-world-ABI-headers/20250520-232546
base:   b4432656b36e5cc1d50a1f2dc15357543add530e
patch link:    https://lore.kernel.org/r/20250520152436.474778-4-jens.wiklander%40linaro.org
patch subject: [PATCH v9 3/9] tee: implement protected DMA-heap
config: um-randconfig-r123-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221909.3JxkwSHB-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221909.3JxkwSHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221909.3JxkwSHB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "memremap" [drivers/tee/tee.ko] undefined!
>> ERROR: modpost: "memunmap" [drivers/tee/tee.ko] undefined!
ERROR: modpost: module tee uses symbol dma_buf_export from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
