Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729A3200115
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 16:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464942; cv=none; b=O6DVnZO9S9W8lsbV/BNrq4eRJf/CM5u0hwRBQj0pU2Lw3AZD/ThqTbpuURDvPD28GlLJqFXGiEtbCKCsRnETFf4I+a/XihdIZ6Ngg1cPP8sKaVdv4+89D/Cn/t5LtmkcDSbnI/zIMrjWZjRIiT1KmliQvFkbH01YoE6L8rpwXBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464942; c=relaxed/simple;
	bh=ecHvX3XZxyQNg7V0FzjSv5/uqnpnJ+UaZa5Y/NrCsEM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cnzZoRBsv2fgnuzMxZlfz562iltSEPBMQJo9Jv6ZfR8HbwiqzFO5dZHuvfJ/Z1dotQc+mBma0+ZSBGXgnmk4yWbM/lPuK0m6BnjBW1PQ7O9JTsZfZmOIHokrUPP6/W8TToDPwCj+NUavhBoEIkaSkenyhk06PsMMQCItv69HNhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE83C4CEE5;
	Thu, 13 Feb 2025 16:42:21 +0000 (UTC)
Date: Thu, 13 Feb 2025 11:42:31 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [rostedt-trace:pmem-on-reserve-mem-fail 2/10]
 kernel/trace/ring_buffer.c:1943:34: warning: variable 'bmeta' set but not
 used
Message-ID: <20250213114231.256e9845@gandalf.local.home>
In-Reply-To: <Z61hYOLmsekGHJfk@rli9-mobl>
References: <202502120851.VulVvSyg-lkp@intel.com>
	<20250211195421.69854975@gandalf.local.home>
	<Z61hYOLmsekGHJfk@rli9-mobl>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Feb 2025 11:05:04 +0800
Philip Li <philip.li@intel.com> wrote:

> Thanks Steve, by default, if the branch is named like below, it will be
> ignored.
> 
> 	.*experimental.*
> 	.*dont-build
> 
> If you prefer any customized branch name or pattern, you can also share
> with us, e.g. ".*-wip". We can configure the bot per your needs.

No need. If I knew about that, I would have used it.

Actually, you can just remove my personal tree altogether. All my real
tracing code goes to:

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git

But I only push stuff to:

  https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git/

That I want to share with someone and not something heading toward mainline
(at least not in that state).

So, you can just remove the rostedt/linux-trace.git tree from being tested.

Thanks,

-- Steve
