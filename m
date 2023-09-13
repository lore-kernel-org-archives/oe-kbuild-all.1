Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339298F6E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 16:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694621855; x=1726157855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=76ExIHkJFapG8jgxWrdScNwHuz5Nme+QQjyuB7yuVBM=;
  b=fNiTmaa1IM4K4DGGGtC98v8mCP5jbeMPh4/tICwqbeyeozVj4ne/bKJJ
   DFwJ2QurJcKrGP01wlUyxjy0wumwc4/gjhZMnMIkPtLKVlstrnj4Xj86B
   I755miLJQ8ECa2Q7sX29I4hIKr7kSYnFN5J5Z0ngAM+Fqek2Ps0BXC7ut
   EOVlZko6Nkwti6HeZ7BsMiCTxooljIRhJ7SnaeBRu/P8O81bWgZ1B3l8s
   KKjgCJaKb3iDbs39+wy9N6EQS8BHBPeNAgKvp5h0crCVXCq5JGZinOZnd
   XEPCb/EL6lO739fENSQhnIDVHkF8bXKCYdF+joGHRWRE6Vsii42oJf/ij
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="368975470"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="368975470"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 09:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="867857021"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; 
   d="scan'208";a="867857021"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Sep 2023 09:14:26 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgSVU-0000Is-1L;
	Wed, 13 Sep 2023 16:14:24 +0000
Date: Thu, 14 Sep 2023 00:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 1513/25020] htmldocs: Warning:
 Documentation/devicetree/bindings/display/imx/ldb.txt references a file that
 doesn't exist: Documentation/devicetree/bindings/clock/imx8qm-lpcg.txt
Message-ID: <202309140047.cYKGyYn8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: dceb8e96132bd3778e790af8738a7f2f86c80c69 [1513/25020] dt-bindings: display: imx: ldb: Add i.MXqm LDB compatible string and properties
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309140047.cYKGyYn8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140047.cYKGyYn8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/display/imx/ldb.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/imx8qm-lpcg.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
