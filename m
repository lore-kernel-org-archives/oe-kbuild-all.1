Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29413C00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 15:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678979395; x=1710515395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eOV/ldQx3xWA9S+utd9+eO0S2mmhiPUV0nhprHPp4bM=;
  b=QHAICO2n5IZOVbPDql6N+jypEpB6yStHIhP0+rlmTNOnaS597vOJbGW+
   Y5k9WpjwnBSU7IdUekjzSnhlNXI60aXlujZESrlwOqGNIVIExzJZW+CTP
   vir+xVKVjyVVCN0tOEO2TWTqWIwtzszKypazFnbrttZI8+Gpx027+89gF
   RD12KeMJmLVEfSWWxOjEAGxbMJvi539khnkz8rwhgl1YOmjTF+5keTZBZ
   eENFTGbylGGHslVUTEwrLq29dtZeZnLUYLo3Ze7rupp5mLYamsG2TAzcH
   PqbpTDV8y9SaBQ3tZLxwyqYXsvSWitlsl6ro+vzvOntJwYFSTZmLQtLPE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="339561208"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="339561208"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 08:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="679930012"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="679930012"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Mar 2023 08:09:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcpES-0008as-2b;
	Thu, 16 Mar 2023 15:09:32 +0000
Date: Thu, 16 Mar 2023 23:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [akpm-mm:mm-nonmm-unstable 23/26] htmldocs:
 Documentation/ELF/ELF.rst: WARNING: document isn't included in any toctree
Message-ID: <202303162342.blXLNoBi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   ad1ba07b8ea42d34d4b48e960bae2ecb35d95bba
commit: 60b38b7cbb295d7914ca4a6e6cbe1f32b234c830 [23/26] ELF: document some de-facto PT_* ABI quirks
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=60b38b7cbb295d7914ca4a6e6cbe1f32b234c830
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-nonmm-unstable
        git checkout 60b38b7cbb295d7914ca4a6e6cbe1f32b234c830
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303162342.blXLNoBi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ELF/ELF.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
