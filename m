Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAFB4A3B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 14:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676989577; x=1708525577;
  h=date:from:cc:subject:message-id:mime-version;
  bh=8nXXS3PKC8Gqj2UJ+9t/Q3vIBRYFiXOvTK86KkXGNdo=;
  b=Q6hOIu1D+DfNEmLhbd4dAncxVtMGCZD3uVoh/+NHaLknEcBCy6ZRcnO7
   A1N25RqFLWgua4qrQdnad1Cad4CvTH8je9p9H83pnlnsDheQw67acSRvo
   kLmLhTMGsvEJbO0eIdePofePtgmpUfZ2PWobb6CseFO60aVmY37Wpn/T1
   xBzCjqMRr4JelWuFQ1uMNYlOM0evvvroSCrFHrIdJxNxzhnCwYQ5YVqki
   j5PhAo7pVcxuxF0w++0mZMh6mkAc+7pmQqfM5r9RbA5mgXz5PB6MMcB1q
   EOD+axJ08OiDpvRbHEHt3vcUvxS0+UNOWY53jAf3fjYBTKxrb38HDiJHO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="395121362"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="395121362"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 06:26:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="702026176"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="702026176"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Feb 2023 06:26:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUTav-000EqP-0I;
	Tue, 21 Feb 2023 14:26:13 +0000
Date: Tue, 21 Feb 2023 22:25:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Brandon Brnich <b-brnich@ti.com>,
	Prasanth Babu Mantena <p-mantena@ti.com>
Subject: [ti:ti-rt-linux-5.10.y-cicd 21154/22695] htmldocs: Warning:
 MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/media/cnm,wave5.yaml
Message-ID: <202302212247.HNsitoq4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   6051924999c0571e6f4fe813db135f05d4a8f0f5
commit: 5f467c5681a6c862441476473030ab03f6b2c27d [21154/22695] media: chips-media: wave5: Add wave5 driver to maintainers file
reproduce:
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout 5f467c5681a6c862441476473030ab03f6b2c27d
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302212247.HNsitoq4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/cnm,wave5.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
