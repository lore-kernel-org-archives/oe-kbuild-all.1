Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB3C1885B4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 02:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748053679; cv=none; b=BHghdPoVnrTzqQoPGsbdnNQ1IE+/kzXLceThcT19Kt97cj04sDduL4GrElYZQ2p4G3Wl7i11WU/J2+i2JQnZQT0xtj27ZTmeyZISarBeTk46hbUj5SiquThxjnxcbqYISzBGtolZIBg34t7H4XMu0CAq9hGTcr9m8FLHqMXHojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748053679; c=relaxed/simple;
	bh=lyCmSL0Tw0mcZu+i0z99DfZTnKYoe12LVHKUQn9YUHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u7Wy+ANt0Hu9CjaeXDhnRcCf28ivgJ4kB1ONwnKi+4NNPBieKcFtGm0PqeF5Wgp52SprIGmLZ7Nr6r6bV1D9l7YgyIwELDINT8+ZJp36KyTdc1fL+1cSaSZAsNlCuR1hYizGwCv4wp4j2O1yMGOJAYNo7AZIj/6d1dPJCL/1PoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLTvBgOk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLTvBgOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748053678; x=1779589678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lyCmSL0Tw0mcZu+i0z99DfZTnKYoe12LVHKUQn9YUHA=;
  b=RLTvBgOkqX+5HhuE/J242O2A8DnlsKdYtxauCpZyoZSlmgExNYkYjHOL
   dU2d9xx5f6kdK82ZxiYb7VCQhrf7Xai4SjIhlvUXyemvZ9fqrlFQ78+zU
   QN1k/TQvVglf0h7N3rQDFfDELTXdB0nKXkT5EdSTsgnn+9HbN+Chb9xal
   bwZl/uxeE1b2nM9SpGB0XeCGtuIXPTkTXm3oPL8Epp+cigTjtvnqGUXyh
   dOwKKMLIwuTjyFdNpcOJ07FzTbVViCpWxYPA7zgyB/ANsP0gNK9m6gu+P
   2nPwmskd18qnu52uHcVnYR615txE+WvaTRFNcONT6FkHw3cL7ryjgi/7i
   Q==;
X-CSE-ConnectionGUID: GNVsjAHTRSGvItLsJ+9FEw==
X-CSE-MsgGUID: bDDztmq5QZefdB7iJdqmNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50036042"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="50036042"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 19:27:57 -0700
X-CSE-ConnectionGUID: 2hnMk/BfSACHKxknnsScnw==
X-CSE-MsgGUID: O4HuM0JKTgygHmbHfd6Q8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="141253015"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 May 2025 19:27:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIec5-000Qsm-28;
	Sat, 24 May 2025 02:27:53 +0000
Date: Sat, 24 May 2025 10:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:container 11/15] samples/vfs/test-container.c:21:10:
 fatal error: keyutils.h: No such file or directory
Message-ID: <202505241053.NTHs1met-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git container
head:   e934156b00c64a64a048108513ab445a232c2120
commit: b361d3b7917fe21f9bcc4632c2843e94a568f8f1 [11/15] containers: Sample program for driving container objects
config: i386-buildonly-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241053.NTHs1met-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241053.NTHs1met-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241053.NTHs1met-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /usr/bin/ld: cannot find -lkeyutils: No such file or directory
   collect2: error: ld returned 1 exit status
--
>> samples/vfs/test-container.c:21:10: fatal error: keyutils.h: No such file or directory
      21 | #include <keyutils.h>
         |          ^~~~~~~~~~~~
   compilation terminated.


vim +21 samples/vfs/test-container.c

  > 21	#include <keyutils.h>
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
