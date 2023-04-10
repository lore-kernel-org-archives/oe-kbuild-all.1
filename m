Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233232915
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 12:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681128025; x=1712664025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8RgImdR92Zj4VMiMCnN6wxMgYEM0SDsX0wXE+KxhPV4=;
  b=cFZcTVmVDogEV4X7095g6hVgxN1Le6awakZfvNQ/MMYipnb5ht4wyQ9j
   v4nFr10Fwe0MIf3OJZYB7mNfJNhJ8dJE6eoNHKNn/z4qlA4uOg0//ARsB
   jQ0ZCbSOl9lMi+ubs/wulK24O7VRc753VMIe4mckyXVyOm1QVpXF0syLv
   rFNjf8oQTUOGdDBvaTguj/wLkDT2VmKYEHDHCWWvy4kdzuQ2ZH5jjIj6L
   HejSvDVveTQsX2Sx4KStx0bSwABW6gWigyPCLFhZstcGc7lY6S9P2u94Q
   Il87TNGnmNasd5/n3HKaSgc3uhB5KTQ7xWerRO31TE81jt1d9ZQ2KvURZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="406168791"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="406168791"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 05:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="638447706"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="638447706"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Apr 2023 05:00:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plqC5-000VMD-2u;
	Mon, 10 Apr 2023 12:00:21 +0000
Date: Mon, 10 Apr 2023 19:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Aswath Govindraju <a-govindraju@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-5.10.y-cicd 14825/22025] htmldocs: Warning:
 Documentation/devicetree/bindings/usb/ti,am62-usb.yaml references a file
 that doesn't exist:
 Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
Message-ID: <202304101953.xeBmi7Az-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Aswath,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: 1119e586b349eff343a08aa66f6565ea1e310d16 [14825/22025] dt-bindings: usb: Add documentation for AM62 USB Wrapper module
reproduce:
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout 1119e586b349eff343a08aa66f6565ea1e310d16
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304101953.xeBmi7Az-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/usb/ti,am62-usb.yaml references a file that doesn't exist: Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
