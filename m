Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAA0746C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Nov 2022 15:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D64C433C1;
	Tue, 22 Nov 2022 15:30:44 +0000 (UTC)
Date: Tue, 22 Nov 2022 10:30:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
 Florent Revest <revest@chromium.org>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>
Subject: Re: [linux-next:master 8539/9537] include/linux/ftrace.h:126:16:
 error: implicit declaration of function 'arch_ftrace_get_regs'; did you
 mean 'ftrace_get_regs'?
Message-ID: <20221122103042.07c349ee@gandalf.local.home>
In-Reply-To: <Y3znIwkQQ6I1M9cF@FVFF77S0Q05N.cambridge.arm.com>
References: <202211212249.livTPi3Y-lkp@intel.com>
	<Y3u0t6eHjMbMdyUq@FVFF77S0Q05N.cambridge.arm.com>
	<20221121124015.31d34642@gandalf.local.home>
	<Y3znIwkQQ6I1M9cF@FVFF77S0Q05N.cambridge.arm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Nov 2022 15:13:39 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> To be honest, we just didn't think to remove static ftrace; I'm happy to remove
> that for arm64.

Please do. There's no reason for it. The *only* reason I keep it around on
x86 is to make sure it still works (for those other architectures
developing ftrace).

> 
> That said, I still think it makes sense to change the code to check 
> CONFIG_DYNAMIC_FTRACE_WITH_ARGS rather than
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS, as mentioned below, unless you intend for
> that to have an effect on static ftrace on x86?
> 
> Everywhere else with DYNAMIC_FTRACE_WITH_ARGS forces DYNAMIC_FTRACE, so it ends
> up equivalent; x86 and arm64 are the only exceptions today.

Yeah, looking at the code, I think it does make sense to just use
DYNAMIC_FTRACE_WITH_ARGS, as that was created to combine the other two
configs anyway.

-- Steve

