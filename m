Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A133A4F59
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985024; cv=none; b=s/Mv7gnjF5rK5MiRStj0AoXU/NB0TxGFGR36sPSt1AFprkL7VzIt2wud6cJTvY3+DoU6JWTRKqbx+f58mniH/eLbGnSHgR8g8Z8yrC8aOMHho1uCmqM8/XRrJWojZRs+vkNv6ZcGSKy0Icpwns9wixN9BUvUZpf9n/AlTmIW2Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985024; c=relaxed/simple;
	bh=QUb4zdcbnKdbUFsN1KSwS9s4a9zrwgDS0pCOVhg65QE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bceZDFm/Rx/kIIiQQULTHB+zFWuoZb4IWCTcNN2499G3b9mR1iniVlJ5kIaH8+zQdHzRDWRcPzzgbfSJV07ab/NF7g+5baoQHhubutvdyPp7Iz//prH6nOKWmNA6fLpvsdMfxCzIyPDC3WN7feNctHT8fYTNVE6S/sMnZbqBzJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlhJbAwr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlhJbAwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774985023; x=1806521023;
  h=date:from:to:cc:subject:message-id;
  bh=QUb4zdcbnKdbUFsN1KSwS9s4a9zrwgDS0pCOVhg65QE=;
  b=SlhJbAwryyO0WD2SYNWALdfYCmK/qbQD6nTBcQ7RkiAFQxTRvhNYmV5E
   u+1m2lNyZKRlryoLA75D2JVtZnNgN5pz1or2Pe6a1SqsVf6XtBp+pq03v
   3k2vcCf9l6Z0zG5HLjQnv6gJ0YFv/dJSjquH2V1KhAAwxeJUhi5dqkQC+
   td4pMZjhxLNsQ7iaeYcihMYfmNolVUYHU8j5jglmUg3fTmGPSIFJd2O9K
   RQD3QukJ7eStOGDHaqpjw/MQtnmy534XMETOqGlFXdu9WBJqI8OUPm8hY
   EMPd0BkW4b8A4DLbLb3KIlYIC5dlcV/v1aiiwh8u58sBmpZMZUMF/pi2Z
   g==;
X-CSE-ConnectionGUID: 3l2e2YcwS8yGk4P9hg91Lw==
X-CSE-MsgGUID: u2WK6U3gThaZFW8mTmrJ9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86709923"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="86709923"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 12:23:41 -0700
X-CSE-ConnectionGUID: mpbMOzEgRmmUOg3yLYQ7Aw==
X-CSE-MsgGUID: Uo5ErWZzSkK7uBN/AXEUkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="256956597"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Mar 2026 12:23:39 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ega-000000004BN-1k6x;
	Tue, 31 Mar 2026 19:23:36 +0000
Date: Wed, 01 Apr 2026 03:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-06 1/1]
 drivers/ufs/core/ufs-sysfs.c:1681:25: warning: implicit conversion from 'enum
 <anonymous>' to 'enum attr_idn'
Message-ID: <202604010316.Nf6nb390-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Huan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-06
head:   26ae9ae6e7c2e2b8b52611a7bbdd9b29000c2a58
commit: 3ecfed22c73220e24410b3547262a6c8eca76e1c [1/1] BACKPORT: FROMGIT: scsi: ufs: core: Add HID support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260401/202604010316.Nf6nb390-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010316.Nf6nb390-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010316.Nf6nb390-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ufs/core/ufs-sysfs.c: In function 'analysis_trigger_store':
>> drivers/ufs/core/ufs-sysfs.c:1681:25: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1681 |                         QUERY_ATTR_IDN_HID_DEFRAG_OPERATION, &mode);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c: In function 'defrag_trigger_store':
   drivers/ufs/core/ufs-sysfs.c:1703:25: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1703 |                         QUERY_ATTR_IDN_HID_DEFRAG_OPERATION, &mode);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c: In function 'fragmented_size_show':
   drivers/ufs/core/ufs-sysfs.c:1718:25: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1718 |                         QUERY_ATTR_IDN_HID_AVAILABLE_SIZE, &value);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c: In function 'defrag_size_show':
   drivers/ufs/core/ufs-sysfs.c:1735:25: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1735 |                         QUERY_ATTR_IDN_HID_SIZE, &value);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c: In function 'defrag_size_store':
   drivers/ufs/core/ufs-sysfs.c:1753:25: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1753 |                         QUERY_ATTR_IDN_HID_SIZE, &value);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c: In function 'progress_ratio_show':
   drivers/ufs/core/ufs-sysfs.c:1768:25: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1768 |                         QUERY_ATTR_IDN_HID_PROGRESS_RATIO, &value);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c: In function 'state_show':
   drivers/ufs/core/ufs-sysfs.c:1785:25: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1785 |                         QUERY_ATTR_IDN_HID_STATE, &value);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +1681 drivers/ufs/core/ufs-sysfs.c

  1665	
  1666	static ssize_t analysis_trigger_store(struct device *dev,
  1667			struct device_attribute *attr, const char *buf, size_t count)
  1668	{
  1669		struct ufs_hba *hba = dev_get_drvdata(dev);
  1670		int mode;
  1671		int ret;
  1672	
  1673		if (sysfs_streq(buf, "enable"))
  1674			mode = HID_ANALYSIS_ENABLE;
  1675		else if (sysfs_streq(buf, "disable"))
  1676			mode = HID_ANALYSIS_AND_DEFRAG_DISABLE;
  1677		else
  1678			return -EINVAL;
  1679	
  1680		ret = hid_query_attr(hba, UPIU_QUERY_OPCODE_WRITE_ATTR,
> 1681				QUERY_ATTR_IDN_HID_DEFRAG_OPERATION, &mode);
  1682	
  1683		return ret < 0 ? ret : count;
  1684	}
  1685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
