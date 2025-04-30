Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9156C1EA7D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 07:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996431; cv=none; b=KmjIPGoP3eA1PIYx+tuzZCEjRF+e1DgRR48dpJsHTTACZNOY5R4WO3UWkqkaIv0o6fOVnLDNF+1QVC5Py9NGSl3bdoWq3EOGjvJxYoj3met+WqL1BNsmluBag5EEdk2jAwUxSnlMRpGT5TpUeBGpcyP1H/DIDyCCYKQBsIEI510=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996431; c=relaxed/simple;
	bh=lDAAElVeL2HhDUsJldD/M1a2L52b3OMjWfhYBYEOOOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XrQa8AiK4NgzreZ3e1zBAn/mLlBHQDtfKX6NhxxV/2pDCmip2En70uUSzdbP5+Lzkl6G+s9cvCtJr21GXzW8hG61lT02/olRn8MzZtKMlYa19PGzUYCnl9aQSflfc7XOzx/Q6A1VUV0ZYKs0YrXSG18vMW98rhmBo5K5gfEKFs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnyT5nZi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnyT5nZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745996419; x=1777532419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lDAAElVeL2HhDUsJldD/M1a2L52b3OMjWfhYBYEOOOk=;
  b=bnyT5nZirvlQpLiEyGSbwXZQ/dSjdepxKBk6q7L4V0Bj+TmH8oOe4UFx
   c3LHr9gCtJbUt6R9lrv58e5Dg6cP6aKs0w6hHqvJPaW5bCDM4lOxG2kiy
   N48iWjtNdMxtPV43XCrcwbQleP0u5awTqdwZuEI0Bv6PZYh+6AP9YEFRb
   Lm42402JnALWehFa+vlJckUXl96bxSTLxfya1g/GwuUd01RfTLDIQN9Di
   DqUemrwu5Sx2JJ5UFc0gkNM4msamNkStbDZNetDX+bRMrQba/j6hWx8HE
   h1v5zpaiTctmndVGlhe+ZgZKVtYzmmtv3wSqI+b+9RDBemFlIw/Y85nCh
   g==;
X-CSE-ConnectionGUID: +OqXad6GTHOx3++FM/cHEA==
X-CSE-MsgGUID: fdp8P4YiQbKKL35VpGRmGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58633224"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="58633224"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 00:00:18 -0700
X-CSE-ConnectionGUID: kTmG0IYhTIi+7YvVU3n2VA==
X-CSE-MsgGUID: AyLgbthsR0qxK/swltPhxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="138864310"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Apr 2025 00:00:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA1QT-0003FR-2y;
	Wed, 30 Apr 2025 07:00:13 +0000
Date: Wed, 30 Apr 2025 14:59:57 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Zhang <yi.zhang@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Scott Benesh <scott.benesh@microchip.com>,
	Mike McGowen <mike.mcgowen@microchip.com>,
	Don Brace <don.brace@microchip.com>
Subject: [linux-next:master 7001/7105]
 drivers/scsi/smartpqi/smartpqi_init.c:6006 pqi_is_parity_write_stream()
 warn: inconsistent indenting
Message-ID: <202504301441.uwwh8z88-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d9096722447b77662d4237a09909bde7774f22e
commit: 42d033cf4b517e91c187ad2fbd7b30fdc6d2d62c [7001/7105] scsi: smartpqi: Fix smp_processor_id() call trace for preemptible kernels
config: i386-randconfig-141-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301441.uwwh8z88-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301441.uwwh8z88-lkp@intel.com/

New smatch warnings:
drivers/scsi/smartpqi/smartpqi_init.c:6006 pqi_is_parity_write_stream() warn: inconsistent indenting

Old smatch warnings:
drivers/scsi/smartpqi/smartpqi_init.c:1489 pqi_get_raid_map() warn: missing unwind goto?

vim +6006 drivers/scsi/smartpqi/smartpqi_init.c

  5954	
  5955	static bool pqi_is_parity_write_stream(struct pqi_ctrl_info *ctrl_info,
  5956		struct scsi_cmnd *scmd)
  5957	{
  5958		u32 oldest_jiffies;
  5959		u8 lru_index;
  5960		int i;
  5961		int rc;
  5962		struct pqi_scsi_dev *device;
  5963		struct pqi_stream_data *pqi_stream_data;
  5964		struct pqi_scsi_dev_raid_map_data rmd = { 0 };
  5965	
  5966		if (!ctrl_info->enable_stream_detection)
  5967			return false;
  5968	
  5969		rc = pqi_get_aio_lba_and_block_count(scmd, &rmd);
  5970		if (rc)
  5971			return false;
  5972	
  5973		/* Check writes only. */
  5974		if (!rmd.is_write)
  5975			return false;
  5976	
  5977		device = scmd->device->hostdata;
  5978	
  5979		/* Check for RAID 5/6 streams. */
  5980		if (device->raid_level != SA_RAID_5 && device->raid_level != SA_RAID_6)
  5981			return false;
  5982	
  5983		/*
  5984		 * If controller does not support AIO RAID{5,6} writes, need to send
  5985		 * requests down non-AIO path.
  5986		 */
  5987		if ((device->raid_level == SA_RAID_5 && !ctrl_info->enable_r5_writes) ||
  5988			(device->raid_level == SA_RAID_6 && !ctrl_info->enable_r6_writes))
  5989			return true;
  5990	
  5991		lru_index = 0;
  5992		oldest_jiffies = INT_MAX;
  5993		for (i = 0; i < NUM_STREAMS_PER_LUN; i++) {
  5994			pqi_stream_data = &device->stream_data[i];
  5995			/*
  5996			 * Check for adjacent request or request is within
  5997			 * the previous request.
  5998			 */
  5999			if ((pqi_stream_data->next_lba &&
  6000				rmd.first_block >= pqi_stream_data->next_lba) &&
  6001				rmd.first_block <= pqi_stream_data->next_lba +
  6002					rmd.block_cnt) {
  6003				pqi_stream_data->next_lba = rmd.first_block +
  6004					rmd.block_cnt;
  6005				pqi_stream_data->last_accessed = jiffies;
> 6006					per_cpu_ptr(device->raid_io_stats, raw_smp_processor_id())->write_stream_cnt++;
  6007				return true;
  6008			}
  6009	
  6010			/* unused entry */
  6011			if (pqi_stream_data->last_accessed == 0) {
  6012				lru_index = i;
  6013				break;
  6014			}
  6015	
  6016			/* Find entry with oldest last accessed time. */
  6017			if (pqi_stream_data->last_accessed <= oldest_jiffies) {
  6018				oldest_jiffies = pqi_stream_data->last_accessed;
  6019				lru_index = i;
  6020			}
  6021		}
  6022	
  6023		/* Set LRU entry. */
  6024		pqi_stream_data = &device->stream_data[lru_index];
  6025		pqi_stream_data->last_accessed = jiffies;
  6026		pqi_stream_data->next_lba = rmd.first_block + rmd.block_cnt;
  6027	
  6028		return false;
  6029	}
  6030	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
