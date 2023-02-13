Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEB215A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 02:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676256603; x=1707792603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QIX0pB7o519tTIwTgZN/c1wz30mWpe62+gXVh2hr9GE=;
  b=LaCNtREK/7fK6BQR90KAkGIr138q8S7qYP4hRWEYtq38NML/PSyxtRMO
   M67fFmeaWZE3P+tcLSaRBDuVu59ukbqG1W9leAD6fHfPu3nNN9/9Ou+Eq
   36qPcd+SXoqMnK7cHAKVUByS6toRo1gP5nA/h18yDR6BzrFsXN6Sqam2c
   j6Ltea6odm0jiY44eDVRJo3qa/EMD9ADYvNwxdxFGUroKXesBcAlBzQyE
   V0A6lzc+mhW4/9V973f4ZR9aAgFAF022JqReWvq4vTrIO4YkNXl3iQM1g
   mbQRmHCvzc2n471iM8UK22AeeqIEX+LpGkqowM1OdKkjC3qo7SuxU+jBm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="314435211"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="314435211"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 18:50:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="701107612"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="701107612"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Feb 2023 18:50:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pROun-0007VA-1I;
	Mon, 13 Feb 2023 02:50:01 +0000
Date: Mon, 13 Feb 2023 10:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd-v6.2-rc2-nesting 25/30] ERROR:
 modpost: module iommufd uses symbol iommu_domain_alloc_user from namespace
 IOMMUFD_INTERNAL, but does not import it.
Message-ID: <202302131018.YGwggtPp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd-v6.2-rc2-nesting
head:   f9c22cd2206b239919f6290e33e92cd53748dd0c
commit: ca6fddc0851f46b45404c764149b3773c41dcc92 [25/30] iommufd/hw_pagetable: Use iommu_domain_alloc_user() for domain allocation
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20230213/202302131018.YGwggtPp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/yiliu1765/iommufd/commit/ca6fddc0851f46b45404c764149b3773c41dcc92
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd-v6.2-rc2-nesting
        git checkout ca6fddc0851f46b45404c764149b3773c41dcc92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131018.YGwggtPp-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: module iommufd uses symbol iommu_get_hw_info from namespace IOMMUFD_INTERNAL, but does not import it.
>> ERROR: modpost: module iommufd uses symbol iommu_domain_alloc_user from namespace IOMMUFD_INTERNAL, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
