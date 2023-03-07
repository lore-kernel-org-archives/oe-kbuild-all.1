Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0639E33D2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 11:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678188124; x=1709724124;
  h=date:from:cc:subject:message-id:mime-version;
  bh=c7vKDGM+G/b6SYwQhywY5KY2POjOgdL1gF5xMTmUr7c=;
  b=DIGl8n3a/CSdeipgQEPYssTF5z8eC7TcW5X59AYyLvyPDyWKyU8wUIqK
   9kb9QZW+Nc2e//BY3UYyM3h8XtMHm8YH58dZIV0+cM0acTeBvuzMhI7tY
   GyYQuO3+2TBq7ON52EEG1W0mSJGnTTGWtQ1xI20PtjSbp72zJWQrYNzQy
   ta5SI09bb5wqPW0dO31pdeOz2f6EzaYAOJ6JiQ9SCzKtxMaPT//b0h8Wo
   vmJAeVhmH1W5v4vOfy6kPwkSNgMWKNBXR/F+dq0E9dZs7K3WgkLQigyV9
   q6KMweWhH62vcHRoSYQlXWL1y/nT/RBmboMo/hYUvOzSw2bf5HdKaeHEO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422098574"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="422098574"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 03:22:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="765613719"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="765613719"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Mar 2023 03:22:02 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZVOL-0001Fz-3A;
	Tue, 07 Mar 2023 11:22:01 +0000
Date: Tue, 7 Mar 2023 19:21:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:5.10/yocto 16459/30000] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/arm/apple.yaml
Message-ID: <202303071924.jiP07B64-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alyssa,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   abd42491338c1d15ac7f00baaa8490063545737e
commit: cb1da6c5c448a72d5be82514d58e55eedbcfb94e [16459/30000] maintainers: Update freedesktop.org IRC channels
reproduce:
        # https://github.com/intel/linux-intel-lts/commit/cb1da6c5c448a72d5be82514d58e55eedbcfb94e
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout cb1da6c5c448a72d5be82514d58e55eedbcfb94e
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071924.jiP07B64-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/apple.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
