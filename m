Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8060146592
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730485877; cv=none; b=ggZMQDq0FEfk7NVmjMVqmVyPi+4GCu/WFhH+8Hp6PWlgml6u8UoU4IWdAy3QqvpkvXEojvOCdb90CjzCgrQbUslluzfCm+0w5VvC+hAVJBTL6cW9mw2YUTT+ENYW2J1mnGdoo2ZMDH4VxfNP0huXURCV98ztLx7h6qPHxSK76hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730485877; c=relaxed/simple;
	bh=4GjAzXhxanWKMlu2qWyQXBA0Pyv7USuNVKtA5og4m3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFtlpl7YFihBnYGGpni3A5x0vIOVd8FeKrAN9qZcB9nUv67j+JThldswAcJLcMGf81JZpjlpbG0AjqRXjfl2sZVLHPaeom11WkECHg8aCmJBG2nMmn/9TEyjyJzFGf4AwObMtI8cSgmFtbsbeNztvhEcZnIqNgb3qvsDw8qe/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnafY+7g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnafY+7g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA90C4CECF;
	Fri,  1 Nov 2024 18:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730485877;
	bh=4GjAzXhxanWKMlu2qWyQXBA0Pyv7USuNVKtA5og4m3s=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=CnafY+7gUhvsTXnI8N0AJmx/vXJpXX4ovIFz4CVDWEJ65wqG4gZxSTm2a4XH+m2sQ
	 mjPDmdCJFYvTu67wZXx2XBuyJjW0K6ivUTrkEAwtC4DwQHBJc/JEW94avt16G+yDtS
	 +Nhj83ykq6/ofHSfhgwBwj3wjQY3ugQqjvTkndXyoZmWwVdbkloiM4YIoEFgw9xt/F
	 BUsXsx246SaoYpjmg+d1Z24s5IV8BL6Lz/bGU0HofnyPd+Mzxx0s6/IsFtlZ9J3TBJ
	 2s2N3dkigXry1PkrkL1/2i9Qt9LALsmbTyt33Yyh810bqN66zxZ/jSmDQa61LWQ+DB
	 1e8bHu4EW3LsA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E5D86CE0924; Fri,  1 Nov 2024 11:31:16 -0700 (PDT)
Date: Fri, 1 Nov 2024 11:31:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2024.10.27b 30/35]
 include/linux/rcupdate_wait.h:73:43: error: 'struct task_struct' has no
 member named 'rcu_node_entry'
Message-ID: <4ee5d9ca-573a-4f02-bcea-adcd14d4e94c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202410291131.mflSojdy-lkp@intel.com>
 <78daba3e-56b0-4081-a4ba-7e71936a387a@paulmck-laptop>
 <ZyLmoeIdoxGBCgCg@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyLmoeIdoxGBCgCg@xsang-OptiPlex-9020>

On Thu, Oct 31, 2024 at 10:08:33AM +0800, Oliver Sang wrote:
> hi, Paul,
> 
> On Tue, Oct 29, 2024 at 06:40:59AM -0700, Paul E. McKenney wrote:
> > On Tue, Oct 29, 2024 at 11:19:40AM +0800, kernel test robot wrote:
> > > tree:   https://github.com/paulmckrcu/linux dev.2024.10.27b
> > > head:   452a4107123b99087cd0bed226f61436ca9fdd24
> > > commit: 0074845ef7cfbfe41a72bf5561edc18b90b67504 [30/35] rcutorture: Check preemption for failing reader
> > > config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241029/202410291131.mflSojdy-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291131.mflSojdy-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202410291131.mflSojdy-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    In file included from mm/filemap.c:48:
> > >    include/linux/rcupdate_wait.h: In function 'has_rcu_reader_blocked':
> > > >> include/linux/rcupdate_wait.h:73:43: error: 'struct task_struct' has no member named 'rcu_node_entry'
> > >       73 |                 return list_empty(&current->rcu_node_entry);
> > >          |                                           ^~
> > > 
> > > 
> > > vim +73 include/linux/rcupdate_wait.h
> > > 
> > >     67	
> > >     68	// Has the current task blocked within its current RCU read-side
> > >     69	// critical section?
> > >     70	static inline bool has_rcu_reader_blocked(void)
> > >     71	{
> > >     72		if (IS_ENABLED(CONFIG_PREEMPT_RCU))
> > >   > 73			return list_empty(&current->rcu_node_entry);
> > >     74		else
> > >     75			return false;
> > >     76	}
> > >     77	
> > 
> > Ah, yes, ->rcu_nod_entry is not always defined.  Good catch, thank you!
> > 
> > Does the diff shown below fix things for you?
> 
> yes, it works.
> 
> below just in case you want it, if not necessary, please just ignore. thanks
> 
> Tested-by: kernel test robot <oliver.sang@intel.com>

Thank you!  I will apply this on my next rebase.

							Thanx, Paul

> > ------------------------------------------------------------------------
> > 
> > diff --git a/include/linux/rcupdate_wait.h b/include/linux/rcupdate_wait.h
> > index 5cfe7586a9f62..c51235d23ebdb 100644
> > --- a/include/linux/rcupdate_wait.h
> > +++ b/include/linux/rcupdate_wait.h
> > @@ -69,10 +69,11 @@ static inline void cond_resched_rcu(void)
> >  // critical section?
> >  static inline bool has_rcu_reader_blocked(void)
> >  {
> > -	if (IS_ENABLED(CONFIG_PREEMPT_RCU))
> > -		return list_empty(&current->rcu_node_entry);
> > -	else
> > -		return false;
> > +#ifdef CONFIG_PREEMPT_RCU
> > +	return list_empty(&current->rcu_node_entry);
> > +#else
> > +	return false;
> > +#endif
> >  }
> >  
> >  #endif /* _LINUX_SCHED_RCUPDATE_WAIT_H */
> > 
