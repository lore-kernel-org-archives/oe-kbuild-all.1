Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87AE3C9EF3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 13:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507068; cv=none; b=KKEc1WzyzehQzuPEKK1edW7XYhKfvFi2U8WmnVUnlj+zPSqHyDbGVstyI8y4xlGB05E8UDz8rUext6ki218SqUbfC8nmaGuHztW8HEtkqew3WwORldh2NYcYYZjojPkRsmWIIDH+ljMSO+6GuJqt0/sF9h79jjTq+FtAuqT7b8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507068; c=relaxed/simple;
	bh=Cqi/XhnarqMO6/rhBy3b20fOl5EgIpxncigU+6Ry2+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAhqnHUcv1gLouUlYPJrr7sv5z1chnJ7KjlOcT1uGD7VoEiqIMy55yn5YJcfKNi32DufAJrS3qwWjUbRoFdgGB0tOOFVn3UmgsGs0CGDl1hz2Zrf7aegLNEc4m8EwZx6ulUWeL3UabLKYaXCNkJGW6gIvBrqAzD9UBo/2x9wbIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LW84EM7g; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LW84EM7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778507066; x=1810043066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cqi/XhnarqMO6/rhBy3b20fOl5EgIpxncigU+6Ry2+Y=;
  b=LW84EM7gGQ93dhjMTu8P/dqI9f0hfPmwlNXWa1mwF51ZcD2ABQSzV+Ho
   TsIoXFl2nSXbYauwenfIeLO1MZw4csZVPQOZwRyWBnTcA0hbtjJFPc9Dp
   qiAn+pIKSus5FDGLL7VgXHytoSkSXD7lkigg3mQJbhHXAwjKaUjna5NC2
   Iehisjup2Z6MDhm0x0oXFB0NEtYQHCgLUBUqc2O8XSp6lAoOCV9CoWjmt
   ePYDRZ7+N9MOflFkYzcfYAg7ZCV/20KrxiqGe4X4pH0YjhitWpigBd4A8
   v3mzjWR80YHleNM/DDQows/bpxaGxBa4JF6GQOUtZkLvjHtqhd1C75oG/
   g==;
X-CSE-ConnectionGUID: 8N3HSOANSEWCG13D9H9oOA==
X-CSE-MsgGUID: olUGSlpgTfebyGH3HDd0nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79495816"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79495816"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 06:44:25 -0700
X-CSE-ConnectionGUID: nkYJcWh6Scuvor20taiuiw==
X-CSE-MsgGUID: JiQM4VcLRo+p1+ymOHBSUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="237410927"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 May 2026 06:44:23 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMQvk-000000000eb-3R2k;
	Mon, 11 May 2026 13:44:20 +0000
Date: Mon, 11 May 2026 21:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [PATCH] nvmem: layouts: Add fixed-layout driver
Message-ID: <202605112122.UbOid27c-lkp@intel.com>
References: <20260505-mathieu-nvmem-fixed-layout-v1-1-7f6ecbce108d@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-mathieu-nvmem-fixed-layout-v1-1-7f6ecbce108d@bootlin.com>

Hi Mathieu,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7fd2df204f342fc17d1a0bfcd474b24232fb0f32]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Dubois-Briand/nvmem-layouts-Add-fixed-layout-driver/20260511-170834
base:   7fd2df204f342fc17d1a0bfcd474b24232fb0f32
patch link:    https://lore.kernel.org/r/20260505-mathieu-nvmem-fixed-layout-v1-1-7f6ecbce108d%40bootlin.com
patch subject: [PATCH] nvmem: layouts: Add fixed-layout driver
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260511/202605112122.UbOid27c-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112122.UbOid27c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112122.UbOid27c-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/nvmem/layouts/fixed-layout.o: in function `fixed_layout_layout_init':
>> (.init.text+0x18): undefined reference to `__nvmem_layout_driver_register'
   hppa-linux-ld: drivers/nvmem/layouts/fixed-layout.o: in function `fixed_layout_layout_exit':
>> (.exit.text+0x18): undefined reference to `nvmem_layout_driver_unregister'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
