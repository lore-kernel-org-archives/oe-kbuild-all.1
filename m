Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F0313E2D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 08:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875404; cv=none; b=MbP+rCgjCdQQVcw4WKFKeeZQikZIK2G07+JTzq9F9M+NFcaO7HXTbl9+d0uNW4U/HkXlNCOq1Swn5ThPfprEWoGID16ZwFDKjZ1lhwKHxiL/mcamLbphmV/Cwxr6gSci/Vm7LIrJOpSPCTQz9qNrRLgxzUMjv4uIj2dus74ZDNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875404; c=relaxed/simple;
	bh=+Zg9/WTzy9PCKLoblpkHK2d1bLQXgJ7YTXPfsE6oYB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c1K4UILnVk8kX/VhDhEHPM+S5DGuu0cc1VaHm0qz2qGjHT//PphaTxdiRZVk1S7KDidnlJwYuZEK6GGx5pzwMJ26AHpLHEkBinUZaCDXEIqeRFYIPVz0M5Biz16ffZkn6pxGOI73+svwzkOP4WGrHlqdjv1kq9L1L+i2U9dTYmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebsrgrOV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebsrgrOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765875403; x=1797411403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Zg9/WTzy9PCKLoblpkHK2d1bLQXgJ7YTXPfsE6oYB8=;
  b=ebsrgrOV2IUREdElJV/cbRp6THEkEfvK0Q/YCoBHhU3PHu5qyzmcrMcJ
   yCi64AvTKsSAvk/B8yfH+beg/XrU3l3YalkE1SuKqGlmEe0X4oUBrkI0j
   2d31cQ0ZT8xZI+9cnEDIy8y9zgaHbtqeVQGHflWxzjoIkWGTpbt8EYoHW
   ZhWnC9PsO22CLr5s8VYvUVZCUB+C/mutTe1uVMG2ENW8FW1cqxcHmayYP
   7BpvZ7S6gHYSc5doMOTsU7p8KrO5dolk0Tai2a6fon2mG5+dRHpNHEVzP
   pB4ZIOXfrbtSh5ikASZz6GbF/UQya9wlJ/VRyLut+WWq6DrANNy05w1o7
   A==;
X-CSE-ConnectionGUID: voUI/X9sTXeSKiFZKDBSnQ==
X-CSE-MsgGUID: hbuoo5EpS0+x2csg2zbBfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67543432"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67543432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 00:56:42 -0800
X-CSE-ConnectionGUID: 9vzW3wwkSEqMhpsIEQCMeQ==
X-CSE-MsgGUID: VIFZq8OSQAeYxpESoV2YLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="203067988"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 16 Dec 2025 00:56:40 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVQrD-000000001PB-2Q5U;
	Tue, 16 Dec 2025 08:56:36 +0000
Date: Tue, 16 Dec 2025 16:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50]
 drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:3241:22: warning:
 variable 'ptmask' set but not used
Message-ID: <202512161614.Vrq6aTWC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   8021645c122892ec7df09270bcd640dc4c766f82
commit: 112d0b73eedf1907161f808b6caf0e2c271a6969 [50/50] anolis: ethernet: Add motorcomm yt6801 support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251216/202512161614.Vrq6aTWC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161614.Vrq6aTWC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161614.Vrq6aTWC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_set_wake_pattern':
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:3241:22: warning: variable 'ptmask' set but not used [-Wunused-but-set-variable]
    3241 |         u8 *ptdata, *ptmask;
         |                      ^~~~~~
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:3241:13: warning: variable 'ptdata' set but not used [-Wunused-but-set-variable]
    3241 |         u8 *ptdata, *ptmask;
         |             ^~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_dev_read':
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:4761:33: warning: variable 'l34t' set but not used [-Wunused-but-set-variable]
    4761 |         unsigned int err, etlt, l34t;
         |                                 ^~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_dismiss_MAC_int':
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:5045:21: warning: variable 'regErrVal' set but not used [-Wunused-but-set-variable]
    5045 |         u32 regval, regErrVal;
         |                     ^~~~~~~~~
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:5045:13: warning: variable 'regval' set but not used [-Wunused-but-set-variable]
    5045 |         u32 regval, regErrVal;
         |             ^~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_dismiss_MAC_PMT_int':
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:5056:13: warning: variable 'regval' set but not used [-Wunused-but-set-variable]
    5056 |         u32 regval;
         |             ^~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_dismiss_MAC_LPI_int':
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:5065:13: warning: variable 'regval' set but not used [-Wunused-but-set-variable]
    5065 |         u32 regval;
         |             ^~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c: In function 'fxgmac_dismiss_all_int':
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c:5088:25: warning: variable 'regval' set but not used [-Wunused-but-set-variable]
    5088 |         unsigned int i, regval;
         |                         ^~~~~~
