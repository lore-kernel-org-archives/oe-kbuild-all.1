Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694446;
	b=ukWyV3eTp/z6aEPWArnXKzxg10gLzckqTCdd3DQOuBNHxaUEJcML5e3NT6RxpJgtsUHi
	 3X5xUS+nWcQkF3M5Fw9KX046zuoWAC3gTfXnkveL5BffmIRAX18Gs7i0ZDeHy32/Yk8y2
	 jctM5tl63uCF0sBjlab0Pbao02M1Sg0PCkQqvTd6SrEE+hMrCf5GShefj3NgkMZ2fZ9LT
	 +53aFwmesJewhZJ/lqdqubplB1bSUrgXyGVcihZFaxENjU9bEcN6fnrLZUo5fqt6zVNsB
	 xwu+M9Ki8G+NmJxpdedpL9mD28gxpRujJ5kvvyMEq+DN5QO8ieFaJMC1fZbXVfqiGkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694446;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=T+fMHLl4wSE8azWbJspoX6QkSZKQTjbD+do4pEYnVQg=;
	b=obYkd2rpvgE4SbcarvzIpuF4S8KGBGshTn4b7PTgmxiCEVac2fPBmwGbnukoorJZ6nmj
	 y3zZ+Yy67Be7IMIK14ZJ2oPLvt4GhSXVbnfM43XtY/ixnRClAxgoNT9Kpgl0mDH0AUvBC
	 Qh/l25SlJgweapFwelQLartC6bUZfo1qszE7VaG+m7mb4VyijegibwXHi2jE95rt+Cn8p
	 0BrJyfYO6N1KLUYy5Eua51lj+b37FI85pJnj/BwbE7SO0kzRjqTHsumNIXcE53fkw9AsW
	 dMVX1FJSFiuXdQToS0KuYAj+GmdYyYFYQ8+Rc0503/rvLksY93sMl4C3QoVQEzJnxMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RJwAdIpE;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B0A606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 18:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B0A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RJwAdIpE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792694445; x=1824230445;
  h=date:from:to:cc:subject:message-id;
  bh=QRktH0dMSH1cpxuHej6asT1TRzNAbEAW1lJxw1acebg=;
  b=RJwAdIpEwbvjitJftIvMQ7+k5d5G3NzSAOh3oqLY+Spx0J0yVv4Vqu1Y
   2ycJQjsuWPh6jjC75zueAoiJwZsmy3+G/6Il5fa7l93guGG0aIadXNzcC
   4UBcgiWae4rLVF8zpsyIrMR/gUBEZ4IZT6tbo0Qeocp3lAgFIf2nk3sRB
   dFSoq8AEAupzQaXLlrswXUtunaHkhySs20nyihUptC8vPKMAO1NEL6AUf
   AsGJvVelsfGmyERThdJ8bpy+duiD5rHMVjKjWohhL6l0Lr/wlKBJD0LVl
   4mkpYix+XMATTEZ6X6X4mJQuXgbSD88aaCxPRe3unx7qNzSQhHS5v970y
   Q==;
X-CSE-ConnectionGUID: CjMD+lXyQc+9ketkUnXXPw==
X-CSE-MsgGUID: OcI9q1mHQM+7+seg233q0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1344814"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1344814"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 11:40:44 -0700
X-CSE-ConnectionGUID: z/SxfJIdRmqs7lsEsrj7SQ==
X-CSE-MsgGUID: ECYGng8STBCFLipPTOd/Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3789165"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Oct 2026 11:40:44 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJxiS-00000000RUs-3yqN;
	Thu, 22 Oct 2026 18:40:40 +0000
Date: Fri, 23 Oct 2026 02:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 44/142]
 include/linux/bpf_unwind.h:260:58: warning: cast from pointer to integer of
 different size
Message-ID: <202610230228.Ibo7Qphi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux fermata
head:   4c57b609dbdca47f72c7bb3e97eb46046545dfeb
commit: 48e7cd30b23f144e3e1cda3efb64d9cf22e8614c [44/142] bpf: Let the callback of bpf_loop unwind
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20261023/202610230228.Ibo7Qphi-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610230228.Ibo7Qphi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230228.Ibo7Qphi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/bpf_iter.c:8:
   kernel/bpf/bpf_iter.c: In function '____bpf_loop':
>> include/linux/bpf_unwind.h:260:58: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     260 |         (r0) = ((bpf_callback_t)(void *)(fn))((u64)(a1), (u64)(a2), (u64)(a3),  \
         |                                                          ^
   include/linux/bpf_unwind.h:276:9: note: in expansion of macro '__bpf_call_cb'
     276 |         __bpf_call_cb(__bpf_callback_fn, fn, a1, a2, a3, a4, a5, r0, unwound)
         |         ^~~~~~~~~~~~~
   kernel/bpf/bpf_iter.c:770:17: note: in expansion of macro 'bpf_call_cb'
     770 |                 bpf_call_cb(callback, i, callback_ctx, 0, 0, 0, ret, unwound);
         |                 ^~~~~~~~~~~


vim +260 include/linux/bpf_unwind.h

e56c95f1864ca19 Kumar Kartikeya Dwivedi 2026-10-20  257  
e56c95f1864ca19 Kumar Kartikeya Dwivedi 2026-10-20  258  #define __bpf_call_cb(type, fn, a1, a2, a3, a4, a5, r0, unwound)		\
e56c95f1864ca19 Kumar Kartikeya Dwivedi 2026-10-20  259  do {										\
e56c95f1864ca19 Kumar Kartikeya Dwivedi 2026-10-20 @260  	(r0) = ((bpf_callback_t)(void *)(fn))((u64)(a1), (u64)(a2), (u64)(a3),	\
e56c95f1864ca19 Kumar Kartikeya Dwivedi 2026-10-20  261  					      (u64)(a4), (u64)(a5));		\
e56c95f1864ca19 Kumar Kartikeya Dwivedi 2026-10-20  262  	if (0)									\
e56c95f1864ca19 Kumar Kartikeya Dwivedi 2026-10-20  263  		goto unwound;							\
e56c95f1864ca19 Kumar Kartikeya Dwivedi 2026-10-20  264  } while (0)
e56c95f1864ca19 Kumar Kartikeya Dwivedi 2026-10-20  265  

:::::: The code at line 260 was first introduced by commit
:::::: e56c95f1864ca1982840940c9f695fc2be39f039 bpf: Give a helper a way to call its callback with a pad

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
