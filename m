Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A038C18E76B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727703442; cv=none; b=eXgfSL0cQWVxEFccYCPCIWxMpgGUxBUnSec0ZlzQpjVEi9mX1gTvxeBXnIwULp+Du/nDtrof33JE9VX5FJr0lK5htTNlK9qi90KzjrGnn5N9DjLkkivSMJbQk6dvc05nGHdGdxxtdeJ/d/zlTzSBi3G1o3BbYeZf7Jh3IHgJ5Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727703442; c=relaxed/simple;
	bh=AKp7n9vAltBFKMMk5ltqIoKVvZhXECTXgl2r3Ygfnuw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EXgK3to3rPqN3z3vkX0dpDcx8Zib0xwvCrYgnSrde9LqKkg+14FxXMlrFiVYJxREjOq4U+kv/sdT7e/BPbrbpcXPGD8RV3CKIMxIpA089BBhI11D8IYMfeAl5ETMpNau3bCrodytYqUP+7sMTebGfl3I529Db4h/bUDpUW7h56k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXNcVD5Q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXNcVD5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727703440; x=1759239440;
  h=date:from:cc:subject:message-id:mime-version;
  bh=AKp7n9vAltBFKMMk5ltqIoKVvZhXECTXgl2r3Ygfnuw=;
  b=QXNcVD5QoVuO6FRy41vHUv4Hb0l0nFuUC/ZJ/3g4RU9SmMTTB1bkhRuL
   Mv+Lc8ueKLj23gzo5MQxMQTbU2ebolpXXCNR0YfX0L8S4YJ3Gq3skLX8l
   F0cgz3LcDTdWx9IGLoECFFf8Cy8E/D3f3s8lB758E2wHOWBN2Tp92JTFb
   rwnXZcA+KYMWr+Ui2kd2NRsulriZw9sZMnPHMh6EmuNQamlXP3rWFPjQH
   /VJdialYC+I6NQE0aHJIDr3Lbq2H7DdX+QcO6EzXgJhcDrExhTCjRnvee
   6mnFwrAgr95Llaf0ShgxR4b7UUXsgt9J/ODbSVVUCbBOzemrxBXnoDsnO
   g==;
X-CSE-ConnectionGUID: ziT5/DdLQZSpfp51Zrq8Hw==
X-CSE-MsgGUID: qGkVUcLZScm00riidKE72A==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="14416142"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="14416142"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 06:37:15 -0700
X-CSE-ConnectionGUID: Vetup64XScaEBmwSZxNEQQ==
X-CSE-MsgGUID: yTUKDgjeTqmHMgQyvorEUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="73171505"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Sep 2024 06:37:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svGaO-000PVB-0S;
	Mon, 30 Sep 2024 13:37:12 +0000
Date: Mon, 30 Sep 2024 21:36:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:linux-5.10.y 272/304] drivers/remoteproc/stm32_rproc.c:636:34:
 warning: 'stm32_rproc_match' defined but not used
Message-ID: <202409302132.IdR3DeKa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git linux-5.10.y
head:   b2add7c50b5bf51a401424ad00792b130a73c2c5
commit: f0b0a4de789d0fd7640f63c76eeba68caec18744 [272/304] remoteproc: stm32: use correct format strings on 64-bit
config: x86_64-buildonly-randconfig-004-20240930 (https://download.01.org/0day-ci/archive/20240930/202409302132.IdR3DeKa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409302132.IdR3DeKa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409302132.IdR3DeKa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/remoteproc/stm32_rproc.c:9:
   drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_da_to_pa':
   drivers/remoteproc/stm32_rproc.c:572:30: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Wformat=]
     572 |                 dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
         |                              ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/remoteproc/stm32_rproc.c:572:17: note: in expansion of macro 'dev_dbg'
     572 |                 dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
         |                 ^~~~~~~
   drivers/remoteproc/stm32_rproc.c:572:47: note: format string is defined here
     572 |                 dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
         |                                             ~~^
         |                                               |
         |                                               unsigned int
         |                                             %#llx
   drivers/remoteproc/stm32_rproc.c: At top level:
>> drivers/remoteproc/stm32_rproc.c:636:34: warning: 'stm32_rproc_match' defined but not used [-Wunused-const-variable=]
     636 | static const struct of_device_id stm32_rproc_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~


vim +/stm32_rproc_match +636 drivers/remoteproc/stm32_rproc.c

13140de09cc2dd Fabien Dessenne 2019-05-14  635  
13140de09cc2dd Fabien Dessenne 2019-05-14 @636  static const struct of_device_id stm32_rproc_match[] = {
13140de09cc2dd Fabien Dessenne 2019-05-14  637  	{ .compatible = "st,stm32mp1-m4" },
13140de09cc2dd Fabien Dessenne 2019-05-14  638  	{},
13140de09cc2dd Fabien Dessenne 2019-05-14  639  };
13140de09cc2dd Fabien Dessenne 2019-05-14  640  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
13140de09cc2dd Fabien Dessenne 2019-05-14  641  

:::::: The code at line 636 was first introduced by commit
:::::: 13140de09cc2dd5e5166ad42292bb82af4e23cef remoteproc: stm32: add an ST stm32_rproc driver

:::::: TO: Fabien Dessenne <fabien.dessenne@st.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
