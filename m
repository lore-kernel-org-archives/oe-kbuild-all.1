Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2710B289367
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752748831; cv=none; b=NDLu8DcAuyyneYlOZxbSpcIhR9fiYgvFm7qzIm25w8B7kn7Q+NtTc1mmzqJYgBqgqjyRjRuiXdvSYHuirjhqj7bhnkVJqT9VeB0Vi1JvVtBw74rvfe2jZcZxI/gyK/xRHl1oMHwbtrOtL1wLqdeWyJ/QbZbkeuGBNpssoho28lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752748831; c=relaxed/simple;
	bh=NGjsOLUv5urKPhzNQPn3aSRBTTI+Hl0lYR6/0zf4atw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPq7mdMbJAv/h+Tq4Hm/w6ReB7PNB24ANTkHNewRSUry0PHbaPIH36bsd9OrPdMAo2OtDw/8V3kCQ4aQe1p+4vP9MOGFg13dGmrW3Q0l2KRM/cyYaSrgA9fehssy7ae7wSVwu3mzrWTCR15AEwPl63u6cClH9Eb5dWhZLVfDSog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cf5L8pwO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cf5L8pwO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752748830; x=1784284830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NGjsOLUv5urKPhzNQPn3aSRBTTI+Hl0lYR6/0zf4atw=;
  b=cf5L8pwO4w+P6TkZ2HK+gKYsECSF5D4iRhWdXJhOe1d7iFKHmH7IieCN
   KkO3F4bkxtLzC20ZhnOt9WrULXsVpwSVZBH2ULO9RF7ab8MAtqVCWwf9W
   3lAuX1W+YL7Yei0OBUXdZDZb7BvyHS6mYWzthVnel3Jb9jmpv1/9yfDKl
   TEP/J/Y9KUsi0KEo5rV0yMAVeIPhfOLE8SkYBar5urWnZvAW254UZ51N+
   O5CunlYE5ehnR9l5FPqfuf0dUOGKAJdhAaKpi//3Cq+HCe1YB/Y/DNs6F
   hU4wZV4m1sm7sDSX4z4lS9DEkzjph8Cp2hmx2wMrADCV31a+6poX5XjNN
   Q==;
X-CSE-ConnectionGUID: V5dounVfTuKX9TebTJ+xvQ==
X-CSE-MsgGUID: M8ydYUxwSBW8Nr3eaFsoZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54235234"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="54235234"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 03:40:28 -0700
X-CSE-ConnectionGUID: WyyhuPB3R4KQNLsjYahDnQ==
X-CSE-MsgGUID: qCwVinEjRsGUdR4Vjcy9+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="181461639"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jul 2025 03:40:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucM2F-000DX5-02;
	Thu, 17 Jul 2025 10:40:19 +0000
Date: Thu, 17 Jul 2025 18:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] uapi/termios: remove struct ktermios from uapi
 headers
Message-ID: <202507171802.7Hpjpxjt-lkp@intel.com>
References: <20250716164735.170713-1-hpa@zytor.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716164735.170713-1-hpa@zytor.com>

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on deller-parisc/for-next]
[also build test ERROR on powerpc/next powerpc/fixes arnd-asm-generic/master staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.16-rc6 next-20250716]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/H-Peter-Anvin/uapi-termios-remove-struct-ktermios-from-uapi-headers/20250717-010112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
patch link:    https://lore.kernel.org/r/20250716164735.170713-1-hpa%40zytor.com
patch subject: [PATCH 1/1] uapi/termios: remove struct ktermios from uapi headers
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20250717/202507171802.7Hpjpxjt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171802.7Hpjpxjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171802.7Hpjpxjt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/alpha/kernel/termios.c:2:
>> include/linux/termios_internal.h:37:42: warning: 'struct ktermios' declared inside parameter list will not be visible outside of this definition or declaration
      37 | int user_termio_to_kernel_termios(struct ktermios *, struct termio __user *);
         |                                          ^~~~~~~~
   include/linux/termios_internal.h:38:66: warning: 'struct ktermios' declared inside parameter list will not be visible outside of this definition or declaration
      38 | int kernel_termios_to_user_termio(struct termio __user *, struct ktermios *);
         |                                                                  ^~~~~~~~
   include/linux/termios_internal.h:40:43: warning: 'struct ktermios' declared inside parameter list will not be visible outside of this definition or declaration
      40 | int user_termios_to_kernel_termios(struct ktermios *, struct termios2 __user *);
         |                                           ^~~~~~~~
   include/linux/termios_internal.h:41:69: warning: 'struct ktermios' declared inside parameter list will not be visible outside of this definition or declaration
      41 | int kernel_termios_to_user_termios(struct termios2 __user *, struct ktermios *);
         |                                                                     ^~~~~~~~
   include/linux/termios_internal.h:42:45: warning: 'struct ktermios' declared inside parameter list will not be visible outside of this definition or declaration
      42 | int user_termios_to_kernel_termios_1(struct ktermios *, struct termios __user *);
         |                                             ^~~~~~~~
   include/linux/termios_internal.h:43:70: warning: 'struct ktermios' declared inside parameter list will not be visible outside of this definition or declaration
      43 | int kernel_termios_to_user_termios_1(struct termios __user *, struct ktermios *);
         |                                                                      ^~~~~~~~
