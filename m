Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C702C171AB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 10:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714816947; cv=none; b=f3w8gslopvfO5My66X2g7jadzLAmEdKHkns+pU4D6PFQgXETVRhhMnRFOGo0mx/+lN9xM82RjnS8wfDgj/GQRCvWzytOj4yg6KRO3c3esrHv9IhL9cwaOVoFhd/Lp3A1gs7CT/zDpu5UQRH9rSZN2HXA0AMPqkCyqJCYohxNUEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714816947; c=relaxed/simple;
	bh=9EFFC111hrX0KkRe837aOeUeNhEwCRs+v0aNLjbooOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jiHT4UTrU2bDSAdKKUCtNExFRWwDJ/HLh++EsW/K7I4nR1tAr1juBMPPQYZidLhkBdeALv1ZESmmmtXetQHUJuOypKhPDzyC4HXSO6b6/ca7ZC3uBvbNrTBukzuhUSIamXKvqta2iULiUMlixR6hatHbe82DyH3WL7HvZnE6fCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0KZuFHd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0KZuFHd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714816945; x=1746352945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9EFFC111hrX0KkRe837aOeUeNhEwCRs+v0aNLjbooOE=;
  b=B0KZuFHdlp6Yaxn8HovgvxXYw8dtN+vXJFvCdf88ZiUaP9feWDvnrESx
   RiflnQhdKXVuf0FTZ62rjvVG3IBo1dM02+iaYx883Pg+cdS8P5sPW2M7Z
   H48ahL8hqnqzqsrqgPeeRckI0jYnIpLXBeZTpwG6n8lL+GOiug6KXJ2Vw
   jg7YWLxmzSsxcIVZxTlAJvUAe8tqH4+g8cjyrvwIxuoh4NLD8WVuijswO
   +XdWK2vl7Ijv8aJSqQlCOdRsBmIryZdC2mZ18CrJFk/WiqS991qwGo523
   koHLNEWdCsM4fvT5mY8xYetYxTn2dYNoOHWPv2+NbBThB/cQIgGFn4ClL
   A==;
X-CSE-ConnectionGUID: aiMyIxNtSyOUURI8fcV9Zw==
X-CSE-MsgGUID: 36FNLG6oTKigUp+lvYEQ+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10745722"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="10745722"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 03:02:25 -0700
X-CSE-ConnectionGUID: DB9r2tu2QxKaZ0Z/pMQ4EA==
X-CSE-MsgGUID: X4GCNmCTQU+2ySl9okRliw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="28266882"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 May 2024 03:02:24 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3CDl-000CeG-2D;
	Sat, 04 May 2024 10:02:21 +0000
