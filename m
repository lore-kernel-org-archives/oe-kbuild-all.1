Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7624440A1F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309961; cv=none; b=SyzikloXX8Ci7cuA0rcHWlCGwdacxBttkp8Op6GNsMl/kWr/AILCgbQXYe4d007K3r8s5F9GmsSh83W0xmGbdDWkwlmg9fJ+9Erhu5wSluu09Kgv2ScOh5ISzdDZVQInSbyRQrGdiRcNT5d3jyOnVv7jDD3uWnVu69rAxj/00NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309961; c=relaxed/simple;
	bh=Wa4W/5K9xLtp+USyDia5S6WQe+0dyaCWCh40c2l06CI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ClB0L/hr2i0YWbY+Z9we3yx3moyQvA30UOhqDMtd0m4c14F8CB4fut2sA5cGVWxB2gEWgI4gRQC5H42QmhK6DDHY4NbbUH4piD+NEuiCnOWSqSrdUj3cs+LPHv30G0xNdd1ds2FBvZFrEJkym3+StOwovRyFSP6ZkXq39QuT61w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WsHRcPVy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsHRcPVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309960; x=1823845960;
  h=date:from:to:cc:subject:message-id;
  bh=Wa4W/5K9xLtp+USyDia5S6WQe+0dyaCWCh40c2l06CI=;
  b=WsHRcPVyNm5LeORv0wEbYFvVPFN1MdOh/Ip56TsKixO+d7TutbeOiGXM
   4/wE97vFV75NOUoPgOaIWW162xIsZ6WtvXMRoz67NShuhJufsV70LXyDP
   hP8ROEXaLo8d9da/5csI+BkzNAO8+pQCKo62w4DyJK3A1sMy9xNKpjP1J
   Dw+8cSXGYxAgRpRlC2qweNLqCdlbY1FRetqWIkp5QJokNWEdhEI3ZE2PS
   sHUtFm67GuLc3Me84f+ZHz3tW7FgVwfN/P4/dK/jOq1Q+XkktHIWSA6Lb
   4ddjoAIYle6llsHiR/GX1kE667noosrvs1JnGCAyi7/lXSBVzg3pLAATi
   w==;
X-CSE-ConnectionGUID: OOEUUUsYSZWaDejon1QxGw==
X-CSE-MsgGUID: deV4gYwvQvy/H1jJv72SGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916672"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916672"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:35 -0700
X-CSE-ConnectionGUID: bWlu09z2SSa4QyZWl1oI8A==
X-CSE-MsgGUID: YDIfnajwRruqdeQqccMTig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340776"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:33 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh1-000000004v5-1nWK;
	Sun, 18 Oct 2026 07:52:31 +0000
Date: Sun, 18 Oct 2026 09:46:03 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 drivers/scsi/smartpqi/smartpqi_init.c:5993 pqi_is_parity_write_stream() warn:
 inconsistent indenting
Message-ID: <202610170645.8YJdwPM7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   a42b417921ddca2df90dc3d8cb746eda8cdb6d63
commit: 6589bc3699bcb45b35b3095c44a5af7a4d75ef7e [1/1] scsi: smartpqi: Fix smp_processor_id() call trace for preemptible kernels
config: i386-randconfig-2200-20261016 (https://download.01.org/0day-ci/archive/20261017/202610170645.8YJdwPM7-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610170645.8YJdwPM7-lkp@intel.com/

New smatch warnings:
drivers/scsi/smartpqi/smartpqi_init.c:5993 pqi_is_parity_write_stream() warn: inconsistent indenting

Old smatch warnings:
drivers/scsi/smartpqi/smartpqi_init.c:1489 pqi_get_raid_map() warn: missing unwind goto?

vim +5993 drivers/scsi/smartpqi/smartpqi_init.c

  5941	
  5942	static bool pqi_is_parity_write_stream(struct pqi_ctrl_info *ctrl_info,
  5943		struct scsi_cmnd *scmd)
  5944	{
  5945		u32 oldest_jiffies;
  5946		u8 lru_index;
  5947		int i;
  5948		int rc;
  5949		struct pqi_scsi_dev *device;
  5950		struct pqi_stream_data *pqi_stream_data;
  5951		struct pqi_scsi_dev_raid_map_data rmd = { 0 };
  5952	
  5953		if (!ctrl_info->enable_stream_detection)
  5954			return false;
  5955	
  5956		rc = pqi_get_aio_lba_and_block_count(scmd, &rmd);
  5957		if (rc)
  5958			return false;
  5959	
  5960		/* Check writes only. */
  5961		if (!rmd.is_write)
  5962			return false;
  5963	
  5964		device = scmd->device->hostdata;
  5965	
  5966		/* Check for RAID 5/6 streams. */
  5967		if (device->raid_level != SA_RAID_5 && device->raid_level != SA_RAID_6)
  5968			return false;
  5969	
  5970		/*
  5971		 * If controller does not support AIO RAID{5,6} writes, need to send
  5972		 * requests down non-AIO path.
  5973		 */
  5974		if ((device->raid_level == SA_RAID_5 && !ctrl_info->enable_r5_writes) ||
  5975			(device->raid_level == SA_RAID_6 && !ctrl_info->enable_r6_writes))
  5976			return true;
  5977	
  5978		lru_index = 0;
  5979		oldest_jiffies = INT_MAX;
  5980		for (i = 0; i < NUM_STREAMS_PER_LUN; i++) {
  5981			pqi_stream_data = &device->stream_data[i];
  5982			/*
  5983			 * Check for adjacent request or request is within
  5984			 * the previous request.
  5985			 */
  5986			if ((pqi_stream_data->next_lba &&
  5987				rmd.first_block >= pqi_stream_data->next_lba) &&
  5988				rmd.first_block <= pqi_stream_data->next_lba +
  5989					rmd.block_cnt) {
  5990				pqi_stream_data->next_lba = rmd.first_block +
  5991					rmd.block_cnt;
  5992				pqi_stream_data->last_accessed = jiffies;
> 5993					per_cpu_ptr(device->raid_io_stats, raw_smp_processor_id())->write_stream_cnt++;
  5994				return true;
  5995			}
  5996	
  5997			/* unused entry */
  5998			if (pqi_stream_data->last_accessed == 0) {
  5999				lru_index = i;
  6000				break;
  6001			}
  6002	
  6003			/* Find entry with oldest last accessed time. */
  6004			if (pqi_stream_data->last_accessed <= oldest_jiffies) {
  6005				oldest_jiffies = pqi_stream_data->last_accessed;
  6006				lru_index = i;
  6007			}
  6008		}
  6009	
  6010		/* Set LRU entry. */
  6011		pqi_stream_data = &device->stream_data[lru_index];
  6012		pqi_stream_data->last_accessed = jiffies;
  6013		pqi_stream_data->next_lba = rmd.first_block + rmd.block_cnt;
  6014	
  6015		return false;
  6016	}
  6017	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
