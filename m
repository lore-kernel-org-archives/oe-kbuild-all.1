Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2447620
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 00:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682211118; x=1713747118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nCT9YssBJ8AHAf9PbxHbMitivivmav0fmg9Bn0ztPAk=;
  b=ZAUBTe3jlyJ39+ef7zZ1iisNf2R+ZpMaDfwzkZxOpG43UQa5hEbdHUw2
   Lf7iDwSPEOn7NfY1F14EWas335go1V0leas4tSpaT5CHnU4RdrUWY4LFf
   a9OxNzu8JcMcGT36+CAKvVHIPvyqQm7IX/LUBD61fATmXWiMjjraUmu5O
   vbwbHI+yyQCi7t22e5GjyWy4ZQrjwCmhtFS+Om3h6SpJXedVC8QtSSwOj
   n9wKGMbzxrXv1/allsonLSbUMGK8bmNKk7oQsC2vLAoMzUTtIWGCmlx8m
   V9FGy3aK7ciR6v6F89CjyGqsRxN8d/To4VPQbhB3hi1qFZbWQ7Zur9Dgi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="343704481"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="343704481"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 17:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="836532098"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="836532098"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2023 17:51:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqNxM-000hbA-1S;
	Sun, 23 Apr 2023 00:51:56 +0000
Date: Sun, 23 Apr 2023 08:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 41/46] kernel/pid_sysctl.h:34:57: sparse:
 sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <202304230854.esl96Prx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   32ff4824772986b3969387ba85a00b82f506ede8
commit: 3c5def682659b42b01a217ce672ed025791e596b [41/46] BACKPORT: mm/memfd: add MFD_NOEXEC_SEAL and MFD_EXEC
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230423/202304230854.esl96Prx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.4
        git checkout 3c5def682659b42b01a217ce672ed025791e596b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230854.esl96Prx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/pid_namespace.c: note: in included file:
>> kernel/pid_sysctl.h:34:57: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] <asn:1> * @@     got void *buf @@
   kernel/pid_sysctl.h:34:57: sparse:     expected void [noderef] <asn:1> *
   kernel/pid_sysctl.h:34:57: sparse:     got void *buf
>> kernel/pid_sysctl.h:43:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/pid_sysctl.h:43:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/pid_sysctl.h:43:35: sparse:     got int ( * )( ... )
   kernel/pid_namespace.c:58:77: sparse: sparse: Using plain integer as NULL pointer

vim +34 kernel/pid_sysctl.h

    13	
    14	static int pid_mfd_noexec_dointvec_minmax(struct ctl_table *table,
    15		int write, void *buf, size_t *lenp, loff_t *ppos)
    16	{
    17		struct pid_namespace *ns = task_active_pid_ns(current);
    18		struct ctl_table table_copy;
    19	
    20		if (write && !ns_capable(ns->user_ns, CAP_SYS_ADMIN))
    21			return -EPERM;
    22	
    23		table_copy = *table;
    24		if (ns != &init_pid_ns)
    25			table_copy.data = &ns->memfd_noexec_scope;
    26	
    27		/*
    28		 * set minimum to current value, the effect is only bigger
    29		 * value is accepted.
    30		 */
    31		if (*(int *)table_copy.data > *(int *)table_copy.extra1)
    32			table_copy.extra1 = table_copy.data;
    33	
  > 34		return proc_dointvec_minmax(&table_copy, write, buf, lenp, ppos);
    35	}
    36	
    37	static struct ctl_table pid_ns_ctl_table_vm[] = {
    38		{
    39			.procname	= "memfd_noexec",
    40			.data		= &init_pid_ns.memfd_noexec_scope,
    41			.maxlen		= sizeof(init_pid_ns.memfd_noexec_scope),
    42			.mode		= 0644,
  > 43			.proc_handler	= pid_mfd_noexec_dointvec_minmax,
    44			.extra1		= SYSCTL_ZERO,
    45			.extra2		= SYSCTL_TWO,
    46		},
    47		{ }
    48	};
    49	static struct ctl_path vm_path[] = { { .procname = "vm", }, { } };
    50	static inline void register_pid_ns_sysctl_table_vm(void)
    51	{
    52		register_sysctl_paths(vm_path, pid_ns_ctl_table_vm);
    53	}
    54	#else
    55	static inline void initialize_memfd_noexec_scope(struct pid_namespace *ns) {}
    56	static inline void set_memfd_noexec_scope(struct pid_namespace *ns) {}
    57	static inline void register_pid_ns_sysctl_table_vm(void) {}
    58	#endif
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
