Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8FE1BA28A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 19:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724961401; cv=none; b=BjXmDPpLGfOs3VPiZ6XA0se713cCz81qWS9It5y0VKmP4V2w6rCGbxZkKYSFLn3GEoP0DIZKj2MG+OQEgphyL8Ohh650+DLxvxU4OEdQmkhyfc0A3Cq7mV3DQzm9o60xbhXT/GGcXOzpSv5sEqLJIlPiMUPeb9HjsXItJ6dOtSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724961401; c=relaxed/simple;
	bh=cTyuk1TJ0feVV5yf0ZEV/vqfL3+Osd5zVbSCXS/3TIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cFro/rg+nwUU/pVbSeDC/bD4Hjc0PY4fvdKTrnYwrM+/JWoAGEqhd9nkDnWOclV+RfS2FsI4y/1MXsXWTXnQBGaSDgHvFVAwQTeNeOxtPkFIFJZiXOpLLoMtQlS7gfR0cR43daa44h0+ogxwDPvdeNbZZ7lCft+XdE6tIUzHci4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzGM81vt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzGM81vt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724961399; x=1756497399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cTyuk1TJ0feVV5yf0ZEV/vqfL3+Osd5zVbSCXS/3TIM=;
  b=RzGM81vtTJl5p6hGkBmYmw6MAZ7yo/6DT71KYI3kRckofQqNdnUb3D/F
   pC97P2nQNJjYmWF0h1vQrkJW/MVldlMYERVKlPAzQhQy8VtKveOVrc2+N
   01NzIBIeDiw3TR4KPqRtHfMMg0cQOn+MMNFxhLCnSvg01MrqWdbeTXHMt
   8WZnSLbvM2m9i8bosuhnH716YPGMvETE3iPKVNwNwhdOC7Y0k8wcLKHer
   V3LlctrazHcWxC5xpQ1kID42jlvMQX5EY2kHhdVcDgQaBTHoqHyVq+Adb
   ZP+W9AtG7jGubtUySJrYZFnDMHBNn+18f6FDpi3O2VTekpGEh7WFDfnGq
   w==;
X-CSE-ConnectionGUID: tAj/+m92Ts2kKeiANDA76A==
X-CSE-MsgGUID: S5EPY/36S1KxwVvRKVvYNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="41087937"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="41087937"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 12:56:38 -0700
X-CSE-ConnectionGUID: kgd6bVajQ/i2TK0r+l17kg==
X-CSE-MsgGUID: mdPljdn4S32KgWtedlqr2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="63732978"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Aug 2024 12:56:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjlFz-0000gg-0E;
	Thu, 29 Aug 2024 19:56:35 +0000
Date: Fri, 30 Aug 2024 03:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, wu.zheng@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 5519/23944]
 drivers/bytedance/hookbind/hookbind_sys.c:123:24: warning: variable 'mport'
 set but not used
