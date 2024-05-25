Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F894F1E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716646926; cv=none; b=b30Gq5K1QHjFBU9dVoqfZ62c3GmaoeV85221cnDkxZdRS4Kxm9W9xR+Xx5E+sfj2En4XntjSQzsU+S1582SoUEmwM3yOsr1xYJspuJFPh0pW1Z/C3R97BYPO7yDC4AOg8E7r6BsY0s2ZirAeebK2B7NSEGFQkFvNDjfl0enzfkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716646926; c=relaxed/simple;
	bh=3VQ5/8JMi/gHJYJxoRH0YYH68s84c11xmCFGxR/b8KA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suq77tGQevPUvVVJEkKX58wDyZ1PlccJ+bUOV8LZriEruzoxAczjaBnzNpmURxbkAd9TjVEF80hebrcWHi1daIWWSiu3hq2LTRebR66YVYgpRecMxKBjSGC1W+Q143NHXBxpF8NQb75c1Ek/YQ0wkbG638WpGJ9C/bbpVbR/A3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7LLlllt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7LLlllt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716646923; x=1748182923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3VQ5/8JMi/gHJYJxoRH0YYH68s84c11xmCFGxR/b8KA=;
  b=d7LLllltISaLuqveOrAhL5lM3oQ1byEyc2s4hxlZSvsoToHGE0rFeSkG
   D8bmOmEtwAc1r3ScxAs+booccczy4oCLbpEiT1WRwtL7Q/5dHFaulfw+z
   0nSZDt+XCJjqm70V15qL3VFRm99qwrXSXGhWTK0qvbn2C/0IxW0XxMYnO
   jXl2pY6CO4HastyT2uSECCEq9MqLzQ4Lk2MAaZ23R5bBTrD8bhMzJ3xm0
   hZX19A+v6cyXfyvKLA0ru+aZ2v21OYjim46FAezZImEfOdQDhUhi1SEqe
   hDlw4kE2l6rt5+zyGJOnXjHf3Otdlr2N08ooP2djfLSOXTGSAmuDvTG2q
   Q==;
X-CSE-ConnectionGUID: G6iXwDmbQ2C7Isxj8J99hQ==
X-CSE-MsgGUID: gEd68PvpRWyHLcalcI2gWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="24424360"
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="24424360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 07:22:02 -0700
X-CSE-ConnectionGUID: 6aRGWjCbQIyepK7Z7dKNmg==
X-CSE-MsgGUID: CwksAvanShioypE+wJgc9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="57523016"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 May 2024 07:22:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAsGe-00074V-0i;
	Sat, 25 May 2024 14:21:32 +0000
Date: Sat, 25 May 2024 22:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring 479/485] fs/xfs/xfs_healthmon.c:93:41:
 error: field 'outbuf' has incomplete type