>> arch/alpha/kernel/termios.c:4:42: warning: 'struct ktermios' declared inside parameter list will not be visible outside of this definition or declaration
       4 | int user_termio_to_kernel_termios(struct ktermios *termios,
         |                                          ^~~~~~~~
>> arch/alpha/kernel/termios.c:4:5: error: conflicting types for 'user_termio_to_kernel_termios'; have 'int(struct ktermios *, struct termio *)'
       4 | int user_termio_to_kernel_termios(struct ktermios *termios,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/termios_internal.h:37:5: note: previous declaration of 'user_termio_to_kernel_termios' with type 'int(struct ktermios *, struct termio *)'
      37 | int user_termio_to_kernel_termios(struct ktermios *, struct termio __user *);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/alpha/kernel/termios.c: In function 'user_termio_to_kernel_termios':
>> arch/alpha/kernel/termios.c:13:16: error: invalid use of undefined type 'struct ktermios'
      13 |         termios->c_iflag = (0xffff0000 & termios->c_iflag) | v.c_iflag;
         |                ^~
   arch/alpha/kernel/termios.c:13:49: error: invalid use of undefined type 'struct ktermios'
      13 |         termios->c_iflag = (0xffff0000 & termios->c_iflag) | v.c_iflag;
         |                                                 ^~
   arch/alpha/kernel/termios.c:14:16: error: invalid use of undefined type 'struct ktermios'
      14 |         termios->c_oflag = (0xffff0000 & termios->c_oflag) | v.c_oflag;
         |                ^~
   arch/alpha/kernel/termios.c:14:49: error: invalid use of undefined type 'struct ktermios'
      14 |         termios->c_oflag = (0xffff0000 & termios->c_oflag) | v.c_oflag;
         |                                                 ^~
   arch/alpha/kernel/termios.c:15:16: error: invalid use of undefined type 'struct ktermios'
      15 |         termios->c_cflag = (0xffff0000 & termios->c_cflag) | v.c_cflag;
         |                ^~
   arch/alpha/kernel/termios.c:15:49: error: invalid use of undefined type 'struct ktermios'
      15 |         termios->c_cflag = (0xffff0000 & termios->c_cflag) | v.c_cflag;
         |                                                 ^~
   arch/alpha/kernel/termios.c:16:16: error: invalid use of undefined type 'struct ktermios'
      16 |         termios->c_lflag = (0xffff0000 & termios->c_lflag) | v.c_lflag;
         |                ^~
   arch/alpha/kernel/termios.c:16:49: error: invalid use of undefined type 'struct ktermios'
      16 |         termios->c_lflag = (0xffff0000 & termios->c_lflag) | v.c_lflag;
         |                                                 ^~
   arch/alpha/kernel/termios.c:17:16: error: invalid use of undefined type 'struct ktermios'
      17 |         termios->c_line = (0xffff0000 & termios->c_lflag) | v.c_line;
         |                ^~
   arch/alpha/kernel/termios.c:17:48: error: invalid use of undefined type 'struct ktermios'
      17 |         termios->c_line = (0xffff0000 & termios->c_lflag) | v.c_line;
         |                                                ^~
   arch/alpha/kernel/termios.c:20:16: error: invalid use of undefined type 'struct ktermios'
      20 |         termios->c_cc[VINTR]  = v.c_cc[_VINTR];
         |                ^~
   arch/alpha/kernel/termios.c:21:16: error: invalid use of undefined type 'struct ktermios'
      21 |         termios->c_cc[VQUIT]  = v.c_cc[_VQUIT];
         |                ^~
   arch/alpha/kernel/termios.c:22:16: error: invalid use of undefined type 'struct ktermios'
      22 |         termios->c_cc[VERASE] = v.c_cc[_VERASE];
         |                ^~
   arch/alpha/kernel/termios.c:23:16: error: invalid use of undefined type 'struct ktermios'
      23 |         termios->c_cc[VKILL]  = v.c_cc[_VKILL];
         |                ^~
   arch/alpha/kernel/termios.c:24:16: error: invalid use of undefined type 'struct ktermios'
      24 |         termios->c_cc[VEOL2]  = v.c_cc[_VEOL2];
         |                ^~
   arch/alpha/kernel/termios.c:25:16: error: invalid use of undefined type 'struct ktermios'
      25 |         termios->c_cc[VSWTC]  = v.c_cc[_VSWTC];
         |                ^~
   arch/alpha/kernel/termios.c:26:16: error: invalid use of undefined type 'struct ktermios'
      26 |         termios->c_cc[canon ? VEOF : VMIN]  = v.c_cc[_VEOF];
         |                ^~
   arch/alpha/kernel/termios.c:27:16: error: invalid use of undefined type 'struct ktermios'
      27 |         termios->c_cc[canon ? VEOL : VTIME] = v.c_cc[_VEOL];
         |                ^~
   arch/alpha/kernel/termios.c: At top level:
   arch/alpha/kernel/termios.c:33:56: warning: 'struct ktermios' declared inside parameter list will not be visible outside of this definition or declaration
      33 |                                                 struct ktermios *termios)
         |                                                        ^~~~~~~~
>> arch/alpha/kernel/termios.c:32:5: error: conflicting types for 'kernel_termios_to_user_termio'; have 'int(struct termio *, struct ktermios *)'
      32 | int kernel_termios_to_user_termio(struct termio __user *termio,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/termios_internal.h:38:5: note: previous declaration of 'kernel_termios_to_user_termio' with type 'int(struct termio *, struct ktermios *)'
      38 | int kernel_termios_to_user_termio(struct termio __user *, struct ktermios *);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/alpha/kernel/termios.c: In function 'kernel_termios_to_user_termio':
   arch/alpha/kernel/termios.c:39:28: error: invalid use of undefined type 'struct ktermios'
      39 |         v.c_iflag = termios->c_iflag;
         |                            ^~
   arch/alpha/kernel/termios.c:40:28: error: invalid use of undefined type 'struct ktermios'
      40 |         v.c_oflag = termios->c_oflag;
         |                            ^~
   arch/alpha/kernel/termios.c:41:28: error: invalid use of undefined type 'struct ktermios'
      41 |         v.c_cflag = termios->c_cflag;
         |                            ^~
   arch/alpha/kernel/termios.c:42:28: error: invalid use of undefined type 'struct ktermios'
      42 |         v.c_lflag = termios->c_lflag;
         |                            ^~
   arch/alpha/kernel/termios.c:43:27: error: invalid use of undefined type 'struct ktermios'
      43 |         v.c_line = termios->c_line;
         |                           ^~
   arch/alpha/kernel/termios.c:46:34: error: invalid use of undefined type 'struct ktermios'
      46 |         v.c_cc[_VINTR]  = termios->c_cc[VINTR];
         |                                  ^~
   arch/alpha/kernel/termios.c:47:34: error: invalid use of undefined type 'struct ktermios'
      47 |         v.c_cc[_VQUIT]  = termios->c_cc[VQUIT];
         |                                  ^~
   arch/alpha/kernel/termios.c:48:34: error: invalid use of undefined type 'struct ktermios'
      48 |         v.c_cc[_VERASE] = termios->c_cc[VERASE];
         |                                  ^~
   arch/alpha/kernel/termios.c:49:34: error: invalid use of undefined type 'struct ktermios'
      49 |         v.c_cc[_VKILL]  = termios->c_cc[VKILL];
         |                                  ^~
   arch/alpha/kernel/termios.c:50:34: error: invalid use of undefined type 'struct ktermios'
      50 |         v.c_cc[_VEOF]   = termios->c_cc[canon ? VEOF : VMIN];
         |                                  ^~
   arch/alpha/kernel/termios.c:51:34: error: invalid use of undefined type 'struct ktermios'
      51 |         v.c_cc[_VEOL]   = termios->c_cc[canon ? VEOL : VTIME];
         |                                  ^~
   arch/alpha/kernel/termios.c:52:34: error: invalid use of undefined type 'struct ktermios'
      52 |         v.c_cc[_VEOL2]  = termios->c_cc[VEOL2];
         |                                  ^~
   arch/alpha/kernel/termios.c:53:34: error: invalid use of undefined type 'struct ktermios'
      53 |         v.c_cc[_VSWTC]  = termios->c_cc[VSWTC];
         |                                  ^~


vim +4 arch/alpha/kernel/termios.c

1d5d66825610bb Al Viro 2022-08-20   3  
1d5d66825610bb Al Viro 2022-08-20  @4  int user_termio_to_kernel_termios(struct ktermios *termios,
1d5d66825610bb Al Viro 2022-08-20   5  						struct termio __user *termio)
1d5d66825610bb Al Viro 2022-08-20   6  {
1d5d66825610bb Al Viro 2022-08-20   7  	struct termio v;
1d5d66825610bb Al Viro 2022-08-20   8  	bool canon;
1d5d66825610bb Al Viro 2022-08-20   9  
1d5d66825610bb Al Viro 2022-08-20  10  	if (copy_from_user(&v, termio, sizeof(struct termio)))
1d5d66825610bb Al Viro 2022-08-20  11  		return -EFAULT;
1d5d66825610bb Al Viro 2022-08-20  12  
1d5d66825610bb Al Viro 2022-08-20 @13  	termios->c_iflag = (0xffff0000 & termios->c_iflag) | v.c_iflag;
1d5d66825610bb Al Viro 2022-08-20  14  	termios->c_oflag = (0xffff0000 & termios->c_oflag) | v.c_oflag;
1d5d66825610bb Al Viro 2022-08-20  15  	termios->c_cflag = (0xffff0000 & termios->c_cflag) | v.c_cflag;
1d5d66825610bb Al Viro 2022-08-20  16  	termios->c_lflag = (0xffff0000 & termios->c_lflag) | v.c_lflag;
1d5d66825610bb Al Viro 2022-08-20  17  	termios->c_line = (0xffff0000 & termios->c_lflag) | v.c_line;
1d5d66825610bb Al Viro 2022-08-20  18  
1d5d66825610bb Al Viro 2022-08-20  19  	canon = v.c_lflag & ICANON;
1d5d66825610bb Al Viro 2022-08-20  20  	termios->c_cc[VINTR]  = v.c_cc[_VINTR];
1d5d66825610bb Al Viro 2022-08-20  21  	termios->c_cc[VQUIT]  = v.c_cc[_VQUIT];
1d5d66825610bb Al Viro 2022-08-20  22  	termios->c_cc[VERASE] = v.c_cc[_VERASE];
1d5d66825610bb Al Viro 2022-08-20  23  	termios->c_cc[VKILL]  = v.c_cc[_VKILL];
1d5d66825610bb Al Viro 2022-08-20  24  	termios->c_cc[VEOL2]  = v.c_cc[_VEOL2];
1d5d66825610bb Al Viro 2022-08-20  25  	termios->c_cc[VSWTC]  = v.c_cc[_VSWTC];
1d5d66825610bb Al Viro 2022-08-20  26  	termios->c_cc[canon ? VEOF : VMIN]  = v.c_cc[_VEOF];
1d5d66825610bb Al Viro 2022-08-20  27  	termios->c_cc[canon ? VEOL : VTIME] = v.c_cc[_VEOL];
1d5d66825610bb Al Viro 2022-08-20  28  
1d5d66825610bb Al Viro 2022-08-20  29  	return 0;
1d5d66825610bb Al Viro 2022-08-20  30  }
1d5d66825610bb Al Viro 2022-08-20  31  
1d5d66825610bb Al Viro 2022-08-20 @32  int kernel_termios_to_user_termio(struct termio __user *termio,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
