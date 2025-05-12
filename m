Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BDB1E3793
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 14:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059169; cv=none; b=nTOUybhybUJnTNFYSxlyVmg7EQ6v3Y1vg6bYlsip11L+NtPCNRK9veLpxaLHKMzlkl2sttXSiAzsFVfekU6Tybnsu/TXGXnzKiIzX2sBHJPRwSTKiut1/k2mEXnCGSd9FW6sNemb3CoExxHNJqdXDDGhR/WwbbT7JKsjpSAG2PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059169; c=relaxed/simple;
	bh=MkmcALUhm3crtIpp9cercSN4dKWZvkTHGMmdJNxqKCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjRbakCIGV8jcZvmYy+iFPyVVgaDoM+Pwkw9ECjMjYqgvzUha0W88tJOBOCCfdzwnbodqYgKI7rg22UR1esGRlsK8f9mbAIFzXhblTv6LTk4W2fY6nE0naxSwLm8WsjUoZTR/ZtnTc3xaiQLBIBOouLMOWzYHpzlOMQwhT0ghKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlXgs3QM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlXgs3QM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747059167; x=1778595167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MkmcALUhm3crtIpp9cercSN4dKWZvkTHGMmdJNxqKCQ=;
  b=BlXgs3QM0D8M3miTgty2snkls7V3o5B1ucckLIGjRx4rQ61NgZnF3gN6
   jW/0c/GeLqe2NuaIULiLNSNpCgdDAiPPCbEp+/phk8PLCIdSuy2Gqpa0w
   djWZH7I7lPKy91ZTD1r9WWVi6X1uyJ/nOeiar1YbGYwRkVorjyiUBBQwt
   GxNw8FOQFM+UceL/W9KkJc+MqiDqyjFvJJfGZ36b0FvEvTObcDEgtmk4C
   hfWcRNSDilgx4GLwzfZUFN4CsMaIKFqO95xzHvUVSFW4faBkfIiL1oe0O
   yJgUfEskjzkgvouoGuWVkIvO53zm+UdcfTmXmv1qbi9ydQK1T4c7gU3xY
   w==;
X-CSE-ConnectionGUID: cmBws0TpTXSICn2ESRY1JQ==
X-CSE-MsgGUID: n8eJ96dHR+e78ldnJeTjVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="51506101"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="51506101"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 07:12:46 -0700
X-CSE-ConnectionGUID: 94bmnHejTECWmrwrM68KXg==
X-CSE-MsgGUID: xuJjHfN8SkaF76gYl258JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="137409226"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2025 07:12:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uETtb-000EUR-2a;
	Mon, 12 May 2025 14:12:43 +0000
Date: Mon, 12 May 2025 22:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next 14/15] net: cpc: add SPI interface driver
Message-ID: <202505121907.inGpxhIb-lkp@intel.com>
References: <20250512012748.79749-15-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512012748.79749-15-damien.riegel@silabs.com>

Hi Damien,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net/main linus/master v6.15-rc6 next-20250509]
[cannot apply to net-next/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/net-cpc-add-base-skeleton-driver/20250512-093831
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250512012748.79749-15-damien.riegel%40silabs.com
patch subject: [RFC net-next 14/15] net: cpc: add SPI interface driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250512/202505121907.inGpxhIb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505121907.inGpxhIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505121907.inGpxhIb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/cpc/spi.c:519:35: warning: 'cpc_spi_ids' defined but not used [-Wunused-const-variable=]
     519 | static const struct spi_device_id cpc_spi_ids[] = {
         |                                   ^~~~~~~~~~~


vim +/cpc_spi_ids +519 drivers/net/cpc/spi.c

   518	
 > 519	static const struct spi_device_id cpc_spi_ids[] = {
   520		{ .name = "cpc-spi" },
   521		{},
   522	};
   523	MODULE_DEVICE_TABLE(spi, cpc_spi_ids);
   524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
