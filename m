Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633EA288AE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TolxiHga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701860656; x=1733396656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ENXVnrkvYkqCPMiOlvBvfuIC9Q5sXF1OJQGGVL1I0lc=;
  b=TolxiHga6s/7F6Crpjxs5YdkB1yIbvpVMhBe80EDp0PuuqUI4eRiFuyo
   C9gOkt/cDqjo0hmo90fof3UhUZO2HUcLpuewiKCC2aVspZYxIqUV4s+zX
   ia9nq/9CnDXwVsJD0i1qmBRcRmkFmXlF1BXaRfBbYt7AkakPmmCGgrvsE
   DrLPHyJhwpwuOdiLLKgr5iLK9l/5UTYMGIhKDhnf6yj3N/13yNdoQt52Y
   gju1VNURJ4+ezp+mClbFycAl1rqTRDbsFh27RIL9VsKeDJHBOcWBFl+oS
   u5R+fjJTfyBgmzUVuSvhCbmekiRt4ZENcol3zFOG5MMUHqv3Jjo6ijspT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1138918"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1138918"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 03:04:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="837290183"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="837290183"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 06 Dec 2023 03:04:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAphK-000Afi-1x;
	Wed, 06 Dec 2023 11:04:10 +0000
Date: Wed, 6 Dec 2023 19:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-metadir-experiments 1/1] fs/xfs/scrub/trace.h:1975:53:
 warning: 'struct xfs_imeta_path' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202312061836.XL9o7WFW-lkp@intel.com>
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
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231206/202312061836.XL9o7WFW-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061836.XL9o7WFW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061836.XL9o7WFW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/scrub/trace.h:16,
                    from fs/xfs/scrub/trace.c:70:
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:252:39: note: in definition of macro '__DECLARE_TRACE'
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1978:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1978 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:255:41: note: in definition of macro '__DECLARE_TRACE'
     255 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:432:31: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1978:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1978 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: In function 'trace_xchk_metapath_try_attach_parent':
   fs/xfs/scrub/trace.h:1977:21: error: passing argument 3 of '__traceiter_xchk_metapath_try_attach_parent' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1977 |         TP_ARGS(sc, path, dp, ino))
         |                     ^~~~
         |                     |
         |                     const struct xfs_imeta_path *
   include/linux/tracepoint.h:177:66: note: in definition of macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/linux/tracepoint.h:217:39: note: in expansion of macro 'TP_ARGS'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:258:25: note: in expansion of macro '__DO_TRACE'
     258 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:259:33: note: in expansion of macro 'TP_ARGS'
     259 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:432:9: note: in expansion of macro '__DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:46: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:44: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                            ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1977:9: note: in expansion of macro 'TP_ARGS'
    1977 |         TP_ARGS(sc, path, dp, ino))
         |         ^~~~~~~
   fs/xfs/scrub/trace.h:1978:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1978 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:69: note: expected 'const struct xfs_imeta_path *' but argument is of type 'const struct xfs_imeta_path *'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tracepoint.h:252:39: note: in definition of macro '__DECLARE_TRACE'
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1978:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1978 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: At top level:
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:229:51: note: in definition of macro '__DECLARE_TRACE_RCU'
     229 |         static inline void trace_##name##_rcuidle(proto)                \
         |                                                   ^~~~~
   include/linux/tracepoint.h:265:35: note: in expansion of macro 'PARAMS'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                   ^~~~~~
   include/linux/tracepoint.h:432:9: note: in expansion of macro '__DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:31: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1978:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1978 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: In function 'trace_xchk_metapath_try_attach_parent_rcuidle':
   fs/xfs/scrub/trace.h:1977:21: error: passing argument 3 of '__traceiter_xchk_metapath_try_attach_parent' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1977 |         TP_ARGS(sc, path, dp, ino))
         |                     ^~~~
         |                     |
         |                     const struct xfs_imeta_path *
   include/linux/tracepoint.h:177:66: note: in definition of macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/linux/tracepoint.h:217:39: note: in expansion of macro 'TP_ARGS'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:232:25: note: in expansion of macro '__DO_TRACE'
     232 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:233:33: note: in expansion of macro 'TP_ARGS'
     233 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:265:9: note: in expansion of macro '__DECLARE_TRACE_RCU'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:265:50: note: in expansion of macro 'PARAMS'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                                  ^~~~~~
   include/linux/tracepoint.h:432:9: note: in expansion of macro '__DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:46: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:44: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                            ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1977:9: note: in expansion of macro 'TP_ARGS'
    1977 |         TP_ARGS(sc, path, dp, ino))
         |         ^~~~~~~
   fs/xfs/scrub/trace.h:1978:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1978 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:69: note: expected 'const struct xfs_imeta_path *' but argument is of type 'const struct xfs_imeta_path *'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tracepoint.h:252:39: note: in definition of macro '__DECLARE_TRACE'
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1978:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1978 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: At top level:
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:268:45: note: in definition of macro '__DECLARE_TRACE'
     268 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1978:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1978 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:274:50: note: in definition of macro '__DECLARE_TRACE'
     274 |         register_trace_prio_##name(void (*probe)(data_proto), void *data,\
         |                                                  ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1978:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1978 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:281:47: note: in definition of macro '__DECLARE_TRACE'
     281 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1978:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1978 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:287:53: note: in definition of macro '__DECLARE_TRACE'
     287 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                                     ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1978:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1978 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:252:39: note: in definition of macro '__DECLARE_TRACE'
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1979:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1979 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:255:41: note: in definition of macro '__DECLARE_TRACE'
     255 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:432:31: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1979:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1979 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: In function 'trace_xchk_metapath_lookup':
   fs/xfs/scrub/trace.h:1977:21: error: passing argument 3 of '__traceiter_xchk_metapath_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1977 |         TP_ARGS(sc, path, dp, ino))
         |                     ^~~~
         |                     |
         |                     const struct xfs_imeta_path *
   include/linux/tracepoint.h:177:66: note: in definition of macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/linux/tracepoint.h:217:39: note: in expansion of macro 'TP_ARGS'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:258:25: note: in expansion of macro '__DO_TRACE'
     258 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:259:33: note: in expansion of macro 'TP_ARGS'
     259 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:432:9: note: in expansion of macro '__DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:46: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:44: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                            ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1977:9: note: in expansion of macro 'TP_ARGS'
    1977 |         TP_ARGS(sc, path, dp, ino))
         |         ^~~~~~~
   fs/xfs/scrub/trace.h:1979:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1979 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:69: note: expected 'const struct xfs_imeta_path *' but argument is of type 'const struct xfs_imeta_path *'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tracepoint.h:252:39: note: in definition of macro '__DECLARE_TRACE'
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1979:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1979 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: At top level:
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:229:51: note: in definition of macro '__DECLARE_TRACE_RCU'
     229 |         static inline void trace_##name##_rcuidle(proto)                \
         |                                                   ^~~~~
   include/linux/tracepoint.h:265:35: note: in expansion of macro 'PARAMS'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                   ^~~~~~
   include/linux/tracepoint.h:432:9: note: in expansion of macro '__DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:31: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1979:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1979 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: In function 'trace_xchk_metapath_lookup_rcuidle':
   fs/xfs/scrub/trace.h:1977:21: error: passing argument 3 of '__traceiter_xchk_metapath_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1977 |         TP_ARGS(sc, path, dp, ino))
         |                     ^~~~
         |                     |
         |                     const struct xfs_imeta_path *
   include/linux/tracepoint.h:177:66: note: in definition of macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/linux/tracepoint.h:217:39: note: in expansion of macro 'TP_ARGS'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:232:25: note: in expansion of macro '__DO_TRACE'
     232 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:233:33: note: in expansion of macro 'TP_ARGS'
     233 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:265:9: note: in expansion of macro '__DECLARE_TRACE_RCU'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:265:50: note: in expansion of macro 'PARAMS'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                                  ^~~~~~
   include/linux/tracepoint.h:432:9: note: in expansion of macro '__DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:46: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:44: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                            ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1977:9: note: in expansion of macro 'TP_ARGS'
    1977 |         TP_ARGS(sc, path, dp, ino))
         |         ^~~~~~~
   fs/xfs/scrub/trace.h:1979:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1979 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:69: note: expected 'const struct xfs_imeta_path *' but argument is of type 'const struct xfs_imeta_path *'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tracepoint.h:252:39: note: in definition of macro '__DECLARE_TRACE'
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1979:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1979 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: At top level:
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:268:45: note: in definition of macro '__DECLARE_TRACE'
     268 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1979:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1979 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:274:50: note: in definition of macro '__DECLARE_TRACE'
     274 |         register_trace_prio_##name(void (*probe)(data_proto), void *data,\
         |                                                  ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1979:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1979 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:281:47: note: in definition of macro '__DECLARE_TRACE'
     281 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1979:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1979 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:287:53: note: in definition of macro '__DECLARE_TRACE'
     287 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                                     ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:1979:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    1979 | DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:252:39: note: in definition of macro '__DECLARE_TRACE'
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:3804:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3804 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:255:41: note: in definition of macro '__DECLARE_TRACE'
     255 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:432:31: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:3804:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3804 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: In function 'trace_xrep_metapath_lookup':
   fs/xfs/scrub/trace.h:1977:21: error: passing argument 3 of '__traceiter_xrep_metapath_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1977 |         TP_ARGS(sc, path, dp, ino))
         |                     ^~~~
         |                     |
         |                     const struct xfs_imeta_path *
   include/linux/tracepoint.h:177:66: note: in definition of macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/linux/tracepoint.h:217:39: note: in expansion of macro 'TP_ARGS'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:258:25: note: in expansion of macro '__DO_TRACE'
     258 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:259:33: note: in expansion of macro 'TP_ARGS'
     259 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:432:9: note: in expansion of macro '__DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:46: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:44: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                            ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1977:9: note: in expansion of macro 'TP_ARGS'
    1977 |         TP_ARGS(sc, path, dp, ino))
         |         ^~~~~~~
   fs/xfs/scrub/trace.h:3804:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3804 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:69: note: expected 'const struct xfs_imeta_path *' but argument is of type 'const struct xfs_imeta_path *'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tracepoint.h:252:39: note: in definition of macro '__DECLARE_TRACE'
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:3804:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3804 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: At top level:
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:229:51: note: in definition of macro '__DECLARE_TRACE_RCU'
     229 |         static inline void trace_##name##_rcuidle(proto)                \
         |                                                   ^~~~~
   include/linux/tracepoint.h:265:35: note: in expansion of macro 'PARAMS'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                   ^~~~~~
   include/linux/tracepoint.h:432:9: note: in expansion of macro '__DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:31: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:3804:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3804 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: In function 'trace_xrep_metapath_lookup_rcuidle':
   fs/xfs/scrub/trace.h:1977:21: error: passing argument 3 of '__traceiter_xrep_metapath_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1977 |         TP_ARGS(sc, path, dp, ino))
         |                     ^~~~
         |                     |
         |                     const struct xfs_imeta_path *
   include/linux/tracepoint.h:177:66: note: in definition of macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/linux/tracepoint.h:217:39: note: in expansion of macro 'TP_ARGS'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:232:25: note: in expansion of macro '__DO_TRACE'
     232 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:233:33: note: in expansion of macro 'TP_ARGS'
     233 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:265:9: note: in expansion of macro '__DECLARE_TRACE_RCU'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:265:50: note: in expansion of macro 'PARAMS'
     265 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                                  ^~~~~~
   include/linux/tracepoint.h:432:9: note: in expansion of macro '__DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:46: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:44: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                            ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1977:9: note: in expansion of macro 'TP_ARGS'
    1977 |         TP_ARGS(sc, path, dp, ino))
         |         ^~~~~~~
   fs/xfs/scrub/trace.h:3804:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3804 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:69: note: expected 'const struct xfs_imeta_path *' but argument is of type 'const struct xfs_imeta_path *'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tracepoint.h:252:39: note: in definition of macro '__DECLARE_TRACE'
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:3804:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3804 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: At top level:
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:268:45: note: in definition of macro '__DECLARE_TRACE'
     268 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:3804:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3804 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:274:50: note: in definition of macro '__DECLARE_TRACE'
     274 |         register_trace_prio_##name(void (*probe)(data_proto), void *data,\
         |                                                  ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:3804:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3804 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:281:47: note: in definition of macro '__DECLARE_TRACE'
     281 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:3804:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3804 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:287:53: note: in definition of macro '__DECLARE_TRACE'
     287 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                                     ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:3804:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3804 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_lookup);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:252:39: note: in definition of macro '__DECLARE_TRACE'
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:434:25: note: in expansion of macro 'PARAMS'
     434 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:3805:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3805 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_try_unlink);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:53: warning: 'struct xfs_imeta_path' declared inside parameter list will not be visible outside of this definition or declaration
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |                                                     ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:255:41: note: in definition of macro '__DECLARE_TRACE'
     255 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:432:31: note: in expansion of macro 'PARAMS'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:555:9: note: in expansion of macro 'DECLARE_TRACE'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:555:29: note: in expansion of macro 'PARAMS'
     555 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/scrub/trace.h:1974:1: note: in expansion of macro 'DEFINE_EVENT'
    1974 | DEFINE_EVENT(xchk_metapath_class, name, \
         | ^~~~~~~~~~~~
   fs/xfs/scrub/trace.h:1975:9: note: in expansion of macro 'TP_PROTO'
    1975 |         TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
         |         ^~~~~~~~
   fs/xfs/scrub/trace.h:3805:1: note: in expansion of macro 'DEFINE_XCHK_METAPATH_EVENT'
    3805 | DEFINE_XCHK_METAPATH_EVENT(xrep_metapath_try_unlink);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.h: In function 'trace_xrep_metapath_try_unlink':
   fs/xfs/scrub/trace.h:1977:21: error: passing argument 3 of '__traceiter_xrep_metapath_try_unlink' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1977 |         TP_ARGS(sc, path, dp, ino))
         |                     ^~~~
         |                     |
