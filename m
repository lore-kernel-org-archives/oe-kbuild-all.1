Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E04810A09
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D932C433C8;
	Wed,  1 Nov 2023 20:44:17 +0000 (UTC)
Date: Wed, 1 Nov 2023 16:44:15 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra
 <peterz@infradead.org>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH] Fix: rseq uapi: Adapt header includes to follow glibc
 header changes
Message-ID: <20231101164415.7f198500@gandalf.local.home>
In-Reply-To: <f5bd06bb-da51-48c1-bf79-d1ef92802adf@efficios.com>
References: <20231025214811.2066376-1-mathieu.desnoyers@efficios.com>
	<202310271556.LunB8KLv-lkp@intel.com>
	<81d2fd04-572d-48cd-bb5c-9a77937a79a0@efficios.com>
	<20231027100641.52fbee5d@gandalf.local.home>
	<f5bd06bb-da51-48c1-bf79-d1ef92802adf@efficios.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 1 Nov 2023 16:10:04 -0400
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

> So what is the minimal change required to make things work on your 
> setup? I just tested with a Debian "testing" chroot (with libc 2.37-12) 
> and I cannot reproduce your issue.
> 
> Should I just submit a patch that removes "#include <asm/byteorder.h>" ? 
> I am really unsure which environments are affected though.
> 

I guess you can drop it :-p

When I tried to reproduce it with hand writing 'gcc', I couldn't. But when
I did:

 $ make foo

It gave me the error. I was confused for a bit. Then I looked at what my
Makefile was doing and what I was doing. The only difference was that the
make included:

   -I.

Removing that from the Makefile worked!

My Makefile added to the CFLAGS "-I." and I forgot that this directory has
a "linux/"  directory in it that I used years ago to test kernel functions.
The git history shows it was last touched in 2016 (when I was still at Red Hat)

Removing -I. now makes everything work.

I have no idea why it suddenly stopped working just a few months ago. Maybe
something was moved out of the gcc headers so my local headers no longer
see it. That is, perhaps the glibc headers moved something out and added a
#include to it, where my local headers did not have that change. I don't
know and I don't care.

Well, at least now I know why I was getting errors on my build, but
couldn't find anything on the internet showing why others were not!

Sorry for the noise. :-/

-- Steve

