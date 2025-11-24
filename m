Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7A32BCF5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763979365; cv=none; b=m48zBNn+By8TIEUUY5+TPJPKJd1LJlWkYL/rUlfTwrpxYDPi88hi49n8s5Fw+YPC8q23Q88QGDGsyay4rZOxjmkfP1Ra8+DuLEkwqO1Bt6I0b+/q2aGxmGoZoEIU9wdO6yAmO04751vo/sMGOxNJQ/SdfHqsyfNcD5025SraThI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763979365; c=relaxed/simple;
	bh=Ho/+605yC2zD3ylJ9KzZhb8IJ1tIY8QGxSb7fXDuwbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D4TW7kMyRzrbrkwhyNmfO9bb0MhEt+6vufi1PTMmHXCAGVLJzkuHP2poIo3AJctTkN65yiY5fA0LtfktfvKZdaQPS91+JoxevBJaMuokozm9NlUrrH9BEPwhtppHWlc0/yLMzdIAWDGjLXeJ/NVHIEvhumD6mEol2/pFBRIWUIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOZzk7QS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOZzk7QS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763979361; x=1795515361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ho/+605yC2zD3ylJ9KzZhb8IJ1tIY8QGxSb7fXDuwbE=;
  b=mOZzk7QS0aHLCXbmMI+WSXke8JRDz6QJ8vU102BkfRaD9U2loRADlAVA
   GmhbJMj0mgUowSqXwKpF1ct/rx0DZUjWBY5bX1EJSZ9EPufvwOujVITdJ
   YMK36Agsi7EUq0OEU06CZ2bzE/GDbzdIQ9stRZ/XM7Qmmd/2mKmRU0hay
   EclqMuyPX67b1ml/rqTuLAmuWwe8E45hym9lbRgCu41sW4OIp+dwIN/rf
   PDUbrpnI/NIHv7iqE3M9mjQKx/GYSrFYRmKpiGkSREUhknMkehDfrEXQH
   zoCjd4emSQvaANN9ta+VLnPYFfMcHEkTY4PVnjM26BSkdXlf3DGjDmKVR
   g==;
X-CSE-ConnectionGUID: A7IZ3YI1Te+aSq+nCCVuPQ==
X-CSE-MsgGUID: SXi1fHBCR3y5JfFkAtrgmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65913713"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65913713"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 02:16:00 -0800
X-CSE-ConnectionGUID: 8N/0u4JwQwmbe2y5GcnRdg==
X-CSE-MsgGUID: j7/EkAZvTayfNWpcK2LSSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="215637335"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2025 02:15:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNTbw-000000000aj-37lN;
	Mon, 24 Nov 2025 10:15:56 +0000
Date: Mon, 24 Nov 2025 18:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-cleanup 10/12] fs/smb/client/cifsproto.h:722:39:
 error: passing argument 2 of '__release_mid' from incompatible pointer type
