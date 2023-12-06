Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA501321B2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 12:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lclL7grO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701865102; x=1733401102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=anYYI/95ejvIxKDQtp8USD39Xx35qNsxSQReNS0s2/Y=;
  b=lclL7grOyrtt2J4hxRFdG6OzsFFBqZ6zTTsk9I1aoaTXgOg3s0Mp4Gpp
   Bb9UKe8aEj4z5snrbgjYLDaIHku/xO/WwP3FF0e9+v6qTPZHjvqBBGbfB
   SPOHidm1R4CGE1npsVScKqa9OtnrgQVaGwhOB9UZdXvCJVl+1asul1YkQ
   zG74HthMfTomdXbP7qp88n5413MxRo3SyOjcj5JTxgpc9HY20F7ZSy8B8
   sQsQVH7SmFq40Oy523DMPCVfvQFA5LVqqZLJBtRW8s8FRvUEBwFhps6bD
   KZ2PpQZYclGmx31Vs6Chw9SUL4si1dhzLPqqPWYiWTUOHdm9HZ82qpE/B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="392920846"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="392920846"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 04:18:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="12675353"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2023 04:18:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAqr3-000Am8-0A;
	Wed, 06 Dec 2023 12:18:17 +0000
Date: Wed, 6 Dec 2023 20:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-metadir-experiments 1/1] fs/xfs/scrub/trace.h:3804:1:
 error: conflicting types for '__traceiter_xrep_metapath_lookup'
