Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB637B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Dec 2022 13:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCD3C433D6;
	Sat,  3 Dec 2022 13:54:16 +0000 (UTC)
Date: Sat, 3 Dec 2022 08:54:13 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH] Documentation/osnoise: escape underscore of NO_ prefix
Message-ID: <20221203085413.6556add4@gandalf.local.home>
In-Reply-To: <877cz8pyf8.fsf@meer.lwn.net>
References: <202211240447.HxRNftE5-lkp@intel.com>
	<20221125034300.24168-1-bagasdotme@gmail.com>
	<871bacc9-6c0b-9841-107e-da60a2c8e01e@kernel.org>
	<20221128155044.617f8416@gandalf.local.home>
	<877cz8pyf8.fsf@meer.lwn.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 03 Dec 2022 03:35:39 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> Steven Rostedt <rostedt@goodmis.org> writes:
> 
> > Jon,
> >
> > Care to take this?
> >
> > Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>  
> 
> I was about to, but it doesn't apply here.  The problem being fixed
> seemingly came in through your tree and currently only exists in
> linux-next, so I think you need to apply it.

Thanks, I'll take it then.

-- Steve
