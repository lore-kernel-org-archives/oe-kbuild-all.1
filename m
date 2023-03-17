Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0D0810
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679043365; x=1710579365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZulOP3t7LVO+tymMsNlteIrer0a8d7gcp6PEELWfYGc=;
  b=b/JdzOAzbWGcfyczZd5YNaboXmZIcDA7qdKPy0in09FSLiDnBHzDGWtY
   BNaaARnVSihZnh2eFfvEIvTGRzTjtZsSEDzmeE1xyrpzHJ+HRsBUqZ/Mt
   EIwF/GK6oaknpAE2UqLtpNjTMbw1FQ854chSC1XPSt4kIuc1ytJN3bnKc
   7cqR2ndTQAEubpfZ4diINnXwuDbAlZmLyw/5c4TYl+U795UUo6WSGe5Eh
   tfSKuhe/ksDG8iiuHEecBIXmz+QUgG4hs0723AogaKYamHyshy02gbRn2
   NeZfEA4y5ztE/meYiUICTR856oeyvbURP7SSjmkAzbJG2RWi3zrkicxja
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="317869977"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="317869977"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 01:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="769293413"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="769293413"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2023 01:56:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd5sY-0009F0-0k;
	Fri, 17 Mar 2023 08:56:02 +0000
Date: Fri, 17 Mar 2023 16:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Gaurav Jain <gaurav.jain@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 4213/4413] htmldocs: Warning:
 Documentation/devicetree/bindings/input/snvs-pwrkey.txt references a file
 that doesn't exist: Documentation/devicetree/bindings/crypto/fsl-sec4.txt
Message-ID: <202303171606.xoYwr7Lj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f08c1de13a9403341c18b66638a05588b2663ce
commit: 0a4ca303ece25a84a92eda476cf8944d81e8e2c7 [4213/4413] dt-bindings: crypto: fsl,sec-v4.0: Convert to DT schema
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0a4ca303ece25a84a92eda476cf8944d81e8e2c7
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0a4ca303ece25a84a92eda476cf8944d81e8e2c7
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171606.xoYwr7Lj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/input/snvs-pwrkey.txt references a file that doesn't exist: Documentation/devicetree/bindings/crypto/fsl-sec4.txt
>> Warning: Documentation/devicetree/bindings/rtc/snvs-rtc.txt references a file that doesn't exist: Documentation/devicetree/bindings/crypto/fsl-sec4.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/crypto/fsl-sec4.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
