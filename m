Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48253E5EE7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755648; cv=none; b=nRJ0zk5SDkleYjc3AB99p0GPjmyNwjDAcMdpYi/vOzAcubSUFM7tWr+vRpz4HXMxWNW6vUZpXeFvA/h8VqBRmrALofoqham3bzDP8awEvrYUHX++wEZqWN2MGfp8LpIc5kskkb1nl9ax0Kj3ygDEd5xOVi5C+UvcN7clmdltWj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755648; c=relaxed/simple;
	bh=GOypwzuf6fxfeu1acBhr0N6YZ+Ac2EyU4CZIc921WXo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YhX/kEPUWynugjmkMP8i350Z+pXdjblaUPZXEkSvBz5tYRqC1QQm79e7jOOqU3qsbDRz70AkqHB3fNvaJwAvaru6vkF2bJ36imHDeXsf9TXnZlXedRMhXIe2cFGWNWaO5l/wYtJYZ8hzrOmr2VoRTCNML2W7bJtAsuLKx1zAO9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7fXfzhr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7fXfzhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785755646; x=1817291646;
  h=date:from:to:cc:subject:message-id;
  bh=GOypwzuf6fxfeu1acBhr0N6YZ+Ac2EyU4CZIc921WXo=;
  b=F7fXfzhrQGGsu+lksPhWxRvkO3KQ2zWi6lATaK7DWTMk3X0/StV0Weye
   mgYI6N/RC24AI53FS6Fts+vCK+T3u/XkQL/TU20GFvTGi5OY/hxke2cMj
   wlIG9dgLnXyVTk7KUeVdPK5upIAB2kspi1aCDwgpjOjBrgIKC1Z0zAdDZ
   sHzDyPHL0l5COSXcx5fUtNTGjWbKv0XLoV4s73p4NdWIyltQaJ26CQMzo
   egT23SYxd/njrpbKh39TapvZAgMuJ0Fc24Gec1HioCZa6Cv+7Zi/4Zppg
   rHRB81PVVre2vM7cwnPzUE2VpnyxC70A0Ng+LnTA6Gw5w/C4zDNOE/Atl
   g==;
X-CSE-ConnectionGUID: 184ywL2xRx+wISPu3DvqvQ==
X-CSE-MsgGUID: TW0WHRS9Su+sP6biQ/6UWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86162425"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86162425"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 04:14:05 -0700
X-CSE-ConnectionGUID: t1hJMoIGSo+IpQeFzorUxQ==
X-CSE-MsgGUID: 8MeKK2JYRJquI1M9QMOC7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="264662470"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 03 Aug 2026 04:13:50 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqqc4-000000003vm-0q68;
	Mon, 03 Aug 2026 11:13:44 +0000
Date: Mon, 03 Aug 2026 13:12:56 +0200
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/driver-api/steal-monitor.rst:2:
 WARNING: Explicit markup ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202608031322.Mwzvo1FC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-docs-Document-cpu_preferred_mask-and-Preferred-CPU-concept/20260803-124520
head:   6b51818cdef464c594cd8aeaa6f04a2f4ca1b1a5
commit: 6100a3dbbee2530c908dde1eda5aff47105e4661 virt: Introduce steal monitor driver
date:   6 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260803/202608031322.Mwzvo1FC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608031322.Mwzvo1FC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
   WARNING: ./include/linux/device.h:117 struct member 'show_const' not described in 'device_attribute'
   WARNING: ./include/linux/device.h:117 struct member 'store_const' not described in 'device_attribute'
   WARNING: ./include/media/media-entity.h:1394 function parameter 'args' not described in 'media_entity_call'
   WARNING: ./include/media/media-entity.h:1394 function parameter 'args' not described in 'media_entity_call'
>> Documentation/driver-api/steal-monitor.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.


vim +2 Documentation/driver-api/steal-monitor.rst

   > 2	=============
     3	Steal Monitor
     4	=============
     5	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
