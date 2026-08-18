Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFCA1EFF8D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 20:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086120; cv=none; b=eombXm90i0BaSB86OcD8oLfCVZp6Yl6u2qnxQy34FWGUHtdv/tCM98Y22Rx1U6PriYZhx5bXYjXMULNN7da48Q5Ewv65vHWgv0nHA86teUxyyMJXVnhhrT+zm4IND6Eb+JtD+JRvBSbxWdTzLRgDZ1wEZJ1hJm9eU5Tui5DbtBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086120; c=relaxed/simple;
	bh=26Dx9LOfwjOpruQk9BING/ORv/jTEETENuIk0skSMqc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rYESUDY5JOpAamfCjkUcVwbnaqvYsn2/rs2JXglm32GHWhTUdiXdmhXpFKjNRwp+UAn9irfnrj0rmvuCMTstCep+YTK8EgXA3Z1Mh9K/y5a5xU5BS1l4JWevsJaChJ6kjhGr/O+9FUMDZ5WTpcfBnixaIaQtXC0WCcAiwbUL5VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8ZO5KLS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8ZO5KLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787086118; x=1818622118;
  h=date:from:to:cc:subject:message-id;
  bh=26Dx9LOfwjOpruQk9BING/ORv/jTEETENuIk0skSMqc=;
  b=H8ZO5KLSSxk9KjO6ihOvOAbC578c592ZDN9xEQu3aYCIqDJRpjUCrDMK
   FvcllVC9/l0jrDfsasWKrJl6AH1hlxeQUVrf1rZrQ9nKtuSZxyNyvweSJ
   Zx9lTWTKxwbkqPowiy8kMKspRkhunxahz2ejwTZ+1bwNHuljD53JQ7l4j
   8KU5dbAP2LCr2BqgcwKkB33AU7wvumpiGUMpHU7K8C6vEEvNrC6iZQMvt
   kyz9PJt4HQky6syR13EKwB8HebEx0LV3dRTboKurf+IVBSvgkp1ZnyvBp
   FQ8r+gkhC483Nf9S2LlKhhh+Pc8rPWu0rZrlU8GWvg+g+PwJZllU+DrbU
   g==;
X-CSE-ConnectionGUID: fYPiyM0BQCaJClzRygUqoQ==
X-CSE-MsgGUID: WUAAcUxxSSq92w+4k7fGxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98256716"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98256716"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 13:48:37 -0700
X-CSE-ConnectionGUID: XSmbfEp0QmWLXP9lQSnpxg==
X-CSE-MsgGUID: 2NHAqry5SMGDSV1qYTC6VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="265954073"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Aug 2026 13:48:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwQjZ-00000000eZS-13W7;
	Tue, 18 Aug 2026 20:48:33 +0000
Date: Wed, 19 Aug 2026 04:48:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:collapse/rfc-v1 44/76] include/linux/swapops.h:174:1:
 warning: control reaches end of non-void function
