Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED05293B73
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753881442; cv=none; b=R8NmD7TLHW/7Vtyd3QpP1C4P060w40svJPbtCmNsAEb/XepUDoWpETSYcT33ZkUWJOuhyT3TNPXRdz3fracd0qzPg+XJfBWghQE1n5r+usgVQIM5dZRu2UEkXUUw4amwnCh0X4jEqPknhkhxGNXG6Lp7aIFJQf3Qmxh8Cdr9GsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753881442; c=relaxed/simple;
	bh=34EoyFPHssGlWKOPhqay4i9jGB2wFeTY2XUoW+cUFRs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pga5y9rlG39g7jWkqPSa+s2J/Nr7cVdl/OpINDYKeWtgIvG/gNq56AaxC7f8Rg2g/1+RhEbFva4dxGtkiaH5HslGPDWcYjdD1vtYjxtjAV6fb4YMbu+jkrBI21ZujGdpGEfMw52+JZtzNr4xlt4ZLH+NojUyo9mpnlC5fNXdJUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id D242A113F8C;
	Wed, 30 Jul 2025 13:17:13 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id 3AD612002A;
	Wed, 30 Jul 2025 13:17:11 +0000 (UTC)
Date: Wed, 30 Jul 2025 09:17:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Namhyung Kim <namhyung@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 1/2] tracing: Have eprobes have their own config
 option
Message-ID: <20250730091727.7b3a8b96@gandalf.local.home>
In-Reply-To: <20250730191101.7e6203f21b94c3f932fa8348@kernel.org>
References: <20250729161912.056641407@kernel.org>
	<202507301452.JPAcMvT0-lkp@intel.com>
	<20250730191101.7e6203f21b94c3f932fa8348@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3AD612002A
X-Stat-Signature: x5kmfoc9dirxwaqpen1a8dee8h1esq1n
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX182DQPiz/lC1rskcX/IUATdlgupZxnzmOs=
X-HE-Tag: 1753881431-485616
X-HE-Meta: U2FsdGVkX1/tPPiWpHI8TYw/1NhA5gPWAauOdQvPprILSBnwk+q/t5ftSbAYUXxv6duh04/2u8XgpwEVTm97EKr3RqK9rFetyzYWCLkx4MhSOL6CIrUsELFdMFCdO0ZmzZySUbgS1bUJM5/YYH5yVPJXkNz0FCcbgCLXNEADS/MzibX38qEYwIeE0zwYbz8Z+Zc7rotswMFhc6T/fcPlSS3AsgTrJvVouI775ZBdzGz4g12a5Ab4PxjVUe6NFoC+ui6wjNeKUgaXkcWUfbnc9dPNip2TuznSm6bi8LuLos7h029XFcsQ13ky572sJayDcI0+m2CczjshmB4SCeKwxz5IYfvGXHX4

On Wed, 30 Jul 2025 19:11:01 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> Interesting, this find another issue. Since this is provided by
> CONFIG_PROBE_EVENTS, we need to fix CONFIG_PROBE_EVENTS depending
> on HAVE_REGS_AND_STACK_ACCESS_API.
> 
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index a3f35c7d83b6..cd239240b0ef 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -792,6 +792,7 @@ config DYNAMIC_EVENTS
>         def_bool n
>  
>  config PROBE_EVENTS
> +       depends on HAVE_REGS_AND_STACK_ACCESS_API
>         def_bool n
>  
>  config BPF_KPROBE_OVERRIDE

OK, I'll send a v2.

Did you want to take this in the tracing pull request?

I see you already did the probe pull request.

-- Steve
