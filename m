Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9433570C8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 05:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778391698; cv=none; b=BqTcMuAnMQxgrbXoZRLUmDRP5tWYa1CEi1WWy+EPwRGtPIek9HNjz2t3JVl6a3FZHjVeO9IT8uCw7k15jSfQztobObE6Ss+oUO4pxEFOlgHRGIxDfGvidWOTf6fa/92aigPPxXZclOht29HHhCklm4MORlS8xso28eCHWAHz7V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778391698; c=relaxed/simple;
	bh=3/cBV5AN1XLyEk9dRTOiyr96+0xqZLMWKK07nBoRzqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOQpXgXMgLNhVBvDToCm1mVuZGQDBGMLcUoEie4qOYQGBqG9svYqMA8oyWCcMND+JSzh/148H6h7qHDh8fDSW//rmCFsWS6tC5GfCVQ6GSjOtnynr5WeTBLKTfwiyrOKy6vT6rotcNme0kQCZLvQsxLOpPSaDakq6EuD+vm9hPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Je0SJ3Dk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Je0SJ3Dk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778391697; x=1809927697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3/cBV5AN1XLyEk9dRTOiyr96+0xqZLMWKK07nBoRzqA=;
  b=Je0SJ3DkfAEwyi41Qz+BPlU5e4V9VdiqXxN1BPsb7sqsP2wArKIyi7qi
   bmByfxG2JqbCuZ8xxgBqHcnW05MMvqHrJ+ESAmyETL3rNfQgf9lyD0W7C
   VJLGoriA0wRsk5KEA74BqiJ8YeRYiKdOf/Lq4OaVB35zT7wEwH8gIaPs3
   JWdi2getKyJESmUIzvgzUxq1PDafTO1y3q7aCIiW0X/EmJbvbZFg2r47/
   qHxDdB+89adLFLbPk47RK91eX/AXmthmBF2XRv1RVBCEnD82vJo1zO5zP
   O1qTlzmgfIoKj4fxn3StRe3lxU9EBVKjviqC21jYa72HzvSTDLxTaAb50
   w==;
X-CSE-ConnectionGUID: HrXaE5ILSK2fvfYfRGe+Rg==
X-CSE-MsgGUID: 42IwkluNT3WU5Hev4FQ8Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="82930676"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="82930676"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 22:41:34 -0700
X-CSE-ConnectionGUID: 00cOE35qRx6bZhiJ1dnfyg==
X-CSE-MsgGUID: Mx5aEHAvTyKZ++zOVUtDWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="237247196"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2026 22:41:31 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLwuu-000000001nV-3WB9;
	Sun, 10 May 2026 05:41:28 +0000
Date: Sun, 10 May 2026 13:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Subject: Re: [PATCH] netdevsim: Fix task hung by releasing bus lock before
 device ops
Message-ID: <202605101318.qbesSR5H-lkp@intel.com>
References: <20260509092837.3432281-1-xujiakai24@mails.ucas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509092837.3432281-1-xujiakai24@mails.ucas.ac.cn>

Hi Jiakai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.1-rc2 next-20260508]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiakai-Xu/netdevsim-Fix-task-hung-by-releasing-bus-lock-before-device-ops/20260510-070550
base:   linus/master
patch link:    https://lore.kernel.org/r/20260509092837.3432281-1-xujiakai24%40mails.ucas.ac.cn
patch subject: [PATCH] netdevsim: Fix task hung by releasing bus lock before device ops
config: riscv-randconfig-001 (https://download.01.org/0day-ci/archive/20260510/202605101318.qbesSR5H-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101318.qbesSR5H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605101318.qbesSR5H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/netdevsim/bus.c: In function 'new_device_store':
   drivers/net/netdevsim/bus.c:192:3: error: implicit declaration of function 'nsim_bus_dev_del'; did you mean 'nsim_bus_dev_new'? [-Werror=implicit-function-declaration]
      nsim_bus_dev_del(nsim_bus_dev);
      ^~~~~~~~~~~~~~~~
      nsim_bus_dev_new
   drivers/net/netdevsim/bus.c: At top level:
>> drivers/net/netdevsim/bus.c:206:13: warning: conflicting types for 'nsim_bus_dev_del'
    static void nsim_bus_dev_del(struct nsim_bus_dev *nsim_bus_dev);
                ^~~~~~~~~~~~~~~~
   drivers/net/netdevsim/bus.c:206:13: error: static declaration of 'nsim_bus_dev_del' follows non-static declaration
   drivers/net/netdevsim/bus.c:192:3: note: previous implicit declaration of 'nsim_bus_dev_del' was here
      nsim_bus_dev_del(nsim_bus_dev);
      ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/nsim_bus_dev_del +206 drivers/net/netdevsim/bus.c

f9d9db47d3ba873 Jiri Pirko 2019-04-25  205  
e05b2d141fef22c Jiri Pirko 2019-04-25 @206  static void nsim_bus_dev_del(struct nsim_bus_dev *nsim_bus_dev);
e05b2d141fef22c Jiri Pirko 2019-04-25  207  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
