Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9FD1537A7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 23:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741391393; cv=none; b=f4vv/YkuSL2dZusJ23+cAkykoY9qlmVqpJ6FLNU9tvZcKSpL+RwcMPmTfhd+oobUclY6OthflTwsA1ks3Qizs9gni0ldJ/o+FYD8yYE8mhfqxtCiM4DGFhw7CU02W4b/UN+FgCs4dGIYX0HfpgpcAs/TmdADYwxTKfzb8nif9P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741391393; c=relaxed/simple;
	bh=IYfMlgxpfnxxEhy3WDpKnKidZEh1AVTD3ROzD7ImqhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f5LuYznyIQ0GbDXidP2hDpNRxKb0qLUpS2VkeuEJvayRJUe+fmYYdArlfWVhFrOij2IzDdYUaQXvzCqEtxtfUNJ98EFONJ5vNcwXhgp0DGEpRNCMALFzPfOA8cwWg/Vnyt4kR8cN4Ud0AM4aUDg6HR5BAgNSsD1bM6AkYwP7ODY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ganWwf/C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ganWwf/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741391392; x=1772927392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IYfMlgxpfnxxEhy3WDpKnKidZEh1AVTD3ROzD7ImqhA=;
  b=ganWwf/CBXgpaR9ilduavf4MFGHwHA8ao8w1ab2oc3VqZ9vFhGta/75a
   Ib/oSRvLVmAdNMiixVjYvUYmdBLWeI3JRUejvUif9oGPYsFfLSPKbluYv
   Q9qaM2TX7/H9IKa8DiUczwWSbzHWhz+gRxSeXyV7ThJooKgeoMUubG8hl
   okj2HBrniC96pfx7E8TqhT32oRECox+X7HTtcSkVVtT7Z3z0ruLis3nkW
   Sa03dGirKAO+8iibrJpiY3ObBKPfHtnFhIiRDiVlx4B3VwxgFy7IBeM4G
   axJPApfEmNaTBJ0fwFYVdyD4DYxbCmIEEVmbEI47Wns8RXom+AB15Ogim
   g==;
X-CSE-ConnectionGUID: Lru/IK2CQmWJsHVLy/HH0g==
X-CSE-MsgGUID: FgdKH0dfTJ2C/d+QWyKebg==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="53089343"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="53089343"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 15:49:51 -0800
X-CSE-ConnectionGUID: trZHoQzgTFugDWzw01IEEg==
X-CSE-MsgGUID: NTIZkdAwT2W3pDB82v633w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124689306"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Mar 2025 15:49:50 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqhRr-0001DJ-10;
	Fri, 07 Mar 2025 23:49:47 +0000
Date: Sat, 8 Mar 2025 07:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 224/411]
 drivers/vfio/pci/nvidia-vgpu/vgpu_types.c:8:10: fatal error: nvrm/nvtypes.h:
 No such file or directory
Message-ID: <202503080707.tMIc3kfi-lkp@intel.com>
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
commit: 8a6cde20548102a22c82cbcc8ca853814eeedbb8 [224/411] vfio/vgpu_mgr: introduce vGPU type uploading
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250308/202503080707.tMIc3kfi-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080707.tMIc3kfi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080707.tMIc3kfi-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: kbuild/src/consumer/drivers/vfio/pci/nvidia-vgpu/include: No such file or directory [-Wmissing-include-dirs]
>> drivers/vfio/pci/nvidia-vgpu/vgpu_types.c:8:10: fatal error: nvrm/nvtypes.h: No such file or directory
       8 | #include <nvrm/nvtypes.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.


vim +8 drivers/vfio/pci/nvidia-vgpu/vgpu_types.c

     7	
   > 8	#include <nvrm/nvtypes.h>
     9	#include <nvrm/common/sdk/nvidia/inc/ctrl/ctrla081.h>
    10	#include <nvrm/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080vgpumgrinternal.h>
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
