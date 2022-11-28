Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90663A48B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Nov 2022 20:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F271C433C1;
	Mon, 28 Nov 2022 20:50:46 +0000 (UTC)
Date: Mon, 28 Nov 2022 15:50:44 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, oe-kbuild-all@lists.linux.dev, Ammar
 Faizi <ammarfaizi2@gnuweeb.org>, GNU/Weeb Mailing List
 <gwml@vger.gnuweeb.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Documentation/osnoise: escape underscore of NO_ prefix
Message-ID: <20221128155044.617f8416@gandalf.local.home>
In-Reply-To: <871bacc9-6c0b-9841-107e-da60a2c8e01e@kernel.org>
References: <202211240447.HxRNftE5-lkp@intel.com>
	<20221125034300.24168-1-bagasdotme@gmail.com>
	<871bacc9-6c0b-9841-107e-da60a2c8e01e@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Jon,

Care to take this?

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Thanks,

-- Steve


On Fri, 25 Nov 2022 19:16:56 +0100
Daniel Bristot de Oliveira <bristot@kernel.org> wrote:

> On 11/25/22 04:43, Bagas Sanjaya wrote:
> > kernel test robot reported unknown target name warning:
> > 
> > Documentation/trace/osnoise-tracer.rst:112: WARNING: Unknown target name: "no".
> > 
> > The warning causes NO_ prefix to be rendered as link text instead, which
> > points to non-existent link target.
> > 
> > Escape the prefix underscore to fix the warning.
> > 
> > Link: https://lore.kernel.org/linux-doc/202211240447.HxRNftE5-lkp@intel.com/
> > Fixes: 67543cd6b8eee5 ("Documentation/osnoise: Add osnoise/options documentation")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>  
> 
> Acked-by: Daniel Bristot de Oliveira <bristot@kernel.org>
> 
> Thanks!
> -- Daniel

