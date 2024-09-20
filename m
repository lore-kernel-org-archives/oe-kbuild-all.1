Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8976B14A91
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 07:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726817071; cv=none; b=sokoJxvS1bYCM1OjN3uZbcUH8zGxOWuSjWOs6gtUdN6OvNFJx/y3A0eD7qQ5MRNNs5ZwN7mVlgTYbFTOZrTmEY+/jpYOvjW/bAr9uiyvRnWd10xQrjFp5xfumeEgZUtjiuit9iASj817on+eSvWjofUhjkkCWh9ULIVOH7GCfpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726817071; c=relaxed/simple;
	bh=/w+v8HTh6PhL3yFrE81jec1x/Cls+I78nmzIIdeypBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KiANsrxOYgKBsxiA6EM6fMNFh8C2F6H77oROmRxHX8UAkSqRw6L3f3EA/ggXiLDH5l95S5teXnYkrgnjIhPCB6B13MTUm3hSfuDTDRHnx3G5jACXzXTeb9ZndgCJGMPiUu9ou2vB1hjYBbEYonjPDzTizAOJvtCbimS1VjOv+bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeHDiHr7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeHDiHr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726817069; x=1758353069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/w+v8HTh6PhL3yFrE81jec1x/Cls+I78nmzIIdeypBQ=;
  b=SeHDiHr7G38+syMlL0Hwrkt5TpQGZlLWZWWX+TiWe+DJy6cNgo+ueQgF
   hiOPk/oUqBPasMCPb7PeEFeIity1UDKpAfka8lpgiie8WtmkNgfwCGLWt
   zmZQosQQ8lBPwFYHzjth+UVF1xkcXydH42XaQYq4qRGSSlegtxuRIPt7R
   OX/ZLZa1KyC3UjvKhNS62HFgyYIRDkOd9YSzIzCVIqSq9gI5ERRmPf2Q7
   Ygi6iVbELBqqMg8udy68WnJeiFATAfY5hHX+IyBYrv0wd0zeQ9IbRBj5T
   WTycOWnHU/MV6Y1cYEbHOCyb54nx9LhF8+lSMQ8huDMqOXOb6gVf9p2i3
   A==;
X-CSE-ConnectionGUID: pZtGDOQqTaWy56TGWuJHhw==
X-CSE-MsgGUID: RCLPH7dKQj2m7Rw2+6Bgqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29598980"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="29598980"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 00:24:29 -0700
X-CSE-ConnectionGUID: dF1+ovCVSLWCXn2asfaoVg==
X-CSE-MsgGUID: HxYdHd+dS3uaImOwHKNHuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="74991688"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Sep 2024 00:24:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srY07-000E52-1S;
	Fri, 20 Sep 2024 07:24:23 +0000
Date: Fri, 20 Sep 2024 15:23:25 +0800
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
Message-ID: <202409201507.snCutX8B-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240920/202409201507.snCutX8B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201507.snCutX8B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201507.snCutX8B-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__ffsdi2" [drivers/regulator/max20339-regulator.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
