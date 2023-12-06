Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41264364B2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 12:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8AuYPuN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701865180; x=1733401180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FbVQnBURK5fHQMCv4myzDzzirRO4Xu90nQbEl7h8xMc=;
  b=F8AuYPuN2ak9h0yxNGhGs8Hg94k+4AyEUg9LkrLg4F/wnXsrS1zYFNMY
   0+xNLr+MwOlUNPJDj4EGfA7r4czl2AqnUvfNVN8QL9SX4ZowPUGb5s4dT
   piFQ6JYJr1xG6f+j1jA+22GemoqySE9iQEDxpdUUksgyHYWNvfzWuiNqA
   tsiuhbNiN4e89BGHeqmNW81X43GBgg7jefV4So/lvnkVbdsdWNaxk7Lh/
   YanyOwyaNnH1lhEe+4oBWMijbCDDbJ69Oa6Zh5WArPrAHypR5rvD9pZbD
   zehUVNmwA6FzhAk6FJTL9y/lxKnwr5xN18dU2t1mBoaly0HItcxvdFrnl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396840888"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="396840888"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 04:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="800329840"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="800329840"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Dec 2023 04:19:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAqs3-000AmO-2z;
	Wed, 06 Dec 2023 12:19:20 +0000
Date: Wed, 6 Dec 2023 20:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-metadir-experiments 1/1] fs/xfs/scrub/trace.h:1978:1:
 error: incompatible pointer types passing 'const struct xfs_imeta_path *' to
 parameter of type 'const struct xfs_imeta_path *'
