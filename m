Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD173C583B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044898; cv=none; b=shID/m9oIWlGJiepNCo4/sY9nPc6ZSEV/bdtJTrVQF6ztE5KN19v/d70Ct52GMM+0M10sIIuRtBn/EbHwuAK30UlLpqTZahvCER/2HIkSybWMgdx+zOC79w8p9xJVDIplv3PHqkAjTnSD4AsVvt3LEPTSa/UDrCW169Fs5dTK+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044898; c=relaxed/simple;
	bh=H/gHoWxDP/AMKw9EhAzLz/WourF3vaqZc5XbCBoko18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CmYzKbCcVBoKKX7pKx5TJrYSYCJzThUNzkAjqz6ivvFmPK/nWOE/OL2usXEDzb6he6qr/lYebufb7mqxYSIhsMyCSC+olU34zEwM7pVCthqsLKYKLvqid7eo3wo64YsAQafOc1dwGMX23XNm7wuViwvo0XzBcoAOIYsQXBLiJKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9G8FZl+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9G8FZl+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787044896; x=1818580896;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H/gHoWxDP/AMKw9EhAzLz/WourF3vaqZc5XbCBoko18=;
  b=Z9G8FZl+w9L0E7EtDm7MAIGXhHVnwwcRhXmj67a2nXcQELzxBEbBRnyW
   xPGTJmkskLM9IDdv//h43GcN4CngLb0m3UuNs8avTtsBD8Il3xRhkr7S3
   7QKK9K3swPr4834PnaIIZIx5p38NojpFJo2X+gTHwwkn8dfLkwyb624/m
   c3ag+08lRVF6NitiRh23p0cXKHwNDCxcPCMx5kv6mlMIGo7xkjXOG+aby
   CkJOiouLHYllr0Es0givNyRC2GcTDJFL4so+FDtr2VADgLRqjj0y/Vdl7
   fENB4WQVZ304OFpXgB81a3zGpnvPbZM9rWgEjYbBK+ipji98j1I8i4750
   w==;
X-CSE-ConnectionGUID: R/bRgYkLRNuZKd+G/G8SoQ==
X-CSE-MsgGUID: 1LfY6/MiSDiDWiJSfKPhnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98199197"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98199197"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 02:21:34 -0700
X-CSE-ConnectionGUID: Q+6b03LRSiGMToevU2iL3Q==
X-CSE-MsgGUID: wBsdBp8SQXekOPls4Fgwbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="267142524"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 02:21:32 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwG0f-00000000eDu-48ex;
	Tue, 18 Aug 2026 09:21:29 +0000
Date: Tue, 18 Aug 2026 17:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:collapse/rfc-v1 26/76] include/linux/swapops.h:88:21:
 error: use of undeclared identifier 'MAX_SWAPFILES_SHIFT'
