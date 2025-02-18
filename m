Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7EA9479
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739881760; cv=none; b=ITTuf5JxszSSH5OAhrOsCEaVISdboSQDHU4WroJoHzehRFy4GK85fx2Mp6NNDh+2m15JE7EKJgNdNTIkykKpbjNPFo9viVIe2MjQDZQBaHBvoANK2AzU+vaCxOlNG2hRn3YU5zB71lnazLcBOoZf4OSINADlZ9P2PENGRYpp/Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739881760; c=relaxed/simple;
	bh=kPmVEFrBX7xKXCqbiltWNkjdEd2q1FNMHn3cBqbVyJ8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gnx9yzETsKrJpOD8pUT7aLutsSDP91o2dRDIyQYjZI1UJMPKZYddO1ihew6p5uMIKrO/Kx+jobTk3qYdfbvkPRS18m3AWX3swSPG0S00O9wz0TeDfH0FZgK4KhPTVXJlSWMCFZIfup8X2MpVTX1q5+l/CdzSV2bkSp5a0ORMfYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsTeMF43; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsTeMF43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739881758; x=1771417758;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kPmVEFrBX7xKXCqbiltWNkjdEd2q1FNMHn3cBqbVyJ8=;
  b=DsTeMF43oyNK13FB1R5OUQ85Lku+1JhQDinYt/cfZh+HD5CkIsO6rjFB
   5aGvmXrLu6u22ECRYzed6qTn5sPN+r44faROOwFnC/XdGJc4wyJNTZERp
   nIHn9v1KmX+qDm6a3ckVLLgx0hdpAz/ZisavnASt3WRYxm2T1ztHvLcZX
   1b2dBXjB9wz3D5mXly0ShxiDSwXF1UqLGYjXRrzM9Iy6j/a0MusrDlurI
   mKe2iMpoBReibFbz3r0aGU1SbUKwqW4sDaQoyYi5z5r0VBq82s9E7qwtP
   CV2gResyzHxIuD9ENCNI6DP/UFWF3bm98XF7iBjgGURbgXlCqFsT52b1Y
   g==;
X-CSE-ConnectionGUID: N7c2QqqpQzikbxe+AAS0pA==
X-CSE-MsgGUID: 2qc9ccblSm67NOqqMd36Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40278217"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="40278217"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 04:29:17 -0800
X-CSE-ConnectionGUID: TD2CyzBWRv6OsaCL//P5cg==
X-CSE-MsgGUID: +ezbReRHRM+7nc6UUSWpOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="114305462"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Feb 2025 04:29:17 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkMil-0000Vf-2Q
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Feb 2025 12:29:09 +0000
Date: Tue, 18 Feb 2025 20:28:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/tty/vt/keyboard.c:2026: Error:
 unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
