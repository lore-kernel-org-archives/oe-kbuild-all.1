Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45508158D98
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 11:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698206; cv=none; b=ab7vi+KgiPZ3ZgjKX0FRtnnpHuvOL7tpL9566h8Oqiw1jGp686ta0biS50+eq8aJQVbGW7LDmosRDOBaQJn4VbQF8JwD4tdJ7FjyOtTZFPGbmvwDmtmRgWHgldRdT4P66GqL1mwfIGvvEnNRGkhYOR/4J8SZX00GLdc3r9Iwhck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698206; c=relaxed/simple;
	bh=b6rzflAv65RWok2IvipOANm4pwqZvG194Z47r/ZtYsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qa6ODmXqaYvZ4XIYFjlsRdc9HPyBhC0QfLm4gaayZiHwcFiIq7RtUI/dAVo+uljrcINig25Po2voHn64W+FQXQFWHmch+COyS8dwV/SInMaIjC5yyLPtcn8XJKB/GdnvNdzYk0Jkj5TL+sw1EQH+jALhan0IyUZrxCRdRlqD7Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABCIIB2v; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABCIIB2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720698204; x=1752234204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b6rzflAv65RWok2IvipOANm4pwqZvG194Z47r/ZtYsE=;
  b=ABCIIB2vKH6GQcU+s3FAASewsewMC4AL+LBH9weSuLWiYHosnQ8CXILz
   IrRSUFcH6jND9O9Lg8U1/Q3A8zulD5Po15N1281U/o5ufNx+JthXsSTkc
   HPneGS5gOG/iITO9IjnBiVqlngKQR91rmq/8GgaJtb+HUcWTajTpv5l4+
   n0iZ++dmoxO9Ufz7rd7KtEuFWw0VYxTGf6gQOkWUZDlkw6oUqZVhzdMDo
   62yXXff19PRl0qF4VQLjhKpIzDVagf0W8oOCsD5uaxtyU/429ccvw28Xx
   SEu76D44lmsrnAK1Nl3oaeqsHpJqSwBzWMHq68NJHqZuFOQ7e8ffmQS2c
   Q==;
X-CSE-ConnectionGUID: yBOKQ5vKTqaKxosnrKcvHA==
X-CSE-MsgGUID: EmchlIVHTz2k3raxupF47g==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17913984"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="17913984"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 04:43:23 -0700
X-CSE-ConnectionGUID: cQU1w8qGQf22o/VQo6Nhxw==
X-CSE-MsgGUID: /1zGK+vFSW6oMwUen3xyfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="53124942"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jul 2024 04:43:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRsCl-000ZDm-1G;
	Thu, 11 Jul 2024 11:43:19 +0000
Date: Thu, 11 Jul 2024 19:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>
Subject: [linux-next:master 12377/12643]
 arch/loongarch/include/asm/pgtable.h:614: warning: "pud_leaf" redefined
