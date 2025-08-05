Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9090E2AD00
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 17:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754416563; cv=none; b=i0iQ8SWhXxfGrFNbr1p+ObNpcdAMPGC9bob3LzkYu26Phu1L6OdkvZT5uIe3oJ2Sj4j+8dRP7mTjWwL9jDgdHGaVWvJJbcGWh4VXw1Vu2ad+cGiPVtLTlp+128NZOggMdxzttpcvksNDaOf/XN8Y9sFjUDzU7/zEKlBKY0aCqh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754416563; c=relaxed/simple;
	bh=694zSOCH/BnikZotD6/dL3Z4zyWjIaIbC3n/Qls+UdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iP0HCwU2NdUkqkDySNUAko1VmLE4ASILh2TzZbv2nmZjjO9iOsW4OcLkIH6pbMcaUH4fi3mYLP4nKJqZzBn//x1Wg9DDvUCbRdTdggEuBnRPUtAV/Md5vkDUQpVDN9VEI5rWuxpuaPgXWgZ+2+elwarM11YjHn9pu03fey4pBsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DoQ84P+8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DoQ84P+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754416560; x=1785952560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=694zSOCH/BnikZotD6/dL3Z4zyWjIaIbC3n/Qls+UdM=;
  b=DoQ84P+8YwS7ys+AJoZiQDGVUKERzYLfxxpLJ4lBi3+qT+OVDluxmUpr
   50A4ODmmDzm1rOFaRkZ0R91SLTdoZiKKqHC7lYdvprj9os9Q3PyYFzRBD
   FP/p+Lf1P4xPENPF5nt3R68vx1turjaPWYqScJ1Ge427yZPXZ9VR4SLSu
   mAPGan++F9gbNvObMv33vZQVD0CAOwpjQ727e2FW0s0vzXEKdo7Zl2XnQ
   tTi3ghUqhAncT1s4pcQIYBfZguG7b18Uar599mMWwVYufLSpa9qW9hFew
   PMKj8cw8/VU7gguCOVYfbuPrt16U6w2L40y3w1cvWc6xYFOghoSJtCZP6
   w==;
X-CSE-ConnectionGUID: pXy5kLmkRG+cem3BumjSEA==
X-CSE-MsgGUID: NvGCkOQhRnKBipOBDnL6Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56638027"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56638027"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 10:55:59 -0700
X-CSE-ConnectionGUID: NVXG4XtnTUuIHshhrnWV8Q==
X-CSE-MsgGUID: OMWHGJykT1WIqFhyqaSvcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164920486"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Aug 2025 10:55:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujLtE-0000ja-2i;
	Tue, 05 Aug 2025 17:55:56 +0000
Date: Wed, 6 Aug 2025 01:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/ufs/core/ufs-sysfs.c:1681:4: warning: implicit conversion from 'enum
 <anonymous>' to 'enum attr_idn'
Message-ID: <202508060152.uc2uevtf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ba125a42ce6eb0ed447f9939fef5b04385ec42b5
commit: ba125a42ce6eb0ed447f9939fef5b04385ec42b5 [1/1] BACKPORT: FROMGIT: scsi: ufs: core: Add HID support
config: arm-randconfig-001-20250806 (https://download.01.org/0day-ci/archive/20250806/202508060152.uc2uevtf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060152.uc2uevtf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060152.uc2uevtf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ufs/core/ufs-sysfs.c: In function 'analysis_trigger_store':
>> drivers/ufs/core/ufs-sysfs.c:1681:4: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1681 |    QUERY_ATTR_IDN_HID_DEFRAG_OPERATION, &mode);
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c: In function 'defrag_trigger_store':
   drivers/ufs/core/ufs-sysfs.c:1703:4: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1703 |    QUERY_ATTR_IDN_HID_DEFRAG_OPERATION, &mode);
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c: In function 'fragmented_size_show':
   drivers/ufs/core/ufs-sysfs.c:1718:4: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1718 |    QUERY_ATTR_IDN_HID_AVAILABLE_SIZE, &value);
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c: In function 'defrag_size_show':
   drivers/ufs/core/ufs-sysfs.c:1735:4: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1735 |    QUERY_ATTR_IDN_HID_SIZE, &value);
         |    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c: In function 'defrag_size_store':
   drivers/ufs/core/ufs-sysfs.c:1753:4: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1753 |    QUERY_ATTR_IDN_HID_SIZE, &value);
         |    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c: In function 'progress_ratio_show':
   drivers/ufs/core/ufs-sysfs.c:1768:4: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1768 |    QUERY_ATTR_IDN_HID_PROGRESS_RATIO, &value);
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufs-sysfs.c: In function 'state_show':
   drivers/ufs/core/ufs-sysfs.c:1785:4: warning: implicit conversion from 'enum <anonymous>' to 'enum attr_idn' [-Wenum-conversion]
    1785 |    QUERY_ATTR_IDN_HID_STATE, &value);
         |    ^~~~~~~~~~~~~~~~~~~~~~~~


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
