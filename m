Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F2A78C9C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 06:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769840212; cv=none; b=exlW4XFARJWPX2VggYxBprzYRDy8onZJP7m4Yu9wnA8xzY7ZeXWvkwpFUORKTf7mji+uIyc0D0V4LGGT8AMCLJuW3j66ykbliDK0rWBZ4o25DoIe4NmmDiFzlXaDPT5qC47EYivSvHqfg0RQrm/Jxq8X/oOZxL28Sjsdnzykgpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769840212; c=relaxed/simple;
	bh=3RolFhhe5W9KYhxXxihZeH43+Svm/sCEWNJ9p5Za7J0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BPO83JeoEJIsik6sZi6imLxpcBqBce+6t4OQ0teKG6h7dm3KPkFipDveTs8oung/pMa8ymWQo5Ej9t8VBNQyeEshwtoQ8vnWQb6SMiuYpLEoz8TXmWY2V56IvrW6DycTrnQcDBBAf8NQkooIbbAUpWl6PBYB8QFV7zYIYKOVkIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOrwK2pv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOrwK2pv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769840211; x=1801376211;
  h=date:from:to:cc:subject:message-id;
  bh=3RolFhhe5W9KYhxXxihZeH43+Svm/sCEWNJ9p5Za7J0=;
  b=eOrwK2pv1ImMHrkc4GMWtiXXFcL5vJSy9pa9sNzKvJZzFZ1SHEUw2Q1J
   dv7VLs0MBNImMp5+t57r/N9rQgK6F93R8XkNDioyEbdNxoDfXi+zAGF9U
   kOxqy0gYEWOIw5cZ8MOjA9f1BhP3+qyDiDHYKdqHco7AjUBQxDzte7bHz
   1yfq4Eov5MpwCTnk23a8UIRGzjHYstLx85pgl87ILPFh70jXyGKsm+WiN
   l3CoL3fdlWz2EMq5Mvz81RkwZ5epKP5OxVGCmbVAEVpUYzA40Q1mLrhEZ
   BSy7oB15EHwzo4sEBWJyiUr9CSVSHfhjANyONwnJLpGaOZabD76P5TrUv
   A==;
X-CSE-ConnectionGUID: REwzhBeES7m4OGgS1Aahvw==
X-CSE-MsgGUID: ULiWAxq7T5ajF81mn2sZWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70985256"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="70985256"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 22:16:50 -0800
X-CSE-ConnectionGUID: 2HKApd1aSgm53AazVgDvPw==
X-CSE-MsgGUID: eoHkKDgrTfao/qOweBFoSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213966727"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Jan 2026 22:16:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm4Hm-00000000diK-1nRB;
	Sat, 31 Jan 2026 06:16:46 +0000
Date: Sat, 31 Jan 2026 14:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 1/12]
 kernel/bpf/trampoline.c:448:34: error: variable has incomplete type 'struct
 bpf_trampoline_ops'
Message-ID: <202601311425.S91vyn1N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 9ecb3af28fc9354376aac0f9645ff70b637c067b [1/12] bpf: Add struct bpf_trampoline_ops object
config: s390-randconfig-r134-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311425.S91vyn1N-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311425.S91vyn1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311425.S91vyn1N-lkp@intel.com/

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
