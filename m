Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50017168A2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jan 2024 20:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iv6YO26c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704227764; x=1735763764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3yc/f0lAaTIul6rZRpxQaMlnWdbqNR1jHoMBfwUYFZo=;
  b=Iv6YO26cHytMfeS4BPg0XbTE7SOOKt59B/GvBrcmNJ0uc/vbqPZP8kyI
   HMPMQig2jmGYo+9PkT9Y8539rveZ/s7fWWs+cUG8phAH2mFplH4uuYKkj
   xZ39037Gh6xfZNbtRwjIxc1og7UlgPA+v49IgLKYS/qxtL73Edh/YHYOz
   0d8yMeKeZ3K9COL8XHSoyD7dVp6OOnvqWWChGUClouLL2ip3TlVImlk9o
   zNF+5QVf5aamb/cv7ZCYqXK07h8UWmwVXQbLactrMJRQodESyD8OYI2p1
   jlP2OtBFl/sSd0oaC2YBsNjFKLyAfVo3sUXE/KTwgJBMqcJ/lzaFQ50BX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="387372220"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="387372220"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 12:36:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="1026877756"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="1026877756"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 02 Jan 2024 12:36:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKlUW-000LS8-0d;
	Tue, 02 Jan 2024 20:36:00 +0000
Date: Wed, 3 Jan 2024 04:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:misc 1/2] ld.lld: error: duplicate symbol:
 bpf_user_writable_register
Message-ID: <202401030418.8Xt6JhLw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git misc
head:   20d435f75e5c821a24146995afca94cdcf6a4d34
commit: 5214acb8d02febb2238f4f74dc27cf5bc460c206 [1/2] bpf: Introduce bpf_probe_write_user_registered()
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240103/202401030418.8Xt6JhLw-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project baf8a39aaf8b61a38b5b2b5591deb765e42eb00b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401030418.8Xt6JhLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401030418.8Xt6JhLw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: bpf_user_writable_register
   >>> defined at bpf.h:2745 (include/linux/bpf.h:2745)
   >>>            kernel/fork.o:(bpf_user_writable_register) in archive vmlinux.a
   >>> defined at bpf.h:2745 (include/linux/bpf.h:2745)
   >>>            kernel/sysctl.o:(.ltext+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_user_writable_unregister
   >>> defined at bpf.h:2750 (include/linux/bpf.h:2750)
   >>>            kernel/fork.o:(bpf_user_writable_unregister) in archive vmlinux.a
   >>> defined at bpf.h:2750 (include/linux/bpf.h:2750)
   >>>            kernel/sysctl.o:(.ltext+0xB) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_user_writable_unregister
   >>> defined at bpf.h:2750 (include/linux/bpf.h:2750)
   >>>            kernel/fork.o:(bpf_user_writable_unregister) in archive vmlinux.a
   >>> defined at bpf.h:2750 (include/linux/bpf.h:2750)
   >>>            kernel/kallsyms.o:(.ltext+0xB) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_user_writable_free
   >>> defined at bpf.h:2755 (include/linux/bpf.h:2755)
   >>>            kernel/fork.o:(bpf_user_writable_free) in archive vmlinux.a
   >>> defined at bpf.h:2755 (include/linux/bpf.h:2755)
   >>>            kernel/kallsyms.o:(.ltext+0x16) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_user_writable_register
   >>> defined at bpf.h:2745 (include/linux/bpf.h:2745)
   >>>            kernel/fork.o:(bpf_user_writable_register) in archive vmlinux.a
   >>> defined at bpf.h:2745 (include/linux/bpf.h:2745)
   >>>            kernel/cgroup/cgroup.o:(.ltext+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_user_writable_unregister
   >>> defined at bpf.h:2750 (include/linux/bpf.h:2750)
   >>>            kernel/fork.o:(bpf_user_writable_unregister) in archive vmlinux.a
   >>> defined at bpf.h:2750 (include/linux/bpf.h:2750)
   >>>            kernel/cgroup/cgroup.o:(.ltext+0xB) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_user_writable_free
   >>> defined at bpf.h:2755 (include/linux/bpf.h:2755)
   >>>            kernel/fork.o:(bpf_user_writable_free) in archive vmlinux.a
   >>> defined at bpf.h:2755 (include/linux/bpf.h:2755)
   >>>            kernel/cgroup/cgroup.o:(.ltext+0x16) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_user_writable_register
   >>> defined at bpf.h:2745 (include/linux/bpf.h:2745)
   >>>            kernel/fork.o:(bpf_user_writable_register) in archive vmlinux.a
   >>> defined at bpf.h:2745 (include/linux/bpf.h:2745)
   >>>            kernel/cgroup/rstat.o:(.ltext+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_user_writable_unregister
   >>> defined at bpf.h:2750 (include/linux/bpf.h:2750)
   >>>            kernel/fork.o:(bpf_user_writable_unregister) in archive vmlinux.a
   >>> defined at bpf.h:2750 (include/linux/bpf.h:2750)
   >>>            kernel/cgroup/rstat.o:(.ltext+0xB) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_user_writable_free
   >>> defined at bpf.h:2755 (include/linux/bpf.h:2755)
   >>>            kernel/fork.o:(bpf_user_writable_free) in archive vmlinux.a
   >>> defined at bpf.h:2755 (include/linux/bpf.h:2755)
   >>>            kernel/cgroup/rstat.o:(.ltext+0x16) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: bpf_user_writable_register
   >>> defined at bpf.h:2745 (include/linux/bpf.h:2745)
   >>>            kernel/fork.o:(bpf_user_writable_register) in archive vmlinux.a
   >>> defined at bpf.h:2745 (include/linux/bpf.h:2745)
   >>>            kernel/seccomp.o:(.ltext+0x0) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
