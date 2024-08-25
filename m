Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C02329CEF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Aug 2024 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724595343; cv=none; b=sOMb0DhnRpzpofBww9k79QEiDj/7MaFCB1mN7anRJEzznaNOX4OkIezTPN/Z8XdRgZq5wPvy9t07LsYlm+HDIOThExtScsinWERkeddjgYzEcuQaKrtc6LvzAqJEJnqC/He7NOGubXvwbJYwls3izkE2tO+A+X5ThFD9uwUB+5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724595343; c=relaxed/simple;
	bh=0By7wxLgCSmR1mxuyqVCK+DdnRlGGPaLY8nVf9eOzsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qLmwQoNwoWQM3xfpBPu6tsSn6lEyzF8tlOyZ99KydgLjMjSATZdvmkyQD7Doqzy7ZPuo5fuR2Zb5jesBD7U7KDZYlwN26obQoksFAYIzSjcydK98wxRb7LnFoCvkZXfjT4tp31kfCbdo4NB4Fjx6T/YdX/tOTz4rjUoihaZcEc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODByXbAH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODByXbAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724595342; x=1756131342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0By7wxLgCSmR1mxuyqVCK+DdnRlGGPaLY8nVf9eOzsc=;
  b=ODByXbAHTWma0ckFZfQ5F4MkI7hTX+nHJVCmvVNqSSuYASs7UlmiAuVk
   qacDybaS344n6p7p2/W6S3NIsv2TLdyFI6lqXTIvZvKr38Yq2L0juCBhj
   o2c8lKtgTIecursv8/LqnWY4UzA4M+dLF4flL8E/4cVLQFuBKHKbI8eie
   ULmRRLuKWil/2ScrWRSieK/ZtcSpnNV5bU7zAX3qdAptsAMSStjIGPlSa
   h2ETubqkJOvOtNQ/vsvCWgpj7WAMRwNd9fV4SkTsSJJr3O1dzJFgDiGAt
   4hUVyC0X/Y+rpQURGHocSGyk5uVQl6i4YqyX4LqwVJToaSqIMmzK8izhc
   w==;
X-CSE-ConnectionGUID: KmLlwjUiQMWePZ1qugtqIQ==
X-CSE-MsgGUID: gmdkuOR3TJiR7oea+pggHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="22539749"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="22539749"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 07:15:41 -0700
X-CSE-ConnectionGUID: zII+hPa7TlKmGmyX11pRmQ==
X-CSE-MsgGUID: 6yV3XvoOTjyoXieEI49ccw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="85460094"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Aug 2024 07:15:41 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siE1q-000FCt-01;
	Sun, 25 Aug 2024 14:15:38 +0000
Date: Sun, 25 Aug 2024 22:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>,
	Prasanth Babu Mantena <p-mantena@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 60/92]
 drivers/spi/spi-cadence-quadspi.c:408:(.text+0x5f0): relocation truncated to
 fit: R_NIOS2_CALL26 against `spi_mem_exec_op'
Message-ID: <202408252209.Zrdp1SUk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   4df11c3463343f20194417f6ca747cbcffc7c44c
commit: a5293ede37465e6dbab72bcb9deb8f4bc3a5b6be [60/92] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
config: nios2-randconfig-002-20240825 (https://download.01.org/0day-ci/archive/20240825/202408252209.Zrdp1SUk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240825/202408252209.Zrdp1SUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408252209.Zrdp1SUk-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/spi/spi-cadence-quadspi.o: in function `cqspi_phy_check_pattern':
   drivers/spi/spi-cadence-quadspi.c:408:(.text+0x5f0): undefined reference to `spi_mem_exec_op'
>> drivers/spi/spi-cadence-quadspi.c:408:(.text+0x5f0): relocation truncated to fit: R_NIOS2_CALL26 against `spi_mem_exec_op'


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
