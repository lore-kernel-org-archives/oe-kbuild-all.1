Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B5E53A6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 22:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678142680; x=1709678680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8+gZbCGQhY+dgPLq+JCY6JukdTaURR8Zo4wCj6hcuv0=;
  b=X7+xPyU1zKjff4G6NQ6mqVWqc+8wl0n3/wUdbauDSzaIgph5pZVY0V73
   tHVz2v6AXSOKpKnuO8TrKM4YvXnGu+p9FQqyCd1pNQC/CIKmiWRM5UwAi
   t/bepsJgjcn2ei01/IUzfR3HoLugaYccwwFPclF2wi/1nBjvsApO2bB5V
   dnbX0APpHIfZseDzPWWsyK3jSM1VgIDmFrzWjnYYgv69M9gq8bGvtNLV2
   6fTuVz8EklpRSxiMxRewr3Np22f1FN8KQtS3Ob6XZ6usOoEAsxE5NO9i0
   v4azLaS0a6p+xHsjQ4SuSzKG1/eD/VWsNTnC3ivMTQOLYRmbzM7AxzUur
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337216457"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="337216457"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 14:44:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676343118"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="676343118"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Mar 2023 14:44:38 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZJZN-0000hv-1v;
	Mon, 06 Mar 2023 22:44:37 +0000
Date: Tue, 7 Mar 2023 06:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dionna Glaze <dionnaglaze@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [ammarfaizi2-block:bp/bp/tip-x86-sev 11/11]
 arch/x86/include/asm/sev.h:222:93: warning: 'struct snp_guest_request_ioctl'
 declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202303070609.vX6wp2Af-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block bp/bp/tip-x86-sev
head:   9bda6a75b659d5b34bff06c22afee2b9b21d1146
commit: 9bda6a75b659d5b34bff06c22afee2b9b21d1146 [11/11] x86/sev: Change snp_guest_issue_request()'s fw_err argument
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230307/202303070609.vX6wp2Af-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/9bda6a75b659d5b34bff06c22afee2b9b21d1146
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block bp/bp/tip-x86-sev
        git checkout 9bda6a75b659d5b34bff06c22afee2b9b21d1146
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/realmode/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070609.vX6wp2Af-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/realmode/init.c:12:
>> arch/x86/include/asm/sev.h:222:93: warning: 'struct snp_guest_request_ioctl' declared inside parameter list will not be visible outside of this definition or declaration
     222 | static inline int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, struct snp_guest_request_ioctl *rio)
         |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~


vim +222 arch/x86/include/asm/sev.h

   190	
   191	void setup_ghcb(void);
   192	void __init early_snp_set_memory_private(unsigned long vaddr, unsigned long paddr,
   193						 unsigned int npages);
   194	void __init early_snp_set_memory_shared(unsigned long vaddr, unsigned long paddr,
   195						unsigned int npages);
   196	void __init snp_prep_memory(unsigned long paddr, unsigned int sz, enum psc_op op);
   197	void snp_set_memory_shared(unsigned long vaddr, unsigned int npages);
   198	void snp_set_memory_private(unsigned long vaddr, unsigned int npages);
   199	void snp_set_wakeup_secondary_cpu(void);
   200	bool snp_init(struct boot_params *bp);
   201	void __init __noreturn snp_abort(void);
   202	int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, struct snp_guest_request_ioctl *rio);
   203	#else
   204	static inline void sev_es_ist_enter(struct pt_regs *regs) { }
   205	static inline void sev_es_ist_exit(void) { }
   206	static inline int sev_es_setup_ap_jump_table(struct real_mode_header *rmh) { return 0; }
   207	static inline void sev_es_nmi_complete(void) { }
   208	static inline int sev_es_efi_map_ghcbs(pgd_t *pgd) { return 0; }
   209	static inline int pvalidate(unsigned long vaddr, bool rmp_psize, bool validate) { return 0; }
   210	static inline int rmpadjust(unsigned long vaddr, bool rmp_psize, unsigned long attrs) { return 0; }
   211	static inline void setup_ghcb(void) { }
   212	static inline void __init
   213	early_snp_set_memory_private(unsigned long vaddr, unsigned long paddr, unsigned int npages) { }
   214	static inline void __init
   215	early_snp_set_memory_shared(unsigned long vaddr, unsigned long paddr, unsigned int npages) { }
   216	static inline void __init snp_prep_memory(unsigned long paddr, unsigned int sz, enum psc_op op) { }
   217	static inline void snp_set_memory_shared(unsigned long vaddr, unsigned int npages) { }
   218	static inline void snp_set_memory_private(unsigned long vaddr, unsigned int npages) { }
   219	static inline void snp_set_wakeup_secondary_cpu(void) { }
   220	static inline bool snp_init(struct boot_params *bp) { return false; }
   221	static inline void snp_abort(void) { }
 > 222	static inline int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, struct snp_guest_request_ioctl *rio)
   223	{
   224		return -ENOTTY;
   225	}
   226	#endif
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
