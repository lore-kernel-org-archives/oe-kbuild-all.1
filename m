Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545A04315D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732712144; cv=none; b=XfGdICfchVlIQzTtnM6zchckvSaIWxQMGxNezzoRDG9raXv5MH02HAj/bPO2EV/tmRXU5ynystaO3kAqtUCFfrL4234yXMKr+WNtcbe2n9ZSL7bBzKlDypn95jHf64AEmEIq5EsG7Wt6MofX2Ik5i/8gLdz762/1zebPXNuyer8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732712144; c=relaxed/simple;
	bh=NPpV7C7mz/q4nuDWDIOSRAVevBP555FxWHsMM6gf5Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y0vGx+GYqhOx/trpldjc3FdBurGrmNM5zzJ3zavC1v3TFawvBcGkQ2IlackMcjH3WyrOgGkUNdlAKUhYDygZ7fIy7g+mv0MzFVWYNvExYj9t68QST3CgtwRSKVE3M8ApDM5UMwakXLi8x0BJIJpXyjkeEuEqQHeINnjvomyFxs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R204Mjcv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R204Mjcv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732712141; x=1764248141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NPpV7C7mz/q4nuDWDIOSRAVevBP555FxWHsMM6gf5Ew=;
  b=R204Mjcvpfw5Y6wUmx8ES2o/L3tn6TYwROrpkpCkRRfEz2AQYT/UHTh2
   o/N6JczV5Y8rHxECxvRSXyFoSrsH9RocTLZHXQMVhNFBsRHHHoKEB153u
   JkdBZ4tTpqzcsf15NP2b2uJMGupPm6equuKBrV1G7LHqZ4PhkOBtMXlx5
   41uc4WtpZpyYF25rucyRKWGTMPtbTJt6KS0R4LbdOA2T0ewatDp01khMl
   9h5y05S1PRxHUoqKeO+naD9kGHgl9VtrWiAi4q2m5rl+qni3YJZ0L1pBS
   K8qc1xvPgN73zuBgM3ygwxfFJaNi6HdgZQz8kxFvLhBOyVP5nM9wH9K4L
   w==;
X-CSE-ConnectionGUID: 6b36ZRWuQfuVC/e+8tIgzA==
X-CSE-MsgGUID: QVbWwmInT1+h30mQ++rgZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44302676"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="44302676"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 04:55:41 -0800
X-CSE-ConnectionGUID: Up9fXCasTcaY9owwRHLOhw==
X-CSE-MsgGUID: 3RfrKlO3R9qytz0MfUmU4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="97009956"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Nov 2024 04:55:39 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGHZx-0007zv-07;
	Wed, 27 Nov 2024 12:55:37 +0000
Date: Wed, 27 Nov 2024 20:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2490/2490] drivers/scsi/sd.c:2200
 sd_spinup_disk() warn: unsigned 'the_result' is never less than zero.
