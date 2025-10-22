Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5657F2F49EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 20:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761163453; cv=none; b=ocPBVtI5mKbkdQ8YwhhRXV7rl7MpnprHJ+HWn2KWiwMvblpSCIlUu6aEnCeqWQft6jGBCUQVGBaFPJur7nDiJeuj0rJetlRWvOrKnOhoEjeSejub9nPvCeFgxMRCXlnetXq0/4wWe551/+VqIC3HXx8v0CHDLT55E2Rc+sNBSTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761163453; c=relaxed/simple;
	bh=NxaVzd+zTuhhAv56BVXaBNDYaZdCAlAlzOS5Aqm3qNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z+wg2GIDepi9Oe1IOLCvAtQSt0pOBe2iZ+oEcfUVLDZDT9VZKUJtZVkCoT3KSUfKorPoB3I+LLL/9cfytEDAVLDyzYG/SC6l/ffQZHS7ixFhiznDejVh5ZhcAfFc81z8+5Jq7y6LfBgKX9TZiY1yd8PmJqUxyq128eegtYu8rQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6Cv866Z; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6Cv866Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761163453; x=1792699453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NxaVzd+zTuhhAv56BVXaBNDYaZdCAlAlzOS5Aqm3qNM=;
  b=l6Cv866ZBCgxn0taa71E6yd7cWC+NfaohUXl3L+mjGrtYQ0slXUSN1WK
   fuYx92febxcbJS6KBUuyKhlBuQS26mA/QVOCDuZwy6gAfVJ9c/bZKw8zm
   2uyOscGpNclizXsAwsqaeDdX9Ul0K/pKQnhmFicg3GmdlkRG89hhX00eB
   YrGUGASqiaME4bQGmR5RoCmVLcQZr7W/eiT+95CJ6ig+/Dl2MUNg1KLIZ
   LW3r+XdpaNTcEajoZSxIuM9SW+NEynuxUPdkHne+I9MWGpI/El0vtdMn9
   5ZaM9Pc/USPGhd1SLitP0oPkbiqrrs5xW1D3qS/LUt32TIImIZxnjL+3e
   w==;
X-CSE-ConnectionGUID: A2dOh8W2TwOl9RCNDQNP2Q==
X-CSE-MsgGUID: uTWlb44GTMKS/LjQmjnc7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67189358"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="67189358"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 13:04:12 -0700
X-CSE-ConnectionGUID: Lkflr8w2R2y4VttkBrTL9Q==
X-CSE-MsgGUID: Ac/gzeUPShGpplg7cXsGlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="188006132"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Oct 2025 13:04:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBf44-000Cgr-1a;
	Wed, 22 Oct 2025 20:04:08 +0000
Date: Thu, 23 Oct 2025 04:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] undefined reference to
 `event_mutex'
Message-ID: <202510230345.jb2fSPjz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   1a762c612e9131598e090516097090611ed67dde
commit: 43c26111cafa87d81570c63d96c497e13ec883da [0/1] ANDROID: binder: unload C Binder trace events
config: x86_64-buildonly-randconfig-006-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230345.jb2fSPjz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230345.jb2fSPjz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230345.jb2fSPjz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `binder_remove_trace_events':
>> (.text+0x184bc7e): undefined reference to `event_mutex'
>> ld: (.text+0x184bc8a): undefined reference to `trace_types_lock'
>> ld: (.text+0x184bc96): undefined reference to `trace_event_sem'
>> ld: (.text+0x184bca2): undefined reference to `ftrace_events'
   ld: (.text+0x184bcae): undefined reference to `ftrace_events'
   ld: (.text+0x184bcc0): undefined reference to `ftrace_events'
   ld: (.text+0x184bce9): undefined reference to `ftrace_events'
>> ld: (.text+0x184bdbe): undefined reference to `remove_event_from_tracers'
   ld: (.text+0x184be0f): undefined reference to `trace_event_sem'
   ld: (.text+0x184be1b): undefined reference to `trace_types_lock'
>> ld: (.text+0x184be27): undefined reference to `event_mutex'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
