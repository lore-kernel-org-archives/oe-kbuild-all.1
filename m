Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93AF3218B9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758302119; cv=none; b=kg2/X14WtZueQmeYwCFZ7gtgIcwykrGFZAAMuZFclthygs5hJZWsWVe1H+T4pB8VrXrHx3R0W+mX2PAjF3G+wGpRnV6sVTp2f0XsAGXiK1QBGrOGEOXOJ5VLaYWKANbo1jF2xR6IyPgLuRTQDIYp8mLfRKmXEZRPxzcURug9aJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758302119; c=relaxed/simple;
	bh=6NJzYLwvu8nASPIPcrDCvyx2hqM3LYin66/94sR2rHM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aajRsNSTnNAVXQEXL0FeEMixiLJh5XeFMHp41NGsqdLgyghjn3qH6SxPTRtpstzq3+ZsFK6BZmLj0YuATGAR9P9Pmgqrai4rvC9SugBZkeHLzb7nqrbBf3lmgyUj8qfHLVRHCciK+KwVYjw9N7/YNQeWtZpvJSByiXBEJvqHBr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 4FD3A1DFDC7;
	Fri, 19 Sep 2025 17:15:13 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 5AAB319;
	Fri, 19 Sep 2025 17:15:11 +0000 (UTC)
Date: Fri, 19 Sep 2025 13:16:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 oe-kbuild-all@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: Add an option to show symbols in _text+offset
 for function profiler
Message-ID: <20250919131621.093295c8@gandalf.local.home>
In-Reply-To: <202509200000.EJ4InVti-lkp@intel.com>
References: <175826135058.101165.7219957344129610147.stgit@devnote2>
	<202509200000.EJ4InVti-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: meshqnsref5gf9mr6a5b3ehr6ya7yoe8
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 5AAB319
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+PMwtFbp3f3WJHRIweYHLKnPG8l8MxpuE=
X-HE-Tag: 1758302111-777223
X-HE-Meta: U2FsdGVkX1+IMK7HCcPXzbQ7tsmWuxy9LUmDGU8+Agzv++ChVn4H+bFVQs4YnUHH1WXtXt5zD3aW0l1QfxhL1ATUgm7018n86XJKLbaboSjf6ko5yqpDQgVdmQP7ZYZINyqW40wQm2yqTrRFYp8OzWeIBnDJOn07iK4tNrwII7lwaZ8ReoXj7iSot/nu6zZBvOuyijuerFde4elPo8t3fDl4dzWCLTu42DOwjuzEQaPqaxLLiZgRwvNgMW8H1bIvfa0aSnNy1gVWAy69+apuau0mzVEmZ5jsqBlBJt8OpynpreSmy6lU73qjOKXWXWnI/zpIahtzTGMz/Qjy7W3yrrTMmtSsuAQWhyPasRgT0THHrfptxL6TPdjc7G/0mIiBU35aK/sHpkbwMk8nxnuU9Wq9DzaYKD19ITk/mDy3wX1qjZkNyx31ZwC+H0XLlj+zNOIvXRMTRwwoDfWeVj6K5r/OyVZxCfJD

On Sat, 20 Sep 2025 01:09:52 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Masami,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on trace/for-next]
> [also build test ERROR on linus/master v6.17-rc6 next-20250918]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/tracing-Add-an-option-to-show-symbols-in-_text-offset-for-function-profiler/20250919-135733
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
> patch link:    https://lore.kernel.org/r/175826135058.101165.7219957344129610147.stgit%40devnote2
> patch subject: [PATCH] tracing: Add an option to show symbols in _text+offset for function profiler
> config: x86_64-buildonly-randconfig-002-20250919 (https://download.01.org/0day-ci/archive/20250920/202509200000.EJ4InVti-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200000.EJ4InVti-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509200000.EJ4InVti-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from kernel/trace/trace_sched_switch.c:15:
> >> kernel/trace/trace.h:1422:37: warning: left shift count >= width of type [-Wshift-count-overflow]  
>     1422 | #define C(a, b) TRACE_ITER_##a = (1 << TRACE_ITER_##a##_BIT)
>          |                                     ^~

Ouch! We need to make the option enum64 now!

-- Steve
