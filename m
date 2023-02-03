Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD797F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 08:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5234C433EF;
	Fri,  3 Feb 2023 08:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675412140;
	bh=iBuMXxrOIhYh2OG5hwRiVxlt3/K14W5Bf1XK9EwuLbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ngn/4Xkl5XAFht/AHynDJabb8hv/V5MDTc6Z7Pr65fVYX1rbf1C9syffNI/NBTLqV
	 48iu2Ha/KgooELuU3UKROuXVa8hnHrpD70rB1WJDqiB4taFOrzTptepjmVctXIvkYp
	 faUZrwXUGaAVtk0M1P2Pp7L0GVe8V9eqChz4hkMc=
Date: Fri, 3 Feb 2023 09:15:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kyle Huey <me@kylehuey.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [linux-stable-rc:linux-5.15.y 9905/9999]
 protection_keys.c:undefined reference to `__cpuid_count'
Message-ID: <Y9zCqKkP9YluVM9y@kroah.com>
References: <202301170752.Y9ZPytWF-lkp@intel.com>
 <CAP045AomNRW3=gmfFgQ9c7roQVHE74+D5w1g-o72KmdnUntNDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP045AomNRW3=gmfFgQ9c7roQVHE74+D5w1g-o72KmdnUntNDQ@mail.gmail.com>

On Tue, Jan 17, 2023 at 12:27:42PM -0800, Kyle Huey wrote:
> On Mon, Jan 16, 2023 at 3:23 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> > head:   5bcc318cb4cd6b13569afdfc6d7b5c8c1f408f06
> > commit: 46aa1557581ff4cc380c3b29ef516f2b15129a4e [9905/9999] selftests/vm/pkeys: Add a regression test for setting PKRU through ptrace
> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> > reproduce:
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=46aa1557581ff4cc380c3b29ef516f2b15129a4e
> >         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> >         git fetch --no-tags linux-stable-rc linux-5.15.y
> >         git checkout 46aa1557581ff4cc380c3b29ef516f2b15129a4e
> >         make O=/tmp/kselftest headers
> >         make O=/tmp/kselftest -C tools/testing/selftests
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >
> > All error/warnings (new ones prefixed by >>):
> >
> >    In file included from pkey-helpers.h:89,
> >                     from protection_keys.c:49:
> >    pkey-x86.h: In function 'cpu_max_xsave_size':
> > >> pkey-x86.h:130:9: warning: implicit declaration of function '__cpuid_count' [-Wimplicit-function-declaration]
> >      130 |         __cpuid_count(XSTATE_CPUID, 0, eax, ebx, ecx, edx);
> >          |         ^~~~~~~~~~~~~
> > >> pkey-x86.h:130:9: warning: 'eax' is used uninitialized [-Wuninitialized]
> >      130 |         __cpuid_count(XSTATE_CPUID, 0, eax, ebx, ecx, edx);
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >> pkey-x86.h:130:9: warning: 'ebx' is used uninitialized [-Wuninitialized]
> > >> pkey-x86.h:130:9: warning: 'ecx' is used uninitialized [-Wuninitialized]
> > >> pkey-x86.h:130:9: warning: 'edx' is used uninitialized [-Wuninitialized]
> >    /usr/bin/ld: /tmp/cc5xWC2G.o: in function `cpu_max_xsave_size':
> > >> protection_keys.c:(.text+0xff9): undefined reference to `__cpuid_count'
> >    collect2: error: ld returned 1 exit status
> > --
> >    In file included from pkey-helpers.h:89,
> >                     from protection_keys.c:49:
> >    pkey-x86.h: In function 'cpu_max_xsave_size':
> > >> pkey-x86.h:130:9: warning: implicit declaration of function '__cpuid_count' [-Wimplicit-function-declaration]
> >      130 |         __cpuid_count(XSTATE_CPUID, 0, eax, ebx, ecx, edx);
> >          |         ^~~~~~~~~~~~~
> > >> pkey-x86.h:130:9: warning: 'eax' is used uninitialized [-Wuninitialized]
> >      130 |         __cpuid_count(XSTATE_CPUID, 0, eax, ebx, ecx, edx);
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >> pkey-x86.h:130:9: warning: 'ebx' is used uninitialized [-Wuninitialized]
> > >> pkey-x86.h:130:9: warning: 'ecx' is used uninitialized [-Wuninitialized]
> > >> pkey-x86.h:130:9: warning: 'edx' is used uninitialized [-Wuninitialized]
> >    /usr/bin/ld: /tmp/ccvfRroq.o: in function `cpu_max_xsave_size':
> >    protection_keys.c:(.text+0x124e): undefined reference to `__cpuid_count'
> >    collect2: error: ld returned 1 exit status
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests
> 
> That can be fixed by cherry-picking
> 
> 066b34aa5461 tools: fix ARRAY_SIZE defines in tools and selftests hdrs
> e89908201e25 selftests/vm: remove ARRAY_SIZE define from individual tests
> a23039c7306f selftests: Provide local define of __cpuid_count()
> 
> to 5.15. All three of these are small test harness changes.
> 
> My apologies, I didn't test *building* the pkeys selftest binary on
> each kernel when I was backporting.

All now queued up, thanks.

greg k-h
