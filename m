Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8AF3570B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 16:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051406; cv=none; b=N9sh0lNmE0GBVwwfFSVnx8mvRfhBmihjJDLeM99rg41/vA30C3q3fbEz4KGZLBZQLqQtmNout7hbVIGbDlCrOS5O2KkdfeN7wW5vaUANp8OssZaG+jI79eCfY7Yk7fwUZnlqLm+oV3O+XgCZmvisr1VdRJTRt9UcVwnUhyUUa5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051406; c=relaxed/simple;
	bh=GGcvtz6vS7HzN0LByk40g6f3XD4BE8F6+0UPjUj0gZA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eFfrmk9PHafbqNLbOxbKPfZn/5n0unOqF2GM0VoCeCRRfSa9sbYIzLpzcdfkJTOOoM3qHH/YGLhZ/axNzPi1x4GSTMKxrFfC+pzQUmu0wi0uzgFTCvYcmzvJycap4KNcC4OJruTl1mRd1/NJv1lh5tpqyhtxJkpsiWiJ1d/BX78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id DDFC31397B5;
	Thu, 13 Nov 2025 16:29:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id 147E319;
	Thu, 13 Nov 2025 16:29:55 +0000 (UTC)
Date: Thu, 13 Nov 2025 11:30:10 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>,
 Steven Rostedt <rostedt@kernel.org>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [trace:latency/for-next 3/5]
 kernel/trace/rv/monitors/sleep/sleep.c:219:26: error: static declaration of
 'rv_sleep' follows non-static declaration
Message-ID: <20251113113010.71489d68@gandalf.local.home>
In-Reply-To: <c4bb3aa4a73c0ec815bdc30c104b6f90fae5ed39.camel@redhat.com>
References: <202511131948.vxi5mdjU-lkp@intel.com>
	<20251113130659-27597fbf-a991-4cfb-aaf5-de69100ed34d@linutronix.de>
	<c4bb3aa4a73c0ec815bdc30c104b6f90fae5ed39.camel@redhat.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 147E319
X-Stat-Signature: ofipgk7pnpnna6oy3ea7atwncuzzz59k
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18sV/MuWJrNfA8qDAeN21HzGuTedm9HVCk=
X-HE-Tag: 1763051395-334933
X-HE-Meta: U2FsdGVkX19Br9cRYac8ci1KERoL+E726K+q4aC64OxJHCYD4q4OOzuJ08PSawiy4dd0MVy8rv0oMnKQidny8T3X/oGbp0DP8HGJyc0F20IZRRRgF+LeikH3hJuUimnp45Axmj4TKUFXmxZVqaPlIs8mB0lRysNY1zH9YTUa+fd5A5PcrmEIQyGv5v7wPP3UMiFEqCluypw3EMKJKbvv5DQoXUXsVTgNUhvI0kGZpvWgScxT5sIsbpVLpyRhZ0TN1yu4lXT2dm3NUM4cZwmPvDQGr4JYpGGqcSBWdiUv51rl5Gf+w8vgsHeaUij5l5abDMEeyuISodVboYfQKHS673LsDvBa28pt

On Thu, 13 Nov 2025 14:17:25 +0100
Gabriele Monaco <gmonaco@redhat.com> wrote:

> The commit is already on linux-next, I guess the easiest thing is to send a fix
> commit on top of that and Steven can decide whether to squash it before sending
> it to Linus or leave it as it is.
> 
> I can handle this.

I like to treat linux-next as final, and seldom rebase unless there's a
major bug that needs a revert.

I'll pull in your patch directly.

Thanks,

-- Steve
