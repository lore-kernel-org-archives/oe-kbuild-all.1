Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51EDEEAB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Jul 2025 02:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753412283; cv=none; b=igZ/r8LX1DyiB6ucO2mPaB2MDAcZgL/O6waW8xhcSdAl+lUDSqwSDQSt4SU2yaPyh1gwV/JmuqpPg2A3lGrY9ZskRZWSql4XYzXLc3XH4lDeB6DE0jMBeLYIs3IZL+HFT9fOSM4ErAANB7XDMNCvo/MMARAt15xk6Guue1MqHbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753412283; c=relaxed/simple;
	bh=f/UMZbY8MC7A9ZUgJjvAh4CyHHxUWCBuESUtGELKnZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XSl6V77+KcTw1xKmNNUgOM3NHwAIDFV2GSkkcckZ+Rw0H7sO7ywEw4UG3/0qJk79zJiy9NT5iJ7QUyIbc3cXefmuoy2qT5Q8y67CH7Rg8wfWkEFtm3hkCTKf/19SfqHUo7SIL90da+my1gnX5qc03bzvpDhMgabKWiFlDrfe5pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 313E180318;
	Fri, 25 Jul 2025 02:57:53 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 8E26B20027;
	Fri, 25 Jul 2025 02:57:48 +0000 (UTC)
Date: Thu, 24 Jul 2025 22:57:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: kernel test robot <lkp@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 lukas@wunner.de, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 helgaas@kernel.org, ilpo.jarvinen@linux.intel.com, mattc@purestorage.com,
 Jonathan.Cameron@huawei.com, oe-kbuild-all@lists.linux.dev,
 tony.luck@intel.com, bp@alien8.de, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, oleg@redhat.com, naveen@kernel.org,
 davem@davemloft.net, anil.s.keshavamurthy@intel.com, mark.rutland@arm.com,
 peterz@infradead.org, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v9 2/2] PCI: trace: Add a RAS tracepoint to monitor link
 speed changes
Message-ID: <20250724225752.42af5c45@gandalf.local.home>
In-Reply-To: <4b41e3e2-ebac-48c3-b1a3-ce24a5bed475@linux.alibaba.com>
References: <20250723033108.61587-3-xueshuai@linux.alibaba.com>
	<202507240322.nJGdyXsy-lkp@intel.com>
	<20250724100659.697b5972@batman.local.home>
	<4b41e3e2-ebac-48c3-b1a3-ce24a5bed475@linux.alibaba.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: sss3io6n3hnw8p43h7pfm1f4x44m5jxe
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 8E26B20027
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19jcfMhVBqN8ygImD+nGXKd/1XxI6VLNn0=
X-HE-Tag: 1753412268-21638
X-HE-Meta: U2FsdGVkX1/MPnrqv2eLnEQVG0SZ4y+N9BHa2JgS74m3VvHFSDTZN8JNGPlQP+U89ajIGWgPuyUHqP5bppbe1owxH2xMB+wqWm4JjBTHpQWRyGoL0bXxdySjDa4OEdHrTt/ccSiLL3EZcM1wuAD68TH+IzV6GoRyyrUIGiBSusQxsle59ecfn+mIvYprxYFgQ1oDPYO/Z8c/EIKPtr3SVBRiCdMxnff8AJqAzKA0uz/5wXbKWwtAFzGGW47KsWaK6jvpAjbDEJZSIgLiJVJGTCJp6+8tomBqVuNiG3+ZVdeErH2S8L2mOHc4lSZugts4dUodwhaV9gFOI/oMAz1PLbzyr6NxwXQCEYkSPtTUwvAaGQV42Fsr/A==

On Fri, 25 Jul 2025 10:31:45 +0800
Shuai Xue <xueshuai@linux.alibaba.com> wrote:

> I'm leaning toward option 1 (dedicated trace.c file) as it's the
> cleanest approach and follows the pattern used in other subsystems. Does
> that sound reasonable to you?

That's fine, but make sure you have #ifdef CONFIG_FOO around tracepoints
that are only used when those configs are enabled, otherwise you will get
warnings.

Well, if they are exported, then the warnings are suppressed.

  https://lore.kernel.org/all/20250725025149.726267838@kernel.org/

-- Steve
