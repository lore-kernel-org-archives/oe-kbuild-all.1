Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F0517DFF2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726849747; cv=none; b=pzZ1pwYzecdT7en6N83AJvWidxll2dDoqUqSS4afqb5BrZcCB02vQUo5vloNWI7/QRPUPZaOs07kGoGTtHpLeTD8z9RG1/EFOhiCCsunEfI4b1Ezu0Mj7Qfs4UJrBDM5Elgk6QgZOqycjjc20PXWr5v+8VBRZ1QPRN/GEl3gFlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726849747; c=relaxed/simple;
	bh=pFPYaI/XdQ1Bj4BHzWEfHaVrsBjq8q50diIMZ+usCgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/jzJWmF07MV8kOSl6cx9eabA8WS5+UXXvkF+j/TvEco0Viw5oN0HnJJigO0bXzdJjosjkHBCLx7cg0xzWIPRr/hj9KR4KdwtIIe8ezxn5i6ppdQQ6M2XM9uZ86J211kwo8vT2sQbO1v3Tn259f1ircU8g2HXjamNTGoMEqw6NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjL+uv8c; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjL+uv8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726849745; x=1758385745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pFPYaI/XdQ1Bj4BHzWEfHaVrsBjq8q50diIMZ+usCgI=;
  b=GjL+uv8cVLyeYr439/YnUYmPzAZ0EGS8krBvan/IuVLF441PEKGq2gvW
   jA6i8C9gk+6Wo9HcFL7cP0srY6CaVQgp46cJp1pqxvhHKhld78qjRVHHU
   91PfKwapb9naZvQykKeBpMjPuNRSJPZtfix1nPP8EicJnOu1uOqeYS1Up
   1h8jRzORkm1KGgfzLjY2rE6fVcasK7nbzTYIaqLrY/q10xmyXS7x5I9Z2
   vPp9ex+JQklZ6DjA2AEz5cfbdgmazfOnqNrVf0R6ibDFUZBignpga1uwF
   HAbpA8ly45a9ALG/Y77QE0lVv0OaqYvHXcQCHdvoNLCcYnx8ZuQHol8cO
   A==;
X-CSE-ConnectionGUID: 8WvEbEe4SuK8k1AZmKf4Nw==
X-CSE-MsgGUID: JKrhg0pQTBiceDZePXppWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25960067"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25960067"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 09:29:05 -0700
X-CSE-ConnectionGUID: 1gKe9TqIRha65q7OrF9/kw==
X-CSE-MsgGUID: qBJjM+pdRyGxjUyYldg0Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70358100"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Sep 2024 09:29:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srgV9-000Eex-1t;
	Fri, 20 Sep 2024 16:28:59 +0000
Date: Sat, 21 Sep 2024 00:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH 2/2] regulator: max20339: add Maxim MAX20339 regulator
 driver
Message-ID: <202409210200.Nl6uKIgj-lkp@intel.com>
References: <20240916-max20339-v1-2-b04ce8e8c471@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240916-max20339-v1-2-b04ce8e8c471@linaro.org>

Hi André,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7083504315d64199a329de322fce989e1e10f4f7]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Draszik/dt-bindings-regulator-add-max20339-binding/20240917-005024
base:   7083504315d64199a329de322fce989e1e10f4f7
patch link:    https://lore.kernel.org/r/20240916-max20339-v1-2-b04ce8e8c471%40linaro.org
patch subject: [PATCH 2/2] regulator: max20339: add Maxim MAX20339 regulator driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240921/202409210200.Nl6uKIgj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409210200.Nl6uKIgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210200.Nl6uKIgj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/regulator/max20339-regulator.o: in function `max20339_lsw_set_ovp':
>> max20339-regulator.c:(.text+0x406): undefined reference to `__ffsdi2'
   ld: drivers/regulator/max20339-regulator.o: in function `max20339_lsw_set_ocp':
   max20339-regulator.c:(.text+0x1041): undefined reference to `__ffsdi2'
   ld: drivers/regulator/max20339-regulator.o: in function `max20339_lsw_set_ocp.cold':
>> max20339-regulator.c:(.text.unlikely+0x5e): undefined reference to `__ffsdi2'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
