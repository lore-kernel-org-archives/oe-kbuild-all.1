Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830081;
	b=IiNknmNn/0pYxujM6iTJ+jRnU9Tqsb/Ic1VzEoJPT0AizEOlsEy8VaqjqhisZz+j7PX4
	 6IrwOi/DjV7hlmTZizr4VcUpwkA7iSpB7CCNHYKIhwVGpnfwRnwGuGhMiDo+dENDhXR2X
	 4KOoKyv9ibQHvPzVj3Zz1XF4qGg9bycjQkMMCh7/W0ua8LDy+yb9ZivKe+9jhLc+dauqz
	 /F8MhIDf8Kc2t0LUYaAk4+ousTswACQCiiLon1ascfERNZPv6j+l6hiYGvX/6nVi+Fwil
	 Za/Z1pou1SbcUPhMjjTtE7YkmZfiEjzMDmO+aC36RZ2d3PPbRTWD/xEc5O8KsBl7atw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830081;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ch4i8rcmr52ToiTal7gsuDla1/irt5A5W9RJhoAVMU0=;
	b=jNoWq93qayWs7jdDQzTotSjaPeKhi4Hi6FVTFMwQfudDh+ON61g8WXmnjOx2L1qSD09W
	 E4nglHq7rUck4SNsIpzDWBqhOfip8Vxc9/oK+W+MdK4+At0AF1ouWG/n/MyGoIqgsUZmX
	 Nnhgs2gGYgguk8f8tA0NYhz98fFJ2TtqcXMenk2QMUvHIKYQF3hF66ZIJInpbLbAoqeWP
	 A7r8KvrtgC2HWKjccSp2RXd/4yWYjtiuW2oLea4pCnaDoncznf1VJHBreuUIH7t4umQjt
	 sAuyiy9ell4hW1KnOXAnXoH5owKEzNykwpSc54kJuareA9Ims288jiRdWgV/GlBTfGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jG0Fjm2+;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B388E606E829
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 22:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B388E606E829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jG0Fjm2+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793830079; x=1825366079;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JIXwA3GrJryFu5iVWC5GXJDlxet6QdSNlubbSHDxBI0=;
  b=jG0Fjm2+dqbOJ5MfjBbWzLCAWBSu1rzfkUzi1C2Ciqnzz5JBTHY+Xg4D
   zECed2hMzDqjQn+5wKXsO7o4QVKwtasU9r/musZ3lZM1Ttuo1oCh/RoqB
   WQDMX2SECGEcusjcY9r7rutQt5gakiXGucUXGZsGKhut8YvjgyKhRZYv0
   W3nGfRuLc+DYNlawumJr51gfHMLjAPYNhqwSzklM2PNUpz3b5REwKraQ3
   We4pUtR8QjhyL2v9QY/eyBZ1mGYi4T8LZc6r7UT+HPWgdW8NM5IiWx1X1
   TN++bzOc5F7rTIyozlpw/MOZeeX77mJPipxGads/7E+BhoWAXTex/8Vuk
   A==;
X-CSE-ConnectionGUID: qMnoOf14RrmmzupIZLb2Kw==
X-CSE-MsgGUID: I8OtqhGySwCSomBdXkH3yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2481477"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2481477"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 14:07:59 -0800
X-CSE-ConnectionGUID: uFOizrOiT4mB4oDV+xU8Xw==
X-CSE-MsgGUID: YQnB3ZrXSduHdN2RxTWxkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7376169"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2026 14:07:58 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOj99-000000009H1-2v3x;
	Wed, 04 Nov 2026 22:07:55 +0000
Date: Wed, 04 Nov 2026 23:07:54 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:locking 5/23] include/linux/ww_mutex.h:327:1:
 warning: expecting ww_mutex 'lock' to be held at the end of function
Message-ID: <202611042229.Ty6Q2wNq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/bvanassche/linux locking
head:   7ad17b1ab9fef72f82442c00168277c0891d84f7
commit: a5557006c9d6e359692c0be1d99470adaa1f4853 [5/23] locking/ww_mutex: M=
ake context analysis track the embedded mutex
config: mips-randconfig-2200-20261104 (https://download.01.org/0day-ci/arch=
ive/20261104/202611042229.Ty6Q2wNq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e=
3d6c39cfebec9eace23629a5a103df2c79ba6)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261104/202611042229.Ty6Q2wNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611042229.Ty6Q2wNq-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/locking/rtmutex_api.c:9:
   In file included from kernel/locking/rtmutex.c:25:
