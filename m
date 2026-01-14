Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFA13101BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768402681; cv=none; b=MZEY6oF8ysZJnooP5tfP9Cy2dkEI+q5bayq4jp8nyIyf8HErNdrnM/aC96rRXhLcks9eV2U0MCHQz51+JrbfOgYpILysaT8A29zcDV4TZF8jwPL9oi9Uu8eTi6mXZ40toVckKOzDVPVWC884nsuYagR1P7kp9PFWTvXAAxGz+rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768402681; c=relaxed/simple;
	bh=YOOjuPR0bVV5rS8Xm+jMh9bFV8ClTAdDkXaf0TP6nSo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AC3vFLA/d1OBWpV8PYPj9ohVqUsVIOUkJtkWwtnTsJ9Fl7p13SJNLwM3Otfy0z8uDp2C8nQGctLUyGPplQdciTWEcDt9KMf5kqZ3qDq1jHfATYiCfgWwAw+wmzf9MXPnSRThpowSiXyDlTVTqGrLSTbjQnzfelL8xYtNTFR7s1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdgudKqj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdgudKqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768402675; x=1799938675;
  h=date:from:to:cc:subject:message-id;
  bh=YOOjuPR0bVV5rS8Xm+jMh9bFV8ClTAdDkXaf0TP6nSo=;
  b=RdgudKqjXVD0CiqW2fvWbe5DFpkJYqCJFJmQgEVwWTWO6xY7kHmp/7TS
   TwJQU2dhizx3HXhaGq1KqItmdEujQ80joY7QyrG3UWDpNNw4hjVlDAa6N
   /Eezj3IY448hBqvj7ZPqWErYoqAPfiSwt7yYowZjdHWoghLyFSrMlnywr
   cSL1wm8QoKcPTj0dlxs8x+I96nABYEySi8kd8QI0XjfvBN2RshzuejAMk
   y7E+8h3v/O1DL8Z/a9gwq1JxcPL6CNXmbHYa1ITToBFhKsPIh/Of6tjCr
   HxXAaEz2J0lJrLRhFhuQJzG0Lh3c9Yuqi1xOcnFbZSoJ6afw+XhVDLhCN
   A==;
X-CSE-ConnectionGUID: gIIFh56WTTey3nwBxW/9dw==
X-CSE-MsgGUID: 6gsKb5S1TASuyZPBqnFHVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69622442"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69622442"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 06:57:55 -0800
X-CSE-ConnectionGUID: fpaFQE2eSb25i8cfX+CC5w==
X-CSE-MsgGUID: UCHnXf6NRca2LgcFOcblpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204723012"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2026 06:57:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg2Ji-00000000GWA-3HdI;
	Wed, 14 Jan 2026 14:57:50 +0000
Date: Wed, 14 Jan 2026 22:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-PMT-enhancement-ANBZ27534
 23/23] drivers/crypto/ccp/hygon/psp-dev.c:53:10: warning: no previous
 prototype for 'atomic64_exchange'
Message-ID: <202601142214.Smv070Ox-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-PMT-enhancement-ANBZ27534
head:   5be39e8fdc241e57f9813026ad199ad5add77ce7
commit: 233dbf30e3bc7b13f1f9a0bf054504691218e641 [23/23] anolis: crypto: ccp: Reduce more code intrusion in psp-dev.c and sev-dev.c
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260114/202601142214.Smv070Ox-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601142214.Smv070Ox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601142214.Smv070Ox-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/psp-dev.c:53:10: warning: no previous prototype for 'atomic64_exchange' [-Wmissing-prototypes]
      53 | uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
         |          ^~~~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/psp-dev.c:58:5: warning: no previous prototype for 'psp_mutex_init' [-Wmissing-prototypes]
      58 | int psp_mutex_init(struct psp_mutex *mutex)
         |     ^~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/psp-dev.c:188:6: warning: no previous prototype for 'vpsp_set_default_vid_permission' [-Wmissing-prototypes]
     188 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/psp-dev.c:493:5: warning: no previous prototype for '__vpsp_do_cmd_locked' [-Wmissing-prototypes]
     493 | int __vpsp_do_cmd_locked(uint32_t vid, int cmd, void *data, int *psp_ret)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/crypto/ccp/hygon/psp-dev.c:183: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * When 'allow_default_vid' is set to 1,
   drivers/crypto/ccp/hygon/psp-dev.c:200: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * When the virtual machine executes the 'tkm' command,
   drivers/crypto/ccp/hygon/psp-dev.c:225: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Upon qemu startup, this section checks whether
   drivers/crypto/ccp/hygon/psp-dev.c:253: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Upon the virtual machine is shut down,
--
>> drivers/crypto/ccp/hygon/csv-dev.c:821: warning: Function parameter or member 'api_major' not described in 'user_data_status'
   drivers/crypto/ccp/hygon/csv-dev.c:821: warning: Function parameter or member 'api_minor' not described in 'user_data_status'
   drivers/crypto/ccp/hygon/csv-dev.c:821: warning: Function parameter or member 'reserved1' not described in 'user_data_status'


