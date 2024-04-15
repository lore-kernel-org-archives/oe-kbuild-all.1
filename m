Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DA580BFA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713197636; cv=none; b=l/A7WwdAh20R4Grq+mVjGSEZPRb/JzJjEiBD3iK1CITIaNil2x7wc7zfV1QJFReJsXvl6ua8Qso147lNgw2sh0XpQh1i7maSUgUNKq2QtyDuC8U5cEvdZn5MSqCiltiAhoCL98soafsdhV/x2HqIh1FgKW612PKs5gEmgD3g6mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713197636; c=relaxed/simple;
	bh=mDDEiJJakgCuydaMbQf6RTTmklMjdznkZEfHqgV/TF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lpoicvbP4l6zXhTAXHq4V7Rt/jDTcUq7En0o8+OWwFfLSR36sENKlNRqObXdYtHVfyg9lBIEKaJtaTS2p2eqN2m5XSjOH3hqTe56Wnysa4EVg5Ur7EF1qA958Qb6EoaDlNwj4aV29lhYavAwttibxe491iEcvmNdM0ffaMJwU4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyKNMwcI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyKNMwcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713197634; x=1744733634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mDDEiJJakgCuydaMbQf6RTTmklMjdznkZEfHqgV/TF4=;
  b=jyKNMwcIHwr7fz69lmaBNky3vr0Vss1GFp1jPFAgQXbuWtaM+serstLK
   D+kdFNrD63Vq9t1FSiz4wN2shLxVxNlKSgwk9A4KBH6CjcxgybVBnZxhZ
   lpCVpg6npAjMhvsv/iDPFJTz/s0+K6/AmD+yEqTjIgkl67Cpn2LTaOUYa
   /eDkiMktcfFYXCMCWG2Tq5GEokM2F7igUGawqChthcsa4DazZibklMblH
   a9GT6WQ7LIx6V6YvFSGfFEjaYIFPhuiOI6c+qyeJ5OQtf07aEqfajXWpb
   R0MUg86XOpE+wJpmBc7dTtpAWJ90NEUHYlVSYHxoQYz2Qo+MutaTFXvtP
   Q==;
X-CSE-ConnectionGUID: NLa2vq1HRlyL5PqV/Bf7hA==
X-CSE-MsgGUID: Ja8GiqXuSBuL9poU2WpW3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8512422"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8512422"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 09:13:54 -0700
X-CSE-ConnectionGUID: W9Q5L1G/Rai3EQslc1XeLA==
X-CSE-MsgGUID: gWFElJWdTxW6OPvE4spyFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="22030937"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Apr 2024 09:13:51 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwOxp-0004Nw-0N;
	Mon, 15 Apr 2024 16:13:49 +0000
Date: Tue, 16 Apr 2024 00:13:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 24/42] security/chromiumos/lsm.c:95:17:
 error: implicit declaration of function 'report'
Message-ID: <202404160043.0KPcwzdu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   158b46ebe0987a43e2aaf5ed61bb18fd7c8f6c96
commit: 9981e5680b18a511aa4e9fd303c70167b645d116 [24/42] CHROMIUM: security: Add a cmdline opt for overlayfs
config: x86_64-randconfig-r051-20240406 (https://download.01.org/0day-ci/archive/20240416/202404160043.0KPcwzdu-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160043.0KPcwzdu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160043.0KPcwzdu-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/chromiumos/lsm.c: In function 'chromiumos_security_sb_mount':
>> security/chromiumos/lsm.c:95:17: error: implicit declaration of function 'report' [-Werror=implicit-function-declaration]
      95 |                 report("sb_mount", path, "Overlayfs mounts prohibited");
         |                 ^~~~~~
   In file included from security/chromiumos/lsm.c:29:
   security/chromiumos/lsm.c: At top level:
   include/linux/lsm_hooks.h:2116:39: error: 'struct security_hook_heads' has no member named 'bpf'
    2116 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                       ^
   security/chromiumos/lsm.c:309:9: note: in expansion of macro 'LSM_HOOK_INIT'
     309 |         LSM_HOOK_INIT(bpf, chromiumos_bpf),
         |         ^~~~~~~~~~~~~
   security/chromiumos/lsm.c:309:23: error: 'union security_list_options' has no member named 'bpf'
     309 |         LSM_HOOK_INIT(bpf, chromiumos_bpf),
         |                       ^~~
   include/linux/lsm_hooks.h:2116:57: note: in definition of macro 'LSM_HOOK_INIT'
    2116 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                         ^~~~
   security/chromiumos/lsm.c:309:28: error: initialization of 'int (*)(const struct cred *)' from incompatible pointer type 'int (*)(int,  union bpf_attr *, unsigned int)' [-Werror=incompatible-pointer-types]
     309 |         LSM_HOOK_INIT(bpf, chromiumos_bpf),
         |                            ^~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:2116:64: note: in definition of macro 'LSM_HOOK_INIT'
    2116 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                                ^~~~
   security/chromiumos/lsm.c:309:28: note: (near initialization for 'chromiumos_security_hooks[5].hook.binder_set_context_mgr')
     309 |         LSM_HOOK_INIT(bpf, chromiumos_bpf),
         |                            ^~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:2116:64: note: in definition of macro 'LSM_HOOK_INIT'
    2116 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                                ^~~~
   cc1: all warnings being treated as errors


vim +/report +95 security/chromiumos/lsm.c

    88	
    89	static int chromiumos_security_sb_mount(const char *dev_name,
    90						const struct path *path,
    91						const char *type, unsigned long flags,
    92						void *data)
    93	{
    94		if (!allow_overlayfs && type && !strcmp(type, "overlay")) {
  > 95			report("sb_mount", path, "Overlayfs mounts prohibited");
    96			pr_notice("sb_mount dev=%s type=%s flags=%#lx\n",
    97				  dev_name, type, flags);
    98			return -EPERM;
    99		}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
