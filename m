Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925B62288F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 11:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753962185; cv=none; b=smZ3rD+2dcdCLhrW2F5CN6Ori0lhYuokv/4p9QJRLL7L+kRPeJzR3WvPQp5MuMMANcoMTlf3xR8BszFQzL4UQC3G+LaVXHLqTmOVdvQ77V89xq17JVSgkX7VDOg2db0hQBPkpPh2L0HjeabUEe5siauwoG9UPPYwELFEfq3CFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753962185; c=relaxed/simple;
	bh=qWrWOnrFxmvlk/gulM72oTIARntU2LerRXBDnEsmhz0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sGCFjByGF0HTFnjN95TtRbmqGJ+PUFD2x6pClFgNaPc9/SJyRxrPLkbZ+whL5IV033YXLxU/ztKfVH9jtw2k2rf+G0jGPvXXQodvocwqBrOHYklDXotBzizjj9rwO236kzgQcAWDNYUUx0Kej91XcFCOmoAltYN6OE98BqW/Q80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 25FCE5AE12;
	Thu, 31 Jul 2025 11:43:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 649A22000E;
	Thu, 31 Jul 2025 11:42:58 +0000 (UTC)
Date: Thu, 31 Jul 2025 07:43:16 -0400
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
Message-ID: <20250731074316.01372681@gandalf.local.home>
In-Reply-To: <20250731070836.69c43401858db35dd3b43ff0@kernel.org>
References: <20250729161912.056641407@kernel.org>
	<202507301452.JPAcMvT0-lkp@intel.com>
	<20250730191101.7e6203f21b94c3f932fa8348@kernel.org>
	<20250730091727.7b3a8b96@gandalf.local.home>
	<20250730225722.c88d2dbd3dfa07310de7edd4@kernel.org>
	<20250730100155.268d2442@gandalf.local.home>
	<20250731070836.69c43401858db35dd3b43ff0@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: eamgt8m16dyjxneimeu1i7pdo8cbqd71
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 649A22000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/2QzxW4XVvfLrsFIwKaHhcoGCASP1Aksc=
X-HE-Tag: 1753962178-872116
X-HE-Meta: U2FsdGVkX1947nv5PoTy5NutxctdkU/H9qclbFNhMbDa/Emfi9eh29SVV8qUTTOxJKouHXZcQ88Un7HHerBhmr8IAWIVbZmv/S6GXXI33owq+ZPkog30CDT5GZ77aBlObKXzxgmYSrd2eXytOamIOH1Hn7IFJMW3eD3yA/yHdKJXPMVgTQWXlegT6B+rdsdcshalXqiheuARp273GsvDUOiL0CNcXZ+y+IQySTMO4Dq+rHIM7ZolMg7ADr1GC8oocpktjM65YslXXNm428dyjDgkt7CAwItuTH9SESGIyQoeWvhqGeAz+CpPnPMcEidmFxHcQmZBQSMwZc9jeLErgM7XFSQefTMe

On Thu, 31 Jul 2025 07:08:36 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> > I still have the trace/for-next to push (I've finished testing your last
> > "attribute" patch and now I'm just letting it simmer in linux-next before
> > doing the pull request). I can still add this to that one if you want.
> >   
> 
> OK, could you push this to Linus?

Will do later today.

Thanks,

-- Steve
