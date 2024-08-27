Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19EF77117
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 19:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724786956; cv=none; b=ITEd/sXmU3ohJ52h3EymBR18QgZqBelLlNdsJ6KBZzoWv/V3wKFGBUejbdEXWNe+4WTzsDj2qq0I8BpZa/TWdQc41QzhtdifDFH7zZHzCVOpNHzrZQyG8vUIvglVxek1j7sB1GkR0utVsBiE0Eqo7rRwtQWhbdH+bS7JsGVVwQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724786956; c=relaxed/simple;
	bh=uH0YovJZwXVaptapODvOqbC+uSTPzIjlp9GmVLd0ypg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SoMzF5PxiuufqfUBsYun1sI+Mb9e4ZKTLf6stpL0On1+ydmifg5ltTn/bckiQg5o6RGp/TSdHx7kEGjEWfauSOozFSyg4WvEpfm/gPoMVAXqZADKv1LJbdkbWh2k94dmTbGtJYfBkhLM+/0/POp4GGV/SmPzEIBn1W1XrHw9Tb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPBl0pTj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPBl0pTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724786954; x=1756322954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uH0YovJZwXVaptapODvOqbC+uSTPzIjlp9GmVLd0ypg=;
  b=CPBl0pTjO9nGfOPTe/03q2pjCZlor1HED4HFXQI2TH6eJ4A8WDWUtbwa
   W+mpAhiwv2aME4JzZKBFnMZ4MlujR//6yNemTpODF9/2YCkTLOJLSdHEU
   6WBtK2O6lAO2ujqaTIAkRcXdD2ReXrkuOFbKwiljY2bqXnYY8X8dVXRA3
   6XgSN2JggrRN/ItCga2q2YjO69a1UStfPt/QfnjvZFyfC0tAJbslvl79Y
   Nwx0WH2YvSux5rHt/mIW8efd47lMEndThDnXY0FKtZeK634X+zRVvAn0s
   L8kmkc7ygtxn3Pmgz35vQ4jAhZRe8ECjqRnmuLWm2wCszhSvgIH97er8n
   w==;
X-CSE-ConnectionGUID: ky4qgyU4R9CMfXMGfswo0g==
X-CSE-MsgGUID: 2M4vMvSLSs+LXQM0yxW/OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="33861374"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="33861374"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 12:29:14 -0700
X-CSE-ConnectionGUID: jvJC0cwhRJaMUiYqvPRd/Q==
X-CSE-MsgGUID: no8umO26T9it3A5WbwMVTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63283853"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Aug 2024 12:29:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj1sL-000K0I-1r;
	Tue, 27 Aug 2024 19:29:09 +0000
Date: Wed, 28 Aug 2024 03:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17249/23564] kernel/.tmp_kprobes.o:
 warning: objtool: register_kprobe()+0x6d4: unreachable instruction
Message-ID: <202408280332.EuYU3ttl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   73a86ad60aabf460a4c8a0f96a1b2ddb98522fd8
commit: 388c9a84a807812e7226e0e1ca606563e14a7f5a [17249/23564] kprobes: Warn if the kprobe is reregistered
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240828/202408280332.EuYU3ttl-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280332.EuYU3ttl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280332.EuYU3ttl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kprobes.c:120:14: warning: no previous prototype for function 'alloc_insn_page' [-Wmissing-prototypes]
     120 | void __weak *alloc_insn_page(void)
         |              ^
   kernel/kprobes.c:120:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     120 | void __weak *alloc_insn_page(void)
         | ^
         | static 
   kernel/kprobes.c:125:13: warning: no previous prototype for function 'free_insn_page' [-Wmissing-prototypes]
     125 | void __weak free_insn_page(void *page)
         |             ^
   kernel/kprobes.c:125:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     125 | void __weak free_insn_page(void *page)
         | ^
         | static 
   2 warnings generated.
   kernel/kprobes.c:145: warning: Function parameter or member 'c' not described in '__get_insn_slot'
>> kernel/.tmp_kprobes.o: warning: objtool: register_kprobe()+0x6d4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
