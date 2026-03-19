Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A085A3D565F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931345; cv=none; b=GRAZOW2OAjX/9qqWvDjC/3bxsdjEf7cR4MseHID1oZ+Z1O+2WsIw7y84J1G8VEGVelxvnhzB/6LW3T5YhNtrce2Cipsya3o8wsn+6DPhui1s4a0Xobk4+NDzgHoJ4a5JW40+2i7ovpHTnv9PoL2L7bOUCDZhMgwuOQ6ZB5//msQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931345; c=relaxed/simple;
	bh=XV27I6YCqtyqsW0y3WFwTTXMMlEtm5Ag2h6L8PWwNgQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rX+u1CDsVjvaG9d+q9F4+UxEHXCTrrwlIjjB4AIgrQwP0WP6/9PP0NfLZl8Q5SINKVMUl6+oTUBJGJlqWIu8zZmJ81S92RDHONmA8+sNFqA+ZaekFELrPwhxGW3ZQxdPOXIekz/ZoodUU49uE0SELK9Di6dqANLcBruj2tnwoZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/ll0HoU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/ll0HoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773931342; x=1805467342;
  h=date:from:to:cc:subject:message-id;
  bh=XV27I6YCqtyqsW0y3WFwTTXMMlEtm5Ag2h6L8PWwNgQ=;
  b=T/ll0HoUYvebVh+ehlnbYbcc2faLUoGeKBRNQo92wuzbtn+785ndFLiB
   iSjuzY/Y9zhG1rNENKZX9pQhkBCNWH5aaTh/+ovxVuA/zCfJ1e5Ic62Vw
   6eD+xxrPJxJGb3b6gz8GNvuuuQyFwuedNsAGCVIwA/TiXQy92BFqnF9kl
   t3N4aIj8vDf984GiWc+UkyPYUE9KDYVDVGZ7NxFbPCEXEgZ4W15V1tBiI
   aIAETLd9I+E4Z/+NBPWEo6lz4UduPhEi70yaY9pHgNTalF2Vam3MNr8sY
   uXgYgaKZ9/x+z2rMwNlcWfL7r5ejLM8ZgLzjC6/GURhD+qf4x/+oQXf2w
   A==;
X-CSE-ConnectionGUID: /X2SGBoTSj26lO5ehJ0pFw==
X-CSE-MsgGUID: 0sLPWLz+RTiZRf7nTXS7kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86366916"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="86366916"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 07:42:21 -0700
X-CSE-ConnectionGUID: OdATlTpERPKZX8aqNZMqSA==
X-CSE-MsgGUID: DVc8Ajv0SVGkBzt+6F+C8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="253447943"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Mar 2026 07:42:19 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3EZk-0000000019R-36lM;
	Thu, 19 Mar 2026 14:42:16 +0000
Date: Thu, 19 Mar 2026 22:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 19/539] include/linux/uio.h:242:52: warning:
 passing argument 1 of 'copy_to_iter_full' discards 'volatile' qualifier from
 pointer target type
Message-ID: <202603192212.u118ilez-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   f36e0fb8d552bd827ef31f4fc1190d0149c44249
commit: 6eff642478bf860ef70185bece906bbad1cd0a62 [19/539] char/dsp56k: convert to read/write iterators
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260319/202603192212.u118ilez-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603192212.u118ilez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603192212.u118ilez-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/dsp56k.c: In function 'dsp56k_read':
>> include/linux/uio.h:242:52: warning: passing argument 1 of 'copy_to_iter_full' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     242 | #define put_iter(val, to)       !copy_to_iter_full(&(val), sizeof((val)), to)
         |                                                    ^~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:204:35: note: in expansion of macro 'put_iter'
     204 |                                   put_iter(dsp56k_host_interface.data.b[3], to); n++);
         |                                   ^~~~~~~~
   In file included from include/linux/fs.h:49,
                    from drivers/char/dsp56k.c:31:
   include/linux/uio.h:233:36: note: expected 'const void *' but argument is of type 'volatile u_char *' {aka 'volatile unsigned char *'}
     233 | bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
         |                        ~~~~~~~~~~~~^~~~
