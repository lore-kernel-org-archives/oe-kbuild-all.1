Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A647F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 06:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682144500; x=1713680500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=snpT28MU+a8lcdJ+HzlWqEv8C8ljJQmgHP4Xq8a0Xvw=;
  b=kkJ7MetuPEFvscCpC0v6q/I+3dTDke3ymIwSUvFq/3F0FOyRH/fV+XWp
   OWDXvzKm/lSPA+tCujhhIDYLTnvbpOw2zIv4/N8u/nvkSdaAwMmTZTTO4
   lRQRSntqysuBbXwvx7J0Qj6TtAoTy0o2p9EYezmgfQ6Vj0/kk9C7ElR4L
   tWwLNOkJbiwHHTTIqPzvLG5KKhMBsjTtzjOWmUwZk22yxVKCDrSCsgz5H
   VAlyLlyJXKptXaVvblogVAX8cR4Io54MhFanknlVNn+1RdyNLQvA3pdBN
   PXlYof/T4ckBBpI+qmTPpQUKma1/yOC3NGrVdWsEo1+VVbieeWXTPnOim
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325728200"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="325728200"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 23:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="669927796"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="669927796"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Apr 2023 23:21:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq6cq-000h7c-2G;
	Sat, 22 Apr 2023 06:21:36 +0000
Date: Sat, 22 Apr 2023 14:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sasha Levin <sashal@kernel.org>, linux-doc@vger.kernel.org
Subject: [stable:linux-5.10.y 9983/9999] htmldocs:
 Documentation/powerpc/associativity.rst:1: WARNING: Title overline &
 underline mismatch.
Message-ID: <202304221413.POY1Tjhf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   791a854ae5a5f5988f1291ae91168a149bd5ba57
commit: 453b3188be89a413efd7bad4ceb1f78a4716475b [9983/9999] powerpc/pseries: Add support for FORM2 associativity
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=453b3188be89a413efd7bad4ceb1f78a4716475b
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 453b3188be89a413efd7bad4ceb1f78a4716475b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221413.POY1Tjhf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/powerpc/associativity.rst:1: WARNING: Title overline & underline mismatch.

vim +1 Documentation/powerpc/associativity.rst

   > 1	============================
     2	NUMA resource associativity
     3	=============================
     4	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
