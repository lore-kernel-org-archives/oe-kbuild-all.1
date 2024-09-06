Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326033FEC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 02:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725590521; cv=none; b=r0j0+pshiw5BAgHDaX3uBvj4WCkPO/SfOIeVlN40R3wCKsMHcn7523Xf5RWq2u5ALj+afRXZY2hk9AbuccTEXn7AFDL/pwuT//q8xcE07U9x+xTdSDWaAQasOmvgNo1OluilhkdRRbYGomtZUIRmDZamzqSLrJUNgMj//nM89DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725590521; c=relaxed/simple;
	bh=lpiaYkEIlbEyd+yRqDqWA+fIZWYT2R/J90nVsgPr9tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdRJzqnxcXa0ej4Xmv+ZVFM2E0kMZNOArXK5faDmSvvoLJf+rxMkVV4rYzewOYGEZEP10ZgM5rXQgzamk+VMy6GDLPg5swDLmnn8qGku3ipNtBBz9w8u341Ho/aEArePHVbP+7CaXFSaD0K29p/rPv/Cf2Wy2JzfcrLCwy7+fck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8D+Gmzd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8D+Gmzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725590520; x=1757126520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lpiaYkEIlbEyd+yRqDqWA+fIZWYT2R/J90nVsgPr9tI=;
  b=C8D+Gmzd3lod1D+C7Okjz4xTPuA9uRwGTszahaX5cgC2uO689r2eqocs
   EyfVf6qMfKrgDexitXN2zrx9iuHJxJnbocC0XdRdrEY8Id/nLCzGekCwF
   opXrrnOBj1n74twF1Ajy9JX3hBBj9S8mPXiCqQFkFh7Amux3vH7gOSkpS
   lYxoaS17C3q6eGqC7dhKxl17Kphk+WmhR6nndLvgZQkPUFNGQ4lCwEv9p
   WyZNVdd1lLl+oSWHSOFASdpOqlUKmCg//TB0KcmZZzrCapKlX5TnSFr7m
   Ir+YYh1bzyY4a0EEpibxxBTu8vlrm52ss/YdaDGCng/+fTAp15yR+zdes
   w==;
X-CSE-ConnectionGUID: 13wLKM3GSTGbDUnuKW3fag==
X-CSE-MsgGUID: 4uuyNVYDTE26FVwQs8Us5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24486182"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="24486182"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 19:42:00 -0700
X-CSE-ConnectionGUID: sGrHXHQZQ+WuHVEulHPLqQ==
X-CSE-MsgGUID: B8To3mC5SteCJsPxar2DVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="70389535"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Sep 2024 19:41:58 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smOv6-000AX1-1Y;
	Fri, 06 Sep 2024 02:41:56 +0000
Date: Fri, 6 Sep 2024 10:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hongzhen Luo <hongzhen@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v4 2/4] erofs: introduce page cache share feature
Message-ID: <202409060508.61zU6d6E-lkp@intel.com>
References: <20240902110620.2202586-3-hongzhen@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902110620.2202586-3-hongzhen@linux.alibaba.com>

Hi Hongzhen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on xiang-erofs/fixes]
[also build test ERROR on linus/master v6.11-rc6]
[cannot apply to xiang-erofs/dev-test xiang-erofs/dev next-20240905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongzhen-Luo/erofs-move-struct-erofs_anon_fs_type-to-super-c/20240902-204137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git fixes
patch link:    https://lore.kernel.org/r/20240902110620.2202586-3-hongzhen%40linux.alibaba.com
patch subject: [PATCH RFC v4 2/4] erofs: introduce page cache share feature
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240906/202409060508.61zU6d6E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060508.61zU6d6E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060508.61zU6d6E-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "generic_file_vm_ops" [fs/erofs/erofs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