Date: Sat, 4 May 2024 18:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/7] fs/binfmt_elf.c:2076:undefined
 reference to `__moddi3'
Message-ID: <202405041709.c4CoMBKy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   dff0b2a11db218e801cb09da1e163353a921d709
commit: 65e40fb8a142b422473deec3b66644df8bd4d876 [4/7] ANDROID: 16K: x86_64: Set ELF_EXEC_PAGESIZE to __PAGE_SIZE
config: i386-randconfig-006-20240504 (https://download.01.org/0day-ci/archive/20240504/202405041709.c4CoMBKy-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041709.c4CoMBKy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041709.c4CoMBKy-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/binfmt_elf.o: in function `elf_core_dump':
>> fs/binfmt_elf.c:2076:(.text+0x31bd): undefined reference to `__moddi3'


vim +2076 fs/binfmt_elf.c

8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2015  
^1da177e4c3f41 Linus Torvalds         2005-04-16  2016  /*
^1da177e4c3f41 Linus Torvalds         2005-04-16  2017   * Actual dumper
^1da177e4c3f41 Linus Torvalds         2005-04-16  2018   *
^1da177e4c3f41 Linus Torvalds         2005-04-16  2019   * This is a two-pass process; first we find the offsets of the bits,
^1da177e4c3f41 Linus Torvalds         2005-04-16  2020   * and then they are actually written out.  If we run out of core limit
^1da177e4c3f41 Linus Torvalds         2005-04-16  2021   * we just truncate.
^1da177e4c3f41 Linus Torvalds         2005-04-16  2022   */
f6151dfea21496 Masami Hiramatsu       2009-12-17  2023  static int elf_core_dump(struct coredump_params *cprm)
^1da177e4c3f41 Linus Torvalds         2005-04-16  2024  {
^1da177e4c3f41 Linus Torvalds         2005-04-16  2025  	int has_dumped = 0;
95c5436a488384 Eric W. Biederman      2022-03-08  2026  	int segs, i;
225a3f53e7fc7a Alexey Dobriyan        2020-01-30  2027  	struct elfhdr elf;
cdc3d5627d5f7c Al Viro                2013-10-05  2028  	loff_t offset = 0, dataoff;
72023656961b8c Dan Aloni              2013-09-30  2029  	struct elf_note_info info = { };
93eb211e6c9ff6 Daisuke HATAYAMA       2010-03-05  2030  	struct elf_phdr *phdr4note = NULL;
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2031  	struct elf_shdr *shdr4extnum = NULL;
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2032  	Elf_Half e_phnum;
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2033  	elf_addr_t e_shoff;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2034  
341c87bf346f57 KAMEZAWA Hiroyuki      2009-06-30  2035  	/*
341c87bf346f57 KAMEZAWA Hiroyuki      2009-06-30  2036  	 * The number of segs are recored into ELF header as 16bit value.
341c87bf346f57 KAMEZAWA Hiroyuki      2009-06-30  2037  	 * Please check DEFAULT_MAX_MAP_COUNT definition when you modify here.
341c87bf346f57 KAMEZAWA Hiroyuki      2009-06-30  2038  	 */
19e183b54528f1 Catalin Marinas        2022-12-22  2039  	segs = cprm->vma_count + elf_core_extra_phdrs(cprm);
f47aef55d9a189 Roland McGrath         2007-01-26  2040  
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2041  	/* for notes section */
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2042  	segs++;
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2043  
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2044  	/* If segs > PN_XNUM(0xffff), then e_phnum overflows. To avoid
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2045  	 * this, kernel supports extended numbering. Have a look at
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2046  	 * include/linux/elf.h for further information. */
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2047  	e_phnum = segs > PN_XNUM ? PN_XNUM : segs;
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2048  
^1da177e4c3f41 Linus Torvalds         2005-04-16  2049  	/*
3aba481fc94d83 Roland McGrath         2008-01-30  2050  	 * Collect all the non-memory information about the process for the
3aba481fc94d83 Roland McGrath         2008-01-30  2051  	 * notes.  This also sets up the file header.
^1da177e4c3f41 Linus Torvalds         2005-04-16  2052  	 */
9ec7d3230717b4 Eric W. Biederman      2022-01-31  2053  	if (!fill_note_info(&elf, e_phnum, &info, cprm))
d2530b436f114d Christoph Hellwig      2020-05-05  2054  		goto end_coredump;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2055  
3aba481fc94d83 Roland McGrath         2008-01-30  2056  	has_dumped = 1;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2057  
70e79866ab36fe Alexey Dobriyan        2023-02-28  2058  	offset += sizeof(elf);				/* ELF header */
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2059  	offset += segs * sizeof(struct elf_phdr);	/* Program headers */
^1da177e4c3f41 Linus Torvalds         2005-04-16  2060  
^1da177e4c3f41 Linus Torvalds         2005-04-16  2061  	/* Write notes phdr entry */
^1da177e4c3f41 Linus Torvalds         2005-04-16  2062  	{
38ba2f11d9ce0e Al Viro                2022-09-04  2063  		size_t sz = info.size;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2064  
c39ab6de227306 Eric W. Biederman      2020-11-25  2065  		/* For cell spufs */
e55014923e65e4 Michael Ellerman       2007-09-19  2066  		sz += elf_coredump_extra_notes_size();
bf1ab978be2318 Dwayne Grant McConnell 2006-11-23  2067  
93eb211e6c9ff6 Daisuke HATAYAMA       2010-03-05  2068  		phdr4note = kmalloc(sizeof(*phdr4note), GFP_KERNEL);
93eb211e6c9ff6 Daisuke HATAYAMA       2010-03-05  2069  		if (!phdr4note)
088e7af73a962f Daisuke HATAYAMA       2010-03-05  2070  			goto end_coredump;
93eb211e6c9ff6 Daisuke HATAYAMA       2010-03-05  2071  
93eb211e6c9ff6 Daisuke HATAYAMA       2010-03-05  2072  		fill_elf_note_phdr(phdr4note, sz, offset);
93eb211e6c9ff6 Daisuke HATAYAMA       2010-03-05  2073  		offset += sz;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2074  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  2075  
^1da177e4c3f41 Linus Torvalds         2005-04-16 @2076  	dataoff = offset = roundup(offset, ELF_EXEC_PAGESIZE);
^1da177e4c3f41 Linus Torvalds         2005-04-16  2077  
95c5436a488384 Eric W. Biederman      2022-03-08  2078  	offset += cprm->vma_data_size;
19e183b54528f1 Catalin Marinas        2022-12-22  2079  	offset += elf_core_extra_data_size(cprm);
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2080  	e_shoff = offset;
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2081  
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2082  	if (e_phnum == PN_XNUM) {
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2083  		shdr4extnum = kmalloc(sizeof(*shdr4extnum), GFP_KERNEL);
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2084  		if (!shdr4extnum)
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2085  			goto end_coredump;
225a3f53e7fc7a Alexey Dobriyan        2020-01-30  2086  		fill_extnum_info(&elf, shdr4extnum, e_shoff, segs);
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2087  	}
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2088  
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2089  	offset = dataoff;
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2090  
225a3f53e7fc7a Alexey Dobriyan        2020-01-30  2091  	if (!dump_emit(cprm, &elf, sizeof(elf)))
93eb211e6c9ff6 Daisuke HATAYAMA       2010-03-05  2092  		goto end_coredump;
93eb211e6c9ff6 Daisuke HATAYAMA       2010-03-05  2093  
ecc8c7725e6c21 Al Viro                2013-10-05  2094  	if (!dump_emit(cprm, phdr4note, sizeof(*phdr4note)))
93eb211e6c9ff6 Daisuke HATAYAMA       2010-03-05  2095  		goto end_coredump;
93eb211e6c9ff6 Daisuke HATAYAMA       2010-03-05  2096  
^1da177e4c3f41 Linus Torvalds         2005-04-16  2097  	/* Write program headers for segments dump */
95c5436a488384 Eric W. Biederman      2022-03-08  2098  	for (i = 0; i < cprm->vma_count; i++) {
95c5436a488384 Eric W. Biederman      2022-03-08  2099  		struct core_vma_metadata *meta = cprm->vma_meta + i;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2100  		struct elf_phdr phdr;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2101  
^1da177e4c3f41 Linus Torvalds         2005-04-16  2102  		phdr.p_type = PT_LOAD;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2103  		phdr.p_offset = offset;
a07279c9a8cd7d Jann Horn              2020-10-15  2104  		phdr.p_vaddr = meta->start;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2105  		phdr.p_paddr = 0;
a07279c9a8cd7d Jann Horn              2020-10-15  2106  		phdr.p_filesz = meta->dump_size;
a07279c9a8cd7d Jann Horn              2020-10-15  2107  		phdr.p_memsz = meta->end - meta->start;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2108  		offset += phdr.p_filesz;
a07279c9a8cd7d Jann Horn              2020-10-15  2109  		phdr.p_flags = 0;
a07279c9a8cd7d Jann Horn              2020-10-15  2110  		if (meta->flags & VM_READ)
a07279c9a8cd7d Jann Horn              2020-10-15  2111  			phdr.p_flags |= PF_R;
a07279c9a8cd7d Jann Horn              2020-10-15  2112  		if (meta->flags & VM_WRITE)
f4e5cc2c44bf76 Jesper Juhl            2006-06-23  2113  			phdr.p_flags |= PF_W;
a07279c9a8cd7d Jann Horn              2020-10-15  2114  		if (meta->flags & VM_EXEC)
f4e5cc2c44bf76 Jesper Juhl            2006-06-23  2115  			phdr.p_flags |= PF_X;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2116  		phdr.p_align = ELF_EXEC_PAGESIZE;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2117  
ecc8c7725e6c21 Al Viro                2013-10-05  2118  		if (!dump_emit(cprm, &phdr, sizeof(phdr)))
088e7af73a962f Daisuke HATAYAMA       2010-03-05  2119  			goto end_coredump;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2120  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  2121  
506f21c556c747 Al Viro                2013-10-05  2122  	if (!elf_core_write_extra_phdrs(cprm, offset))
1fcccbac89f5bb Daisuke HATAYAMA       2010-03-05  2123  		goto end_coredump;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2124  
^1da177e4c3f41 Linus Torvalds         2005-04-16  2125  	/* write out the notes section */
ecc8c7725e6c21 Al Viro                2013-10-05  2126  	if (!write_note_info(&info, cprm))
^1da177e4c3f41 Linus Torvalds         2005-04-16  2127  		goto end_coredump;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2128  
c39ab6de227306 Eric W. Biederman      2020-11-25  2129  	/* For cell spufs */
cdc3d5627d5f7c Al Viro                2013-10-05  2130  	if (elf_coredump_extra_notes_write(cprm))
e55014923e65e4 Michael Ellerman       2007-09-19  2131  		goto end_coredump;
bf1ab978be2318 Dwayne Grant McConnell 2006-11-23  2132  
d025c9db7f31fc Andi Kleen             2006-09-30  2133  	/* Align to page */
d0f1088b31db2d Al Viro                2020-03-08  2134  	dump_skip_to(cprm, dataoff);
^1da177e4c3f41 Linus Torvalds         2005-04-16  2135  
95c5436a488384 Eric W. Biederman      2022-03-08  2136  	for (i = 0; i < cprm->vma_count; i++) {
95c5436a488384 Eric W. Biederman      2022-03-08  2137  		struct core_vma_metadata *meta = cprm->vma_meta + i;
a07279c9a8cd7d Jann Horn              2020-10-15  2138  
a07279c9a8cd7d Jann Horn              2020-10-15  2139  		if (!dump_user_range(cprm, meta->start, meta->dump_size))
^1da177e4c3f41 Linus Torvalds         2005-04-16  2140  			goto end_coredump;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2141  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  2142  
aa3e7eaf0a0f06 Al Viro                2013-10-05  2143  	if (!elf_core_write_extra_data(cprm))
1fcccbac89f5bb Daisuke HATAYAMA       2010-03-05  2144  		goto end_coredump;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2145  
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2146  	if (e_phnum == PN_XNUM) {
13046ece9625f9 Al Viro                2013-10-05  2147  		if (!dump_emit(cprm, shdr4extnum, sizeof(*shdr4extnum)))
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2148  			goto end_coredump;
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2149  	}
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2150  
^1da177e4c3f41 Linus Torvalds         2005-04-16  2151  end_coredump:
3aba481fc94d83 Roland McGrath         2008-01-30  2152  	free_note_info(&info);
8d9032bbe4671d Daisuke HATAYAMA       2010-03-05  2153  	kfree(shdr4extnum);
93eb211e6c9ff6 Daisuke HATAYAMA       2010-03-05  2154  	kfree(phdr4note);
^1da177e4c3f41 Linus Torvalds         2005-04-16  2155  	return has_dumped;
^1da177e4c3f41 Linus Torvalds         2005-04-16  2156  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  2157  

:::::: The code at line 2076 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
