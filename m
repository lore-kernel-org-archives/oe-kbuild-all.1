Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89E82264B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288521; cv=none; b=lNH5I+aAcn9FBWsybzAG/RCU4ONLbnY9dKJIL5nsQMNX2mZbMNdjlSUN+mEMN2uRjOS2mSH2lyw27KoSv1IGBB94YkrlNn2nT3UPHANW2Zv9f3Ps3aphofn5tKr70MxboNeMS+Qltr0Ms2d3sI9XMclN7eAyCvH5eDv3MLsRo2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288521; c=relaxed/simple;
	bh=qM0acts9luS6iAgWGaClgCinQ1ByBkOuKw6CSwLUhns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hVVNnI+iSlrlVvCYvItBfb6L6cN7h2MO3SZvZCxfBM2Vp7wIBSuhElWV5HWN9xNCdUl3sfhkSLnKLKQGND1NxXNt72aAgu63ciUzSPIjCPCa7py85R1G1a+yLVphjwRm80PzF3qjpxNFYaOdu6Kk01CjJ1Mk+A1wynf43x6m9Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bgm91ndh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bgm91ndh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758288519; x=1789824519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qM0acts9luS6iAgWGaClgCinQ1ByBkOuKw6CSwLUhns=;
  b=Bgm91ndhBslpKYCKKrfbAbTxsn0eVHAwc/dZ0f+KxweCvxBSJss3aAXw
   WlJtBHANOU4WeRdrkyxZn2qmm2OJ0HSXgQ1xM8Ny1rViM43Ifm2K2eglk
   HXX1P05iP67VJzMNiEHrcewqcf/6WfUq47llYHe25wKiVU5sn6AaNqDUS
   e1E+N6koXUrWOtp7DE961NFPN8s2lrFZJfM0UkRcUHWz2aCzpeTCIh1go
   OEcSSXpQ6ruWNIE2ch3960VOYYFsprZZ7UqGlmE8gYWoHR4JaI5AxoV/Z
   Ce2zWKOPvBPQRV+sjgIBtZDpfemLG2SHte2QVnwk9q7ItEbf1t/ynT/Ak
   Q==;
X-CSE-ConnectionGUID: iiOrJ6KiTY2YXT8vUlcdag==
X-CSE-MsgGUID: Qc+vd9nhTFqoQU8UoDH+Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60688232"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60688232"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 06:28:38 -0700
X-CSE-ConnectionGUID: NH+ySZ8BTWWDs48ytfl+Ng==
X-CSE-MsgGUID: mOE0e6ltT2SQZuDE1DgVIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175765656"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2025 06:28:37 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzbAA-0004KH-1F;
	Fri, 19 Sep 2025 13:28:34 +0000
Date: Fri, 19 Sep 2025 21:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:anna-linux-next-6.18 10/11] fs/nfs/nfstrace.h:1796:31:
 warning: 'struct nfs_local_dio' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202509192124.8ocAdBfY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git anna-linux-next-6.18
head:   79f4defe4ab1ad7b6bd760e373d8c7392d25f690
commit: f5dbc64124226ba461890dd82fe53730832f5be6 [10/11] nfs/localio: add tracepoints for misaligned DIO READ and WRITE support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250919/202509192124.8ocAdBfY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509192124.8ocAdBfY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509192124.8ocAdBfY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfs/nfstrace.h:11,
                    from fs/nfs/nfs2xdr.c:26:
