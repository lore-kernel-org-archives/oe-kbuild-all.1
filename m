Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9AB23D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 03:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676346234; x=1707882234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sxa4fg2OFwq59fSSbW3O3DrEPqwUCJwYde5pZeg0hv8=;
  b=Z7gCFV82pbY9TMAP1DhBYjq8x8q8O3pXAqlzBM+TrMlRYCFiIqvb1GSJ
   aBVNM8j+Wwnc3BhTzAsNr4xW0eTaClAuoG9nLzgYMpBQcanVWCcB+wTig
   w3Hi7L3Gsh8ocxM1WVF/Y2/smvoe3IxJ1Zssz6om+aknEefodrUVeAuEw
   1EKikCGhnuDdCH6HdsNEVj1QlhlGbBKlYZf1n33s0rV3p87Xh+AUvw+QY
   Qw4wfef1OSc6yvmbhj7JzdqRCV1RAdZh/lgTWOkOaj3otqWC2Acltl3i3
   yf5PzYEZaaGFsfZTtufNt4CfNjNbznctbGdqJ9PgGaxbVTH5FE1XmC8TC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="417285025"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="417285025"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 19:43:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="792966885"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="792966885"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Feb 2023 19:43:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRmER-0008BM-1J;
	Tue, 14 Feb 2023 03:43:51 +0000
Date: Tue, 14 Feb 2023 11:43:47 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [pinchartl-media:muxed/2022.2/base 490/740] htmldocs: Warning:
 Documentation/devicetree/bindings/net/xilinx_axienet.txt references a file
 that doesn't exist: Documentation/devicetree/bindings/net/xilinx_tsn.txt
Message-ID: <202302141158.2QQPDg4o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: 01fee54ce6a611d5d65a5fc081dad522a0376f95 [490/740] net: xilinx: Move Xilinx TSN to staging
reproduce:
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2022.2/base
        git checkout 01fee54ce6a611d5d65a5fc081dad522a0376f95
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141158.2QQPDg4o-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/net/xilinx_axienet.txt references a file that doesn't exist: Documentation/devicetree/bindings/net/xilinx_tsn.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
