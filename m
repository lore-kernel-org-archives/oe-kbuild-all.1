Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0482BE7DD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 15:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511916; cv=none; b=bfRcDhAWkUPXbpVogSi4nOJTKAbrCjyNB46eWwz+7jUbXIMmsJtT3J9uEW+p839F6ra1+qbO/wdIZKnf+BFW8dafaJztsXxRaIq7n3gdgrNOwh229gY3H4e/qDRw5x+euxAnu5CvX2RHej5EOH3t+TXWN8NkrcCdq5k3t005dpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511916; c=relaxed/simple;
	bh=fR1lcVtmCbdgHWILLxRQg1w++XaFVcmugUCGFCm33GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4Hf6LaS/e6w19d2GgXJpcq7ml3Fayea28YBGaknIM1JBCPTzTkBt1WZnaD3LgTcWdaF/3hxttD5oukaVt9tTiDaB/DYVh9RbB5129SDgiaLs4aN+RAoeaa5HY8NY7hM6CBoG61bkuLduTLySx47aXoYYo701WWd64dQXJCjyDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGMcMJ3n; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGMcMJ3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778511913; x=1810047913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fR1lcVtmCbdgHWILLxRQg1w++XaFVcmugUCGFCm33GY=;
  b=kGMcMJ3nED5fMTUH7M8JUEmpTDtkM2/PGzUode8ricQeMYd856zleRWh
   YThBNpOpTiQ7DYq0ZbEfwcOOInzD/iWHwu7fubspF4Tg1EYVV17ZW9ufm
   DGc1YpSO+Kramyn30lXTilOG1FuX+q/qC/vk6E4HVgkFXrwd+CVvXZLKN
   rxt+hEnQAgWnMo0wuunbE2ac6tKstE7j77yadbDT3jq4PplLt9jT678oI
   r3nn3ZYZk75MDWcgkqlQtzm/NYLSYA2dYpWVT40p8sur0zd6sZKyb/LLH
   nOjVuhJytY6lfyT++tVGqhb+sITfzTQOfcOylXNlumdGbILi+gFJfSRco
   Q==;
X-CSE-ConnectionGUID: UzI5PrcjQSuewigIXxEjcg==
X-CSE-MsgGUID: aQB4T4PfS/qFIqqidhhBmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83272094"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="83272094"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 08:05:12 -0700
X-CSE-ConnectionGUID: 3KboDfcpRA+vpRy8Omfp2w==
X-CSE-MsgGUID: IaZRYhxzQyiTzO0y5pMGjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="241459391"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 11 May 2026 08:05:10 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMSBw-000000007yL-0eTb;
	Mon, 11 May 2026 15:05:08 +0000
Date: Mon, 11 May 2026 17:04:38 +0200
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
Message-ID: <202605111648.gLUTeOnR-lkp@intel.com>
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
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260511/202605111648.gLUTeOnR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111648.gLUTeOnR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605111648.gLUTeOnR-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/nvmem/layouts/fixed-layout.o: in function `fixed_layout_layout_init':
>> drivers/nvmem/layouts/fixed-layout.c:47:(.init.text+0x10): undefined reference to `__nvmem_layout_driver_register'
   ld: drivers/nvmem/layouts/fixed-layout.o: in function `fixed_layout_layout_exit':
>> drivers/nvmem/layouts/fixed-layout.c:47:(.exit.text+0x9): undefined reference to `nvmem_layout_driver_unregister'


vim +47 drivers/nvmem/layouts/fixed-layout.c

    38	
    39	static struct nvmem_layout_driver fixed_layout_layout = {
    40		.driver = {
    41			.name = "fixed-layout",
    42			.of_match_table = fixed_layout_of_match_table,
    43		},
    44		.probe = fixed_layout_probe,
    45		.remove = fixed_layout_remove,
    46	};
  > 47	module_nvmem_layout_driver(fixed_layout_layout);
    48	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
