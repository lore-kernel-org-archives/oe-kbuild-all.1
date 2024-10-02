Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4319B1D0E34
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 15:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727883984; cv=none; b=ZbFOYPsjgZ5PpmX3LuCTmLI6y+s8VEWvzWka9dUTT0bxssYUdhiWirJBhWGg9tvg+2DDJ/H/CD9z+uvGqvUG4GEX1JYrxPCJWRLXyi9goe77rXTw+yTzEpQJB+jS7pACnbHpqBrUan5kK5IUVMsJLUluAG4pExXXUkQerzXssA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727883984; c=relaxed/simple;
	bh=eUrqvAahhn6WoRZTjvNxBbzdOdml2Pi/1FkTBhumqew=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GMaiXjhSQH8TgMtTGbRY4yWjbcQOieigMV6K/Ur9upmNcchZjoPMnVbaeVji8Dkrh+e5JxvabCnvHVLEbirY1qmonoT//YZwJESVZkBc5o4uY7KoInzp3eKq/oiB4ce9Y5dDUpq0vTBosQzLRF4WTKnh1NGI9cDn3DRtcgP02Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8sV2R13; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8sV2R13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727883983; x=1759419983;
  h=date:from:cc:subject:message-id:mime-version;
  bh=eUrqvAahhn6WoRZTjvNxBbzdOdml2Pi/1FkTBhumqew=;
  b=T8sV2R13vjRg1x8bpwujNS2qXiFMU6sogJoM/1F9Qvlc/3poLfWs3Sfs
   GJ/hcq4Ykfp+cbWm23xHslxsDO8MNEdklB2PWJra0DeO/VN2D11gEowj6
   LmbvvFNP6Te4lYuukef6F++ms0+UenMMSTR+M3XMEBAz2AkaPcGnTOljR
   KmCetZ+/wVhVZwJDRkyDjXX+QoH3qm9umVC3ZMY0oWIcG6VA4AlaXp+LD
   c8pJtJkgQGEcmds/SODdXu2Wjc6AVnGVfA4AlBUSLnlA1Bw6J1Bw0q5ub
   IRhclnIl/thEKJRg43LNQ4nFXRSjGGwCTlUYaAdGGZoQ2uYrxziZ0FSzP
   A==;
X-CSE-ConnectionGUID: n4GKJhiyQ3u5PRDZMQ4Sag==
X-CSE-MsgGUID: bgtqxQn3RQGVM1x7KVVTXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="49578269"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="49578269"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 08:46:20 -0700
X-CSE-ConnectionGUID: Z8TSsE0XQD+sP+ldwVlB7w==
X-CSE-MsgGUID: jKKKah6ZT5Gn4upZbvOWQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="74281129"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2024 08:46:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw1YP-000UAr-0l;
	Wed, 02 Oct 2024 15:46:17 +0000
Date: Wed, 2 Oct 2024 23:45:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)'
 and 'vmlinux.a(ring_buffer.o at 1120946)'
Message-ID: <202410022308.LFBi2Gyt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
commit: ee057c8c194b9283f4137b253b70e292693a39f0 Merge tag 'v6.11-rc3' into trace/ring-buffer/core
date:   7 weeks ago
config: riscv-randconfig-r111-20240930 (https://download.01.org/0day-ci/archive/20241002/202410022308.LFBi2Gyt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce: (https://download.01.org/0day-ci/archive/20241002/202410022308.LFBi2Gyt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410022308.LFBi2Gyt-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(net-traces.o at 1265006)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(tcp.o at 1268666)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(trace.o at 1121006)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(e1000_main.o at 1229186)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(slub.o at 1128746)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(hugetlb.o at 1128926)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(syscall.o at 1122386)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(skbuff.o at 1262906)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(filter.o at 1263986)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(mballoc.o at 1142726)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(dir.o at 1147766)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(protocol.o at 1277006)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(memory.o at 1127666)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(inode.o at 1142606)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(spi.o at 1228466)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(af_packet.o at 1274186)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(blk-mq.o at 1169906)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(page_alloc.o at 1128566)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(huge_memory.o at 1129406)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 1110146)' and 'vmlinux.a(ring_buffer.o at 1120946)'
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