>> include/linux/uio.h:242:33: warning: value computed is not used [-Wunused-value]
     242 | #define put_iter(val, to)       !copy_to_iter_full(&(val), sizeof((val)), to)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:204:35: note: in expansion of macro 'put_iter'
     204 |                                   put_iter(dsp56k_host_interface.data.b[3], to); n++);
         |                                   ^~~~~~~~
>> include/linux/uio.h:242:52: warning: passing argument 1 of 'copy_to_iter_full' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     242 | #define put_iter(val, to)       !copy_to_iter_full(&(val), sizeof((val)), to)
         |                                                    ^~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:211:35: note: in expansion of macro 'put_iter'
     211 |                                   put_iter(dsp56k_host_interface.data.w[1], to); n++);
         |                                   ^~~~~~~~
   include/linux/uio.h:233:36: note: expected 'const void *' but argument is of type 'volatile u_short *' {aka 'volatile short unsigned int *'}
     233 | bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
         |                        ~~~~~~~~~~~~^~~~
>> include/linux/uio.h:242:33: warning: value computed is not used [-Wunused-value]
     242 | #define put_iter(val, to)       !copy_to_iter_full(&(val), sizeof((val)), to)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:211:35: note: in expansion of macro 'put_iter'
     211 |                                   put_iter(dsp56k_host_interface.data.w[1], to); n++);
         |                                   ^~~~~~~~
>> include/linux/uio.h:242:52: warning: passing argument 1 of 'copy_to_iter_full' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     242 | #define put_iter(val, to)       !copy_to_iter_full(&(val), sizeof((val)), to)
         |                                                    ^~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:218:35: note: in expansion of macro 'put_iter'
     218 |                                   put_iter(dsp56k_host_interface.data.b[1], to);
         |                                   ^~~~~~~~
   include/linux/uio.h:233:36: note: expected 'const void *' but argument is of type 'volatile u_char *' {aka 'volatile unsigned char *'}
     233 | bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
         |                        ~~~~~~~~~~~~^~~~
>> include/linux/uio.h:242:33: warning: value computed is not used [-Wunused-value]
     242 | #define put_iter(val, to)       !copy_to_iter_full(&(val), sizeof((val)), to)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:218:35: note: in expansion of macro 'put_iter'
     218 |                                   put_iter(dsp56k_host_interface.data.b[1], to);
         |                                   ^~~~~~~~
>> include/linux/uio.h:242:52: warning: passing argument 1 of 'copy_to_iter_full' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     242 | #define put_iter(val, to)       !copy_to_iter_full(&(val), sizeof((val)), to)
         |                                                    ^~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:219:35: note: in expansion of macro 'put_iter'
     219 |                                   put_iter(dsp56k_host_interface.data.b[2], to);
         |                                   ^~~~~~~~
   include/linux/uio.h:233:36: note: expected 'const void *' but argument is of type 'volatile u_char *' {aka 'volatile unsigned char *'}
     233 | bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
         |                        ~~~~~~~~~~~~^~~~
>> include/linux/uio.h:242:33: warning: value computed is not used [-Wunused-value]
     242 | #define put_iter(val, to)       !copy_to_iter_full(&(val), sizeof((val)), to)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:219:35: note: in expansion of macro 'put_iter'
     219 |                                   put_iter(dsp56k_host_interface.data.b[2], to);
         |                                   ^~~~~~~~
>> include/linux/uio.h:242:52: warning: passing argument 1 of 'copy_to_iter_full' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     242 | #define put_iter(val, to)       !copy_to_iter_full(&(val), sizeof((val)), to)
         |                                                    ^~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:220:35: note: in expansion of macro 'put_iter'
     220 |                                   put_iter(dsp56k_host_interface.data.b[3], to); n++);
         |                                   ^~~~~~~~
   include/linux/uio.h:233:36: note: expected 'const void *' but argument is of type 'volatile u_char *' {aka 'volatile unsigned char *'}
     233 | bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
         |                        ~~~~~~~~~~~~^~~~
