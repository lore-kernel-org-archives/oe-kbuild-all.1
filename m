Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0A5156D4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690565155; x=1722101155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QL3aBU3j8CiHH8u3Jd0Q/2SL8Y9FVMJtc4mCpfZBjHo=;
  b=juFHvRqLrs7m0Up+3+o1+zIaDQHi5l7JYH7z1qJlkDNCxLGWUh1fcb+2
   24+0P0obCjMgdLSzbmMm2A2y1vicL3tFofoknbFXi3JZ0jHo3+psOKGXw
   sFFr27qi4CSrxkzO4j6FXwXh4lQTMSatGNTo/SptQWNiuyBuB40AoCZLV
   alAGC56oKLqTMmC/kXdgjkfuotSahsFABLWrFOQz/17fWsZkcY3R3ghyP
   ki+WVBHXqJWNwLzi8IU5nE4eBJu7k4soQvIfbAAU1JmizUTktFNpt54My
   wY8SNkl2GNJgeju4oj46ytFrLEzl3kPJP5TdgpamCOSaJC24n7gMQSlAl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="432457377"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="432457377"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 10:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901363979"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="901363979"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Jul 2023 10:25:36 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPRDR-0003QU-2B;
	Fri, 28 Jul 2023 17:25:29 +0000
Date: Sat, 29 Jul 2023 01:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: huqinghong <huqinghong@uniontech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [audit:pr/148 2/2] kernel/auditsc.c:2450:23: error: passing argument
 1 of '__builtin_strlen' from incompatible pointer type
Message-ID: <202307290108.mBOwE8s1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linux-audit/audit-kernel pr/148
head:   a3f0ed3f07b3262461c74c68df101e7c04adaa06
commit: a3f0ed3f07b3262461c74c68df101e7c04adaa06 [2/2] Influence: audit log
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230729/202307290108.mBOwE8s1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290108.mBOwE8s1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290108.mBOwE8s1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from kernel/auditsc.c:37:
   kernel/auditsc.c: In function '__audit_inode_child':
>> kernel/auditsc.c:2450:23: error: passing argument 1 of '__builtin_strlen' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2450 |         dlen = strlen(dname);
         |                       ^~~~~
         |                       |
         |                       const struct qstr *
   include/linux/const.h:12:55: note: in definition of macro '__is_constexpr'
      12 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   kernel/auditsc.c:2450:16: note: in expansion of macro 'strlen'
    2450 |         dlen = strlen(dname);
         |                ^~~~~~
   kernel/auditsc.c:2450:23: note: expected 'const char *' but argument is of type 'const struct qstr *'
    2450 |         dlen = strlen(dname);
         |                       ^~~~~
   include/linux/const.h:12:55: note: in definition of macro '__is_constexpr'
      12 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   kernel/auditsc.c:2450:16: note: in expansion of macro 'strlen'
    2450 |         dlen = strlen(dname);
         |                ^~~~~~
   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9:
>> kernel/auditsc.c:2450:23: error: passing argument 1 of '__builtin_strlen' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2450 |         dlen = strlen(dname);
         |                       ^~~~~
         |                       |
         |                       const struct qstr *
   include/linux/fortify-string.h:232:34: note: in definition of macro 'strlen'
     232 |                 __builtin_strlen(p), __fortify_strlen(p))
         |                                  ^
   kernel/auditsc.c:2450:23: note: expected 'const char *' but argument is of type 'const struct qstr *'
    2450 |         dlen = strlen(dname);
         |                       ^~~~~
   include/linux/fortify-string.h:232:34: note: in definition of macro 'strlen'
     232 |                 __builtin_strlen(p), __fortify_strlen(p))
         |                                  ^
>> kernel/auditsc.c:2450:23: error: passing argument 1 of '__fortify_strlen' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2450 |         dlen = strlen(dname);
         |                       ^~~~~
         |                       |
         |                       const struct qstr *
   include/linux/fortify-string.h:232:55: note: in definition of macro 'strlen'
     232 |                 __builtin_strlen(p), __fortify_strlen(p))
         |                                                       ^
   include/linux/fortify-string.h:234:57: note: expected 'const char * const' but argument is of type 'const struct qstr *'
     234 | __kernel_size_t __fortify_strlen(const char * const POS p)
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~^
>> kernel/auditsc.c:2458:51: error: invalid operands to binary != (have 'struct qstr' and 'int')
    2458 |                 if (n_file_name && dname[dlen -1] != '/' && n->name->name[name_len - 1] == '/')
         |                                    ~~~~~~~~~~~~~~ ^~
         |                                         |
         |                                         struct qstr
   cc1: some warnings being treated as errors


