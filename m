Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9E6259C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746957091; cv=none; b=nNhsaWc+T10Izm5XQR2ZdVLYPXMZlgvru/qvfPqjzIaAfkNrU5kcaUxCtExMTy3htLEo/Pg/SoPqbZrULzK0WyodOaXoc1cl6Cmnl9AbcgDP3KRDHYdsr+FKXecNNCBrtqnCAGBK83/rPaVQVAJU4OILJvOV/0mk75iIQ0u8rKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746957091; c=relaxed/simple;
	bh=EjcECHuR7BsJalEML8F7GhSP3aNMrVnrJ1UvYtRhLxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/hz5XWpLzkUK4Ohc0h3SN3ME78tfMeDSnAbS18vSrrFiDBpdBC8AV7fPxWhUbm+1MuyPzXox0f4TKiode/hKCGGvw3ph8cFqoP87J3YMhpGMG1o4oJjtoX/ip3e7eYzywp0hDbJD9F6TBFcp+l6YMVbLYv1DA6qp5cWvdUYxrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnk3aCs1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnk3aCs1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746957090; x=1778493090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EjcECHuR7BsJalEML8F7GhSP3aNMrVnrJ1UvYtRhLxI=;
  b=dnk3aCs1xZkON0E6ACdicmtiQxFPZSebHYqRQjquCsp7gf7gW6YqrK1n
   h9KzKenjyuaRSOfCozrwC7XUBK3KHCvO+p1xeqA72XDXIzzQyV7WG1/ji
   hx9JB4nxqsUzZSEGsxPoqilMOz0fWd5x9ubxFwhi8WzNO5eA3M+q6baX2
   17aO2ixJ/yVu2WVYMCCDu/nBRH+orc4eh7fGUx1pESRu6XJTTNu1BBcCr
   7rgrm9SfAeT83u2uK2EFFbfDuhwpOQqO04pRk+n53kg86nCgdl+rDwT0y
   5DWKp+k3SEykTLqb9OkxZg+qRoKfCxckXa6dQ1QxEpkD1JJLAIxBHz93l
   A==;
X-CSE-ConnectionGUID: H7QPqMxHQZWbHIXgTuiFGQ==
X-CSE-MsgGUID: LALR8ukSQ9yBq/EefJZsKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="60160361"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="60160361"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 02:51:29 -0700
X-CSE-ConnectionGUID: qaE3o0x8RcOUAWGQwFfe6g==
X-CSE-MsgGUID: NLNR0WeRSoW2lUViXHAd4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="138060147"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 May 2025 02:51:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE3LB-000DhX-0I;
	Sun, 11 May 2025 09:51:25 +0000
Date: Sun, 11 May 2025 17:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next PATCH v3 09/11] net: pcs: airoha: add PCS driver for
 Airoha SoC
Message-ID: <202505111746.1YN7EhAA-lkp@intel.com>
References: <20250510102348.14134-10-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510102348.14134-10-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phylink-keep-and-use-MAC-supported_interfaces-in-phylink-struct/20250510-182833
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250510102348.14134-10-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v3 09/11] net: pcs: airoha: add PCS driver for Airoha SoC
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250511/202505111746.1YN7EhAA-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505111746.1YN7EhAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505111746.1YN7EhAA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: the following would cause module name conflict:  drivers/misc/c2port/core.ko   drivers/net/pcs/core.ko   drivers/firmware/google/coreboot_table.ko   sound/core/oss/snd-mixer-oss.ko   sound/core/oss/snd-pcm-oss.ko 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
