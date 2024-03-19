Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C6E45BFE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 05:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710826707; cv=none; b=K02VUtpIUJWJhziN22vfed1q0rD5TjHtf0rtvASWgL7twl8TgmlAnwqIGSMOrlIeGdYXHGuYiJxQwLXsM+IbwM2ChGJYlbQwbFkyAtJ80SY3j2WOuMwonYtfeyIHn/J5tYAVHfaYZprmLrJodzlkSd7NVvd481V2uem20XBYd7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710826707; c=relaxed/simple;
	bh=as4ll6hj1YYYI4BurIFkTr5tcwd859jwaqce+Uy8APY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nsf3oZXQ/L9T1lj6jEmHNJ9sFlSGnCJXtgCNIa//fDZJ1MH4Jo/aHOCRGvDw6j6lxQ9RNRzq0Fecp+ei0RIleOZAtBS7I0ONzNzId1YqGbyEgjZvelokDMXd2inea+RSAINXxI9n5LIyvnuQXPGWTBhuV6Z1pyxkNqm82pIYxAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMpZg9no; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMpZg9no"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710826705; x=1742362705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=as4ll6hj1YYYI4BurIFkTr5tcwd859jwaqce+Uy8APY=;
  b=XMpZg9nozA6ufUbiQHO13d7hOvzWcBHtEBVFFHx/pDtbrQDuu0C/VsZF
   vL117LfgJdbuj7VgIJyQaJr8T3pe41c4GR9q//YLBxftrky628vAUaLQe
   V2r3nykZiyKSS370rgUsRBKxIqYe4Qr874q4gbMMFEbh/u0ZxAz7zSmNc
   frTNLb0LyuNRIbrs+kT818W4U0hMxT/y5Y5qV5gPzhyEmPuEldz99resN
   6PE7wezCuSFJu3LiF7IwXbKA0l/7LPTa+UBknfnX3meQ9ciLx1rRTsowA
   ME7ccDsY1F3/EPT04Fdl9GhfLOklvBNlCDO3+L9wPxG1V1lSS7onIZLrp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5507892"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5507892"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 22:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="14159515"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Mar 2024 22:38:23 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmSB3-000HVX-0D;
	Tue, 19 Mar 2024 05:38:21 +0000
Date: Tue, 19 Mar 2024 13:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:b-4.4-st50-rt48 313/395] fs/binfmt_em86.c:73:35: error: passing
 argument 2 of 'copy_strings_kernel' from incompatible pointer type
Message-ID: <202403191326.ZkT04FtT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st50-rt48
head:   9721fc7815f56adca91f657c671845e73f895763
commit: f4be2628637d93d86a29fa5b6f55612c6a6def88 [313/395] Add upstream swait
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240319/202403191326.ZkT04FtT-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403191326.ZkT04FtT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403191326.ZkT04FtT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/alpha/include/asm/bug.h:22:0,
                    from include/linux/bug.h:4,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/preempt.h:4,
                    from arch/alpha/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:63,
                    from include/linux/spinlock.h:50,
                    from include/linux/seqlock.h:35,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:18,
                    from include/linux/module.h:10,
                    from fs/binfmt_em86.c:11:
   include/linux/cpumask.h: In function 'cpumask_check':
   include/linux/cpumask.h:117:19: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     WARN_ON_ONCE(cpu >= nr_cpumask_bits);
                      ^
   include/asm-generic/bug.h:112:27: note: in definition of macro 'WARN_ON_ONCE'
     int __ret_warn_once = !!(condition);   \
                              ^~~~~~~~~
   fs/binfmt_em86.c: In function 'load_em86':
