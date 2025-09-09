Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB98E18A93F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757397332; cv=none; b=obDkGzjyDP0abvilrMktSEBRba+QKGxJmzbfBpBmEOz07UdpmoAASaX7XlqLkWJcWR4+ILM2+M/GK05+5vUSZN89bHpeNL12Z8ExkFEAfsZDEc6huRJcnfiSzJXX+yV1pQiOrqAekd8uQG73GB0ECiD3EhJkdTyhcDUHC54LvXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757397332; c=relaxed/simple;
	bh=zhZCrpmWZPOkudqyLFmTvcTBQbbPOx/PMtiexJMs+FI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ifK3QXAjDmtPW014Ji2HJvi/GuTvQ2fLfVI3/jGYxq66w+deneUdMTgi675OIEk0rZCv1UBagOtmWwpXjX0rgH3Ay4cKSQAMb7+ug0GL0OwaRYgNzGPIZzkMnBBtpBGKOwQXyUDGyVIKhmNeSfiAahMCjFS4SXSNrP7i1LdQSgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZMjfwxk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZMjfwxk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757397330; x=1788933330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zhZCrpmWZPOkudqyLFmTvcTBQbbPOx/PMtiexJMs+FI=;
  b=bZMjfwxkrszOA3uCER/zqHsCS2YA/PsdbwMNMar7shHBfIUxn2K6aN85
   +KJBrWg27lf7cnAoEYlDYtOSODtuehMlSnOXH4vQ9Jq2sSOVk69pd5ipA
   AhFQ5VC0NGpHSuSIKzxWfwTzpwWtvlNSGcuT41nnqDN5dJH5Y0NFn1w8R
   ZaxZQZQSNFxyDT0WVZLKhFIp5TKJOCQi1kRenCqAjfzz8IjgJQL4KepKJ
   k3q4huep9XzHo/ALPhL1qoZx2nnrklXRWUyxuhDjhciV9gsunvjazKSz8
   rUKA5xt3E0692yQagJX0kkxtr1e88nUepfrvdhgkDw7s8ik93AL2G6ESx
   w==;
X-CSE-ConnectionGUID: dmZU+YKmQl6tJuiAfdlPJA==
X-CSE-MsgGUID: /fHJ7C91RX2dJ1AoyCeoyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59741453"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59741453"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 22:55:30 -0700
X-CSE-ConnectionGUID: uzWm3tguSg2K9mM/JuTqHg==
X-CSE-MsgGUID: Xu/uFlTDSeenIlL54ST5yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172166366"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Sep 2025 22:55:29 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvrKA-0004UX-00;
	Tue, 09 Sep 2025 05:55:26 +0000
Date: Tue, 9 Sep 2025 13:55:03 +0800
From: kernel test robot <lkp@intel.com>
To: Feng Chen <feng.chen@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [broonie-ci:v4_20250829_xianwei_zhao_support_for_amlogic_spi_flash_controller_ip
 2/3] drivers/spi/spi-amlogic-spifc-a4.c:592:7: warning: variable 'is_datain'
 is used uninitialized whenever 'if' condition is false
Message-ID: <202509091334.qu6nURxb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v4_20250829_xianwei_zhao_support_for_amlogic_spi_flash_controller_ip
head:   d65e7394703e62a44203a1effcef4b2ec896e0e9
commit: e6f930917f69751d4e02d55ff9b2c89a7a63a3fc [2/3] spi: amlogic: add driver for Amlogic SPI Flash Controller
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250909/202509091334.qu6nURxb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091334.qu6nURxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091334.qu6nURxb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-amlogic-spifc-a4.c:592:7: warning: variable 'is_datain' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     592 |                 if (!buf) {
         |                     ^~~~
   drivers/spi/spi-amlogic-spifc-a4.c:601:12: note: uninitialized use occurs here
     601 |                                        is_datain ? sfc->info_buf : NULL,
         |                                        ^~~~~~~~~
   drivers/spi/spi-amlogic-spifc-a4.c:592:3: note: remove the 'if' if its condition is always true
     592 |                 if (!buf) {
         |                 ^~~~~~~~~
   drivers/spi/spi-amlogic-spifc-a4.c:590:13: warning: variable 'is_datain' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     590 |         } else if (op->data.dir == SPI_MEM_DATA_OUT) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-amlogic-spifc-a4.c:601:12: note: uninitialized use occurs here
     601 |                                        is_datain ? sfc->info_buf : NULL,
         |                                        ^~~~~~~~~
   drivers/spi/spi-amlogic-spifc-a4.c:590:9: note: remove the 'if' if its condition is always true
     590 |         } else if (op->data.dir == SPI_MEM_DATA_OUT) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-amlogic-spifc-a4.c:568:16: note: initialize the variable 'is_datain' to silence this warning
     568 |         bool is_datain;
         |                       ^
         |                        = 0
