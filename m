Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CAD1DE899
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741638006; cv=none; b=UTo2/u+7BNXzhNxl+G2RIIuUoWv9YDF3/LSL3p+MW08/jSXKQ9u8Hb4Q/mvHuVglXo5vAAosK6k+ji4JME6FgoW5i4RajxLnxlkLS8LwYosSwa/GcdMa4VaB0LJaklO/GbTp/HS6JNbc4ddWVX2bxMo8cp+GAsIN2wkF0IZFlfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741638006; c=relaxed/simple;
	bh=NXpQsRprDiJ5DrNL2pc8Kpoiow0SMdmdczFp+xdRzJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqxUvchSBMBNvrL2RE0Fy+Fu4f9juQTeSR0biKLYIIQdLoy3YMuOp5KHlvjHTCkt/VclsYB1lneqYGiMTlhDy11TTMXhWhwsZ2ohoAX1WaWMNkPSO01xjsLt42ugHhkN4nYIOKVPYuV2T4FKPaQuNnmRHyKmpL5JbHeF3WmuFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0eFOk3j; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0eFOk3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741638004; x=1773174004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NXpQsRprDiJ5DrNL2pc8Kpoiow0SMdmdczFp+xdRzJw=;
  b=D0eFOk3jl4uL4+46U9bYe6U26+iUkdt0O1I3li83CuyUBBPY+XyUgbYQ
   6f42+t+Y0uv6jGK7mUs7vJhUV54B5RSQliMEAKRqWifQZgW6bf9Y8q5Xa
   5hKn65qxCfq0i1Gq5f22oGQdgW+Wm+SOWZfsfj+lKoIkYx4gx5XFJsPpe
   T5kFjS86wl587abJDJxdtoo5mbTkolPiMx/h4jAUWkcD8EKLMDCCjArUc
   8FJafpd7ZdgmdP7rPOReeNWLeJ7LZ1YUMs+BectGD3ZDD1MNuZCn2xknr
   i/ZJkwGMhaZQIlq0fMnsmbaC1Vz5O3ZcQqZzlp/t9BR+R9TUeczh6NUYh
   A==;
X-CSE-ConnectionGUID: 8ZKA8M0ySh+xdWJnXikJng==
X-CSE-MsgGUID: qedfL4jJS+6Xo1Ug0ZH/mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46563650"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="46563650"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 13:20:03 -0700
X-CSE-ConnectionGUID: dbkUusI3QsWTda9P+0UGcA==
X-CSE-MsgGUID: SYvhz1UIT9iC2cHqmNc0cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="120574945"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 10 Mar 2025 13:20:03 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trjbU-00063Y-0Z;
	Mon, 10 Mar 2025 20:20:00 +0000
Date: Tue, 11 Mar 2025 04:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-next 22/24] include/linux/kern_levels.h:5:25:
 warning: format '%zx' expects argument of type 'size_t', but argument 2 has
 type 'long unsigned int'
Message-ID: <202503110412.B068KETJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-next
head:   d7f39f641ff8fc788bdea0f91c5ef47501a35f43
commit: 058c7735cc6847229a73d7d3fee04fc1f3522ea9 [22/24] afs: Use rxgk RESPONSE to pass token for callback channel
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250311/202503110412.B068KETJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110412.B068KETJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110412.B068KETJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from fs/afs/cm_security.c:8:
   fs/afs/cm_security.c: In function 'afs_create_yfs_cm_token':
>> include/linux/kern_levels.h:5:25: warning: format '%zx' expects argument of type 'size_t', but argument 2 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:544:9: note: in expansion of macro 'printk'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:544:16: note: in expansion of macro 'KERN_ERR'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   fs/afs/cm_security.c:314:17: note: in expansion of macro 'pr_err'
     314 |                 pr_err("Appdata size incorrect %zx != %zx\n",
         |                 ^~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
