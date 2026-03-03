Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3501726E711
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 03:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772506964; cv=none; b=ppRs1HfVMxpR3GdfTGonvZmHqz5pPOhF7oGiAx+DPeoAFHAjtDDQ9/XjqUPN9cmBkOiix2XTfnmy+5JIM1lK5b6S46JdRwsdJj2kfih75Ke4yzEb9mpb+VV/U4AZLoP+3dZGbBE98qQcYeZmPPhiqWKk/E7AUW3fBnEAFzP2ZBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772506964; c=relaxed/simple;
	bh=oRaHFfti3NbI8jcDiWgZJ9zVLyiwaL3Qg9H0dkcuOgI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y2szlxrjRlrZo5qUg8eQ8z1PB5C9vQC+btQdPwgtPlINrDVfZFOSFbtBUOp+XaUeukzJNcR6l5QnYfxZhIAHfMMsUN68vV24lluzmencawippWtOYKpsfP7Dq712MuDjjfXecP0RTbeyMhOIXSB0uG4kLYaiwyJ7OTqQjLajczc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrlB0CvS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrlB0CvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772506961; x=1804042961;
  h=date:from:to:cc:subject:message-id;
  bh=oRaHFfti3NbI8jcDiWgZJ9zVLyiwaL3Qg9H0dkcuOgI=;
  b=QrlB0CvSX6FjAJ7cIcrOfry3UT91hQ+XBqOAJBX0eQTueQdiLC8CM2+7
   cz9YpV/tgjVdkunCrRfqd/lX53W2rlB8r55PgG8by8Pw6ckdNQcFf6kHk
   F5ioQ2zvFtIOweyW05bWO/QIKz59018XP98N6450IbU427/6VWN846qqA
   vw0Dn6FDghv+qCIuMK/9SBNeS5GdT7wrD2IP6oMB+GVv0jstKNVXXJ03K
   Q43NDOumg7XMziYZ9eLwzZtoboNUvA4PMjN5pSkhNtSnuPZ33I268FPjL
   HzrjASCwH14jFqxhE9K762umsNtfTvoeNiER4Fgs+rKFhqAvu1pper4qK
   A==;
X-CSE-ConnectionGUID: MUTE/qI/RpqIrf214JrvKw==
X-CSE-MsgGUID: bDNBiZxORrucZdmSM8wsvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73402709"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73402709"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 19:02:41 -0800
X-CSE-ConnectionGUID: VzYdsN4ZQ5iE6V54NcWXXQ==
X-CSE-MsgGUID: OVsOxqMmSGiL302UH6V94g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="217082356"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Mar 2026 19:02:39 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxG1t-000000001gP-0Rd6;
	Tue, 03 Mar 2026 03:02:37 +0000
Date: Tue, 03 Mar 2026 11:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 17/17] fs/netfs/internal.h:569:16:
 warning: format '%lx' expects argument of type 'long unsigned int', but
 argument 4 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202603031029.uS3vdEpc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   955516269df2e8601e8736e89e91820dc3d053c2
commit: 9d1961d5a401497bb7d93ad67d38d2d96d29c4ab [17/17] netfs: Combine prepare and issue ops and grab the buffers on request
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260303/202603031029.uS3vdEpc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603031029.uS3vdEpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603031029.uS3vdEpc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/sh/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from fs/netfs/write_issue.c:34:
   fs/netfs/write_issue.c: In function 'netfs_writeback_single':
>> fs/netfs/internal.h:569:16: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     569 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |                ^~~~~~~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   fs/netfs/internal.h:569:9: note: in expansion of macro 'printk'
     569 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |         ^~~~~~
   fs/netfs/internal.h:571:26: note: in expansion of macro 'dbgprintk'
     571 | #define kenter(FMT, ...) dbgprintk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/internal.h:584:17: note: in expansion of macro 'kenter'
     584 |                 kenter(FMT, ##__VA_ARGS__);     \
         |                 ^~~~~~
   fs/netfs/write_issue.c:918:9: note: in expansion of macro '_enter'
     918 |         _enter("%lx,%lx", iov_iter_count(iter), len);
         |         ^~~~~~
   fs/netfs/internal.h:569:16: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     569 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |                ^~~~~~~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   fs/netfs/internal.h:569:9: note: in expansion of macro 'printk'
     569 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |         ^~~~~~
   fs/netfs/internal.h:571:26: note: in expansion of macro 'dbgprintk'
     571 | #define kenter(FMT, ...) dbgprintk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                          ^~~~~~~~~
   fs/netfs/internal.h:584:17: note: in expansion of macro 'kenter'
     584 |                 kenter(FMT, ##__VA_ARGS__);     \
         |                 ^~~~~~
   fs/netfs/write_issue.c:918:9: note: in expansion of macro '_enter'
     918 |         _enter("%lx,%lx", iov_iter_count(iter), len);
         |         ^~~~~~
--
   fs/smb/client/smb2pdu.c: In function 'smb2_new_read_req':
>> fs/smb/client/smb2pdu.c:4531:25: warning: unused variable 'iter' [-Wunused-variable]
    4531 |         struct iov_iter iter;
         |                         ^~~~


vim +569 fs/netfs/internal.h

915cd30cdea8811 David Howells 2023-11-20  563  
3d3c95046742e4e David Howells 2020-05-13  564  /*****************************************************************************/
3d3c95046742e4e David Howells 2020-05-13  565  /*
3d3c95046742e4e David Howells 2020-05-13  566   * debug tracing
3d3c95046742e4e David Howells 2020-05-13  567   */
3d3c95046742e4e David Howells 2020-05-13  568  #define dbgprintk(FMT, ...) \
a9d47a50cf257ff David Howells 2024-07-18 @569  	printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
3d3c95046742e4e David Howells 2020-05-13  570  

:::::: The code at line 569 was first introduced by commit
:::::: a9d47a50cf257ff1019a4e30d573777882fd785c netfs: Revert "netfs: Switch debug logging to pr_debug()"

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
