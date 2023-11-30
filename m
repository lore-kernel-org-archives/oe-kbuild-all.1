Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C87F47A47
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3Ol8xY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701347712; x=1732883712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wC+4kO6nNpzq8EIy7xpK3/AaSarn+kQcMnheGGw9ekI=;
  b=c3Ol8xY2D+1D5hdkewmQ2njf8YOaNn2Q3O0E32NIr1+AuvM/MFc7x0JP
   DbqYQJ2QhiE9uW2xmLmBb+yNpPZGa1yQ8hDUMLkck7mlsZ04dgkKu129J
   yXdui38GLQWLVW/tXYH3bOnAYH+o7SsZb8L8FtzP6wSC7egs9ofSMVbMB
   5+FWwE1cy0ace2EgKPYIod2k8/0e0Mr7WWXrO6Rd8zV3rdF+/+RN9LxiO
   eweSLoW+fmsI7ShkZPil7uEESDc3tICAP7ePNnv0l6E5udMR6M9SYO+zV
   KmS8dFf/tzljXXuxbYVyMEfbEMPi0liwdUhhdkeHwMf/URxWhPkG4OGk8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="216453"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="216453"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 04:35:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892795267"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="892795267"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Nov 2023 04:35:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8gG3-0001vE-25;
	Thu, 30 Nov 2023 12:35:07 +0000
Date: Thu, 30 Nov 2023 20:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric DeVolder <eric_devolder@yahoo.com>
Subject: [linux-next:pending-fixes 239/291] mipsel-linux-ld:
 kernel/kexec_core.c:undefined reference to `machine_kexec'
Message-ID: <202311302042.sn8cDPIX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   1867b4f140ac1336fdc9f7989171e230ab3cea6a
commit: f8ff23429c625c2b2a134d87f490a89a98c544ce [239/291] kernel/Kconfig.kexec: drop select of KEXEC for CRASH_DUMP
config: mips-randconfig-r015-20211216 (https://download.01.org/0day-ci/archive/20231130/202311302042.sn8cDPIX-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302042.sn8cDPIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302042.sn8cDPIX-lkp@intel.com/

All errors (new ones prefixed by >>):

   mipsel-linux-ld: kernel/kexec_core.o: in function `kimage_free':
>> kernel/kexec_core.c:(.text+0x2200): undefined reference to `machine_kexec_cleanup'
   mipsel-linux-ld: kernel/kexec_core.o: in function `__crash_kexec':
>> kernel/kexec_core.c:(.text+0x2480): undefined reference to `machine_crash_shutdown'
>> mipsel-linux-ld: kernel/kexec_core.c:(.text+0x2488): undefined reference to `machine_kexec'
   mipsel-linux-ld: kernel/kexec_core.o: in function `kernel_kexec':
>> kernel/kexec_core.c:(.text+0x29b8): undefined reference to `machine_shutdown'
   mipsel-linux-ld: kernel/kexec_core.c:(.text+0x29c0): undefined reference to `machine_kexec'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
