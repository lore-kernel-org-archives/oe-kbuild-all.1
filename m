Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94648A50
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739321656; cv=none; b=WjSLTFO6uqwFvz71Hvmsp1PvhhkIYwYMFTVx7KU0OFYRYuzB1OFwruNMUvWIfBt9rRF0A29Qm3brnUoutgN8pkdG84t85UXmzn2FWdZ/Alf+uN7PFgaLq3ShXxXDxqDDdcS3oc718YJ0rbIOXzmifXonFfJfO+oCkWg1cvshIEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739321656; c=relaxed/simple;
	bh=o2qlK/gKjHi4Z6dalipBUFt81mMcuSiSQlbmQK6zfvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NPMK8887JhvedtU1mDNwdKPiNi8FDnZBGdpLom4L5snNNijM8D7OsLmobqviBCsPkBnH3PkNLK3mc9t77VV6SWpKZhUZ593kR/YSAPRrQ1wTKdctJMPK8CPB21xjSl2jd1v3EDWq6MVSxqNJr70zxP470tKoEigSrKChJ0VXoMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295C2C4CEDD;
	Wed, 12 Feb 2025 00:54:16 +0000 (UTC)
Date: Tue, 11 Feb 2025 19:54:21 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [rostedt-trace:pmem-on-reserve-mem-fail 2/10]
 kernel/trace/ring_buffer.c:1943:34: warning: variable 'bmeta' set but not
 used
Message-ID: <20250211195421.69854975@gandalf.local.home>
In-Reply-To: <202502120851.VulVvSyg-lkp@intel.com>
References: <202502120851.VulVvSyg-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi,

I sometimes push WIP changes up to my repo to share with others that have
known issues in it. This branch being one of them. Is there any keyword
that I can add to the branch to make the kernel test robot not waste CPU
cycles on testing it?

Like: notest-my-wip-branch

or something?

Thanks,

-- Steve


On Wed, 12 Feb 2025 08:48:01 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git pmem-on-reserve-mem-fail
> head:   d877ee1b587be39c141df16a6f92efb0e90b30fd
> commit: 04e1e84239466de5fe5310ddc8899b8b404a5ccc [2/10] ring-buffer: Add buffer meta data for persistent ring buffer
> config: i386-buildonly-randconfig-002-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120851.VulVvSyg-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120851.VulVvSyg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502120851.VulVvSyg-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    kernel/trace/ring_buffer.c: In function 'rb_range_meta_init':
> >> kernel/trace/ring_buffer.c:1943:34: warning: variable 'bmeta' set but not used [-Wunused-but-set-variable]  
>     1943 |         struct ring_buffer_meta *bmeta;
>          |                                  ^~~~~
> 