Message-ID: <202411272026.nZlY6xmo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   68b0fb4e955465eef28bed1f5a252c4e6c636a36
commit: be9f642e83e44150c1e0b43e6abf884d07d6fe14 [2490/2490] scsi: core: Stop using DRIVER_ERROR
config: x86_64-randconfig-161-20241127 (https://download.01.org/0day-ci/archive/20241127/202411272026.nZlY6xmo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411272026.nZlY6xmo-lkp@intel.com/

New smatch warnings:
drivers/scsi/sd.c:2200 sd_spinup_disk() warn: unsigned 'the_result' is never less than zero.

Old smatch warnings:
drivers/scsi/sd.c:1728 sd_sync_cache() warn: sizeof(NUMBER)?
include/scsi/scsi_device.h:477 scsi_execute_req() warn: sizeof(NUMBER)?
drivers/scsi/sd.c:3616 sd_start_stop_device() warn: sizeof(NUMBER)?

vim +/the_result +2200 drivers/scsi/sd.c

  2154	
  2155	/*
  2156	 * spinup disk - called only in sd_revalidate_disk()
  2157	 */
  2158	static void
  2159	sd_spinup_disk(struct scsi_disk *sdkp)
  2160	{
  2161		unsigned char cmd[10];
  2162		unsigned long spintime_expire = 0;
  2163		int retries, spintime;
  2164		unsigned int the_result;
  2165		struct scsi_sense_hdr sshdr;
  2166		int sense_valid = 0;
  2167	
  2168		spintime = 0;
  2169	
  2170		/* Spin up drives, as required.  Only do this at boot time */
  2171		/* Spinup needs to be done for module loads too. */
  2172		do {
  2173			retries = 0;
  2174	
  2175			do {
  2176				cmd[0] = TEST_UNIT_READY;
  2177				memset((void *) &cmd[1], 0, 9);
  2178	
  2179				the_result = scsi_execute_req(sdkp->device, cmd,
  2180							      DMA_NONE, NULL, 0,
  2181							      &sshdr, SD_TIMEOUT,
  2182							      sdkp->max_retries, NULL);
  2183	
  2184				/*
  2185				 * If the drive has indicated to us that it
  2186				 * doesn't have any media in it, don't bother
  2187				 * with any more polling.
  2188				 */
  2189				if (media_not_present(sdkp, &sshdr))
  2190					return;
  2191	
  2192				if (the_result)
  2193					sense_valid = scsi_sense_valid(&sshdr);
  2194				retries++;
  2195			} while (retries < 3 && 
  2196				 (!scsi_status_is_good(the_result) ||
  2197				  ((driver_byte(the_result) == DRIVER_SENSE) &&
  2198				  sense_valid && sshdr.sense_key == UNIT_ATTENTION)));
  2199	
> 2200			if (the_result < 0 || driver_byte(the_result) != DRIVER_SENSE) {
  2201				/* no sense, TUR either succeeded or failed
  2202				 * with a status error */
  2203				if(!spintime && !scsi_status_is_good(the_result)) {
  2204					sd_print_result(sdkp, "Test Unit Ready failed",
  2205							the_result);
  2206				}
  2207				break;
  2208			}
  2209	
  2210			/*
  2211			 * The device does not want the automatic start to be issued.
  2212			 */
  2213			if (sdkp->device->no_start_on_add)
  2214				break;
  2215	
  2216			if (sense_valid && sshdr.sense_key == NOT_READY) {
  2217				if (sshdr.asc == 4 && sshdr.ascq == 3)
  2218					break;	/* manual intervention required */
  2219				if (sshdr.asc == 4 && sshdr.ascq == 0xb)
  2220					break;	/* standby */
  2221				if (sshdr.asc == 4 && sshdr.ascq == 0xc)
  2222					break;	/* unavailable */
  2223				if (sshdr.asc == 4 && sshdr.ascq == 0x1b)
  2224					break;	/* sanitize in progress */
  2225				/*
  2226				 * Issue command to spin up drive when not ready
  2227				 */
  2228				if (!spintime) {
  2229					sd_printk(KERN_NOTICE, sdkp, "Spinning up disk...");
  2230					cmd[0] = START_STOP;
  2231					cmd[1] = 1;	/* Return immediately */
  2232					memset((void *) &cmd[2], 0, 8);
  2233					cmd[4] = 1;	/* Start spin cycle */
  2234					if (sdkp->device->start_stop_pwr_cond)
  2235						cmd[4] |= 1 << 4;
  2236					scsi_execute_req(sdkp->device, cmd, DMA_NONE,
  2237							 NULL, 0, &sshdr,
  2238							 SD_TIMEOUT, sdkp->max_retries,
  2239							 NULL);
  2240					spintime_expire = jiffies + 100 * HZ;
  2241					spintime = 1;
  2242				}
  2243				/* Wait 1 second for next try */
  2244				msleep(1000);
  2245				printk(KERN_CONT ".");
  2246	
  2247			/*
  2248			 * Wait for USB flash devices with slow firmware.
  2249			 * Yes, this sense key/ASC combination shouldn't
  2250			 * occur here.  It's characteristic of these devices.
  2251			 */
  2252			} else if (sense_valid &&
  2253					sshdr.sense_key == UNIT_ATTENTION &&
  2254					sshdr.asc == 0x28) {
  2255				if (!spintime) {
  2256					spintime_expire = jiffies + 5 * HZ;
  2257					spintime = 1;
  2258				}
  2259				/* Wait 1 second for next try */
  2260				msleep(1000);
  2261			} else {
  2262				/* we don't understand the sense code, so it's
  2263				 * probably pointless to loop */
  2264				if(!spintime) {
  2265					sd_printk(KERN_NOTICE, sdkp, "Unit Not Ready\n");
  2266					sd_print_sense_hdr(sdkp, &sshdr);
  2267				}
  2268				break;
  2269			}
  2270					
  2271		} while (spintime && time_before_eq(jiffies, spintime_expire));
  2272	
  2273		if (spintime) {
  2274			if (scsi_status_is_good(the_result))
  2275				printk(KERN_CONT "ready\n");
  2276			else
  2277				printk(KERN_CONT "not responding...\n");
  2278		}
  2279	}
  2280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