Message-ID: <202312062002.ArOaLihA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-metadir-experiments
head:   d1a3a0e0765d400aeb9bc68c58a77b89d8bb3d4f
commit: d1a3a0e0765d400aeb9bc68c58a77b89d8bb3d4f [1/1] xfs: metadir experiments
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231206/202312062002.ArOaLihA-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312062002.ArOaLihA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062002.ArOaLihA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
   fs/xfs/scrub/trace.h:1979:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
   fs/xfs/scrub/trace.h:1979:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
   fs/xfs/scrub/trace.h:1979:1: error: conflicting types for '__traceiter_xchk_metapath_lookup'
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/define_trace.h:57:2: note: expanded from macro '\
   DEFINE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:319:6: note: expanded from macro 'DEFINE_TRACE_FN'
           int __traceiter_##_name(void *__data, proto)                    \
               ^
   <scratch space>:26:1: note: expanded from here
   __traceiter_xchk_metapath_lookup
   ^
   fs/xfs/scrub/trace.h:1979:1: note: previous declaration is here
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
   ^
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/linux/tracepoint.h:555:2: note: expanded from macro '\
   DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:252:13: note: expanded from macro '__DECLARE_TRACE'
           extern int __traceiter_##name(data_proto);                      \
                      ^
   <scratch space>:177:1: note: expanded from here
   __traceiter_xchk_metapath_lookup
   ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
   fs/xfs/scrub/trace.h:1979:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
   fs/xfs/scrub/trace.h:1979:1: error: conflicting types for '__probestub_xchk_metapath_lookup'
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/define_trace.h:57:2: note: expanded from macro '\
   DEFINE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:335:7: note: expanded from macro 'DEFINE_TRACE_FN'
           void __probestub_##_name(void *__data, proto)                   \
                ^
   <scratch space>:37:1: note: expanded from here
   __probestub_xchk_metapath_lookup
   ^
   fs/xfs/scrub/trace.h:1979:1: note: previous declaration is here
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/define_trace.h:57:2: note: expanded from macro '\
   DEFINE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:306:7: note: expanded from macro 'DEFINE_TRACE_FN'
           void __probestub_##_name(void *__data, proto);                  \
                ^
   <scratch space>:16:1: note: expanded from here
   __probestub_xchk_metapath_lookup
   ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
   fs/xfs/scrub/trace.h:3804:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:3804:1: error: conflicting types for '__traceiter_xrep_metapath_lookup'
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/define_trace.h:57:2: note: expanded from macro '\
   DEFINE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:305:6: note: expanded from macro 'DEFINE_TRACE_FN'
           int __traceiter_##_name(void *__data, proto);                   \
               ^
   <scratch space>:85:1: note: expanded from here
   __traceiter_xrep_metapath_lookup
   ^
   fs/xfs/scrub/trace.h:3804:1: note: previous declaration is here
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
   ^
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/linux/tracepoint.h:555:2: note: expanded from macro '\
   DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:252:13: note: expanded from macro '__DECLARE_TRACE'
           extern int __traceiter_##name(data_proto);                      \
                      ^
   <scratch space>:56:1: note: expanded from here
   __traceiter_xrep_metapath_lookup
   ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
   fs/xfs/scrub/trace.h:3804:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
   fs/xfs/scrub/trace.h:3804:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:3804:1: error: conflicting types for '__traceiter_xrep_metapath_lookup'
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/define_trace.h:57:2: note: expanded from macro '\
   DEFINE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:319:6: note: expanded from macro 'DEFINE_TRACE_FN'
           int __traceiter_##_name(void *__data, proto)                    \
               ^
   <scratch space>:96:1: note: expanded from here
   __traceiter_xrep_metapath_lookup
   ^
   fs/xfs/scrub/trace.h:3804:1: note: previous declaration is here
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
   ^
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/linux/tracepoint.h:555:2: note: expanded from macro '\
   DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:252:13: note: expanded from macro '__DECLARE_TRACE'
           extern int __traceiter_##name(data_proto);                      \
                      ^
   <scratch space>:56:1: note: expanded from here
   __traceiter_xrep_metapath_lookup
   ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
   fs/xfs/scrub/trace.h:3804:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:3804:1: error: conflicting types for '__probestub_xrep_metapath_lookup'
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/define_trace.h:57:2: note: expanded from macro '\
   DEFINE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:335:7: note: expanded from macro 'DEFINE_TRACE_FN'
           void __probestub_##_name(void *__data, proto)                   \
                ^
   <scratch space>:107:1: note: expanded from here
   __probestub_xrep_metapath_lookup
   ^
   fs/xfs/scrub/trace.h:3804:1: note: previous declaration is here
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/define_trace.h:57:2: note: expanded from macro '\
   DEFINE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:306:7: note: expanded from macro 'DEFINE_TRACE_FN'
           void __probestub_##_name(void *__data, proto);                  \
                ^
   <scratch space>:86:1: note: expanded from here
   __probestub_xrep_metapath_lookup
   ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
   fs/xfs/scrub/trace.h:3805:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_try_unlink);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:3805:1: error: conflicting types for '__traceiter_xrep_metapath_try_unlink'
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/define_trace.h:57:2: note: expanded from macro '\
   DEFINE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:305:6: note: expanded from macro 'DEFINE_TRACE_FN'
           int __traceiter_##_name(void *__data, proto);                   \
               ^
   <scratch space>:10:1: note: expanded from here
   __traceiter_xrep_metapath_try_unlink
   ^
   fs/xfs/scrub/trace.h:3805:1: note: previous declaration is here
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_try_unlink);
   ^
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/linux/tracepoint.h:555:2: note: expanded from macro '\
   DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:252:13: note: expanded from macro '__DECLARE_TRACE'
           extern int __traceiter_##name(data_proto);                      \
                      ^
   <scratch space>:125:1: note: expanded from here
   __traceiter_xrep_metapath_try_unlink
   ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
   fs/xfs/scrub/trace.h:3805:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_try_unlink);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
   fs/xfs/scrub/trace.h:3805:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:3805:1: error: conflicting types for '__traceiter_xrep_metapath_try_unlink'
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/define_trace.h:57:2: note: expanded from macro '\
   DEFINE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:319:6: note: expanded from macro 'DEFINE_TRACE_FN'
           int __traceiter_##_name(void *__data, proto)                    \
               ^
   <scratch space>:21:1: note: expanded from here
   __traceiter_xrep_metapath_try_unlink
   ^
   fs/xfs/scrub/trace.h:3805:1: note: previous declaration is here
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_try_unlink);
   ^
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/linux/tracepoint.h:555:2: note: expanded from macro '\
   DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:252:13: note: expanded from macro '__DECLARE_TRACE'
           extern int __traceiter_##name(data_proto);                      \
                      ^
   <scratch space>:125:1: note: expanded from here
   __traceiter_xrep_metapath_try_unlink
   ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
   fs/xfs/scrub/trace.h:3805:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_try_unlink);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:3805:1: error: conflicting types for '__probestub_xrep_metapath_try_unlink'
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/define_trace.h:57:2: note: expanded from macro '\
   DEFINE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:335:7: note: expanded from macro 'DEFINE_TRACE_FN'
           void __probestub_##_name(void *__data, proto)                   \
                ^
   <scratch space>:32:1: note: expanded from here
   __probestub_xrep_metapath_try_unlink
   ^
   fs/xfs/scrub/trace.h:3805:1: note: previous declaration is here
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/define_trace.h:57:2: note: expanded from macro '\
   DEFINE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:306:7: note: expanded from macro 'DEFINE_TRACE_FN'
           void __probestub_##_name(void *__data, proto);                  \
                ^
   <scratch space>:11:1: note: expanded from here
   __probestub_xrep_metapath_try_unlink
   ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
   fs/xfs/scrub/trace.h:3806:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_unlink);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:3806:1: error: conflicting types for '__traceiter_xrep_metapath_unlink'
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/define_trace.h:57:2: note: expanded from macro '\
   DEFINE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:305:6: note: expanded from macro 'DEFINE_TRACE_FN'
           int __traceiter_##_name(void *__data, proto);                   \
               ^
   <scratch space>:53:1: note: expanded from here
   __traceiter_xrep_metapath_unlink
   ^
   fs/xfs/scrub/trace.h:3806:1: note: previous declaration is here
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_unlink);
   ^
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/linux/tracepoint.h:555:2: note: expanded from macro '\
   DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:252:13: note: expanded from macro '__DECLARE_TRACE'
           extern int __traceiter_##name(data_proto);                      \
                      ^
   <scratch space>:8:1: note: expanded from here
   __traceiter_xrep_metapath_unlink
   ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
   fs/xfs/scrub/trace.h:3806:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_unlink);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
   fs/xfs/scrub/trace.h:3806:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   55 warnings and 20 errors generated.


vim +/__traceiter_xrep_metapath_lookup +3804 fs/xfs/scrub/trace.h

8920eded601b37 Darrick J. Wong 2023-07-06  3803  
2f08131852c133 Darrick J. Wong 2023-08-18 @3804  DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
2f08131852c133 Darrick J. Wong 2023-08-18 @3805  DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_try_unlink);
2f08131852c133 Darrick J. Wong 2023-08-18 @3806  DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_unlink);
2f08131852c133 Darrick J. Wong 2023-08-18  3807  DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_link);
2f08131852c133 Darrick J. Wong 2023-08-18  3808  

:::::: The code at line 3804 was first introduced by commit
:::::: 2f08131852c133b02022c1c424f228cae47a956d xfs: repair metadata directory file path connectivity

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
