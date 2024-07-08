Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78C714EC42
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 22:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720478241; cv=none; b=EXC1cccTl115UcZqzhapb+8AT85SWJNJHitsw+53oF1kjP/QUb2ua0Zpqa33gCCiJzdXjJfVVncrFdwdFdnLECblm2zHxLChjJWtPUCfkFjWucU0TPBdu1PoI7cw/ygAvYrva91s9Dwu8dPghG0l3ZFG/a/dKsWJ5cFPzPDuVK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720478241; c=relaxed/simple;
	bh=gW/J3hP8c0gkZojozpY+H5CmSP7s5WOn2nDpFXPGMSI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FETlbnJCY2arEa4Vpz2dV1x9dRvncwQFc2BsVTqnCu2ZgnYxOoQHFjJ5sd0Fi/4SNSQT/sza8CirIkgD97O0E7R7lAsGFZMCOm60nSqJYdU0gCCQag6I0WdPDz1/qMCuDAepxuquPwEUNBl/3l//m1kGkHoL7glSllWoZRFVMx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MH4Sl2g/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MH4Sl2g/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B48EC116B1;
	Mon,  8 Jul 2024 22:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720478240;
	bh=gW/J3hP8c0gkZojozpY+H5CmSP7s5WOn2nDpFXPGMSI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MH4Sl2g/udtu/q4oI+kvd9X/k8N2wbuDYVgAkBqa6+W6oXZonS4OjpmgfwFUirT2h
	 Z+7FO9HPpkhupytX9v2qQCeomaXeAYBtkRTNj6ZGyvh85GdcKS7n/GF1281vn9+gTW
	 D+vaW01XrlCL0jUfJhqj9urjMTzFt+QzkieDp20KxK8F6DUyRuDxXC7Qs+6ZATJbK+
	 rEGgu50osFFonPNKXCDlxCy3/dT7SsXz6dxx0AXaCb+hj+ErGgh5tl4VzIRqB0cWBg
	 tAitSQ2Y/3L4rY61iaapNI1ENFedbA4HPU/pTBVe7ozvKAGfu7k4OiSXgek1rebJWw
	 dRhgsSEu7m9hA==
Date: Tue, 9 Jul 2024 07:37:17 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Steven Rostedt (Google)"
 <rostedt@goodmis.org>
Subject: Re: [trace:probes/for-next 16/16]
 kernel/trace/trace_kprobe.c:810:21: warning: assignment to 'struct module
 *' from 'int' makes pointer from integer without a cast
Message-Id: <20240709073717.3cb33be27decc9ff393def13@kernel.org>
In-Reply-To: <202407070744.RcLkn8sq-lkp@intel.com>
References: <202407070744.RcLkn8sq-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 7 Jul 2024 07:58:29 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace probes/for-next
> head:   9d8616034f161222a4ac166c1b42b6d79961c005
> commit: 9d8616034f161222a4ac166c1b42b6d79961c005 [16/16] tracing/kprobes: Add symbol counting check when module loads
> config: arc-randconfig-001-20240707 (https://download.01.org/0day-ci/archive/20240707/202407070744.RcLkn8sq-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070744.RcLkn8sq-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407070744.RcLkn8sq-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    kernel/trace/trace_kprobe.c: In function 'validate_probe_symbol':
>    kernel/trace/trace_kprobe.c:810:23: error: implicit declaration of function 'find_module'; did you mean 'init_module'? [-Werror=implicit-function-declaration]
>      810 |                 mod = find_module(modname);
>          |                       ^~~~~~~~~~~
>          |                       init_module
> >> kernel/trace/trace_kprobe.c:810:21: warning: assignment to 'struct module *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      810 |                 mod = find_module(modname);
>          |                     ^
>    cc1: some warnings being treated as errors


Oops, find_module() is not exposed when CONFIG_MODULES=n...

Let me update it.

> 
> 
> vim +810 kernel/trace/trace_kprobe.c
> 
>    796	
>    797	static int validate_probe_symbol(char *symbol)
>    798	{
>    799		struct module *mod = NULL;
>    800		char *modname = NULL, *p;
>    801		int ret = 0;
>    802	
>    803		p = strchr(symbol, ':');
>    804		if (p) {
>    805			modname = symbol;
>    806			symbol = p + 1;
>    807			*p = '\0';
>    808			/* Return 0 (defer) if the module does not exist yet. */
>    809			rcu_read_lock_sched();
>  > 810			mod = find_module(modname);
>    811			if (mod && !try_module_get(mod))
>    812				mod = NULL;
>    813			rcu_read_unlock_sched();
>    814			if (!mod)
>    815				goto out;
>    816		}
>    817	
>    818		ret = validate_module_probe_symbol(modname, symbol);
>    819	out:
>    820		if (p)
>    821			*p = ':';
>    822		if (mod)
>    823			module_put(mod);
>    824		return ret;
>    825	}
>    826	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