--
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c: In function 'fxgmac_tx_poll':
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c:1793:20: warning: variable 'reg_cur_pre' set but not used [-Wunused-but-set-variable]
    1793 |         static u32 reg_cur_pre = 0xffffffff;
         |                    ^~~~~~~~~~~
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c:1792:20: warning: variable 'change_cnt' set but not used [-Wunused-but-set-variable]
    1792 |         static u32 change_cnt;
         |                    ^~~~~~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c:1791:20: warning: variable 'fxgmac_restart_need' set but not used [-Wunused-but-set-variable]
    1791 |         static int fxgmac_restart_need;
         |                    ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c: In function 'fxgmac_one_poll_tx':
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-net.c:2240:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2240 |         int ret = 0;
         |             ^~~
--
   drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-debugfs.c:703: warning: Function parameter or member 'pdata' not described in 'fxgmac_dbg_adapter_init'
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-debugfs.c:703: warning: Excess function parameter 'adapter' description in 'fxgmac_dbg_adapter_init'
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-debugfs.c:725: warning: Function parameter or member 'pdata' not described in 'fxgmac_dbg_adapter_exit'
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-debugfs.c:725: warning: Excess function parameter 'adapter' description in 'fxgmac_dbg_adapter_exit'
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-debugfs.c:735: warning: Function parameter or member 'pdata' not described in 'fxgmac_dbg_init'
>> drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-debugfs.c:782: warning: Function parameter or member 'pdata' not described in 'fxgmac_dbg_exit'


