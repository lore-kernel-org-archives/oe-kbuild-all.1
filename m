Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92143215F4F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708055; cv=none; b=aXYml1bAA2ZTYjPeQNF0dGrhVsXnO2Nw+NmwCeFoGa/+iG2cKenA6Jixwd/nAYR5G8+p8BBib3vIxgXg1BERp3bwa1A3xVANrbmi3VdUH3PkHfhbqapAWucC/lvGNoH5Pf2VVBM93u3KbpUJgfavNIW3FEsY9F5ksl5a5OaYzms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708055; c=relaxed/simple;
	bh=MOuEpc/evqohKDsSNM9aH7b5E/dYl8v40NywnSX0Qd8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rzJky/ld4oleOmkhPsj2W0G/9x2sEIyKg0dBuNHu3cp7Fag/oeQTGc4oOqAf0YMdKPugaS7J7/yD5wYKPfzyws60tkdLuEn2M73FgkeJb6N45qLr5JTHWhqEBHrcapg1wkNzPhcGcngSqxfRGkLp7TfoA3/o5EmAWIaPFucTvuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946F6C4CECD;
	Fri, 20 Dec 2024 15:20:54 +0000 (UTC)
Date: Fri, 20 Dec 2024 10:21:37 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: kernel@openeuler.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [openeuler:openEuler-1.0-LTS 1336/1336]
 drivers/mmc/core/.tmp_core.o: warning: objtool: missing symbol for section
 .exit.text
Message-ID: <20241220102137.73764ef1@gandalf.local.home>
In-Reply-To: <202412201128.mwjfPZy6-lkp@intel.com>
References: <202412201128.mwjfPZy6-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Dec 2024 11:44:22 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
> head:   8fbcff0074ff9f93ea927547e99e1dde27ddc7c5

I don't have the above commit.

> commit: c3bc8fd637a9623f5c507bd18f9677effbddf584 [1336/1336] tracing: Centralize preemptirq tracepoints and unify their usage

That commit is from 4.19, and this is just triggering?

-- Steve

> config: x86_64-buildonly-randconfig-001-20241219 (https://download.01.org/0day-ci/archive/20241220/202412201128.mwjfPZy6-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201128.mwjfPZy6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412201128.mwjfPZy6-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/mmc/core/core.c:13:
>    include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'mmc_init': 'cold' [-Wmissing-attributes]
>      132 |         int init_module(void) __attribute__((alias(#initfn)));
>          |             ^~~~~~~~~~~
>    include/linux/module.h:115:41: note: in expansion of macro 'module_init'
>      115 | #define subsys_initcall(fn)             module_init(fn)
>          |                                         ^~~~~~~~~~~
>    drivers/mmc/core/core.c:2871:1: note: in expansion of macro 'subsys_initcall'
>     2871 | subsys_initcall(mmc_init);
>          | ^~~~~~~~~~~~~~~
>    drivers/mmc/core/core.c:2839:19: note: 'init_module' target declared here
>     2839 | static int __init mmc_init(void)
>          |                   ^~~~~~~~
>    include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'mmc_exit': 'cold' [-Wmissing-attributes]
>      138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
>          |              ^~~~~~~~~~~~~~
>    drivers/mmc/core/core.c:2872:1: note: in expansion of macro 'module_exit'
>     2872 | module_exit(mmc_exit);
>          | ^~~~~~~~~~~
>    drivers/mmc/core/core.c:2864:20: note: 'cleanup_module' target declared here
>     2864 | static void __exit mmc_exit(void)
>          |                    ^~~~~~~~
>    drivers/mmc/core/core.c:1343: warning: Function parameter or member 'mmc' not described in 'mmc_regulator_set_vqmmc'
>    drivers/mmc/core/core.c:1343: warning: Function parameter or member 'ios' not described in 'mmc_regulator_set_vqmmc'
>    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_hw_reset()+0x93: sibling call from callable instruction with modified stack frame
>    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_sw_reset()+0x93: sibling call from callable instruction with modified stack frame
>    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_wait_for_req_done()+0x86: sibling call from callable instruction with modified stack frame
>    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_do_erase()+0x9d: sibling call from callable instruction with modified stack frame
>    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_of_parse_voltage()+0x33: sibling call from callable instruction with modified stack frame
>    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_execute_tuning()+0x3c: sibling call from callable instruction with modified stack frame
>    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_set_uhs_voltage()+0x35: sibling call from callable instruction with modified stack frame
> >> drivers/mmc/core/.tmp_core.o: warning: objtool: missing symbol for section .exit.text  
> --
>    kernel/trace/trace_events_trigger.c:68: warning: Function parameter or member 'event' not described in 'event_triggers_call'
>    kernel/trace/trace_events_trigger.c:912: warning: Function parameter or member 'named_data' not described in 'set_named_trigger_data'
> >> kernel/trace/.tmp_trace_events_trigger.o: warning: objtool: missing symbol for section .init.text  
> 

