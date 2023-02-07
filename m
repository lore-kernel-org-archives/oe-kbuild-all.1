Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FB6747F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 20:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675800693; x=1707336693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6r9K7eZMjEOmqH7s3foPfqZdM9KCtMEGsQnG7RmX+K4=;
  b=evkzqr6UkV5Cp1FrCCBqFF/lXmlhr5X543757i8VgwwxMB/fEyJWtyj7
   AQn8bwwHK5QIc456H83fD4wzSwnYqMCWRtCRK4u4H197oVGIRuKhf30bH
   11+PViVyfaVdb9yKjNyyNQVzrKgA9NFGPUqMmOPFiIEf4CxZlaMcyVBWV
   w6/hN1enPzZUfaQRRNvZjwBGgJ0Bun/R26dyHmmTY7/RY1A65sYKTLv03
   +MvRr9gAlpAFReocEMJORfwO6HI0Wr4EjJzejIx8eyxM0vr4W/At7KAZK
   Op41URl1XgRW/SdoMjZRJl9T+yU02v9Hh9y94+N+W3TQN1V27L45wOXhm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="415835076"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="415835076"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 12:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="809666693"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="809666693"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2023 12:11:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPUJO-0003rI-2P;
	Tue, 07 Feb 2023 20:11:30 +0000
Date: Wed, 8 Feb 2023 04:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest 59/136] arch/x86/kernel/cc_platform.c:19:14:
 sparse: sparse: symbol 'x86_disable_cc' was not declared. Should it be
 static?
Message-ID: <202302080443.1bja1j9o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest
head:   f3d7a7e86bf2f0d5ce629f2fb7be11dca88ac06d
commit: c0f898923eae065ba302be51fde8568aa5fb7aec [59/136] x86/tdx: Add option to override prot values
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230208/202302080443.1bja1j9o-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/c0f898923eae065ba302be51fde8568aa5fb7aec
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest
        git checkout c0f898923eae065ba302be51fde8568aa5fb7aec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cc_platform.c:19:14: sparse: sparse: symbol 'x86_disable_cc' was not declared. Should it be static?

vim +/x86_disable_cc +19 arch/x86/kernel/cc_platform.c

    18	
  > 19	unsigned int x86_disable_cc = -1;
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
