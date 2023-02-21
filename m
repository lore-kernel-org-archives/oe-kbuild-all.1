Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67911EA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 01:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676942980; x=1708478980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mj2IbBXUW6u/2vUO9Ycv5Cc6xj76xZeG9UoUn802Xc4=;
  b=jd9y0KzmwOqzhgRToAPjNX6BisfP8nkOWiA/uLDwn6HYfVuMHRpGjaA7
   xbUaviNKeVcV9PGTStw1Y2Vd3v4X0cocf/z9yMHc3hgtBaZm9uSRSXdRB
   Nxksx7NFBIwMw9ZrnUrZp43r/xKWFU7cutYrtr9Bq4jt4kOSulMaBchAL
   MWoHADIljcTF7g7mFWmo3L9ZZmDeRaiBIQJLvYS5ld98OOUffosyB7ZaG
   G05LFsV3tJJuoKBOWH26gLtBP69m7yRYDw69HUSlO3/W85GlhtnEX8heQ
   1EUHKVZlpr+eTVWg9Ou61+yy1P7IItxZj3j91XtRXNQkjyeu1WSxLLQPG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="312891119"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="312891119"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 17:29:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="673507831"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="673507831"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Feb 2023 17:29:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUHTM-000EJl-2d;
	Tue, 21 Feb 2023 01:29:36 +0000
Date: Tue, 21 Feb 2023 09:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: Aswath Govindraju <a-govindraju@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y-cicd 15342/22695] htmldocs: Warning:
 Documentation/devicetree/bindings/usb/ti,am62-usb.yaml references a file
 that doesn't exist:
 Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
Message-ID: <202302210929.lLf9VbjR-lkp@intel.com>
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

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   6051924999c0571e6f4fe813db135f05d4a8f0f5
commit: 1119e586b349eff343a08aa66f6565ea1e310d16 [15342/22695] dt-bindings: usb: Add documentation for AM62 USB Wrapper module
reproduce:
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout 1119e586b349eff343a08aa66f6565ea1e310d16
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210929.lLf9VbjR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/usb/ti,am62-usb.yaml references a file that doesn't exist: Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
