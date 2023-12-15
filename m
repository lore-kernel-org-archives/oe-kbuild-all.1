Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D271A5BB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxKyFv0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702636728; x=1734172728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GSN0mF2cmdnlVoI51WLzQEw9nKtcw+uwX1HzGOWF/J0=;
  b=PxKyFv0FiTJQRz9wJriH33QzDePyQs80zp0iCc/QKoKZls5t+VRMjtHP
   +GuzFOLaS9QeTgpdtzuXAwaNoS6uAk/IFDEAu0I+E2O4mcWyQqRz8hW/w
   izwcHc82WBF/sMnIkcJYkpryW5s5w1Ui8HCw1hobOYKgtuhIEy+TFOeF0
   iE4D3M8ioSMG7saDLt/GitDOH+UnXKf37t0KMSm23i5y7IfaTZAjNAhEI
   fNqyTT3JLJYNN6/20lLEBXVuPAjzTIc7ZkKMBNWVtkIZlYNEedm97lKxT
   SOzroPNjH1Dc+zvXm78WNtqnEfK8qVFPHNQn9EVwVuNHFB8uNriV1CPET
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="385676816"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="385676816"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 02:38:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="778222959"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="778222959"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Dec 2023 02:38:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE5ab-000NOu-1I;
	Fri, 15 Dec 2023 10:38:41 +0000
Date: Fri, 15 Dec 2023 18:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Roesch <shr@devkernel.io>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 7414/8213] mm/ksm.c:344:13: warning:
 'set_advisor_defaults' defined but not used
Message-ID: <202312151854.4k8dhWf6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: 5898c0939406116f8ab33dc5a50d36f3b5d44863 [7414/8213] mm/ksm: add sysfs knobs for advisor
config: openrisc-randconfig-r016-20230621 (https://download.01.org/0day-ci/archive/20231215/202312151854.4k8dhWf6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151854.4k8dhWf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312151854.4k8dhWf6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/ksm.c:344:13: warning: 'set_advisor_defaults' defined but not used [-Wunused-function]
     344 | static void set_advisor_defaults(void)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/set_advisor_defaults +344 mm/ksm.c

   343	
 > 344	static void set_advisor_defaults(void)
   345	{
   346		if (ksm_advisor == KSM_ADVISOR_NONE) {
   347			ksm_thread_pages_to_scan = DEFAULT_PAGES_TO_SCAN;
   348		} else if (ksm_advisor == KSM_ADVISOR_SCAN_TIME) {
   349			advisor_ctx = (const struct advisor_ctx){ 0 };
   350			ksm_thread_pages_to_scan = ksm_advisor_min_pages_to_scan;
   351		}
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
