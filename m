Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C51C13CFA5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 01:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726967594; cv=none; b=dQrvTUXSB+NMkDWAE0r6EqKf3YJv0bdtrZDap0gB9b09f37h2noHPMlBpJ+zihLhpCneGhbJWNgLWkWiwuxnzH0giiEOEWNPSDITErGlZOhBncuTKwZ3vS9pyFgf4a/QZmSIet3v11CjY7cnzoi+R8Gdwff/KsyeWI9BgAqwztw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726967594; c=relaxed/simple;
	bh=FSWErWSR/mykECj0axiycsGXiTpjK9GAIJYkRDseTyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZTrKucxsfJR7Sbz5BrAhRuAcpUfSJawbPBoocmjlW/+Nud5bMhulyg5+OzcfRyCn3sHcOkcaCnesF7ndGVHmiNJFH6rv1e4Y2TDoaTSTXQ45BDTHmrk6QR4V6x43PJbb61J3kq3xXEGijygZIdO1cGyjUHpIr2n4ZoJ+2pT/Jiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLC3BwtM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLC3BwtM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726967594; x=1758503594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FSWErWSR/mykECj0axiycsGXiTpjK9GAIJYkRDseTyA=;
  b=NLC3BwtMYW0HaNe45bwAm42y4m7wS2a/INJokVrzVUghhpxoZRw0r+EC
   jDOB/zLvSY4yR+XqL+3KZe2jcxD276tOBE52pWZjlz2naVBYABIIWIS8A
   haiXYvT0anEK4vGoA+59HXtv7We7mV99qrKh9/R2wOyLnWQnwUW4A7Enl
   CflnVwrsO3IAZa2wrYp/9kDFrLJ/cAtad7oUsYksi84qC9KWCmJ3xHTzy
   3FgY6wMZYo662oeu9uP7YxOGHu1t8QBvsKjp/gfaw4qNYjUh9ATraPmX7
   I7aS1rwsmN4gunFwFXeCeD1G5idx9vMW2z8aYEiK1OVuwHhxuZRpOrG3E
   w==;
X-CSE-ConnectionGUID: KtCz4HA/RBKrdIU/2vcNNg==
X-CSE-MsgGUID: ne9wF63tQ3mIieewslKOqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26094220"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="26094220"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 18:13:13 -0700
X-CSE-ConnectionGUID: CRpA1eMwQL6ovyxy7Lv8YA==
X-CSE-MsgGUID: RABlP41fSMCYyTMqOLu/5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="75077927"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Sep 2024 18:13:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssB9w-000FvK-2a;
	Sun, 22 Sep 2024 01:13:08 +0000
Date: Sun, 22 Sep 2024 09:12:27 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>,
	Prasanth Babu Mantena <p-mantena@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 60/92]
 drivers/spi/spi-cadence-quadspi.c:408:undefined reference to
 `spi_mem_exec_op'
Message-ID: <202409220939.araXwca8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   1b598f5229c97dd3e7c2d87095fbbe979b802396
commit: a5293ede37465e6dbab72bcb9deb8f4bc3a5b6be [60/92] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
config: arm64-randconfig-003-20240922 (https://download.01.org/0day-ci/archive/20240922/202409220939.araXwca8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220939.araXwca8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220939.araXwca8-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/spi/spi-cadence-quadspi.o: in function `cqspi_phy_check_pattern':
>> drivers/spi/spi-cadence-quadspi.c:408:(.text+0x678): undefined reference to `spi_mem_exec_op'


vim +408 drivers/spi/spi-cadence-quadspi.c

   392	
   393	static int cqspi_phy_check_pattern(struct cqspi_flash_pdata *f_pdata,
   394					   struct spi_mem *mem)
   395	{
   396		struct spi_mem_op op = f_pdata->phy_read_op;
   397		u8 *read_data;
   398		unsigned int size = sizeof(phy_tuning_pattern);
   399		int ret;
   400	
   401		read_data = kmalloc(size, GFP_KERNEL);
   402		if (!read_data)
   403			return -ENOMEM;
   404	
   405		op.data.buf.in = read_data;
   406		op.data.nbytes = size;
   407	
 > 408		ret = spi_mem_exec_op(mem, &op);
   409		if (ret)
   410			goto out;
   411	
   412		if (memcmp(read_data, phy_tuning_pattern,
   413			   ARRAY_SIZE(phy_tuning_pattern))) {
   414			ret = -EAGAIN;
   415			goto out;
   416		}
   417	
   418		ret = 0;
   419	
   420	out:
   421		kfree(read_data);
   422		return ret;
   423	}
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