..


vim +1975 fs/xfs/scrub/trace.h

ff8f1148087001 Darrick J. Wong 2023-07-05  1940  
d28a4e9316539b Darrick J. Wong 2023-08-18  1941  DECLARE_EVENT_CLASS(xchk_metapath_class,
d28a4e9316539b Darrick J. Wong 2023-08-18  1942  	TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path,
d28a4e9316539b Darrick J. Wong 2023-08-18  1943  		 struct xfs_inode *dp, xfs_ino_t ino),
d28a4e9316539b Darrick J. Wong 2023-08-18  1944  	TP_ARGS(sc, path, dp, ino),
d28a4e9316539b Darrick J. Wong 2023-08-18  1945  	TP_STRUCT__entry(
d28a4e9316539b Darrick J. Wong 2023-08-18  1946  		__field(dev_t, dev)
d28a4e9316539b Darrick J. Wong 2023-08-18  1947  		__field(xfs_ino_t, scrub_ino)
d28a4e9316539b Darrick J. Wong 2023-08-18  1948  		__field(xfs_ino_t, parent_ino)
d28a4e9316539b Darrick J. Wong 2023-08-18  1949  		__field(xfs_ino_t, ino)
d28a4e9316539b Darrick J. Wong 2023-08-18  1950  		__field(unsigned int, namelen)
d28a4e9316539b Darrick J. Wong 2023-08-18  1951  		__dynamic_array(char, name, strlen(path->im_path[path->im_depth - 1]))
d28a4e9316539b Darrick J. Wong 2023-08-18  1952  	),
d28a4e9316539b Darrick J. Wong 2023-08-18  1953  	TP_fast_assign(
d28a4e9316539b Darrick J. Wong 2023-08-18  1954  		const unsigned char *p;
d28a4e9316539b Darrick J. Wong 2023-08-18  1955  
d28a4e9316539b Darrick J. Wong 2023-08-18  1956  		__entry->dev = sc->mp->m_super->s_dev;
d28a4e9316539b Darrick J. Wong 2023-08-18  1957  		__entry->scrub_ino = sc->ip ? sc->ip->i_ino : NULLFSINO;
d28a4e9316539b Darrick J. Wong 2023-08-18  1958  		__entry->parent_ino = dp ? dp->i_ino : NULLFSINO;
d28a4e9316539b Darrick J. Wong 2023-08-18  1959  		__entry->ino = ino;
d28a4e9316539b Darrick J. Wong 2023-08-18  1960  
d28a4e9316539b Darrick J. Wong 2023-08-18  1961  		p = path->im_path[path->im_depth - 1];
d28a4e9316539b Darrick J. Wong 2023-08-18  1962  		__entry->namelen = strlen(p);
d28a4e9316539b Darrick J. Wong 2023-08-18  1963  		memcpy(__get_str(name), p, __entry->namelen);
d28a4e9316539b Darrick J. Wong 2023-08-18  1964  	),
d28a4e9316539b Darrick J. Wong 2023-08-18  1965  	TP_printk("dev %d:%d ino 0x%llx parent_ino 0x%llx name '%.*s' ino 0x%llx",
d28a4e9316539b Darrick J. Wong 2023-08-18  1966  		  MAJOR(__entry->dev), MINOR(__entry->dev),
d28a4e9316539b Darrick J. Wong 2023-08-18  1967  		  __entry->scrub_ino,
d28a4e9316539b Darrick J. Wong 2023-08-18  1968  		  __entry->parent_ino,
d28a4e9316539b Darrick J. Wong 2023-08-18  1969  		  __entry->namelen,
d28a4e9316539b Darrick J. Wong 2023-08-18  1970  		  __get_str(name),
d28a4e9316539b Darrick J. Wong 2023-08-18  1971  		  __entry->ino)
d28a4e9316539b Darrick J. Wong 2023-08-18  1972  );
d28a4e9316539b Darrick J. Wong 2023-08-18  1973  #define DEFINE_XCHK_METAPATH_EVENT(name) \
d28a4e9316539b Darrick J. Wong 2023-08-18  1974  DEFINE_EVENT(xchk_metapath_class, name, \
d28a4e9316539b Darrick J. Wong 2023-08-18 @1975  	TP_PROTO(struct xfs_scrub *sc, const struct xfs_imeta_path *path, \
d28a4e9316539b Darrick J. Wong 2023-08-18  1976  		 struct xfs_inode *dp, xfs_ino_t ino), \
d28a4e9316539b Darrick J. Wong 2023-08-18  1977  	TP_ARGS(sc, path, dp, ino))
d28a4e9316539b Darrick J. Wong 2023-08-18  1978  DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_try_attach_parent);
d28a4e9316539b Darrick J. Wong 2023-08-18  1979  DEFINE_XCHK_METAPATH_EVENT(xchk_metapath_lookup);
d28a4e9316539b Darrick J. Wong 2023-08-18  1980  

:::::: The code at line 1975 was first introduced by commit
:::::: d28a4e9316539b38006bb6fd8244c83551db79e0 xfs: check metadata directory file path connectivity

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