Message-ID: <202511241842.nS5IPxZ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-cleanup
head:   04f6c96ee8167c25e3e8403da23a09e8b926e88b
commit: 01d70b7119af7dc52a610ae90157cd7828bee909 [10/12] cifs: Remove the server pointer from smb_message
config: arc-randconfig-002-20251124 (https://download.01.org/0day-ci/archive/20251124/202511241842.nS5IPxZ0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241842.nS5IPxZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241842.nS5IPxZ0-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/cifsproto.h: At top level:
   fs/smb/client/cifsproto.h:662:19: error: static declaration of 'cifs_inval_name_dfs_link_error' follows non-static declaration
     662 | static inline int cifs_inval_name_dfs_link_error(const unsigned int xid,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:442:5: note: previous declaration of 'cifs_inval_name_dfs_link_error' with type 'int(const unsigned int,  struct cifs_tcon *, struct cifs_sb_info *, const char *, bool *)' {aka 'int(const unsigned int,  struct cifs_tcon *, struct cifs_sb_info *, const char *, _Bool *)'}
     442 | int cifs_inval_name_dfs_link_error(const unsigned int xid,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'cifs_put_smb_ses':
   fs/smb/client/cifsproto.h:683:28: error: passing argument 1 of '__cifs_put_smb_ses' from incompatible pointer type [-Werror=incompatible-pointer-types]
     683 |         __cifs_put_smb_ses(ses);
         |                            ^~~
         |                            |
         |                            struct cifs_ses *
   fs/smb/client/cifsproto.h:145:42: note: expected 'struct cifs_ses *' but argument is of type 'struct cifs_ses *'
     145 | void __cifs_put_smb_ses(struct cifs_ses *ses);
         |                         ~~~~~~~~~~~~~~~~~^~~
   In file included from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from fs/smb/client/cifs_unicode.c:7:
   fs/smb/client/cifsproto.h: In function 'cifs_smb_ses_inc_refcount':
   fs/smb/client/cifsproto.h:696:30: error: 'cifs_tcp_ses_lock' undeclared (first use in this function); did you mean 'cifs_posix_lock'?
     696 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |                              ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:171:32: note: in definition of macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:9: note: in expansion of macro 'lockdep_assert'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:24: note: in expansion of macro 'lockdep_is_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                        ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:696:9: note: in expansion of macro 'lockdep_assert_held'
     696 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |         ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:696:30: note: each undeclared identifier is reported only once for each function it appears in
     696 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |                              ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:171:32: note: in definition of macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:285:9: note: in expansion of macro 'lockdep_assert'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:285:24: note: in expansion of macro 'lockdep_is_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                        ^~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:696:9: note: in expansion of macro 'lockdep_assert_held'
     696 |         lockdep_assert_held(&cifs_tcp_ses_lock);
         |         ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:697:12: error: invalid use of undefined type 'struct cifs_ses'
     697 |         ses->ses_count++;
         |            ^~
   fs/smb/client/cifsproto.h: At top level:
   fs/smb/client/cifsproto.h:714:39: warning: 'struct smb_message' declared inside parameter list will not be visible outside of this definition or declaration
     714 | static inline void smb_get_mid(struct smb_message *smb)
         |                                       ^~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'smb_get_mid':
   fs/smb/client/cifsproto.h:716:26: error: invalid use of undefined type 'struct smb_message'
     716 |         refcount_inc(&smb->refcount);
         |                          ^~
   fs/smb/client/cifsproto.h: At top level:
   fs/smb/client/cifsproto.h:719:71: warning: 'struct smb_message' declared inside parameter list will not be visible outside of this definition or declaration
     719 | static inline void release_mid(struct TCP_Server_Info *server, struct smb_message *smb)
         |                                                                       ^~~~~~~~~~~
   In file included from arch/arc/include/asm/ptrace.h:11,
                    from arch/arc/include/asm/bug.h:11:
   fs/smb/client/cifsproto.h: In function 'release_mid':
   fs/smb/client/cifsproto.h:721:39: error: invalid use of undefined type 'struct smb_message'
     721 |         if (refcount_dec_and_test(&smb->refcount))
         |                                       ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/smb/client/cifsproto.h:721:9: note: in expansion of macro 'if'
     721 |         if (refcount_dec_and_test(&smb->refcount))
         |         ^~
   fs/smb/client/cifsproto.h:721:39: error: invalid use of undefined type 'struct smb_message'
     721 |         if (refcount_dec_and_test(&smb->refcount))
         |                                       ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   fs/smb/client/cifsproto.h:721:9: note: in expansion of macro 'if'
     721 |         if (refcount_dec_and_test(&smb->refcount))
         |         ^~
   fs/smb/client/cifsproto.h:721:39: error: invalid use of undefined type 'struct smb_message'
     721 |         if (refcount_dec_and_test(&smb->refcount))
         |                                       ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h:721:9: note: in expansion of macro 'if'
     721 |         if (refcount_dec_and_test(&smb->refcount))
         |         ^~
>> fs/smb/client/cifsproto.h:722:39: error: passing argument 2 of '__release_mid' from incompatible pointer type [-Werror=incompatible-pointer-types]
     722 |                 __release_mid(server, smb);
         |                                       ^~~
         |                                       |
         |                                       struct smb_message *
   fs/smb/client/cifsproto.h:552:72: note: expected 'struct smb_message *' but argument is of type 'struct smb_message *'
     552 | void __release_mid(struct TCP_Server_Info *server, struct smb_message *smb);
         |                                                    ~~~~~~~~~~~~~~~~~~~~^~~
   fs/smb/client/cifsproto.h: At top level:
   fs/smb/client/cifsproto.h:725:47: warning: 'struct cifs_open_info_data' declared inside parameter list will not be visible outside of this definition or declaration
     725 | static inline void cifs_free_open_info(struct cifs_open_info_data *data)
         |                                               ^~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifsproto.h: In function 'cifs_free_open_info':
   fs/smb/client/cifsproto.h:727:19: error: invalid use of undefined type 'struct cifs_open_info_data'
     727 |         kfree(data->symlink_target);
         |                   ^~
   fs/smb/client/cifsproto.h:728:26: error: invalid use of undefined type 'struct cifs_open_info_data'
     728 |         free_rsp_buf(data->reparse.io.buftype, data->reparse.io.iov.iov_base);
         |                          ^~
   fs/smb/client/cifsproto.h:728:52: error: invalid use of undefined type 'struct cifs_open_info_data'
     728 |         free_rsp_buf(data->reparse.io.buftype, data->reparse.io.iov.iov_base);
         |                                                    ^~
   fs/smb/client/cifsproto.h:729:31: error: invalid application of 'sizeof' to incomplete type 'struct cifs_open_info_data'
     729 |         memset(data, 0, sizeof(*data));
         |                               ^
   cc1: some warnings being treated as errors


vim +/__release_mid +722 fs/smb/client/cifsproto.h

   718	
   719	static inline void release_mid(struct TCP_Server_Info *server, struct smb_message *smb)
   720	{
   721		if (refcount_dec_and_test(&smb->refcount))
 > 722			__release_mid(server, smb);
   723	}
   724	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
