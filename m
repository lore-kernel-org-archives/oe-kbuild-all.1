Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6F18C1A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 21:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691875890; x=1723411890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F6JZUg5X9L79Elm3+wzv129Fp0Ndw6XN+txcJt0mzO0=;
  b=hr7XHbWUYBgGyoPYDYuIjGoYFR3EXLuoI6+0heMP/YKSCy8ERv4Ucmb5
   GwMf66PTDFYsRixE0sZ3RTW56MAf0Ck7bWo8vh9ynliGTXIQJy0QhAG0Q
   gY65d/2bn7ojtdKu/EZpwFxnj9AuCBzYxKUjdlamgtofLM26KVOpLxkaG
   xLfQntwg8g6/SewAjSioFgQOpvgQp2AglTZZ+fk01AW+ZnPtJ06hUwJuF
   jlYJmH9EiVJsr9K/aswPU2dWm36VK3M0wt9FgIL/y5iIltYN/APQEiO2u
   yLtGlKPuz7RtfLGdXgJLbuMsYK5C9KHFO9RwulUN/uuJGT9rDPNzZqYuR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="438184220"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="438184220"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 14:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="726602175"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="726602175"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Aug 2023 14:31:23 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUwCh-0008nM-02;
	Sat, 12 Aug 2023 21:31:23 +0000
Date: Sun, 13 Aug 2023 05:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 14/37]
 arch/x86/kernel/cpu/microcode/intel.c:604:40: warning: variable
 'new_mc_size' set but not used
Message-ID: <202308130519.xF4oWr2K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/microcode
head:   7ad0016c303b3f81f8e065d7ead77bb8a6b91b77
commit: 025e3daab641aa838d5f77e718365b0dd37b543a [14/37] x86/microcode/intel: Simplify early loading
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230813/202308130519.xF4oWr2K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308130519.xF4oWr2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308130519.xF4oWr2K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/intel.c: In function 'read_ucode_intel':
>> arch/x86/kernel/cpu/microcode/intel.c:604:40: warning: variable 'new_mc_size' set but not used [-Wunused-but-set-variable]
     604 |         unsigned int curr_mc_size = 0, new_mc_size = 0;
         |                                        ^~~~~~~~~~~


vim +/new_mc_size +604 arch/x86/kernel/cpu/microcode/intel.c

