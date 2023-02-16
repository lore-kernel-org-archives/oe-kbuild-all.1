Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9771415C1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 02:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676515518; x=1708051518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qp/hNAawmpyY6w1prkcvjaNNGoou5dz75eZMF7FoGoA=;
  b=RQ3YLuh/LjCR2TP3cmGBO3l6yixUDykx5wbBw13PWUjJWU8UbtvR7B+P
   RoI5C8WFCdKYhAwZeyTnU2lMCF4U4oSxTXvkZGwDQhA14VNZ2BOeEM3dR
   LAno484MOMAHHagsF8c34gc5kSkWSLC0/E96zXEaxvTfi63/o2lcH1plg
   P/RgZVa133cVeB6ZH9sPRZjjsj6a6vXrT5i0BAH974PAd9dsMzqeFCdx6
   odEyZ2j3iUuIwIZnPkmqnsDFCvCukdjUVi36A66PW+CBH1ttRUL6QQti/
   y62G/jyV8BVPqM9kkmtQnwU9MypVopirkF/71Mp91CTPZvuZCxp8i+PnM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="319660685"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="319660685"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 18:45:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="812795346"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="812795346"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2023 18:45:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSUGn-0009xN-0V;
	Thu, 16 Feb 2023 02:45:13 +0000
Date: Thu, 16 Feb 2023 10:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>, linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst:92:
 WARNING: Unexpected indentation.
Message-ID: <202302161045.T349jkBT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   033c40a89f55525139fd5b6342281b09b97d05bf
commit: 493a2c2d23ca91afba96ac32b6cbafb54382c2a3 Documentation/hw-vuln: Add documentation for Cross-Thread Return Predictions
date:   6 days ago
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=493a2c2d23ca91afba96ac32b6cbafb54382c2a3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 493a2c2d23ca91afba96ac32b6cbafb54382c2a3
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302161045.T349jkBT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst:92: WARNING: Unexpected indentation.

vim +92 Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst

    89	
    90	The mitigation for the KVM_CAP_X86_DISABLE_EXITS capability can be turned on
    91	using the boolean module parameter mitigate_smt_rsb, e.g.:
  > 92	        kvm.mitigate_smt_rsb=1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
