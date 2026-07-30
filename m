Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E283438497
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418711; cv=none; b=L24fvnHiew2m+5rabJr2O3SE3DEdPqElqr5RuoRLOpzAImvA+pRYY3MskJ+NN3PKZu33Nv61C0VVHClxaUlNF6v8YjIqv3pRmbuxFrF5I0CXDy2sVxmmLLTKXJ5CliSzNxw+b7Lvq2CkVpqB//7kz+UAkgjcVByUg9LWRbFzgW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418711; c=relaxed/simple;
	bh=sD38O/JsxniPyvoZGY8hYIJypFGtPADkv7JfNERKV/E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SIQa2SA9GG5+Cbi4g8zDfTL2f8XdAO6zoffbe5EmfXbb4i8RrCKKoHkarOD9AWlKsgctj45wVvpvAqRo7/CcDd4LE8mnIRSKzgii0/cKFYJOSLNRgWFJR/LbuJwGyV7Q0oTrhn8p1bT1BdlnczwolFJkCMPb9Spkd3W1IMjJgxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 2586D16016A;
	Thu, 30 Jul 2026 13:38:29 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 93F2A2000E;
	Thu, 30 Jul 2026 13:38:27 +0000 (UTC)
Date: Thu, 30 Jul 2026 09:39:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [trace:trace/core 16/16] WARNING: modpost: vmlinux: section
 mismatch in reference: __list_add+0x7c (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <20260730093905.5dd11f1a@gandalf.local.home>
In-Reply-To: <202607301724.FWw4uuO3-lkp@intel.com>
References: <202607301724.FWw4uuO3-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 93F2A2000E
X-Stat-Signature: sodusoxfetc9q43xs5xybibjwr4yyaym
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19xPHYLn387JcQm6AFvQ/O9zDlx4R/vB34=
X-HE-Tag: 1785418707-821319
X-HE-Meta: U2FsdGVkX18wNibs3MOEzeyz5M/jwFMbNoSZRYGBthcJoNJarCWSnZ1+EJJhKoPjmYW4nWSGcnSBXLOnriw328u0q9GlK0QvipTrMOSmehvsaNDupHswY0ETik3Y+VE0XHUn8PQJh4FFB8NRG6nMm6I1Pr5eZzLIaLJFpL9m23/uhiK+I39iWsdkVLtu4q+UTc24sQQSYO5RjydlYfWYKINH89qnM7L1f6XKKrxpvjFgz2QAl/gX2zd/0x9WcXkZYEgR3ZJ12HdwwHsaK/XdXzXh+q0io9N+IlGRa04v28qhZtw/N6kVDsOLkNyyTZb0noOPUovqml0i26WBCN3Oi9JoC0/xe1jlb12HRsbv6fpOgYV73JQMjIkH7B4o8KpNO25N6hFAUIM9QPwmnkr0bb8NsDMsEoU/ML1VVVjYAlg=

On Thu, 30 Jul 2026 17:54:12 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/core
> head:   c33330b2ec170dd38b3284a72bc6a07a49cc9a65
> commit: c33330b2ec170dd38b3284a72bc6a07a49cc9a65 [16/16] tracing: Use seq_buf for string concatenation
> config: xtensa-randconfig-r072-20260730 (https://download.01.org/0day-ci/archive/20260730/202607301724.FWw4uuO3-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 13.4.0

If it's only with this compiler, then it's probably a bug with that cross
compiler. As the commit is to core kernel code, if it was a bug there, it
would show up across all compilers.

-- Steve
