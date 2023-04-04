Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322B233DA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680603614; x=1712139614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rmvps4X8PtV4tuCaHYj8S588EyFGn+ixjmbDGYbTB34=;
  b=cSmqJnx/tiql0/fq/jBqDJKoNp8mfVhriU1k9bcn8qMhrWzCZ7yfKhDG
   idVRq97TT+UjH3yhZN2/O7ttFddifloaX2db+RJtpeJPzHGz+URcmFNwI
   lceWMLvB6apkbxysL9W6TM41/npGEGq1CVa1BEh8GJEqZ/3IPrOs+xbS8
   RY1aErk1PpzBrY7sPy+3OJSBgWF+PI0JvTnxw13e25s45lAqjD5Qaz3eO
   DbA/aiqb190V3Ib1CneGC7wjJw3BZpd4Riq7riSKtl4SM1GV0EAQlCn4W
   FKnpb3AaF6b6B1MYzfOfHS9G3WOFxZo/qvWol/KfzXpOWElGLyfukE2i+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="343842692"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="343842692"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 03:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636472556"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="636472556"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Apr 2023 03:20:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjdlr-000PXC-2i;
	Tue, 04 Apr 2023 10:20:11 +0000
Date: Tue, 4 Apr 2023 18:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [asahilinux:bits/005-maintainers 1/3] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/usb/apple,dwc3.yaml
Message-ID: <202304041845.UHk97fZI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/005-maintainers
head:   332d1bd2c6f629438bc0e1e9a2c657a98159831a
commit: ff9818cdb92f40b4a2f78f76b1c5155befdb2cdd [1/3] MAINTAINERS: Add Apple dwc3 bindings to ARM/APPLE
reproduce:
        # https://github.com/AsahiLinux/linux/commit/ff9818cdb92f40b4a2f78f76b1c5155befdb2cdd
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/005-maintainers
        git checkout ff9818cdb92f40b4a2f78f76b1c5155befdb2cdd
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041845.UHk97fZI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/usb/apple,dwc3.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