vim +/atomic64_exchange +53 drivers/crypto/ccp/hygon/psp-dev.c

    52	
  > 53	uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
    54	{
    55		return xchg(dst, val);
    56	}
    57	
    58	int psp_mutex_init(struct psp_mutex *mutex)
    59	{
    60		if (!mutex)
    61			return -1;
    62		mutex->locked = 0;
    63		return 0;
    64	}
    65	
    66	int psp_mutex_trylock(struct psp_mutex *mutex)
    67	{
    68		if (atomic64_exchange(&mutex->locked, 1))
    69			return 0;
    70		else
    71			return 1;
    72	}
    73	
    74	int psp_mutex_lock_timeout(struct psp_mutex *mutex, uint64_t ms)
    75	{
    76		int ret = 0;
    77		unsigned long je;
    78	
    79		je = jiffies + msecs_to_jiffies(ms);
    80		do {
    81			if (psp_mutex_trylock(mutex)) {
    82				ret = 1;
    83				break;
    84			}
    85		} while ((ms == 0) || time_before(jiffies, je));
    86	
    87		return ret;
    88	}
    89	
    90	int psp_mutex_unlock(struct psp_mutex *mutex)
    91	{
    92		if (!mutex)
    93			return -1;
    94	
    95		atomic64_exchange(&mutex->locked, 0);
    96		return 0;
    97	}
    98	
    99	static int mmap_psp(struct file *filp, struct vm_area_struct *vma)
   100	{
   101		unsigned long page;
   102	
   103		page = virt_to_phys((void *)psp_misc->data_pg_aligned) >> PAGE_SHIFT;
   104	
   105		if (remap_pfn_range(vma, vma->vm_start, page, (vma->vm_end - vma->vm_start),
   106					vma->vm_page_prot)) {
   107			printk(KERN_INFO "remap failed...");
   108			return -1;
   109		}
   110		vm_flags_mod(vma, VM_DONTDUMP | VM_DONTEXPAND, 0);
   111		printk(KERN_INFO "remap_pfn_rang page:[%lu] ok.\n", page);
   112		return 0;
   113	}
   114	
   115	static ssize_t read_psp(struct file *file, char __user *buf, size_t count, loff_t *ppos)
   116	{
   117		ssize_t remaining;
   118	
   119		if ((*ppos + count) > PAGE_SIZE) {
   120			printk(KERN_INFO "%s: invalid address range, pos %llx, count %lx\n",
   121				__func__, *ppos, count);
   122			return -EFAULT;
   123		}
   124	
   125		remaining = copy_to_user(buf, (char *)psp_misc->data_pg_aligned + *ppos, count);
   126		if (remaining)
   127			return -EFAULT;
   128	
   129		*ppos += count;
   130	
   131		return count;
   132	}
   133	
   134	static ssize_t write_psp(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
   135	{
   136		ssize_t remaining, written;
   137	
   138		if ((*ppos + count) > PAGE_SIZE) {
   139			printk(KERN_INFO "%s: invalid address range, pos %llx, count %lx\n",
   140				__func__, *ppos, count);
   141			return -EFAULT;
   142		}
   143	
   144		remaining = copy_from_user((char *)psp_misc->data_pg_aligned + *ppos, buf, count);
   145		written = count - remaining;
   146		if (!written)
   147			return -EFAULT;
   148	
   149		*ppos += written;
   150	
   151		return written;
   152	}
   153	
   154	DEFINE_RWLOCK(vpsp_rwlock);
   155	
   156	/* VPSP_VID_MAX_ENTRIES determines the maximum number of vms that can set vid.
   157	 * but, the performance of finding vid is determined by g_vpsp_vid_num,
   158	 * so VPSP_VID_MAX_ENTRIES can be set larger.
   159	 */
   160	#define VPSP_VID_MAX_ENTRIES    2048
   161	#define VPSP_VID_NUM_MAX        64
   162	
   163	struct vpsp_vid_entry {
   164		uint32_t vid;
   165		pid_t pid;
   166	};
   167	static struct vpsp_vid_entry g_vpsp_vid_array[VPSP_VID_MAX_ENTRIES];
   168	static uint32_t g_vpsp_vid_num;
   169	static int compare_vid_entries(const void *a, const void *b)
   170	{
   171		return ((struct vpsp_vid_entry *)a)->pid - ((struct vpsp_vid_entry *)b)->pid;
   172	}
   173	static void swap_vid_entries(void *a, void *b, int size)
   174	{
   175		struct vpsp_vid_entry entry;
   176	
   177		memcpy(&entry, a, size);
   178		memcpy(a, b, size);
   179		memcpy(b, &entry, size);
   180	}
   181	
   182	/**
 > 183	 * When 'allow_default_vid' is set to 1,
   184	 * QEMU is allowed to use 'vid 0' by default
   185	 * in the absence of a valid 'vid' setting.
   186	 */
   187	uint32_t allow_default_vid = 1;
   188	void vpsp_set_default_vid_permission(uint32_t is_allow)
   189	{
   190		allow_default_vid = is_allow;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