Message-ID: <202405252201.IG0LZjye-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   9bac72f41f29d07951e18a025ef67ec708c4eff1
commit: 3cc70a8b69d239419a3da26f09ccbc07268c0751 [479/485] xfs: create event queuing, formatting, and discovery infrastructure
config: s390-randconfig-r064-20240525 (https://download.01.org/0day-ci/archive/20240525/202405252201.IG0LZjye-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405252201.IG0LZjye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405252201.IG0LZjye-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/xfs/xfs_trace.h:58,
                    from fs/xfs/xfs_trace.c:90:
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:357:41: note: in definition of macro '__DECLARE_TRACE'
     357 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:434:31: note: in expansion of macro 'PARAMS'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:359:51: note: in definition of macro '__DECLARE_TRACE'
     359 |         static inline void trace_##name##_rcuidle(proto)                \
         |                                                   ^~~~~
   include/linux/tracepoint.h:434:31: note: in expansion of macro 'PARAMS'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:362:45: note: in definition of macro '__DECLARE_TRACE'
     362 |         register_trace_##name(void (*probe)(data_proto),                \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:436:25: note: in expansion of macro 'PARAMS'
     436 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:368:47: note: in definition of macro '__DECLARE_TRACE'
     368 |         unregister_trace_##name(void (*probe)(data_proto),              \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:436:25: note: in expansion of macro 'PARAMS'
     436 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:373:72: note: in definition of macro '__DECLARE_TRACE'
     373 |         static inline void check_trace_callback_type_##name(void (*cb)(data_proto)) \
         |                                                                        ^~~~~~~~~~
   include/linux/tracepoint.h:436:25: note: in expansion of macro 'PARAMS'
     436 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
--
   In file included from fs/xfs/xfs_trace.h:58,
                    from fs/xfs/libxfs/xfs_bmap.c:30:
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:357:41: note: in definition of macro '__DECLARE_TRACE'
     357 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:434:31: note: in expansion of macro 'PARAMS'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:359:51: note: in definition of macro '__DECLARE_TRACE'
     359 |         static inline void trace_##name##_rcuidle(proto)                \
         |                                                   ^~~~~
   include/linux/tracepoint.h:434:31: note: in expansion of macro 'PARAMS'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:362:45: note: in definition of macro '__DECLARE_TRACE'
     362 |         register_trace_##name(void (*probe)(data_proto),                \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:436:25: note: in expansion of macro 'PARAMS'
     436 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:368:47: note: in definition of macro '__DECLARE_TRACE'
     368 |         unregister_trace_##name(void (*probe)(data_proto),              \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:436:25: note: in expansion of macro 'PARAMS'
     436 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:373:72: note: in definition of macro '__DECLARE_TRACE'
     373 |         static inline void check_trace_callback_type_##name(void (*cb)(data_proto)) \
         |                                                                        ^~~~~~~~~~
   include/linux/tracepoint.h:436:25: note: in expansion of macro 'PARAMS'
     436 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c: In function 'xfs_bmapi_freesp':
   fs/xfs/libxfs/xfs_bmap.c:6571:33: warning: variable 'rtxlen_in' set but not used [-Wunused-but-set-variable]
    6571 |                 xfs_extlen_t    rtxlen_in, rtxlen_out = 0;
         |                                 ^~~~~~~~~
--
   In file included from fs/xfs/xfs_trace.h:58,
                    from fs/xfs/xfs_healthmon.c:14:
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:357:41: note: in definition of macro '__DECLARE_TRACE'
     357 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:434:31: note: in expansion of macro 'PARAMS'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:359:51: note: in definition of macro '__DECLARE_TRACE'
     359 |         static inline void trace_##name##_rcuidle(proto)                \
         |                                                   ^~~~~
   include/linux/tracepoint.h:434:31: note: in expansion of macro 'PARAMS'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:362:45: note: in definition of macro '__DECLARE_TRACE'
     362 |         register_trace_##name(void (*probe)(data_proto),                \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:436:25: note: in expansion of macro 'PARAMS'
     436 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:368:47: note: in definition of macro '__DECLARE_TRACE'
     368 |         unregister_trace_##name(void (*probe)(data_proto),              \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:436:25: note: in expansion of macro 'PARAMS'
     436 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_trace.h:6045:31: warning: 'struct seq_buf' declared inside parameter list will not be visible outside of this definition or declaration
    6045 |                  const struct seq_buf *seqbuf, size_t outpos),
         |                               ^~~~~~~
   include/linux/tracepoint.h:373:72: note: in definition of macro '__DECLARE_TRACE'
     373 |         static inline void check_trace_callback_type_##name(void (*cb)(data_proto)) \
         |                                                                        ^~~~~~~~~~
   include/linux/tracepoint.h:436:25: note: in expansion of macro 'PARAMS'
     436 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/linux/tracepoint.h:568:29: note: in expansion of macro 'PARAMS'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                             ^~~~~~
   fs/xfs/xfs_trace.h:6043:1: note: in expansion of macro 'TRACE_EVENT'
    6043 | TRACE_EVENT(xfs_healthmon_copybuf,
         | ^~~~~~~~~~~
   fs/xfs/xfs_trace.h:6044:9: note: in expansion of macro 'TP_PROTO'
    6044 |         TP_PROTO(const struct xfs_mount *mp, const struct iov_iter *iov,
         |         ^~~~~~~~
>> fs/xfs/xfs_healthmon.c:93:41: error: field 'outbuf' has incomplete type
      93 |         struct seq_buf                  outbuf;
         |                                         ^~~~~~
   fs/xfs/xfs_healthmon.c: In function 'xfs_healthmon_format_flags':
>> fs/xfs/xfs_healthmon.c:265:23: error: implicit declaration of function 'seq_buf_printf'; did you mean 'seq_printf'? [-Werror=implicit-function-declaration]
     265 |                 ret = seq_buf_printf(outbuf, "%s\"%s\"",
         |                       ^~~~~~~~~~~~~~
         |                       seq_printf
   fs/xfs/xfs_healthmon.c: In function 'xfs_healthmon_reset_outbuf':
>> fs/xfs/xfs_healthmon.c:320:9: error: implicit declaration of function 'seq_buf_clear' [-Werror=implicit-function-declaration]
     320 |         seq_buf_clear(&hm->outbuf);
         |         ^~~~~~~~~~~~~
   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:6,
                    from include/linux/uuid.h:11,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_healthmon.c:6:
   fs/xfs/xfs_healthmon.c: In function 'xfs_healthmon_format':
>> fs/xfs/xfs_healthmon.c:376:17: error: implicit declaration of function 'seq_buf_has_overflowed'; did you mean 'seq_has_overflowed'? [-Werror=implicit-function-declaration]
     376 |         ASSERT(!seq_buf_has_overflowed(outbuf));
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   fs/xfs/xfs_healthmon.c:376:9: note: in expansion of macro 'ASSERT'
     376 |         ASSERT(!seq_buf_has_overflowed(outbuf));
         |         ^~~~~~
   fs/xfs/xfs_healthmon.c: In function 'xfs_healthmon_outbuf_bytes':
>> fs/xfs/xfs_healthmon.c:401:40: error: implicit declaration of function 'seq_buf_used' [-Werror=implicit-function-declaration]
     401 |         unsigned int            used = seq_buf_used(&hm->outbuf);
         |                                        ^~~~~~~~~~~~
   fs/xfs/xfs_healthmon.c: In function 'xfs_ioc_health_monitor':
>> fs/xfs/xfs_healthmon.c:636:9: error: implicit declaration of function 'seq_buf_init'; did you mean 'seq_file_init'? [-Werror=implicit-function-declaration]
     636 |         seq_buf_init(&hm->outbuf, outbuf, XFS_HEALTHMON_BUFSIZE);
         |         ^~~~~~~~~~~~
         |         seq_file_init
   fs/xfs/xfs_healthmon.c: At top level:
   fs/xfs/xfs_healthmon.c:184:1: warning: 'xfs_healthmon_start_live_update' defined but not used [-Wunused-function]
     184 | xfs_healthmon_start_live_update(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/outbuf +93 fs/xfs/xfs_healthmon.c

    75	
    76	struct xfs_healthmon {
    77		/* lock for mp and eventlist */
    78		struct mutex			lock;
    79	
    80		/* waiter for signalling the arrival of events */
    81		struct wait_queue_head		wait;
    82	
    83		/* list of event objects */
    84		struct xfs_healthmon_event	*first_event;
    85		struct xfs_healthmon_event	*last_event;
    86	
    87		struct xfs_mount		*mp;
    88	
    89		/* number of events */
    90		unsigned int			events;
    91	
    92		/* Buffer for formatting events */
  > 93		struct seq_buf			outbuf;
    94		size_t				outpos;
    95	
    96		/* do we want all events? */
    97		bool				verbose;
    98	
    99		/* did we lose an event? */
   100		bool				lost_prev_event;
   101	};
   102	
   103	/* Remove an event from the head of the list. */
   104	static inline struct xfs_healthmon_event *
   105	xfs_healthmon_pop(
   106		struct xfs_healthmon		*hm)
   107	{
   108		struct xfs_healthmon_event	*ret = hm->first_event;
   109	
   110		if (!ret)
   111			return NULL;
   112	
   113		if (hm->last_event == ret)
   114			hm->last_event = NULL;
   115		hm->first_event = ret->next;
   116		hm->events--;
   117	
   118		trace_xfs_healthmon_pop(hm->mp, ret);
   119		return ret;
   120	}
   121	
   122	/* Push an event onto the end of the list. */
   123	static inline int
   124	xfs_healthmon_push(
   125		struct xfs_healthmon		*hm,
   126		struct xfs_healthmon_event	*event)
   127	{
   128		/*
   129		 * If the queue is already full, remember the fact that we lost events.
   130		 * This doesn't apply to "event lost" events; those always go through
   131		 * because there should only be one at the very end of the queue.
   132		 */
   133		if (hm->events >= XFS_HEALTHMON_MAX_EVENTS &&
   134		    event->type != XFS_HEALTHMON_LOST) {
   135			trace_xfs_healthmon_lost_event(hm->mp);
   136			hm->lost_prev_event = true;
   137			return -ENOMEM;
   138		}
   139	
   140		if (!hm->first_event)
   141			hm->first_event = event;
   142		if (hm->last_event)
   143			hm->last_event->next = event;
   144		hm->last_event = event;
   145		event->next = NULL;
   146		hm->events++;
   147		wake_up(&hm->wait);
   148	
   149		trace_xfs_healthmon_push(hm->mp, event);
   150	
   151		return 0;
   152	}
   153	
   154	/* Create a new event or record that we failed. */
   155	static struct xfs_healthmon_event *
   156	xfs_healthmon_alloc(
   157		struct xfs_healthmon		*hm,
   158		enum xfs_healthmon_type		type,
   159		enum xfs_healthmon_domain	domain)
   160	{
   161		struct timespec64		now;
   162		struct xfs_healthmon_event	*event;
   163	
   164		event = kzalloc(sizeof(*event), GFP_NOFS);
   165		if (!event) {
   166			trace_xfs_healthmon_lost_event(hm->mp);
   167			hm->lost_prev_event = true;
   168			return NULL;
   169		}
   170	
   171		event->type = type;
   172		event->domain = domain;
   173		ktime_get_coarse_real_ts64(&now);
   174		event->time_ns = (now.tv_sec * NSEC_PER_SEC) + now.tv_nsec;
   175	
   176		return event;
   177	}
   178	
   179	/*
   180	 * Before we accept an event notification from a live update hook, we need to
   181	 * clear out any previously lost events.
   182	 */
   183	STATIC int
   184	xfs_healthmon_start_live_update(
   185		struct xfs_healthmon		*hm)
   186	{
   187		struct xfs_healthmon_event	*event;
   188	
   189		/*
   190		 * If we previously lost an event or the queue is full, try to queue
   191		 * a notification about lost events.
   192		 */
   193		if (!hm->lost_prev_event && hm->events != XFS_HEALTHMON_MAX_EVENTS)
   194			return 0;
   195	
   196		/*
   197		 * A previous invocation of the live update hook could not allocate
   198		 * any memory at all.  If the last event on the list is already a
   199		 * notification of lost events, we're done.
   200		 */
   201		if (hm->last_event && hm->last_event->type == XFS_HEALTHMON_LOST)
   202			return 0;
   203	
   204		/*
   205		 * There are no events or the last one wasn't about lost events.  Try
   206		 * to allocate a new one to note the lost events.
   207		 */
   208		event = xfs_healthmon_alloc(hm, XFS_HEALTHMON_LOST,
   209				XFS_HEALTHMON_MOUNT);
   210		if (!event)
   211			return -ENOMEM;
   212	
   213		hm->lost_prev_event = false;
   214		xfs_healthmon_push(hm, event);
   215		return 0;
   216	}
   217	
   218	/* Render the health update type as a string. */
   219	STATIC const char *
   220	xfs_healthmon_typestring(
   221		const struct xfs_healthmon_event	*event)
   222	{
   223		static const char *type_strings[] = {
   224			[XFS_HEALTHMON_LOST]		= "lost",
   225		};
   226	
   227		if (event->type >= ARRAY_SIZE(type_strings))
   228			return "?";
   229	
   230		return type_strings[event->type];
   231	}
   232	
   233	/* Render the health domain as a string. */
   234	STATIC const char *
   235	xfs_healthmon_domstring(
   236		const struct xfs_healthmon_event	*event)
   237	{
   238		static const char *dom_strings[] = {
   239			[XFS_HEALTHMON_MOUNT]		= "mount",
   240		};
   241	
   242		if (event->domain >= ARRAY_SIZE(dom_strings))
   243			return "?";
   244	
   245		return dom_strings[event->domain];
   246	}
   247	
   248	/* Convert a flags bitmap into a jsonable string. */
   249	static inline int
   250	xfs_healthmon_format_flags(
   251		struct seq_buf			*outbuf,
   252		const struct flag_string	*strings,
   253		size_t				nr_strings,
   254		unsigned int			flags)
   255	{
   256		const struct flag_string	*p;
   257		ssize_t				ret;
   258		unsigned int			i;
   259		bool				first = true;
   260	
   261		for (i = 0, p = strings; i < nr_strings; i++, p++) {
   262			if (!(p->mask & flags))
   263				continue;
   264	
 > 265			ret = seq_buf_printf(outbuf, "%s\"%s\"",
   266					first ? "" : ", ", p->str);
   267			if (ret < 0)
   268				return ret;
   269	
   270			first = false;
   271			flags &= ~p->mask;
   272		}
   273	
   274		for (i = 0; flags != 0 && i < sizeof(flags) * NBBY; i++) {
   275			if (!(flags & (1U << i)))
   276				continue;
   277	
   278			/* json doesn't support hexadecimal notation */
   279			ret = seq_buf_printf(outbuf, "%s%u",
   280					first ? "" : ", ", (1U << i));
   281			if (ret < 0)
   282				return ret;
   283	
   284			first = false;
   285		}
   286	
   287		return 0;
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
