Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A4B33EE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 15:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675868892; x=1707404892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m4wkEMrofdWGufLwwJFjps+QWqaYTIWCptimwuqRf/c=;
  b=W/7J8JYos7PsHvAQIYsuFDiEs6pUsxsn+/vMdscYbpOowgrsc4+wx53B
   lzBzjSaqLTj8RFGCgjcxvKDcxOexidveh6zPqq3iNBwUHSrJCBlueORTS
   Eta1bQQeu9xr/yRIqWGGDEgbdH9zv+a0r7o9SMIxNbz6brTcYp/48+ipm
   m7rAIRC5MCZPG0ooQ0oOamHTY914OaOlUS9OdwtQLGsJm6BOmodmbT1tq
   j2ZzPJiCFHUh4gCrUD4O5BKY/Ne8g8NVgQ4cKsFdtkHFNnn8fyhfrQmqT
   zTFGUgJ0fKt6LMGhvgjY8wkTAX5KOXPZiju9iF8ra8FtDJ1ULfjOxaVn0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309468612"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="309468612"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 07:08:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="644884652"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="644884652"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2023 07:08:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPm3K-0004Vi-3D;
	Wed, 08 Feb 2023 15:08:07 +0000
Date: Wed, 8 Feb 2023 23:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ashok Raj <ashok.raj@intel.com>
Subject: [daveh-devel:ucode-for-ashok 11/16]
 arch/x86/kernel/cpu/microcode/core.c:414:32: warning: unused variable 'uci'
Message-ID: <202302082211.TK157a1S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git ucode-for-ashok
head:   01bd4486138ec018e1bb204d93e4e52190dfde21
commit: d6cbfdc3fc6f3adb5b24706444bdd6d83618faa9 [11/16] x86/microcode: Do not call apply_microcode() on sibling threads
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230208/202302082211.TK157a1S-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/commit/?id=d6cbfdc3fc6f3adb5b24706444bdd6d83618faa9
        git remote add daveh-devel https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git
        git fetch --no-tags daveh-devel ucode-for-ashok
        git checkout d6cbfdc3fc6f3adb5b24706444bdd6d83618faa9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/cpu/microcode/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c: In function 'update_microcode_version_cache':
   arch/x86/kernel/cpu/microcode/core.c:383:19: error: too few arguments to function 'microcode_ops->get_microcode_revision'
     383 |         u32 rev = microcode_ops->get_microcode_revision();
         |                   ^~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c: At top level:
   arch/x86/kernel/cpu/microcode/core.c:395:18: warning: no previous prototype for 'apply_microcode' [-Wmissing-prototypes]
     395 | enum ucode_state apply_microcode(int cpu)
         |                  ^~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/microcode/core.c: In function '__reload_late':
>> arch/x86/kernel/cpu/microcode/core.c:414:32: warning: unused variable 'uci' [-Wunused-variable]
     414 |         struct ucode_cpu_info *uci;
         |                                ^~~
   arch/x86/kernel/cpu/microcode/core.c: In function 'microcode_init_cpu':
   arch/x86/kernel/cpu/microcode/core.c:588:22: error: 'struct microcode_ops' has no member named 'collect_cpu_info'
     588 |         microcode_ops->collect_cpu_info(cpu, &uci->cpu_sig);
         |                      ^~


vim +/uci +414 arch/x86/kernel/cpu/microcode/core.c

   380	
   381	static inline void update_microcode_version_cache(int cpu)
   382	{
 > 383		u32 rev = microcode_ops->get_microcode_revision();
   384		struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
   385		struct cpuinfo_x86 *c = &cpu_data(cpu);
   386	
   387		uci->cpu_sig.rev = rev;
   388	
   389		c->microcode = rev;
   390		/* Update boot_cpu_data's revision too, if we're on the BSP: */
   391		if (c->cpu_index == boot_cpu_data.cpu_index)
   392			boot_cpu_data.microcode = rev;
   393	}
   394	
   395	enum ucode_state apply_microcode(int cpu)
   396	{
   397		enum ucode_state ret;
   398	
   399		ret = microcode_ops->apply_microcode(cpu);
   400	
   401		update_microcode_version_cache(cpu);
   402	
   403		return ret;
   404	}
   405	
   406	/*
   407	 * Returns:
   408	 * < 0 - on error
   409	 *   0 - success (no update done or microcode was updated)
   410	 */
   411	static int __reload_late(void *info)
   412	{
   413		int cpu = smp_processor_id();
 > 414		struct ucode_cpu_info *uci;
   415		enum ucode_state err;
   416		bool lead_thread;
   417		int ret = 0;
   418	
   419		/*
   420		 * Wait for all CPUs to arrive. A load will not be attempted unless all
   421		 * CPUs show up.
   422		 * */
   423		if (__wait_for_cpus(&late_cpus_in, NSEC_PER_SEC))
   424			return -1;
   425	
   426		/*
   427		 * On an SMT system, it suffices to load the microcode on one sibling of
   428		 * the core because the microcode engine is shared between the threads.
   429		 * Synchronization still needs to take place so that no concurrent
   430		 * loading attempts happen on multiple threads of an SMT core. See
   431		 * below.
   432		 */
   433		if (cpumask_first(topology_sibling_cpumask(cpu)) == cpu) {
   434			lead_thread = true;
   435			err = apply_microcode(cpu);
   436		} else {
   437			lead_thread = false;
   438			goto wait_for_siblings;
   439		}
   440	
   441		if (err >= UCODE_NFOUND) {
   442			if (err == UCODE_ERROR)
   443				pr_warn("Error reloading microcode on CPU %d\n", cpu);
   444	
   445			ret = -1;
   446		}
   447	
   448	wait_for_siblings:
   449		if (__wait_for_cpus(&late_cpus_out, NSEC_PER_SEC))
   450			panic("Timeout during microcode update!\n");
   451	
   452		/*
   453		 * For non-lead threads where microcode was not applied, unconditionally
   454		 * update the per-cpu metadata.  This can tolerate the lead thread
   455		 * either succeeding or failing the update.
   456		 */
   457		if (!lead_thread)
   458			update_microcode_version_cache(cpu);
   459	
   460		return ret;
   461	}
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
