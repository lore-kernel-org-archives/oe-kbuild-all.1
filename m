Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2DD1BA873
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 18:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718909364; cv=none; b=QHXn+TdSbJv5Hoyki7yKMEBFNVk9yYd8ZPI72qNP300NGkbZIwCmZxpcMnxMD4B/7sbPcp/D9GIL4eb+2V/8FDd/LcAMTfHEl/HnxoSOjR35RmxwTxfPIS0SBLspVLFbDNrOeDKNhe9rtHuW8+hFFbL5HGr/HKzjsG7Ru5WA+2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718909364; c=relaxed/simple;
	bh=BoC0fE2J7r/delCATyT9oh58tM1pqOM/olYNAY1eyMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sYnHBMAgdexDY39Bizh4D9guAFpeYh43iS3MxNc4HtFlH9L9Hb8GztBDD0h+FQr3aobNYMUxYyjvqKDBMx4Rbz8WuFYHQ1qzhn4iL67bVw6EtBLJ1/6yhNVdtiYQYKPEqRknA7MXQ4VzY51QxgfUvTXCWpXjQ2LSjuoYc6RyFR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5MAvd1X; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5MAvd1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718909359; x=1750445359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BoC0fE2J7r/delCATyT9oh58tM1pqOM/olYNAY1eyMA=;
  b=V5MAvd1X+pcNX3SaJEL0TRxvDE/2jg6o6QNRbGygGnSH8pHAgnSFSUr7
   KtcnZNfNyHQVHdnA6ySLWNXVYM8SHO62db4+37WFWi4Ox24AOq7xZvzPL
   7nlnLsmxBRjd9pPqulKnvsp5VpAC2157TwD3mBrShXvXKvjvgoKYZTlcc
   1PNAI4t9Srk/tLGoZbZi7gzYnWk/7AIBTWKqTRt2/oWc1skVS8ftZGD9W
   CfFe6J9WgieGBmrTCaseYSjiPLF6PXn8BoYa/jTuxva4leVhaPIDKkv+u
   14WRQmuC2OCxqCMmxpOQRo2OUwWoFWgrcAwkyTEXG8J5apQU71C11wvoM
   Q==;
X-CSE-ConnectionGUID: sugAirt2TTWh5JpbXW6wPQ==
X-CSE-MsgGUID: G+7HMuZfT6KqPptHWIn6yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="27335171"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="27335171"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 11:49:18 -0700
X-CSE-ConnectionGUID: Gc6XBprTSxWDdhlWOktdOg==
X-CSE-MsgGUID: J5TYf7tIQBaU6pE12fVJ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="46686704"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jun 2024 11:49:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKMqQ-0007qT-1f;
	Thu, 20 Jun 2024 18:49:14 +0000
Date: Fri, 21 Jun 2024 02:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Kees Cook <kees@kernel.org>
Subject: [sysctl:sysctl-testing 1/1] kernel/sysctl.c:263:40: warning: passing
 argument 2 of 'proc_first_pos_non_zero_ignore' discards 'const' qualifier
 from pointer target type
