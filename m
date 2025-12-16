Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FD32D7386
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 23:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765928542; cv=none; b=JTohw3B5MeKhETA/eC9Na4KeFtWAYc/5q+DTutNnvTyj12h3hGeUWSvCxE+tFbVcqQR/sI9GR+XKJRymLkV+1Q82KYv7LDXMjJNiOm/xZekg+lI4bF/H47t+rYFGkDiBRkCID5qQ6e5kUAnnETcLxB6uXWC/BZTfUvQKjhkpto0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765928542; c=relaxed/simple;
	bh=5kZ4B8nafW+PNdosC3NG251gEXe350POl/7VKeLs4i0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PPj3vyTjhFjHYHVm8eEOal5RfH4IZNyfnBOB6Mp5ZR3clr3AXlAVXCL+qAoJOdWUClMojHFxYkF1GGoTahAINs/FJ5CV+okdeP9uIKadW8EPfj4h6L/1NDB2ly+FpL5EwDkQfK6aetuFMTZueaBndgul0fcLgtLZiBDN3ehKt2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2X2//Wc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2X2//Wc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765928540; x=1797464540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5kZ4B8nafW+PNdosC3NG251gEXe350POl/7VKeLs4i0=;
  b=n2X2//WcYnt4/2U6z27IfeW4iJJgdGh1VxprcayEJKRCgL+KK/R9L+uM
   M4dnQs1QKqtJlOEFwh5bBjR04mKvkdwf9iNawVYdN+3TPdX5IC/OCf6lt
   6tEqZsUYECZQH5VTHWZ5YijnfJF9z1/U7UU3Y9FxViyFVyAZueKNE7k8p
   TIUkbAgeuQOG++GAqv8kPKKDXEFdQxLXqiabPSu+GZEiX1em52I3xaAR0
   odP2taFXL/fzyc5hNYEQRhbx5uKM+VW/KxAKqGJoef9kw0OzosPVxZaVR
   gqWYIadHQzbXPX17+I6kHD/GcNKgCOsXohISG3MByNDTVfQtnm+I8c9jO
   w==;
X-CSE-ConnectionGUID: qgV/MvGwRUCvixxV7uJ9tw==
X-CSE-MsgGUID: lHz1FGyAR323f78Yrdu5lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78570885"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="78570885"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 15:42:19 -0800
X-CSE-ConnectionGUID: tq/dvsKkSXWo9dmCVhhQ2Q==
X-CSE-MsgGUID: J7yk/sHDSbqRE89ffGemxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="198146486"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 15:42:18 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVegK-000000003wa-0qmY;
	Tue, 16 Dec 2025 23:42:16 +0000
Date: Wed, 17 Dec 2025 07:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-06 2/2]
 drivers/ufs/core/ufs-sysfs.c:1681:25: warning: implicit conversion from
 'enum <anonymous>' to 'enum attr_idn'
Message-ID: <202512170731.QhdzltY6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-06
head:   62ddbebeab5493358fa5ce1a0b54d7cbabeb8ba5
commit: 3ecfed22c73220e24410b3547262a6c8eca76e1c [2/2] BACKPORT: FROMGIT: scsi: ufs: core: Add HID support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20251217/202512170731.QhdzltY6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170731.QhdzltY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170731.QhdzltY6-lkp@intel.com/

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
