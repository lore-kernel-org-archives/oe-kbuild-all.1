Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B37170A37
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 04:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741409180; cv=none; b=L9VKNGmIFk7XvnuPqZ3AXbqIxtpI8iU4WECs04f+3bZEv3EsYEvNk3Pt2BBonH69y3oPXk1Tqyhs3Iw9rxiTq/E9nUnYdL5lq0S+qX9FeG7ulpAT6JJVPv0l9Lu3Z7aGaQG8HUHeFxkuaT/VpUnNbyWzLWPJypA9efRnrjprhC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741409180; c=relaxed/simple;
	bh=yM+d7a5JpidIIevEXq+Jrb28WZiP6TtbdJHyZ0q8zXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tI+Nr9PY1QrdYfGc30o8bilCkUAMk1klVHg1Jdk//otSqu7hX3eYhQVIsh7KDY1f312URMcFiFGJ59hUc0yWJa47+yvBDneHBOE7Ff6XU1e5hrUIqVX7MY20+VbzcsET9W/zUS/TKP4L4XQxmFDinkV7/+DpIIALu6ueEuFHK+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJHicM+p; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJHicM+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741409179; x=1772945179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yM+d7a5JpidIIevEXq+Jrb28WZiP6TtbdJHyZ0q8zXo=;
  b=aJHicM+pL2GXabA84Ab/zOWH+xPCBLhfdEZJGUZYEefcg06T3U+G8DVJ
   6T0q0DtJsC6MbtVL9UVxvQJmRKpN6kKmdYQxz++ddTwueIDBfT54U3I9G
   7NQUi/HMrf+ZlVEV6Ei8070fZ6fAguili/HGhF0HHcjC8pQh/20MNs6dc
   md2cxHtcAude60EBWpfvTf0nOr3w9qWSBmnuvJnV7zOk1miQtcOAwFV9I
   XcZ2qQGDjxBzbOj3Rbf7k+8/2h0RAlpC67K6v50OD9TVwAd50fitAmJvO
   35i03asmKvJjCbYwKpFKP1d8w6E0R4tzZ6YKFQghie68tJUYpFMONz8qc
   g==;
X-CSE-ConnectionGUID: +f8iS64xTTm3dhKiWxm1fA==
X-CSE-MsgGUID: URhT4pf7SCWkoAqnOS6adQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42664402"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="42664402"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 20:46:15 -0800
X-CSE-ConnectionGUID: 2+6bgPQmQf+hnZg9UQsIAg==
X-CSE-MsgGUID: xUWXgkZGS6aLxngTBQEv2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="119484034"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 07 Mar 2025 20:46:15 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqm4i-0001VE-01;
	Sat, 08 Mar 2025 04:46:12 +0000
Date: Sat, 8 Mar 2025 12:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 225/411]
 drivers/vfio/pci/nvidia-vgpu/vgpu.c:8:10: fatal error: nvrm/nvtypes.h: No
 such file or directory
Message-ID: <202503081234.0IgFNmVI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: 0014ea7dabeea93a9bef5878aa309a15fd681edf [225/411] vfio/vgpu_mgr: allocate vGPU FB memory when creating vGPUs
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250308/202503081234.0IgFNmVI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081234.0IgFNmVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081234.0IgFNmVI-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: kbuild/src/consumer/drivers/vfio/pci/nvidia-vgpu/include: No such file or directory [-Wmissing-include-dirs]
>> drivers/vfio/pci/nvidia-vgpu/vgpu.c:8:10: fatal error: nvrm/nvtypes.h: No such file or directory
       8 | #include <nvrm/nvtypes.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.


vim +8 drivers/vfio/pci/nvidia-vgpu/vgpu.c

     7	
   > 8	#include <nvrm/nvtypes.h>
     9	#include <nvrm/common/sdk/nvidia/inc/ctrl/ctrla081.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
