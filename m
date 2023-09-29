Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DC2399
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 04:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695963201; x=1727499201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J+1O++xAk1uaYvFA7tjRUB6ADIeprjPVZy44DcQC4tY=;
  b=SrevA1f+XSXXNFqSZx3fm3HhHLC4ki0KOkMbVYKYy9dwdGp0xIbYQMNK
   o+pfRNW93H71YAT6YHuRLEvrnqHNORhQd85HCb6LhbpRlAeloriIDtNxI
   VzhlFT3aKaHGpr0YHBinuTALfeAstp7manFMwXbpP8pvKPJ92iZL9IJvH
   O0nJAqIzkeFDvbaH4q3u5dGFIxjwpcDGjiHVAQtK9ZoUEjj2RgzaMASQv
   MOVEdjtnmK5YHgklfHhCTBOU0ehw0vkc2XFlIV/XNxWsiTE646J56b8jf
   1/0h/QwcEvA20t9F6AhLlr/WHDzi0ZofCDe/O/Eh6lG+YylU4BT9tpPfm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="362481177"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="362481177"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 21:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="1080807014"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="1080807014"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 28 Sep 2023 21:53:18 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm5V6-0002UD-2D;
	Fri, 29 Sep 2023 04:53:16 +0000
Date: Fri, 29 Sep 2023 12:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [arnd-playground:randconfig-6.7-next 184/306] dtbs_check:
 Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml:48:1:
 [error] syntax error: found character '\t' that cannot start any token
 (syntax)
Message-ID: <202309291228.GUgwQ7U1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7-next
head:   a126cc9f2f87fe0931a7bf053665560587086082
commit: c97cacea445d32a9301e2a8d4e96dc7518eb7809 [184/306] dt-bindings: net: add st,stlc45xx/p54spi binding
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309291228.GUgwQ7U1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291228.GUgwQ7U1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml:48:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
   Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/input/qcom,pm8921-keypad.yaml
>> Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml:48:1: found a tab character where an indentation space is expected
--
>> Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml: ignoring, error parsing file

vim +48 Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml

    44	
    45	examples:
    46	  - |
    47	    spi {
  > 48		#address-cells = <1>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
