Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E81223DC1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 07:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760167049; cv=none; b=L63CJsEGM8Wi240YPQNJ4Nj7HPQyMQy0ANKtbf/ttrQYYXl1dUwXIuO0ZCkP/eBm+ekF66oX4Ju+lX7Ayz467LlGU6+DNy9o+zivhdm382UtYP+LipUOTv7hvFGAk5Yt/Q0X60awp2DNsJx1EHww4VGgXG2NFSCyztP7mHaaOSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760167049; c=relaxed/simple;
	bh=OJsuk7Bq1tiucDj3zwoxiPKlQflQ5d0J6elh6MQlxhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OG0xndwNawVUnWQG977SJPb8XarFZ5dUSAZVHIU+zUinZ0G9U7FqatE+SbEdDvFx007ccOgabRNPn+NSUSlPkDOGRsCASaOy5ylbZ3VvXMSXmecCpu6EctKmYObhYGaIHBalUpLtliNzgzbcdXjREtW2mDEYWnfhl4cSna8sluE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdRlMAmP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdRlMAmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760167048; x=1791703048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OJsuk7Bq1tiucDj3zwoxiPKlQflQ5d0J6elh6MQlxhc=;
  b=NdRlMAmPmq9El9Qi7dGg3HrCwsBVAOW1mvknKLZL14XMI1HlvCl0rDHc
   9kdWpWgXLswzfm51eW2WaSQWIxU2Psm/2oT+BiUTqwxnW68jsgEw6JAF/
   yiF6yP+5iACYr5v8ff/vCAvaoAJlcq01j05i1UsHkiTmGMRaSVk5bvWcx
   YcjkV65v6SI4ndc07dXknHMxWOnG//y2Q7H7Jv43UmFireJqOsomqMNbv
   b2gDCCDYr8/wefq24A+JOaRN5GWwKzzvZ2GmDSKsXM33rv3sZnD2I9DD9
   ZoWsxBsR2ybuikE4XL4K6bIrkMKkf2AgM8/ZLLqSZ1xO5a9lXsVBOECpB
   Q==;
X-CSE-ConnectionGUID: q6n5Sy+ySrqZZwYhzrt5fA==
X-CSE-MsgGUID: nU39GgI7TNe2Am4gyofeBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="49935321"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="49935321"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 00:17:27 -0700
X-CSE-ConnectionGUID: UDmvaDYLSZusfV1OpIW/1Q==
X-CSE-MsgGUID: azUneQ5xSlaw/aMarZHt8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="218255521"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Oct 2025 00:17:26 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Tr1-0003bL-1h;
	Sat, 11 Oct 2025 07:17:23 +0000
Date: Sat, 11 Oct 2025 15:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/next-20250929/sockaddr-removal-min 11/11]
 net/packet/af_packet.c:3287:30: error: 'struct sockaddr' has no member named
 'sa_data_min'; did you mean 'sa_data'?