Message-ID: <202312062028.YnK9j1tT-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231206/202312062028.YnK9j1tT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312062028.YnK9j1tT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062028.YnK9j1tT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/xfs/scrub/trace.c:70:
>> fs/xfs/scrub/trace.h:1978:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:1978:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:1978:1: error: incompatible pointer types passing 'const struct xfs_imeta_path *' to parameter of type 'const struct xfs_imeta_path *' [-Werror,-Wincompatible-pointer-types]
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1977:14: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_ARGS(sc, path, dp, ino))
                       ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
   #define TP_ARGS(args...)        args
                                   ^~~~
   include/linux/tracepoint.h:555:44: note: expanded from macro '\
   DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                                                     ^~~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:217:33: note: expanded from macro '__DO_TRACE'
                   __DO_TRACE_CALL(name, TP_ARGS(args));                   \
                                                 ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
   #define TP_ARGS(args...)        args
                                   ^~~~
   include/linux/tracepoint.h:173:40: note: expanded from macro '__DO_TRACE_CALL'
                           static_call(tp_func_##name)(__data, args);      \
                                                               ^~~~
   In file included from fs/xfs/scrub/trace.c:70:
>> fs/xfs/scrub/trace.h:1978:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:1978:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:1978:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:1978:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
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
   fs/xfs/scrub/trace.h:1979:1: error: incompatible pointer types passing 'const struct xfs_imeta_path *' to parameter of type 'const struct xfs_imeta_path *' [-Werror,-Wincompatible-pointer-types]
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1977:14: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_ARGS(sc, path, dp, ino))
                       ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
   #define TP_ARGS(args...)        args
                                   ^~~~
   include/linux/tracepoint.h:555:44: note: expanded from macro '\
   DEFINE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                                                     ^~~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:217:33: note: expanded from macro '__DO_TRACE'
                   __DO_TRACE_CALL(name, TP_ARGS(args));                   \
                                                 ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
   #define TP_ARGS(args...)        args
                                   ^~~~
   include/linux/tracepoint.h:173:40: note: expanded from macro '__DO_TRACE_CALL'
                           static_call(tp_func_##name)(__data, args);      \
                                                               ^~~~
   In file included from fs/xfs/scrub/trace.c:70:
   fs/xfs/scrub/trace.h:1979:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
   fs/xfs/scrub/trace.h:1979:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
   fs/xfs/scrub/trace.h:1979:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
   fs/xfs/scrub/trace.h:1979:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
>> fs/xfs/scrub/trace.h:1978:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:1978:1: error: conflicting types for '__traceiter_xchk_metapath_try_attach_parent'
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
   <scratch space>:94:1: note: expanded from here
   __traceiter_xchk_metapath_try_attach_parent
   ^
   fs/xfs/scrub/trace.h:1978:1: note: previous declaration is here
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
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
   <scratch space>:80:1: note: expanded from here
   __traceiter_xchk_metapath_try_attach_parent
   ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
>> fs/xfs/scrub/trace.h:1978:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:1978:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:1978:1: error: conflicting types for '__traceiter_xchk_metapath_try_attach_parent'
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
   <scratch space>:105:1: note: expanded from here
   __traceiter_xchk_metapath_try_attach_parent
   ^
   fs/xfs/scrub/trace.h:1978:1: note: previous declaration is here
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
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
   <scratch space>:80:1: note: expanded from here
   __traceiter_xchk_metapath_try_attach_parent
   ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:95:
>> fs/xfs/scrub/trace.h:1978:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
   ^
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:1978:1: error: conflicting types for '__probestub_xchk_metapath_try_attach_parent'
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
   <scratch space>:116:1: note: expanded from here
   __probestub_xchk_metapath_try_attach_parent
   ^
   fs/xfs/scrub/trace.h:1978:1: note: previous declaration is here
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
   <scratch space>:95:1: note: expanded from here
   __probestub_xchk_metapath_try_attach_parent
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
>> fs/xfs/scrub/trace.h:1979:1: error: conflicting types for '__traceiter_xchk_metapath_lookup'
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
   <scratch space>:17:1: note: expanded from here
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
   <scratch space>:148:1: note: expanded from here
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
   fs/xfs/scrub/trace.h:1979:1: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
   fs/xfs/scrub/trace.h:1975:46: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
                                                       ^
>> fs/xfs/scrub/trace.h:1979:1: error: conflicting types for '__traceiter_xchk_metapath_lookup'
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
   <scratch space>:28:1: note: expanded from here
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
   <scratch space>:148:1: note: expanded from here
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
>> fs/xfs/scrub/trace.h:1979:1: error: conflicting types for '__probestub_xchk_metapath_lookup'
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
   <scratch space>:39:1: note: expanded from here
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
   <scratch space>:18:1: note: expanded from here
   __probestub_xchk_metapath_lookup
   ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:268:
   fs/xfs/scrub/trace.h:1942:46: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
                                                       ^
>> fs/xfs/scrub/trace.h:1951:42: error: incomplete definition of type 'struct xfs_imeta_path'
                   __dynamic_array(char, name, strlen(path->im_path[path->im_depth - 1]))
                                                      ~~~~^
   include/linux/fortify-string.h:200:56: note: expanded from macro 'strlen'
           __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
                                                                 ^
   include/linux/compiler.h:236:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   include/trace/stages/stage5_get_offsets.h:42:19: note: expanded from macro '__dynamic_array'
           __item_length = (len) * sizeof(type);                           \
                            ^~~
   include/trace/stages/stage1_struct_define.h:60:35: note: expanded from macro 'TP_STRUCT__entry'
   #define TP_STRUCT__entry(args...) args
                                     ^~~~
   include/trace/trace_events.h:263:2: note: expanded from macro 'DECLARE_EVENT_CLASS'
           tstruct;                                                        \
           ^~~~~~~
   fs/xfs/scrub/trace.h:1942:46: note: forward declaration of 'struct xfs_imeta_path'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
                                                       ^
   fs/xfs/scrub/trace.h:1951:56: error: incomplete definition of type 'struct xfs_imeta_path'
                   __dynamic_array(char, name, strlen(path->im_path[path->im_depth - 1]))
                                                                    ~~~~^
   include/linux/fortify-string.h:200:56: note: expanded from macro 'strlen'
           __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
                                                                 ^
   include/linux/compiler.h:236:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   include/trace/stages/stage5_get_offsets.h:42:19: note: expanded from macro '__dynamic_array'
           __item_length = (len) * sizeof(type);                           \
                            ^~~
   include/trace/stages/stage1_struct_define.h:60:35: note: expanded from macro 'TP_STRUCT__entry'
   #define TP_STRUCT__entry(args...) args
                                     ^~~~
   include/trace/trace_events.h:263:2: note: expanded from macro 'DECLARE_EVENT_CLASS'
           tstruct;                                                        \
           ^~~~~~~
   fs/xfs/scrub/trace.h:1942:46: note: forward declaration of 'struct xfs_imeta_path'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
                                                       ^
>> fs/xfs/scrub/trace.h:1951:42: error: incomplete definition of type 'struct xfs_imeta_path'
                   __dynamic_array(char, name, strlen(path->im_path[path->im_depth - 1]))
                                                      ~~~~^
   include/linux/fortify-string.h:201:20: note: expanded from macro 'strlen'
                   __builtin_strlen(p), __fortify_strlen(p))
                                    ^
   include/trace/stages/stage5_get_offsets.h:42:19: note: expanded from macro '__dynamic_array'
           __item_length = (len) * sizeof(type);                           \
                            ^~~
   include/trace/stages/stage1_struct_define.h:60:35: note: expanded from macro 'TP_STRUCT__entry'
   #define TP_STRUCT__entry(args...) args
                                     ^~~~
   include/trace/trace_events.h:263:2: note: expanded from macro 'DECLARE_EVENT_CLASS'
           tstruct;                                                        \
           ^~~~~~~
   fs/xfs/scrub/trace.h:1942:46: note: forward declaration of 'struct xfs_imeta_path'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
                                                       ^
   fs/xfs/scrub/trace.h:1951:56: error: incomplete definition of type 'struct xfs_imeta_path'
                   __dynamic_array(char, name, strlen(path->im_path[path->im_depth - 1]))
                                                                    ~~~~^
   include/linux/fortify-string.h:201:20: note: expanded from macro 'strlen'
                   __builtin_strlen(p), __fortify_strlen(p))
                                    ^
   include/trace/stages/stage5_get_offsets.h:42:19: note: expanded from macro '__dynamic_array'
           __item_length = (len) * sizeof(type);                           \
                            ^~~
   include/trace/stages/stage1_struct_define.h:60:35: note: expanded from macro 'TP_STRUCT__entry'
   #define TP_STRUCT__entry(args...) args
                                     ^~~~
   include/trace/trace_events.h:263:2: note: expanded from macro 'DECLARE_EVENT_CLASS'
           tstruct;                                                        \
           ^~~~~~~
   fs/xfs/scrub/trace.h:1942:46: note: forward declaration of 'struct xfs_imeta_path'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
                                                       ^
