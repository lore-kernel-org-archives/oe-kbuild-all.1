Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C894821A444
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 05:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769838497; cv=none; b=o/y7fjDct6iUf1GJ1QhnfVPHqZ47zlx5lQIrO2zPtrjuuFQjwto4FiSz6rImZzt3NYSjPmta8dU7u4RYyKn2gphkEeV16DF++jxB4y2p5Lygy1xJ9408WOLLH6eNOiWjAVOQr5qklBm/zLj6cC6Py9xok3cRsXVA3CUs3xACZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769838497; c=relaxed/simple;
	bh=OxxbnOjzPQjpb/dORxaDpHatzSY5T/87l/1DtUbKS00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R/4Q3ekvRH30J7fQSMWAE8VAXN/uILuvYq2S0Uy1Dg2EI9IMMtpBe9gNhlFa61k9SOFyp0u3VbsPj9A1UTdGIOsUL3ELnH2bRUM51UuqgkU8UbB1O0sB1niU4YqiJEReCcVKCSZN/g2AQ+vpxp5atF58GyZKfbQMIWNPNkZgYo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRkgHnHI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRkgHnHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769838495; x=1801374495;
  h=date:from:to:cc:subject:message-id;
  bh=OxxbnOjzPQjpb/dORxaDpHatzSY5T/87l/1DtUbKS00=;
  b=mRkgHnHICuLV0kutpfH9GBP3BULmPYwpCo+BdfTDy/oyT7mp8UuuaFqV
   YPwOLbwY+KcDA/BKz8+g9MbgA/LYSANrW0w5et7rVaG3qH9GJL08WQJNz
   8/7GLreVrHW1GWIwVbN/kO7MPEQGCVM+i9+VvfjPl73ZCYqf0Ltm6P0fR
   aDJIW+YxMq8dZEl1YTxabnnQl6vdKelHnUyhLFqw6qKvId8ed8z2fjp3w
   duJeQ9f7NDqfF+SKCL/XIrCkkzYPXQkmGnJ+LFDXahmiaMyZWHqn+R9lq
   B6g8MqkAw0SPZMeVe5WG7vSmYsExGwYv/UkRCgE1mGYhOaNwtBsLf4YAL
   Q==;
X-CSE-ConnectionGUID: 6piAUiAJRlChGMRXV7wUQg==
X-CSE-MsgGUID: fiY9D9q/TdWpgBqZrFwl0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="74946622"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="74946622"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 21:48:15 -0800
X-CSE-ConnectionGUID: 179zo/qDS8au2/2hl6V/9A==
X-CSE-MsgGUID: SiOkQe8IS2+QKXkdFKU75A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213553676"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 30 Jan 2026 21:48:14 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm3q7-000000002en-1iVS;
	Sat, 31 Jan 2026 05:48:11 +0000
Date: Sat, 31 Jan 2026 06:47:34 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 1/12]
 kernel/bpf/trampoline.c:448:34: error: variable has incomplete type 'struct
 bpf_trampoline_ops'
Message-ID: <202601310604.kd2AINHg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 9ecb3af28fc9354376aac0f9645ff70b637c067b [1/12] bpf: Add struct bpf_trampoline_ops object
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260131/202601310604.kd2AINHg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310604.kd2AINHg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310604.kd2AINHg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:448:34: error: variable has incomplete type 'struct bpf_trampoline_ops'
     448 | static struct bpf_trampoline_ops trampoline_ops = {
         |                                  ^
   kernel/bpf/trampoline.c:448:15: note: forward declaration of 'struct bpf_trampoline_ops'
     448 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^
>> kernel/bpf/trampoline.c:710:12: error: incomplete definition of type 'struct bpf_trampoline_ops'
     710 |                 err = ops->register_fentry(tr, im->image, data);
         |                       ~~~^
   kernel/bpf/trampoline.c:448:15: note: forward declaration of 'struct bpf_trampoline_ops'
     448 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^
   2 errors generated.


vim +448 kernel/bpf/trampoline.c

   447	
 > 448	static struct bpf_trampoline_ops trampoline_ops = {
   449		.register_fentry   = register_fentry,
   450		.unregister_fentry = unregister_fentry,
   451		.modify_fentry     = modify_fentry,
   452	};
   453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