>> drivers/spi/spi-amlogic-spifc-a4.c:590:13: warning: variable 'buf' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     590 |         } else if (op->data.dir == SPI_MEM_DATA_OUT) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-amlogic-spifc-a4.c:600:38: note: uninitialized use occurs here
     600 |         ret = aml_sfc_dma_buffer_setup(sfc, buf, op->data.nbytes,
         |                                             ^~~
   drivers/spi/spi-amlogic-spifc-a4.c:590:9: note: remove the 'if' if its condition is always true
     590 |         } else if (op->data.dir == SPI_MEM_DATA_OUT) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-amlogic-spifc-a4.c:566:11: note: initialize the variable 'buf' to silence this warning
     566 |         void *buf;
         |                  ^
         |                   = NULL
   3 warnings generated.


vim +592 drivers/spi/spi-amlogic-spifc-a4.c

   563	
   564	static int aml_sfc_raw_io_op(struct aml_sfc *sfc, const struct spi_mem_op *op)
   565	{
   566		void *buf;
   567		int ret;
   568		bool is_datain;
   569		u32 cmd = 0, conf;
   570		u64 timeout_ms;
   571	
   572		if (!op->data.nbytes)
   573			goto end_xfer;
   574	
   575		conf = (op->data.nbytes >> RAW_SIZE_BW) << __bf_shf(RAW_EXT_SIZE);
   576		ret = regmap_update_bits(sfc->regmap_base, SFC_SPI_CFG, RAW_EXT_SIZE, conf);
   577		if (ret)
   578			goto err_out;
   579	
   580		if (op->data.dir == SPI_MEM_DATA_IN) {
   581			is_datain = true;
   582	
   583			buf = aml_get_dma_safe_input_buf(op);
   584			if (!buf) {
   585				ret = -ENOMEM;
   586				goto err_out;
   587			}
   588	
   589			cmd |= CMD_NAND2MEM(0, (op->data.nbytes & RAW_SIZE));
 > 590		} else if (op->data.dir == SPI_MEM_DATA_OUT) {
   591			buf = aml_sfc_get_dma_safe_output_buf(op);
 > 592			if (!buf) {
   593				ret = -ENOMEM;
   594				goto err_out;
   595			}
   596	
   597			cmd |= CMD_MEM2NAND(0, (op->data.nbytes & RAW_SIZE));
   598		}
   599	
   600		ret = aml_sfc_dma_buffer_setup(sfc, buf, op->data.nbytes,
   601					       is_datain ? sfc->info_buf : NULL,
   602					       is_datain ? ECC_PER_INFO_BYTE : 0,
   603					       is_datain ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
   604		if (ret)
   605			goto err_out;
   606	
   607		ret = regmap_write(sfc->regmap_base, SFC_CMD, cmd);
   608		if (ret)
   609			goto err_out;
   610	
   611		timeout_ms = aml_sfc_cal_timeout_cycle(sfc, op);
   612		ret = aml_sfc_wait_cmd_finish(sfc, timeout_ms);
   613		if (ret)
   614			goto err_out;
   615	
   616		if (is_datain)
   617			aml_sfc_check_ecc_pages_valid(sfc, 1);
   618	
   619		if (op->data.dir == SPI_MEM_DATA_IN)
   620			aml_sfc_put_dma_safe_input_buf(op, buf);
   621		else if (op->data.dir == SPI_MEM_DATA_OUT)
   622			aml_sfc_put_dma_safe_output_buf(op, buf);
   623	
   624		aml_sfc_dma_buffer_release(sfc, op->data.nbytes,
   625					   is_datain ? ECC_PER_INFO_BYTE : 0,
   626					   is_datain ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
   627	
   628	end_xfer:
   629		return aml_sfc_end_transfer(sfc, CS_HOLD_CYCLE);
   630	
   631	err_out:
   632		return ret;
   633	}
   634	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