Message-ID: <202608181757.mza9RRj7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git colla=
pse/rfc-v1
head:   efac4ce42bf9ea34a32d1563fe3370ee837a751f
commit: 056b294111d8d94a963c8e885186a1a723a59808 [26/76] mm/collapse: sketc=
h the new anonymous collapse engine
config: i386-randconfig-141-20260818 (https://download.01.org/0day-ci/archi=
ve/20260818/202608181757.mza9RRj7-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260818/202608181757.mza9RRj7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181757.mza9RRj7-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from mm/collapse.c:8:
   In file included from include/linux/leafops.h:11:
>> include/linux/swapops.h:88:21: error: use of undeclared identifier 'MAX_=
SWAPFILES_SHIFT'
      88 |         ret.val =3D (type << SWP_TYPE_SHIFT) | (offset & SWP_OFF=
SET_MASK);
         |                            ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:88:49: error: use of undeclared identifier 'MAX_=
SWAPFILES_SHIFT'
      88 |         ret.val =3D (type << SWP_TYPE_SHIFT) | (offset & SWP_OFF=
SET_MASK);
         |                                                        ^~~~~~~~~=
~~~~~~
   include/linux/swapops.h:28:34: note: expanded from macro 'SWP_OFFSET_MAS=
K'
      28 | #define SWP_OFFSET_MASK ((1UL << SWP_TYPE_SHIFT) - 1)
         |                                  ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:98:23: error: use of undeclared identifier 'MAX_=
SWAPFILES_SHIFT'
      98 |         return (entry.val >> SWP_TYPE_SHIFT);
         |                              ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/swapops.h:107:21: error: use of undeclared identifier 'MAX=
_SWAPFILES_SHIFT'
     107 |         return entry.val & SWP_OFFSET_MASK;
         |                            ^~~~~~~~~~~~~~~
   include/linux/swapops.h:28:34: note: expanded from macro 'SWP_OFFSET_MAS=
K'
      28 | #define SWP_OFFSET_MASK ((1UL << SWP_TYPE_SHIFT) - 1)
         |                                  ^~~~~~~~~~~~~~
   include/linux/swapops.h:27:45: note: expanded from macro 'SWP_TYPE_SHIFT'
      27 | #define SWP_TYPE_SHIFT  (BITS_PER_XA_VALUE - MAX_SWAPFILES_SHIFT)
         |                                              ^~~~~~~~~~~~~~~~~~~
>> include/linux/swapops.h:173:19: error: use of undeclared identifier 'SWP=
_MIGRATION_READ'; did you mean 'THP_MIGRATION_FAIL'?
     173 |         return swp_entry(SWP_MIGRATION_READ, offset);
         |                          ^~~~~~~~~~~~~~~~~~
         |                          THP_MIGRATION_FAIL
   include/linux/vm_event_item.h:62:3: note: 'THP_MIGRATION_FAIL' declared =
here
      62 |                 THP_MIGRATION_FAIL,
         |                 ^
   In file included from mm/collapse.c:8:
   In file included from include/linux/leafops.h:11:
>> include/linux/swapops.h:178:19: error: use of undeclared identifier 'SWP=
_MIGRATION_READ_EXCLUSIVE'
     178 |         return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/swapops.h:183:19: error: use of undeclared identifier 'SWP=
_MIGRATION_WRITE'
     183 |         return swp_entry(SWP_MIGRATION_WRITE, offset);
         |                          ^~~~~~~~~~~~~~~~~~~
>> include/linux/swapops.h:304:19: error: use of undeclared identifier 'SWP=
_PTE_MARKER'
     304 |         return swp_entry(SWP_PTE_MARKER, marker);
         |                          ^~~~~~~~~~~~~~
   8 errors generated.


vim +/MAX_SWAPFILES_SHIFT +88 include/linux/swapops.h

099dd6878b9b12 Peter Xu          2021-06-15   80 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16   81  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16   82   * Store a type+offset in=
to a swp_entry_t in an arch-independent format
^1da177e4c3f41 Linus Torvalds    2005-04-16   83   */
^1da177e4c3f41 Linus Torvalds    2005-04-16   84  static inline swp_entry_t=
 swp_entry(unsigned long type, pgoff_t offset)
^1da177e4c3f41 Linus Torvalds    2005-04-16   85  {
^1da177e4c3f41 Linus Torvalds    2005-04-16   86  	swp_entry_t ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16   87 =20
3159f943aafdba Matthew Wilcox    2017-11-03  @88  	ret.val =3D (type << SWP=
_TYPE_SHIFT) | (offset & SWP_OFFSET_MASK);
^1da177e4c3f41 Linus Torvalds    2005-04-16   89  	return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16   90  }
^1da177e4c3f41 Linus Torvalds    2005-04-16   91 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16   92  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16   93   * Extract the `type' fie=
ld from a swp_entry_t.  The swp_entry_t is in
^1da177e4c3f41 Linus Torvalds    2005-04-16   94   * arch-independent format
^1da177e4c3f41 Linus Torvalds    2005-04-16   95   */
^1da177e4c3f41 Linus Torvalds    2005-04-16   96  static inline unsigned sw=
p_type(swp_entry_t entry)
^1da177e4c3f41 Linus Torvalds    2005-04-16   97  {
3159f943aafdba Matthew Wilcox    2017-11-03   98  	return (entry.val >> SWP=
_TYPE_SHIFT);
^1da177e4c3f41 Linus Torvalds    2005-04-16   99  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  100 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  101  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  102   * Extract the `offset' f=
ield from a swp_entry_t.  The swp_entry_t is in
^1da177e4c3f41 Linus Torvalds    2005-04-16  103   * arch-independent format
^1da177e4c3f41 Linus Torvalds    2005-04-16  104   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  105  static inline pgoff_t swp=
_offset(swp_entry_t entry)
^1da177e4c3f41 Linus Torvalds    2005-04-16  106  {
3159f943aafdba Matthew Wilcox    2017-11-03 @107  	return entry.val & SWP_O=
FFSET_MASK;
^1da177e4c3f41 Linus Torvalds    2005-04-16  108  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  109 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  110  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  111   * Convert the arch-indep=
endent representation of a swp_entry_t into the
^1da177e4c3f41 Linus Torvalds    2005-04-16  112   * arch-dependent pte rep=
resentation.
^1da177e4c3f41 Linus Torvalds    2005-04-16  113   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  114  static inline pte_t swp_e=
ntry_to_pte(swp_entry_t entry)
^1da177e4c3f41 Linus Torvalds    2005-04-16  115  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  116  	swp_entry_t arch_entry;
^1da177e4c3f41 Linus Torvalds    2005-04-16  117 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  118  	arch_entry =3D __swp_ent=
ry(swp_type(entry), swp_offset(entry));
^1da177e4c3f41 Linus Torvalds    2005-04-16  119  	return __swp_entry_to_pt=
e(arch_entry);
^1da177e4c3f41 Linus Torvalds    2005-04-16  120  }
0697212a411c1d Christoph Lameter 2006-06-23  121 =20
a2c16d6cb0e478 Hugh Dickins      2011-08-03  122  static inline swp_entry_t=
 radix_to_swp_entry(void *arg)
a2c16d6cb0e478 Hugh Dickins      2011-08-03  123  {
a2c16d6cb0e478 Hugh Dickins      2011-08-03  124  	swp_entry_t entry;
a2c16d6cb0e478 Hugh Dickins      2011-08-03  125 =20
3159f943aafdba Matthew Wilcox    2017-11-03  126  	entry.val =3D xa_to_valu=
e(arg);
a2c16d6cb0e478 Hugh Dickins      2011-08-03  127  	return entry;
a2c16d6cb0e478 Hugh Dickins      2011-08-03  128  }
a2c16d6cb0e478 Hugh Dickins      2011-08-03  129 =20
a2c16d6cb0e478 Hugh Dickins      2011-08-03  130  static inline void *swp_t=
o_radix_entry(swp_entry_t entry)
a2c16d6cb0e478 Hugh Dickins      2011-08-03  131  {
3159f943aafdba Matthew Wilcox    2017-11-03  132  	return xa_mk_value(entry=
.val);
a2c16d6cb0e478 Hugh Dickins      2011-08-03  133  }
a2c16d6cb0e478 Hugh Dickins      2011-08-03  134 =20
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  135  #if IS_ENABLED(=
CONFIG_DEVICE_PRIVATE)
4dd845b5a3e57a Alistair Popple   2021-06-30  136  static inline swp_entry_t=
 make_readable_device_private_entry(pgoff_t offset)
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  137  {
4dd845b5a3e57a Alistair Popple   2021-06-30  138  	return swp_entry(SWP_DEV=
ICE_READ, offset);
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  139  }
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  140 =20
4dd845b5a3e57a Alistair Popple   2021-06-30  141  static inline swp_entry_t=
 make_writable_device_private_entry(pgoff_t offset)
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  142  {
4dd845b5a3e57a Alistair Popple   2021-06-30  143  	return swp_entry(SWP_DEV=
ICE_WRITE, offset);
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  144  }
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  145 =20
c25465eb7630ff David Hildenbrand 2025-02-10  146  static inline swp_entry_t=
 make_device_exclusive_entry(pgoff_t offset)