Message-ID: <202407111910.kbzq5PZK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: 4d460b397e28528bab4b2cea6a9337560e78b0b8 [12377/12643] mm: add p{g/4}d_leaf() in asm-generic/pgtable-nop{4/u}d.h
config: loongarch-randconfig-r031-20230725 (https://download.01.org/0day-ci/archive/20240711/202407111910.kbzq5PZK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111910.kbzq5PZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111910.kbzq5PZK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from arch/loongarch/kernel/asm-offsets.c:9:
>> arch/loongarch/include/asm/pgtable.h:614: warning: "pud_leaf" redefined
     614 | #define pud_leaf(pud)           ((pud_val(pud) & _PAGE_HUGE) != 0)
         | 
   In file included from arch/loongarch/include/asm/pgtable.h:18:
   include/asm-generic/pgtable-nopmd.h:34: note: this is the location of the previous definition
      34 | #define pud_leaf pud_leaf
         | 
--
   In file included from arch/loongarch/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/debugfs.h:15,
                    from drivers/hwmon/pmbus/ibm-cffps.c:8:
>> arch/loongarch/include/asm/pgtable.h:614: warning: "pud_leaf" redefined
     614 | #define pud_leaf(pud)           ((pud_val(pud) & _PAGE_HUGE) != 0)
         | 
   In file included from arch/loongarch/include/asm/pgtable.h:18:
   include/asm-generic/pgtable-nopmd.h:34: note: this is the location of the previous definition
      34 | #define pud_leaf pud_leaf
         | 
   drivers/hwmon/pmbus/ibm-cffps.c: In function 'ibm_cffps_debugfs_read':
   drivers/hwmon/pmbus/ibm-cffps.c:169:60: warning: '%02X' directive output may be truncated writing between 2 and 8 bytes into a region of size 3 [-Wformat-truncation=]
     169 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
         |                                                            ^~~~
   drivers/hwmon/pmbus/ibm-cffps.c:169:59: note: directive argument in the range [0, 2147483647]
     169 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
         |                                                           ^~~~~~
   drivers/hwmon/pmbus/ibm-cffps.c:169:33: note: 'snprintf' output between 3 and 9 bytes into a destination of size 3
     169 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/ibm-cffps.c:180:60: warning: '%04X' directive output may be truncated writing between 4 and 8 bytes into a region of size 5 [-Wformat-truncation=]
     180 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
         |                                                            ^~~~
   drivers/hwmon/pmbus/ibm-cffps.c:180:59: note: directive argument in the range [0, 2147483647]
     180 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
         |                                                           ^~~~~~
   drivers/hwmon/pmbus/ibm-cffps.c:180:33: note: 'snprintf' output between 5 and 9 bytes into a destination of size 5
     180 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from arch/loongarch/kernel/asm-offsets.c:9:
>> arch/loongarch/include/asm/pgtable.h:614: warning: "pud_leaf" redefined
     614 | #define pud_leaf(pud)           ((pud_val(pud) & _PAGE_HUGE) != 0)
         | 
   In file included from arch/loongarch/include/asm/pgtable.h:18:
   include/asm-generic/pgtable-nopmd.h:34: note: this is the location of the previous definition
      34 | #define pud_leaf pud_leaf
         | 
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from arch/loongarch/include/asm/vdso.h:10,
                    from arch/loongarch/vdso/vgetcpu.c:6:
>> arch/loongarch/include/asm/pgtable.h:614: warning: "pud_leaf" redefined
     614 | #define pud_leaf(pud)           ((pud_val(pud) & _PAGE_HUGE) != 0)
         | 
   In file included from arch/loongarch/include/asm/pgtable.h:18:
   include/asm-generic/pgtable-nopmd.h:34: note: this is the location of the previous definition
      34 | #define pud_leaf pud_leaf
         | 
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from arch/loongarch/include/asm/vdso.h:10,
                    from arch/loongarch/include/asm/vdso/vdso.h:11,
                    from arch/loongarch/include/asm/vdso/gettimeofday.h:13,
                    from include/vdso/datapage.h:149,
                    from lib/vdso/gettimeofday.c:5,
                    from <command-line>:
>> arch/loongarch/include/asm/pgtable.h:614: warning: "pud_leaf" redefined
     614 | #define pud_leaf(pud)           ((pud_val(pud) & _PAGE_HUGE) != 0)
         | 
   In file included from arch/loongarch/include/asm/pgtable.h:18:
   include/asm-generic/pgtable-nopmd.h:34: note: this is the location of the previous definition
      34 | #define pud_leaf pud_leaf
         | 


vim +/pud_leaf +614 arch/loongarch/include/asm/pgtable.h

d4b6f1562a3c32 Huacai Chen    2022-05-31  612  
303be4b33562a5 Hongchen Zhang 2023-09-06  613  #define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) != 0)
303be4b33562a5 Hongchen Zhang 2023-09-06 @614  #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
303be4b33562a5 Hongchen Zhang 2023-09-06  615  

:::::: The code at line 614 was first introduced by commit
:::::: 303be4b33562a5b689261ced1616bf16ad49efa7 LoongArch: mm: Add p?d_leaf() definitions

:::::: TO: Hongchen Zhang <zhanghongchen@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
