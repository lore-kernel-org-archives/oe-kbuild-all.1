Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B531A27E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710506953; cv=none; b=AHnmKgo9vAhc8YIUTaX7X2Ii5V5L8aRsbCUOncU12E/2j01faTq57d4RJs7QwxI+fZpduTneTgzo40iW3k8bgTSGJKH9V8pSj1SEUknXB2hfbIMEpWXdNMDGFwuOoJbdlM2KfMH5pEu8bdDYpl34SlNC6zRBNWUrGwRDLccmbgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710506953; c=relaxed/simple;
	bh=XTG408zUrakZEvexL/sRw5JJBrRlK7/ACe0VUh5BqAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VW9GgISR74Qb0Fymvpzir3tMavFfsmZI60GK4Jw+Un5aJAAloRaX8DaTldbH6cFf3sBQyNwryN0+NJvsvM1UymYKYpZUpPLW9OsD44IdYA49MSnZlV4w/5kglQeb9c9O9B/R9f1TzbTCIfC9CY1cqDLr/fwrkmYa+1KK8S4PCzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+d3m9oY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+d3m9oY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710506950; x=1742042950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XTG408zUrakZEvexL/sRw5JJBrRlK7/ACe0VUh5BqAo=;
  b=F+d3m9oYzHA6EMl0eo46oB8phEpYXVLyrsCtJBCXVnXYC4FfzqYl57Tt
   QQ1EmTWLs26DOoXtRjdmIHdDV+ZzjLLYngUk+iFcwRE1Iov2gkT8AX3uV
   kC7a5jNxYd0ArLI/Mg/WQJurTk2VPl55Bsb/89Qrh7g7z2kTNOs+eOS1B
   uH6K8FZ+H39YBtMpSlUTWKHPyy1wJFWCDSMRMPafuH9kXgkoitkRK6qnC
   XblWx3SpW4q3Jl6tnTFiXQfY9OjxTXFRn55682eQU+iiQY8WThJXB5yyy
   5vahI+Ary4x1RobNkSr/+tnYgoTUGmIi7Fukag8Ig120QK7gxFGoModbM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5505562"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5505562"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 05:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="12716565"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Mar 2024 05:49:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl6zi-000ERJ-0S;
	Fri, 15 Mar 2024 12:49:06 +0000
Date: Fri, 15 Mar 2024 20:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 63/130] fs/bcachefs/error.h:123:45: error:
 'BCH_FSCK_ERR_inode_bi_parent_subvol_nonzero' undeclared; did you mean
 'BCH_FSCK_ERR_inode_bi_parent_nonzero'?
Message-ID: <202403152033.pG6FzCdQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   c09a174058040e53f3bcdad048bac283895ca13c
commit: 0b498a5a3960e8a9a3411c12fad77ef769ed3c1e [63/130] bcachefs: check bi_parent_subvol in check_inode()
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240315/202403152033.pG6FzCdQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403152033.pG6FzCdQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403152033.pG6FzCdQ-lkp@intel.com/

Note: the bcachefs/master HEAD c09a174058040e53f3bcdad048bac283895ca13c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:207,
                    from fs/bcachefs/fsck.c:3:
   fs/bcachefs/bcachefs_format.h:221:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     221 |         struct bversion version;
         |                         ^~~~~~~
   In file included from fs/bcachefs/str_hash.h:8,
                    from fs/bcachefs/dirent.h:5,
                    from fs/bcachefs/fsck.c:9:
   fs/bcachefs/fsck.c: In function 'check_inode':
>> fs/bcachefs/error.h:123:45: error: 'BCH_FSCK_ERR_inode_bi_parent_subvol_nonzero' undeclared (first use in this function); did you mean 'BCH_FSCK_ERR_inode_bi_parent_nonzero'?
     123 |         int _ret = bch2_fsck_err(c, _flags, BCH_FSCK_ERR_##_err_type,   \
         |                                             ^~~~~~~~~~~~~
   fs/bcachefs/error.h:140:27: note: in expansion of macro '__fsck_err'
     140 |         (unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false)
         |                           ^~~~~~~~~~
   fs/bcachefs/error.h:158:9: note: in expansion of macro '__fsck_err_on'
     158 |         __fsck_err_on(cond, c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^~~~~~~~~~~~~
   fs/bcachefs/fsck.c:1012:13: note: in expansion of macro 'fsck_err_on'
    1012 |         if (fsck_err_on(u.bi_parent_subvol &&
         |             ^~~~~~~~~~~
   fs/bcachefs/error.h:123:45: note: each undeclared identifier is reported only once for each function it appears in
     123 |         int _ret = bch2_fsck_err(c, _flags, BCH_FSCK_ERR_##_err_type,   \
         |                                             ^~~~~~~~~~~~~
   fs/bcachefs/error.h:140:27: note: in expansion of macro '__fsck_err'
     140 |         (unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false)
         |                           ^~~~~~~~~~
   fs/bcachefs/error.h:158:9: note: in expansion of macro '__fsck_err_on'
     158 |         __fsck_err_on(cond, c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^~~~~~~~~~~~~
   fs/bcachefs/fsck.c:1012:13: note: in expansion of macro 'fsck_err_on'
    1012 |         if (fsck_err_on(u.bi_parent_subvol &&
         |             ^~~~~~~~~~~


vim +123 fs/bcachefs/error.h

1c6fdbd8f2465d Kent Overstreet 2017-03-16  120  
b65db750e2bb92 Kent Overstreet 2023-10-24  121  #define __fsck_err(c, _flags, _err_type, ...)				\
1c6fdbd8f2465d Kent Overstreet 2017-03-16  122  ({									\
b65db750e2bb92 Kent Overstreet 2023-10-24 @123  	int _ret = bch2_fsck_err(c, _flags, BCH_FSCK_ERR_##_err_type,	\
b65db750e2bb92 Kent Overstreet 2023-10-24  124  				 __VA_ARGS__);				\
1c6fdbd8f2465d Kent Overstreet 2017-03-16  125  									\
1ed0a5d280ef7a Kent Overstreet 2022-07-19  126  	if (_ret != -BCH_ERR_fsck_fix &&				\
1ed0a5d280ef7a Kent Overstreet 2022-07-19  127  	    _ret != -BCH_ERR_fsck_ignore) {				\
1ed0a5d280ef7a Kent Overstreet 2022-07-19  128  		ret = _ret;						\
1c6fdbd8f2465d Kent Overstreet 2017-03-16  129  		goto fsck_err;						\
1c6fdbd8f2465d Kent Overstreet 2017-03-16  130  	}								\
1c6fdbd8f2465d Kent Overstreet 2017-03-16  131  									\
1ed0a5d280ef7a Kent Overstreet 2022-07-19  132  	_ret == -BCH_ERR_fsck_fix;					\
1c6fdbd8f2465d Kent Overstreet 2017-03-16  133  })
1c6fdbd8f2465d Kent Overstreet 2017-03-16  134  

:::::: The code at line 123 was first introduced by commit
:::::: b65db750e2bb9252321fd54c284edd73c1595a09 bcachefs: Enumerate fsck errors

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
