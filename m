Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05AB1487ED
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519722; cv=none; b=ciI8JuXBkx0A1ivG1Add4SqDZGGjYE5rSyXerV8+a9hjUWKHUtz+DZqYZOlAPheXxIRY22Lqvh5wuY4z46oW7nSZQpr2Y+3Rb7JZ5uu7rB+TxdOUzUiIAX70etJWoiabucBS6Y4+bhegjuV1z9sQZM9Yq6T6/n/OVNQ4Rqgwnzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519722; c=relaxed/simple;
	bh=kZwGmbkPFUd9x3Ci2IUDfiWWsElH81RPS9bGfPUxxbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSJ2BubV6ixELYILUIsrRCVWcyB9GxU+XqiJ+cc9+8uXpJepeUf4Xd4xI+9e+vW+S2iAzi5kR5nFF10DsbONlhuiWJ3N6b5v3qAdXmqwgrGq+ulg3IRejVx3lXUjWmp1xFnim54XQeesbClAS1j+LsxOOQi+UYKHjK6p8ENeWTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiIcpT9e; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiIcpT9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746519721; x=1778055721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kZwGmbkPFUd9x3Ci2IUDfiWWsElH81RPS9bGfPUxxbM=;
  b=DiIcpT9eZLnCzsBjUUNWo5CpWKs9kAQ94s7EmFLZisU0WVpWgBcwAUMU
   oxqw4w+KsQUMPESk7MLb1qGjLQLY2BvVGPUilyQQ4Ao1qbfeYCi3OT0iT
   3JbfD1dYiq3j8MnNg4MYloR3neE1HdlYXfo63xkhOlW3djHwtGqBrNEDL
   kHWWXbrYctIv/zHqlckpF4rIOy0qYw0hD2cUzVZ3AeWGwVUYcYoVxs+xH
   KCgTAaWXKxeoBXX1/MPtlA9h7GnA7B8JjhGGQTNRos2sywqoBDZ/DmnfA
   PV1WwD3WNkc1pFRPAG8xuG9KiO1IHjop1eom9NSs2OuKue3dhskr1XRAk
   g==;
X-CSE-ConnectionGUID: wffRHJDlRo2HDwPnaqza4Q==
X-CSE-MsgGUID: ISCYyBJWR1ao7NX0JYL08w==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="58801447"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="58801447"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 01:21:59 -0700
X-CSE-ConnectionGUID: KnzZBNpgR8eXv4mbLGSRnQ==
X-CSE-MsgGUID: 8SsbTWQRRQqu+yaygV04uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="135247901"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 May 2025 01:21:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCDYo-0006Of-0K;
	Tue, 06 May 2025 08:21:54 +0000
Date: Tue, 6 May 2025 16:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: William Tu <witu@nvidia.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, jgg@nvidia.com, weizhang@nvidia.com,
	William Tu <witu@nvidia.com>
Subject: Re: [PATCH] vfio: add dma map/unmap support for noiommu
Message-ID: <202505061509.rPJ6xfxW-lkp@intel.com>
References: <20250503004821.16980-1-witu@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503004821.16980-1-witu@nvidia.com>

Hi William,

kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Tu/vfio-add-dma-map-unmap-support-for-noiommu/20250503-085044
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20250503004821.16980-1-witu%40nvidia.com
patch subject: [PATCH] vfio: add dma map/unmap support for noiommu
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250506/202505061509.rPJ6xfxW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061509.rPJ6xfxW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061509.rPJ6xfxW-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
>> ERROR: modpost: "get_user_pages_remote" [drivers/vfio/vfio.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
