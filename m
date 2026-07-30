Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308F52FE074
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418093; cv=none; b=oMNIpmEaEBo2FCLf6ddU/9/tCEtaEIKjp9EOAzz/GTsFj77+vinvTUL7GP4aaPrYlLt1lOKApkP5JAfKFrlyEuqkFqDE7ywGCa18lb+8D+YDdtd1R0WpibvoEk6bwY7jgVwzx/7DsTCCB70Fx2iew9TCTEQHWqptdcJs5eWnnls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418093; c=relaxed/simple;
	bh=DLtepxdHNTrDoHKaU8A6SAaSKElG7xlHgFFQcWofWxs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YtqSy7mbGRDo1bpJX50sGgVV3uabYAutoT4tQtDuMIwFvJOZWXT4mKWsowSSwQ4ZznnCfKaVYIMaAgvTgEoTFnF9Fn7cawd7cFeJ/NW2sg6ifKdYa/XVTd4TcsSlIgRVvwGoXbA3DWj49anIeHpzZhwakxCuSrUxTHyNuj41Ms8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf02.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id D6F72A0100;
	Thu, 30 Jul 2026 13:28:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id 54B1980013;
	Thu, 30 Jul 2026 13:28:08 +0000 (UTC)
Date: Thu, 30 Jul 2026 09:28:45 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [trace:trace/core 16/16] WARNING: modpost: vmlinux: section
 mismatch in reference: trace_printk_init_buffers.part.0+0xc8 (section:
 .text.unlikely) -> initcall_level_names (section: .init.data)
Message-ID: <20260730092845.4b889ccb@gandalf.local.home>
In-Reply-To: <087e006b-d856-4307-8429-f8225273a785@gmail.com>
References: <202607291326.Dr0maCyu-lkp@intel.com>
	<20260729113613.7f6af519@gandalf.local.home>
	<087e006b-d856-4307-8429-f8225273a785@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 54B1980013
X-Stat-Signature: 8mtuti9s9hkhhc1cmh5o57xzm1znr1by
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+62sSmn8XcKpZRds9V9v6cUXbSOnKmjAY=
X-HE-Tag: 1785418088-683819
X-HE-Meta: U2FsdGVkX18Ptd/Ckk9KQxU5bKdIXrlmpmCx+9Kj5TPxOIV5MZ+Hee2i5eu7MnT/FDfslfT0t2HlveL/drtxu0I0dfzsvtr3oVAQQtgZ+pAHvWGAkgEkM9Nj48mwTuIxCFxxdY2V5WWuJsj101szeQb2M6vpRjF0Wb1LCuRYACHMNuXPiGeyMsU8iVlKvoH7pRTHIJCJtrhlPkfFoOQBkap4f6ml//s2/50XlX19XxMzUHc6bE99fyfLManLhyXTp18dCmO7VDjR0ySDd15G2GaoAd0kjtnegmEUcdJisyQK5s2q5CEClM/o4PFaFTbYGTGcdHqJ/YZSPmYWG21qRCF/y0qlpU4+

On Thu, 30 Jul 2026 14:04:20 +0700
Woradorn Laodhanadhaworn <woradorn.laon@gmail.com> wrote:

> I reproduced this locally with commit
> `c33330b2ec170dd38b3284a72bc6a07a49cc9a65`, and it also reports:
> 
> WARNING: modpost: vmlinux: section mismatch in reference:
> trace_printk_init_buffers.part.0+0xc8 (section: .text.unlikely) ->
> initcall_level_names (section: .init.data)
> 
> Then I tried the same configuration and reproduction steps with the parent
> commit, `b6ccdca8d11c28338776811f0b9024d92c4bedb4`. It doesn't report anything
> related to `modpost: vmlinux: section mismatch in reference:
> trace_printk_init_buffers.part`.

Did you do a "make mrproper" between both builds?

> 
> So it looks like this commit introduced the warning. I'm not sure where to look
> yet, but I'll dig into `modpost.c` to understand the root cause. If you have any 
> suggestions on where I should start looking, I'd really appreciate them.
> 
> Also, I'd like to ask how urgent this issue is. It might take me some time to
> find the root cause.

It's only a warning with the W=1 build. There's many other warnings there
too, so I don't think it's high priority.

Thanks,

-- Steve
