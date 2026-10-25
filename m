Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792945460;
	b=1zMm6Fhe2HqUSnEwqoM/yD1x352WjOiixGkcKENwtf88MKvrDQ1R7+OUIoNyUzn+OZiF
	 41lOW6CMe/Pyy5DNLLlel4/5hE2DcZK1HdBiW7jzmjthfs+qwwf/5wLq+joyj7urbPNZx
	 e9isRFPAYprcgWqymNctRP0zXE3I9wzmV3GZXce10ahnfxdHBWkNDRISMHuqYmpOv/jj6
	 Y/p+ngRK2Hh1pLKTbaSpXYS02kdgvV0qi+dZlRphtoKuFthZzoprqKbJwHAmlwfDG4BQ+
	 Wn4HncsJojvhpcr9h41pJsbUdJA9UD7WvHZvwK0DL/yyIPif7gIhloDP3bxe6YSeS9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792945460;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NoR+/CvcZ9i46T/eDvSe3uiPv3h2+weMhnsha+QIBGg=;
	b=2DieZM0hlv3pUfUucs2qwUYF3XcGRPPD6/zJinoQAtr4J53zrf0iuAVQ6ii33bqYs3Og
	 qoP4FtCyt+8BdDC+OEsDvWKSC83P5k9D590TkXnLlpANGZbGSuyjc/MFTiwm6gDQdC1VH
	 Ny9Eubj65GnvlfEpGo2ukaFu2hmP5EIRD6iLB4WOKcxptyTP5jrFkB5gJ9oXhGTKGNmin
	 uBvW6PAK7BUoCVRjWgoK9moOpeLYusBVHacolWK2Y7wCOdxatWf4VhJ+J5AgJoI5Zi4nZ
	 F4xZUweEkxfZkS6ZSQIECvNx9CxFHF5AUqoaIp0H8XfBibAQUpCRrccg8GhUE5DL4aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TevNKOMs;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6E8606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 16:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA6E8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TevNKOMs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792945459; x=1824481459;
  h=date:from:to:cc:subject:message-id;
  bh=evJfdLCbUxQLeFGIosdB4VtHss3xkljWuC1sBKxAPS0=;
  b=TevNKOMs3MeNd7ia5nHExS2l6qwHLs1maH1hYhp6PaRy8dGOUm4+wNZM
   995Y/PBkPE6xa91sNM+bNwwZK7kJQrbuis1F3etdq6yQidise69wq9y1G
   R0xgYoVVt1DeFFMpKls7aEQ5M4wGmVulc8998+jImPc4rHx+raDwPu1Sw
   3yWree0IqEQZdDRiizWTT643P6dD/V7WcfIXbBOV5BI1t1vWPO4HeEglc
   Cct5aBqivn3feHRdm5uignBk9NrPyHUzN2XnZPUjuqK9pR1Gfoba/94N9
   Td8sys6W+S63YK72D/TD+nbFgBWEG7yDH1A+Y/1m8XZl0nrO/7J/JTmaH
   g==;
X-CSE-ConnectionGUID: 2HbklC7iRD+rQlqwBEX76g==
X-CSE-MsgGUID: I7ksZWr1TXifeY6BAl3tpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1504381"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1504381"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 09:24:18 -0700
X-CSE-ConnectionGUID: uzjzuXjuTWGJf4toPtf7mA==
X-CSE-MsgGUID: V+S/Zn/GRYW+opMV1U7uqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4196681"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 25 Oct 2026 09:24:17 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL113-000000003lB-4ApR;
	Sun, 25 Oct 2026 16:24:13 +0000
Date: Sun, 25 Oct 2026 17:23:58 +0100
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linkinjeon-smb:ksmbd-for-next 55/96]
 include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_1021' declared with attribute error: clamp() low limit
 msecs_to_jiffies(1200) greater than high limit 6 * 1024
Message-ID: <202610251743.jztr17Ib-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git ksmbd-for-next
head:   ed0063dd214dce027717f64817c594cc1b2e1d41
commit: c0632d2010ffc006eed9becc8d0d10d54f294bbd [55/96] ksmbd: track delivery of queued TCP writes
config: mips-randconfig-r2105-20261025 (https://download.01.org/0day-ci/archive/20261025/202610251743.jztr17Ib-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251743.jztr17Ib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251743.jztr17Ib-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/smb/server/transport_tcp.c: In function 'ksmbd_tcp_writev':
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_1021' declared with attribute error: clamp() low limit msecs_to_jiffies(1200) greater than high limit 6 * 1024
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
     683 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     702 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:188:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     188 |  BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
         |  ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:195:2: note: in expansion of macro '__clamp_once'
     195 |  __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
         |  ^~~~~~~~~~~~
   include/linux/minmax.h:218:36: note: in expansion of macro '__careful_clamp'
     218 | #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
         |                                    ^~~~~~~~~~~~~~~
   fs/smb/server/transport_tcp.c:699:4: note: in expansion of macro 'clamp_t'
     699 |    clamp_t(unsigned long, 6UL * inet_csk(sk)->icsk_rto,
         |    ^~~~~~~


vim +/__compiletime_assert_1021 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