Message-ID: <202406210210.ka6HzNxo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git sysctl-testing
head:   0942e6ae35b60b8f67ac961637e734b9cc34f225
commit: 0942e6ae35b60b8f67ac961637e734b9cc34f225 [1/1] sysctl: treewide: constify the ctl_table argument of proc_handlers
config: i386-buildonly-randconfig-002-20240621 (https://download.01.org/0day-ci/archive/20240621/202406210210.ka6HzNxo-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210210.ka6HzNxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210210.ka6HzNxo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sysctl.c: In function 'proc_dostring':
>> kernel/sysctl.c:263:40: warning: passing argument 2 of 'proc_first_pos_non_zero_ignore' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      proc_first_pos_non_zero_ignore(ppos, table);
                                           ^~~~~
   kernel/sysctl.c:225:13: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    static bool proc_first_pos_non_zero_ignore(loff_t *ppos,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_dointvec':
>> kernel/sysctl.c:745:26: warning: passing argument 1 of 'do_proc_dointvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     return do_proc_dointvec(table, write, buffer, lenp, ppos, NULL, NULL);
                             ^~~~~
   kernel/sysctl.c:544:12: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    static int do_proc_dointvec(struct ctl_table *table, int write,
               ^~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_douintvec':
>> kernel/sysctl.c:764:27: warning: passing argument 1 of 'do_proc_douintvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     return do_proc_douintvec(table, write, buffer, lenp, ppos,
                              ^~~~~
   kernel/sysctl.c:678:5: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    int do_proc_douintvec(struct ctl_table *table, int write,
        ^~~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_dointvec_minmax':
   kernel/sysctl.c:874:26: warning: passing argument 1 of 'do_proc_dointvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     return do_proc_dointvec(table, write, buffer, lenp, ppos,
                             ^~~~~
   kernel/sysctl.c:544:12: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    static int do_proc_dointvec(struct ctl_table *table, int write,
               ^~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_douintvec_minmax':
   kernel/sysctl.c:943:27: warning: passing argument 1 of 'do_proc_douintvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     return do_proc_douintvec(table, write, buffer, lenp, ppos,
                              ^~~~~
   kernel/sysctl.c:678:5: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    int do_proc_douintvec(struct ctl_table *table, int write,
        ^~~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_doulongvec_minmax':
>> kernel/sysctl.c:1126:38: warning: passing argument 1 of 'do_proc_doulongvec_minmax' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
        return do_proc_doulongvec_minmax(table, write, buffer, lenp, ppos, 1l, 1l);
                                         ^~~~~
   kernel/sysctl.c:1099:12: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    static int do_proc_doulongvec_minmax(struct ctl_table *table, int write,
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_doulongvec_ms_jiffies_minmax':
   kernel/sysctl.c:1149:38: warning: passing argument 1 of 'do_proc_doulongvec_minmax' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
        return do_proc_doulongvec_minmax(table, write, buffer,
                                         ^~~~~
   kernel/sysctl.c:1099:12: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    static int do_proc_doulongvec_minmax(struct ctl_table *table, int write,
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_dointvec_jiffies':
   kernel/sysctl.c:1270:29: warning: passing argument 1 of 'do_proc_dointvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
        return do_proc_dointvec(table,write,buffer,lenp,ppos,
                                ^~~~~
   kernel/sysctl.c:544:12: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    static int do_proc_dointvec(struct ctl_table *table, int write,
               ^~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_dointvec_ms_jiffies_minmax':
   kernel/sysctl.c:1281:26: warning: passing argument 1 of 'do_proc_dointvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     return do_proc_dointvec(table, write, buffer, lenp, ppos,
                             ^~~~~
   kernel/sysctl.c:544:12: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    static int do_proc_dointvec(struct ctl_table *table, int write,
               ^~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_dointvec_userhz_jiffies':
   kernel/sysctl.c:1303:26: warning: passing argument 1 of 'do_proc_dointvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     return do_proc_dointvec(table, write, buffer, lenp, ppos,
                             ^~~~~
   kernel/sysctl.c:544:12: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    static int do_proc_dointvec(struct ctl_table *table, int write,
               ^~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_dointvec_ms_jiffies':
   kernel/sysctl.c:1326:26: warning: passing argument 1 of 'do_proc_dointvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     return do_proc_dointvec(table, write, buffer, lenp, ppos,
                             ^~~~~
   kernel/sysctl.c:544:12: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    static int do_proc_dointvec(struct ctl_table *table, int write,
               ^~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_do_cad_pid':
>> kernel/sysctl.c:1339:31: warning: passing argument 2 of '__do_proc_dointvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     r = __do_proc_dointvec(&tmp, table, write, buffer,
                                  ^~~~~
   kernel/sysctl.c:471:12: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    static int __do_proc_dointvec(void *tbl_data, struct ctl_table *table,
               ^~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/string.h:3:0,
                    from arch/x86/include/asm/cpuid.h:9,
                    from arch/x86/include/asm/processor.h:19,
                    from include/linux/sched.h:13,
                    from include/linux/utsname.h:6,
                    from kernel/utsname_sysctl.c:10:
   kernel/utsname_sysctl.c: In function 'proc_do_uts_string':
>> kernel/utsname_sysctl.c:50:27: warning: passing argument 1 of 'get_uts' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     memcpy(tmp_data, get_uts(table), sizeof(tmp_data));
                              ^
   arch/x86/include/asm/string_32.h:150:45: note: in definition of macro 'memcpy'
    #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                                                ^
   kernel/utsname_sysctl.c:18:14: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    static void *get_uts(struct ctl_table *table)
                 ^~~~~~~
   In file included from arch/x86/include/asm/string.h:3:0,
                    from arch/x86/include/asm/cpuid.h:9,
                    from arch/x86/include/asm/processor.h:19,
                    from include/linux/sched.h:13,
                    from include/linux/utsname.h:6,
                    from kernel/utsname_sysctl.c:10:
   kernel/utsname_sysctl.c:63:18: warning: passing argument 1 of 'get_uts' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      memcpy(get_uts(table), tmp_data, sizeof(tmp_data));
                     ^
   arch/x86/include/asm/string_32.h:150:42: note: in definition of macro 'memcpy'
    #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                                             ^
   kernel/utsname_sysctl.c:18:14: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    static void *get_uts(struct ctl_table *table)
                 ^~~~~~~
--
   fs/pipe.c: In function 'proc_dopipe_max_size':
>> fs/pipe.c:1475:27: warning: passing argument 1 of 'do_proc_douintvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     return do_proc_douintvec(table, write, buffer, lenp, ppos,
                              ^~~~~
   In file included from include/linux/key.h:17:0,
                    from include/linux/cred.h:13,
                    from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1115,
                    from fs/pipe.c:8:
   include/linux/sysctl.h:240:5: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
    int do_proc_douintvec(struct ctl_table *table, int write,
        ^~~~~~~~~~~~~~~~~


vim +263 kernel/sysctl.c

f461d2dcd511c0 Christoph Hellwig 2020-04-24  241  
f461d2dcd511c0 Christoph Hellwig 2020-04-24  242  /**
f461d2dcd511c0 Christoph Hellwig 2020-04-24  243   * proc_dostring - read a string sysctl
f461d2dcd511c0 Christoph Hellwig 2020-04-24  244   * @table: the sysctl table
f461d2dcd511c0 Christoph Hellwig 2020-04-24  245   * @write: %TRUE if this is a write to the sysctl file
f461d2dcd511c0 Christoph Hellwig 2020-04-24  246   * @buffer: the user buffer
f461d2dcd511c0 Christoph Hellwig 2020-04-24  247   * @lenp: the size of the user buffer
f461d2dcd511c0 Christoph Hellwig 2020-04-24  248   * @ppos: file position
f461d2dcd511c0 Christoph Hellwig 2020-04-24  249   *
f461d2dcd511c0 Christoph Hellwig 2020-04-24  250   * Reads/writes a string from/to the user buffer. If the kernel
f461d2dcd511c0 Christoph Hellwig 2020-04-24  251   * buffer provided is not large enough to hold the string, the
f461d2dcd511c0 Christoph Hellwig 2020-04-24  252   * string is truncated. The copied string is %NULL-terminated.
f461d2dcd511c0 Christoph Hellwig 2020-04-24  253   * If the string is being read by the user process, it is copied
f461d2dcd511c0 Christoph Hellwig 2020-04-24  254   * and a newline '\n' is added. It is truncated if the buffer is
f461d2dcd511c0 Christoph Hellwig 2020-04-24  255   * not large enough.
f461d2dcd511c0 Christoph Hellwig 2020-04-24  256   *
f461d2dcd511c0 Christoph Hellwig 2020-04-24  257   * Returns 0 on success.
f461d2dcd511c0 Christoph Hellwig 2020-04-24  258   */
0942e6ae35b60b Joel Granados     2024-06-20  259  int proc_dostring(const struct ctl_table *table, int write,
32927393dc1ccd Christoph Hellwig 2020-04-24  260  		  void *buffer, size_t *lenp, loff_t *ppos)
^1da177e4c3f41 Linus Torvalds    2005-04-16  261  {
f461d2dcd511c0 Christoph Hellwig 2020-04-24  262  	if (write)
f461d2dcd511c0 Christoph Hellwig 2020-04-24 @263  		proc_first_pos_non_zero_ignore(ppos, table);
f461d2dcd511c0 Christoph Hellwig 2020-04-24  264  
32927393dc1ccd Christoph Hellwig 2020-04-24  265  	return _proc_do_string(table->data, table->maxlen, write, buffer, lenp,
32927393dc1ccd Christoph Hellwig 2020-04-24  266  			ppos);
f461d2dcd511c0 Christoph Hellwig 2020-04-24  267  }
f461d2dcd511c0 Christoph Hellwig 2020-04-24  268  

:::::: The code at line 263 was first introduced by commit
:::::: f461d2dcd511c020a26d4d791fae595c65ed09b6 sysctl: avoid forward declarations

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
