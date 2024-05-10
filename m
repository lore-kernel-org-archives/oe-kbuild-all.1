Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF47014A0AD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715331422; cv=none; b=WPIB2RUKr7snQav/GbUAftlrc64vu+S0OG0tZLdspjYLqPmKqGRnAHiLRMbqq1kBHlu03QC4CSYLgQJufGhf11LpqXZFRespT2vQ1WTfKHV805ifvDku+fyhIu9H8Xtx/50MrvK5dIUshQqH0ZcWdmbf+XCEk/KTxbzzN8tBYnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715331422; c=relaxed/simple;
	bh=ZRU8fIQ4WqG3qiZu4D6exV0HMgQQgugX67A3jbnkyGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cqTfAd5VjRq9exktG71sxdu14BAE4yb0dWyCyA9qSB8fUXH2PsgvHSdefqbw6HQfb4Wk6YlA6MaKi9CofEDndnzscHLAQ6PCHhgDMQ7KduAHnBlNVdzqZYF+qFo5CQTiPSqPPO4udvGV4imVpV5ZPTdsZLn9H3XYNQPzdA+dI1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYIHmJfe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYIHmJfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715331420; x=1746867420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZRU8fIQ4WqG3qiZu4D6exV0HMgQQgugX67A3jbnkyGk=;
  b=TYIHmJfeOWzLQNx1TMVw7WJG41toIpAKScuTSQFszoR2RuDfALLQAZUR
   ESTylI1wloiJcYjBu/iEByjZBr3UDrZrBqISSVkm0bhABy+0UI7wxR1Bs
   aQ5a+rSkDzQDY7KdkJXhJs8Zt49lSElQCuCZlbmII6fUW9LHk+FywBnGO
   GJ6tWMO1ksubMRgUQqLy/UO3YAM4CW8b20io9PTDx2Pj7OZbZasDYh/wf
   OMMC/4F/MZ2vyuk+J7Wc6Pj+ErH486OwZNGcQqlJeDRcspx4S/jt/hUHT
   tHCOVrUIYPchBl9M9mtxbJOWF0kpWIpXjtKmCFCqXUtlWjuMVLUJVGsZE
   g==;
X-CSE-ConnectionGUID: Iy3ZYxjhR9W1H2A6NNL27g==
X-CSE-MsgGUID: HOIAF79uROKf1EPnujWYPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28786581"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="28786581"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 01:56:59 -0700
X-CSE-ConnectionGUID: T1Sv1MAnQ+OWhfTk/OwveA==
X-CSE-MsgGUID: 1XIx28bdTVGoYb9xQXsI8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="34065975"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 May 2024 01:56:57 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5M3j-0005uh-0j;
	Fri, 10 May 2024 08:56:55 +0000
Date: Fri, 10 May 2024 16:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 17/78] drivers/hid/hid-himax.c:311:35:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202405101606.CZ3FvkfM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   cd87d14c5c4cc74e7c89677acb4aa9c804165fc7
commit: ec121059093ba2a3d03ca56d67bdfe02d2e34ffc [17/78] CHROMIUM: HID: hid-himax: Add Himax HX83102J touchscreen driver
config: arm64-randconfig-r113-20240510 (https://download.01.org/0day-ci/archive/20240510/202405101606.CZ3FvkfM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240510/202405101606.CZ3FvkfM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101606.CZ3FvkfM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-himax.c:311:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:311:35: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:311:35: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:378:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:378:35: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:378:35: sparse:     got restricted __le32 [usertype]
>> drivers/hid/hid-himax.c:560:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:560:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:560:26: sparse:     got restricted __le32 [usertype]
>> drivers/hid/hid-himax.c:608:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:608:30: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:608:30: sparse:     got restricted __le16 [usertype]
>> drivers/hid/hid-himax.c:625:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:625:36: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:625:36: sparse:     got restricted __le32 [usertype]
>> drivers/hid/hid-himax.c:684:30: sparse: sparse: cast to restricted __le32
>> drivers/hid/hid-himax.c:864:57: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] *[assigned] word @@
   drivers/hid/hid-himax.c:864:57: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:864:57: sparse:     got unsigned int [usertype] *[assigned] word
   drivers/hid/hid-himax.c:866:61: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] *[assigned] word @@
   drivers/hid/hid-himax.c:866:61: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:866:61: sparse:     got unsigned int [usertype] *[assigned] word
