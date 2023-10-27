Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABD1358AD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926B9C433C8;
	Fri, 27 Oct 2023 14:06:44 +0000 (UTC)
Date: Fri, 27 Oct 2023 10:06:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra
 <peterz@infradead.org>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH] Fix: rseq uapi: Adapt header includes to follow glibc
 header changes
Message-ID: <20231027100641.52fbee5d@gandalf.local.home>
In-Reply-To: <81d2fd04-572d-48cd-bb5c-9a77937a79a0@efficios.com>
References: <20231025214811.2066376-1-mathieu.desnoyers@efficios.com>
	<202310271556.LunB8KLv-lkp@intel.com>
	<81d2fd04-572d-48cd-bb5c-9a77937a79a0@efficios.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Oct 2023 09:37:26 -0400
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

> On 2023-10-27 03:53, kernel test robot wrote:
> > Hi Mathieu,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on linus/master]
> > [also build test WARNING on v6.6-rc7 next-20231026]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]  
> 
> The test robot complains about using <asm/types.h> in uapi headers for 
> !__KERNEL__ case.
> 
> Steven, was there something wrong with including linux/types.h in uapi 
> headers ?
> 

Actually, linux/types.h includes asm/types.h so I don't think that was the
issue. I think the issue was mostly with:

 #include <asm/byteorder.h>

Replacing linux/types.h with asm/types.h worked, but may have been
unnecessary.

-- Steve
