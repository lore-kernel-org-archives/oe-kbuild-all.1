Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373954185A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 20:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPyz8OOu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A710AC433C7;
	Wed,  6 Dec 2023 20:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701895095;
	bh=meN9n/82QvNIZ0XZeo0x+kgGBx2QTXK1BuA2HRAZVMY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=DPyz8OOuAwbuu/cl+E9ayk4j5gvjJpirBq/4Xu8nb8onM5g5duJeZIu1YMLR7QyUT
	 fqSfPtTCoVsfdsWQuHlCvq5wtAr0vVoY5tNDu+mlDnLfstD4HV7e/tv++O/FyXACsg
	 M9OswCuM0Lc30eA2OyPgEGRuN67kH4+GaYatByxZtV2ekh4DQX3Vs4FyMg/3A8le3+
	 Y7y7zKnL6jyGWo34wrZA27y//XLIUciHKT+tdM/het8Tyva69Csxx02FUyfhLE6URX
	 gUzcN+4BUDLlaJRZXTJCypQTwd69i7sH1kK/hJK9st+6i2YTqtXiIw3LVjxPwDw+i2
	 zHYWsD4byUt0A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3B12FCE0CC4; Wed,  6 Dec 2023 12:38:15 -0800 (PST)
Date: Wed, 6 Dec 2023 12:38:15 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernel test robot <lkp@intel.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: kernel/context_tracking.c:80: warning: Function parameter or
 member 'state' not described in '__ct_user_enter'
Message-ID: <da7a3d32-e4f5-48d5-a7fb-f604f390c158@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202312041922.YZCcEPYD-lkp@intel.com>
 <8e26257d-2809-4965-9f7d-aadbbb3def6f@paulmck-laptop>
 <fb36c8ea-02d7-408a-8354-f35712cdd510@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb36c8ea-02d7-408a-8354-f35712cdd510@infradead.org>

On Tue, Dec 05, 2023 at 02:15:54PM -0800, Randy Dunlap wrote:
> 
> 
> On 12/4/23 20:38, Paul E. McKenney wrote:
> > On Mon, Dec 04, 2023 at 08:02:33PM +0800, kernel test robot wrote:
> >> Hi Frederic,
> >>
> >> FYI, the error/warning still remains.
> >>
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> >> head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
> >> commit: e67198cc05b8ecbb7b8e2d8ef9fb5c8d26821873 context_tracking: Take idle eqs entrypoints over RCU
> >> date:   1 year, 5 months ago
> >> config: x86_64-buildonly-randconfig-006-20230906 (https://download.01.org/0day-ci/archive/20231204/202312041922.YZCcEPYD-lkp@intel.com/config)
> >> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> >> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231204/202312041922.YZCcEPYD-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202312041922.YZCcEPYD-lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >>>> kernel/context_tracking.c:80: warning: Function parameter or member 'state' not described in '__ct_user_enter'
> >>>> kernel/context_tracking.c:184: warning: Function parameter or member 'state' not described in '__ct_user_exit'
> > 
> > Does the patch below help?
> 
> Yes. Thanks.
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thank you!  I will apply these on my next rebase.

							Thanx, Paul

> > ------------------------------------------------------------------------
> > 
> > commit 9d879548a8cc89e5fdb0d806fc20887d67991c10
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Mon Dec 4 20:34:58 2023 -0800
> > 
> >     context_tracking: Fix kerneldoc headers for __ct_user_{enter,exit}()
> >     
> >     Document the "state" parameter of both of these functions.
> >     
> >     Reported-by: kernel test robot <lkp@intel.com>
> >     Closes: https://lore.kernel.org/oe-kbuild-all/202312041922.YZCcEPYD-lkp@intel.com/
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> >     Cc: Frederic Weisbecker <frederic@kernel.org>
> > 
> > diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
> > index 6ef0b35fc28c..70ae70d03823 100644
> > --- a/kernel/context_tracking.c
> > +++ b/kernel/context_tracking.c
> > @@ -458,6 +458,8 @@ static __always_inline void context_tracking_recursion_exit(void)
> >   * __ct_user_enter - Inform the context tracking that the CPU is going
> >   *		     to enter user or guest space mode.
> >   *
> > + * @state: userspace context-tracking state to enter.
> > + *
> >   * This function must be called right before we switch from the kernel
> >   * to user or guest space, when it's guaranteed the remaining kernel
> >   * instructions to execute won't use any RCU read side critical section
> > @@ -595,6 +597,8 @@ NOKPROBE_SYMBOL(user_enter_callable);
> >   * __ct_user_exit - Inform the context tracking that the CPU is
> >   *		    exiting user or guest mode and entering the kernel.
> >   *
> > + * @state: userspace context-tracking state being exited from.
> > + *
> >   * This function must be called after we entered the kernel from user or
> >   * guest space before any use of RCU read side critical section. This
> >   * potentially include any high level kernel code like syscalls, exceptions,
> 
> -- 
> ~Randy
