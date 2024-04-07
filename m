Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E8963B8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 06:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712472728; cv=none; b=OXAsSpq56iy3XV8fkN2ZVOfitxdx+hDo7TV1mfz+ccs2kmP7JujD9jadvf02pt7v76fJ27S7JSJpA2JWxlURdKaU93ufTMDUTASd16JF0OPejwe3EXFvIQAAMneHglvJM3FY+hZ/mnfreTZWjpoE+juGx3ZWqmicMGQbXk6PW9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712472728; c=relaxed/simple;
	bh=Gx23YeP1txZpf8OI348FOmc+9cQA9r7+e/hBBgX4rN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DyzySuY2K/++XwfyDmKmzNxOPL2QIT+/EJfFLAC7/Tiqn7/GXF0u7QQSvi8A+OX+tD/vdspF26cUsSqzaNWP3L8u+7KKHtGipHE1kqexHkALN0LmmZKiwB4UgIx3WYA+XAVKKFzI6uUpGhHaXymedVI+z1SAi+cGi0AHR1XxzeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxtppHcy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxtppHcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712472725; x=1744008725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gx23YeP1txZpf8OI348FOmc+9cQA9r7+e/hBBgX4rN4=;
  b=CxtppHcy/Ui3PURLugi1MZG4S9ymAnKcd5iWK83OV2RGoGbwGq3M4JGx
   qoFAo5qhsa2d5JiChnILjP3miIBZ+fgbs9VYGQlbnrzQBeC1AzxDp1DLh
   nAeMoiskBcWWkt0C9Ozhx1Bhw2kBE/UZJCRSnic9NBIsAkuc/e/O1oavq
   19Mz/NQ7ELN3BD5o/uNNsHs8xzjhli1lLLGAx4UIFuyEuuXUYqr0N+Aan
   qSGrdPzoYmDOOVQHobxOYYFxWwBQMHlWaeSdwm5VOkdKA5rmWU7n5RiDi
   NSEy+/YEZQjMWp4KcO/cgTDhlUb6ZfwTmLJsGhO66uyGHd3u3RIzEhtjR
   g==;
X-CSE-ConnectionGUID: wjqo6CysQN+s5ePkDoPugg==
X-CSE-MsgGUID: z9lYtkrnTfKNZfl5J2PsiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7599983"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="7599983"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 23:52:04 -0700
X-CSE-ConnectionGUID: KC+hfgFLTPexh6p84Fxizw==
X-CSE-MsgGUID: qbPrCuhXQgCOfe4rb05VGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="19420996"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Apr 2024 23:52:03 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtMNk-0004C6-0r;
	Sun, 07 Apr 2024 06:52:00 +0000
Date: Sun, 7 Apr 2024 14:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 9/134] drivers/char/adi.c:79:66: warning:
 passing argument 2 of 'copy_to_iter_full' makes integer from pointer without
 a cast