vim +/__builtin_strlen +2450 kernel/auditsc.c

  2393	
  2394	/**
  2395	 * __audit_inode_child - collect inode info for created/removed objects
  2396	 * @parent: inode of dentry parent
  2397	 * @dentry: dentry being audited
  2398	 * @type:   AUDIT_TYPE_* value that we're looking for
  2399	 *
  2400	 * For syscalls that create or remove filesystem objects, audit_inode
  2401	 * can only collect information for the filesystem object's parent.
  2402	 * This call updates the audit context with the child's information.
  2403	 * Syscalls that create a new filesystem object must be hooked after
  2404	 * the object is created.  Syscalls that remove a filesystem object
  2405	 * must be hooked prior, in order to capture the target inode during
  2406	 * unsuccessful attempts.
  2407	 */
  2408	void __audit_inode_child(struct inode *parent,
  2409				 const struct dentry *dentry,
  2410				 const unsigned char type)
  2411	{
  2412		struct audit_context *context = audit_context();
  2413		struct inode *inode = d_backing_inode(dentry);
  2414		const struct qstr *dname = &dentry->d_name;
  2415		struct audit_names *n, *found_parent = NULL, *found_child = NULL;
  2416		struct audit_entry *e;
  2417		struct list_head *list = &audit_filter_list[AUDIT_FILTER_FS];
  2418		int i;
  2419		char *n_file_name = NULL;
  2420		int dlen;
  2421		int name_len;
  2422		bool special_end = false;
  2423	
  2424		if (context->context == AUDIT_CTX_UNUSED)
  2425			return;
  2426	
  2427		rcu_read_lock();
  2428		list_for_each_entry_rcu(e, list, list) {
  2429			for (i = 0; i < e->rule.field_count; i++) {
  2430				struct audit_field *f = &e->rule.fields[i];
  2431	
  2432				if (f->type == AUDIT_FSTYPE
  2433				    && audit_comparator(parent->i_sb->s_magic,
  2434							f->op, f->val)
  2435				    && e->rule.action == AUDIT_NEVER) {
  2436					rcu_read_unlock();
  2437					return;
  2438				}
  2439			}
  2440		}
  2441		rcu_read_unlock();
  2442	
  2443		if (inode)
  2444			handle_one(inode);
  2445	
  2446		n_file_name = kmalloc(PATH_MAX, GFP_KERNEL);
  2447		if (n_file_name) {
  2448			memset(n_file_name, '\0', PATH_MAX);
  2449		}
> 2450		dlen = strlen(dname);
  2451		/* look for a parent entry first */
  2452		list_for_each_entry(n, &context->names_list, list) {
  2453			if (!n->name ||
  2454			    (n->type != AUDIT_TYPE_PARENT &&
  2455			     n->type != AUDIT_TYPE_UNKNOWN))
  2456				continue;
  2457			name_len = strlen(n->name->name);
> 2458			if (n_file_name && dname[dlen -1] != '/' && n->name->name[name_len - 1] == '/')
  2459			{
  2460				strncpy(n_file_name, n->name->name, name_len - 1);
  2461				special_end = true;
  2462			}
  2463			if (n->ino == parent->i_ino && n->dev == parent->i_sb->s_dev &&
  2464			    !audit_compare_dname_path(dname,
  2465					special_end ? n_file_name : n->name->name, n->name_len)) {
  2466				if (n->type == AUDIT_TYPE_UNKNOWN)
  2467					n->type = AUDIT_TYPE_PARENT;
  2468				found_parent = n;
  2469				break;
  2470			}
  2471			if (special_end) {
  2472				memset(n_file_name, '\0', name_len + 1);
  2473			}
  2474			special_end = false;
  2475		}
  2476		if (n_file_name) {
  2477			kfree(n_file_name);
  2478		}
  2479		/* is there a matching child entry? */
  2480		list_for_each_entry(n, &context->names_list, list) {
  2481			/* can only match entries that have a name */
  2482			if (!n->name ||
  2483			    (n->type != type && n->type != AUDIT_TYPE_UNKNOWN))
  2484				continue;
  2485	
  2486			if (!strcmp(dname->name, n->name->name) ||
  2487			    !audit_compare_dname_path(dname, n->name->name,
  2488							found_parent ?
  2489							found_parent->name_len :
  2490							AUDIT_NAME_FULL)) {
  2491				if (n->type == AUDIT_TYPE_UNKNOWN)
  2492					n->type = type;
  2493				found_child = n;
  2494				break;
  2495			}
  2496		}
  2497	
  2498		if (!found_parent) {
  2499			/* create a new, "anonymous" parent record */
  2500			n = audit_alloc_name(context, AUDIT_TYPE_PARENT);
  2501			if (!n)
  2502				return;
  2503			audit_copy_inode(n, NULL, parent, 0);
  2504		}
  2505	
  2506		if (!found_child) {
  2507			found_child = audit_alloc_name(context, type);
  2508			if (!found_child)
  2509				return;
  2510	
  2511			/* Re-use the name belonging to the slot for a matching parent
  2512			 * directory. All names for this context are relinquished in
  2513			 * audit_free_names() */
  2514			if (found_parent) {
  2515				found_child->name = found_parent->name;
  2516				found_child->name_len = AUDIT_NAME_FULL;
  2517				found_child->name->refcnt++;
  2518			}
  2519		}
  2520	
  2521		if (inode)
  2522			audit_copy_inode(found_child, dentry, inode, 0);
  2523		else
  2524			found_child->ino = AUDIT_INO_UNSET;
  2525	}
  2526	EXPORT_SYMBOL_GPL(__audit_inode_child);
  2527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
