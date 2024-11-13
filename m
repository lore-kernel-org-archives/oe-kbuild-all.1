Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393731FDFA7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731493920; cv=none; b=dcNIgWhsXzZxr8Qb3KbuMdaI0KERLnhdV7pFoSi/4D7DCMyseD+leOiJ3rN7rBbAZYphlgRb5s1YnK82NHuyo/fvH+HtJ7VVeDS6wQZpu4r+6ns+G48s19QwWAeldv4qNxQEaxa5BZ3flUMaaFTmjbnRcIZr4jNTAv2BWY3njOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731493920; c=relaxed/simple;
	bh=YwL8dCrv8mI8yNrHJ0bQ/F7ixaa5kTNW7tA5zRCqsQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FOtRpoUzklSDxxeW2NREZrGaJyZWgVS0ubsdkVzKsiDxLSeyXStB5crAgmSWjeDpkE7j6BOLRQdqDZ7EdTGZqk1wSt+FZjvfbBfGaUfcy+9SaGlyI0znrm5Zt9XL6qeeWdU98uE31EmI2r1qwyQkryILHqrkUPi2Wpti4ARSsec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIzbGEU2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIzbGEU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731493917; x=1763029917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YwL8dCrv8mI8yNrHJ0bQ/F7ixaa5kTNW7tA5zRCqsQE=;
  b=DIzbGEU26jPPftSMhg+7ZzngCjVd2S7NFBdPBS2WLTwPoNaDXLvYunpg
   FX+b64lzQQ63UpMURgedGDc0/Jm4Hkcpg+yxlf/sPhX1T3nak7x+IA2zK
   5/lyNTNh02tlr2o9psg7JFr9WxaI2iMIFXV5O9V9ZO8kU7pcRHjBv8n+d
   m8x0je9DdRsgd86IMC7mgLraWMxBmulXp2+XRjLcIvx84AXTwqdLMjIPI
   BIrPLsneeQBh3KBXAFg5a3ierJ8DrBZvpbOrTociAFTsYO1TpuRWFXdPH
   zjGBJpyzYWfXoLHRt9j+/D672JgW4F3N45Z7tOr5KUqc3G9aXGiJIiYlL
   Q==;
X-CSE-ConnectionGUID: fIdWoD7UQ4+V76bNB2sH/g==
X-CSE-MsgGUID: 6sNldjK9SGW4FWn1LIpf2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="56770596"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="56770596"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:31:56 -0800
X-CSE-ConnectionGUID: scTAZ3eXRPm7vy090WkN4g==
X-CSE-MsgGUID: PymFqlT5SgC/h4KW9hSICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="92795421"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2024 02:31:54 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBAfA-0000F5-0R;
	Wed, 13 Nov 2024 10:31:52 +0000
Date: Wed, 13 Nov 2024 18:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [ath:master 2/4] drivers/net/ethernet/intel/ice/ice_ptp.c:165:15:
 error: implicit declaration of function 'ice_read_sma_ctrl'; did you mean
 'ice_read_sr_word'?
Message-ID: <202411131838.DE0FWg8Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
head:   fc6f018eda7f9054e427f731db1e8b200f22873c
commit: 33e2bcda33620fc43cc948627be525ddb342c446 [2/4] Merge branch 'ath-current'
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20241113/202411131838.DE0FWg8Q-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131838.DE0FWg8Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131838.DE0FWg8Q-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_set_sma_cfg':
>> drivers/net/ethernet/intel/ice/ice_ptp.c:165:15: error: implicit declaration of function 'ice_read_sma_ctrl'; did you mean 'ice_read_sr_word'? [-Werror=implicit-function-declaration]
     165 |         err = ice_read_sma_ctrl(&pf->hw, &data);
         |               ^~~~~~~~~~~~~~~~~
         |               ice_read_sr_word
>> drivers/net/ethernet/intel/ice/ice_ptp.c:187:16: error: implicit declaration of function 'ice_write_sma_ctrl'; did you mean 'ice_write_intrl'? [-Werror=implicit-function-declaration]
     187 |         return ice_write_sma_ctrl(&pf->hw, data);
         |                ^~~~~~~~~~~~~~~~~~
         |                ice_write_intrl
   drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_set_funcs_e810':
>> drivers/net/ethernet/intel/ice/ice_ptp.c:2556:15: error: implicit declaration of function 'ice_ptp_read_sdp_ac' [-Werror=implicit-function-declaration]
    2556 |         err = ice_ptp_read_sdp_ac(&pf->hw, entries, &num_entries);
         |               ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5250:5: warning: no previous prototype for 'ice_read_sma_ctrl' [-Wmissing-prototypes]
    5250 | int ice_read_sma_ctrl(struct ice_hw *hw, u8 *data)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5283:5: warning: no previous prototype for 'ice_write_sma_ctrl' [-Wmissing-prototypes]
    5283 | int ice_write_sma_ctrl(struct ice_hw *hw, u8 data)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5314:5: warning: no previous prototype for 'ice_read_pca9575_reg' [-Wmissing-prototypes]
    5314 | int ice_read_pca9575_reg(struct ice_hw *hw, u8 offset, u8 *data)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5346:5: warning: no previous prototype for 'ice_ptp_read_sdp_ac' [-Wmissing-prototypes]
    5346 | int ice_ptp_read_sdp_ac(struct ice_hw *hw, __le16 *entries, uint *num_entries)
         |     ^~~~~~~~~~~~~~~~~~~
   during RTL pass: mach
   drivers/net/ethernet/intel/ice/ice_ptp_hw.c: In function 'ice_write_cgu_reg_e82x':
   drivers/net/ethernet/intel/ice/ice_ptp_hw.c:289:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9703
     289 | }
         | ^
   0x5b78c1 arc_ifcvt
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:9703
   0xe431b4 arc_reorg
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:8552
   0xaed299 execute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   drivers/net/ethernet/intel/ice/ice_gnss.c: In function 'ice_gnss_is_gps_present':