>> fs/nfs/nfstrace.h:1796:31: warning: 'struct nfs_local_dio' declared inside parameter list will not be visible outside of this definition or declaration
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^~~~~~~~~~~~~
   include/linux/tracepoint.h:385:41: note: in definition of macro '__DECLARE_TRACE_COMMON'
     385 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:409:38: note: in expansion of macro 'PARAMS'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |                                      ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:31: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:608:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:35: note: in expansion of macro 'PARAMS'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                   ^~~~~~
   fs/nfs/nfstrace.h:1792:1: note: in expansion of macro 'DEFINE_EVENT'
    1792 | DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name, \
         | ^~~~~~~~~~~~
   fs/nfs/nfstrace.h:1793:9: note: in expansion of macro 'TP_PROTO'
    1793 |         TP_PROTO(const struct inode *inode,             \
         |         ^~~~~~~~
   fs/nfs/nfstrace.h:1799:1: note: in expansion of macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1799 | DEFINE_NFS_LOCAL_DIO_EVENT(read);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfstrace.h:1796:31: warning: 'struct nfs_local_dio' declared inside parameter list will not be visible outside of this definition or declaration
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^~~~~~~~~~~~~
   include/linux/tracepoint.h:388:45: note: in definition of macro '__DECLARE_TRACE_COMMON'
     388 |         register_trace_##name(void (*probe)(data_proto),                \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:409:67: note: in expansion of macro 'PARAMS'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:608:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:35: note: in expansion of macro 'PARAMS'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                   ^~~~~~
   fs/nfs/nfstrace.h:1792:1: note: in expansion of macro 'DEFINE_EVENT'
    1792 | DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name, \
         | ^~~~~~~~~~~~
   fs/nfs/nfstrace.h:1793:9: note: in expansion of macro 'TP_PROTO'
    1793 |         TP_PROTO(const struct inode *inode,             \
         |         ^~~~~~~~
   fs/nfs/nfstrace.h:1799:1: note: in expansion of macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1799 | DEFINE_NFS_LOCAL_DIO_EVENT(read);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfstrace.h:1796:31: warning: 'struct nfs_local_dio' declared inside parameter list will not be visible outside of this definition or declaration
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^~~~~~~~~~~~~
   include/linux/tracepoint.h:394:47: note: in definition of macro '__DECLARE_TRACE_COMMON'
     394 |         unregister_trace_##name(void (*probe)(data_proto),              \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:409:67: note: in expansion of macro 'PARAMS'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:608:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:35: note: in expansion of macro 'PARAMS'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                   ^~~~~~
   fs/nfs/nfstrace.h:1792:1: note: in expansion of macro 'DEFINE_EVENT'
    1792 | DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name, \
         | ^~~~~~~~~~~~
   fs/nfs/nfstrace.h:1793:9: note: in expansion of macro 'TP_PROTO'
    1793 |         TP_PROTO(const struct inode *inode,             \
         |         ^~~~~~~~
   fs/nfs/nfstrace.h:1799:1: note: in expansion of macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1799 | DEFINE_NFS_LOCAL_DIO_EVENT(read);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfstrace.h:1796:31: warning: 'struct nfs_local_dio' declared inside parameter list will not be visible outside of this definition or declaration
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^~~~~~~~~~~~~
   include/linux/tracepoint.h:399:72: note: in definition of macro '__DECLARE_TRACE_COMMON'
     399 |         static inline void check_trace_callback_type_##name(void (*cb)(data_proto)) \
         |                                                                        ^~~~~~~~~~
   include/linux/tracepoint.h:409:67: note: in expansion of macro 'PARAMS'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:608:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:35: note: in expansion of macro 'PARAMS'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                   ^~~~~~
   fs/nfs/nfstrace.h:1792:1: note: in expansion of macro 'DEFINE_EVENT'
    1792 | DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name, \
         | ^~~~~~~~~~~~
   fs/nfs/nfstrace.h:1793:9: note: in expansion of macro 'TP_PROTO'
    1793 |         TP_PROTO(const struct inode *inode,             \
         |         ^~~~~~~~
   fs/nfs/nfstrace.h:1799:1: note: in expansion of macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1799 | DEFINE_NFS_LOCAL_DIO_EVENT(read);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfstrace.h:1796:31: warning: 'struct nfs_local_dio' declared inside parameter list will not be visible outside of this definition or declaration
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^~~~~~~~~~~~~
   include/linux/tracepoint.h:385:41: note: in definition of macro '__DECLARE_TRACE_COMMON'
     385 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:409:38: note: in expansion of macro 'PARAMS'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |                                      ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:31: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:608:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:35: note: in expansion of macro 'PARAMS'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                   ^~~~~~
   fs/nfs/nfstrace.h:1792:1: note: in expansion of macro 'DEFINE_EVENT'
    1792 | DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name, \
         | ^~~~~~~~~~~~
   fs/nfs/nfstrace.h:1793:9: note: in expansion of macro 'TP_PROTO'
    1793 |         TP_PROTO(const struct inode *inode,             \
         |         ^~~~~~~~
   fs/nfs/nfstrace.h:1800:1: note: in expansion of macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1800 | DEFINE_NFS_LOCAL_DIO_EVENT(write);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfstrace.h:1796:31: warning: 'struct nfs_local_dio' declared inside parameter list will not be visible outside of this definition or declaration
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^~~~~~~~~~~~~
   include/linux/tracepoint.h:388:45: note: in definition of macro '__DECLARE_TRACE_COMMON'
     388 |         register_trace_##name(void (*probe)(data_proto),                \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:409:67: note: in expansion of macro 'PARAMS'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:608:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:35: note: in expansion of macro 'PARAMS'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                   ^~~~~~
   fs/nfs/nfstrace.h:1792:1: note: in expansion of macro 'DEFINE_EVENT'
    1792 | DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name, \
         | ^~~~~~~~~~~~
   fs/nfs/nfstrace.h:1793:9: note: in expansion of macro 'TP_PROTO'
    1793 |         TP_PROTO(const struct inode *inode,             \
         |         ^~~~~~~~
   fs/nfs/nfstrace.h:1800:1: note: in expansion of macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1800 | DEFINE_NFS_LOCAL_DIO_EVENT(write);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfstrace.h:1796:31: warning: 'struct nfs_local_dio' declared inside parameter list will not be visible outside of this definition or declaration
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^~~~~~~~~~~~~
   include/linux/tracepoint.h:394:47: note: in definition of macro '__DECLARE_TRACE_COMMON'
     394 |         unregister_trace_##name(void (*probe)(data_proto),              \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:409:67: note: in expansion of macro 'PARAMS'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:608:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:35: note: in expansion of macro 'PARAMS'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                   ^~~~~~
   fs/nfs/nfstrace.h:1792:1: note: in expansion of macro 'DEFINE_EVENT'
    1792 | DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name, \
         | ^~~~~~~~~~~~
   fs/nfs/nfstrace.h:1793:9: note: in expansion of macro 'TP_PROTO'
    1793 |         TP_PROTO(const struct inode *inode,             \
         |         ^~~~~~~~
   fs/nfs/nfstrace.h:1800:1: note: in expansion of macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1800 | DEFINE_NFS_LOCAL_DIO_EVENT(write);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfstrace.h:1796:31: warning: 'struct nfs_local_dio' declared inside parameter list will not be visible outside of this definition or declaration
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^~~~~~~~~~~~~
   include/linux/tracepoint.h:399:72: note: in definition of macro '__DECLARE_TRACE_COMMON'
     399 |         static inline void check_trace_callback_type_##name(void (*cb)(data_proto)) \
         |                                                                        ^~~~~~~~~~
   include/linux/tracepoint.h:409:67: note: in expansion of macro 'PARAMS'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:608:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:35: note: in expansion of macro 'PARAMS'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                   ^~~~~~
   fs/nfs/nfstrace.h:1792:1: note: in expansion of macro 'DEFINE_EVENT'
    1792 | DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name, \
         | ^~~~~~~~~~~~
   fs/nfs/nfstrace.h:1793:9: note: in expansion of macro 'TP_PROTO'
    1793 |         TP_PROTO(const struct inode *inode,             \
         |         ^~~~~~~~
   fs/nfs/nfstrace.h:1800:1: note: in expansion of macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1800 | DEFINE_NFS_LOCAL_DIO_EVENT(write);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfstrace.h:1796:31: warning: 'struct nfs_local_dio' declared inside parameter list will not be visible outside of this definition or declaration
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^~~~~~~~~~~~~
   include/linux/tracepoint.h:385:41: note: in definition of macro '__DECLARE_TRACE_COMMON'
     385 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:409:38: note: in expansion of macro 'PARAMS'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |                                      ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:31: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:608:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:35: note: in expansion of macro 'PARAMS'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                   ^~~~~~
   fs/nfs/nfstrace.h:1792:1: note: in expansion of macro 'DEFINE_EVENT'
    1792 | DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name, \
         | ^~~~~~~~~~~~
   fs/nfs/nfstrace.h:1793:9: note: in expansion of macro 'TP_PROTO'
    1793 |         TP_PROTO(const struct inode *inode,             \
         |         ^~~~~~~~
   fs/nfs/nfstrace.h:1801:1: note: in expansion of macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1801 | DEFINE_NFS_LOCAL_DIO_EVENT(misaligned);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfstrace.h:1796:31: warning: 'struct nfs_local_dio' declared inside parameter list will not be visible outside of this definition or declaration
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^~~~~~~~~~~~~
   include/linux/tracepoint.h:388:45: note: in definition of macro '__DECLARE_TRACE_COMMON'
     388 |         register_trace_##name(void (*probe)(data_proto),                \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:409:67: note: in expansion of macro 'PARAMS'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:608:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:35: note: in expansion of macro 'PARAMS'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                   ^~~~~~
   fs/nfs/nfstrace.h:1792:1: note: in expansion of macro 'DEFINE_EVENT'
    1792 | DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name, \
         | ^~~~~~~~~~~~
   fs/nfs/nfstrace.h:1793:9: note: in expansion of macro 'TP_PROTO'
    1793 |         TP_PROTO(const struct inode *inode,             \
         |         ^~~~~~~~
   fs/nfs/nfstrace.h:1801:1: note: in expansion of macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1801 | DEFINE_NFS_LOCAL_DIO_EVENT(misaligned);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfstrace.h:1796:31: warning: 'struct nfs_local_dio' declared inside parameter list will not be visible outside of this definition or declaration
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^~~~~~~~~~~~~
   include/linux/tracepoint.h:394:47: note: in definition of macro '__DECLARE_TRACE_COMMON'
     394 |         unregister_trace_##name(void (*probe)(data_proto),              \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:409:67: note: in expansion of macro 'PARAMS'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:608:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:35: note: in expansion of macro 'PARAMS'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                   ^~~~~~
   fs/nfs/nfstrace.h:1792:1: note: in expansion of macro 'DEFINE_EVENT'
    1792 | DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name, \
         | ^~~~~~~~~~~~
   fs/nfs/nfstrace.h:1793:9: note: in expansion of macro 'TP_PROTO'
    1793 |         TP_PROTO(const struct inode *inode,             \
         |         ^~~~~~~~
   fs/nfs/nfstrace.h:1801:1: note: in expansion of macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1801 | DEFINE_NFS_LOCAL_DIO_EVENT(misaligned);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfs/nfstrace.h:1796:31: warning: 'struct nfs_local_dio' declared inside parameter list will not be visible outside of this definition or declaration
    1796 |                  const struct nfs_local_dio *local_dio),\
         |                               ^~~~~~~~~~~~~
   include/linux/tracepoint.h:399:72: note: in definition of macro '__DECLARE_TRACE_COMMON'
     399 |         static inline void check_trace_callback_type_##name(void (*cb)(data_proto)) \
         |                                                                        ^~~~~~~~~~
   include/linux/tracepoint.h:409:67: note: in expansion of macro 'PARAMS'
     409 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:608:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:35: note: in expansion of macro 'PARAMS'
     608 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |                                   ^~~~~~
   fs/nfs/nfstrace.h:1792:1: note: in expansion of macro 'DEFINE_EVENT'
    1792 | DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name, \
         | ^~~~~~~~~~~~
   fs/nfs/nfstrace.h:1793:9: note: in expansion of macro 'TP_PROTO'
    1793 |         TP_PROTO(const struct inode *inode,             \
         |         ^~~~~~~~
   fs/nfs/nfstrace.h:1801:1: note: in expansion of macro 'DEFINE_NFS_LOCAL_DIO_EVENT'
    1801 | DEFINE_NFS_LOCAL_DIO_EVENT(misaligned);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1796 fs/nfs/nfstrace.h

  1790	
  1791	#define DEFINE_NFS_LOCAL_DIO_EVENT(name)		\
  1792	DEFINE_EVENT(nfs_local_dio_class, nfs_local_dio_##name,	\
  1793		TP_PROTO(const struct inode *inode,		\
  1794			 loff_t offset,				\
  1795			 ssize_t count,				\
> 1796			 const struct nfs_local_dio *local_dio),\
  1797		TP_ARGS(inode, offset, count, local_dio))
  1798	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
