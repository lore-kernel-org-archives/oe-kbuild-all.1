Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7781553A3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 07:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755244249; cv=none; b=Wtk7bEouVCRPXrSk906Og9H8NoChAkwhocLZMnCwn8xExiK6rPAaOuQ+OsClXAc3UYC57Ea2A9r10mRqpnh8DYbj2phugEx20URohfkNR0eLcx5VCCNP3AW/ROsDqR2NbIc3OmvDZZc/ujbUquMrZORr28gjypIxVAsv/gFCaO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755244249; c=relaxed/simple;
	bh=1B+9oD7zLQoSorQDHgWb6w66NNH6cMHuTix714juQ34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YCahVORBR3vmj4JhKa63qwPY5BOmhWd270D1uzFhIY9SYsso9P0WtoTRku3gNQ1nG7PNB9X9LbCjZjc8rud2E8hABxZAXiDz090ep15q1NM0uamDiI8rqB0IoAzdLgFQq0xs1pofBQWa4N3mrhmOv5KenJwgkpBV5nRUNTi46to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5hx6Fz0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5hx6Fz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755244248; x=1786780248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1B+9oD7zLQoSorQDHgWb6w66NNH6cMHuTix714juQ34=;
  b=S5hx6Fz0gVEp9uR1/YPWn4O2h4xGHWLYSVLnemiq1AW3l+oXUnrNJm/F
   l3MgsXvVuTEGQ2uhf1ZNL92O3Yxs66SiQ7S1Q8ArNZLP2yfNRQT3/Y3Y5
   r8/YpCf/exc/vnnxxMG/G9HdRsv6bSUZqI22KYJLc7YxdGEAV0L6larPP
   SlU14H3KM/nwFl0FrfJPfP75xYGk92lGMF0amXKMkTZ/OB1qjwLBSP3Rc
   YV6JsYfRmSuHLBlx5dV8XmRFY24hB3iZ7T5+VFqVX7eWzX1oKnwr2zzlx
   l6D2NWNztc1o34azkDOWKmZbxwR/f8snfZkJW/1Lk6aIj2/dcJckbJsE1
   Q==;
X-CSE-ConnectionGUID: pPsECN8rT5ukSAAHRnDImg==
X-CSE-MsgGUID: FmQ48+1JS+y5zMNyMxLOCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57640796"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57640796"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 00:50:47 -0700
X-CSE-ConnectionGUID: ILJCrfgzRDyjaZbaI9D/Nw==
X-CSE-MsgGUID: k2C2PzyZS2e7w6A0UDSORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="190673369"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 15 Aug 2025 00:50:46 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umpD2-0000Sx-0M;
	Fri, 15 Aug 2025 07:50:44 +0000
Date: Fri, 15 Aug 2025 09:49:51 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-06 1/1]
 arch/arm64/kvm/hyp/nvhe/trace.c:174:15: warning: no previous prototype for
 function 'rb_event_size'
Message-ID: <202508150934.6N1uplc0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-06
head:   5910c573b38832743bde0987dc8cacd8a09ebbc3
commit: 794f874404060e7e14863872950b53e6a7aa9b68 [1/1] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-randconfig-2002-20250814 (https://download.01.org/0day-ci/archive/20250815/202508150934.6N1uplc0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7d886fab74d4037d654d02bed24dd97c0ba863d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150934.6N1uplc0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150934.6N1uplc0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/trace.c:7:
   In file included from arch/arm64/kvm/hyp/include/nvhe/clock.h:6:
   In file included from arch/arm64/include/asm/kvm_hyp.h:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/arm64/kvm/hyp/nvhe/trace.c:134:49: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     134 |         struct hyp_buffer_page *tail_page, *new_tail, *new_head;
         |                                                        ^
>> arch/arm64/kvm/hyp/nvhe/trace.c:174:15: warning: no previous prototype for function 'rb_event_size' [-Wmissing-prototypes]
     174 | unsigned long rb_event_size(unsigned long length)
         |               ^
   arch/arm64/kvm/hyp/nvhe/trace.c:174:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     174 | unsigned long rb_event_size(unsigned long length)
         | ^
         | static 
   3 warnings generated.


vim +/rb_event_size +174 arch/arm64/kvm/hyp/nvhe/trace.c

   173	
 > 174	unsigned long rb_event_size(unsigned long length)
   175	{
   176		struct ring_buffer_event *event;
   177	
   178		return length + RB_EVNT_HDR_SIZE + sizeof(event->array[0]);
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
