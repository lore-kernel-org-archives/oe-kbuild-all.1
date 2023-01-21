Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D62536E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 04:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23477C433D2;
	Sat, 21 Jan 2023 04:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674275706;
	bh=K+PsH/ie9YbGDU6HqGSxMqcGq7NKxkFaPR6/RZzw1gg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=pGJueK4F5CGzer33Yb4UrsF9mgzLY7Yk6s8ySMe2kT/TaLGFdtQREhdXGAQpSsU4w
	 R9DdlHNtTwQ2wR5iTzRkCmEZc3Nx3cA45/3DU5jILclB6rtJugeg+pl5VmIt4P6j87
	 gcBLFdcWUnqKa00SqPX+lxa5ibtzIZNsEbkdt/Ga3FSXlaEGCogvZ9yMQOJgB4HTbT
	 g4Y3SiPZS88hz6o6hKGsO/k48G554A+S6xXFspQ7loU+Ov5NHuM5kUAyICVQbiScqf
	 ZisgPP1Kk6LKlTNEht05odx97ECRoUR8autpzlHMA0IxADfDmPMsR9XPiMfqqCsy8Z
	 p9SX3flywOLDg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BA9F15C155D; Fri, 20 Jan 2023 20:35:05 -0800 (PST)
Date: Fri, 20 Jan 2023 20:35:05 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:paulmck/linux-rcu/nmitest.2023.01.20a 4/5]
 arch/x86/kernel/nmi.c:441:6: warning: no previous prototype for
 'set_nmi_torture'
Message-ID: <20230121043505.GD2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <202301211106.33rvYsWW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301211106.33rvYsWW-lkp@intel.com>

On Sat, Jan 21, 2023 at 11:50:25AM +0800, kernel test robot wrote:
> tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/nmitest.2023.01.20a
> head:   53e298568bde2c728ee2aac4ac634cca8550a4b4
> commit: 1f061ebc3647245564abc8b5a47882645af82199 [4/5] x86/nmi: Add a set_nmi_torture() function to control NMI testing
> config: x86_64-rhel-8.3-syz (https://download.01.org/0day-ci/archive/20230121/202301211106.33rvYsWW-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/ammarfaizi2/linux-block/commit/1f061ebc3647245564abc8b5a47882645af82199
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/nmitest.2023.01.20a
>         git checkout 1f061ebc3647245564abc8b5a47882645af82199
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/x86/kernel/nmi.c:441:6: warning: no previous prototype for 'set_nmi_torture' [-Wmissing-prototypes]
>      441 | void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
>          |      ^~~~~~~~~~~~~~~

This is a not-for-mainline test commit, so I am not worried about making
it pretty.  Not yet, anyway.  ;-)

							Thanx, Paul

> vim +/set_nmi_torture +441 arch/x86/kernel/nmi.c
> 
>    439	
>    440	/* Set the test values as desired. */
>  > 441	void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
>    442	{
>    443		WRITE_ONCE(nmi_delay, nmi_delay_in);
>    444		WRITE_ONCE(nmi_halt1, nmi_halt1_in);
>    445		WRITE_ONCE(nmi_halt2, nmi_halt2_in);
>    446		WRITE_ONCE(nmi_halt3, nmi_halt3_in);
>    447		pr_info("%s: Set NMI test parameters nmi_delay=%d nmi_halt1=%d nmi_halt2=%d nmi_halt3=%d\n",
>    448			__func__, nmi_delay, nmi_halt1, nmi_halt2, nmi_halt3);
>    449	}
>    450	EXPORT_SYMBOL_GPL(set_nmi_torture);
>    451	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