Message-ID: <202510111528.2yzNaiLr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/next-20250929/sockaddr-removal-min
head:   890ccb746e6ede1b2a805c027cf4168b4f52c734
commit: 890ccb746e6ede1b2a805c027cf4168b4f52c734 [11/11] net: Convert struct sockaddr to fixed-size "sa_data[14]"
config: i386-buildonly-randconfig-001-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111528.2yzNaiLr-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111528.2yzNaiLr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111528.2yzNaiLr-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/packet/af_packet.c: In function 'packet_bind_spkt':
>> net/packet/af_packet.c:3287:30: error: 'struct sockaddr' has no member named 'sa_data_min'; did you mean 'sa_data'?
    3287 |         char name[sizeof(sa->sa_data_min) + 1];
         |                              ^~~~~~~~~~~
         |                              sa_data
   In file included from include/linux/string.h:382,
                    from include/linux/bitmap.h:13,
                    from include/linux/ethtool.h:16,
                    from net/packet/af_packet.c:51:
   net/packet/af_packet.c:3298:46: error: 'struct sockaddr' has no member named 'sa_data_min'; did you mean 'sa_data'?
    3298 |         memcpy(name, sa->sa_data, sizeof(sa->sa_data_min));
         |                                              ^~~~~~~~~~~
   include/linux/fortify-string.h:627:48: note: in definition of macro '__fortify_memcpy_chk'
     627 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   net/packet/af_packet.c:3298:9: note: in expansion of macro 'memcpy'
    3298 |         memcpy(name, sa->sa_data, sizeof(sa->sa_data_min));
         |         ^~~~~~
   net/packet/af_packet.c:3299:25: error: 'struct sockaddr' has no member named 'sa_data_min'; did you mean 'sa_data'?
    3299 |         name[sizeof(sa->sa_data_min)] = 0;
         |                         ^~~~~~~~~~~
         |                         sa_data
   net/packet/af_packet.c:3287:14: warning: unused variable 'name' [-Wunused-variable]
    3287 |         char name[sizeof(sa->sa_data_min) + 1];
         |              ^~~~
   net/packet/af_packet.c:3302:1: warning: control reaches end of non-void function [-Wreturn-type]
    3302 | }
         | ^


vim +3287 net/packet/af_packet.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  3277  
^1da177e4c3f41 Linus Torvalds      2005-04-16  3278  /*
^1da177e4c3f41 Linus Torvalds      2005-04-16  3279   *	Bind a packet socket to a device
^1da177e4c3f41 Linus Torvalds      2005-04-16  3280   */
^1da177e4c3f41 Linus Torvalds      2005-04-16  3281  
e934673e634f20 Kees Cook           2025-07-17  3282  static int packet_bind_spkt(struct socket *sock, struct sockaddr_unspec *uaddr,
40d4e3dfc2f56a Eric Dumazet        2009-07-21  3283  			    int addr_len)
^1da177e4c3f41 Linus Torvalds      2005-04-16  3284  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  3285  	struct sock *sk = sock->sk;
e934673e634f20 Kees Cook           2025-07-17  3286  	struct sockaddr *sa = (struct sockaddr *)uaddr;
e934673e634f20 Kees Cook           2025-07-17 @3287  	char name[sizeof(sa->sa_data_min) + 1];
^1da177e4c3f41 Linus Torvalds      2005-04-16  3288  
^1da177e4c3f41 Linus Torvalds      2005-04-16  3289  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  3290  	 *	Check legality
^1da177e4c3f41 Linus Torvalds      2005-04-16  3291  	 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  3292  
^1da177e4c3f41 Linus Torvalds      2005-04-16  3293  	if (addr_len != sizeof(struct sockaddr))
^1da177e4c3f41 Linus Torvalds      2005-04-16  3294  		return -EINVAL;
540e2894f79055 Alexander Potapenko 2017-03-01  3295  	/* uaddr->sa_data comes from the userspace, it's not guaranteed to be
540e2894f79055 Alexander Potapenko 2017-03-01  3296  	 * zero-terminated.
540e2894f79055 Alexander Potapenko 2017-03-01  3297  	 */
e934673e634f20 Kees Cook           2025-07-17  3298  	memcpy(name, sa->sa_data, sizeof(sa->sa_data_min));
e934673e634f20 Kees Cook           2025-07-17  3299  	name[sizeof(sa->sa_data_min)] = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  3300  
6ffc57ea004234 Eric Dumazet        2023-05-26  3301  	return packet_do_bind(sk, name, 0, 0);
^1da177e4c3f41 Linus Torvalds      2005-04-16  3302  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  3303  

:::::: The code at line 3287 was first introduced by commit
:::::: e934673e634f2034bdfd11c5d3e7370ba0dd0427 net: Convert proto_ops bind() callbacks to use sockaddr_unspec

:::::: TO: Kees Cook <kees@kernel.org>
:::::: CC: Kees Cook <kees@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