b756a3b5e7ead8 Alistair Popple   2021-06-30  147  {
c25465eb7630ff David Hildenbrand 2025-02-10  148  	return swp_entry(SWP_DEV=
ICE_EXCLUSIVE, offset);
b756a3b5e7ead8 Alistair Popple   2021-06-30  149  }
b756a3b5e7ead8 Alistair Popple   2021-06-30  150 =20
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  151  #else /* CONFIG=
_DEVICE_PRIVATE */
4dd845b5a3e57a Alistair Popple   2021-06-30  152  static inline swp_entry_t=
 make_readable_device_private_entry(pgoff_t offset)
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  153  {
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  154  	return swp_ent=
ry(0, 0);
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  155  }
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  156 =20
4dd845b5a3e57a Alistair Popple   2021-06-30  157  static inline swp_entry_t=
 make_writable_device_private_entry(pgoff_t offset)
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  158  {
4dd845b5a3e57a Alistair Popple   2021-06-30  159  	return swp_entry(0, 0);
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  160  }
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  161 =20
c25465eb7630ff David Hildenbrand 2025-02-10  162  static inline swp_entry_t=
 make_device_exclusive_entry(pgoff_t offset)
b756a3b5e7ead8 Alistair Popple   2021-06-30  163  {
b756a3b5e7ead8 Alistair Popple   2021-06-30  164  	return swp_entry(0, 0);
b756a3b5e7ead8 Alistair Popple   2021-06-30  165  }
b756a3b5e7ead8 Alistair Popple   2021-06-30  166 =20
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  167  #endif /* CONFI=
G_DEVICE_PRIVATE */
5042db43cc26f5 J=C3=A9r=C3=B4me Glisse     2017-09-08  168 =20
0697212a411c1d Christoph Lameter 2006-06-23  169  #ifdef CONFIG_MIGRATION
6c287605fd5646 David Hildenbrand 2022-05-09  170 =20
4dd845b5a3e57a Alistair Popple   2021-06-30  171  static inline swp_entry_t=
 make_readable_migration_entry(pgoff_t offset)
