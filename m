Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132C2346E64
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152424; cv=none; b=apiWJALkKtqdsaM6vCfACrlYsssMxn3lYzVRqBRizUEoypySRR9LOECVRGHOzq2kWhhT/nTEz/K0UxEz2Nlz6vN/gU8IFAeOIYBGsOQaTnEn2pq9OqLqEJNHxtY8xc7SZsY6e+bTSblS9KS//3sgMLQ3Pll9BkwHFYySL3LTa18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152424; c=relaxed/simple;
	bh=sqRX2DRVt+fK2Kb7CogVvaAtim6kiOW+ei6eRD/sK6Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SeFy82gPhAai8/aD6RgdLkrs+2u58bE5dNsHRN7RzvCB7+7Xl5q4gBWFA1hGWKbmyBbrevUlJFOIZGb4rETnVslQ/7UbvqvVsnG6VY8aK05yAnQwgJThBMuGTbXFk3QgQ2sUZ7Oen4RmjFlHcAo3Un+A68tqQlABp1KZOX4rDBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0YHt1Az; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0YHt1Az"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790152422; x=1821688422;
  h=date:from:to:cc:subject:message-id;
  bh=sqRX2DRVt+fK2Kb7CogVvaAtim6kiOW+ei6eRD/sK6Q=;
  b=Y0YHt1AzVEgg7X7K3zE0MPHk0P2rtsR5q51qStsm8EOJ8PjeszeYWXZc
   s35q61rsQo14IW99Sy/XpeggBLaSzkZBgknIprl1Bcq0mWaizXUSJQoap
   S5az7TLMglyV/zY+i9neWfpHtX3ic+q43IK7ZRC+lMUhRi6qHHUUcTbBv
   sN0c0apR/I47Mc7quapH3fm55uszRvzlxu6KBYelMYepybE0dqrZDghFd
   6VDIYt+lAnvL0XeofFIi+C+a/FGrmHvLuHdHJKnPAU/Jo+YhKdS5p4y4k
   RfAHixnsFBgM2GrqWOqn9t7xHRbXEDOGOeHJ7OGAyfiOl/lVtMzDGzMH2
   Q==;
X-CSE-ConnectionGUID: 5hH5+1OsS/eMOvdfj7gzqw==
X-CSE-MsgGUID: K21xvej0QoGRSt99qgla2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1330229"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1330229"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 01:33:41 -0700
X-CSE-ConnectionGUID: /19TCvEjQ1OO/5puM/1mTA==
X-CSE-MsgGUID: yhKKaShYSRCIkwql3ksYXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272993122"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 23 Sep 2026 01:33:40 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9IQ5-000000000aR-3fby;
	Wed, 23 Sep 2026 08:33:37 +0000
Date: Wed, 23 Sep 2026 10:33:09 +0200
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/trace/ptwrite-uprobes.rst:180:
 WARNING: Definition list ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202609231044.y1IuI9u7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andi-Kleen/ptwrite-uprobes-Add-minimal-low-level-support-for-x86/20260917-160029
head:   d3e06d9b6740df5ab41aab7ef2dd8661f80b774f
commit: 17103df8b292f69d812df6895c842ff3fba63fc0 ptwrite uprobes: Add a tutorial and overview documentation
date:   5 days ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260923/202609231044.y1IuI9u7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231044.y1IuI9u7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Relational referents
   ~~~~~~~~~~~~~~~~~~~~~ [docutils]
>> Documentation/trace/ptwrite-uprobes.rst:180: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/trace/ptwrite-uprobes.rst:204: ERROR: Unexpected indentation. [docutils]
>> Documentation/trace/ptwrite-uprobes.rst:209: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/trace/ptwrite-uprobes.rst:212: ERROR: Unexpected indentation. [docutils]
   Documentation/trace/ptwrite-uprobes.rst:214: ERROR: Unexpected indentation. [docutils]
   Documentation/trace/ptwrite-uprobes.rst:216: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/trace/ptwrite-uprobes.rst:219: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/trace/ptwrite-uprobes.rst:321: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]


vim +180 Documentation/trace/ptwrite-uprobes.rst

   174	
   175	  ptw[:[GRP/][EVENT]] PATH:OFFSET [FETCHARGS] : set a ptwrite probe
   176	  -:[GRP/][EVENT]                             : clear a probe
   177	
   178	  GRP      : group name. If omitted, "uprobes" is the default (the
   179	             event appears under events/uprobes/).
 > 180	  EVENT    : event name. If omitted, one is generated from PATH+OFFSET.
   181	  PATH     : path to an executable or a library.
   182	  OFFSET   : file offset of the probe site (0x-prefixed hex, see above).
   183	  FETCHARGS: probe arguments, up to 8 (see "Argument syntax" below).
   184	
   185	After creating the ptwrite uprobe it becomes available with its name
   186	in ``/sys/kernel/tracing/uprobe_events``. There it can be enabled
   187	by writing 1 to its enable field. However it only logs data
   188	when a Linux perf PT recording session with ptw=1 is active.
   189	
   190	perf probe
   191	----------
   192	
   193	``perf probe --ptwrite -x <file>`` creates ptwrite uprobes instead of
   194	the classic trap-based ones. The example below uses SDT probes.
   195	
   196	(this requires installing systemtap-devel or an equivalent package)
   197	
   198	    $ cat > t.c <<'EOF'
   199	    #include <stdio.h>
   200	    #include <sys/sdt.h>
   201	    __attribute__((noinline, noclone)) static unsigned long
   202	    target(unsigned long a, unsigned long b)
   203	    {
   204	        unsigned long local = a * 2;
   205	        STAP_PROBE1(test, rarg, a);
   206	        STAP_PROBE1(test, carg, 42);
   207	        STAP_PROBE2(test, marg, &local, b);
   208	        return a * 31 + b;
 > 209	    }
   210	    int main(void)
   211	    {
   212	        unsigned long i, acc = 0;
   213	        for (i = 0; i < 20; i++) {
   214	            acc += target(i, i + 1);
   215	            asm volatile("pause");
   216	        }
   217	        printf("acc=%lu\n", acc);
   218	        return 0;
   219	    }
   220	    EOF
   221	    $ gcc -O2 -no-pie -o t t.c
   222	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
