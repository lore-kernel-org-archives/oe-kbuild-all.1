Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54C730F927
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534443; cv=none; b=PxYkd3UQSWWJVFa92ta2KSwmEUNdYI+PWYVbOXOEbY6+cUbLs+NZtt5TbwlpJIWWNYcH+byoUaW5aBzfefZ2PupUWLfx1tgTY2WFadDNITutrGuroVK5pqzLCoMhvg/d15PyQnxab5gX7zKyiuOkkj/1SdmGiPMsxbq9UXvds64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534443; c=relaxed/simple;
	bh=+XzJ0qKb6gzVdeSp5Vc0D3n1e6yFmprh6ANefUYsxXs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S0NT9IyKGfYqT/691a4nLzmmqKtS2gEKIol3k3Dz/bqojO3aPobRZ1UrUf/mAOOF5gzRGeZVuEYGQ75D9YJ6lnM8xoG4wHhHM4JkywqHu0GwqrKj0KAWKDYb16xCMTIGBmYFa1h76kSNXyS8k+oEV3RpvvUlDlvRLzrVy1btxNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewRzrEH4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewRzrEH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534441; x=1807070441;
  h=date:from:to:cc:subject:message-id;
  bh=+XzJ0qKb6gzVdeSp5Vc0D3n1e6yFmprh6ANefUYsxXs=;
  b=ewRzrEH4GnN57BIAKGH1vK7mcwKr/lyYcbuvu/tbGu4Nk39qRzIPXcXZ
   7XlUxcsk2TkD1RIWWRSJqo0lLizjXEq/kji5l3IrOeby7e80/bh4dmivQ
   zJsKfv9fEZz6Fzh6/UHvCIWaVF5ksVupjNzsnPXnSC4FLqBbVF7RIZZco
   azGOXnJyY97S+UTejL+9+uD5WckURME+q97YzZxlyE7ehf654HIUOIW/5
   M9kH+b2Bf/3a5vcKBLhxviA1Krc4vGLxnlFrHquWrXbhoaBrSaYTcMyvk
   Hz+WMNY6Hgkz3jlojbK79c9zTWDYr0NAjm1jmbfGdOp/HWOb7QFDqzm0C
   Q==;
X-CSE-ConnectionGUID: ZHvIggcDQVC/MDESr8G1ew==
X-CSE-MsgGUID: y/LQvqzZRuGxnh/gMrlncw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86782260"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86782260"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:00:38 -0700
X-CSE-ConnectionGUID: n4reuoYRTQOQN8o588+iqw==
X-CSE-MsgGUID: knJHYSG2RNiFQKIWY6kfUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225304375"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 21:00:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xc9-0000000007T-2fsj;
	Tue, 07 Apr 2026 04:00:33 +0000
Date: Tue, 07 Apr 2026 12:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ajay Singh <ajay.kathat@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Kalle Valo <kvalo@codeaurora.org>
Subject: drivers/net/wireless/microchip/wilc1000/wlan.c:620:34:
 warning: variable 'to_host_from_fw_bit' set but not used
Message-ID: <202604052006.fns84vWs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ajay,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3aae9383f42f687221c011d7ee87529398e826b3
commit: 5bb9de8bcb18c38ea089a287b77944ef8ee71abd wilc1000: configure registers to handle chip wakeup sequence
date:   4 years, 6 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260405/202604052006.fns84vWs-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604052006.fns84vWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5bb9de8bcb18 ("wilc1000: configure registers to handle chip wakeup sequence")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604052006.fns84vWs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/microchip/wilc1000/wlan.c: In function 'chip_wakeup':
>> drivers/net/wireless/microchip/wilc1000/wlan.c:620:34: warning: variable 'to_host_from_fw_bit' set but not used [-Wunused-but-set-variable]
     620 |         u32 to_host_from_fw_reg, to_host_from_fw_bit;
         |                                  ^~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/microchip/wilc1000/wlan.c:620:13: warning: variable 'to_host_from_fw_reg' set but not used [-Wunused-but-set-variable]
     620 |         u32 to_host_from_fw_reg, to_host_from_fw_bit;
         |             ^~~~~~~~~~~~~~~~~~~


vim +/to_host_from_fw_bit +620 drivers/net/wireless/microchip/wilc1000/wlan.c

   613	
   614	void chip_wakeup(struct wilc *wilc)
   615	{
   616		u32 ret = 0;
   617		u32 clk_status_val = 0, trials = 0;
   618		u32 wakeup_reg, wakeup_bit;
   619		u32 clk_status_reg, clk_status_bit;
 > 620		u32 to_host_from_fw_reg, to_host_from_fw_bit;
   621		u32 from_host_to_fw_reg, from_host_to_fw_bit;
   622		const struct wilc_hif_func *hif_func = wilc->hif_func;
   623	
   624		if (wilc->io_type == WILC_HIF_SDIO) {
   625			wakeup_reg = WILC_SDIO_WAKEUP_REG;
   626			wakeup_bit = WILC_SDIO_WAKEUP_BIT;
   627			clk_status_reg = WILC_SDIO_CLK_STATUS_REG;
   628			clk_status_bit = WILC_SDIO_CLK_STATUS_BIT;
   629			from_host_to_fw_reg = WILC_SDIO_HOST_TO_FW_REG;
   630			from_host_to_fw_bit = WILC_SDIO_HOST_TO_FW_BIT;
   631			to_host_from_fw_reg = WILC_SDIO_FW_TO_HOST_REG;
   632			to_host_from_fw_bit = WILC_SDIO_FW_TO_HOST_BIT;
   633		} else {
   634			wakeup_reg = WILC_SPI_WAKEUP_REG;
   635			wakeup_bit = WILC_SPI_WAKEUP_BIT;
   636			clk_status_reg = WILC_SPI_CLK_STATUS_REG;
   637			clk_status_bit = WILC_SPI_CLK_STATUS_BIT;
   638			from_host_to_fw_reg = WILC_SPI_HOST_TO_FW_REG;
   639			from_host_to_fw_bit = WILC_SPI_HOST_TO_FW_BIT;
   640			to_host_from_fw_reg = WILC_SPI_FW_TO_HOST_REG;
   641			to_host_from_fw_bit = WILC_SPI_FW_TO_HOST_BIT;
   642		}
   643	
   644		/* indicate host wakeup */
   645		ret = hif_func->hif_write_reg(wilc, from_host_to_fw_reg,
   646					      from_host_to_fw_bit);
   647		if (ret)
   648			return;
   649	
   650		/* Set wake-up bit */
   651		ret = hif_func->hif_write_reg(wilc, wakeup_reg,
   652					      wakeup_bit);
   653		if (ret)
   654			return;
   655	
   656		while (trials < WAKE_UP_TRIAL_RETRY) {
   657			ret = hif_func->hif_read_reg(wilc, clk_status_reg,
   658						     &clk_status_val);
   659			if (ret) {
   660				pr_err("Bus error %d %x\n", ret, clk_status_val);
   661				return;
   662			}
   663			if (clk_status_val & clk_status_bit)
   664				break;
   665	
   666			trials++;
   667		}
   668		if (trials >= WAKE_UP_TRIAL_RETRY) {
   669			pr_err("Failed to wake-up the chip\n");
   670			return;
   671		}
   672	}
   673	EXPORT_SYMBOL_GPL(chip_wakeup);
   674	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
