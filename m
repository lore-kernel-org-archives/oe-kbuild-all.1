Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104C22F3C3F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769602789; cv=none; b=H+m3ePzWn2894SdzbBxTwY/G+pCzz+ONi9Jt75WSMzBJSuKBTW625pmMaJMQacUeu8ZoEGIlE06LBoOKSaL0/hkWL6YjmlP03C3a1M2RSc1HI+f1ct+yexoJsGdZMGDfEqZjn3VBMiHG5HqHtRebqv8kZUmm+nMaixXa0L3mX4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769602789; c=relaxed/simple;
	bh=r/86JRl269QxbzmvcsNmimVMmGyeYFrXRO/KwzzGyPA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tczczSRWnHmLSuPIKbw5tIt+zMDmnXn8y6zZ9pMsgEMZdjJ5mOicWvUVpKOW+FcUwtJZvlrhIhPXsWtIA18X7qJIQfwij8H/o9ZqcCCyS7ZEK/l5OxtYzRUXW2mU9nHnLqZllqEvll/OiTSiGJTkKF4GK2cf/sk9T5C1gvqn4og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhkQ1geN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhkQ1geN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769602788; x=1801138788;
  h=date:from:to:cc:subject:message-id;
  bh=r/86JRl269QxbzmvcsNmimVMmGyeYFrXRO/KwzzGyPA=;
  b=RhkQ1geN/vEiM3qKzp4cc58XXxT8xTYWaIXf9yn9SdZvGzxzg2sJgFDt
   x0NSKWp73MtQaTYNaMwvN0gL5GUajwK6+TH51y/Y2u0tPrYMF0jK+hx+6
   oS01qHf75fIKj6DzFce4qtat/9U1uXrF+LXPb0G7Ae3yJEODgr97Z97lW
   5DFlezXl2JdbOKhcbTFdqZPOmdkbSmX42z2zztr0TE8PcRJGiSiY0XLVm
   LAdV7iL0euB+H3O+pskUk2LH3wT1RGwqnmN+xsPTH352KFmCSO7VTx17S
   vFrvIRHCPSgz4sXusKJOe2isy5uqEQ5udpOPOvVFpnpb+dcjeZjZO4lQw
   Q==;
X-CSE-ConnectionGUID: LKe7bEvdQoaPLcTqNxRIjw==
X-CSE-MsgGUID: CAI/Xxv1TXCzwcsEDQS9jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70869669"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70869669"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:19:47 -0800
X-CSE-ConnectionGUID: oJiumYffQS+C/+wdtWwHqQ==
X-CSE-MsgGUID: To1K0cAMS3yGP7fwraF5sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207387617"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 28 Jan 2026 04:19:45 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl4WN-0000000022z-1fKp;
	Wed, 28 Jan 2026 12:19:43 +0000
Date: Wed, 28 Jan 2026 13:19:25 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:vcam 5/5] ./usr/include/linux/vcam.h:11:10:
 fatal error: linux/bitops.h: No such file or directory
Message-ID: <202601281300.rS8Eg7CT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   0eaa98db49713b6cf0b621c8d0bbfa8ff2e75566
commit: 614658a312bd0fa790ec6418be91d960dca040b8 [5/5] media: Virtual camera driver
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260128/202601281300.rS8Eg7CT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281300.rS8Eg7CT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281300.rS8Eg7CT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/vcam.h:11:10: fatal error: linux/bitops.h: No such file or directory
      11 | #include <linux/bitops.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
