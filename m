Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85335690
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3Wsfona"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702029614; x=1733565614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XRE3uEq29DIEq+HIBGKjCbCFKzlqWvc1NQRYq5G8Ujk=;
  b=F3Wsfona3iSjTLEv+TSxBIdSYuqxdL2A6zM3n1vfENYkeBpkuwIdr4zg
   seKv0Vqu7hEhMRHcxZJHp3DaPB4F66CdtRHNtByn4RKs+AHFvbDNn2c6c
   AZf2N9bCRUkW4vQNmZIS+ecbVCRpkfj5wYreG6kUuzolOBm6eCg7N7XTe
   z+L3YLpLhDgBoJH7fG1hQ+kwyFcKQwLMzfL216sXV0qwA3yMv3Xop939J
   5nvshOpNZC528ajVqZqt1/PioqqQpNWQvOUco5hSd1fuwBYW/LVgMCBVj
   9Jv4BtMsjXAWrDC41lVeb2F74EXypMFFMzoj+irMFkflzEOdmL8GnQ1T3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393253110"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="393253110"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 02:00:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="806353900"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="806353900"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 08 Dec 2023 02:00:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBXeT-000DaH-2r;
	Fri, 08 Dec 2023 10:00:09 +0000
Date: Fri, 8 Dec 2023 18:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 5469/6165] uffd-common.c:636:28: warning: unused
 variable 'uffdio_move'
Message-ID: <202312081716.LUUhSNS4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
commit: d02321ca0329457d5828a83b82b156e6337c4236 [5469/6165] selftests/mm: add UFFDIO_MOVE ioctl test
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312081716.LUUhSNS4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312081716.LUUhSNS4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   uffd-common.c: In function 'move_page':
   uffd-common.c:636:28: error: storage size of 'uffdio_move' isn't known
     636 |         struct uffdio_move uffdio_move;
         |                            ^~~~~~~~~~~
   uffd-common.c:643:28: error: 'UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES' undeclared (first use in this function)
     643 |         uffdio_move.mode = UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   uffd-common.c:643:28: note: each undeclared identifier is reported only once for each function it appears in
   uffd-common.c:645:24: error: 'UFFDIO_MOVE' undeclared (first use in this function); did you mean 'UFFDIO_COPY'?
     645 |         if (ioctl(ufd, UFFDIO_MOVE, &uffdio_move)) {
         |                        ^~~~~~~~~~~
         |                        UFFDIO_COPY
>> uffd-common.c:636:28: warning: unused variable 'uffdio_move' [-Wunused-variable]
     636 |         struct uffdio_move uffdio_move;
         |                            ^~~~~~~~~~~
--
   uffd-unit-tests.c:1323:42: error: 'UFFD_FEATURE_MOVE' undeclared here (not in a function); did you mean 'UFFD_EVENT_REMOVE'?
    1323 |                 .uffd_feature_required = UFFD_FEATURE_MOVE,
         |                                          ^~~~~~~~~~~~~~~~~
         |                                          UFFD_EVENT_REMOVE
   uffd-common.c: In function 'move_page':
   uffd-common.c:636:28: error: storage size of 'uffdio_move' isn't known
     636 |         struct uffdio_move uffdio_move;
         |                            ^~~~~~~~~~~
   uffd-common.c:643:28: error: 'UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES' undeclared (first use in this function)
     643 |         uffdio_move.mode = UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   uffd-common.c:643:28: note: each undeclared identifier is reported only once for each function it appears in
   uffd-common.c:645:24: error: 'UFFDIO_MOVE' undeclared (first use in this function); did you mean 'UFFDIO_COPY'?
     645 |         if (ioctl(ufd, UFFDIO_MOVE, &uffdio_move)) {
         |                        ^~~~~~~~~~~
         |                        UFFDIO_COPY
>> uffd-common.c:636:28: warning: unused variable 'uffdio_move' [-Wunused-variable]
     636 |         struct uffdio_move uffdio_move;
         |                            ^~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
