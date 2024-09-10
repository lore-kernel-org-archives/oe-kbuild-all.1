Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4C2136358
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725949982; cv=none; b=jZ8ivfvLS5/7oRNCSg4jHELyWqSB5Hw/nCKi4ztX52CTcJiM62WuHwIO09Gfda4KYEeI7z0jVefRJCez39SpdtHunPBchMasuZVUY7A/n1Ml9EDOG6s4EAbmU3ds5qbvctsAdbklrLLxXt5KQJ1P81fqiGJoW4OSN0jzOEWVSX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725949982; c=relaxed/simple;
	bh=uYb3tziJgC65vk/M0rh5mOJe+CdgV/2QnJ8EOumoKPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ps0lVZVB4UyWPx9iIgLRYUn7PjTlQ57fbNdcEDQCOIUd6t+ydLzkWSMzZE5nhyRwKFgH5QSv2UHcOJ8t++zgJgcfrtFexH91exfaZB22zavXBO8veiUMUheTl05oEBu0enMrPO5FWn3N7Tbk9iuf80FeDhgalFohrOF5ib+szqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RK69JxN4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RK69JxN4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8C4C4CEC3;
	Tue, 10 Sep 2024 06:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725949982;
	bh=uYb3tziJgC65vk/M0rh5mOJe+CdgV/2QnJ8EOumoKPw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=RK69JxN4+4ZWuhPbf1QRZ8i0Fv4+AEpeN4fN0lfULG1smQ5Nr739oKR2Gwu3GBm8o
	 Pp6IU3pjwNA3DTHJJJbhCdXIXt3T/OZC6n4FFJ+Efva3NsGva2ESGyh5Y5rrRFbdtV
	 D+bpQmX7hZgVUPyf/wl6QOv2rhshMS13GJ63vAQO85NpJS8/g8o1YdU+aMKUmq9o/h
	 XOAahkGq617xnKCSaacRHIlxQwYZHIArXQL7fDgSI1yheW5CGSBSkf+99bvcJUOUok
	 PHrqjLJsyivocJ8uTv7miHBJwTV997EY2q+wrpoPnVEawhBTtulTUF308Vin0bcWWt
	 WJFokRLq6bxAg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5619DCE0FEB; Mon,  9 Sep 2024 23:33:00 -0700 (PDT)
Date: Mon, 9 Sep 2024 23:33:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Subject: Re: [linux-next:master 3671/10296] ERROR: start_text address is
 c000000000000700, should be c000000000000200
Message-ID: <70e609f3-57bb-432a-8363-3ed020380bcb@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202409090839.Gz712lD2-lkp@intel.com>
 <41c30910-93da-4476-89e6-e04911d723f6@paulmck-laptop>
 <Zt+Vf2E42Qi5GdcC@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zt+Vf2E42Qi5GdcC@rli9-mobl>

On Tue, Sep 10, 2024 at 08:40:31AM +0800, Philip Li wrote:
> On Mon, Sep 09, 2024 at 09:20:00AM -0700, Paul E. McKenney wrote:
> > On Mon, Sep 09, 2024 at 08:42:42AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
> > > commit: fe91cf39db0939ac8d523b5a1c31840f7cbe205c [3671/10296] rcu/tasks: Add detailed grace-period and barrier diagnostics
> > > config: powerpc64-randconfig-003-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090839.Gz712lD2-lkp@intel.com/config)
> > > compiler: powerpc64-linux-gcc (GCC) 14.1.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090839.Gz712lD2-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202409090839.Gz712lD2-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> ERROR: start_text address is c000000000000700, should be c000000000000200
> > >    ERROR: try to enable LD_HEAD_STUB_CATCH config option
> > >    ERROR: see comments in arch/powerpc/tools/head_check.sh
> > 
> > I have no idea how this patch could have caused this.  Help?
> 
> Sorry about the false report, kindly ignore this. Seems it can't bisect to the actual
> bad commit, another similar false report is at [1] with a different bad commit.
> 
> [1] https://lore.kernel.org/oe-kbuild-all/202409100106.A8692079-lkp@intel.com/

No problem, and I know that feeling!

							Thanx, Paul
