Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CEE944B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 21:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212DDC433C8;
	Sat, 28 Oct 2023 21:10:02 +0000 (UTC)
Date: Sat, 28 Oct 2023 17:09:59 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Yujie Liu <yujie.liu@intel.com>
Cc: kernel test robot <lkp@intel.com>, Tom Zanussi <zanussi@kernel.org>,
 <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: kernel/trace/trace_kprobe.c:952: warning: Excess function
 parameter 'args' description in '__kprobe_event_gen_cmd_start'
Message-ID: <20231028170959.39ae1ea2@rorschach.local.home>
In-Reply-To: <ZTtIWZ/Ol3SuirV8@yujie-X299>
References: <202310190437.paI6LYJF-lkp@intel.com>
	<20231019092207.7d2fa545@gandalf.local.home>
	<ZTtIWZ/Ol3SuirV8@yujie-X299>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Oct 2023 13:19:21 +0800
Yujie Liu <yujie.liu@intel.com> wrote:
> 
> Hi Steven, the fix patch is sent at [1] to fix this kernel-doc warning.
> 
> [1] https://lore.kernel.org/all/20231027041315.2613166-1-yujie.liu@intel.com/
> 

Masami is now co-maintainer of the tracing subsystem and handles the
probes side of things. Looks like he's picking it up.

Thanks,

-- Steve

