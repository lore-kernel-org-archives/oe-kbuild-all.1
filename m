Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4597C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 04:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683173509; x=1714709509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T621CASeHlWEeDg8lidS+N8wSITmGe9eL3YxV8XpRVU=;
  b=b9Oj46UyEB9H/ZqWY2YpnpGTM9w30Vz6gft4qoozn+9WRgPGBlRrjYZr
   tm9fZXTYVERFndak8EWq63QPapsg4Nk8rLlMNnnYObTtaJh+Hqdw/jtDP
   IMtuTYmES+f+pLMGmsS5ffBSaizZDzzP4bzjFhoxIpJBWf0q3z0Z96taL
   6w9StkfNndd14aFfeQW5upAPrV4lW57vrTRKzsssTPjP6/J9bqOnGnDx2
   xN/Uaq3bYEJNlS2qfmrRuWxnTnoNJU15TY8VNzEfNpZgwmDpKPB9clvY8
   PKIt+aM4sn5Z/6CGDsGFSbGM2sL3dQxQ1jvyMxGu1GenvQcwUhLSbLJDb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="351818754"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="351818754"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 21:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674387100"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="674387100"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 May 2023 21:11:47 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puQJm-0002Xw-23;
	Thu, 04 May 2023 04:11:46 +0000
Date: Thu, 4 May 2023 12:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-05032023-yi 5/32] htmldocs:
 Documentation/userspace-api/iommufd:174: ./include/uapi/linux/iommufd.h:538:
 WARNING: Inline strong start-string without end-string.
Message-ID: <202305041231.ki4fs8mT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-05032023-yi
head:   d42e530ce651094641d637c16de9eed78dff683e
commit: e36d91e89328ea4ac92123b331a8fbfbba98cf58 [5/32] iommu/vt-d: Add iotlb flush for nested domain
reproduce:
        # https://github.com/yiliu1765/iommufd/commit/e36d91e89328ea4ac92123b331a8fbfbba98cf58
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd_nesting-05032023-yi
        git checkout e36d91e89328ea4ac92123b331a8fbfbba98cf58
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041231.ki4fs8mT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/iommufd:174: ./include/uapi/linux/iommufd.h:538: WARNING: Inline strong start-string without end-string.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