Message-ID: <202408300326.RWgztSmU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   114077d3641f55e0727e810a4f1277a658f703b7
commit: 7b8bb8cc2fb5e8291614f78dd5423873d634ccdc [5519/23944] bytedance: driver: hookbind: Add hookbind driver
config: x86_64-bytedance-5.15-velinux (https://download.01.org/0day-ci/archive/20240830/202408300326.RWgztSmU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408300326.RWgztSmU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408300326.RWgztSmU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bytedance/hookbind/hookbind_sys.c: In function '__do_hook_bind':
>> drivers/bytedance/hookbind/hookbind_sys.c:123:24: warning: variable 'mport' set but not used [-Wunused-but-set-variable]
     123 |         int err, port, mport;
         |                        ^~~~~
>> drivers/bytedance/hookbind/hookbind_sys.c:123:18: warning: variable 'port' set but not used [-Wunused-but-set-variable]
     123 |         int err, port, mport;
         |                  ^~~~
   drivers/bytedance/hookbind/hookbind_sys.c: At top level:
>> drivers/bytedance/hookbind/hookbind_sys.c:225:9: warning: no previous prototype for 'dump_dmesg' [-Wmissing-prototypes]
     225 | ssize_t dump_dmesg(void)
         |         ^~~~~~~~~~
>> drivers/bytedance/hookbind/hookbind_sys.c:252:9: warning: no previous prototype for 'add_new_rule' [-Wmissing-prototypes]
     252 | ssize_t add_new_rule(const char __user *buffer,size_t length)
         |         ^~~~~~~~~~~~
>> drivers/bytedance/hookbind/hookbind_sys.c:303:13: warning: no previous prototype for 'register_hookbind' [-Wmissing-prototypes]
     303 | bool __init register_hookbind(void)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/bytedance/hookbind/hookbind_sys.c:315:13: warning: no previous prototype for 'unregister_hookbind' [-Wmissing-prototypes]
     315 | void __exit unregister_hookbind(void)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/mport +123 drivers/bytedance/hookbind/hookbind_sys.c

   120	
   121	SYS_CALL_HOOK_DEFINE(3, bind, int, fd, struct sockaddr __user *, uaddr, int, len)
   122	{
 > 123		int err, port, mport;
   124		bool hit = false;
   125		struct pid *group;
   126		struct mapping_rule *t, *tmp;
   127		struct sockaddr *kaddr;
   128		struct sockaddr_in *addr;
   129		struct sockaddr_in6 *addr6;
   130		struct sockaddr_storage address;
   131	
   132		if (!try_module_get(THIS_MODULE))
   133			goto out;
   134		if (list_empty(&rules) )
   135			goto end;
   136		err = my_move_addr_to_kernel(uaddr, len, &address);
   137		if (err < 0)
   138			goto end;
   139		kaddr = (struct sockaddr *)&address;
   140		if (kaddr->sa_family != AF_INET && kaddr->sa_family != AF_INET6)
   141			goto end;
   142		addr = (struct sockaddr_in *)kaddr;
   143		addr6 = (struct sockaddr_in6 *)kaddr;
   144		group = task_pgrp(current);
   145	
   146		spin_lock(&lock);
   147		list_for_each_entry_safe(t, tmp, &rules, list) {
   148			if (!rule_valid(t)) {
   149				delete(t);
   150				continue;
   151			}
   152			if (t->pgrp != group)
   153				continue;
   154			port = t->port;
   155			mport = t->mport;
   156			if (kaddr->sa_family == AF_INET &&
   157					addr->sin_port == htons(t->port)) {
   158				addr->sin_port = htons(t->mport);
   159				hit = true;
   160				break;
   161			} else if (kaddr->sa_family == AF_INET6 &&
   162					addr6->sin6_port == htons(t->port)) {
   163				addr6->sin6_port = htons(t->mport);
   164				hit = true;
   165				break;
   166			}
   167		}
   168		spin_unlock(&lock);
   169	
   170		if (hit) {
   171			if (copy_to_user(uaddr, kaddr, sizeof(struct sockaddr))) {
   172				pr_info("hookbind: hit: copy_to_user failed!\n");
   173				goto end;
   174			}
   175			pr_info("hookbind: hit: pid: %d, pgrp: %d, mapping port %d --> %d\n",
   176					task_pid_nr(current), t->nr, t->port, t->mport);
   177		}
   178	end:
   179		module_put(THIS_MODULE);
   180	out:
   181		return original_sys_bind(regs);
   182	}
   183	
   184	static size_t decode(char *argenv,size_t length)
   185	{
   186		int iport = 0, import = 0, flag = 0;
   187		ssize_t i = 0;
   188		while (i < length) {
   189			if (isspace(argenv[i]) || argenv[i] == '\0') {
   190				i++;
   191			} else if (isdigit(argenv[i])) {
   192				if (flag == 0)
   193					iport = iport*10 + (argenv[i] - '0');
   194				else
   195					import = import*10 + (argenv[i] - '0');
   196				i++;
   197			} else if (argenv[i] == ':') {
   198				flag = 1;
   199				i++;
   200			} else if (argenv[i] == '/') {
   201				if (iport > 0xFFFF || import > 0xFFFF ||
   202					iport <= 0 || import <= 0) {
   203					pr_info("hookbind: add rule: WRONG port %d --> %d\n",
   204						iport, import);
   205					i++;
   206					continue;
   207				}
   208				add(iport, import, current);
   209				flag = 0;
   210				iport =0;
   211				import = 0;
   212				i++;
   213			} else{
   214				pr_info("hookbind: str %s\n",argenv);
   215				pr_info("hookbind: bad str %s\n",&argenv[i]);
   216				break;
   217			}
   218		}
   219		if (flag == 1 && iport <= 0xFFFF && iport > 0 &&
   220				import <= 0xFFFF && import > 0)
   221			add(iport, import, current);
   222		return i;
   223	}
   224	
 > 225	ssize_t dump_dmesg(void)
   226	{
   227		struct mapping_rule *t, *tmp;
   228		struct task_struct *p;
   229		bool valid;
   230	
   231		spin_lock(&lock);
   232		list_for_each_entry_safe(t, tmp, &rules, list) {
   233			valid = false;
   234			if (t->nr == pid_nr(t->pgrp)) {
   235				do_each_pid_task(t->pgrp, PIDTYPE_PGID, p) {
   236					if (p) {
   237						pr_info("hookbind: read task: pid: %d, mapping port %d --> %d\n",
   238							task_pid_nr(p), t->port, t->mport);
   239						valid = true;
   240						/* no break here */
   241					}
   242				} while_each_pid_task(t->pgrp, PIDTYPE_PGID, p);
   243			}
   244			if (!valid)
   245				delete(t);
   246		}
   247		spin_unlock(&lock);
   248	
   249		return 0;
   250	}
   251	
 > 252	ssize_t add_new_rule(const char __user *buffer,size_t length)
   253	{
   254		ssize_t res = 0;
   255		char *bmp = kmalloc((length + 1) * sizeof(char), GFP_KERNEL);
   256		if (!bmp) {
   257			pr_info("hookbind: write: kmalloc fail\n");
   258			res = -ENOMEM;
   259			goto out;
   260		}
   261		res = copy_from_user(bmp, buffer, length);
   262		if (res != 0) {
   263			res = -EFAULT;
   264			goto free_bmp;
   265		}
   266		bmp[length]='\0';
   267		res = decode(bmp,length+1);
   268	free_bmp:
   269		kfree(bmp);
   270	out:
   271		return res;
   272	}
   273	
   274	static int __init sys_bind_replace(const void *addr, sys_bind_func func,
   275					   sys_bind_func *old)
   276	{
   277		const char *vaddr;
   278		struct page *page;
   279	
   280		page = VIRT_TO_PAGE((void *)addr);
   281	
   282		vaddr = vmap(&page, 1, VM_MAP, PAGE_KERNEL);
   283		if (!vaddr)
   284			return -EPERM;
   285	
   286		sys_bind_ptr = (void *)(vaddr + ((unsigned long)addr & ~PAGE_MASK));
   287		*old = xchg(sys_bind_ptr, func);
   288		flush_kernel_vmap_range((void *)vaddr, sizeof(vaddr));
   289		invalidate_kernel_vmap_range((void *)addr, sizeof(addr));
   290	
   291		return 0;
   292	}
   293	
   294	static inline void sys_bind_restore(const void *addr, sys_bind_func func)
   295	{
   296		const void *vaddr = (void *)((unsigned long)sys_bind_ptr & PAGE_MASK);
   297	
   298		xchg(sys_bind_ptr, func);
   299		vunmap(vaddr);
   300		invalidate_kernel_vmap_range((void *)addr, sizeof(addr));
   301	}
   302	
 > 303	bool __init register_hookbind(void)
   304	{
   305		const char *name = "sys_call_table";
   306	
   307		table = (void *)kallsyms_lookup_name(name);
   308		if (table == NULL)
   309			return false;
   310	
   311		return !sys_bind_replace(&table[__NR_bind], hook_bind_func,
   312					 &original_sys_bind);
   313	}
   314	
 > 315	void __exit unregister_hookbind(void)
   316	{
   317		struct mapping_rule *t, *tmp;
   318	
   319		sys_bind_restore(&table[__NR_bind], original_sys_bind);
   320		spin_lock(&lock);
   321		list_for_each_entry_safe(t, tmp, &rules, list) {
   322			delete(t);
   323		}
   324		spin_unlock(&lock);
   325		synchronize_rcu();
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
