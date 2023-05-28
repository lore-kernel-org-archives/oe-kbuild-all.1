Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FA139F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 03:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685244479; x=1716780479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VyUhjtgOYHLXtgjklNjP9XbB5Fo2mhBkpMEIK310d70=;
  b=WS8SBfK7gcYTtxU7CsVVvDY3jENGTdXxzh5j4LLob58wFDV912bkRPk2
   b90wgUPH4j2sC4A4fzLN7x2WO0sY1xG2CaYVDdV2an0HfVF8p3BCRp6/y
   K/5b26VCllNu7AyvKwh4oUya20U15icaw03VpvyzMQFnpFao+hF3XDi6/
   vSMN98EdD6pq4kSjq+FtJHdRPKCk6ZIfpD0OZ1ocPXxn7e+3ThaxmPD4V
   BNmsIS3jKJhwhyCuNmAJSP0Me1HFO62s7w0Cp8lsddabgC6vsLQnmaFWu
   veHHoJ/vAk+QSRGDXHxEkZqRnMkJXcjHKOuqSQ1wQduukJO2f6+OJkFHo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="351978955"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="351978955"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 20:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="736441690"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="736441690"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 May 2023 20:27:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q374S-000KPA-2n;
	Sun, 28 May 2023 03:27:52 +0000
Date: Sun, 28 May 2023 11:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 17056/20126]
 include/trace/hooks/dmabuf.h:31:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202305281155.DH3Cv1Hj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   1247e4a9ca826161b8c13c6422a56ed008dc4de5
commit: 34e03c38fd1e3735818fbb4ef7f1e9320483e544 [17056/20126] ANDROID: dma-buf: Add vendor hook for deferred dmabuf sysfs stats release
config: i386-randconfig-s001-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281155.DH3Cv1Hj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15
        git checkout 34e03c38fd1e3735818fbb4ef7f1e9320483e544
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/android/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281155.DH3Cv1Hj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/trace/hooks/cgroup.h:55:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:59:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:59:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:59:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/iommu.h):
   include/trace/hooks/iommu.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/net.h):
   include/trace/hooks/net.h:29:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:29:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:29:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:31:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:33:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:33:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:33:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:35:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:35:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:35:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/vmscan.h):
   include/trace/hooks/vmscan.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/vmscan.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/avc.h):
   include/trace/hooks/avc.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/avc.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/avc.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/avc.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/creds.h):
   include/trace/hooks/creds.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:30:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:30:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:30:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:34:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:34:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:34:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/bug.h):
   include/trace/hooks/bug.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/bug.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/bug.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/fault.h):
   include/trace/hooks/fault.h:16:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:16:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:16:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/traps.h):
   include/trace/hooks/traps.h:16:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:16:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:16:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:30:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:30:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:30:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:34:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:34:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:34:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/timekeeping.h):
   include/trace/hooks/timekeeping.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/timekeeping.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/timekeeping.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/audio_usboffload.h):
   include/trace/hooks/audio_usboffload.h:38:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/audio_usboffload.h:38:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/audio_usboffload.h:38:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/psci.h):
   include/trace/hooks/psci.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/psci.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/psci.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/psci.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/psci.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/psci.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/dmabuf.h):
>> include/trace/hooks/dmabuf.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dmabuf.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dmabuf.h:31:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mmc.h):
   include/trace/hooks/mmc.h:55:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mmc.h:55:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mmc.h:55:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mmc.h:59:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mmc.h:59:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mmc.h:59:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mmc.h:75:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mmc.h:75:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mmc.h:75:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mmc.h:79:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mmc.h:79:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mmc.h:79:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mmc.h:83:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mmc.h:83:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mmc.h:83:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +31 include/trace/hooks/dmabuf.h

    19	
    20	DECLARE_HOOK(android_vh_dma_buf_release,
    21			TP_PROTO(struct dma_buf *data),
    22			TP_ARGS(data));
    23	
    24	struct dma_heap;
    25	DECLARE_HOOK(android_vh_dmabuf_heap_flags_validation,
    26			TP_PROTO(struct dma_heap *heap, size_t len,
    27				unsigned int fd_flags, unsigned int heap_flags, bool *skip),
    28			TP_ARGS(heap, len, fd_flags, heap_flags, skip));
    29	
    30	struct dma_buf_sysfs_entry;
  > 31	DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
