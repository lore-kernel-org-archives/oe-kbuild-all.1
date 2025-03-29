Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EB7487BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 07:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743234600; cv=none; b=fNseAJtNonEm74zNjTjarKemMaGziNHI+Dxy9Wo2ruBsQWaaNwvZRBYhwahqTKXsJGJ9mrWOsj6Kei0kjX8OvCbIc6rXHsZKmKGAC2RAIUB4FEBJoSEdQylQ6BSudmxIo9t7Kp48iSWm6Epa+omAbzvM8IlQibUmHtT5TUeNPp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743234600; c=relaxed/simple;
	bh=5WN8X7xWgbe7qSm7AyCqW1utPaoC0gSt/nhnD//RQuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5ZmZcBnx8vVhY+zmrO5z0KDYd5guMqeDiy5ZyszJ5Oe64bIuWHe5057eBi+BfQ34zhTGqT6cFARvEVBANXJLI84NtOpcCX9v3RUbLDETtTHBnATaNhCPjd08dAiLKZseUOFzHcW9mLOHQwvRpL/CcFb4+oJP3ddsrQ9sbLxPZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkuJ7Crt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkuJ7Crt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743234598; x=1774770598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5WN8X7xWgbe7qSm7AyCqW1utPaoC0gSt/nhnD//RQuI=;
  b=GkuJ7CrtWMc2xvwnNVRN7AZX7cANkvoELMVLx1CkHpLjTrcrL7Nab5Dt
   IYdKB3+cjDM4/jnxmBmdujJQiSTvHP59UW6n3UnP3Pe4v7v7t6cCS/6i6
   EYprjpzMz8iI9z0Q+2sYQomRvUk7PnV5C+WoGTQhFGKVpAub2kSHlESxy
   ciC7XtTk/Kcyx/wDpOMbiWdnr6/d0KfvBMDuHi3bFDNQ3cXGmRtsYf4jJ
   F+EY0UTnV1uh0TAx2kPlaOn+x2SiVuX6APyVaaMW/iBNwzLwVX/4QUyCY
   33qbi5kyApSUswfaoEvSqPBFwoCd3vDpqRqXEjypqX6TIWrY5Gd4MUbqN
   A==;
X-CSE-ConnectionGUID: hW33xXg+TDihNvTVOTz+Wg==
X-CSE-MsgGUID: BBNxaHslQYaPBrjeR+X6HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44697700"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="44697700"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 00:49:57 -0700
X-CSE-ConnectionGUID: fphi3/bsR1KEJrN2j4wc6g==
X-CSE-MsgGUID: TvZ2OIYgSDGaFasr96GvZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="130682222"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Mar 2025 00:49:55 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyQwy-0007yk-0z;
	Sat, 29 Mar 2025 07:49:52 +0000
Date: Sat, 29 Mar 2025 15:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [akpm-mm:mm-nonmm-unstable 37/41]
 include/linux/compiler_types.h:477:20: error: impossible constraint in 'asm'
Message-ID: <202503291506.fxx4Y4ph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   723de4b865eafb9f51762abeb52483a8eaab4936
commit: b616bb008779066274d14cd7eaa1b369f200db0f [37/41] s390: add support for suppressing warning backtraces
config: s390-randconfig-001-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291506.fxx4Y4ph-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291506.fxx4Y4ph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291506.fxx4Y4ph-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/scsi/aacraid/commsup.c: In function 'aac_fib_send':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   drivers/scsi/aacraid/commsup.c:691:3: note: in expansion of macro 'BUG_ON'
      BUG_ON(fibptr->done == 0);
      ^~~~~~
>> include/linux/compiler_types.h:477:20: error: impossible constraint in 'asm'
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   drivers/scsi/aacraid/commsup.c:691:3: note: in expansion of macro 'BUG_ON'
      BUG_ON(fibptr->done == 0);
      ^~~~~~
   drivers/scsi/aacraid/commsup.c: In function 'aac_hba_send':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:111:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:71:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   drivers/scsi/aacraid/commsup.c:778:3: note: in expansion of macro 'WARN_ON'
      WARN_ON(fibptr->done == 0);
      ^~~~~~~
   drivers/scsi/aacraid/commsup.c: In function 'aac_consumer_free':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   drivers/scsi/aacraid/commsup.c:855:4: note: in expansion of macro 'BUG'
       BUG();
       ^~~
   drivers/scsi/aacraid/commsup.c: In function 'aac_fib_adapter_complete':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   drivers/scsi/aacraid/commsup.c:931:3: note: in expansion of macro 'BUG'
      BUG();
      ^~~
   drivers/scsi/aacraid/commsup.c: In function 'aac_fib_complete':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   drivers/scsi/aacraid/commsup.c:989:3: note: in expansion of macro 'BUG'
      BUG();
      ^~~
