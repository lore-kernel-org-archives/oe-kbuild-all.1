Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A56142E77
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 07:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719904113; cv=none; b=HyoOEEphdIwoNKqjLXhxtINycncr1mOBeKBJiZ7+LXT7jZ0C92iO5HApWdLFb/+0zj1doZ1PgHww6yh+wS4phE8N/9OtzJxJ7WBlV3gln7xcvvjI1F+Pf7T2M1GnyV9ffFRThPUF/rAKCs9WnUWnh3Dcwe+22pUIgBF42lAgCq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719904113; c=relaxed/simple;
	bh=Ur2WdYFv11AEMZcdkngitKXmsqaeUBQLwLAbHMfofqQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SLMdmq0GoYYipFNk5Xbp/TK3j8Wumr4guTimehFnWGz/G2IrIbld2uQoCH5qBaegvYcKErmFMlQtQqlMaoUZE92IX9VkHtt7aINyVG1B1IZpm687hdYc5kgX1ko5W1zjOLXNC3vR4vRsMejQbsbqQMEKd39Sq6ULn3fRBE+15O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zCqjEJTA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zCqjEJTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874AEC32781;
	Tue,  2 Jul 2024 07:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1719904112;
	bh=Ur2WdYFv11AEMZcdkngitKXmsqaeUBQLwLAbHMfofqQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zCqjEJTA8Q8sDzlE3fVnoXsW80nhlRcI9Dm1p2S/552hY2VlwTTqD7jnz/rySzkQA
	 VDXmtjY1Re0VLgqA+IjGlavO+LLTCRsaaHlFVzZm4z7B3HbZxWtwVxzITW+RE4Hbly
	 QmQp/e3dDhs5/LiiKQT5wgYtCMZazsjrp+0pYkf4=
Date: Tue, 2 Jul 2024 00:08:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Oleg Nesterov <oleg@redhat.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 9279/9689] kernel/exit.c:451:17: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-Id: <20240702000831.718e9f9f7ebf335b02b24273@linux-foundation.org>
In-Reply-To: <202406300417.JH4krMMP-lkp@intel.com>
References: <202406300417.JH4krMMP-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Jun 2024 04:27:24 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   1eb586a9782cde8e5091b9de74603e0a8386b09e
> commit: acb1a1ec810808c964c21524c1c521c3f75d2f2d [9279/9689] memcg: mm_update_next_owner: kill the "retry" logic
> config: i386-randconfig-061-20240629
> compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
> reproduce (this is a W=1 build):
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406300417.JH4krMMP-lkp@intel.com/
> 
> >> kernel/exit.c:451:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *volatile @@     got struct task_struct *tsk @@

That's

		WRITE_ONCE(mm->owner, tsk);

and mm->owner indeed has __rcu.  This is a cut-n-paste of existing
code, so things didn't get worse.

We should use rcu_assign_pointer(), but how that interacts with the
requirement to use WRITE_ONCE() needs some thought.
