Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAC37C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 02:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679192281; x=1710728281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E6wZ8XS9hopWYd9RQxxHWgfkxSKHuyep5ec65TYTePQ=;
  b=REtMMwPL6sw2YiZkFehTzdz/03ZRegKyYoepFed7vEgBmKNy4LMMtFYd
   //4SMeYZxhfeqmlP+hMTJgDWX9lNwX34Nz4c6aqTpGsORwA03yxDjbyWv
   PTp+PEBDtsakfKGuSu3KGAcydSvmUbSmj5rCSM9x/kX6JD+7YeF8sDaNp
   92okPwIIKt9WZSkk+IVC5Q/fl3Xs4wQf47jJTLxeDaxtE7qBcCbLtpq+R
   uVec2DdVOCygWcSbU/1sPj242PQgV3Nq7n36b5fxOaRoIYZZTKW1yPH0r
   df9S5a+4aB6Y+CrIwIsZDIpqCR9xnZ6rtqEMH6qrKAx758RtwyxZMduwJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="318874986"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="318874986"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 19:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="854880047"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="854880047"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Mar 2023 19:17:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdicQ-000ALG-0g;
	Sun, 19 Mar 2023 02:17:58 +0000
Date: Sun, 19 Mar 2023 10:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [akpm-mm:mm-unstable 231/249] htmldocs:
 Documentation/admin-guide/kdump/vmcoreinfo.rst:193: WARNING: Title underline
 too short.
Message-ID: <202303191025.VRCTk6mP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   4018ab1f7cec061b8425737328edefebdc0ab832
commit: d7229d1b2abfecfcc360b36d032c89f9c49e0228 [231/249] mm-treewide-redefine-max_order-sanely-fix-3
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=d7229d1b2abfecfcc360b36d032c89f9c49e0228
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout d7229d1b2abfecfcc360b36d032c89f9c49e0228
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191025.VRCTk6mP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/kdump/vmcoreinfo.rst:193: WARNING: Title underline too short.

vim +193 Documentation/admin-guide/kdump/vmcoreinfo.rst

f263245a0ce2c4 Documentation/kdump/vmcoreinfo.txt             Lianbo Jiang       2019-01-10  191  
d7229d1b2abfec Documentation/admin-guide/kdump/vmcoreinfo.rst Kirill A. Shutemov 2023-03-17  192  (zone.free_area, MAX_ORDER + 1)
f263245a0ce2c4 Documentation/kdump/vmcoreinfo.txt             Lianbo Jiang       2019-01-10 @193  ---------------------------
f263245a0ce2c4 Documentation/kdump/vmcoreinfo.txt             Lianbo Jiang       2019-01-10  194  

:::::: The code at line 193 was first introduced by commit
:::::: f263245a0ce2c4e23b89a58fa5f7dfc048e11929 kdump: Document kernel data exported in the vmcoreinfo note

:::::: TO: Lianbo Jiang <lijiang@redhat.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
