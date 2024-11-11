Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFCA1953A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 11:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731324563; cv=none; b=MOctQDtn6Sba9KI2QCUQslhMXh6ZrdbSKwzy5GTil1kaS6HtrBYlolytAKdjJ+5wHIQmgaqCIttVAjfYqsPXWXDbq61JRwuc8lLJDWhEV3YDZTS1SCe2TuQgeep7uW8UNIfIRctFkp86plVvRtz9QtlEOFBZPzneWuXcBAb1Wd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731324563; c=relaxed/simple;
	bh=TNR8Irg9SFGemO0CwPl7apQbYEX5kMn4q8DdQYuF7iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omuzgY/Y9iC6Lry+YDuwURrxZdD/dwhgQMrVzhOI3CuuTLIoXT0gNfV83UCyZbQFoDTgzudyV5WuUDYDNqan4kdqa/NgMC9xKEktk/gEmT6l4QHYV6XCIgsGaAQeMNtUvt/HWGjR9BM1fFHlFPfCRbOHqLll7KToTCsEZ/zFF94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L227Amdu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L227Amdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731324562; x=1762860562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TNR8Irg9SFGemO0CwPl7apQbYEX5kMn4q8DdQYuF7iA=;
  b=L227AmdutNu6kLvxli10qdLv3VXa4leEST0GwV3i0pG6XEAP/1LTAWCL
   eLfvCnAYhymgBWLksF9qHHXv0QNbGdWC/z/zteBmGtfCr8a6YWRb64tg/
   fi7/cRMYZBHJTWKw1QPNsctJ7ilt1sSS2DH/Km6rBZi8SdxncuMlFLi2K
   BFSO348DIjNs2yj4AtKZlmS83Oo/n/WFpn8ShB9XnQTaQesQpBI16mwZX
   9rUihcxgnej2r3jgZqLTbaliyQkgGnKzEEeM8iTzOcBfJyNHBXnCt1LXt
   Voua+Mok0fyk0MpOUoL+k6YbXMY5cEOIXmekjSk7zdpDR2PLWKPe2ktcI
   g==;
X-CSE-ConnectionGUID: 1eyEGLxMQkWq05Jv7m9JUg==
X-CSE-MsgGUID: trWqSlA1Ri+biLGDWHHq/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34814602"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34814602"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 03:29:21 -0800
X-CSE-ConnectionGUID: 7qdCuUaNROSsRPwhQ+1cLA==
X-CSE-MsgGUID: TNENUA3HTw6mQg31NfiN1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="86992621"
Received: from lkp-server01.sh.intel.com (HELO dc8184e5aea1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Nov 2024 03:29:16 -0800
Received: from kbuild by dc8184e5aea1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tASbZ-0000En-1o;
	Mon, 11 Nov 2024 11:29:13 +0000
Date: Mon, 11 Nov 2024 19:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>, kw@linux.com,
	u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
	bhelgaas@google.com, unicorn_wang@outlook.com, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com, krzk+dt@kernel.org,
	lee@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <202411111935.kqORCWuE-lkp@intel.com>
References: <5051f2375ff6218e7d44ce0c298efd5f9ee56964.1731303328.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5051f2375ff6218e7d44ce0c298efd5f9ee56964.1731303328.git.unicorn_wang@outlook.com>

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2d5404caa8c7bb5c4e0435f94b28834ae5456623]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-pci-Add-Sophgo-SG2042-PCIe-host/20241111-140237
base:   2d5404caa8c7bb5c4e0435f94b28834ae5456623
patch link:    https://lore.kernel.org/r/5051f2375ff6218e7d44ce0c298efd5f9ee56964.1731303328.git.unicorn_wang%40outlook.com
patch subject: [PATCH 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20241111/202411111935.kqORCWuE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241111/202411111935.kqORCWuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411111935.kqORCWuE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/cadence/pcie-sg2042.c:141:12: warning: 'sg2042_pcie_msi_irq_set_affinity' defined but not used [-Wunused-function]
     141 | static int sg2042_pcie_msi_irq_set_affinity(struct irq_data *d,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sg2042_pcie_msi_irq_set_affinity +141 drivers/pci/controller/cadence/pcie-sg2042.c

   140	
 > 141	static int sg2042_pcie_msi_irq_set_affinity(struct irq_data *d,
   142						    const struct cpumask *mask,
   143						    bool force)
   144	{
   145		if (d->parent_data)
   146			return irq_chip_set_affinity_parent(d, mask, force);
   147	
   148		return -EINVAL;
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
