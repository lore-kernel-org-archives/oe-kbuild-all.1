Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EA78825
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 14:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B072C433A4;
	Fri, 10 Mar 2023 14:59:58 +0000 (UTC)
Date: Fri, 10 Mar 2023 09:59:56 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, oe-kbuild-all@lists.linux.dev, Masami
 Hiramatsu <mhiramat@kernel.org>, Douglas RAILLARD
 <douglas.raillard@arm.com>
Subject: Re: [PATCH] tracing: Error if a trace event has an array for a
 __field()
Message-ID: <20230310095956.0bab1790@gandalf.local.home>
In-Reply-To: <202303101645.28bnQoH2-lkp@intel.com>
References: <20230309221302.642e82d9@gandalf.local.home>
	<202303101645.28bnQoH2-lkp@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Mar 2023 16:37:09 +0800
kernel test robot <lkp@intel.com> wrote:

>    include/trace/events/rcu.h:771:17: note: in expansion of macro '__field'
>      771 |                 __field(char, rcutorturename[RCUTORTURENAME_LEN])
>          |                 ^~~~~~~

Awesome, it found the bug that this patch is suppose to find! :-)

The above needs to be changed to:

		__array(char, rcutorturename, RCUTORTURENAME_LEN)

And my patch will fail builds that have arrays in __field() macros.

Yes, I'm not going to apply this patch until the current bugs in the kernel
are fixed, because this patch will cause the kernel not to build if it has
this type of bug.

-- Steve