>> fs/xfs/scrub/trace.h:1951:42: error: incomplete definition of type 'struct xfs_imeta_path'
                   __dynamic_array(char, name, strlen(path->im_path[path->im_depth - 1]))
                                                      ~~~~^
   include/linux/fortify-string.h:201:41: note: expanded from macro 'strlen'
                   __builtin_strlen(p), __fortify_strlen(p))
                                                         ^
   include/trace/stages/stage5_get_offsets.h:42:19: note: expanded from macro '__dynamic_array'
           __item_length = (len) * sizeof(type);                           \
                            ^~~
   include/trace/stages/stage1_struct_define.h:60:35: note: expanded from macro 'TP_STRUCT__entry'
   #define TP_STRUCT__entry(args...) args
                                     ^~~~
   include/trace/trace_events.h:263:2: note: expanded from macro 'DECLARE_EVENT_CLASS'
           tstruct;                                                        \
           ^~~~~~~
   fs/xfs/scrub/trace.h:1942:46: note: forward declaration of 'struct xfs_imeta_path'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
                                                       ^
   fs/xfs/scrub/trace.h:1951:56: error: incomplete definition of type 'struct xfs_imeta_path'
                   __dynamic_array(char, name, strlen(path->im_path[path->im_depth - 1]))
                                                                    ~~~~^
   include/linux/fortify-string.h:201:41: note: expanded from macro 'strlen'
                   __builtin_strlen(p), __fortify_strlen(p))
                                                         ^
   include/trace/stages/stage5_get_offsets.h:42:19: note: expanded from macro '__dynamic_array'
           __item_length = (len) * sizeof(type);                           \
                            ^~~
   include/trace/stages/stage1_struct_define.h:60:35: note: expanded from macro 'TP_STRUCT__entry'
   #define TP_STRUCT__entry(args...) args
                                     ^~~~
   include/trace/trace_events.h:263:2: note: expanded from macro 'DECLARE_EVENT_CLASS'
           tstruct;                                                        \
           ^~~~~~~
   fs/xfs/scrub/trace.h:1942:46: note: forward declaration of 'struct xfs_imeta_path'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
                                                       ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   fs/xfs/scrub/trace.h:1942:46: warning: declaration of 'struct xfs_imeta_path' will not be visible outside of this function [-Wvisibility]
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
                                                       ^
   fs/xfs/scrub/trace.h:1944:14: error: incompatible pointer types passing 'const struct xfs_imeta_path *' to parameter of type 'const struct xfs_imeta_path *' [-Werror,-Wincompatible-pointer-types]
           TP_ARGS(sc, path, dp, ino),
                       ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
   #define TP_ARGS(args...)        args
                                   ^~~~
   include/trace/trace_events.h:392:64: note: expanded from macro 'DECLARE_EVENT_CLASS'
           __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
                                                                         ^~~~
   fs/xfs/scrub/trace.h:1942:62: note: passing argument to parameter 'path' here
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
                                                                       ^
   In file included from fs/xfs/scrub/trace.c:70:
   In file included from fs/xfs/scrub/trace.h:4064:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   fs/xfs/scrub/trace.h:1961:11: error: incomplete definition of type 'struct xfs_imeta_path'
                   p = path->im_path[path->im_depth - 1];
                       ~~~~^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
   #define TP_fast_assign(args...) args
                                   ^~~~
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   fs/xfs/scrub/trace.h:1942:46: note: forward declaration of 'struct xfs_imeta_path'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
                                                       ^
   fs/xfs/scrub/trace.h:1961:25: error: incomplete definition of type 'struct xfs_imeta_path'
                   p = path->im_path[path->im_depth - 1];
                                     ~~~~^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
   #define TP_fast_assign(args...) args
                                   ^~~~
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   fs/xfs/scrub/trace.h:1942:46: note: forward declaration of 'struct xfs_imeta_path'
           TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
                                                       ^
   fs/xfs/scrub/trace.h:1978:1: error: incompatible function pointer types passing 'void (void *, struct xfs_scrub *, const struct xfs_imeta_path *, struct xfs_inode *, xfs_ino_t)' (aka 'void (void *, struct xfs_scrub *, const struct xfs_imeta_path *, struct xfs_inode *, unsigned long long)') to parameter of type 'void (*)(void *, struct xfs_scrub *, const struct xfs_imeta_path *, struct xfs_inode *, xfs_ino_t)' (aka 'void (*)(void *, struct xfs_scrub *, const struct xfs_imeta_path *, struct xfs_inode *, unsigned long long)') [-Wincompatible-function-pointer-types]
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
                                            ^
   include/trace/trace_events.h:416:35: note: expanded from macro '\
   DEFINE_EVENT'
           check_trace_callback_type_##call(trace_event_raw_event_##template); \
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:23:1: note: expanded from here
   trace_event_raw_event_xchk_metapath_class
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1978:1: note: passing argument to parameter 'cb' here
   DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
   ^
   fs/xfs/scrub/trace.h:1973:42: note: expanded from macro 'DEFINE_XCHK_METAPATH_EVENT'
   #define DEFINE_XCHK_METAPATH_EVENT(name) \