Message-ID: <202608190433.y2V2p3yl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git collapse/rfc-v1
head:   efac4ce42bf9ea34a32d1563fe3370ee837a751f
commit: 65e07bcb16cff0067142e89cc75fb4106b102695 [44/76] mm/collapse: collapse anonymous memory with the new engine
config: x86_64-randconfig-016-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190433.y2V2p3yl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190433.y2V2p3yl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190433.y2V2p3yl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/leafops.h:11,
                    from mm/collapse.c:8:
   include/linux/swapops.h: In function 'swp_entry':
   include/linux/swapops.h:27:46: error: 'MAX_SWAPFILES_SHIFT' undeclared (first use in this function); did you mean 'MAX_SWAPFILES_CHECK'?
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:88:28: note: in expansion of macro 'SWP_TYPE_SHIFT'
      88 |         ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
         |                            ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:46: note: each undeclared identifier is reported only once for each function it appears in
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:88:28: note: in expansion of macro 'SWP_TYPE_SHIFT'
      88 |         ret.val = (type << SWP_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
         |                            ^~~~~~~~~~~~~~
   include/linux/swapops.h: In function 'swp_type':
   include/linux/swapops.h:27:46: error: 'MAX_SWAPFILES_SHIFT' undeclared (first use in this function); did you mean 'MAX_SWAPFILES_CHECK'?
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:98:30: note: in expansion of macro 'SWP_TYPE_SHIFT'
      98 |         return (entry.val >> SWP_TYPE_SHIFT);
         |                              ^~~~~~~~~~~~~~
   include/linux/swapops.h: In function 'swp_offset':
   include/linux/swapops.h:27:46: error: 'MAX_SWAPFILES_SHIFT' undeclared (first use in this function); did you mean 'MAX_SWAPFILES_CHECK'?
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:28:34: note: in expansion of macro 'SWP_TYPE_SHIFT'
      28 | #define SWP_OFFSET_MASK ((1UL << SWP_TYPE_SHIFT) - 1)
         |                                  ^~~~~~~~~~~~~~
   include/linux/swapops.h:107:28: note: in expansion of macro 'SWP_OFFSET_MASK'
     107 |         return entry.val & SWP_OFFSET_MASK;
         |                            ^~~~~~~~~~~~~~~
   include/linux/swapops.h: In function 'make_readable_migration_entry':
   include/linux/swapops.h:173:26: error: 'SWP_MIGRATION_READ' undeclared (first use in this function); did you mean 'THP_MIGRATION_FAIL'?
     173 |         return swp_entry(SWP_MIGRATION_READ, offset);
         |                          ^~~~~~~~~~~~~~~~~~
         |                          THP_MIGRATION_FAIL
   include/linux/swapops.h: In function 'make_readable_exclusive_migration_entry':
   include/linux/swapops.h:178:26: error: 'SWP_MIGRATION_READ_EXCLUSIVE' undeclared (first use in this function)
     178 |         return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h: In function 'make_writable_migration_entry':
   include/linux/swapops.h:183:26: error: 'SWP_MIGRATION_WRITE' undeclared (first use in this function); did you mean 'THP_MIGRATION_SPLIT'?
     183 |         return swp_entry(SWP_MIGRATION_WRITE, offset);
         |                          ^~~~~~~~~~~~~~~~~~~
         |                          THP_MIGRATION_SPLIT
   include/linux/swapops.h: In function 'make_pte_marker_entry':
   include/linux/swapops.h:304:26: error: 'SWP_PTE_MARKER' undeclared (first use in this function); did you mean 'SWP_PFN_MASK'?
     304 |         return swp_entry(SWP_PTE_MARKER, marker);
         |                          ^~~~~~~~~~~~~~
         |                          SWP_PFN_MASK
   include/linux/swapops.h: In function 'make_readable_migration_entry':
>> include/linux/swapops.h:174:1: warning: control reaches end of non-void function [-Wreturn-type]
     174 | }
         | ^
   include/linux/swapops.h: In function 'swp_offset':
   include/linux/swapops.h:108:1: warning: control reaches end of non-void function [-Wreturn-type]
     108 | }
         | ^
   include/linux/swapops.h: In function 'swp_type':
   include/linux/swapops.h:99:1: warning: control reaches end of non-void function [-Wreturn-type]
      99 | }
         | ^


vim +174 include/linux/swapops.h