--
   In file included from <command-line>:
   drivers/scsi/aacraid/aachba.c: In function 'aac_write_block':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   drivers/scsi/aacraid/aachba.c:1478:2: note: in expansion of macro 'BUG_ON'
     BUG_ON (fibsize > (fib->dev->max_fib_size -
     ^~~~~~
>> include/linux/compiler_types.h:477:20: error: impossible constraint in 'asm'
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   drivers/scsi/aacraid/aachba.c:1478:2: note: in expansion of macro 'BUG_ON'
     BUG_ON (fibsize > (fib->dev->max_fib_size -
     ^~~~~~
   drivers/scsi/aacraid/aachba.c: In function 'aac_read_block':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   drivers/scsi/aacraid/aachba.c:1342:2: note: in expansion of macro 'BUG_ON'
     BUG_ON (fibsize > (fib->dev->max_fib_size -
     ^~~~~~
   drivers/scsi/aacraid/aachba.c: In function 'aac_scsi_32':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   drivers/scsi/aacraid/aachba.c:1629:2: note: in expansion of macro 'BUG_ON'
     BUG_ON (fibsize > (fib->dev->max_fib_size -
     ^~~~~~
   drivers/scsi/aacraid/aachba.c: In function 'aac_write_block64':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   drivers/scsi/aacraid/aachba.c:1441:2: note: in expansion of macro 'BUG_ON'
     BUG_ON (fibsize > (fib->dev->max_fib_size -
     ^~~~~~
   drivers/scsi/aacraid/aachba.c: In function 'aac_read_block64':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   drivers/scsi/aacraid/aachba.c:1307:2: note: in expansion of macro 'BUG_ON'
     BUG_ON (fibsize > (fib->dev->max_fib_size -
     ^~~~~~
   drivers/scsi/aacraid/aachba.c: In function 'aac_scsi_64':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   drivers/scsi/aacraid/aachba.c:1598:2: note: in expansion of macro 'BUG_ON'
     BUG_ON (fibsize > (fib->dev->max_fib_size -
     ^~~~~~
   drivers/scsi/aacraid/aachba.c: In function 'aac_build_sgraw2':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
--
   In file included from <command-line>:
   drivers/scsi/aacraid/rx.c: In function 'aac_rx_notify_adapter':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   drivers/scsi/aacraid/rx.c:300:3: note: in expansion of macro 'BUG'
      BUG();
      ^~~
>> include/linux/compiler_types.h:477:20: error: impossible constraint in 'asm'
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   drivers/scsi/aacraid/rx.c:300:3: note: in expansion of macro 'BUG'
      BUG();
      ^~~
--
   In file included from <command-line>:
   drivers/scsi/aacraid/sa.c: In function 'aac_sa_notify_adapter':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   drivers/scsi/aacraid/sa.c:127:3: note: in expansion of macro 'BUG'
      BUG();
      ^~~
>> include/linux/compiler_types.h:477:20: error: impossible constraint in 'asm'
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   drivers/scsi/aacraid/sa.c:127:3: note: in expansion of macro 'BUG'
      BUG();
      ^~~
--
   In file included from <command-line>:
   drivers/scsi/aacraid/dpcsup.c: In function 'aac_aif_callback':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   drivers/scsi/aacraid/dpcsup.c:235:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(fibptr == NULL);
     ^~~~~~
>> include/linux/compiler_types.h:477:20: error: impossible constraint in 'asm'
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   include/asm-generic/bug.h:78:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   drivers/scsi/aacraid/dpcsup.c:235:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(fibptr == NULL);
     ^~~~~~
--
   In file included from <command-line>:
   drivers/scsi/aacraid/src.c: In function 'aac_src_deliver_message':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:111:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:71:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   drivers/scsi/aacraid/src.c:577:4: note: in expansion of macro 'WARN_ON'
       WARN_ON(upper_32_bits(address) != 0L);
       ^~~~~~~
>> include/linux/compiler_types.h:477:20: error: impossible constraint in 'asm'
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:61:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(BUGFLAG_WARNING|(flags));  \
     ^~~~~~~~~~
   include/asm-generic/bug.h:111:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:71:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   drivers/scsi/aacraid/src.c:577:4: note: in expansion of macro 'WARN_ON'
       WARN_ON(upper_32_bits(address) != 0L);
       ^~~~~~~
   drivers/scsi/aacraid/src.c: In function 'aac_src_notify_adapter':
   include/linux/compiler_types.h:477:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:21:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:56:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(0);     \
     ^~~~~~~~~~
   drivers/scsi/aacraid/src.c:380:3: note: in expansion of macro 'BUG'
      BUG();
      ^~~
..


vim +/asm +477 include/linux/compiler_types.h

dbaaabd60e1662d Linus Torvalds   2024-04-08  475  
eb111869301e15b Rasmus Villemoes 2019-09-13  476  #ifdef CONFIG_CC_HAS_ASM_INLINE
eb111869301e15b Rasmus Villemoes 2019-09-13 @477  #define asm_inline asm __inline
eb111869301e15b Rasmus Villemoes 2019-09-13  478  #else
eb111869301e15b Rasmus Villemoes 2019-09-13  479  #define asm_inline asm
eb111869301e15b Rasmus Villemoes 2019-09-13  480  #endif
eb111869301e15b Rasmus Villemoes 2019-09-13  481  

:::::: The code at line 477 was first introduced by commit
:::::: eb111869301e15b737315a46c913ae82bd19eb9d compiler-types.h: add asm_inline definition

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
