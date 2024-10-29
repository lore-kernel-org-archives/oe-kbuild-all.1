Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6845879F5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730209260; cv=none; b=BmYa2d25rAIR15WliIHuqr31xuH7oOiISqe2+OEMeTFhlgoB/TYZA/LP2nIz0nZnzUDDfjKQ7hA/wFsUT3g9UFNvT8APZ+y8SKU8W3LkkHrtavE9oQou/pS94Vf0P7GRIGG3+KQmXiatL3A+gJXfNKBB3XLXuvqiXaMklVWUTYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730209260; c=relaxed/simple;
	bh=+c/h6akvA6TvmQbw6cbZzllMdiCa5pVCV5JxnEmpmQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMtP9aRI80LdqKGRL0I+/WEr9W6esYjYQGqYULTKLOyfGdjnbqajpJj7iky2cl+oiJoBX3h25NPRNw6XbWNDMeZ3eBPh4ExrdDDOH/NFhGB3me803PoPSE06/qC5NEW6BmeNGO7mPaw+vjYnSDRTZsNJqtg0H0f23YPjnBU5Wws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9a930S3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9a930S3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D24AC4CEE3;
	Tue, 29 Oct 2024 13:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730209260;
	bh=+c/h6akvA6TvmQbw6cbZzllMdiCa5pVCV5JxnEmpmQE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=e9a930S3gk04m4Tcxqz7DgdFnEOR19VIPI7XG5/jKGJjoLGCOdFbGrV+IQkf2SDIx
	 X15wafOvTmIuxRxYcu6piXQdYJ6bruEpStBL3v87a60CBqb8ja7K707R/X1lSqU7PC
	 O7VLT+URAwF/AWyZYhCwY9h5r69PQGfGzju7g0UY1vHA+TUbL+LmgayvSjm512qHc6
	 OMeRUW8I9BNwsKvBuj9si8MODc7R8goUakTSP+laTfoAMVKA4AyqeafQfSR0vmFmbo
	 QiDeC5sN4Uy079qCoWuqIaYtWF12wRJkYRvWIqKnup8v/M8wlUWYydrjAKdGRzRzov
	 BlqHiIberr3ww==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D4093CE0A48; Tue, 29 Oct 2024 06:40:59 -0700 (PDT)
Date: Tue, 29 Oct 2024 06:40:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2024.10.27b 30/35]
 include/linux/rcupdate_wait.h:73:43: error: 'struct task_struct' has no
 member named 'rcu_node_entry'
Message-ID: <78daba3e-56b0-4081-a4ba-7e71936a387a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202410291131.mflSojdy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410291131.mflSojdy-lkp@intel.com>

On Tue, Oct 29, 2024 at 11:19:40AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2024.10.27b
> head:   452a4107123b99087cd0bed226f61436ca9fdd24
> commit: 0074845ef7cfbfe41a72bf5561edc18b90b67504 [30/35] rcutorture: Check preemption for failing reader
> config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241029/202410291131.mflSojdy-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291131.mflSojdy-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410291131.mflSojdy-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from mm/filemap.c:48:
>    include/linux/rcupdate_wait.h: In function 'has_rcu_reader_blocked':
> >> include/linux/rcupdate_wait.h:73:43: error: 'struct task_struct' has no member named 'rcu_node_entry'
>       73 |                 return list_empty(&current->rcu_node_entry);
>          |                                           ^~
> 
> 
> vim +73 include/linux/rcupdate_wait.h
> 
>     67	
>     68	// Has the current task blocked within its current RCU read-side
>     69	// critical section?
>     70	static inline bool has_rcu_reader_blocked(void)
>     71	{
>     72		if (IS_ENABLED(CONFIG_PREEMPT_RCU))
>   > 73			return list_empty(&current->rcu_node_entry);
>     74		else
>     75			return false;
>     76	}
>     77	

Ah, yes, ->rcu_nod_entry is not always defined.  Good catch, thank you!

Does the diff shown below fix things for you?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/include/linux/rcupdate_wait.h b/include/linux/rcupdate_wait.h
index 5cfe7586a9f62..c51235d23ebdb 100644
--- a/include/linux/rcupdate_wait.h
+++ b/include/linux/rcupdate_wait.h
@@ -69,10 +69,11 @@ static inline void cond_resched_rcu(void)
 // critical section?
 static inline bool has_rcu_reader_blocked(void)
 {
-	if (IS_ENABLED(CONFIG_PREEMPT_RCU))
-		return list_empty(&current->rcu_node_entry);
-	else
-		return false;
+#ifdef CONFIG_PREEMPT_RCU
+	return list_empty(&current->rcu_node_entry);
+#else
+	return false;
+#endif
 }
 
 #endif /* _LINUX_SCHED_RCUPDATE_WAIT_H */
