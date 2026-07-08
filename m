Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C413DEAC3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501529; cv=none; b=rnoa7qKdSiWQ2w5AjK2njDcqfBTXp9Qw49FWspXaoKZH5/CnUvoSYSzYtQrBNLqYIi0r9NWbk3KgQjO8ErNWAq9jrpcBiH7ff/BqcOX16f+2NrWDmRyqd3LKuM8EkWDM6vLuira+RcmMVT/iWKlOFdd3RUxxAa3p7GNjk99h07M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501529; c=relaxed/simple;
	bh=EgiwreYYIoZYLs9c1+YGldAAsQedP9Jh1F4cmJhQoy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cc0TFPJptdMBZMaf5XIhrzqbA4w4A4BD2mBOeWY+evGDZj21mZr/vstOv1tjio9wRdB72z38j6d7U7bA3xJ3V3jkLpZF1jn9W4ZPmkqEO9Ow7XGn28wdTamCsPRionfut7g3yvICzMQ4Ji3NRLC7PHjvAz2JroHm3+a8zISDay0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDaffJs+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDaffJs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783501527; x=1815037527;
  h=date:from:to:cc:subject:message-id;
  bh=EgiwreYYIoZYLs9c1+YGldAAsQedP9Jh1F4cmJhQoy4=;
  b=TDaffJs+18IvwCPJWKmqrheqCf179bH7ZJxO3P9fl8bhOjVjHlkWvs3f
   nfHZ6DzImDXXSEqf0Py1vVUlpbqAzSgP2jSOYp5CbtElZyaz0EoLeGVgk
   wK75M+urOym0okDxKLQuuc93fr8GU0on3B0Va6Uai60VS4/nn8AdpOoiS
   ojErSgtMQs2sMCHVEpc6wijngixah+fvLDJNafVmveW9S90PjIS66DGTj
   9H426YgMNvF5qDwjndAPdNjaW6q34G0VjCQJ5Ptum/3WHbIVehS+QKh4Y
   wLLXfMd3c4CGboLmTAQOU4n+pFkv7pgoBIjpe2y6DQGpCEVRegE2UiWUS
   A==;
X-CSE-ConnectionGUID: cfeUdU17RFqO14bXE5W5Gw==
X-CSE-MsgGUID: +KdzGZ8wQQa+w4YGR/GyiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="95673736"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95673736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 02:05:27 -0700
X-CSE-ConnectionGUID: omdqSJ+PSaisbtSdTl5HNQ==
X-CSE-MsgGUID: 719LtlAQTYytFJHa4BFLwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="247867883"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jul 2026 02:05:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whODa-00000000GC7-3UWT;
	Wed, 08 Jul 2026 09:05:22 +0000
Date: Wed, 08 Jul 2026 17:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-07 1/1]
 kernel/trace/bpf_trace.c:3110:10: warning: default initialization of an
 object of type 'typeof ((attr->link_create.uprobe_multi.path))' (aka 'const
 unsigned long long') leaves the object uninitialized
Message-ID: <202607081745.ZXvZMKw9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jiri,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-07
head:   37d6d309e99289fe4afaf756aa8d98a11d1642f3
commit: 89ae89f53d201143560f1e9ed4bfa62eee34f88e [1/1] bpf: Add multi uprobe link
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260708/202607081745.ZXvZMKw9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081745.ZXvZMKw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 89ae89f53d20 ("bpf: Add multi uprobe link")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081745.ZXvZMKw9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/bpf_trace.c:3110:10: warning: default initialization of an object of type 'typeof ((attr->link_create.uprobe_multi.path))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    3110 |         upath = u64_to_user_ptr(attr->link_create.uprobe_multi.path);
         |                 ^
   include/linux/kernel.h:62:2: note: expanded from macro 'u64_to_user_ptr'
      62 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> kernel/trace/bpf_trace.c:3111:13: warning: default initialization of an object of type 'typeof ((attr->link_create.uprobe_multi.offsets))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    3111 |         uoffsets = u64_to_user_ptr(attr->link_create.uprobe_multi.offsets);
         |                    ^
   include/linux/kernel.h:62:2: note: expanded from macro 'u64_to_user_ptr'
      62 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> kernel/trace/bpf_trace.c:3117:21: warning: default initialization of an object of type 'typeof ((attr->link_create.uprobe_multi.ref_ctr_offsets))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    3117 |         uref_ctr_offsets = u64_to_user_ptr(attr->link_create.uprobe_multi.ref_ctr_offsets);
         |                            ^
   include/linux/kernel.h:62:2: note: expanded from macro 'u64_to_user_ptr'
      62 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   3 warnings generated.


vim +3110 kernel/trace/bpf_trace.c

  3080	
  3081	int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
  3082	{
  3083		struct bpf_uprobe_multi_link *link = NULL;
  3084		unsigned long __user *uref_ctr_offsets;
  3085		unsigned long *ref_ctr_offsets = NULL;
  3086		struct bpf_link_primer link_primer;
  3087		struct bpf_uprobe *uprobes = NULL;
  3088		unsigned long __user *uoffsets;
  3089		void __user *upath;
  3090		u32 flags, cnt, i;
  3091		struct path path;
  3092		char *name;
  3093		int err;
  3094	
  3095		/* no support for 32bit archs yet */
  3096		if (sizeof(u64) != sizeof(void *))
  3097			return -EOPNOTSUPP;
  3098	
  3099		if (prog->expected_attach_type != BPF_TRACE_UPROBE_MULTI)
  3100			return -EINVAL;
  3101	
  3102		flags = attr->link_create.uprobe_multi.flags;
  3103		if (flags & ~BPF_F_UPROBE_MULTI_RETURN)
  3104			return -EINVAL;
  3105	
  3106		/*
  3107		 * path, offsets and cnt are mandatory,
  3108		 * ref_ctr_offsets is optional
  3109		 */
> 3110		upath = u64_to_user_ptr(attr->link_create.uprobe_multi.path);
> 3111		uoffsets = u64_to_user_ptr(attr->link_create.uprobe_multi.offsets);
  3112		cnt = attr->link_create.uprobe_multi.cnt;
  3113	
  3114		if (!upath || !uoffsets || !cnt)
  3115			return -EINVAL;
  3116	
> 3117		uref_ctr_offsets = u64_to_user_ptr(attr->link_create.uprobe_multi.ref_ctr_offsets);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
