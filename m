Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C18247284
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 02:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757472742; cv=none; b=Hzcmtahh9gkvp+eqmOSthqkSRVKB4fNrtLe9KyPFlyd5r5S4zdjEXyPGFmmcHgWuvIp/RiIDnZSHhPKEMdn8xUQNgZRyjJs0nwT/BR/gQokQiqlBh5ZiIHp5lW16rBMigKulMs75IP/za7Eeob4ae5N+c3bqy4M+TP2AuY1L+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757472742; c=relaxed/simple;
	bh=lMSeuHuapqLyoymMquFVFz63PgiHIjy5MO8EgSzCzNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I8YlVH2+EZ03sqoCNoNXI09aYCTkwx8hGW30qrJx7Vm3UQjQIumWdVfJjBkB1Ou3vYoKLOVbLH829hihYOZ1Meflr+iFnROiahL2FC26AQwcJeMNf7nq4JLtb52n4WLideeItbwfstVCeE2dmyjAnqe0ciVgIZEk/vEC8oO8CxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwmToGVB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwmToGVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757472741; x=1789008741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lMSeuHuapqLyoymMquFVFz63PgiHIjy5MO8EgSzCzNw=;
  b=ZwmToGVBqXKr0RgyK0hFr4Cc1xgT1Kx6GdQVHRPhJ0Ea+iT4lxBS0CMB
   M3P9i1OVxZfYiaLj3AhQYs7p5uaxSDjbPy/Hff09o5Fx/Wf9JPABHwLVj
   5yAYS6sEvVeK8imyC5Wf3l0e8gIU2kevSKUmfeYypInx5xCU+PprsOKr8
   p5lwu2v09hFmTg7P4300AbXBf/g5j2+kKxK2I2orknChNlbmM5lKznMu2
   RAAvNR3hOFSU2nBmHdZGJqsNaFT+4XMcQHP3Gii4YiqK0Kafccp9plQuK
   ObOYo+tITw36RA+LrG8NTTF2iS896kqBEwZYfZKw0m9hPcM8/2+G8up6X
   Q==;
X-CSE-ConnectionGUID: guy2EoYaTw6yJpcjJQ9uCQ==
X-CSE-MsgGUID: KYCWP6A/Te2eQYRxfuKPPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71188179"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="71188179"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 19:52:17 -0700
X-CSE-ConnectionGUID: wFocB6uxRfmJEWAYgumIXg==
X-CSE-MsgGUID: t/KnWWnGQgm5ZG/7/3Zuig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="173711523"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2025 19:52:15 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwAwP-0005Tr-1G;
	Wed, 10 Sep 2025 02:52:13 +0000
Date: Wed, 10 Sep 2025 10:51:58 +0800
From: kernel test robot <lkp@intel.com>
To: Feng Chen <feng.chen@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [broonie-ci:v4_20250829_xianwei_zhao_support_for_amlogic_spi_flash_controller_ip
 2/3] drivers/spi/spi-amlogic-spifc-a4.c:550:14: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202509101055.UE0UpGTs-lkp@intel.com>
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
config: s390-randconfig-r111-20250910 (https://download.01.org/0day-ci/archive/20250910/202509101055.UE0UpGTs-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce: (https://download.01.org/0day-ci/archive/20250910/202509101055.UE0UpGTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101055.UE0UpGTs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-amlogic-spifc-a4.c:550:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] *info @@     got unsigned long long [usertype] * @@
   drivers/spi/spi-amlogic-spifc-a4.c:550:14: sparse:     expected restricted __le64 [usertype] *info
   drivers/spi/spi-amlogic-spifc-a4.c:550:14: sparse:     got unsigned long long [usertype] *
>> drivers/spi/spi-amlogic-spifc-a4.c:560:23: sparse: sparse: restricted __le64 degrades to integer
   drivers/spi/spi-amlogic-spifc-a4.c:646:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] *info @@     got unsigned long long [usertype] * @@
   drivers/spi/spi-amlogic-spifc-a4.c:646:22: sparse:     expected restricted __le64 [usertype] *info
   drivers/spi/spi-amlogic-spifc-a4.c:646:22: sparse:     got unsigned long long [usertype] *
>> drivers/spi/spi-amlogic-spifc-a4.c:647:23: sparse: sparse: invalid assignment: |=
   drivers/spi/spi-amlogic-spifc-a4.c:647:23: sparse:    left side has type restricted __le64
   drivers/spi/spi-amlogic-spifc-a4.c:647:23: sparse:    right side has type unsigned char
   drivers/spi/spi-amlogic-spifc-a4.c:648:23: sparse: sparse: invalid assignment: |=
   drivers/spi/spi-amlogic-spifc-a4.c:648:23: sparse:    left side has type restricted __le64
   drivers/spi/spi-amlogic-spifc-a4.c:648:23: sparse:    right side has type int
   drivers/spi/spi-amlogic-spifc-a4.c:661:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] *info @@     got unsigned long long [usertype] * @@
   drivers/spi/spi-amlogic-spifc-a4.c:661:22: sparse:     expected restricted __le64 [usertype] *info
   drivers/spi/spi-amlogic-spifc-a4.c:661:22: sparse:     got unsigned long long [usertype] *
