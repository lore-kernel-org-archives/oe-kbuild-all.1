Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DE9349CE0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 18:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779559545; cv=none; b=WUPGSxt3skLCKdg3WNJMaOVnuqHWfogk5ZDF3tJCuZiP/n6AOBZPJQdIbFXy4irvF53DKG4MqDbX4PrazUlKp0UIQqzJtkNr/EKTCRLld8ahm0sUnsREjw3vwl8mzbsrDphY91wsAblONQA/PyyapzHpjAWVrQTM2KMNakU5sDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779559545; c=relaxed/simple;
	bh=l1VJ8FC1dlupbeV2CYL45AoVWH8uyJav4GP6tmYIXB4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s7rk36uCsf0a72Txge7DfyNFXJbTOYBEQF3nlh6RNacN6fwqT4CcYE1jriHAiZDl3NkOlng0aZeIJ8lbXvPhjwjyOxjNMTnG2+HUEvsmJedDaQK1Z7zlMG3xGKrD22Q+QerOI/227DQanmdZ/+JmnGnzLgJUdePGkIHd2VE+Rvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKe1vsTC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKe1vsTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779559543; x=1811095543;
  h=date:from:to:cc:subject:message-id;
  bh=l1VJ8FC1dlupbeV2CYL45AoVWH8uyJav4GP6tmYIXB4=;
  b=YKe1vsTCm779EzHri6th5eLXMM0zQU7R1x81RgdWoRIMlNBWDscyXm7l
   ScgxpIFmk+y/P1zQlZWWnFaVJKA8IikEdZPhrf/n4nZdWMvrmkNeJyxCV
   KUQ6A2g4Sxg6fThKfIT96IKsEjmSq5JlIbxLF7M90BTGriluZdUVPSrQZ
   7x07th2kRWCF8e/XDUD1WPiP8oEhaagQbenjwrhXaJLBGH3z0F/EjYgLy
   1p3lY7rmwvW6egTC9uMhU4MVuiBJqeg2Rtfbqky2/NwDx0nbYechQ6Ezf
   nL8Sz8lLY7fyIzrqOEO4dHxdsA3cD1ND/ARsJ3iD4D1BwWW2cIgvderfL
   A==;
X-CSE-ConnectionGUID: si9R5zgYRei5avzQP5vk9Q==
X-CSE-MsgGUID: hNelPqpDQr2LVf1yAJ/R0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="67978158"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="67978158"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 11:05:42 -0700
X-CSE-ConnectionGUID: ddeiFmP/TR6NHgx1wQcpAw==
X-CSE-MsgGUID: Ten7xoIbRYOdwHGlL2waFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="240363285"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 May 2026 11:05:40 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQqjB-000000000FF-20Re;
	Sat, 23 May 2026 18:05:37 +0000
Date: Sun, 24 May 2026 02:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>
Subject: [linux-next:master 3990/8157]
 drivers/mmc/host/sdhci-of-k1.c:340 spacemit_sdhci_execute_tuning() warn:
 always true condition '(retry_delays[i] <= 255) => (0-255 <= 255)'
