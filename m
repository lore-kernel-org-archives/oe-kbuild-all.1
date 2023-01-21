Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91545386
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 04:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674273708; x=1705809708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z3/cbZ4VlsOfwwiZcIdk/m/5vXFPBG+Q/I4+f+Ny2M4=;
  b=oK911L1DvzT0YMTJBp7OvfK1cWRbtXUrMmhAaJKZzJ0QQESBEmaoOfsQ
   agGT1dGxf+1iAmmzzrhT7LbfUw0CNAD1QHzgTDLkJ6VCNWdAV7KPW54hn
   bFatYuUO9rJoyvvpfCgeZczLeSSHWpj/gHu+6DipKUloay7P+369BVb+M
   P7NYA67sqoc+ZdY0sHoUeotg4btmjF19P4WWX0ZRQ4ngOO4HkHt+3fCyC
   BDkrDxWkrRyymmPHUVNo9rPRnH0+DufJ9AdLwT7LVeL6qpnkEFsYl2w8/
   QbEiFVjSFrbZx1Xlz+EnN/4g85yFlSL5BSGfihSUgXTsjm0cBnlg8infB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="327027556"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="327027556"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 20:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="610692558"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="610692558"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2023 20:01:47 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ54c-0003OA-15;
	Sat, 21 Jan 2023 04:01:46 +0000
Date: Sat, 21 Jan 2023 12:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd-v6.2-rc2-nesting 28/41] ERROR:
 modpost: module iommufd uses symbol iommu_domain_alloc_user from namespace
 IOMMUFD_INTERNAL, but does not import it.
Message-ID: <202301211246.jNCjPBks-lkp@intel.com>
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
commit: aa5e41d857aebd84de4382b68354b53719001f65 [28/41] iommufd/hw_pagetable: Use iommu_domain_alloc_user() for domain allocation
config: s390-randconfig-r003-20230119 (https://download.01.org/0day-ci/archive/20230121/202301211246.jNCjPBks-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/aa5e41d857aebd84de4382b68354b53719001f65
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd-v6.2-rc2-nesting
        git checkout aa5e41d857aebd84de4382b68354b53719001f65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module iommufd uses symbol iommu_domain_alloc_user from namespace IOMMUFD_INTERNAL, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