..


vim +1978 fs/xfs/scrub/trace.h

ff8f1148087001b Darrick J. Wong 2023-07-05  1940  
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1941  DECLARE_EVENT_CLASS(xchk_metapath_class,
d28a4e9316539b3 Darrick J. Wong 2023-08-18 @1942  	TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1943  		 struct xfs_inode *dp, xfs_ino_t ino),
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1944  	TP_ARGS(sc, path, dp, ino),
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1945  	TP_STRUCT__entry(
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1946  		__field(dev_t, dev)
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1947  		__field(xfs_ino_t, scrub_ino)
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1948  		__field(xfs_ino_t, parent_ino)
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1949  		__field(xfs_ino_t, ino)
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1950  		__field(unsigned int, namelen)
d28a4e9316539b3 Darrick J. Wong 2023-08-18 @1951  		__dynamic_array(char, name, strlen(path->im_path[path->im_depth - 1]))
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1952  	),
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1953  	TP_fast_assign(
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1954  		const unsigned char *p;
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1955  
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1956  		__entry->dev = sc->mp->m_super->s_dev;
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1957  		__entry->scrub_ino = sc->ip ? sc->ip->i_ino : NULLFSINO;
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1958  		__entry->parent_ino = dp ? dp->i_ino : NULLFSINO;
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1959  		__entry->ino = ino;
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1960  
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1961  		p = path->im_path[path->im_depth - 1];
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1962  		__entry->namelen = strlen(p);
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1963  		memcpy(__get_str(name), p, __entry->namelen);
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1964  	),
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1965  	TP_printk("dev %d:%d ino 0x%llx parent_ino 0x%llx name '%.*s' ino 0x%llx",
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1966  		  MAJOR(__entry->dev), MINOR(__entry->dev),
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1967  		  __entry->scrub_ino,
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1968  		  __entry->parent_ino,
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1969  		  __entry->namelen,
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1970  		  __get_str(name),
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1971  		  __entry->ino)
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1972  );
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1973  #define DEFINE_XCHK_METAPATH_EVENT(name) \
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1974  DEFINE_EVENT(xchk_metapath_class, name, \
d28a4e9316539b3 Darrick J. Wong 2023-08-18 @1975  	TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1976  		 struct xfs_inode *dp, xfs_ino_t ino), \
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1977  	TP_ARGS(sc, path, dp, ino))
d28a4e9316539b3 Darrick J. Wong 2023-08-18 @1978  DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
d28a4e9316539b3 Darrick J. Wong 2023-08-18 @1979  DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
d28a4e9316539b3 Darrick J. Wong 2023-08-18  1980  

:::::: The code at line 1978 was first introduced by commit
:::::: d28a4e9316539b38006bb6fd8244c83551db79e0 xfs: check metadata directory file path connectivity

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
