Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2CA16726E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 16:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725900276; cv=none; b=GstPuxG/Azo4cN4fmpoIFrync+0w66q5/m+OIl7e561jSpQTuLQWCQvnShMrXRL5o2LH0Sw6fbI07xzJwl6lkzzZhMN72cipdt+dT5fHBjRSAXSJKF0+UQYkXV33FCav1iccjamjFYs60cpRZnG9iAdT9rexuGEB6GcwRkGRAsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725900276; c=relaxed/simple;
	bh=6srnt6M39RKiRZbhRIV0n7nb1KAmlvnuLyPHKt7EEjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWfxneaQzkIqY68fASzGeiNy7XuAlJSdbL2qTEj2DR5bS5LCjyIH3A7eos81z1vyGseAu6QTz8jRINmuYGI4uDbwB6qF5KBFGim3nBr9cOUR9Qk2XzSNADq+02gA2PkCLVFV/OwWqwU81oBfX8+P4Jhn77gNe8lrpDEzDYfQpbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNkrsQ6M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNkrsQ6M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BBFEC4AF09;
	Mon,  9 Sep 2024 16:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725900275;
	bh=6srnt6M39RKiRZbhRIV0n7nb1KAmlvnuLyPHKt7EEjQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=FNkrsQ6Mn/4wUADYXq2iDZ0FTHWfQtKODKoghOJHJO9dEhlogoZOHrD7gCZqqlsKn
	 TA+MEBXej6TrkGFTWuODZfGc5cDPRdyWj42aISItYRb8EmwTH0HR7er1WOG45E1f5D
	 zO6YX2lWXnpH1gujfEv5p49lpbzVQ5LURmE0naniiIkFAZc3YUXmGmXcgw6ge+7sqy
	 B46LbbKu50oyS7unl/qTxMv97um9ak2GyqL3DdcjZ/GwUBY7D9FeoAFxk5PfEe40R+
	 5e7Borv1lGZP+9t/GXo3gqQwW0F5yLn63W3O07/OW5rN7ZHdW/UCg+bn3/Oj2FJxFN
	 Zmae5Cpfmg6uA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1B839CE1407; Mon,  9 Sep 2024 09:20:00 -0700 (PDT)
Date: Mon, 9 Sep 2024 09:20:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Subject: Re: [linux-next:master 3671/10296] ERROR: start_text address is
 c000000000000700, should be c000000000000200
Message-ID: <41c30910-93da-4476-89e6-e04911d723f6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202409090839.Gz712lD2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202409090839.Gz712lD2-lkp@intel.com>

On Mon, Sep 09, 2024 at 08:42:42AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
> commit: fe91cf39db0939ac8d523b5a1c31840f7cbe205c [3671/10296] rcu/tasks: Add detailed grace-period and barrier diagnostics
> config: powerpc64-randconfig-003-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090839.Gz712lD2-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090839.Gz712lD2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409090839.Gz712lD2-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ERROR: start_text address is c000000000000700, should be c000000000000200
>    ERROR: try to enable LD_HEAD_STUB_CATCH config option
>    ERROR: see comments in arch/powerpc/tools/head_check.sh

I have no idea how this patch could have caused this.  Help?

							Thanx, Paul