>> drivers/net/ethernet/intel/ice/ice_gnss.c:400:23: error: implicit declaration of function 'ice_read_pca9575_reg'; did you mean 'ice_read_pca9575_reg_e810t'? [-Werror=implicit-function-declaration]
     400 |                 err = ice_read_pca9575_reg(hw, ICE_PCA9575_P0_IN, &data);
         |                       ^~~~~~~~~~~~~~~~~~~~
         |                       ice_read_pca9575_reg_e810t
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +165 drivers/net/ethernet/intel/ice/ice_ptp.c

325b2064d00a88 Maciej Machnikowski 2021-08-17  149  
325b2064d00a88 Maciej Machnikowski 2021-08-17  150  /**
e4291b64e11889 Karol Kolacinski    2024-08-30  151   * ice_ptp_set_sma_cfg - set the configuration of the SMA control logic
e4291b64e11889 Karol Kolacinski    2024-08-30  152   * @pf: Board private structure
325b2064d00a88 Maciej Machnikowski 2021-08-17  153   *
e4291b64e11889 Karol Kolacinski    2024-08-30  154   * Return: 0 on success, negative error code otherwise
325b2064d00a88 Maciej Machnikowski 2021-08-17  155   */
e4291b64e11889 Karol Kolacinski    2024-08-30  156  static int ice_ptp_set_sma_cfg(struct ice_pf *pf)
325b2064d00a88 Maciej Machnikowski 2021-08-17  157  {
e4291b64e11889 Karol Kolacinski    2024-08-30  158  	const struct ice_ptp_pin_desc *ice_pins = pf->ptp.ice_pin_desc;
e4291b64e11889 Karol Kolacinski    2024-08-30  159  	struct ptp_pin_desc *pins = pf->ptp.pin_desc;
e4291b64e11889 Karol Kolacinski    2024-08-30  160  	unsigned int sma_pins[ICE_SMA_PINS_NUM] = {};
e4291b64e11889 Karol Kolacinski    2024-08-30  161  	int err;
325b2064d00a88 Maciej Machnikowski 2021-08-17  162  	u8 data;
325b2064d00a88 Maciej Machnikowski 2021-08-17  163  
325b2064d00a88 Maciej Machnikowski 2021-08-17  164  	/* Read initial pin state value */
e4291b64e11889 Karol Kolacinski    2024-08-30 @165  	err = ice_read_sma_ctrl(&pf->hw, &data);
325b2064d00a88 Maciej Machnikowski 2021-08-17  166  	if (err)
325b2064d00a88 Maciej Machnikowski 2021-08-17  167  		return err;
325b2064d00a88 Maciej Machnikowski 2021-08-17  168  
e4291b64e11889 Karol Kolacinski    2024-08-30  169  	/* Get SMA/U.FL pins states */
e4291b64e11889 Karol Kolacinski    2024-08-30  170  	for (int i = 0; i < pf->ptp.info.n_pins; i++)
e4291b64e11889 Karol Kolacinski    2024-08-30  171  		if (pins[i].func) {
e4291b64e11889 Karol Kolacinski    2024-08-30  172  			int name_idx = ice_pins[i].name_idx;
e4291b64e11889 Karol Kolacinski    2024-08-30  173  
e4291b64e11889 Karol Kolacinski    2024-08-30  174  			switch (name_idx) {
e4291b64e11889 Karol Kolacinski    2024-08-30  175  			case SMA1:
e4291b64e11889 Karol Kolacinski    2024-08-30  176  			case UFL1:
e4291b64e11889 Karol Kolacinski    2024-08-30  177  			case SMA2:
e4291b64e11889 Karol Kolacinski    2024-08-30  178  			case UFL2:
e4291b64e11889 Karol Kolacinski    2024-08-30  179  				sma_pins[name_idx - 1] = pins[i].func;
325b2064d00a88 Maciej Machnikowski 2021-08-17  180  				break;
e4291b64e11889 Karol Kolacinski    2024-08-30  181  			default:
e4291b64e11889 Karol Kolacinski    2024-08-30  182  				continue;
e4291b64e11889 Karol Kolacinski    2024-08-30  183  			}
325b2064d00a88 Maciej Machnikowski 2021-08-17  184  		}
325b2064d00a88 Maciej Machnikowski 2021-08-17  185  
e4291b64e11889 Karol Kolacinski    2024-08-30  186  	ice_ptp_update_sma_data(pf, sma_pins, &data);
e4291b64e11889 Karol Kolacinski    2024-08-30 @187  	return ice_write_sma_ctrl(&pf->hw, data);
325b2064d00a88 Maciej Machnikowski 2021-08-17  188  }
325b2064d00a88 Maciej Machnikowski 2021-08-17  189  

:::::: The code at line 165 was first introduced by commit
:::::: e4291b64e11889c73fa9c75e74115721758a3fb4 ice: Align E810T GPIO to other products

:::::: TO: Karol Kolacinski <karol.kolacinski@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