^1da177e4c3f41 arch/i386/kernel/microcode.c          Linus Torvalds     2005-04-16  600  
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  601  static enum ucode_state read_ucode_intel(int cpu, struct iov_iter *iter)
^1da177e4c3f41 arch/i386/kernel/microcode.c          Linus Torvalds     2005-04-16  602  {
a0a29b62a9cac6 arch/x86/kernel/microcode_intel.c     Dmitry Adamushko   2008-09-11  603  	struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
2e86222c67bb5d arch/x86/kernel/cpu/microcode/intel.c Junichi Nomura     2017-01-09 @604  	unsigned int curr_mc_size = 0, new_mc_size = 0;
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  605  	int cur_rev = uci->cpu_sig.rev;
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  606  	u8 *new_mc = NULL, *mc = NULL;
a0a29b62a9cac6 arch/x86/kernel/microcode_intel.c     Dmitry Adamushko   2008-09-11  607  
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  608  	while (iov_iter_count(iter)) {
d4ee36686853d5 arch/x86/kernel/microcode_intel.c     Peter Oruba        2008-07-28  609  		struct microcode_header_intel mc_header;
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  610  		unsigned int mc_size, data_size;
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  611  		u8 *data;
^1da177e4c3f41 arch/i386/kernel/microcode.c          Linus Torvalds     2005-04-16  612  
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  613  		if (!copy_from_iter_full(&mc_header, sizeof(mc_header), iter)) {
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  614  			pr_err("error! Truncated or inaccessible header in microcode data file\n");
35a9ff4eec7a17 arch/x86/kernel/cpu/microcode/intel.c Quentin Casasnovas 2015-02-03  615  			break;
35a9ff4eec7a17 arch/x86/kernel/cpu/microcode/intel.c Quentin Casasnovas 2015-02-03  616  		}
35a9ff4eec7a17 arch/x86/kernel/cpu/microcode/intel.c Quentin Casasnovas 2015-02-03  617  
a0a29b62a9cac6 arch/x86/kernel/microcode_intel.c     Dmitry Adamushko   2008-09-11  618  		mc_size = get_totalsize(&mc_header);
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  619  		if (mc_size < sizeof(mc_header)) {
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  620  			pr_err("error! Bad data in microcode data file (totalsize too small)\n");
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  621  			break;
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  622  		}
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  623  
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  624  		data_size = mc_size - sizeof(mc_header);
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  625  		if (data_size > iov_iter_count(iter)) {
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  626  			pr_err("error! Bad data in microcode data file (truncated file?)\n");
a0a29b62a9cac6 arch/x86/kernel/microcode_intel.c     Dmitry Adamushko   2008-09-11  627  			break;
^1da177e4c3f41 arch/i386/kernel/microcode.c          Linus Torvalds     2005-04-16  628  		}
9a3110bf4bb046 arch/i386/kernel/microcode.c          Shaohua Li         2006-09-27  629  
938179b4f8cf8a arch/x86/kernel/microcode_intel.c     Dimitri Sivanich   2010-03-05  630  		/* For performance reasons, reuse mc area when possible */
938179b4f8cf8a arch/x86/kernel/microcode_intel.c     Dimitri Sivanich   2010-03-05  631  		if (!mc || mc_size > curr_mc_size) {
938179b4f8cf8a arch/x86/kernel/microcode_intel.c     Dimitri Sivanich   2010-03-05  632  			vfree(mc);
a0a29b62a9cac6 arch/x86/kernel/microcode_intel.c     Dmitry Adamushko   2008-09-11  633  			mc = vmalloc(mc_size);
a0a29b62a9cac6 arch/x86/kernel/microcode_intel.c     Dmitry Adamushko   2008-09-11  634  			if (!mc)
a0a29b62a9cac6 arch/x86/kernel/microcode_intel.c     Dmitry Adamushko   2008-09-11  635  				break;
938179b4f8cf8a arch/x86/kernel/microcode_intel.c     Dimitri Sivanich   2010-03-05  636  			curr_mc_size = mc_size;
938179b4f8cf8a arch/x86/kernel/microcode_intel.c     Dimitri Sivanich   2010-03-05  637  		}
a30a6a2cb0fdc2 arch/i386/kernel/microcode.c          Shaohua Li         2006-09-27  638  
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  639  		memcpy(mc, &mc_header, sizeof(mc_header));
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  640  		data = mc + sizeof(mc_header);
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  641  		if (!copy_from_iter_full(data, data_size, iter) ||
e0788c3281a723 arch/x86/kernel/cpu/microcode/intel.c Jithu Joseph       2022-11-16  642  		    intel_microcode_sanity_check(mc, true, MC_HEADER_TYPE_MICROCODE) < 0) {
a0a29b62a9cac6 arch/x86/kernel/microcode_intel.c     Dmitry Adamushko   2008-09-11  643  			break;
a0a29b62a9cac6 arch/x86/kernel/microcode_intel.c     Dmitry Adamushko   2008-09-11  644  		}
a30a6a2cb0fdc2 arch/i386/kernel/microcode.c          Shaohua Li         2006-09-27  645  
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  646  		if (cur_rev >= mc_header.rev)
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  647  			continue;
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  648  
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  649  		if (!intel_find_matching_signature(mc, uci->cpu_sig.sig, uci->cpu_sig.pf))
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  650  			continue;
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  651  
a1c75cc5018f17 arch/x86/kernel/microcode_intel.c     Ingo Molnar        2008-09-14  652  		vfree(new_mc);
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  653  		cur_rev = mc_header.rev;
a0a29b62a9cac6 arch/x86/kernel/microcode_intel.c     Dmitry Adamushko   2008-09-11  654  		new_mc  = mc;
2e86222c67bb5d arch/x86/kernel/cpu/microcode/intel.c Junichi Nomura     2017-01-09  655  		new_mc_size = mc_size;
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  656  		mc = NULL;
a30a6a2cb0fdc2 arch/i386/kernel/microcode.c          Shaohua Li         2006-09-27  657  	}
a30a6a2cb0fdc2 arch/i386/kernel/microcode.c          Shaohua Li         2006-09-27  658  
938179b4f8cf8a arch/x86/kernel/microcode_intel.c     Dimitri Sivanich   2010-03-05  659  	vfree(mc);
938179b4f8cf8a arch/x86/kernel/microcode_intel.c     Dimitri Sivanich   2010-03-05  660  
7e94a7b659eefe arch/x86/kernel/cpu/microcode/intel.c Jann Horn          2019-04-04  661  	if (iov_iter_count(iter)) {
4bae1967357bfc arch/x86/kernel/microcode_intel.c     Ingo Molnar        2009-03-11  662  		vfree(new_mc);
f61337d9841210 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov    2016-10-25  663  		return UCODE_ERROR;
871b72dd1e12af arch/x86/kernel/microcode_intel.c     Dmitry Adamushko   2009-05-11  664  	}
871b72dd1e12af arch/x86/kernel/microcode_intel.c     Dmitry Adamushko   2009-05-11  665  
f61337d9841210 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov    2016-10-25  666  	if (!new_mc)
f61337d9841210 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov    2016-10-25  667  		return UCODE_NFOUND;
4bae1967357bfc arch/x86/kernel/microcode_intel.c     Ingo Molnar        2009-03-11  668  
6a99f8daa3072b arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-08  669  	/* Save for CPU hotplug */
025e3daab641aa arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-03  670  	save_microcode_patch((struct microcode_intel *)new_mc);
025e3daab641aa arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-03  671  	uci->mc = ucode_patch_va;
025e3daab641aa arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-03  672  
025e3daab641aa arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-03  673  	vfree(new_mc);
9cd4d78e21cfdc arch/x86/kernel/microcode_intel.c     Fenghua Yu         2012-12-20  674  
f58e1f53de52a7 arch/x86/kernel/microcode_intel.c     Joe Perches        2009-12-08  675  	pr_debug("CPU%d found a matching microcode update with version 0x%x (current=0x%x)\n",
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  676  		 cpu, cur_rev, uci->cpu_sig.rev);
f61337d9841210 arch/x86/kernel/cpu/microcode/intel.c Borislav Petkov    2016-10-25  677  
26de84f12381f5 arch/x86/kernel/cpu/microcode/intel.c Thomas Gleixner    2023-08-10  678  	return UCODE_NEW;
a30a6a2cb0fdc2 arch/i386/kernel/microcode.c          Shaohua Li         2006-09-27  679  }
a30a6a2cb0fdc2 arch/i386/kernel/microcode.c          Shaohua Li         2006-09-27  680  

:::::: The code at line 604 was first introduced by commit
:::::: 2e86222c67bb5d942da68e8415749b32db208534 x86/microcode/intel: Use correct buffer size for saving microcode data

:::::: TO: Junichi Nomura <j-nomura@ce.jp.nec.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