>> drivers/hid/hid-himax.c:1453:25: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:1455:25: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:1457:25: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:1459:25: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:1461:25: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:1463:25: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:1465:25: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:1467:25: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:1469:25: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:1471:25: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +311 drivers/hid/hid-himax.c

   273	
   274	/**
   275	 * himax_mcu_register_read() - Read data from IC register/sram
   276	 * @ts: Himax touch screen data
   277	 * @addr: Address to read
   278	 * @buf: Buffer to store data, caller should allocate the buffer
   279	 * @len: Length of data to read
   280	 *
   281	 * Himax TP IC has its internal register and SRAM, this function is used to
   282	 * read data from it. The reading protocol require a sequence of write and read,
   283	 * which include write address to IC and read data from IC. Thus the read/write
   284	 * operation is proctected by reg_lock mutex_unlock to protect the sequence.
   285	 * The first step is to set the burst mode for MCU, then write the address to
   286	 * AHB register to tell where to read. Then set the access direction to read,
   287	 * and read the data from AHB register. The max length of data to read is decided
   288	 * by AHB register max transfer size, but if it could't bigger then SPI controller
   289	 * max transfer size. When the length of data is over the max transfer size,
   290	 * the data will be read in multiple times.
   291	 *
   292	 * Return: 0 on success, negative error code on failure
   293	 */
   294	static int himax_mcu_register_read(struct himax_ts_data *ts, u32 addr, u8 *buf, u32 len)
   295	{
   296		int i;
   297		int ret;
   298		u8 direction_switch = HIMAX_AHB_CMD_ACCESS_DIRECTION_READ;
   299		u32 read_sz;
   300		const u32 max_trans_sz =
   301			min(HIMAX_HX83102J_REG_XFER_MAX, ts->spi_xfer_max_sz - HIMAX_BUS_R_HLEN);
   302		union himax_dword_data target_addr;
   303	
   304		mutex_lock(&ts->reg_lock);
   305	
   306		ret = himax_burst_mode_enable(ts, addr, len);
   307		if (ret)
   308			goto read_end;
   309	
   310		for (i = 0; i < len; i += read_sz) {
 > 311			target_addr.dword = cpu_to_le32(addr + i);
   312			ret = himax_write(ts, HIMAX_AHB_ADDR_BYTE_0, target_addr.byte, NULL, 4);
   313			if (ret < 0) {
   314				dev_err(ts->dev, "%s: write ahb_addr_byte_0 failed\n", __func__);
   315				goto read_end;
   316			}
   317	
   318			ret = himax_write(ts, HIMAX_AHB_ADDR_ACCESS_DIRECTION, NULL,
   319					  &direction_switch, 1);
   320			if (ret < 0) {
   321				dev_err(ts->dev, "%s: write ahb_addr_access_direction failed\n", __func__);
   322				goto read_end;
   323			}
   324	
   325			read_sz = min((len - i), max_trans_sz);
   326			ret = himax_read(ts, HIMAX_AHB_ADDR_RDATA_BYTE_0, buf + i, read_sz);
   327			if (ret < 0) {
   328				dev_err(ts->dev, "%s: read ahb_addr_rdata_byte_0 failed\n", __func__);
   329				goto read_end;
   330			}
   331		}
   332	
   333	read_end:
   334		mutex_unlock(&ts->reg_lock);
   335		if (ret < 0)
   336			dev_err(ts->dev, "%s: addr = 0x%08X, len = %u, ret = %d\n", __func__,
   337				addr, len, ret);
   338	
   339		return ret;
   340	}
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
