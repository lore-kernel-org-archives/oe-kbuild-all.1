Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219765685
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 17:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F0BC433D2;
	Tue,  7 Feb 2023 17:41:44 +0000 (UTC)
Date: Tue, 7 Feb 2023 12:41:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] tracing/histogram: Wrap remaining shell snippets in
 code blocks
Message-ID: <20230207124142.17337fe0@gandalf.local.home>
In-Reply-To: <7370dc9a-8a14-4c38-028e-f44cd099dbaf@gmail.com>
References: <202301290253.LU5yIxcJ-lkp@intel.com>
	<20230129031402.47420-1-bagasdotme@gmail.com>
	<871qn8vsro.fsf@meer.lwn.net>
	<7370dc9a-8a14-4c38-028e-f44cd099dbaf@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 3 Feb 2023 16:19:41 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On 2/3/23 01:14, Jonathan Corbet wrote:
> > So this is a good cleanup and I'd like to apply it, but it doesn't come
> > close to applying to docs-next.  Which tree did you do this against?
> >   
> 
> for-next branch (linux-trace tree).
> 

I'll add this to my tree. Thanks!

-- Steve