>> include/linux/uio.h:242:33: warning: value computed is not used [-Wunused-value]
     242 | #define put_iter(val, to)       !copy_to_iter_full(&(val), sizeof((val)), to)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:220:35: note: in expansion of macro 'put_iter'
     220 |                                   put_iter(dsp56k_host_interface.data.b[3], to); n++);
         |                                   ^~~~~~~~
>> include/linux/uio.h:242:52: warning: passing argument 1 of 'copy_to_iter_full' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     242 | #define put_iter(val, to)       !copy_to_iter_full(&(val), sizeof((val)), to)
         |                                                    ^~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:227:35: note: in expansion of macro 'put_iter'
     227 |                                   put_iter(dsp56k_host_interface.data.l, to); n++);
         |                                   ^~~~~~~~
   include/linux/uio.h:233:36: note: expected 'const void *' but argument is of type 'volatile u_long *' {aka 'volatile long unsigned int *'}
     233 | bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
         |                        ~~~~~~~~~~~~^~~~
>> include/linux/uio.h:242:33: warning: value computed is not used [-Wunused-value]
     242 | #define put_iter(val, to)       !copy_to_iter_full(&(val), sizeof((val)), to)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:227:35: note: in expansion of macro 'put_iter'
     227 |                                   put_iter(dsp56k_host_interface.data.l, to); n++);
         |                                   ^~~~~~~~
   drivers/char/dsp56k.c: In function 'dsp56k_write':
>> include/linux/uio.h:243:54: warning: passing argument 1 of 'copy_from_iter_full' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                                      ^~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:260:35: note: in expansion of macro 'get_iter'
     260 |                                   get_iter(dsp56k_host_interface.data.b[3], from); n++);
         |                                   ^~~~~~~~
   include/linux/uio.h:246:32: note: expected 'void *' but argument is of type 'volatile u_char *' {aka 'volatile unsigned char *'}
     246 | bool copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i)
         |                          ~~~~~~^~~~
   include/linux/uio.h:243:33: warning: value computed is not used [-Wunused-value]
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:260:35: note: in expansion of macro 'get_iter'
     260 |                                   get_iter(dsp56k_host_interface.data.b[3], from); n++);
         |                                   ^~~~~~~~
>> include/linux/uio.h:243:54: warning: passing argument 1 of 'copy_from_iter_full' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                                      ^~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:267:35: note: in expansion of macro 'get_iter'
     267 |                                   get_iter(dsp56k_host_interface.data.w[1], from); n++);
         |                                   ^~~~~~~~
   include/linux/uio.h:246:32: note: expected 'void *' but argument is of type 'volatile u_short *' {aka 'volatile short unsigned int *'}
     246 | bool copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i)
         |                          ~~~~~~^~~~
   include/linux/uio.h:243:33: warning: value computed is not used [-Wunused-value]
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:267:35: note: in expansion of macro 'get_iter'
     267 |                                   get_iter(dsp56k_host_interface.data.w[1], from); n++);
         |                                   ^~~~~~~~
>> include/linux/uio.h:243:54: warning: passing argument 1 of 'copy_from_iter_full' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                                      ^~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:274:35: note: in expansion of macro 'get_iter'
     274 |                                   get_iter(dsp56k_host_interface.data.b[1], from);
         |                                   ^~~~~~~~
   include/linux/uio.h:246:32: note: expected 'void *' but argument is of type 'volatile u_char *' {aka 'volatile unsigned char *'}
     246 | bool copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i)
         |                          ~~~~~~^~~~
   include/linux/uio.h:243:33: warning: value computed is not used [-Wunused-value]
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:274:35: note: in expansion of macro 'get_iter'
     274 |                                   get_iter(dsp56k_host_interface.data.b[1], from);
         |                                   ^~~~~~~~
