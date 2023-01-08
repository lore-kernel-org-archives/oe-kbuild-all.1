Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78240256A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Jan 2023 17:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E34C433EF;
	Sun,  8 Jan 2023 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673197530;
	bh=HFavEfaaOIEeblXgoi89764sjPrrT18cUKnHVcLRC7U=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=qp+MVPlaCjYjzzH8nyuGdKR8nNAhmxk7yBFveAnj2zamVwbzfgWmfLeyT2vLaOmpu
	 GX4Vl/az3CH5JNO4Bw5qnuf4nkfNxVyQ3fLQvSPSOnSu6VmLyg6RFdijYFtr9SOu9n
	 TZVCA6GDZn7KcsMUQaAStfLCOXOiBACqBfaAXaGaMMYRSsEMDTRMxnK/pPBg0jLNTK
	 gt2doSxCTCHPwMA+AH4XkRKaBnY8azxQ2mQok8QxP4zKNBJZVUa68mD0uNKsbeccmf
	 aLC8mGFfWZBYSRkl47wqBCT3uQ7fS/2LQgHxfeffDrRGIBHs/W3lJpyzt1DAC4bk1/
	 zpDFDctSWih4Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A4CA45C0920; Sun,  8 Jan 2023 09:05:29 -0800 (PST)
Date: Sun, 8 Jan 2023 09:05:29 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Feng Tang <feng.tang@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [lkp] [+64 bytes kernel size regression] [i386-tinyconfig]
 [78532abaf5] x86/tsc: Add option to force frequency recalibration with HW
 timer
Message-ID: <20230108170529.GE4028633@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <63b93549.zVwVAqMScLqdk2+g%lkp@intel.com>
 <20230107160132.GY4028633@paulmck-ThinkPad-P17-Gen-1>
 <Y7qJdtnshG3vu95L@feng-clx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7qJdtnshG3vu95L@feng-clx>

On Sun, Jan 08, 2023 at 05:14:30PM +0800, Feng Tang wrote:
> On Sat, Jan 07, 2023 at 08:01:32AM -0800, Paul E. McKenney wrote:
> > On Sat, Jan 07, 2023 at 05:03:05PM +0800, kernel test robot wrote:
> > > 
> > > FYI, we noticed a +64 bytes kernel size regression due to commit:
> > > 
> > > commit: 78532abaf5f1c973c99680960ae22bd797951ddf (x86/tsc: Add option to force frequency recalibration with HW timer)
> > > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git workqueue.2023.01.06a
> > > 
> > > 
> > > Details as below (size data is obtained by `nm --size-sort vmlinux`):
> > > 
> > > 8913f44d: clocksource: Permit limited-duration clocksource watchdogging
> > > 78532aba: x86/tsc: Add option to force frequency recalibration with HW timer
> > 
> > Perhaps there should be a Kconfig option to disable the clocksource
> > watchdog?  Not sure that a minimal kernel would worry about such things.
> 
> Yes, there is a CONFIG_CLOCKSOURCE_WATCHDOG option. For 78532aba, IMHO,
> 64 bytes is a relatively small cost comparing to its potential value.

Agreed!

It seems to me that the fix here is to make the minimal kernel used for
these stats be built with CONFIG_CLOCKSOURCE_WATCHDOG=n.  Similar to the
way that RCU CPU stall warnings are not enabled in Tiny RCU.

							Thanx, Paul

> Thanks,
> Feng
> 
> > 
> > 							Thanx, Paul
> > 
> > > +----------------------------------+----------+----------+-------+
> > > |              symbol              | 8913f44d | 78532aba | delta |
> > > +----------------------------------+----------+----------+-------+
> > > | bzImage                          | 495904   | 495968   | 64    |
> > > | nm.t.tsc_setup                   | 103      | 129      | 26    |
> > > | nm.t.init_tsc_clocksource        | 111      | 132      | 21    |
> > > | nm.t.tsc_refine_calibration_work | 427      | 440      | 13    |
> > > | nm.d.tsc_force_recalibrate       | 0        | 4        | 4     |
> > > +----------------------------------+----------+----------+-------+
> > > 
> > > 
> > > 
> > > Thanks
> > > 