vim +/ptmask +3241 drivers/net/ethernet/motorcomm/yt6801/fuxi-gmac-hw.c

  3230	
  3231	static int fxgmac_set_wake_pattern(struct fxgmac_pdata *pdata,
  3232					   struct wol_bitmap_pattern *wol_pattern,
  3233					   u32 pattern_cnt)
  3234	{
  3235		u32 i, j, kp, km, mask_index;
  3236		int z;
  3237		u16 map_index;
  3238		u8 mask[MAX_PATTERN_SIZE];
  3239		u32 regval = 0;
  3240		u32 total_cnt = 0, pattern_inherited_cnt = 0;
> 3241		u8 *ptdata, *ptmask;
  3242	
  3243		if (pattern_cnt > MAX_PATTERN_COUNT) {
  3244			DbgPrintF(
  3245				MP_TRACE,
  3246				"%s - Error: %d patterns, exceed %d, not supported!\n",
  3247				__FUNCTION__, pattern_cnt, MAX_PATTERN_COUNT);
  3248			return -1;
  3249		}
  3250	
  3251		/* Reset the FIFO head pointer. */
  3252		if (fxgmac_check_wake_pattern_fifo_pointer(pdata)) {
  3253			DbgPrintF(
  3254				MP_TRACE,
  3255				"%s - Warning: the remote pattern array pointer is not be 0\n",
  3256				__FUNCTION__);
  3257			return -1;
  3258		}
  3259	
  3260		for (i = 0; i < pattern_cnt; i++) {
  3261			memcpy(&pdata->pattern[i], wol_pattern + i,
  3262			       sizeof(wol_pattern[0]));
  3263			if (pattern_cnt + pattern_inherited_cnt < MAX_PATTERN_COUNT) {
  3264				if (wol_pattern[i].pattern_offset ||
  3265				    !(wol_pattern[i].mask_info[0] & 0x01)) {
  3266					memcpy(&pdata->pattern[pattern_cnt +
  3267							       pattern_inherited_cnt],
  3268					       wol_pattern + i, sizeof(wol_pattern[0]));
  3269					pattern_inherited_cnt++;
  3270				}
  3271			}
  3272		}
  3273		total_cnt = pattern_cnt + pattern_inherited_cnt;
  3274	
  3275		/*
  3276		 * calculate  the crc-16 of the mask pattern
  3277		 * print the pattern and mask for debug purpose.
  3278		 */
  3279		for (i = 0; i < total_cnt; i++) {
  3280			/* Please program pattern[i] to NIC for pattern match wakeup.
  3281			 * pattern_size, pattern_info, mask_info
  3282			 */
  3283			/* save the mask pattern */
  3284			mask_index = 0;
  3285			map_index = 0;
  3286			for (j = 0; j < pdata->pattern[i].mask_size; j++) {
  3287				for (z = 0;
  3288				     z < ((j == (MAX_PATTERN_SIZE / 8 - 1)) ? 7 : 8);
  3289				     z++) {
  3290					if (pdata->pattern[i].mask_info[j] &
  3291					    (0x01 << z)) {
  3292						mask[map_index] =
  3293							pdata->pattern[i].pattern_info
  3294								[pdata->pattern[i]
  3295									 .pattern_offset +
  3296								 mask_index];
  3297						map_index++;
  3298					}
  3299					mask_index++;
  3300				}
  3301			}
  3302			/* calculate  the crc-16 of the mask pattern */
  3303			pdata->pattern[i].pattern_crc = wol_crc16(mask, map_index);
  3304	
  3305			/* Print pattern match, for debug purpose. */
  3306			DbgPrintF(MP_LOUD, "%s - Pattern[%d]:", __FUNCTION__, i);
  3307			for (kp = 0, km = 0;
  3308			     kp < sizeof(pdata->pattern[i].pattern_info);
  3309			     kp += 16, km += 2) {
  3310				ptdata = &pdata->pattern[i].pattern_info[kp];
  3311				ptmask = &pdata->pattern[i].mask_info[km];
  3312				DBGPRINT(
  3313					MP_LOUD,
  3314					("\n    %02x-%02x-%02x-%02x-%02x-%02x-%02x-%02x  %02x-%02x-%02x-%02x-%02x-%02x-%02x-%02x  Mask %02x-%02x",
  3315					 ptdata[0], ptdata[1], ptdata[2], ptdata[3],
  3316					 ptdata[4], ptdata[5], ptdata[6], ptdata[7],
  3317					 ptdata[8], ptdata[9], ptdata[10], ptdata[11],
  3318					 ptdata[12], ptdata[13], ptdata[14], ptdata[15],
  3319					 ptmask[0], ptmask[1]));
  3320			}
  3321			DbgPrintF(
  3322				MP_LOUD,
  3323				"WritePatternToNic62 the %d patterns crc = %x mask length = %d, mask_offset=%x.\n",
  3324				i, pdata->pattern[i].pattern_crc, map_index,
  3325				pdata->pattern[i].pattern_offset);
  3326			memset(mask, 0, sizeof(mask));
  3327		}
  3328	
  3329		/* Write patterns by FIFO block. */
  3330		for (i = 0; i < (total_cnt + 3) / 4; i++) {
  3331			/* 1. Write the first 4Bytes of Filter. */
  3332			writereg(pdata->pAdapter,
  3333				 ((pdata->pattern[i * 4 + 0].mask_info[3] & 0x7f)
  3334				  << 24) |
  3335					 (pdata->pattern[i * 4 + 0].mask_info[2]
  3336					  << 16) |
  3337					 (pdata->pattern[i * 4 + 0].mask_info[1] << 8) |
  3338					 (pdata->pattern[i * 4 + 0].mask_info[0] << 0),
  3339				 pdata->mac_regs + MAC_RWK_PAC);
  3340	
  3341			writereg(pdata->pAdapter,
  3342				 ((pdata->pattern[i * 4 + 1].mask_info[3] & 0x7f)
  3343				  << 24) |
  3344					 (pdata->pattern[i * 4 + 1].mask_info[2]
  3345					  << 16) |
  3346					 (pdata->pattern[i * 4 + 1].mask_info[1] << 8) |
  3347					 (pdata->pattern[i * 4 + 1].mask_info[0] << 0),
  3348				 pdata->mac_regs + MAC_RWK_PAC);
  3349	
  3350			writereg(pdata->pAdapter,
  3351				 ((pdata->pattern[i * 4 + 2].mask_info[3] & 0x7f)
  3352				  << 24) |
  3353					 (pdata->pattern[i * 4 + 2].mask_info[2]
  3354					  << 16) |
  3355					 (pdata->pattern[i * 4 + 2].mask_info[1] << 8) |
  3356					 (pdata->pattern[i * 4 + 2].mask_info[0] << 0),
  3357				 pdata->mac_regs + MAC_RWK_PAC);
  3358	
  3359			writereg(pdata->pAdapter,
  3360				 ((pdata->pattern[i * 4 + 3].mask_info[3] & 0x7f)
  3361				  << 24) |
  3362					 (pdata->pattern[i * 4 + 3].mask_info[2]
  3363					  << 16) |
  3364					 (pdata->pattern[i * 4 + 3].mask_info[1] << 8) |
  3365					 (pdata->pattern[i * 4 + 3].mask_info[0] << 0),
  3366				 pdata->mac_regs + MAC_RWK_PAC);
  3367	
  3368			/* 2. Write the Filter Command. */
  3369			regval = 0;
  3370			/* Set filter enable bit. */
  3371			regval |= ((i * 4 + 0) < total_cnt) ? (0x1 << 0) : 0x0;
  3372			regval |= ((i * 4 + 1) < total_cnt) ? (0x1 << 8) : 0x0;
  3373			regval |= ((i * 4 + 2) < total_cnt) ? (0x1 << 16) : 0x0;
  3374			regval |= ((i * 4 + 3) < total_cnt) ? (0x1 << 24) : 0x0;
  3375			/* Set filter address type, 0- unicast, 1 - multicast. */
  3376			regval |= (i * 4 + 0 >= total_cnt)   ? 0x0 :
  3377				  (i * 4 + 0 >= pattern_cnt) ? (0x1 << (3 + 0)) :
  3378				  pdata->pattern[i * 4 + 0].pattern_offset ?
  3379							       0x0 :
  3380				  !(pdata->pattern[i * 4 + 0].mask_info[0] & 0x01) ?
  3381							       0x0 :
  3382				  (pdata->pattern[i * 4 + 0].pattern_info[0] & 0x01) ?
  3383							       (0x1 << (3 + 0)) :
  3384							       0x0;
  3385			regval |= (i * 4 + 1 >= total_cnt)   ? 0x0 :
  3386				  (i * 4 + 1 >= pattern_cnt) ? (0x1 << (3 + 8)) :
  3387				  pdata->pattern[i * 4 + 1].pattern_offset ?
  3388							       0x0 :
  3389				  !(pdata->pattern[i * 4 + 1].mask_info[0] & 0x01) ?
  3390							       0x0 :
  3391				  (pdata->pattern[i * 4 + 1].pattern_info[0] & 0x01) ?
  3392							       (0x1 << (3 + 8)) :
  3393							       0x0;
  3394			regval |= (i * 4 + 2 >= total_cnt)   ? 0x0 :
  3395				  (i * 4 + 2 >= pattern_cnt) ? (0x1 << (3 + 16)) :
  3396				  pdata->pattern[i * 4 + 2].pattern_offset ?
  3397							       0x0 :
  3398				  !(pdata->pattern[i * 4 + 2].mask_info[0] & 0x01) ?
  3399							       0x0 :
  3400				  (pdata->pattern[i * 4 + 2].pattern_info[0] & 0x01) ?
  3401							       (0x1 << (3 + 16)) :
  3402							       0x0;
  3403			regval |= (i * 4 + 3 >= total_cnt)   ? 0x0 :
  3404				  (i * 4 + 3 >= pattern_cnt) ? (0x1 << (3 + 24)) :
  3405				  pdata->pattern[i * 4 + 3].pattern_offset ?
  3406							       0x0 :
  3407				  !(pdata->pattern[i * 4 + 3].mask_info[0] & 0x01) ?
  3408							       0x0 :
  3409				  (pdata->pattern[i * 4 + 3].pattern_info[0] & 0x01) ?
  3410							       (0x1 << (3 + 24)) :
  3411							       0x0;
  3412			writereg(pdata->pAdapter, regval,
  3413				 pdata->mac_regs + MAC_RWK_PAC);
  3414	
  3415			/* 3. Write the mask offset. */
  3416			writereg(pdata->pAdapter,
  3417				 (pdata->pattern[i * 4 + 3].pattern_offset << 24) |
  3418					 (pdata->pattern[i * 4 + 2].pattern_offset
  3419					  << 16) |
  3420					 (pdata->pattern[i * 4 + 1].pattern_offset
  3421					  << 8) |
  3422					 (pdata->pattern[i * 4 + 0].pattern_offset
  3423					  << 0),
  3424				 pdata->mac_regs + MAC_RWK_PAC);
  3425	
  3426			/* 4. Write the masked data CRC. */
  3427			writereg(pdata->pAdapter,
  3428				 (pdata->pattern[i * 4 + 1].pattern_crc << 16) |
  3429					 (pdata->pattern[i * 4 + 0].pattern_crc << 0),
  3430				 pdata->mac_regs + MAC_RWK_PAC);
  3431			writereg(pdata->pAdapter,
  3432				 (pdata->pattern[i * 4 + 3].pattern_crc << 16) |
  3433					 (pdata->pattern[i * 4 + 2].pattern_crc << 0),
  3434				 pdata->mac_regs + MAC_RWK_PAC);
  3435		}
  3436	
  3437		for (i = 0; i < total_cnt; i++) {
  3438			fxgmac_set_wake_pattern_mask(
  3439				pdata, i, 0,
  3440				((pdata->pattern[i].mask_info[7] & 0x7f) << (24 + 1)) |
  3441					(pdata->pattern[i].mask_info[6] << (16 + 1)) |
  3442					(pdata->pattern[i].mask_info[5] << (8 + 1)) |
  3443					(pdata->pattern[i].mask_info[4] << (0 + 1)) |
  3444					((pdata->pattern[i].mask_info[3] & 0x80) >>
  3445					 7)); /* global  manager  regitster  mask bit  31~62 */
  3446			fxgmac_set_wake_pattern_mask(
  3447				pdata, i, 1,
  3448				((pdata->pattern[i].mask_info[11] & 0x7f) << (24 + 1)) |
  3449					(pdata->pattern[i].mask_info[10] << (16 + 1)) |
  3450					(pdata->pattern[i].mask_info[9] << (8 + 1)) |
  3451					(pdata->pattern[i].mask_info[8] << (0 + 1)) |
  3452					((pdata->pattern[i].mask_info[7] & 0x80) >>
  3453					 7)); /* global  manager  regitster  mask bit  63~94 */
  3454			fxgmac_set_wake_pattern_mask(
  3455				pdata, i, 2,
  3456				((pdata->pattern[i].mask_info[15] & 0x7f) << (24 + 1)) |
  3457					(pdata->pattern[i].mask_info[14] << (16 + 1)) |
  3458					(pdata->pattern[i].mask_info[13] << (8 + 1)) |
  3459					(pdata->pattern[i].mask_info[12] << (0 + 1)) |
  3460					((pdata->pattern[i].mask_info[11] & 0x80) >>
  3461					 7)); /* global  manager  regitster  mask bit  95~126 */
  3462		}
  3463	
  3464		return 0;
  3465	}
  3466	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
