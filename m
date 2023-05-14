Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013591859
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 May 2023 05:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684041682; x=1715577682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TMNMdWMw/4rJ3nZskwiE2roZQb7QssSoFMYZrUN+qlU=;
  b=Xr67Sn9EowmX/Vbb17VMuadVcvSI1ovxLLnlrT1SmNjE9TH3UVwl1IWe
   VTvJ7S8MHKhFBsyhixp3I95Tvvwf3oNaXYYUANz+PaTvi0sp2Q6L87h7k
   RKSkLzTXP0IlevJkuNe9eoA9eRpuzA0ZtJQQW+h8WbSfDFtPh9JDWQF2p
   F6W4xUs56cAfx28s7pTC4ofWgrRob3m2yKwURJFeMFc8BQjdyrnMyxBs7
   qphwE3FAV48z6bK9lUv2RVY88bOZroF+YmW8baayf0d0qcScMRXtIZQ8c
   4sqEZPNu9POZNY/pvljKbY2Z9akw/cSDLdW6u+AE+RviSMzXQSvBby0gU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="348507350"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="348507350"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 22:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="947042560"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="947042560"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 May 2023 22:21:21 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1py4Aa-0005q8-2X;
	Sun, 14 May 2023 05:21:20 +0000
Date: Sun, 14 May 2023 13:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 49/95] htmldocs:
 Documentation/virt/kvm/arm/get_freqtbl.rst:4: WARNING: Title underline too
 short.
Message-ID: <202305141333.ukr4VVmG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   89d010b0a9df01990fffda97770fecd4e69e0f86
commit: 84d17752956a5923569062d140ff52dd047395d6 [49/95] CHROMIUM: BACKPORT: FROMLIST: kvm: arm64: Add support for get_freqtbl service
reproduce:
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 84d17752956a5923569062d140ff52dd047395d6
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305141333.ukr4VVmG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/virt/kvm/arm/get_freqtbl.rst:4: WARNING: Title underline too short.

vim +4 Documentation/virt/kvm/arm/get_freqtbl.rst

     2	
     3	get_freqtbl support for arm/arm64
   > 4	=============================
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