0697212a411c1d Christoph Lameter 2006-06-23  172  {
4dd845b5a3e57a Alistair Popple   2021-06-30 @173  	return swp_entry(SWP_MIG=
RATION_READ, offset);
4dd845b5a3e57a Alistair Popple   2021-06-30  174  }
4dd845b5a3e57a Alistair Popple   2021-06-30  175 =20
6c287605fd5646 David Hildenbrand 2022-05-09  176  static inline swp_entry_t=
 make_readable_exclusive_migration_entry(pgoff_t offset)
6c287605fd5646 David Hildenbrand 2022-05-09  177  {
6c287605fd5646 David Hildenbrand 2022-05-09 @178  	return swp_entry(SWP_MIG=
RATION_READ_EXCLUSIVE, offset);
6c287605fd5646 David Hildenbrand 2022-05-09  179  }
6c287605fd5646 David Hildenbrand 2022-05-09  180 =20
4dd845b5a3e57a Alistair Popple   2021-06-30  181  static inline swp_entry_t=
 make_writable_migration_entry(pgoff_t offset)
4dd845b5a3e57a Alistair Popple   2021-06-30  182  {
4dd845b5a3e57a Alistair Popple   2021-06-30 @183  	return swp_entry(SWP_MIG=
RATION_WRITE, offset);
0697212a411c1d Christoph Lameter 2006-06-23  184  }
0697212a411c1d Christoph Lameter 2006-06-23  185 =20

:::::: The code at line 88 was first introduced by commit
:::::: 3159f943aafdbacb2f94c38fdaadabf2bbde2a14 xarray: Replace exceptional=
 entries

:::::: TO: Matthew Wilcox <willy@infradead.org>
:::::: CC: Matthew Wilcox <willy@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
