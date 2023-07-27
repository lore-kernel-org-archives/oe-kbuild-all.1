Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81755253
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 05:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690435241; x=1721971241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0yGQ/toy6CSjasMDdQeMqBFg2k3jMvhSejmfzgIsFiA=;
  b=Nz9an6E/3QYw0kxaDk1RN6bOzT/dSqnbRS9VATHPZBbl10/hlMMTjYz2
   zMlIiq/dravlTtP26KwErNwaVfvUVJLi8KGtow9dgGn89DTUNL341C8/g
   M0Peb1tJI4LU1Mnb2JAatq/yvENC1bzmsXkvJ7fTJOmfg49L/HFokYB1D
   o29BpRzMsDd/XzpRaFhFjyY5fJqEPLltBUwxQ9+YGpiSMmx8zFUQ+1hoj
   5jT8ko9Jrb0okOHLtUI2SddCP9e+jZ7Dk1vsIqvc31QigBdhEYDcmfKx+
   4zmXVwdfgNW0B6GfPV65J1U9n32txDe0b+AA21GeefVzN6OtVJwjN0WBS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358209676"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="358209676"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="756514548"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="756514548"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 26 Jul 2023 22:20:40 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOtQV-0001xf-0u;
	Thu, 27 Jul 2023 05:20:39 +0000
Date: Thu, 27 Jul 2023 13:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 6827/29744] htmldocs: Warning:
 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references
 a file that doesn't exist:
 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
Message-ID: <202307271332.vGbNENec-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yong,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   0f1298b513108857f083de27c14132caad1f1028
commit: 70ef2cc4d51e006d23e5d2559f395e1c1e4e7dbc [6827/29744] UPSTREAM: dt-bindings: memory: mediatek: Convert SMI to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271332.vGbNENec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271332.vGbNENec-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
