Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000991;
	b=Y6r0/RnWUSv37iiFL+6T/AojMNkDyPCmLXwP5QuiCMdhlyu6uP/rjlyRMoGcnZfXvIRm
	 zTARFvHOHLX4ydyEMe8LH4RxePq2JSbP11r7AjojXkYKSK0i7J5XxflIt9HdNqFeQSs5Y
	 Njg01IayU+HBNwKzQ7z8bT8kcyBtrh4nH0XYGrRzEWItm8vU44tdjL1Ao7p6GSBUFVVvm
	 Jn59G7vi9PTne8DHEGGisz+6HEnlJan+3FTHOTh8gUjPyM/BYCbsjTJeNzWUQqD0laLsv
	 3gQE4yCufCBdh+/Xn5HPk77f7lsuvHF4u7HqJqb+LQDKgRLpw+PGtmWsUuXIZesSVKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000991;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rg2U8CQY8yeYiWqVFLmUn2BTqo4vrcHh3PC2/8jL+So=;
	b=xhKkx+ENVmtVVSeuqutR/svA0spir7u2RWVZHH3PtOZ62kaQrMomimIAOgZYR+zg3pQO
	 m764KK0MfA9nRzbsFYhpRbXOg8qRXxKKXaeowLRuY0INs96SwGs13rkWOFIR86jqvcWyS
	 w7fr0o4NkLlY79wBCO8qqxxtvXqM96Lb3PwMfIDqzkYjux/REMJxAmJiX82oZGD7U82ph
	 vT+bOtAGDk4u60+/mbuNR1oS7LM5qcYRKO3n1Rr0YVLELuINjrpJiVBuG5S69RVOv+FBv
	 1U6OVgDRjdHlE4PmZu8d0YgYpI5CDG0chqXO9zGIHsmPnYXVeiTdHGth6L6TLrihjQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="AoN08/Rj";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB42606A31D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 07:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AB42606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AoN08/Rj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793000990; x=1824536990;
  h=date:from:to:cc:subject:message-id;
  bh=GohSUlN+I455UMb0IXWrOqYri7y8qyZZn5ZTzpUOFJ4=;
  b=AoN08/RjsdhgKP5yrYjLUZ/hw5ewkGq6sQZVzWoKzBbHMHn2TYqTqKhO
   tuDosQU6jXSOfQXF5hhkSGoEjHaHmpqruPSC0BIBVBzHKO7IBe9JpdY5b
   yYjz+GxBUW8lzWxbRefdCm4BVrVoxWs+puE0bjpxqGd0iH/G2HHsDJqUl
   3+iLyg78yJ1aC4uvQN/yLi+KHJgt6cC/noCc2c4yzFuHK7s+rklVkTZN+
   bcLv8BICdx2pq9c/vXuRGdniTsoM8lj/t/P9j/i/1BHcwwwYRNqQpa5bW
   eRXncHhJMXOOIgo1WiBVOFdccWqYmkRbC/ts2oehsWgmH094oi9NamKLX
   A==;
X-CSE-ConnectionGUID: iQCZWHyLRhaudc1Dfphtfw==
X-CSE-MsgGUID: F7+wWBVWRhWr63SY660VDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1671917"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1671917"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 00:49:48 -0700
X-CSE-ConnectionGUID: BKiLlBF/RBGGFbw/kj8r6w==
X-CSE-MsgGUID: fzXc3iecQNGQjOVECB7IPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6026948"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 26 Oct 2026 00:49:47 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLFSi-00000000VZk-1zte;
	Mon, 26 Oct 2026 07:49:44 +0000
Date: Mon, 26 Oct 2026 15:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 293/293]
 fs/ocfs2/cluster/tcp.o: warning: objtool:
 o2net_complete_start_listening()+0x15f: unreachable instruction
Message-ID: <202610261532.INe692F0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   191cb7d73a55e6229890a3f4f5c6bc35c57ec685
commit: 7601db4c9d3bd9ab2482a863cb05204154d51ae8 [293/293] ocfs2: synchronize heartbeat callbacks with o2net teardown
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261026/202610261532.INe692F0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610261532.INe692F0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610261532.INe692F0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ocfs2/cluster/tcp.o: warning: objtool: o2net_complete_start_listening()+0x15f: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
