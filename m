Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9188914B946
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895259; cv=none; b=h3zn2Rx0aX9nl8p8d4t9N7LHp9dbozWatsFySFH8258nuMg+1poXJ2s8/S6VfTYxuvBDm/w71ROGy+rY6dsl/jNGsX8edVh03H+0hw6p5fsyjrz+PI35aQpFxGSTgFfcb0c1Lx1c5TDoeKv4W1P/KLEyxiC9nBlzZf3ysoqVGzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895259; c=relaxed/simple;
	bh=VNFpwxzPWRjEFd4V3gDGuzvVEzFddcdLLjND+amKXFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJ4aPQ5tWxKyTJIw0ibvQRt9m7mqkpY2llXs6cmEqMjN5rbllcNeNyNp5HRVTVhwuKdYnhefDwNneCMVZxylRaCVQYaACW6oZoSfhnCj97wShmUJ7hnf1373IQgSCMe/OPXiZtI5VWV3nAtl1we04MPFM/tS0VEAeBH8x4glQsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHl88SAT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHl88SAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728895258; x=1760431258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VNFpwxzPWRjEFd4V3gDGuzvVEzFddcdLLjND+amKXFI=;
  b=eHl88SATHwJ+DI4KYljdyagKoB+HbTA7h2AfmC4nW7pJaKQOk3+vG0ax
   T2yzXBs7oqQTHZauKWlmYEs6lLDt734pES9jcP+9oDuHy+iPKuadpEjM5
   dRc3N/iSp6928UcZPUdeOz9q2lmzrjP3GqzdfzJK1fyDtl6blAdpfa47u
   stu7Qj6xMOml4eEdHXabBlzy3v7ydJek+Df7bnfkziLrTOymXszd7wP54
   yaR69T5WPaDjpSt4tuTYLFDZ4DvclOEBf4cbezacXPyuC+vkdo5tXKMWd
   bZPQZgGkM97gF17tii1Pc9rjyWqQ8lAwN/zzWXgtIPQev+7ghhjZTxodn
   Q==;
X-CSE-ConnectionGUID: YUXO3IvGQDiH3NYGRWrXkQ==
X-CSE-MsgGUID: Bt6a65NcTjaoAjZ6fpisNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="32030075"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="32030075"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 01:40:57 -0700
X-CSE-ConnectionGUID: viUcZDhRRVKvFeXqcQQWMw==
X-CSE-MsgGUID: A+MNcSyxS+yzmNmbsr1r3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="82084584"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Oct 2024 01:40:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0GdJ-000F5r-0V;
	Mon, 14 Oct 2024 08:40:53 +0000
Date: Mon, 14 Oct 2024 16:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 1/7] fs: Add inode_get_ino() and implement
 get_ino() for NFS
Message-ID: <202410141658.wS4Wexjt-lkp@intel.com>
References: <20241010152649.849254-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010152649.849254-1-mic@digikod.net>

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on trondmy-nfs/linux-next pcmoore-selinux/next linus/master v6.12-rc3 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/audit-Fix-inode-numbers/20241010-232916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20241010152649.849254-1-mic%40digikod.net
patch subject: [RFC PATCH v1 1/7] fs: Add inode_get_ino() and implement get_ino() for NFS
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241014/202410141658.wS4Wexjt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141658.wS4Wexjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141658.wS4Wexjt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/nfs/client.c:47:
>> fs/nfs/internal.h:454:47: error: expected '{' before '*' token
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                               ^
>> fs/nfs/internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'; have 'u64(const int *)' {aka 'long long unsigned int(const int *)'}
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/client.c:25:
   include/linux/nfs_fs.h:448:12: note: previous declaration of 'nfs_compat_user_ino64' with type 'u64(u64)' {aka 'long long unsigned int(long long unsigned int)'}
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^~~~~~~~~~~~~~~~~~~~~
   fs/nfs/client.c: In function 'nfs_free_client':
