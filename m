Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E573B136E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 01:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748309589; cv=none; b=R9M52tBvq6uQmiXNKa6lEahCDMK/6A8BtZzUi9sQc4BymX7l2AEob+/R0mSypusqYb7WLa2UjeNfbn1mD1OnoDiRv9ynFz9d0w5b56YY7FCi0JPq4SkhtLHegq6QvsETM1Txr4aJXIgjvivvte2bqh0Z7fccMCGeHKdQ0LyJ874=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748309589; c=relaxed/simple;
	bh=Nurl+8GAD7XELe2gLCRmxZGHEttKDApuAeWThiQqFhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OVo3Ca2k8zSkk9b6Go+UH00ve6KEbgrMGVLIJmg5u7G9QuAkda5AjPYz5zRexCj3Vtq9aJYNitu5Ykouco4PsZXfHM7xF7bZAbMHPhbs5tX/EkoCbSwZWBgmoLzqLLREx50KGP+4AE+YhPu8MddFV003lxuS7+4FT8I4lVKZ9Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RE+Qc3Nw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RE+Qc3Nw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748309588; x=1779845588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nurl+8GAD7XELe2gLCRmxZGHEttKDApuAeWThiQqFhY=;
  b=RE+Qc3NwNhmnRVzmm/wQQx1o0ms1Ch9zm0NTgFylweoVmJ7p9haV6C9O
   cqAg8OAr9dX3M6rcAF7stYq46J6rTXDVeRHNA6hQVqYtEIFC73Y2uGkCu
   TKGYaOScssQJV8hZjpOyjjzOfpQIc3alvnfsp9WMmKLDO3L66cbCwRbc8
   j28+ErITWHdDXJdmrsEx67BCyMCInUNnacD+CFG4UeQvkPG8ym4eLXDH9
   aqJ6UsVhtEv7h6DgP9yCoGYqp5X8RlBw0Cmt4HpiZvDbOAFJOzv32tM8X
   K87jbdiGZXgVceyNECx1FoAZHJdPNgGYV+zt9BVGeMIWWeaOaSYYBnj/E
   w==;
X-CSE-ConnectionGUID: Ua0aYAfRTb2gq5yl+CfQwg==
X-CSE-MsgGUID: XO5rx9P7R2qtsFwX0gMAFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60936014"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="60936014"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 18:33:07 -0700
X-CSE-ConnectionGUID: /6D12gCDSka/rtDUyCCiOA==
X-CSE-MsgGUID: aDK0xk95RTCuRR4X5q7m+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="173514801"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 May 2025 18:33:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJjBg-000SnQ-0S;
	Tue, 27 May 2025 01:33:04 +0000
Date: Tue, 27 May 2025 09:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1]
 drivers/scsi/ufs/ufs-mediatek.c:181:5: sparse: sparse: symbol
 'ufs_mtk_wait_link_state' was not declared. Should it be static?
Message-ID: <202505270950.Mfklf6q3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   71d0515397de96c7ff0dd2c6be6e2af7a113e997
commit: 745c7d9dd4c72286ffb21123ea61da4bb36c6a3a [1/1] UPSTREAM: scsi: ufs-mediatek: Do not gate clocks if auto-hibern8 is not entered yet
config: arm64-randconfig-r111-20250527 (https://download.01.org/0day-ci/archive/20250527/202505270950.Mfklf6q3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250527/202505270950.Mfklf6q3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270950.Mfklf6q3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/ufs/ufs-mediatek.c:181:5: sparse: sparse: symbol 'ufs_mtk_wait_link_state' was not declared. Should it be static?

vim +/ufs_mtk_wait_link_state +181 drivers/scsi/ufs/ufs-mediatek.c

   180	
 > 181	int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
   182				    unsigned long max_wait_ms)
   183	{
   184		ktime_t timeout, time_checked;
   185		u32 val;
   186	
   187		timeout = ktime_add_us(ktime_get(), ms_to_ktime(max_wait_ms));
   188		do {
   189			time_checked = ktime_get();
   190			ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
   191			val = ufshcd_readl(hba, REG_UFS_PROBE);
   192			val = val >> 28;
   193	
   194			if (val == state)
   195				return 0;
   196	
   197			/* Sleep for max. 200us */
   198			usleep_range(100, 200);
   199		} while (ktime_before(time_checked, timeout));
   200	
   201		if (val == state)
   202			return 0;
   203	
   204		return -ETIMEDOUT;
   205	}
   206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