>> fs/binfmt_em86.c:73:35: error: passing argument 2 of 'copy_strings_kernel' from incompatible pointer type [-Werror=incompatible-pointer-types]
      retval = copy_strings_kernel(1, &i_arg, bprm);
                                      ^
   In file included from fs/binfmt_em86.c:14:0:
   include/linux/binfmts.h:116:12: note: expected 'const char * const*' but argument is of type 'char **'
    extern int copy_strings_kernel(int argc, const char *const *argv,
               ^~~~~~~~~~~~~~~~~~~
   fs/binfmt_em86.c:77:34: error: passing argument 2 of 'copy_strings_kernel' from incompatible pointer type [-Werror=incompatible-pointer-types]
     retval = copy_strings_kernel(1, &i_name, bprm);
                                     ^
   In file included from fs/binfmt_em86.c:14:0:
   include/linux/binfmts.h:116:12: note: expected 'const char * const*' but argument is of type 'char **'
    extern int copy_strings_kernel(int argc, const char *const *argv,
               ^~~~~~~~~~~~~~~~~~~
   fs/binfmt_em86.c:68:2: warning: ignoring return value of 'remove_arg_zero', declared with attribute warn_unused_result [-Wunused-result]
     remove_arg_zero(bprm);
     ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/copy_strings_kernel +73 fs/binfmt_em86.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  24  
71613c3b871c5a Al Viro        2012-10-20  25  static int load_em86(struct linux_binprm *bprm)
^1da177e4c3f41 Linus Torvalds 2005-04-16  26  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  27  	char *interp, *i_name, *i_arg;
^1da177e4c3f41 Linus Torvalds 2005-04-16  28  	struct file * file;
^1da177e4c3f41 Linus Torvalds 2005-04-16  29  	int retval;
^1da177e4c3f41 Linus Torvalds 2005-04-16  30  	struct elfhdr	elf_ex;
^1da177e4c3f41 Linus Torvalds 2005-04-16  31  
^1da177e4c3f41 Linus Torvalds 2005-04-16  32  	/* Make sure this is a Linux/Intel ELF executable... */
^1da177e4c3f41 Linus Torvalds 2005-04-16  33  	elf_ex = *((struct elfhdr *)bprm->buf);
^1da177e4c3f41 Linus Torvalds 2005-04-16  34  
^1da177e4c3f41 Linus Torvalds 2005-04-16  35  	if (memcmp(elf_ex.e_ident, ELFMAG, SELFMAG) != 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  36  		return  -ENOEXEC;
^1da177e4c3f41 Linus Torvalds 2005-04-16  37  
^1da177e4c3f41 Linus Torvalds 2005-04-16  38  	/* First of all, some simple consistency checks */
^1da177e4c3f41 Linus Torvalds 2005-04-16  39  	if ((elf_ex.e_type != ET_EXEC && elf_ex.e_type != ET_DYN) ||
^1da177e4c3f41 Linus Torvalds 2005-04-16  40  		(!((elf_ex.e_machine == EM_386) || (elf_ex.e_machine == EM_486))) ||
72c2d531920048 Al Viro        2013-09-22  41  		!bprm->file->f_op->mmap) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  42  			return -ENOEXEC;
^1da177e4c3f41 Linus Torvalds 2005-04-16  43  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  44  
51f39a1f0cea1c David Drysdale 2014-12-12  45  	/* Need to be able to load the file after exec */
51f39a1f0cea1c David Drysdale 2014-12-12  46  	if (bprm->interp_flags & BINPRM_FLAGS_PATH_INACCESSIBLE)
51f39a1f0cea1c David Drysdale 2014-12-12  47  		return -ENOENT;
51f39a1f0cea1c David Drysdale 2014-12-12  48  
^1da177e4c3f41 Linus Torvalds 2005-04-16  49  	allow_write_access(bprm->file);
^1da177e4c3f41 Linus Torvalds 2005-04-16  50  	fput(bprm->file);
^1da177e4c3f41 Linus Torvalds 2005-04-16  51  	bprm->file = NULL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  52  
^1da177e4c3f41 Linus Torvalds 2005-04-16  53  	/* Unlike in the script case, we don't have to do any hairy
^1da177e4c3f41 Linus Torvalds 2005-04-16  54  	 * parsing to find our interpreter... it's hardcoded!
^1da177e4c3f41 Linus Torvalds 2005-04-16  55  	 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  56  	interp = EM86_INTERP;
^1da177e4c3f41 Linus Torvalds 2005-04-16  57  	i_name = EM86_I_NAME;
^1da177e4c3f41 Linus Torvalds 2005-04-16  58  	i_arg = NULL;		/* We reserve the right to add an arg later */
^1da177e4c3f41 Linus Torvalds 2005-04-16  59  
^1da177e4c3f41 Linus Torvalds 2005-04-16  60  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  61  	 * Splice in (1) the interpreter's name for argv[0]
^1da177e4c3f41 Linus Torvalds 2005-04-16  62  	 *           (2) (optional) argument to interpreter
^1da177e4c3f41 Linus Torvalds 2005-04-16  63  	 *           (3) filename of emulated file (replace argv[0])
^1da177e4c3f41 Linus Torvalds 2005-04-16  64  	 *
^1da177e4c3f41 Linus Torvalds 2005-04-16  65  	 * This is done in reverse order, because of how the
^1da177e4c3f41 Linus Torvalds 2005-04-16  66  	 * user environment and arguments are stored.
^1da177e4c3f41 Linus Torvalds 2005-04-16  67  	 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  68  	remove_arg_zero(bprm);
^1da177e4c3f41 Linus Torvalds 2005-04-16  69  	retval = copy_strings_kernel(1, &bprm->filename, bprm);
^1da177e4c3f41 Linus Torvalds 2005-04-16  70  	if (retval < 0) return retval; 
^1da177e4c3f41 Linus Torvalds 2005-04-16  71  	bprm->argc++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  72  	if (i_arg) {
^1da177e4c3f41 Linus Torvalds 2005-04-16 @73  		retval = copy_strings_kernel(1, &i_arg, bprm);
^1da177e4c3f41 Linus Torvalds 2005-04-16  74  		if (retval < 0) return retval; 
^1da177e4c3f41 Linus Torvalds 2005-04-16  75  		bprm->argc++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  76  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  77  	retval = copy_strings_kernel(1, &i_name, bprm);
^1da177e4c3f41 Linus Torvalds 2005-04-16  78  	if (retval < 0)	return retval;
^1da177e4c3f41 Linus Torvalds 2005-04-16  79  	bprm->argc++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  80  
^1da177e4c3f41 Linus Torvalds 2005-04-16  81  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  82  	 * OK, now restart the process with the interpreter's inode.
^1da177e4c3f41 Linus Torvalds 2005-04-16  83  	 * Note that we use open_exec() as the name is now in kernel
^1da177e4c3f41 Linus Torvalds 2005-04-16  84  	 * space, and we don't need to copy it.
^1da177e4c3f41 Linus Torvalds 2005-04-16  85  	 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  86  	file = open_exec(interp);
^1da177e4c3f41 Linus Torvalds 2005-04-16  87  	if (IS_ERR(file))
^1da177e4c3f41 Linus Torvalds 2005-04-16  88  		return PTR_ERR(file);
^1da177e4c3f41 Linus Torvalds 2005-04-16  89  
^1da177e4c3f41 Linus Torvalds 2005-04-16  90  	bprm->file = file;
^1da177e4c3f41 Linus Torvalds 2005-04-16  91  
^1da177e4c3f41 Linus Torvalds 2005-04-16  92  	retval = prepare_binprm(bprm);
^1da177e4c3f41 Linus Torvalds 2005-04-16  93  	if (retval < 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  94  		return retval;
^1da177e4c3f41 Linus Torvalds 2005-04-16  95  
3c456bfc4ba66e Al Viro        2012-10-20  96  	return search_binary_handler(bprm);
^1da177e4c3f41 Linus Torvalds 2005-04-16  97  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  98  

:::::: The code at line 73 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