Message-ID: <202605240231.8uYoNxEg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c1ecb239fa3456529a32255359fc78b69eb9d847
commit: e9cb83c10071808aa7db4582e007a650aa6aa183 [3990/8157] mmc: sdhci-of-k1: add comprehensive SDR tuning support
config: riscv-randconfig-r071-20260522 (https://download.01.org/0day-ci/archive/20260524/202605240231.8uYoNxEg-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240231.8uYoNxEg-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-of-k1.c:340 spacemit_sdhci_execute_tuning() warn: always true condition '(retry_delays[i] <= 255) => (0-255 <= 255)'

vim +340 drivers/mmc/host/sdhci-of-k1.c

   259	
   260	static int spacemit_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
   261	{
   262		int current_len = 0, current_start = 0;
   263		int max_pass_len = 0, max_pass_start = 0;
   264		struct mmc_host *mmc = host->mmc;
   265		struct mmc_ios ios = mmc->ios;
   266		u8 final_delay;
   267		int ret = 0;
   268		int i;
   269	
   270		/*
   271		 * Tuning is required for SDR50/SDR104, HS200/HS400 cards and
   272		 * if clock frequency is greater than 100MHz in these modes.
   273		 */
   274		if (host->clock < 100 * 1000 * 1000 ||
   275		    !(ios.timing == MMC_TIMING_MMC_HS200 ||
   276		      ios.timing == MMC_TIMING_UHS_SDR50 ||
   277		      ios.timing == MMC_TIMING_UHS_SDR104))
   278			return 0;
   279	
   280		if (mmc->caps2 & MMC_CAP2_NO_MMC) {
   281			spacemit_sdhci_set_tx_dline_reg(host, SPACEMIT_TX_TUNING_DLINE_REG);
   282			spacemit_sdhci_set_tx_delay(host, SPACEMIT_TX_TUNING_DELAYCODE);
   283			spacemit_sdhci_tx_tuning_prepare(host);
   284	
   285			dev_dbg(mmc_dev(host->mmc), "TX tuning: dline_reg=%d, delaycode=%d\n",
   286				SPACEMIT_TX_TUNING_DLINE_REG, SPACEMIT_TX_TUNING_DELAYCODE);
   287		}
   288	
   289		spacemit_sdhci_prepare_tuning(host);
   290	
   291		for (i = SPACEMIT_RX_TUNE_DELAY_MIN; i <= SPACEMIT_RX_TUNE_DELAY_MAX; i++) {
   292			spacemit_sdhci_set_rx_delay(host, i);
   293			ret = mmc_send_tuning(host->mmc, opcode, NULL);
   294	
   295			dev_dbg(mmc_dev(host->mmc), "RX delay %d: %s\n",
   296				i, ret == 0 ? "pass" : "fail");
   297	
   298			if (ret == 0) {
   299				/* Test passed - extend current window */
   300				if (current_len == 0)
   301					current_start = i;
   302				current_len++;
   303			} else {
   304				/* Test failed - check if current window is best so far */
   305				if (current_len > max_pass_len) {
   306					max_pass_len = current_len;
   307					max_pass_start = current_start;
   308				}
   309				current_len = 0;
   310			}
   311		}
   312	
   313		if (current_len > max_pass_len) {
   314			max_pass_len = current_len;
   315			max_pass_start = current_start;
   316		}
   317	
   318		if (max_pass_len < 3) {
   319			dev_err(mmc_dev(host->mmc), "Tuning failed: no stable window found\n");
   320			return -EIO;
   321		}
   322	
   323		final_delay = max_pass_start + max_pass_len / 2;
   324		spacemit_sdhci_set_rx_delay(host, final_delay);
   325		ret = mmc_send_tuning(host->mmc, opcode, NULL);
   326		if (ret) {
   327			u8 retry_delays[] = {
   328				max_pass_start + max_pass_len / 4,
   329				max_pass_start + (3 * max_pass_len) / 4,
   330				max_pass_start,
   331				max_pass_start + max_pass_len - 1
   332			};
   333			int retry_count = ARRAY_SIZE(retry_delays);
   334	
   335			dev_warn(mmc_dev(mmc), "Primary delay %d failed, trying alternatives\n",
   336				 final_delay);
   337	
   338			for (i = 0; i < retry_count; i++) {
   339				if (retry_delays[i] >= SPACEMIT_RX_TUNE_DELAY_MIN &&
 > 340				    retry_delays[i] <= SPACEMIT_RX_TUNE_DELAY_MAX) {
   341					spacemit_sdhci_set_rx_delay(host, retry_delays[i]);
   342					ret = mmc_send_tuning(host->mmc, opcode, NULL);
   343					if (!ret) {
   344						final_delay = retry_delays[i];
   345						dev_info(mmc_dev(mmc), "Retry successful with delay %d\n",
   346							 final_delay);
   347						break;
   348					}
   349				}
   350			}
   351	
   352			if (ret) {
   353				dev_err(mmc_dev(mmc), "All retry attempts failed\n");
   354				return -EIO;
   355			}
   356		}
   357	
   358		dev_dbg(mmc_dev(host->mmc),
   359			"Tuning successful: window %d-%d, using delay %d\n",
   360			max_pass_start, max_pass_start + max_pass_len - 1, final_delay);
   361	
   362		return 0;
   363	}
   364	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