>> fs/nfs/client.c:244:9: error: implicit declaration of function 'nfs_local_disable'; did you mean 'nfs_local_probe'? [-Werror=implicit-function-declaration]
     244 |         nfs_local_disable(clp);
         |         ^~~~~~~~~~~~~~~~~
         |         nfs_local_probe
   cc1: some warnings being treated as errors
--
   In file included from fs/nfs/dir.c:46:
>> fs/nfs/internal.h:454:47: error: expected '{' before '*' token
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                               ^
>> fs/nfs/internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'; have 'u64(const int *)' {aka 'long long unsigned int(const int *)'}
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/dir.c:32:
   include/linux/nfs_fs.h:448:12: note: previous declaration of 'nfs_compat_user_ino64' with type 'u64(u64)' {aka 'long long unsigned int(long long unsigned int)'}
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^~~~~~~~~~~~~~~~~~~~~
   fs/nfs/dir.c: In function 'nfs_do_filldir':
>> fs/nfs/dir.c:1107:46: warning: passing argument 1 of 'nfs_compat_user_ino64' makes pointer from integer without a cast [-Wint-conversion]
    1107 |                     nfs_compat_user_ino64(ent->ino), ent->d_type)) {
         |                                           ~~~^~~~~
         |                                              |
         |                                              u64 {aka long long unsigned int}
   fs/nfs/internal.h:454:48: note: expected 'const int *' but argument is of type 'u64' {aka 'long long unsigned int'}
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                  ~~~~~~~~~~~~~~^~~~~
--
   In file included from fs/nfs/file.c:37:
>> fs/nfs/internal.h:454:47: error: expected '{' before '*' token
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                               ^
>> fs/nfs/internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'; have 'u64(const int *)' {aka 'long long unsigned int(const int *)'}
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/file.c:26:
   include/linux/nfs_fs.h:448:12: note: previous declaration of 'nfs_compat_user_ino64' with type 'u64(u64)' {aka 'long long unsigned int(long long unsigned int)'}
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/nfs/inode.c:49:
>> fs/nfs/internal.h:454:47: error: expected '{' before '*' token
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                               ^
>> fs/nfs/internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'; have 'u64(const int *)' {aka 'long long unsigned int(const int *)'}
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/inode.c:30:
   include/linux/nfs_fs.h:448:12: note: previous declaration of 'nfs_compat_user_ino64' with type 'u64(u64)' {aka 'long long unsigned int(long long unsigned int)'}
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/inode.c:91:40: error: expected '{' before '*' token
      91 | u64 nfs_compat_user_ino64(const struct *inode)
         |                                        ^
>> fs/nfs/inode.c:91:5: error: conflicting types for 'nfs_compat_user_ino64'; have 'u64(const int *)' {aka 'long long unsigned int(const int *)'}
      91 | u64 nfs_compat_user_ino64(const struct *inode)
         |     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/nfs_fs.h:448:12: note: previous declaration of 'nfs_compat_user_ino64' with type 'u64(u64)' {aka 'long long unsigned int(long long unsigned int)'}
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^~~~~~~~~~~~~~~~~~~~~
   fs/nfs/inode.c: In function 'nfs_compat_user_ino64':
>> fs/nfs/inode.c:98:33: error: passing argument 1 of 'NFS_FILEID' from incompatible pointer type [-Werror=incompatible-pointer-types]
      98 |         u64 fileid = NFS_FILEID(inode);
         |                                 ^~~~~
         |                                 |
         |                                 const int *
   include/linux/nfs_fs.h:369:52: note: expected 'const struct inode *' but argument is of type 'const int *'
     369 | static inline __u64 NFS_FILEID(const struct inode *inode)
         |                                ~~~~~~~~~~~~~~~~~~~~^~~~~
>> fs/nfs/inode.c:102:9: error: 'ino' undeclared (first use in this function); did you mean 'int'?
     102 |         ino = fileid;
         |         ^~~
         |         int
   fs/nfs/inode.c:102:9: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from fs/nfs/inode.c:17:
   fs/nfs/inode.c: At top level:
   fs/nfs/inode.c:107:19: error: conflicting types for 'nfs_compat_user_ino64'; have 'u64(const int *)' {aka 'long long unsigned int(const int *)'}
     107 | EXPORT_SYMBOL_GPL(nfs_compat_user_ino64);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   fs/nfs/inode.c:107:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     107 | EXPORT_SYMBOL_GPL(nfs_compat_user_ino64);
         | ^~~~~~~~~~~~~~~~~
   include/linux/nfs_fs.h:448:12: note: previous declaration of 'nfs_compat_user_ino64' with type 'u64(u64)' {aka 'long long unsigned int(long long unsigned int)'}
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^~~~~~~~~~~~~~~~~~~~~
   fs/nfs/inode.c: In function 'nfs_getattr':
>> fs/nfs/inode.c:986:43: warning: passing argument 1 of 'nfs_compat_user_ino64' makes pointer from integer without a cast [-Wint-conversion]
     986 |         stat->ino = nfs_compat_user_ino64(NFS_FILEID(inode));
         |                                           ^~~~~~~~~~~~~~~~~
         |                                           |
         |                                           __u64 {aka long long unsigned int}
   fs/nfs/inode.c:107:19: note: expected 'const int *' but argument is of type '__u64' {aka 'long long unsigned int'}
     107 | EXPORT_SYMBOL_GPL(nfs_compat_user_ino64);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   fs/nfs/inode.c:107:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     107 | EXPORT_SYMBOL_GPL(nfs_compat_user_ino64);
         | ^~~~~~~~~~~~~~~~~
   fs/nfs/inode.c: In function 'nfs_compat_user_ino64':
>> fs/nfs/inode.c:106:1: warning: control reaches end of non-void function [-Wreturn-type]
     106 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from fs/nfs/namespace.c:21:
>> fs/nfs/internal.h:454:47: error: expected '{' before '*' token
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                               ^
>> fs/nfs/internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'; have 'u64(const int *)' {aka 'long long unsigned int(const int *)'}
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/namespace.c:16:
   include/linux/nfs_fs.h:448:12: note: previous declaration of 'nfs_compat_user_ino64' with type 'u64(u64)' {aka 'long long unsigned int(long long unsigned int)'}
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/namespace.c:235:27: error: initialization of 'u64 (*)(const struct inode *)' {aka 'long long unsigned int (*)(const struct inode *)'} from incompatible pointer type 'u64 (*)(const int *)' {aka 'long long unsigned int (*)(const int *)'} [-Werror=incompatible-pointer-types]
     235 |         .get_ino        = nfs_compat_user_ino64,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   fs/nfs/namespace.c:235:27: note: (near initialization for 'nfs_mountpoint_inode_operations.get_ino')
   fs/nfs/namespace.c:241:27: error: initialization of 'u64 (*)(const struct inode *)' {aka 'long long unsigned int (*)(const struct inode *)'} from incompatible pointer type 'u64 (*)(const int *)' {aka 'long long unsigned int (*)(const int *)'} [-Werror=incompatible-pointer-types]
     241 |         .get_ino        = nfs_compat_user_ino64,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   fs/nfs/namespace.c:241:27: note: (near initialization for 'nfs_referral_inode_operations.get_ino')
   cc1: some warnings being treated as errors
--
   In file included from fs/nfs/nfs4proc.c:61:
>> fs/nfs/internal.h:454:47: error: expected '{' before '*' token
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                               ^
>> fs/nfs/internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'; have 'u64(const int *)' {aka 'long long unsigned int(const int *)'}
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/nfs4proc.c:48:
   include/linux/nfs_fs.h:448:12: note: previous declaration of 'nfs_compat_user_ino64' with type 'u64(u64)' {aka 'long long unsigned int(long long unsigned int)'}
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4proc.c: In function 'nfs4_proc_create_session':
   fs/nfs/nfs4proc.c:9462:19: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
    9462 |         unsigned *ptr;
         |                   ^~~
--
   In file included from fs/nfs/filelayout/filelayout.c:40:
>> fs/nfs/filelayout/../internal.h:454:47: error: expected '{' before '*' token
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                               ^
>> fs/nfs/filelayout/../internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'; have 'u64(const int *)' {aka 'long long unsigned int(const int *)'}
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/filelayout/filelayout.c:32:
   include/linux/nfs_fs.h:448:12: note: previous declaration of 'nfs_compat_user_ino64' with type 'u64(u64)' {aka 'long long unsigned int(long long unsigned int)'}
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/nfs/blocklayout/blocklayout.c:43:
>> fs/nfs/blocklayout/../internal.h:454:47: error: expected '{' before '*' token
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                               ^
>> fs/nfs/blocklayout/../internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'; have 'u64(const int *)' {aka 'long long unsigned int(const int *)'}
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/blocklayout/../pnfs.h:34,
                    from fs/nfs/blocklayout/blocklayout.c:41:
   include/linux/nfs_fs.h:448:12: note: previous declaration of 'nfs_compat_user_ino64' with type 'u64(u64)' {aka 'long long unsigned int(long long unsigned int)'}
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/nfs/flexfilelayout/flexfilelayout.c:22:
>> fs/nfs/flexfilelayout/../internal.h:454:47: error: expected '{' before '*' token
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                               ^
>> fs/nfs/flexfilelayout/../internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'; have 'u64(const int *)' {aka 'long long unsigned int(const int *)'}
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/flexfilelayout/flexfilelayout.c:10:
   include/linux/nfs_fs.h:448:12: note: previous declaration of 'nfs_compat_user_ino64' with type 'u64(u64)' {aka 'long long unsigned int(long long unsigned int)'}
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^~~~~~~~~~~~~~~~~~~~~
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'ff_layout_io_track_ds_error':
   fs/nfs/flexfilelayout/flexfilelayout.c:1238:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1238 |         int err;
         |             ^~~
--
   In file included from fs/nfs/flexfilelayout/flexfilelayoutdev.c:15:
>> fs/nfs/flexfilelayout/../internal.h:454:47: error: expected '{' before '*' token
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |                                               ^
>> fs/nfs/flexfilelayout/../internal.h:454:12: error: conflicting types for 'nfs_compat_user_ino64'; have 'u64(const int *)' {aka 'long long unsigned int(const int *)'}
     454 | extern u64 nfs_compat_user_ino64(const struct *inode);
         |            ^~~~~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/flexfilelayout/flexfilelayoutdev.c:10:
   include/linux/nfs_fs.h:448:12: note: previous declaration of 'nfs_compat_user_ino64' with type 'u64(u64)' {aka 'long long unsigned int(long long unsigned int)'}
     448 | extern u64 nfs_compat_user_ino64(u64 fileid);
         |            ^~~~~~~~~~~~~~~~~~~~~
   fs/nfs/flexfilelayout/flexfilelayoutdev.c: In function 'nfs4_ff_alloc_deviceid_node':
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:55:16: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      55 |         int i, ret = -ENOMEM;
         |                ^~~


vim +454 fs/nfs/internal.h

   440	
   441	/* inode.c */
   442	extern struct workqueue_struct *nfsiod_workqueue;
   443	extern struct workqueue_struct *nfslocaliod_workqueue;
   444	extern struct inode *nfs_alloc_inode(struct super_block *sb);
   445	extern void nfs_free_inode(struct inode *);
   446	extern int nfs_write_inode(struct inode *, struct writeback_control *);
   447	extern int nfs_drop_inode(struct inode *);
   448	extern void nfs_clear_inode(struct inode *);
   449	extern void nfs_evict_inode(struct inode *);
   450	extern void nfs_zap_acl_cache(struct inode *inode);
   451	extern void nfs_set_cache_invalid(struct inode *inode, unsigned long flags);
   452	extern bool nfs_check_cache_invalid(struct inode *, unsigned long);
   453	extern int nfs_wait_bit_killable(struct wait_bit_key *key, int mode);
 > 454	extern u64 nfs_compat_user_ino64(const struct *inode);
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