Message-ID: <202404071400.1vOo6yJH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   d889b9c9cd608c45267cf168270c6dd8ca4880d9
commit: 4a4de9be42133e12131fa6574eb894f449c09a50 [9/134] char: convert drivers to use ->read_iter() and ->write_iter()
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20240407/202404071400.1vOo6yJH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404071400.1vOo6yJH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404071400.1vOo6yJH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   drivers/char/adi.c:62:22: note: in expansion of macro 'min_t'
      62 |         ver_buf_sz = min_t(size_t, count, MAX_BUF_SZ);
         |                      ^~~~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:36:53: note: in expansion of macro '__is_signed'
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
         |                                                     ^~~~~~~~~~~
   include/linux/minmax.h:41:17: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                 ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   drivers/char/adi.c:62:22: note: in expansion of macro 'min_t'
      62 |         ver_buf_sz = min_t(size_t, count, MAX_BUF_SZ);
         |                      ^~~~~
   include/linux/minmax.h:36:10: error: first argument to '__builtin_choose_expr' not a constant
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:41:17: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                 ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   drivers/char/adi.c:62:22: note: in expansion of macro 'min_t'
      62 |         ver_buf_sz = min_t(size_t, count, MAX_BUF_SZ);
         |                      ^~~~~
   include/linux/minmax.h:39:9: error: expression in static assertion is not an integer
      39 |         (__is_signed(x) == __is_signed(y) ||                    \
         |         ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   drivers/char/adi.c:62:22: note: in expansion of macro 'min_t'
      62 |         ver_buf_sz = min_t(size_t, count, MAX_BUF_SZ);
         |                      ^~~~~
   In file included from include/linux/kernel.h:28:
   include/linux/minmax.h:56:9: error: first argument to '__builtin_choose_expr' not a constant
      56 |         __builtin_choose_expr(__is_constexpr((x) - (y)),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:161:33: note: in expansion of macro '__careful_cmp'
     161 | #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
         |                                 ^~~~~~~~~~~~~
   drivers/char/adi.c:62:22: note: in expansion of macro 'min_t'
      62 |         ver_buf_sz = min_t(size_t, count, MAX_BUF_SZ);
         |                      ^~~~~
   drivers/char/adi.c:67:20: error: 'offp' undeclared (first use in this function)
      67 |         offset = (*offp) * adi_blksize();
         |                    ^~~~
   drivers/char/adi.c:79:48: error: 'buf' undeclared (first use in this function)
      79 |                         if (!copy_to_iter_full(buf + bytes_read, ver_buf,
         |                                                ^~~
>> drivers/char/adi.c:79:66: warning: passing argument 2 of 'copy_to_iter_full' makes integer from pointer without a cast [-Wint-conversion]
      79 |                         if (!copy_to_iter_full(buf + bytes_read, ver_buf,
         |                                                                  ^~~~~~~
         |                                                                  |
         |                                                                  u8 * {aka unsigned char *}
   In file included from include/linux/fs.h:48,
                    from include/linux/proc_fs.h:10,
                    from arch/sparc/include/asm/prom.h:18,
                    from include/linux/of.h:252,
                    from arch/sparc/include/asm/openprom.h:15,
                    from arch/sparc/include/asm/device.h:8,
                    from include/linux/device.h:34,
                    from include/linux/miscdevice.h:7,
                    from drivers/char/adi.c:8:
   include/linux/uio.h:201:49: note: expected 'size_t' {aka 'long unsigned int'} but argument is of type 'u8 *' {aka 'unsigned char *'}
     201 | bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
         |                                          ~~~~~~~^~~~~
>> drivers/char/adi.c:80:42: warning: passing argument 3 of 'copy_to_iter_full' makes pointer from integer without a cast [-Wint-conversion]
      80 |                                          ver_buf_sz)) {
         |                                          ^~~~~~~~~~
         |                                          |
         |                                          size_t {aka long unsigned int}
   include/linux/uio.h:201:73: note: expected 'struct iov_iter *' but argument is of type 'size_t' {aka 'long unsigned int'}
     201 | bool copy_to_iter_full(const void *addr, size_t bytes, struct iov_iter *i)
         |                                                        ~~~~~~~~~~~~~~~~~^
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:39:10: note: in expansion of macro '__is_signed'
      39 |         (__is_signed(x) == __is_signed(y) ||                    \
         |          ^~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/char/adi.c:88:38: note: in expansion of macro 'min'
      88 |                         ver_buf_sz = min(count - bytes_read,
         |                                      ^~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:40:17: note: in expansion of macro '__is_signed'
      40 |                 __is_signed((x) + 0) == __is_signed((y) + 0) || \
         |                 ^~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/char/adi.c:88:38: note: in expansion of macro 'min'
      88 |                         ver_buf_sz = min(count - bytes_read,
         |                                      ^~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:36:53: note: in expansion of macro '__is_signed'
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
         |                                                     ^~~~~~~~~~~
   include/linux/minmax.h:41:17: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                 ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/char/adi.c:88:38: note: in expansion of macro 'min'
      88 |                         ver_buf_sz = min(count - bytes_read,
         |                                      ^~~
   include/linux/minmax.h:36:10: error: first argument to '__builtin_choose_expr' not a constant
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
         |          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:41:17: note: in expansion of macro '__is_noneg_int'
      41 |                 __is_noneg_int(x) || __is_noneg_int(y))
         |                 ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~


vim +/copy_to_iter_full +79 drivers/char/adi.c

    53	
    54	static ssize_t adi_read(struct kiocb *iocb, struct iov_iter *to)
    55	{
    56		size_t ver_buf_sz, bytes_read = 0;
    57		int ver_buf_idx = 0;
    58		loff_t offset;
    59		u8 *ver_buf;
    60		ssize_t ret;
    61	
    62		ver_buf_sz = min_t(size_t, count, MAX_BUF_SZ);
    63		ver_buf = kmalloc(ver_buf_sz, GFP_KERNEL);
    64		if (!ver_buf)
    65			return -ENOMEM;
    66	
    67		offset = (*offp) * adi_blksize();
    68	
    69		while (bytes_read < count) {
    70			ret = read_mcd_tag(offset);
    71			if (ret < 0)
    72				goto out;
    73	
    74			ver_buf[ver_buf_idx] = (u8)ret;
    75			ver_buf_idx++;
    76			offset += adi_blksize();
    77	
    78			if (ver_buf_idx >= ver_buf_sz) {
  > 79				if (!copy_to_iter_full(buf + bytes_read, ver_buf,
  > 80						 ver_buf_sz)) {
    81					ret = -EFAULT;
    82					goto out;
    83				}
    84	
    85				bytes_read += ver_buf_sz;
    86				ver_buf_idx = 0;
    87	
    88				ver_buf_sz = min(count - bytes_read,
    89						 (size_t)MAX_BUF_SZ);
    90			}
    91		}
    92	
    93		iocb->ki_pos += bytes_read;
    94		ret = bytes_read;
    95	out:
    96		kfree(ver_buf);
    97		return ret;
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
