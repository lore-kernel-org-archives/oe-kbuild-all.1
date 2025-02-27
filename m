Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ABB226CF0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 11:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654701; cv=none; b=NoXJLSK4e8UNwSvYiVbqIPUb7fE9j473QGUFOvCQ0jkQ+IDgbpj+EfOuX5lQAunXnNB0h6vvdi4aWG954EZIqGFmxCJE++iwsM+z3oUZNYXCg5guAGzNEhSFVv1jV1uogEf3sGwjbY1EsW3+GpuxMQiSxa/5frn56onkNfMKqEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654701; c=relaxed/simple;
	bh=UoOydugc7Loeop0h7ysgPH1JbAxPhQkPY6RgfxGWMSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jf9DWJ85gbDwhDCvSZ9yCtAtGQtGd56KqBYejPlOnuUZjd2vMJOxCu2vHpTjkw7aqMwmzD7yRdsJn2HPSciW7yP2FHuzGPhJ/v7o3AiXByCEJJiKMaSdVH7eB2uRmdCEJZcZhXkRs72n1L9SsYnHw3PMl3bBTOFawDNVwI2/bWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zx05t2qP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zx05t2qP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740654699; x=1772190699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UoOydugc7Loeop0h7ysgPH1JbAxPhQkPY6RgfxGWMSY=;
  b=Zx05t2qPZvpAYzRIlCEDtYYbnsR1R5IFWhit6OC3WTiXqFCZlQs3761d
   eXdAx9flq0TnEI6wJ9WauxIRDd20ZMW14XjTkL67tawWxc7Ek9zZrbaPN
   qbAv8boim5OfVUuv5+y/ZF3wYTgd8FgfmgzoMmPT19QayLDL5PzC9EWXf
   FMpu+HMljlocnGGvJ3BeeWdWF3H628oS6q0z6MJ9dEbay+kPpp82b4h5H
   VaDdX3PxtO6zpPKY9nPAFFrtlCoBfco4wlyX2VqdLJPPXkJYEJ/rySMAu
   zG43PmT3AYWstTw4N2xh9vziEaowLARU6aM8qa3AztbsZzwIEAztKyujV
   w==;
X-CSE-ConnectionGUID: dJPjj4TcQ0GBzcYfVk6Iyw==
X-CSE-MsgGUID: JfqxCU8LT7qItPgSvZdsuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="59073330"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="59073330"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 03:11:37 -0800
X-CSE-ConnectionGUID: kbnGLU0+RNSjRg+7FWT0mw==
X-CSE-MsgGUID: VzwgvdMPSey1sLedL+fmYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117637163"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Feb 2025 03:11:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnbnh-000DGU-2X;
	Thu, 27 Feb 2025 11:11:33 +0000
Date: Thu, 27 Feb 2025 19:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 06/17] x86/apic: Add support to send IPI for Secure AVIC
Message-ID: <202502271851.1FWVLQ4p-lkp@intel.com>
References: <20250226090525.231882-7-Neeraj.Upadhyay@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226090525.231882-7-Neeraj.Upadhyay@amd.com>

Hi Neeraj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 0f966b1992694763de4dae6bdf817c5c1c6fc66d]

url:    https://github.com/intel-lab-lkp/linux/commits/Neeraj-Upadhyay/x86-apic-Add-new-driver-for-Secure-AVIC/20250226-171415
base:   0f966b1992694763de4dae6bdf817c5c1c6fc66d
patch link:    https://lore.kernel.org/r/20250226090525.231882-7-Neeraj.Upadhyay%40amd.com
patch subject: [RFC v2 06/17] x86/apic: Add support to send IPI for Secure AVIC
config: i386-buildonly-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271851.1FWVLQ4p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271851.1FWVLQ4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271851.1FWVLQ4p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/mm/extable.c:10:
>> arch/x86/include/asm/sev.h:533:13: warning: 'savic_ghcb_msr_write' defined but not used [-Wunused-function]
     533 | static void savic_ghcb_msr_write(u32 reg, u64 value) { }
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/savic_ghcb_msr_write +533 arch/x86/include/asm/sev.h

   490	
   491	#define snp_vmpl 0
   492	static inline void sev_es_ist_enter(struct pt_regs *regs) { }
   493	static inline void sev_es_ist_exit(void) { }
   494	static inline int sev_es_setup_ap_jump_table(struct real_mode_header *rmh) { return 0; }
   495	static inline void sev_es_nmi_complete(void) { }
   496	static inline int sev_es_efi_map_ghcbs(pgd_t *pgd) { return 0; }
   497	static inline void sev_enable(struct boot_params *bp) { }
   498	static inline int pvalidate(unsigned long vaddr, bool rmp_psize, bool validate) { return 0; }
   499	static inline int rmpadjust(unsigned long vaddr, bool rmp_psize, unsigned long attrs) { return 0; }
   500	static inline void setup_ghcb(void) { }
   501	static inline void __init
   502	early_snp_set_memory_private(unsigned long vaddr, unsigned long paddr, unsigned long npages) { }
   503	static inline void __init
   504	early_snp_set_memory_shared(unsigned long vaddr, unsigned long paddr, unsigned long npages) { }
   505	static inline void snp_set_memory_shared(unsigned long vaddr, unsigned long npages) { }
   506	static inline void snp_set_memory_private(unsigned long vaddr, unsigned long npages) { }
   507	static inline void snp_set_wakeup_secondary_cpu(void) { }
   508	static inline bool snp_init(struct boot_params *bp) { return false; }
   509	static inline void snp_abort(void) { }
   510	static inline void snp_dmi_setup(void) { }
   511	static inline int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call, struct svsm_attest_call *input)
   512	{
   513		return -ENOTTY;
   514	}
   515	static inline void snp_accept_memory(phys_addr_t start, phys_addr_t end) { }
   516	static inline u64 snp_get_unsupported_features(u64 status) { return 0; }
   517	static inline u64 sev_get_status(void) { return 0; }
   518	static inline void sev_show_status(void) { }
   519	static inline void snp_update_svsm_ca(void) { }
   520	static inline int prepare_pte_enc(struct pte_enc_desc *d) { return 0; }
   521	static inline void set_pte_enc_mask(pte_t *kpte, unsigned long pfn, pgprot_t new_prot) { }
   522	static inline void snp_kexec_finish(void) { }
   523	static inline void snp_kexec_begin(void) { }
   524	static inline int snp_msg_init(struct snp_msg_desc *mdesc, int vmpck_id) { return -1; }
   525	static inline struct snp_msg_desc *snp_msg_alloc(void) { return NULL; }
   526	static inline void snp_msg_free(struct snp_msg_desc *mdesc) { }
   527	static inline int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
   528						 struct snp_guest_request_ioctl *rio) { return -ENODEV; }
   529	static inline void __init snp_secure_tsc_prepare(void) { }
   530	static inline void __init snp_secure_tsc_init(void) { }
   531	static inline enum es_result savic_register_gpa(u64 apic_id,
   532							u64 gpa) { return ES_UNSUPPORTED; }
 > 533	static void savic_ghcb_msr_write(u32 reg, u64 value) { }
   534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
