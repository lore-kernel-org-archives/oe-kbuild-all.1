Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EEE19E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 06:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680332369; x=1711868369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PMXe2iN70hx/zxIuvJrNcRar4+/wnhcOjl1pyngv4JU=;
  b=Dvp3qIrIxj0qKfrhd61hL2qI3g2u66iQfX0CyrAoPZU8djRoApO1vIOh
   0hJgfIUfpDPLORYbBBr3IhvX3Dg1Ornkyh4UZB+j9AByoaRHjjyV6PBw/
   iejSnP/eKmXF9QMFddshJE+fDQ8tQiFZRpZgDkRkBsfSVkEQc9b8Pw29K
   Yq+5lsh01oBllWVWYSz6zll4mOl0PE5+pULzc3V+sMYEssB9ZavkeELjr
   LdyKUYiLWwz6NYH7IaI/ocJ5Fr5Mw0WuZMmIQXRTI4T9YuaHp4f5SKZ9d
   WX1Q83P5zETigKEPQWFt6LCgl4ACvxM5cNwQUflAoFsq1e+7/f75pNvND
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="339123387"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="339123387"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 23:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="715698542"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="715698542"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 Mar 2023 23:59:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piVCo-000Ma3-0a;
	Sat, 01 Apr 2023 06:59:18 +0000
Date: Sat, 1 Apr 2023 14:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 8321/8375] htmldocs: Warning: arch/x86/Kconfig
 references a file that doesn't exist: Documentation/x86/shstk.rst
Message-ID: <202304011449.XFV6lLwh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5
commit: 3a5762993f9278880487d2dccfa964f09f6a1021 [8321/8375] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3a5762993f9278880487d2dccfa964f09f6a1021
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3a5762993f9278880487d2dccfa964f09f6a1021
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304011449.XFV6lLwh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/shstk.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
