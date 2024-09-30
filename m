Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0089A14D6F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 11:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727694851; cv=none; b=DJGe5e2ak5S0eqod5U+ogbl6tMPiQWZC62VIFOvbfjjk1sjYvv9IVIrQjiES++CrMnRZKo2Wqka/n5n2AUwrTdfx4uv9/5GNdbGGRvbMCWtsRHZn0LjpUvQteJL2Jx1ZEaH9B5ihDs8TBtRoQgBshA4fsyaXG9E5lhLdM1Lmd2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727694851; c=relaxed/simple;
	bh=UjgmVRHMJKnWp0Oiyi8DrhKZknjemGQW86vds2ohnCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UJIdUAwcPmWHSIr6SH6/4dkiR9QX/7XkCN5yL1+0AXNyueMeHgwUSc6/pzXMagV+3hVtZdEQ0vB12bSBtJwJ67HrSGl8fabB8g2nrHrc0X2okqciu6n+IGNv3+GJnzUjEwII9kS7HdSuHxmxVixP69TPGVzwLBZkn+rNk9H6tBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HskqPnJE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HskqPnJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727694849; x=1759230849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UjgmVRHMJKnWp0Oiyi8DrhKZknjemGQW86vds2ohnCk=;
  b=HskqPnJEZHhjtVd6cK4+rgsbQVtI95yQ21SlObJbY5yaxmjuLHdu3fOs
   mscgRbmSxgouh/iIoek+qdhumoI8naDLZXzD6ION1S+pCtVq3vR02XW2f
   NmRoZ46nSSrLaVEW/0mqp+ej3fb7ep6z8v86uuLQ1xpgeTQqhk4NAt2t/
   BLsc2u2oNgMW7njhf30LxR0+y2KEQVfnTXyZcgLC3w2V/u3/ARSk7o/rb
   xMCSaaoCRWY5Ofny4naz22nTthgL3poko5mKWRJOH606MAeIn8Gs+56kz
   9L0cO13hIM4HEy1DEcb71Zn3gaggxd3KV17/xn6DyyUqxqnX5GhIhN5bM
   g==;
X-CSE-ConnectionGUID: F2is+6PVQVyfffaOo9Mi6w==
X-CSE-MsgGUID: rkMFs4FlS5CWidkpR3ddHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26905945"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="26905945"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 04:14:08 -0700
X-CSE-ConnectionGUID: Z8EVQEpjTWaNV2wK2IDAyw==
X-CSE-MsgGUID: Rd8xdRCpQSm+oGaarAwaxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="104063063"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Sep 2024 04:14:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svELt-000PMv-1I;
	Mon, 30 Sep 2024 11:14:05 +0000
Date: Mon, 30 Sep 2024 19:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.fd 1/31] include/linux/file.h: linux/err.h is
 included more than once.
Message-ID: <202409301910.yeJRAbml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.fd
head:   e4a403e7355430004eb530bd2e7995eca9a8f67c
commit: 9f52da2ef619a0612baaf5ee577fa38b8dec4814 [1/31] introduce struct fderr, convert overlayfs uses to that
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301910.yeJRAbml-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/file.h: linux/err.h is included more than once.

vim +13 include/linux/file.h

     8	
     9	#include <linux/compiler.h>
    10	#include <linux/types.h>
    11	#include <linux/posix_types.h>
    12	#include <linux/errno.h>
  > 13	#include <linux/err.h>
    14	#include <linux/cleanup.h>
  > 15	#include <linux/err.h>
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
