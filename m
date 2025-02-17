Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E45B21B199
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739808852; cv=none; b=SqJrz+pLZBriChPLsBKCfb2baQrulDG8ALB+FydPv71Kc1U4XsgMPGKMMCznCwYGLt7MiYDiJuckJR6tfl16PA7OunV6ieYBxpeWmZbpce6+zSqEGKojEiAVJ+UEKwMKHEJOqtBbpoYhhTAjrV+EPnonXGAtvOnREnR3K2oxsSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739808852; c=relaxed/simple;
	bh=akUOTszQECAfk5wWkmgPE+XFafA+foutz+ZYvawgm00=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OA2hduVDku3tiRaSQ3qItc9rMWfT2E6AmnJ5MJ91JljUYjdPfNoZWZiCOptaY8g1mSbFBKpt+kVHHoSqC5jrj/7Z3uYx5j2GsnVZv7xOekqp8DbyPjirXibmfSxY5jmDedfgnJntD4KNMc6X4hCRcXEs+MFLWKF37D5n1+uRQ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB7EC4CED1;
	Mon, 17 Feb 2025 16:14:11 +0000 (UTC)
Date: Mon, 17 Feb 2025 11:14:30 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [rostedt-trace:pmem-on-reserve-mem-fail 2/10]
 kernel/trace/ring_buffer.c:1943:34: warning: variable 'bmeta' set but not
 used
Message-ID: <20250217111430.243c3560@gandalf.local.home>
In-Reply-To: <Z663WSipAftBvIAx@rli9-mobl>
References: <202502120851.VulVvSyg-lkp@intel.com>
	<20250211195421.69854975@gandalf.local.home>
	<Z61hYOLmsekGHJfk@rli9-mobl>
	<20250213114231.256e9845@gandalf.local.home>
	<Z663WSipAftBvIAx@rli9-mobl>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Feb 2025 11:24:09 +0800
Philip Li <philip.li@intel.com> wrote:


> Got it, thanks for the info, I will remove this repo.
> 
> BTW: the 0day bot records 2 other repos from your side, do we need keep
> them or also remove?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest.git

Although I do use this to send code upstream, you don't need to test this
repo, because ktest is a user space tool. Unless you are using the ktest
code (tools/testing/ktest/ktest.pl), there's nothing changing there that
would affect the kernel.

> https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-kconfig.git

This one I would still keep. I use it to modify the build system some
times, and this can cause regressions in the build of the Linux kernel.
I seldom modify it though, as I don't touch the build system that often.

-- Steve