>> include/linux/ww_mutex.h:327:1: warning: expecting ww_mutex 'lock' to be=
 held at the end of function [-Wthread-safety-analysis]
     327 | }
         | ^
   include/linux/ww_mutex.h:318:1: note: ww_mutex acquired here
     318 | ww_mutex_lock_slow(struct ww_mutex *lock, struct ww_acquire_ctx =
*ctx)
         | ^
>> include/linux/ww_mutex.h:327:1: warning: expecting mutex 'lock->base' to=
 be held at the end of function [-Wthread-safety-analysis]
     327 | }
         | ^
   include/linux/ww_mutex.h:318:1: note: mutex acquired here
     318 | ww_mutex_lock_slow(struct ww_mutex *lock, struct ww_acquire_ctx =
*ctx)
         | ^
   2 warnings generated.


vim +/lock +327 include/linux/ww_mutex.h

1b375dc3071018 Maarten Lankhorst 2013-07-05  223 =20
1b375dc3071018 Maarten Lankhorst 2013-07-05  224  /**
1b375dc3071018 Maarten Lankhorst 2013-07-05  225   * ww_mutex_lock - acquir=
e the w/w mutex
1b375dc3071018 Maarten Lankhorst 2013-07-05  226   * @lock: the mutex to be=
 acquired
1b375dc3071018 Maarten Lankhorst 2013-07-05  227   * @ctx: w/w acquire cont=
ext, or NULL to acquire only a single lock.
1b375dc3071018 Maarten Lankhorst 2013-07-05  228   *
1b375dc3071018 Maarten Lankhorst 2013-07-05  229   * Lock the w/w mutex exc=
lusively for this task.
1b375dc3071018 Maarten Lankhorst 2013-07-05  230   *
1b375dc3071018 Maarten Lankhorst 2013-07-05  231   * Deadlocks within a giv=
en w/w class of locks are detected and handled with the
55f036ca7e74b8 Peter Ziljstra    2018-06-15  232   * wait/die algorithm. If=
 the lock isn't immediately available this function
1b375dc3071018 Maarten Lankhorst 2013-07-05  233   * will either sleep unti=
l it is (wait case). Or it selects the current context
55f036ca7e74b8 Peter Ziljstra    2018-06-15  234   * for backing off by ret=
urning -EDEADLK (die case). Trying to acquire the
1b375dc3071018 Maarten Lankhorst 2013-07-05  235   * same lock with the sam=
e context twice is also detected and signalled by
1b375dc3071018 Maarten Lankhorst 2013-07-05  236   * returning -EALREADY. R=
eturns 0 if the mutex was successfully acquired.
1b375dc3071018 Maarten Lankhorst 2013-07-05  237   *
55f036ca7e74b8 Peter Ziljstra    2018-06-15  238   * In the die case the ca=
ller must release all currently held w/w mutexes for
1b375dc3071018 Maarten Lankhorst 2013-07-05  239   * the given context and =
then wait for this contending lock to be available by
1b375dc3071018 Maarten Lankhorst 2013-07-05  240   * calling ww_mutex_lock_=
slow. Alternatively callers can opt to not acquire this
1b375dc3071018 Maarten Lankhorst 2013-07-05  241   * lock and proceed with =
trying to acquire further w/w mutexes (e.g. when
1b375dc3071018 Maarten Lankhorst 2013-07-05  242   * scanning through lru l=
ists trying to free resources).
1b375dc3071018 Maarten Lankhorst 2013-07-05  243   *
1b375dc3071018 Maarten Lankhorst 2013-07-05  244   * The mutex must later o=
n be released by the same task that
1b375dc3071018 Maarten Lankhorst 2013-07-05  245   * acquired it. The task =
may not exit without first unlocking the mutex. Also,
1b375dc3071018 Maarten Lankhorst 2013-07-05  246   * kernel memory where th=
e mutex resides must not be freed with the mutex still
1b375dc3071018 Maarten Lankhorst 2013-07-05  247   * locked. The mutex must=
 first be initialized (or statically defined) before it
1b375dc3071018 Maarten Lankhorst 2013-07-05  248   * can be locked. memset(=
)-ing the mutex to 0 is not allowed. The mutex must be
1b375dc3071018 Maarten Lankhorst 2013-07-05  249   * of the same w/w lock c=
lass as was used to initialize the acquire context.
1b375dc3071018 Maarten Lankhorst 2013-07-05  250   *
1b375dc3071018 Maarten Lankhorst 2013-07-05  251   * A mutex acquired with =
this function must be released with ww_mutex_unlock.
1b375dc3071018 Maarten Lankhorst 2013-07-05  252   */
47907461e4f6fc Marco Elver       2025-12-19  253  extern int /* __must_chec=
k */ ww_mutex_lock(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
a5557006c9d6e3 Bart Van Assche   2026-11-02  254  	__cond_acquires(0, lock)
a5557006c9d6e3 Bart Van Assche   2026-11-02  255  	__cond_acquires(0, &lock=
->base)
a5557006c9d6e3 Bart Van Assche   2026-11-02  256  	__must_hold(ctx);
1b375dc3071018 Maarten Lankhorst 2013-07-05  257 =20
1b375dc3071018 Maarten Lankhorst 2013-07-05  258  /**
1b375dc3071018 Maarten Lankhorst 2013-07-05  259   * ww_mutex_lock_interrup=
tible - acquire the w/w mutex, interruptible
1b375dc3071018 Maarten Lankhorst 2013-07-05  260   * @lock: the mutex to be=
 acquired
1b375dc3071018 Maarten Lankhorst 2013-07-05  261   * @ctx: w/w acquire cont=
ext
1b375dc3071018 Maarten Lankhorst 2013-07-05  262   *
1b375dc3071018 Maarten Lankhorst 2013-07-05  263   * Lock the w/w mutex exc=
lusively for this task.
1b375dc3071018 Maarten Lankhorst 2013-07-05  264   *
1b375dc3071018 Maarten Lankhorst 2013-07-05  265   * Deadlocks within a giv=
en w/w class of locks are detected and handled with the
55f036ca7e74b8 Peter Ziljstra    2018-06-15  266   * wait/die algorithm. If=
 the lock isn't immediately available this function
1b375dc3071018 Maarten Lankhorst 2013-07-05  267   * will either sleep unti=
l it is (wait case). Or it selects the current context
55f036ca7e74b8 Peter Ziljstra    2018-06-15  268   * for backing off by ret=
urning -EDEADLK (die case). Trying to acquire the
1b375dc3071018 Maarten Lankhorst 2013-07-05  269   * same lock with the sam=
e context twice is also detected and signalled by
1b375dc3071018 Maarten Lankhorst 2013-07-05  270   * returning -EALREADY. R=
eturns 0 if the mutex was successfully acquired. If a
1b375dc3071018 Maarten Lankhorst 2013-07-05  271   * signal arrives while w=
aiting for the lock then this function returns -EINTR.
1b375dc3071018 Maarten Lankhorst 2013-07-05  272   *
55f036ca7e74b8 Peter Ziljstra    2018-06-15  273   * In the die case the ca=
ller must release all currently held w/w mutexes for
1b375dc3071018 Maarten Lankhorst 2013-07-05  274   * the given context and =
then wait for this contending lock to be available by
1b375dc3071018 Maarten Lankhorst 2013-07-05  275   * calling ww_mutex_lock_=
slow_interruptible. Alternatively callers can opt to
1b375dc3071018 Maarten Lankhorst 2013-07-05  276   * not acquire this lock =
and proceed with trying to acquire further w/w mutexes
1b375dc3071018 Maarten Lankhorst 2013-07-05  277   * (e.g. when scanning th=
rough lru lists trying to free resources).
1b375dc3071018 Maarten Lankhorst 2013-07-05  278   *
1b375dc3071018 Maarten Lankhorst 2013-07-05  279   * The mutex must later o=
n be released by the same task that
1b375dc3071018 Maarten Lankhorst 2013-07-05  280   * acquired it. The task =
may not exit without first unlocking the mutex. Also,
1b375dc3071018 Maarten Lankhorst 2013-07-05  281   * kernel memory where th=
e mutex resides must not be freed with the mutex still
1b375dc3071018 Maarten Lankhorst 2013-07-05  282   * locked. The mutex must=
 first be initialized (or statically defined) before it
1b375dc3071018 Maarten Lankhorst 2013-07-05  283   * can be locked. memset(=
)-ing the mutex to 0 is not allowed. The mutex must be
1b375dc3071018 Maarten Lankhorst 2013-07-05  284   * of the same w/w lock c=
lass as was used to initialize the acquire context.
1b375dc3071018 Maarten Lankhorst 2013-07-05  285   *
1b375dc3071018 Maarten Lankhorst 2013-07-05  286   * A mutex acquired with =
this function must be released with ww_mutex_unlock.
1b375dc3071018 Maarten Lankhorst 2013-07-05  287   */
c5470b22d18332 Nicolai H=C3=A4hnle    2016-12-21  288  extern int __must_ch=
eck ww_mutex_lock_interruptible(struct ww_mutex *lock,
47907461e4f6fc Marco Elver       2025-12-19  289  						    struct ww_acqui=
re_ctx *ctx)
a5557006c9d6e3 Bart Van Assche   2026-11-02  290  	__cond_acquires(0, lock)
a5557006c9d6e3 Bart Van Assche   2026-11-02  291  	__cond_acquires(0, &lock=
->base)
a5557006c9d6e3 Bart Van Assche   2026-11-02  292  	__must_hold(ctx);
1b375dc3071018 Maarten Lankhorst 2013-07-05  293 =20
1b375dc3071018 Maarten Lankhorst 2013-07-05  294  /**
1b375dc3071018 Maarten Lankhorst 2013-07-05  295   * ww_mutex_lock_slow - s=
lowpath acquiring of the w/w mutex
1b375dc3071018 Maarten Lankhorst 2013-07-05  296   * @lock: the mutex to be=
 acquired
1b375dc3071018 Maarten Lankhorst 2013-07-05  297   * @ctx: w/w acquire cont=
ext
1b375dc3071018 Maarten Lankhorst 2013-07-05  298   *
55f036ca7e74b8 Peter Ziljstra    2018-06-15  299   * Acquires a w/w mutex w=
ith the given context after a die case. This function
1b375dc3071018 Maarten Lankhorst 2013-07-05  300   * will sleep until the l=
ock becomes available.
1b375dc3071018 Maarten Lankhorst 2013-07-05  301   *
1b375dc3071018 Maarten Lankhorst 2013-07-05  302   * The caller must have r=
eleased all w/w mutexes already acquired with the
1b375dc3071018 Maarten Lankhorst 2013-07-05  303   * context and then call =
this function on the contended lock.
1b375dc3071018 Maarten Lankhorst 2013-07-05  304   *
1b375dc3071018 Maarten Lankhorst 2013-07-05  305   * Afterwards the caller =
may continue to (re)acquire the other w/w mutexes it
1b375dc3071018 Maarten Lankhorst 2013-07-05  306   * needs with ww_mutex_lo=
ck. Note that the -EALREADY return code from
1b375dc3071018 Maarten Lankhorst 2013-07-05  307   * ww_mutex_lock can be u=
sed to avoid locking this contended mutex twice.
1b375dc3071018 Maarten Lankhorst 2013-07-05  308   *
1b375dc3071018 Maarten Lankhorst 2013-07-05  309   * It is forbidden to cal=
l this function with any other w/w mutexes associated
1b375dc3071018 Maarten Lankhorst 2013-07-05  310   * with the context held.=
 It is forbidden to call this on anything else than the
1b375dc3071018 Maarten Lankhorst 2013-07-05  311   * contending mutex.
1b375dc3071018 Maarten Lankhorst 2013-07-05  312   *
1b375dc3071018 Maarten Lankhorst 2013-07-05  313   * Note that the slowpath=
 lock acquiring can also be done by calling
1b375dc3071018 Maarten Lankhorst 2013-07-05  314   * ww_mutex_lock directly=
. This function here is simply to help w/w mutex
1b375dc3071018 Maarten Lankhorst 2013-07-05  315   * locking code readabili=
ty by clearly denoting the slowpath.
1b375dc3071018 Maarten Lankhorst 2013-07-05  316   */
1b375dc3071018 Maarten Lankhorst 2013-07-05  317  static inline void
1b375dc3071018 Maarten Lankhorst 2013-07-05  318  ww_mutex_lock_slow(struct=
 ww_mutex *lock, struct ww_acquire_ctx *ctx)
a5557006c9d6e3 Bart Van Assche   2026-11-02  319  	__acquires(lock)
a5557006c9d6e3 Bart Van Assche   2026-11-02  320  	__acquires(&lock->base)
a5557006c9d6e3 Bart Van Assche   2026-11-02  321  	__must_hold(ctx)
1b375dc3071018 Maarten Lankhorst 2013-07-05  322  {
2408f7a3782a6b Peter Zijlstra    2021-08-15  323  #ifdef DEBUG_WW_MUTEXES
1b375dc3071018 Maarten Lankhorst 2013-07-05  324  	DEBUG_LOCKS_WARN_ON(!ctx=
->contending_lock);
1b375dc3071018 Maarten Lankhorst 2013-07-05  325  #endif
a5557006c9d6e3 Bart Van Assche   2026-11-02  326  	BUG_ON(ww_mutex_lock(loc=
k, ctx) !=3D 0);
1b375dc3071018 Maarten Lankhorst 2013-07-05 @327  }
1b375dc3071018 Maarten Lankhorst 2013-07-05  328 =20

:::::: The code at line 327 was first introduced by commit
:::::: 1b375dc30710180c4b88cc59caba6e3481ec5c8b mutex: Move ww_mutex defini=
tions to ww_mutex.h

:::::: TO: Maarten Lankhorst <maarten.lankhorst@canonical.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
