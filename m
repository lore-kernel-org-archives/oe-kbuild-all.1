Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CC737269B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772781612; cv=none; b=TogKU0mpiDuw787zPKNRTqyRAGUa+Qyap1nS2t2RMP3gZRIicjJsNSipdODa39hSm1MPGw3jNIucK88SYy0Qu7wIqN/VUS3EcfJszOdvrOHQWa97WEkfH81A08qMD/ILbByjiSwBAqG5V52H95tY9IMFZav4zvPa4E3pRtFSOHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772781612; c=relaxed/simple;
	bh=oVJGY8cTr56hMX/1ghan0l02GOWZAGqHdZdqcFnq1Aw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M0IR01g6n6vKhUb6MFUl07i+RzKk3HXzcsnDGtZ+QHE0YbxUOS9wwV5LYqf76GHNwuC8ErhdsTtuBDSPfilZkiWlRwI3n6YgxLgWzCJpsHmXlj7+mAGSTyCmWi5CdzrzoPnLVlKbGK9XLtZkdL+6x5Mdj58CzgMc0Xjg64Zdjb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lfCDQE+o; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lfCDQE+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772781610; x=1804317610;
  h=date:from:to:cc:subject:message-id;
  bh=oVJGY8cTr56hMX/1ghan0l02GOWZAGqHdZdqcFnq1Aw=;
  b=lfCDQE+o5JMy2b/u5B1h3EUoHbIz80OMkU4qmWO7hLg8x8KSfUVG1sGT
   b06xXHb9wRaplerJ2WuM65PH9j03cF70DxIjD5a0JIH131SpI9TnISuAx
   RemtUGfn1pcyVqwfCw9ZUc7XV9f+WaC1u/02BS5y4HUGFyOoogEYZu4KL
   Lq2x05RpGATl2tTckxQKiCznyDPjgTyCNYKhqt9UGnfs4d7SlwhtiTeLM
   ruZpwcCGI7rS2G3iMp5XP/KBT2rtNDMjjY89Lr9EaDhq9/H1mPKx6oBe8
   KVP761MfXquxt2jZ9cdp9xf6d1OrCpUVJRyKsclkh55R5idLC9UaCD06G
   Q==;
X-CSE-ConnectionGUID: IcBe8oCNS56h65i/by0eIg==
X-CSE-MsgGUID: 0sKdnZ89R6unnRva05LOJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77487001"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="77487001"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:20:10 -0800
X-CSE-ConnectionGUID: RJsYAZ+TRFCKrdgEPqgIIA==
X-CSE-MsgGUID: Vtal2LC6TbeQZFpORzfltQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="249407018"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 23:20:09 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyPTi-000000000Vd-1C5x;
	Fri, 06 Mar 2026 07:20:06 +0000
Date: Fri, 06 Mar 2026 15:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_bpf_monitors 20/29]
 kernel/trace/rv/rv_bpf.c:126:31: error: call to undeclared function
 'get_monitor_mdef_by_name'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202603061543.rxe2AO3k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_bpf_monitors
head:   3a153b8189ae2fb3a1e680f5092df636abbdac56
commit: 5c96c9aebafa7460b9d4335f84f4f643747750d8 [20/29] rv: Add reactors support to BPF monitors
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260306/202603061543.rxe2AO3k-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061543.rxe2AO3k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061543.rxe2AO3k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/rv/rv_bpf.c:126:31: error: call to undeclared function 'get_monitor_mdef_by_name'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct rv_monitor *monitor = get_monitor_mdef_by_name(name__str);
                                        ^
>> kernel/trace/rv/rv_bpf.c:126:21: error: incompatible integer to pointer conversion initializing 'struct rv_monitor *' with an expression of type 'int' [-Wint-conversion]
           struct rv_monitor *monitor = get_monitor_mdef_by_name(name__str);
                              ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/get_monitor_mdef_by_name +126 kernel/trace/rv/rv_bpf.c

   115	
   116	/**
   117	 * bpf_rv_react - trigger a reactor from BPF
   118	 * @name: monitor name
   119	 * @msg: pre-formatted message string
   120	 *
   121	 * This kfunc allows BPF monitors to trigger reactors with a message.
   122	 * The message should be pre-formatted by the BPF program using bpf_snprintf.
   123	 */
   124	__bpf_kfunc void bpf_rv_react(char *name__str, char *msg)
   125	{
 > 126		struct rv_monitor *monitor = get_monitor_mdef_by_name(name__str);
   127	
   128		if (monitor)
   129			rv_react(monitor, "%s", msg);
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
