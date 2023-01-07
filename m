Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D248F1C32
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jan 2023 16:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF1EC433F0;
	Sat,  7 Jan 2023 16:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673107292;
	bh=GPF6kBgDQxRTGNYi946r/uEuYkwQ50RwI/dXP9ezaEM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=KFScC+7ef4sltTwnC7ZeBwrT4yk2VzhaZYwgsmoWQWQ1Ei+eM7CgRx0z/4sHahfJt
	 mNJsORpuVVUMsElnRK7pzzqrq9JHdk5O1M3FJAu9gIIKxr0RVuFV6QoKkC644ZINuo
	 AleDUMmlPNY509s9nFub/X0qlbpEJmH19bVuMMAuSAuav+tWncHJt9K/a4e/x7uolf
	 Z1Da4M+iynwt2pvukhPdfbsMw5ty9sHr9eMVZw2lTp6PVBC4ebZ1umBOxQBu0brtgl
	 h8NDB2DE+SE04hYBYZb389lW3qdLHGii2uZpUbZ1Uy/PNmp+FHsb7WdRCwGhF2Y6C3
	 sJAzlEOhsfzVg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2E13E5C09F1; Sat,  7 Jan 2023 08:01:32 -0800 (PST)
Date: Sat, 7 Jan 2023 08:01:32 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Feng Tang <feng.tang@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [lkp] [+64 bytes kernel size regression] [i386-tinyconfig]
 [78532abaf5] x86/tsc: Add option to force frequency recalibration with HW
 timer
Message-ID: <20230107160132.GY4028633@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <63b93549.zVwVAqMScLqdk2+g%lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63b93549.zVwVAqMScLqdk2+g%lkp@intel.com>

On Sat, Jan 07, 2023 at 05:03:05PM +0800, kernel test robot wrote:
> 
> FYI, we noticed a +64 bytes kernel size regression due to commit:
> 
> commit: 78532abaf5f1c973c99680960ae22bd797951ddf (x86/tsc: Add option to force frequency recalibration with HW timer)
> https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git workqueue.2023.01.06a
> 
> 
> Details as below (size data is obtained by `nm --size-sort vmlinux`):
> 
> 8913f44d: clocksource: Permit limited-duration clocksource watchdogging
> 78532aba: x86/tsc: Add option to force frequency recalibration with HW timer

Perhaps there should be a Kconfig option to disable the clocksource
watchdog?  Not sure that a minimal kernel would worry about such things.

							Thanx, Paul

> +----------------------------------+----------+----------+-------+
> |              symbol              | 8913f44d | 78532aba | delta |
> +----------------------------------+----------+----------+-------+
> | bzImage                          | 495904   | 495968   | 64    |
> | nm.t.tsc_setup                   | 103      | 129      | 26    |
> | nm.t.init_tsc_clocksource        | 111      | 132      | 21    |
> | nm.t.tsc_refine_calibration_work | 427      | 440      | 13    |
> | nm.d.tsc_force_recalibrate       | 0        | 4        | 4     |
> +----------------------------------+----------+----------+-------+
> 
> 
> 
> Thanks
> 