>> include/linux/uio.h:243:54: warning: passing argument 1 of 'copy_from_iter_full' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                                      ^~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:275:35: note: in expansion of macro 'get_iter'
     275 |                                   get_iter(dsp56k_host_interface.data.b[2], from);
         |                                   ^~~~~~~~
   include/linux/uio.h:246:32: note: expected 'void *' but argument is of type 'volatile u_char *' {aka 'volatile unsigned char *'}
     246 | bool copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i)
         |                          ~~~~~~^~~~
   include/linux/uio.h:243:33: warning: value computed is not used [-Wunused-value]
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:275:35: note: in expansion of macro 'get_iter'
     275 |                                   get_iter(dsp56k_host_interface.data.b[2], from);
         |                                   ^~~~~~~~
>> include/linux/uio.h:243:54: warning: passing argument 1 of 'copy_from_iter_full' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                                      ^~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:276:35: note: in expansion of macro 'get_iter'
     276 |                                   get_iter(dsp56k_host_interface.data.b[3], from); n++);
         |                                   ^~~~~~~~
   include/linux/uio.h:246:32: note: expected 'void *' but argument is of type 'volatile u_char *' {aka 'volatile unsigned char *'}
     246 | bool copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i)
         |                          ~~~~~~^~~~
   include/linux/uio.h:243:33: warning: value computed is not used [-Wunused-value]
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:276:35: note: in expansion of macro 'get_iter'
     276 |                                   get_iter(dsp56k_host_interface.data.b[3], from); n++);
         |                                   ^~~~~~~~
>> include/linux/uio.h:243:54: warning: passing argument 1 of 'copy_from_iter_full' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                                      ^~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:283:35: note: in expansion of macro 'get_iter'
     283 |                                   get_iter(dsp56k_host_interface.data.l, from); n++);
         |                                   ^~~~~~~~
   include/linux/uio.h:246:32: note: expected 'void *' but argument is of type 'volatile u_long *' {aka 'volatile long unsigned int *'}
     246 | bool copy_from_iter_full(void *addr, size_t bytes, struct iov_iter *i)
         |                          ~~~~~~^~~~
   include/linux/uio.h:243:33: warning: value computed is not used [-Wunused-value]
     243 | #define get_iter(val, from)     !copy_from_iter_full(&(val), sizeof((val)), from)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/dsp56k.c:70:25: note: in definition of macro 'handshake'
      70 |                         f; \
         |                         ^
   drivers/char/dsp56k.c:283:35: note: in expansion of macro 'get_iter'
     283 |                                   get_iter(dsp56k_host_interface.data.l, from); n++);
         |                                   ^~~~~~~~


vim +242 include/linux/uio.h

aa28de275a2488 Al Viro    2017-06-29  231  
e82051193a171f Al Viro    2024-04-07  232  static __always_inline __must_check
e82051193a171f Al Viro    2024-04-07 @233  bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
e82051193a171f Al Viro    2024-04-07  234  {
e82051193a171f Al Viro    2024-04-07  235  	size_t copied = copy_to_iter(addr, bytes, i);
e82051193a171f Al Viro    2024-04-07  236  	if (likely(copied == bytes))
e82051193a171f Al Viro    2024-04-07  237  		return true;
e82051193a171f Al Viro    2024-04-07  238  	iov_iter_revert(i, copied);
e82051193a171f Al Viro    2024-04-07  239  	return false;
e82051193a171f Al Viro    2024-04-07  240  }
e82051193a171f Al Viro    2024-04-07  241  
14e47903fa5ed1 Jens Axboe 2024-04-09 @242  #define put_iter(val, to)	!copy_to_iter_full(&(val), sizeof((val)), to)
14e47903fa5ed1 Jens Axboe 2024-04-09 @243  #define get_iter(val, from)	!copy_from_iter_full(&(val), sizeof((val)), from)
14e47903fa5ed1 Jens Axboe 2024-04-09  244  

:::::: The code at line 242 was first introduced by commit
:::::: 14e47903fa5ed14819558dbb339cb0febcac748c uio: add get/put_iter helpers

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
