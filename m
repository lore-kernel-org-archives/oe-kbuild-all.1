Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FE57E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 01:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243E4C4339B;
	Sun,  7 May 2023 01:37:03 +0000 (UTC)
Date: Sat, 6 May 2023 21:37:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Chris Zankel <chris@zankel.net>, Max Filippov
 <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org
Subject: Re: [stable:linux-5.10.y 127/9999] WARNING: modpost:
 vmlinux.o(.text.unlikely+0x25c0): Section mismatch in reference from the
 function trace_define_generic_fields() to the variable
 .init.data:initcall_level_names
Message-ID: <20230506213700.18ef20ec@rorschach.local.home>
In-Reply-To: <202305061834.71GPhELu-lkp@intel.com>
References: <202305061834.71GPhELu-lkp@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 6 May 2023 18:40:40 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Steven,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
> head:   f1b32fda06d2cfb8eea9680b0ba7a8b0d5b81eeb
> commit: 092a58f0d9ef5013ad3c197a9a5ecf2d7f797a88 [127/9999] tracing: Fix pid filtering when triggers are attached
> config: xtensa-randconfig-r016-20230430 (https://download.01.org/0day-ci/archive/20230506/202305061834.71GPhELu-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 12.1.0

Yes, this error still exists because it only happens with the xtensa
toolchain or config. The code that it is complaining about is in
generic code that should affect *all* architectures if a normal
function is referencing boot variables.

I'm guessing this may be a bug in the xtensa toolchain, or xtensa has
some strange requirements that I am unaware of.

Maybe it's doing some strange optimization and merges code together
that causes this error?

Perhaps in init/main.c where we have:

	trace_initcall_level(initcall_level_names[level]);

Which is a macro and created by TRACE_EVENT() of:

 TRACE_EVENT(initcall_level,

	TP_PROTO(const char *level),

	TP_ARGS(level),

	TP_STRUCT__entry(
		__string(level, level)
	),

	TP_fast_assign(
		__assign_str(level, level);
	),

	TP_printk("level=%s", __get_str(level))
);

And that __string() is a macro that does some more magic:

that this is causing the xtensa compiler issues. I also just noticed
that trace_define_generic_fields() is static, and looks to be only
called by event_trace_init_fields() which is __init. So perhaps that is
triggering this. Perhaps it is safe to make
trace_define_generic_fields() __init if it is only used by init
functions. But I have to look further into this.

Anyway, it looks to be a placebo bug and the only bug being fixed would
be to quiet this warning.

-- Steve


> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=092a58f0d9ef5013ad3c197a9a5ecf2d7f797a88
>         git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>         git fetch --no-tags stable linux-5.10.y
>         git checkout 092a58f0d9ef5013ad3c197a9a5ecf2d7f797a88
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202305061834.71GPhELu-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> << WARNING: modpost: vmlinux.o(.text.unlikely+0x243c): Section mismatch in reference from the function trace_printk_seq() to the variable .init.data:initcall_level_names
> >> WARNING: modpost: vmlinux.o(.text.unlikely+0x25c0): Section mismatch in reference from the function trace_define_generic_fields() to the variable .init.data:initcall_level_names  
> The function trace_define_generic_fields() references
> the variable __initdata initcall_level_names.
> This is often because trace_define_generic_fields lacks a __initdata
> annotation or the annotation of initcall_level_names is wrong.
> 

