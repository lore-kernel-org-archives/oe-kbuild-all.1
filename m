Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C22E2EC0B2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 04:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769833009; cv=none; b=IMiAznMIAXwAXBCqLtw1NsZ9taUP+zgwfm/Fgz33rnhXUPQd4BX6wFavtx2L50qMyhUGKXjzRg236vXe7Q7qzt5q+bMD0sU/e6n0jCxwXtt1XlH8sHvQ0lsR1Nbeb6ixIdTTQUR/A5sqAZQXwkcw55Mfnvcnu/cDRfwZ+MlKrbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769833009; c=relaxed/simple;
	bh=uvyaEImWmSZfmCqvfbRNcM4aE9CuVr3cI3nXusmYNJU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ATM/1kmHhkoBqyyDXxh+2UY8IXmjyE1kGuL1+m9Cz41v+ZbZgWlfKUiNsQu3PLtJOgmls0TEDv6RRdOLnBjYWa93YUWtiCelt4l3Yioid4LrA1ZKX28/nbAynNdUe9keA1KBoWZ0bTkPUeulBoCaiL7X2nQKjQbGpkD0fi8jGFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnHWm6sW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnHWm6sW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769833007; x=1801369007;
  h=date:from:to:cc:subject:message-id;
  bh=uvyaEImWmSZfmCqvfbRNcM4aE9CuVr3cI3nXusmYNJU=;
  b=GnHWm6sWG1dGstSywEg1gSGaUfFvY51qrmkwE4H/q0X7+Eru5eAFzeGD
   MPJL3P0oA/MBFgehBCQxTkHlOyjrnSsQPG0cRZiIok0o4uGOzPPtF25s2
   st0Mp/QP/kdBflvU9teOTkQBxhA6BlxyF7YM8wkd5lNBoBgpCuV78tjAc
   RL0mvam1JW2QigjkGwovtrlfr35wTwKKkz7LLj98SNey0sJuya3UAADwh
   MMTyQ8L4ASsVMJaZjTTOdj6yuRhU8KnYqNKPCI3FVMAPdIrok+qN23EI8
   yoIp8MacLuBZvpmqg4qyAnmAOmYwcmVF2aATkfoPxTBN4FWy6yhcUzIC8
   Q==;
X-CSE-ConnectionGUID: I5bw3Lq8QeuEMZoxaT1d7g==
X-CSE-MsgGUID: SMWWG2R6Ska1cLWWb7OjcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="88657569"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="88657569"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 20:16:46 -0800
X-CSE-ConnectionGUID: QZoGDLfKRQCC0JRggTUq/g==
X-CSE-MsgGUID: UgcmzQLOQBeRfmpSaJoYrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="239725914"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2026 20:16:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm2Pa-00000000ddg-33jL;
	Sat, 31 Jan 2026 04:16:42 +0000
Date: Sat, 31 Jan 2026 12:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 1/1]
 ./usr/include/linux/exportd_netlink.h:1:1: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202601311210.4uiRveXm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   077e7343a43c486345b6ed3fcee3b2ef296ec201
commit: 077e7343a43c486345b6ed3fcee3b2ef296ec201 [1/1] nfsd: add new netlink spec for svc_export upcall
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260131/202601311210.4uiRveXm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311210.4uiRveXm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311210.4uiRveXm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/exportd_netlink.h:1:1: error: C++ style comments are not allowed in ISO C90
       1 | // SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
         | ^
   ./usr/include/linux/exportd_netlink.h:1:1: note: (this will be reported only once per input file)
>> ./usr/include/linux/exportd_netlink.h:7:10: fatal error: net/netlink.h: No such file or directory
       7 | #include <net/netlink.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
