Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7574B63B6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 15:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A79CC433CD;
	Fri, 11 Aug 2023 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691768504;
	bh=2qhfenVezoKkqMAFTTrxuE/5s2D48IKGWRzFGDyIrm8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=bOxnrufrd0m+KM4fEhHDtsntagCkMfFZJKComu4GKKRQP43N4PTHfidnH+gZ5Wt6y
	 KaFuksv5Ty2TCcoM83899bmqZabg3/cGRHfRXCwMAYEkwxiFfYWooguWjr8xUrfum3
	 bOWKqLJ8cqCs8TcN9KTREhFq6hPJB725yZlN4cYqPfg4YS7Xd5aYaIhsOjE+oW704x
	 gCxUKL/MJhowsm/v68E9q0amBNVfskUxFxDe75fxGs6++vNYB2GvDWzcdir72Joytx
	 fw4eKMBt/YD3sYAz8v37PdcaxZpM41dnmzNWMHp/5xY1uhGlAbjNUTETlHQdjD7g5m
	 nh+JwCpLn7HnQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A5A02CE0593; Fri, 11 Aug 2023 08:41:43 -0700 (PDT)
Date: Fri, 11 Aug 2023 08:41:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: {standard input}:1727: Error: operand out of range (-132 is not
 between -128 and 127)
Message-ID: <416679c9-96b3-4114-bba3-473e647c4c2d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202308111233.rbf5C0JD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308111233.rbf5C0JD-lkp@intel.com>

On Fri, Aug 11, 2023 at 01:02:12PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   25aa0bebba72b318e71fe205bfd1236550cc9534
> commit: a6889becb05394255c80b62103677e3b095726a9 refscale: Add tests using SLAB_TYPESAFE_BY_RCU
> date:   7 months ago
> config: arc-randconfig-r006-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111233.rbf5C0JD-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111233.rbf5C0JD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308111233.rbf5C0JD-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    {standard input}: Assembler messages:
> >> {standard input}:1727: Error: operand out of range (-132 is not between -128 and 127)

I am not seeing any inline assembly in that patch, so I have to suspect
a bug in arch code or the compiler backend for arc.

Or is there something that I am missing here?

							Thanx, Paul