6c287605fd5646 David Hildenbrand 2022-05-09  170  
4dd845b5a3e57a Alistair Popple   2021-06-30  171  static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
0697212a411c1d Christoph Lameter 2006-06-23  172  {
4dd845b5a3e57a Alistair Popple   2021-06-30  173  	return swp_entry(SWP_MIGRATION_READ, offset);
4dd845b5a3e57a Alistair Popple   2021-06-30 @174  }
4dd845b5a3e57a Alistair Popple   2021-06-30  175  
6c287605fd5646 David Hildenbrand 2022-05-09  176  static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
6c287605fd5646 David Hildenbrand 2022-05-09  177  {
6c287605fd5646 David Hildenbrand 2022-05-09  178  	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
6c287605fd5646 David Hildenbrand 2022-05-09  179  }
6c287605fd5646 David Hildenbrand 2022-05-09  180  
4dd845b5a3e57a Alistair Popple   2021-06-30  181  static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
4dd845b5a3e57a Alistair Popple   2021-06-30  182  {
4dd845b5a3e57a Alistair Popple   2021-06-30  183  	return swp_entry(SWP_MIGRATION_WRITE, offset);
0697212a411c1d Christoph Lameter 2006-06-23  184  }
0697212a411c1d Christoph Lameter 2006-06-23  185  
2e3468778dbe3e Peter Xu          2022-08-11  186  /*
2e3468778dbe3e Peter Xu          2022-08-11  187   * Returns whether the host has large enough swap offset field to support
2e3468778dbe3e Peter Xu          2022-08-11  188   * carrying over pgtable A/D bits for page migrations.  The result is
2e3468778dbe3e Peter Xu          2022-08-11  189   * pretty much arch specific.
2e3468778dbe3e Peter Xu          2022-08-11  190   */
2e3468778dbe3e Peter Xu          2022-08-11  191  static inline bool migration_entry_supports_ad(void)
2e3468778dbe3e Peter Xu          2022-08-11  192  {
2e3468778dbe3e Peter Xu          2022-08-11  193  #ifdef CONFIG_SWAP
5154e607967d3f Peter Xu          2022-08-11  194  	return swap_migration_ad_supported;
2e3468778dbe3e Peter Xu          2022-08-11  195  #else  /* CONFIG_SWAP */
2e3468778dbe3e Peter Xu          2022-08-11  196  	return false;
2e3468778dbe3e Peter Xu          2022-08-11  197  #endif	/* CONFIG_SWAP */
2e3468778dbe3e Peter Xu          2022-08-11  198  }
2e3468778dbe3e Peter Xu          2022-08-11  199  
2e3468778dbe3e Peter Xu          2022-08-11  200  static inline swp_entry_t make_migration_entry_young(swp_entry_t entry)
2e3468778dbe3e Peter Xu          2022-08-11  201  {
2e3468778dbe3e Peter Xu          2022-08-11  202  	if (migration_entry_supports_ad())
2e3468778dbe3e Peter Xu          2022-08-11  203  		return swp_entry(swp_type(entry),
2e3468778dbe3e Peter Xu          2022-08-11  204  				 swp_offset(entry) | SWP_MIG_YOUNG);
2e3468778dbe3e Peter Xu          2022-08-11  205  	return entry;
2e3468778dbe3e Peter Xu          2022-08-11  206  }
2e3468778dbe3e Peter Xu          2022-08-11  207  
2e3468778dbe3e Peter Xu          2022-08-11  208  static inline swp_entry_t make_migration_entry_dirty(swp_entry_t entry)
2e3468778dbe3e Peter Xu          2022-08-11  209  {
2e3468778dbe3e Peter Xu          2022-08-11  210  	if (migration_entry_supports_ad())
2e3468778dbe3e Peter Xu          2022-08-11  211  		return swp_entry(swp_type(entry),
2e3468778dbe3e Peter Xu          2022-08-11  212  				 swp_offset(entry) | SWP_MIG_DIRTY);
2e3468778dbe3e Peter Xu          2022-08-11  213  	return entry;
2e3468778dbe3e Peter Xu          2022-08-11  214  }
2e3468778dbe3e Peter Xu          2022-08-11  215  
0697212a411c1d Christoph Lameter 2006-06-23  216  extern void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
0697212a411c1d Christoph Lameter 2006-06-23  217  					unsigned long address);
e6c0c03245b14d Christophe Leroy  2024-07-02  218  extern void migration_entry_wait_huge(struct vm_area_struct *vma, unsigned long addr, pte_t *pte);
eba4d770efc86a Peter Xu          2022-08-11  219  #else  /* CONFIG_MIGRATION */
4dd845b5a3e57a Alistair Popple   2021-06-30  220  static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
4dd845b5a3e57a Alistair Popple   2021-06-30  221  {
4dd845b5a3e57a Alistair Popple   2021-06-30  222  	return swp_entry(0, 0);
4dd845b5a3e57a Alistair Popple   2021-06-30  223  }
4dd845b5a3e57a Alistair Popple   2021-06-30  224  
6c287605fd5646 David Hildenbrand 2022-05-09  225  static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
6c287605fd5646 David Hildenbrand 2022-05-09  226  {
6c287605fd5646 David Hildenbrand 2022-05-09  227  	return swp_entry(0, 0);
6c287605fd5646 David Hildenbrand 2022-05-09  228  }
6c287605fd5646 David Hildenbrand 2022-05-09  229  
4dd845b5a3e57a Alistair Popple   2021-06-30  230  static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
4dd845b5a3e57a Alistair Popple   2021-06-30  231  {
4dd845b5a3e57a Alistair Popple   2021-06-30  232  	return swp_entry(0, 0);
4dd845b5a3e57a Alistair Popple   2021-06-30  233  }
0697212a411c1d Christoph Lameter 2006-06-23  234  
0697212a411c1d Christoph Lameter 2006-06-23  235  static inline void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
0697212a411c1d Christoph Lameter 2006-06-23  236  					unsigned long address) { }
0cb8fd4d14165a Hugh Dickins      2023-06-08  237  static inline void migration_entry_wait_huge(struct vm_area_struct *vma,
e6c0c03245b14d Christophe Leroy  2024-07-02  238  					     unsigned long addr, pte_t *pte) { }
0697212a411c1d Christoph Lameter 2006-06-23  239  
2e3468778dbe3e Peter Xu          2022-08-11  240  static inline swp_entry_t make_migration_entry_young(swp_entry_t entry)
2e3468778dbe3e Peter Xu          2022-08-11  241  {
2e3468778dbe3e Peter Xu          2022-08-11  242  	return entry;
2e3468778dbe3e Peter Xu          2022-08-11  243  }
2e3468778dbe3e Peter Xu          2022-08-11  244  
2e3468778dbe3e Peter Xu          2022-08-11  245  static inline swp_entry_t make_migration_entry_dirty(swp_entry_t entry)
2e3468778dbe3e Peter Xu          2022-08-11  246  {
2e3468778dbe3e Peter Xu          2022-08-11  247  	return entry;
2e3468778dbe3e Peter Xu          2022-08-11  248  }
2e3468778dbe3e Peter Xu          2022-08-11  249  
eba4d770efc86a Peter Xu          2022-08-11  250  #endif	/* CONFIG_MIGRATION */
0697212a411c1d Christoph Lameter 2006-06-23  251  
07a57a338adb6e Oscar Salvador    2024-04-07  252  #ifdef CONFIG_MEMORY_FAILURE
07a57a338adb6e Oscar Salvador    2024-04-07  253  
07a57a338adb6e Oscar Salvador    2024-04-07  254  /*
07a57a338adb6e Oscar Salvador    2024-04-07  255   * Support for hardware poisoned pages
07a57a338adb6e Oscar Salvador    2024-04-07  256   */
07a57a338adb6e Oscar Salvador    2024-04-07  257  static inline swp_entry_t make_hwpoison_entry(struct page *page)
07a57a338adb6e Oscar Salvador    2024-04-07  258  {
07a57a338adb6e Oscar Salvador    2024-04-07  259  	BUG_ON(!PageLocked(page));
07a57a338adb6e Oscar Salvador    2024-04-07  260  	return swp_entry(SWP_HWPOISON, page_to_pfn(page));
07a57a338adb6e Oscar Salvador    2024-04-07  261  }
07a57a338adb6e Oscar Salvador    2024-04-07  262  
07a57a338adb6e Oscar Salvador    2024-04-07  263  static inline int is_hwpoison_entry(swp_entry_t entry)
07a57a338adb6e Oscar Salvador    2024-04-07  264  {
07a57a338adb6e Oscar Salvador    2024-04-07  265  	return swp_type(entry) == SWP_HWPOISON;
07a57a338adb6e Oscar Salvador    2024-04-07  266  }
07a57a338adb6e Oscar Salvador    2024-04-07  267  
07a57a338adb6e Oscar Salvador    2024-04-07  268  #else
07a57a338adb6e Oscar Salvador    2024-04-07  269  
07a57a338adb6e Oscar Salvador    2024-04-07  270  static inline swp_entry_t make_hwpoison_entry(struct page *page)
07a57a338adb6e Oscar Salvador    2024-04-07  271  {
07a57a338adb6e Oscar Salvador    2024-04-07  272  	return swp_entry(0, 0);
07a57a338adb6e Oscar Salvador    2024-04-07  273  }
07a57a338adb6e Oscar Salvador    2024-04-07  274  
07a57a338adb6e Oscar Salvador    2024-04-07  275  static inline int is_hwpoison_entry(swp_entry_t swp)
07a57a338adb6e Oscar Salvador    2024-04-07  276  {
07a57a338adb6e Oscar Salvador    2024-04-07  277  	return 0;
07a57a338adb6e Oscar Salvador    2024-04-07  278  }
07a57a338adb6e Oscar Salvador    2024-04-07  279  #endif
07a57a338adb6e Oscar Salvador    2024-04-07  280  
679d1033191018 Peter Xu          2022-05-12  281  typedef unsigned long pte_marker;
679d1033191018 Peter Xu          2022-05-12  282  
1db9dbc2ef0520 Peter Xu          2022-05-12  283  #define  PTE_MARKER_UFFD_WP			BIT(0)
af19487f00f34f Axel Rasmussen    2023-07-07  284  /*
af19487f00f34f Axel Rasmussen    2023-07-07  285   * "Poisoned" here is meant in the very general sense of "future accesses are
af19487f00f34f Axel Rasmussen    2023-07-07  286   * invalid", instead of referring very specifically to hardware memory errors.
af19487f00f34f Axel Rasmussen    2023-07-07  287   * This marker is meant to represent any of various different causes of this.
7c53dfbdb02491 Lorenzo Stoakes   2024-10-28  288   *
7c53dfbdb02491 Lorenzo Stoakes   2024-10-28  289   * Note that, when encountered by the faulting logic, PTEs with this marker will
7c53dfbdb02491 Lorenzo Stoakes   2024-10-28  290   * result in VM_FAULT_HWPOISON and thus regardless trigger hardware memory error
7c53dfbdb02491 Lorenzo Stoakes   2024-10-28  291   * logic.
af19487f00f34f Axel Rasmussen    2023-07-07  292   */
af19487f00f34f Axel Rasmussen    2023-07-07  293  #define  PTE_MARKER_POISONED			BIT(1)
7c53dfbdb02491 Lorenzo Stoakes   2024-10-28  294  /*
7c53dfbdb02491 Lorenzo Stoakes   2024-10-28  295   * Indicates that, on fault, this PTE will case a SIGSEGV signal to be
7c53dfbdb02491 Lorenzo Stoakes   2024-10-28  296   * sent. This means guard markers behave in effect as if the region were mapped
7c53dfbdb02491 Lorenzo Stoakes   2024-10-28  297   * PROT_NONE, rather than if they were a memory hole or equivalent.
7c53dfbdb02491 Lorenzo Stoakes   2024-10-28  298   */
7c53dfbdb02491 Lorenzo Stoakes   2024-10-28  299  #define  PTE_MARKER_GUARD			BIT(2)
7c53dfbdb02491 Lorenzo Stoakes   2024-10-28  300  #define  PTE_MARKER_MASK			(BIT(3) - 1)
679d1033191018 Peter Xu          2022-05-12  301  
679d1033191018 Peter Xu          2022-05-12  302  static inline swp_entry_t make_pte_marker_entry(pte_marker marker)
679d1033191018 Peter Xu          2022-05-12  303  {
679d1033191018 Peter Xu          2022-05-12 @304  	return swp_entry(SWP_PTE_MARKER, marker);
679d1033191018 Peter Xu          2022-05-12  305  }
679d1033191018 Peter Xu          2022-05-12  306  

:::::: The code at line 174 was first introduced by commit
:::::: 4dd845b5a3e57ad07f26ef808707b064696fe34b mm/swapops: rework swap entry manipulation code

:::::: TO: Alistair Popple <apopple@nvidia.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
