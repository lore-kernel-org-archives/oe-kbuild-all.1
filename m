Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1D38F6E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 22:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677883770; x=1709419770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LJMM/M/VXIyk7Ttka26UbAX7Rb43ih+T7QK7jhtVmXw=;
  b=YhYO7yUDfJrh8KDKeqtwWpbKzTZavPwnfj91jhaHAmq1UV2ELiD9QOOz
   llrwwjzzW9t19D5VhbL9Es6rvUTMh+gH/yv1A48A2qZ4sUtJ2aanu/H5n
   YGsoucpnnRxeJEplRLQritEZo6VSd8lSokopWOCG0PBzU1greMe0drQm6
   Ie1EhbHSFljLlEyx+OWGuxqeRZ7erjmZ56rLMJxP+tepxPvkswYwsGV43
   iseDAKEsMQvclFSEpVcw0L9Jdw91GOnl/MOfr4ZtUAFy55dvF9mFO/5GE
   DrXFFTBo6Y3D72lvGO2N5BIDKXBV/shClT56lThAufCkAQ+ThnbV4ANK6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="333900936"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="333900936"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 14:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="668810371"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="668810371"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2023 14:49:28 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYEDP-0001ho-0i;
	Fri, 03 Mar 2023 22:49:27 +0000
Date: Sat, 4 Mar 2023 06:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [jgunthorpe:iommufd_hwpt 25/43] htmldocs:
 Documentation/userspace-api/iommufd:184:
 ./drivers/iommu/iommufd/device.c:580: WARNING: Definition list ends without
 a blank line; unexpected unindent.
Message-ID: <202303040633.TQNPbc3e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_hwpt
head:   d3282ba3ccf913d4b7fc93ad8b3c2f27927d8b68
commit: 5cccd4abc87354ab4ba694936b4f9a123c32749f [25/43] iommufd: Add iommufd_device_replace()
reproduce:
        # https://github.com/jgunthorpe/linux/commit/5cccd4abc87354ab4ba694936b4f9a123c32749f
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd_hwpt
        git checkout 5cccd4abc87354ab4ba694936b4f9a123c32749f
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303040633.TQNPbc3e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/iommufd:184: ./drivers/iommu/iommufd/device.c:580: WARNING: Definition list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
