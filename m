Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F552AF1B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717288; cv=none; b=Ej1ikhPC7ZMD8Q6r8aUSrCuGlWhDtxtZQ/E/Rhlzv8syoLFO6lBurFr0D6OIiBghoToHMO3zXGiC566RRhb82Xmf2rLhH73CayXi6f09rN0cj9t0g0dxJ5qVWZxcPy6YBp3h2JM+P5R47Fx3z8F0wSWA6LOFZ/EhdAGbD0KRzXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717288; c=relaxed/simple;
	bh=AvD8VFBzB8NTVOP9PeLL3DlF4+D1xqGlMF/h+xbA24A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uz6TqeEDfoGjQ0wU2cRqnNRvqlWTmhcOwFK9W1weWjeJxG8OKVjEg5Jc83AjYwpSZEAgiJ0Rr2eYRl1LNzIDTQxFr1a6s29c76ZyChbTdSwmYwbcloY9H1uZUTjuIwIrbQoO9uSLALoW+kUVmQDaXYnaXOnFvsRHZyfCbvGlrRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aeCEl9JT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aeCEl9JT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717287; x=1765253287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AvD8VFBzB8NTVOP9PeLL3DlF4+D1xqGlMF/h+xbA24A=;
  b=aeCEl9JT3SccKYkRykoy5QInaABHRhiiUE4jbZnrAyxJFU6srOXg1FB6
   UHEVAVT2gJIuRmo0RtCfkQXoBFdL2xcoh9p/CKqty1L1gwFz1cu52xzma
   2kEpcxVwXyc3E+HinYSnWpVIXjoViKplIpuL9ulVL8u3nsWPqTBaQ7G5H
   hBw/8JwK0aPpXZwNqW58oXMCH7KF7l/6EAJk+jb7ZFbi1DLVkvS3mr4cR
   0lRhGeJxNZmmjK8vcd3dbF6qYNgE78t4ONPNh4vaekCcE1fmzUS4tnxan
   PacFtIh2DbF9mogbFOyHXfZLnbdabYHqsDnPoZsPd84n9SF1aZfLWRvHM
   w==;
X-CSE-ConnectionGUID: nyCKenMlQJOI/qny+9X94A==
X-CSE-MsgGUID: vdnvRKCwT5Sq8faxN5ZneA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34121831"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34121831"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:08:06 -0800
X-CSE-ConnectionGUID: yrhKP/i0Q62VTCxnIzGXzA==
X-CSE-MsgGUID: d6Z506dkRgGPs2obKxlMEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99400242"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2024 20:08:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV3z-0003nB-1D;
	Mon, 09 Dec 2024 04:08:03 +0000
Date: Mon, 9 Dec 2024 12:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/5]
 include/trace/hooks/logbuf.h:15:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202412071355.hbZ0Xl1t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   f10cf63d3ff9411bbd227f76d9ac8f4ca543918e
commit: 9b44f2fb794ccd5a17777e317bec959558d21f9e [1/5] ANDROID: vendor_hooks:add restricted hook for logbuf
config: i386-randconfig-062 (https://download.01.org/0day-ci/archive/20241207/202412071355.hbZ0Xl1t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071355.hbZ0Xl1t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071355.hbZ0Xl1t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/printk/printk.c:293:5: sparse: sparse: context imbalance in 'console_srcu_read_lock' - wrong count at exit
   kernel/printk/printk.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:301:9: sparse: sparse: context imbalance in 'console_srcu_read_unlock' - unexpected unlock
   kernel/printk/printk.c: note: in included file:
>> include/trace/hooks/logbuf.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/logbuf.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/logbuf.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +15 include/trace/hooks/logbuf.h

    14	
  > 15	DECLARE_RESTRICTED_HOOK(android_rvh_logbuf,
    16		TP_PROTO(struct printk_ringbuffer *rb, struct printk_record *r),
    17		TP_ARGS(rb, r), true)
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