Message-ID: <202502182030.ZzoaAafP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 46ca3f735f345c9d87383dd3a09fa5d43870770e [1/1] tty/vt: fix write/write race in ioctl(KDSKBSENT) handler
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20250218/202502182030.ZzoaAafP-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502182030.ZzoaAafP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502182030.ZzoaAafP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/vt/keyboard.c: In function 'k_fn':
   drivers/tty/vt/keyboard.c:740:29: warning: comparison is always true due to limited range of data type [-Wtype-limits]
     740 |         if ((unsigned)value < ARRAY_SIZE(func_table)) {
         |                             ^
   In file included from drivers/tty/vt/keyboard.c:33:
   In function 'tty_insert_flip_char',
       inlined from 'puts_queue' at drivers/tty/vt/keyboard.c:315:3:
   include/linux/tty_flip.h:27:53: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      27 |                         *flag_buf_ptr(tb, tb->used) = flag;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   In file included from drivers/tty/vt/keyboard.c:32:
   include/linux/tty.h: In function 'puts_queue':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'puts_queue' at drivers/tty/vt/keyboard.c:315:3:
   include/linux/tty_flip.h:28:47: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      28 |                 *char_buf_ptr(tb, tb->used++) = ch;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tty.h: In function 'puts_queue':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'fn_send_intr' at drivers/tty/vt/keyboard.c:562:2:
   include/linux/tty_flip.h:27:53: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      27 |                         *flag_buf_ptr(tb, tb->used) = flag;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/tty.h: In function 'fn_send_intr':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'fn_send_intr' at drivers/tty/vt/keyboard.c:562:2:
   include/linux/tty_flip.h:28:47: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      28 |                 *char_buf_ptr(tb, tb->used++) = ch;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tty.h: In function 'fn_send_intr':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'put_queue' at drivers/tty/vt/keyboard.c:308:2:
   include/linux/tty_flip.h:27:53: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      27 |                         *flag_buf_ptr(tb, tb->used) = flag;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/tty.h: In function 'put_queue':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   In function 'tty_insert_flip_char',
       inlined from 'put_queue' at drivers/tty/vt/keyboard.c:308:2:
   include/linux/tty_flip.h:28:47: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
      28 |                 *char_buf_ptr(tb, tb->used++) = ch;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tty.h: In function 'put_queue':
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   drivers/tty/vt/keyboard.c: Assembler messages:
   drivers/tty/vt/keyboard.c:1723: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/tty/vt/keyboard.c:1723: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   drivers/tty/vt/keyboard.c:1761: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/tty/vt/keyboard.c:1761: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   drivers/tty/vt/keyboard.c:1705: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   drivers/tty/vt/keyboard.c:1705: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   drivers/tty/vt/keyboard.c:1678: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   drivers/tty/vt/keyboard.c:1678: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   drivers/tty/vt/keyboard.c:1867: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/tty/vt/keyboard.c:1867: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   drivers/tty/vt/keyboard.c:1908: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   drivers/tty/vt/keyboard.c:1908: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
>> drivers/tty/vt/keyboard.c:2026: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
>> drivers/tty/vt/keyboard.c:2026: Error: unrecognized opcode `csrc sstatus,a1', extension `zicsr' required
   drivers/tty/vt/keyboard.c:2030: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/tty/vt/keyboard.c:2030: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   drivers/tty/vt/keyboard.c:2133: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   drivers/tty/vt/keyboard.c:2133: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   drivers/tty/vt/keyboard.c:2151: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/tty/vt/keyboard.c:2151: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required


vim +2026 drivers/tty/vt/keyboard.c

079c9534a96da9 Alan Cox           2012-02-28  1986  
079c9534a96da9 Alan Cox           2012-02-28  1987  /* FIXME: This one needs untangling and locking */
079c9534a96da9 Alan Cox           2012-02-28  1988  int vt_do_kdgkb_ioctl(int cmd, struct kbsentry __user *user_kdgkb, int perm)
079c9534a96da9 Alan Cox           2012-02-28  1989  {
079c9534a96da9 Alan Cox           2012-02-28  1990  	struct kbsentry *kbs;
079c9534a96da9 Alan Cox           2012-02-28  1991  	char *p;
079c9534a96da9 Alan Cox           2012-02-28  1992  	u_char *q;
079c9534a96da9 Alan Cox           2012-02-28  1993  	u_char __user *up;
46ca3f735f345c Sergei Trofimovich 2019-03-10  1994  	int sz, fnw_sz;
079c9534a96da9 Alan Cox           2012-02-28  1995  	int delta;
079c9534a96da9 Alan Cox           2012-02-28  1996  	char *first_free, *fj, *fnw;
079c9534a96da9 Alan Cox           2012-02-28  1997  	int i, j, k;
079c9534a96da9 Alan Cox           2012-02-28  1998  	int ret;
46ca3f735f345c Sergei Trofimovich 2019-03-10  1999  	unsigned long flags;
079c9534a96da9 Alan Cox           2012-02-28  2000  
079c9534a96da9 Alan Cox           2012-02-28  2001  	if (!capable(CAP_SYS_TTY_CONFIG))
079c9534a96da9 Alan Cox           2012-02-28  2002  		perm = 0;
079c9534a96da9 Alan Cox           2012-02-28  2003  
079c9534a96da9 Alan Cox           2012-02-28  2004  	kbs = kmalloc(sizeof(*kbs), GFP_KERNEL);
079c9534a96da9 Alan Cox           2012-02-28  2005  	if (!kbs) {
079c9534a96da9 Alan Cox           2012-02-28  2006  		ret = -ENOMEM;
079c9534a96da9 Alan Cox           2012-02-28  2007  		goto reterr;
079c9534a96da9 Alan Cox           2012-02-28  2008  	}
079c9534a96da9 Alan Cox           2012-02-28  2009  
079c9534a96da9 Alan Cox           2012-02-28  2010  	/* we mostly copy too much here (512bytes), but who cares ;) */
079c9534a96da9 Alan Cox           2012-02-28  2011  	if (copy_from_user(kbs, user_kdgkb, sizeof(struct kbsentry))) {
079c9534a96da9 Alan Cox           2012-02-28  2012  		ret = -EFAULT;
079c9534a96da9 Alan Cox           2012-02-28  2013  		goto reterr;
079c9534a96da9 Alan Cox           2012-02-28  2014  	}
079c9534a96da9 Alan Cox           2012-02-28  2015  	kbs->kb_string[sizeof(kbs->kb_string)-1] = '\0';
079c9534a96da9 Alan Cox           2012-02-28  2016  	i = kbs->kb_func;
079c9534a96da9 Alan Cox           2012-02-28  2017  
079c9534a96da9 Alan Cox           2012-02-28  2018  	switch (cmd) {
079c9534a96da9 Alan Cox           2012-02-28  2019  	case KDGKBSENT:
079c9534a96da9 Alan Cox           2012-02-28  2020  		sz = sizeof(kbs->kb_string) - 1; /* sz should have been
079c9534a96da9 Alan Cox           2012-02-28  2021  						  a struct member */
079c9534a96da9 Alan Cox           2012-02-28  2022  		up = user_kdgkb->kb_string;
079c9534a96da9 Alan Cox           2012-02-28  2023  		p = func_table[i];
079c9534a96da9 Alan Cox           2012-02-28  2024  		if(p)
079c9534a96da9 Alan Cox           2012-02-28  2025  			for ( ; *p && sz; p++, sz--)
079c9534a96da9 Alan Cox           2012-02-28 @2026  				if (put_user(*p, up++)) {
079c9534a96da9 Alan Cox           2012-02-28  2027  					ret = -EFAULT;
079c9534a96da9 Alan Cox           2012-02-28  2028  					goto reterr;
079c9534a96da9 Alan Cox           2012-02-28  2029  				}
079c9534a96da9 Alan Cox           2012-02-28  2030  		if (put_user('\0', up)) {
079c9534a96da9 Alan Cox           2012-02-28  2031  			ret = -EFAULT;
079c9534a96da9 Alan Cox           2012-02-28  2032  			goto reterr;
079c9534a96da9 Alan Cox           2012-02-28  2033  		}
079c9534a96da9 Alan Cox           2012-02-28  2034  		kfree(kbs);
079c9534a96da9 Alan Cox           2012-02-28  2035  		return ((p && *p) ? -EOVERFLOW : 0);
079c9534a96da9 Alan Cox           2012-02-28  2036  	case KDSKBSENT:
079c9534a96da9 Alan Cox           2012-02-28  2037  		if (!perm) {
079c9534a96da9 Alan Cox           2012-02-28  2038  			ret = -EPERM;
079c9534a96da9 Alan Cox           2012-02-28  2039  			goto reterr;
079c9534a96da9 Alan Cox           2012-02-28  2040  		}
079c9534a96da9 Alan Cox           2012-02-28  2041  
46ca3f735f345c Sergei Trofimovich 2019-03-10  2042  		fnw = NULL;
46ca3f735f345c Sergei Trofimovich 2019-03-10  2043  		fnw_sz = 0;
46ca3f735f345c Sergei Trofimovich 2019-03-10  2044  		/* race aginst other writers */
46ca3f735f345c Sergei Trofimovich 2019-03-10  2045  		again:
46ca3f735f345c Sergei Trofimovich 2019-03-10  2046  		spin_lock_irqsave(&func_buf_lock, flags);
079c9534a96da9 Alan Cox           2012-02-28  2047  		q = func_table[i];
46ca3f735f345c Sergei Trofimovich 2019-03-10  2048  
46ca3f735f345c Sergei Trofimovich 2019-03-10  2049  		/* fj pointer to next entry after 'q' */
079c9534a96da9 Alan Cox           2012-02-28  2050  		first_free = funcbufptr + (funcbufsize - funcbufleft);
079c9534a96da9 Alan Cox           2012-02-28  2051  		for (j = i+1; j < MAX_NR_FUNC && !func_table[j]; j++)
079c9534a96da9 Alan Cox           2012-02-28  2052  			;
079c9534a96da9 Alan Cox           2012-02-28  2053  		if (j < MAX_NR_FUNC)
079c9534a96da9 Alan Cox           2012-02-28  2054  			fj = func_table[j];
079c9534a96da9 Alan Cox           2012-02-28  2055  		else
079c9534a96da9 Alan Cox           2012-02-28  2056  			fj = first_free;
46ca3f735f345c Sergei Trofimovich 2019-03-10  2057  		/* buffer usage increase by new entry */
079c9534a96da9 Alan Cox           2012-02-28  2058  		delta = (q ? -strlen(q) : 1) + strlen(kbs->kb_string);
46ca3f735f345c Sergei Trofimovich 2019-03-10  2059  
079c9534a96da9 Alan Cox           2012-02-28  2060  		if (delta <= funcbufleft) { 	/* it fits in current buf */
079c9534a96da9 Alan Cox           2012-02-28  2061  		    if (j < MAX_NR_FUNC) {
46ca3f735f345c Sergei Trofimovich 2019-03-10  2062  			/* make enough space for new entry at 'fj' */
079c9534a96da9 Alan Cox           2012-02-28  2063  			memmove(fj + delta, fj, first_free - fj);
079c9534a96da9 Alan Cox           2012-02-28  2064  			for (k = j; k < MAX_NR_FUNC; k++)
079c9534a96da9 Alan Cox           2012-02-28  2065  			    if (func_table[k])
079c9534a96da9 Alan Cox           2012-02-28  2066  				func_table[k] += delta;
079c9534a96da9 Alan Cox           2012-02-28  2067  		    }
079c9534a96da9 Alan Cox           2012-02-28  2068  		    if (!q)
079c9534a96da9 Alan Cox           2012-02-28  2069  		      func_table[i] = fj;
079c9534a96da9 Alan Cox           2012-02-28  2070  		    funcbufleft -= delta;
079c9534a96da9 Alan Cox           2012-02-28  2071  		} else {			/* allocate a larger buffer */
079c9534a96da9 Alan Cox           2012-02-28  2072  		    sz = 256;
079c9534a96da9 Alan Cox           2012-02-28  2073  		    while (sz < funcbufsize - funcbufleft + delta)
079c9534a96da9 Alan Cox           2012-02-28  2074  		      sz <<= 1;
46ca3f735f345c Sergei Trofimovich 2019-03-10  2075  		    if (fnw_sz != sz) {
46ca3f735f345c Sergei Trofimovich 2019-03-10  2076  		      spin_unlock_irqrestore(&func_buf_lock, flags);
46ca3f735f345c Sergei Trofimovich 2019-03-10  2077  		      kfree(fnw);
079c9534a96da9 Alan Cox           2012-02-28  2078  		      fnw = kmalloc(sz, GFP_KERNEL);
46ca3f735f345c Sergei Trofimovich 2019-03-10  2079  		      fnw_sz = sz;
079c9534a96da9 Alan Cox           2012-02-28  2080  		      if (!fnw) {
079c9534a96da9 Alan Cox           2012-02-28  2081  			ret = -ENOMEM;
079c9534a96da9 Alan Cox           2012-02-28  2082  			goto reterr;
079c9534a96da9 Alan Cox           2012-02-28  2083  		      }
46ca3f735f345c Sergei Trofimovich 2019-03-10  2084  		      goto again;
46ca3f735f345c Sergei Trofimovich 2019-03-10  2085  		    }
079c9534a96da9 Alan Cox           2012-02-28  2086  
079c9534a96da9 Alan Cox           2012-02-28  2087  		    if (!q)
079c9534a96da9 Alan Cox           2012-02-28  2088  		      func_table[i] = fj;
46ca3f735f345c Sergei Trofimovich 2019-03-10  2089  		    /* copy data before insertion point to new location */
079c9534a96da9 Alan Cox           2012-02-28  2090  		    if (fj > funcbufptr)
079c9534a96da9 Alan Cox           2012-02-28  2091  			memmove(fnw, funcbufptr, fj - funcbufptr);
079c9534a96da9 Alan Cox           2012-02-28  2092  		    for (k = 0; k < j; k++)
079c9534a96da9 Alan Cox           2012-02-28  2093  		      if (func_table[k])
079c9534a96da9 Alan Cox           2012-02-28  2094  			func_table[k] = fnw + (func_table[k] - funcbufptr);
079c9534a96da9 Alan Cox           2012-02-28  2095  
46ca3f735f345c Sergei Trofimovich 2019-03-10  2096  		    /* copy data after insertion point to new location */
079c9534a96da9 Alan Cox           2012-02-28  2097  		    if (first_free > fj) {
079c9534a96da9 Alan Cox           2012-02-28  2098  			memmove(fnw + (fj - funcbufptr) + delta, fj, first_free - fj);
079c9534a96da9 Alan Cox           2012-02-28  2099  			for (k = j; k < MAX_NR_FUNC; k++)
079c9534a96da9 Alan Cox           2012-02-28  2100  			  if (func_table[k])
079c9534a96da9 Alan Cox           2012-02-28  2101  			    func_table[k] = fnw + (func_table[k] - funcbufptr) + delta;
079c9534a96da9 Alan Cox           2012-02-28  2102  		    }
079c9534a96da9 Alan Cox           2012-02-28  2103  		    if (funcbufptr != func_buf)
079c9534a96da9 Alan Cox           2012-02-28  2104  		      kfree(funcbufptr);
079c9534a96da9 Alan Cox           2012-02-28  2105  		    funcbufptr = fnw;
079c9534a96da9 Alan Cox           2012-02-28  2106  		    funcbufleft = funcbufleft - delta + sz - funcbufsize;
079c9534a96da9 Alan Cox           2012-02-28  2107  		    funcbufsize = sz;
079c9534a96da9 Alan Cox           2012-02-28  2108  		}
46ca3f735f345c Sergei Trofimovich 2019-03-10  2109  		/* finally insert item itself */
079c9534a96da9 Alan Cox           2012-02-28  2110  		strcpy(func_table[i], kbs->kb_string);
46ca3f735f345c Sergei Trofimovich 2019-03-10  2111  		spin_unlock_irqrestore(&func_buf_lock, flags);
079c9534a96da9 Alan Cox           2012-02-28  2112  		break;
079c9534a96da9 Alan Cox           2012-02-28  2113  	}
079c9534a96da9 Alan Cox           2012-02-28  2114  	ret = 0;
079c9534a96da9 Alan Cox           2012-02-28  2115  reterr:
079c9534a96da9 Alan Cox           2012-02-28  2116  	kfree(kbs);
079c9534a96da9 Alan Cox           2012-02-28  2117  	return ret;
079c9534a96da9 Alan Cox           2012-02-28  2118  }
079c9534a96da9 Alan Cox           2012-02-28  2119  

:::::: The code at line 2026 was first introduced by commit
:::::: 079c9534a96da9a85a2a2f9715851050fbfbf749 vt:tackle kbd_table

:::::: TO: Alan Cox <alan@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
