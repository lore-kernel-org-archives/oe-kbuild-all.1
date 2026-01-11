Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA39199EAD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 17:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768151990; cv=none; b=RGjIvCXmRfI3gC/lcFHKNHnjhnazyB4RfRb4Q8YuiFbkF8TEq4fV+6Hq+1yCTPFbXyDBA1+30VHBxDbqEaofjDT1p1IZBKNF7+mIqnewtXaZJKhcMJpHw0tuH6fVzyWbec4nlSUXN7fDdrrCQGlGYbkE15mVFUdtgslKotGLZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768151990; c=relaxed/simple;
	bh=iTnp95ZE+zoSojUdAGIeN9l2h9OVp1B499TLGi6HJL8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FHOJYu4iLTT0JfVsrbKs+xJlT7P+SAvdmI2vDzS9+plfCMO/PZlZ+dJQFAntYp858T20KF5xQT/WPMtC6HkKEpv+MZ+7nAxc3XmYTAqMsPCx7KFjY9YRRsflMQ29ANcxSBTNiP6cvLWVVzIKBRUVNVxMEGHHSbCqHf9VALMT1hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UeD8r6qQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UeD8r6qQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768151989; x=1799687989;
  h=date:from:to:cc:subject:message-id;
  bh=iTnp95ZE+zoSojUdAGIeN9l2h9OVp1B499TLGi6HJL8=;
  b=UeD8r6qQDUCJQA8dg/MJi+iprtWux5ZEny0zNIQFIchiUL+W26KI15tI
   1sy/M52J3lFt/VfhU5kUB/KD6BbVBJFHVTXTf0a8SjnwypGgSHakWhhMu
   DcjH2SGggc42iMPNVkicF9ufXj/R+n9gkvcrlP4lmSUUCwK69Tw4f38bx
   rKXPb56EzZiMzpypaygSIBIZbTtdvCs4N1mPGtvYaBYeiqyuZTgTP6BnP
   Ym84+Xub919U0i0pQs5nPzwJiAldFVkY3k8z56LNJ68R6HWoiEOebc8cG
   q5a+mKUhB5qd/kSj68b5uFj6YAl2gUWibXRvATc9YbYjSqZmD+u/Z7KCb
   A==;
X-CSE-ConnectionGUID: jTVP8y9tSle7zbD/7pQ3Yw==
X-CSE-MsgGUID: b7Uw0Fj2TnymugSl0SGs4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80165161"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80165161"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 09:19:48 -0800
X-CSE-ConnectionGUID: zNAbcRu2SEWMjqEPBe08vQ==
X-CSE-MsgGUID: DALDHNl7SuCM2O4iSJ7wIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203808844"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2026 09:19:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vez6P-00000000CYi-0HON;
	Sun, 11 Jan 2026 17:19:45 +0000
Date: Mon, 12 Jan 2026 01:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Subject: [linkinjeon-ntfs:ntfs-next 13/14] Warning:
 fs/ntfs/attrib.c:4030 function parameter 'need_lock' not described in
 'ntfs_non_resident_attr_expand'
Message-ID: <202601120118.506Je2l0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Namjae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   7a305a47bcefc8d9f628f92a700c741fa16e65a0
commit: d37f41f3e1352e866f9538ec5fcac9b44eae728f [13/14] ntfs: add Kconfig and Makefile
config: parisc-randconfig-002-20260111 (https://download.01.org/0day-ci/archive/20260112/202601120118.506Je2l0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120118.506Je2l0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120118.506Je2l0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: fs/ntfs/attrib.c:2725 function parameter 'ni' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'non_resident' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compressed' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'encrypted' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'sparse' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'allocated_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'data_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'initialized_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compressed_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compression_unit' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:4030 function parameter 'holes' not described in 'ntfs_non_resident_attr_expand'
>> Warning: fs/ntfs/attrib.c:4030 function parameter 'need_lock' not described in 'ntfs_non_resident_attr_expand'
   Warning: fs/ntfs/attrib.c:4290 function parameter 'holes' not described in 'ntfs_resident_attr_resize'
   Warning: fs/ntfs/attrib.c:4606 function parameter 'holes' not described in 'ntfs_attr_truncate_i'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'ni' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'non_resident' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compressed' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'encrypted' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'sparse' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'allocated_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'data_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'initialized_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compressed_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compression_unit' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:4030 function parameter 'holes' not described in 'ntfs_non_resident_attr_expand'
>> Warning: fs/ntfs/attrib.c:4030 function parameter 'need_lock' not described in 'ntfs_non_resident_attr_expand'
   Warning: fs/ntfs/attrib.c:4290 function parameter 'holes' not described in 'ntfs_resident_attr_resize'
   Warning: fs/ntfs/attrib.c:4606 function parameter 'holes' not described in 'ntfs_attr_truncate_i'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