>> drivers/spi/spi-amlogic-spifc-a4.c:662:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] @@     got restricted __le64 [usertype] @@
   drivers/spi/spi-amlogic-spifc-a4.c:662:32: sparse:     expected unsigned char [usertype]
   drivers/spi/spi-amlogic-spifc-a4.c:662:32: sparse:     got restricted __le64 [usertype]
   drivers/spi/spi-amlogic-spifc-a4.c:663:38: sparse: sparse: restricted __le64 degrades to integer
>> drivers/spi/spi-amlogic-spifc-a4.c:679:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] *info @@     got unsigned long long [usertype] *info_buf @@
   drivers/spi/spi-amlogic-spifc-a4.c:679:26: sparse:     expected restricted __le64 [usertype] *info
   drivers/spi/spi-amlogic-spifc-a4.c:679:26: sparse:     got unsigned long long [usertype] *info_buf
   drivers/spi/spi-amlogic-spifc-a4.c:680:21: sparse: sparse: restricted __le64 degrades to integer
   drivers/spi/spi-amlogic-spifc-a4.c:681:47: sparse: sparse: restricted __le64 degrades to integer

vim +550 drivers/spi/spi-amlogic-spifc-a4.c

   543	
   544	static void aml_sfc_check_ecc_pages_valid(struct aml_sfc *sfc, bool raw)
   545	{
   546		struct aml_sfc_ecc_cfg *ecc_cfg;
   547		__le64 *info;
   548		int ret;
   549	
 > 550		info = (u64 *)sfc->info_buf;
   551		ecc_cfg = aml_sfc_to_ecc_ctx(sfc);
   552		info += raw ? 0 : ecc_cfg->nsteps - 1;
   553	
   554		do {
   555			usleep_range(10, 15);
   556			/* info is updated by nfc dma engine*/
   557			smp_rmb();
   558			dma_sync_single_for_cpu(sfc->dev, sfc->iaddr, sfc->info_bytes,
   559						DMA_FROM_DEVICE);
 > 560			ret = *info & ECC_COMPLETE;
   561		} while (!ret);
   562	}
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
   590		} else if (op->data.dir == SPI_MEM_DATA_OUT) {
   591			buf = aml_sfc_get_dma_safe_output_buf(op);
   592			if (!buf) {
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
   635	static void aml_sfc_set_user_byte(struct aml_sfc *sfc, u64 *info_buf, u8 *oob_buf, bool auto_oob)
   636	{
   637		struct aml_sfc_ecc_cfg *ecc_cfg;
   638		__le64 *info;
   639		int i, count, step_size;
   640	
   641		ecc_cfg = aml_sfc_to_ecc_ctx(sfc);
   642	
   643		step_size = auto_oob ? ECC_BCH8_INFO_BYTES : ECC_BCH8_USER_BYTES;
   644	
   645		for (i = 0, count = 0; i < ecc_cfg->nsteps; i++, count += step_size) {
   646			info = &info_buf[i];
 > 647			*info |= oob_buf[count];
   648			*info |= oob_buf[count + 1] << 8;
   649		}
   650	}
   651	
   652	static void aml_sfc_get_user_byte(struct aml_sfc *sfc, u64 *info_buf, u8 *oob_buf)
   653	{
   654		struct aml_sfc_ecc_cfg *ecc_cfg;
   655		__le64 *info;
   656		int i, count;
   657	
   658		ecc_cfg = aml_sfc_to_ecc_ctx(sfc);
   659	
   660		for (i = 0, count = 0; i < ecc_cfg->nsteps; i++, count += ECC_BCH8_INFO_BYTES) {
   661			info = &info_buf[i];
 > 662			oob_buf[count] = *info;
   663			oob_buf[count + 1] = *info >> 8;
   664		}
   665	}
   666	
   667	static int aml_sfc_check_hwecc_status(struct aml_sfc *sfc, u64 *info_buf)
   668	{
   669		struct aml_sfc_ecc_cfg *ecc_cfg;
   670		__le64 *info;
   671		u32 i, max_bitflips = 0, per_sector_bitflips = 0;
   672	
   673		ecc_cfg = aml_sfc_to_ecc_ctx(sfc);
   674	
   675		sfc->ecc_stats.failed = 0;
   676		sfc->ecc_stats.bitflips = 0;
   677		sfc->ecc_stats.corrected = 0;
   678	
 > 679		for (i = 0, info = info_buf; i < ecc_cfg->nsteps; i++, info++) {
   680			if (ECC_ERR_CNT(*info) != ECC_UNCORRECTABLE) {
   681				per_sector_bitflips = ECC_ERR_CNT(*info);
   682				max_bitflips = max_t(u32, max_bitflips, per_sector_bitflips);
   683				sfc->ecc_stats.corrected += per_sector_bitflips;
   684				continue;
   685			}
   686	
   687			return -EBADMSG;
   688		}
   689	
   690		return max_bitflips;
   691	}
   692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
