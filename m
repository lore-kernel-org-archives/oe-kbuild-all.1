Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BB1184F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677933655; x=1709469655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u9RQZfqxOVW0oqy8KtxwQw2sc+k4LkzOpMFtfsakua0=;
  b=GPGRXIzNLvLFbKoIkVIJc+N+j+9XPqeJmN9Wu5eyrQy9xo6Wcq3w+QgP
   XpVBkljCD8Sy3rBaxLZ7roRcNQ0Qk4ujAcJGi0Pg718KWG3TxtyYKD12W
   YBDXp8Y/xUGv7XQQBSa+1AQIWqK3+vYudmnLAvVcupMSSFhP1QpxH7dN6
   icBvYYwUcNnZuNFPi0yur/GieckhdfVgyW7PDr7U64jJMq/dZwz28EXdJ
   pC5Elsbhjkr1TgbURGOSBGmNuhhmsKIUxOcAQpuzeHJzlIGR+fGpD95SO
   tiubJycou+TRZ+OjEXinLBPq3ptGS1vM1/tqMkIRstWT4BVuKcnWaEvHr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="400074897"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="400074897"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 04:40:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="675655470"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="675655470"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Mar 2023 04:40:53 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYRC1-0002A5-04;
	Sat, 04 Mar 2023 12:40:53 +0000
Date: Sat, 4 Mar 2023 20:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:tmp/for-baol-0303 7/53] htmldocs:
 Documentation/virt/kvm/devices/vfio.rst:45: WARNING: Literal block expected;
 none found.
Message-ID: <202303042022.MPIugesS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git tmp/for-baol-0303
head:   028abaf51f935755b020cbb2c8f196862dd3a312
commit: 29e1a8a95519040661aa3370fb58cd9ee8d6cb57 [7/53] docs: kvm: vfio: Require call KVM_DEV_VFIO_GROUP_ADD before VFIO_GROUP_GET_DEVICE_FD
reproduce:
        # https://github.com/yiliu1765/iommufd/commit/29e1a8a95519040661aa3370fb58cd9ee8d6cb57
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd tmp/for-baol-0303
        git checkout 29e1a8a95519040661aa3370fb58cd9ee8d6cb57
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303042022.MPIugesS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/virt/kvm/devices/vfio.rst:45: WARNING: Literal block expected; none found.

vim +45 Documentation/virt/kvm/devices/vfio.rst

    44	
  > 45	The GROUP_ADD operation above should be invoked prior to accessing the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
