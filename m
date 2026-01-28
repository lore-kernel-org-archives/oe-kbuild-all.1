Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64E125A2B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 18:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769625340; cv=none; b=uDJpc4a+j6PQAVAeBThgRUJbzJcjPYZEp9+F9pvJNrS1HQ4+60uGdObg/aj03axO5uJTQ7ZidMCbFSrNxLAEvKvtOel7gOdyYsKDK/eQDuE9u2zZ4/VB7zF1q/000iKUnbKaOw0VhHRwFOzSFtNw+3dgvXFZT0KjyvMEPgCPEXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769625340; c=relaxed/simple;
	bh=qsVu74PjXel4AphuYDXlF6vOyxz2XG6+unbbq/Q+WOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dyoTh+GeVbY3e+2XbLea+pg92XFivmDjT7XvCXa4k+oDRLU3qbsdYrM07wYzyWdbWZPen3TFhHZv9vgRowqj0GwS/ySOjf2Lk5LD1LrRX2rtowoJUcoj8iY5Gpt5lsQTrAB9+IorcUA2H7T+NWeWWnPDiCw47Woxy4ZV5i+TKDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0YBD65b; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0YBD65b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769625339; x=1801161339;
  h=date:from:to:cc:subject:message-id;
  bh=qsVu74PjXel4AphuYDXlF6vOyxz2XG6+unbbq/Q+WOc=;
  b=e0YBD65bp/uUc/FJzPHlKZi1ezLzYDVT7nLORUSQFaMAV5Wz2iHHaMYr
   zBNOmxYdRRWWykDPuEm7wOM7XQMuMmHRwK7QpYIGUmmH1gLnjIDmomQ7a
   aAsFjlFn9HGWoD474A7Vj5IJrTPuztzBikSzxiRUW+mgXxVnyCk3auGi/
   3i57T87stS1QCMYzB0SLTfLJS9EYxP3F0QP7/JXpf5loMfCFKLhHgYLHQ
   /nRrzk2SIVM+FovZYz1D+ArAX5tJCD9xu06NatbiwYQh6xpKvPuDXS2/l
   hq6r5cSDyPlXp9p1l5ADVjkytPa6MoNsNbFsII21QVZB415TtzvZEbfTl
   w==;
X-CSE-ConnectionGUID: S9VucRHeSS6zK1MSY84KJw==
X-CSE-MsgGUID: mB4QgBRTTP+t1Dej68v42A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74710356"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74710356"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 10:35:38 -0800
X-CSE-ConnectionGUID: 6LsexZSMQTivoF4o4Eljgw==
X-CSE-MsgGUID: rSYgBlAdRru8qssHznOr8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208368979"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Jan 2026 10:35:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlAO6-00000000ahg-1ZjW;
	Wed, 28 Jan 2026 18:35:34 +0000
Date: Thu, 29 Jan 2026 02:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.4 8/18] bpf_oom.c:undefined reference to
 `bpf_struct_ops_data'
Message-ID: <202601290200.rYI3Aiyv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.4
head:   09fa23dc39326303aa4b6145bfca206e15f0bb1b
commit: 54177e7f75d6d66ac08d94a715c617cf95b16f68 [8/18] mm: introduce BPF OOM struct ops
config: um-randconfig-002-20260128 (https://download.01.org/0day-ci/archive/20260129/202601290200.rYI3Aiyv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290200.rYI3Aiyv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290200.rYI3Aiyv-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: mm/bpf_oom.o: in function `bpf_handle_oom':
>> bpf_oom.c:(.ltext+0x11d): undefined reference to `bpf_struct_ops_data'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
