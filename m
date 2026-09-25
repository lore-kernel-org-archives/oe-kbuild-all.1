Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8D336C9CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347632; cv=none; b=sd5G+lyf/CKMw7e1vdF4KH6gtnIXqlySIoe/aV+zKYvgOlnv0Begn/r8fUswOoSBEnNrFzsnu7NCBWmJ7yJH0Ea8bhgPnTM30rRlIbrupKNrK0lxX35x416vUfSQlcnOOxX/qjxTN1BOIxQ72E7hQsD1BRYvnWmS0LLYXf9ZjQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347632; c=relaxed/simple;
	bh=7jYM5g/CT5rpqAHADTit3qfL12+qExv/3kPKS1B5EiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFct3WDnHSZLehns+kjZM1ZOOH1VgYSBd+0M/MkKcXzhDsGFIh+EKuFGRKPPAgh5iGpqeYS0420Cm78WKGmPe1aT91aAxRhgGDrbk59h3Qk+59hF2mbgdi6CRXhKMbfKW7TtDZBxgN8l52VzVb44qkStLBJGIK9i3d1xMsPspJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBHLqow9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBHLqow9"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5A0FC1F000FF;
	Fri, 25 Sep 2026 14:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790347629;
	bh=Bb4ppi8Jj9s+dFedKYaOZAcZzTdxu3kGve4Q4lEoGpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aBHLqow9ngk0aiXdLpDOipy2wmXMkdT4iFxlL+UCl3RJu/1g1c9KRVpMnlt2r73Oi
	 ZZAb1Teh8SMUxRRT3IideLxmkMRb8PaHqCJKrlwhDYYhqrMgiFNU4kj6Wb8G7XPkRj
	 hPTPMUIefznwSZHF7KPCQgyVI6KH6cmmkL2uUqhDNME90V/npgmUM7PkSX51FgK2Lv
	 YPM7oIJWl1y8/grM2xgxf1h6J9VZOkIO+YOm0wyvy0macqK5P3KDcg0m01eVFK0qta
	 vgqeuJ/1HBsW6Ry4EwJa+K4DNPZm77Mm8i4TL64vhu2W5Dqm7efT4VvQXFpHWAn/X9
	 19Aj+NsZkEqQw==
Date: Fri, 25 Sep 2026 17:47:06 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: lijun <lijun01@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 7478/8449] drivers/char/tpm/tpm_tis.c:249:61:
 error: 'tpm_tis_resume' undeclared here (not in a function); did you mean
 'tpm_tis_remove'?
Message-ID: <araJahBUUtwlLlUk@kernel.org>
References: <202609211540.IJG9MjgJ-lkp@intel.com>
 <a7ba40bc-77f5-44f0-935e-16b9a6f5cb48@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7ba40bc-77f5-44f0-935e-16b9a6f5cb48@kylinos.cn>

On Tue, Sep 22, 2026 at 09:24:54AM +0800, lijun wrote:
> I am sorry , the compilation issue was caused by my mistake.
> 
> and should we merge the fix patch and the original patch into one patch,
> 
> [PATCH v3] tpm: use DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().
> 
> 2026/9/21 21:13, kernel test robot :
> > tree:https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git  master
> > head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
> > commit: 69178fc202218a6da564f02dc5a2630dadbb7bf8 [7478/8449] tpm: use DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr()
> > config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260921/202609211540.IJG9MjgJ-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260921/202609211540.IJG9MjgJ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot<lkp@intel.com>
> > | Closes:https://lore.kernel.org/oe-kbuild-all/202609211540.IJG9MjgJ-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >      In file included from include/linux/kernel.h:35,
> >                       from include/linux/random.h:7,
> >                       from include/linux/nodemask.h:94,
> >                       from include/linux/numa.h:6,
> >                       from include/linux/cpumask.h:15,
> >                       from arch/x86/include/asm/paravirt.h:19,
> >                       from arch/x86/include/asm/irqflags.h:100,
> >                       from include/linux/irqflags.h:18,
> >                       from arch/x86/include/asm/special_insns.h:10,
> >                       from arch/x86/include/asm/processor.h:25,
> >                       from arch/x86/include/asm/timex.h:5,
> >                       from include/linux/timex.h:67,
> >                       from include/linux/time32.h:13,
> >                       from include/linux/time.h:60,
> >                       from include/linux/stat.h:19,
> >                       from include/linux/module.h:13,
> >                       from drivers/char/tpm/tpm_tis.c:19:
> > > > drivers/char/tpm/tpm_tis.c:249:61: error: 'tpm_tis_resume' undeclared here (not in a function); did you mean 'tpm_tis_remove'?
> >        249 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
> >            |                                                             ^~~~~~~~~~~~~~
> >      include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
> >        136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
> >            |                                            ^~~
> >      include/linux/pm.h:316:19: note: in expansion of macro 'pm_sleep_ptr'
> >        316 |         .resume = pm_sleep_ptr(resume_fn), \
> >            |                   ^~~~~~~~~~~~
> >      include/linux/pm.h:375:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
> >        375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
> >            |         ^~~~~~~~~~~~~~~~~~~
> >      include/linux/pm.h:417:9: note: in expansion of macro '_DEFINE_DEV_PM_OPS'
> >        417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
> >            |         ^~~~~~~~~~~~~~~~~~
> >      drivers/char/tpm/tpm_tis.c:249:8: note: in expansion of macro 'DEFINE_SIMPLE_DEV_PM_OPS'
> >        249 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
> >            |        ^~~~~~~~~~~~~~~~~~~~~~~~
> > --
> >      In file included from include/linux/kernel.h:35,
> >                       from include/linux/random.h:7,
> >                       from include/linux/nodemask.h:94,
> >                       from include/linux/numa.h:6,
> >                       from include/linux/cpumask.h:15,
> >                       from arch/x86/include/asm/paravirt.h:19,
> >                       from arch/x86/include/asm/irqflags.h:100,
> >                       from include/linux/irqflags.h:18,
> >                       from arch/x86/include/asm/special_insns.h:10,
> >                       from arch/x86/include/asm/processor.h:25,
> >                       from include/linux/sched.h:13,
> >                       from include/linux/ratelimit.h:6,
> >                       from include/linux/dev_printk.h:16,
> >                       from include/linux/device.h:15,
> >                       from include/linux/pnp.h:12,
> >                       from drivers/char/tpm/tpm_infineon.c:15:
> > > > drivers/char/tpm/tpm_infineon.c:615:61: error: 'tpm_inf_resume' undeclared here (not in a function); did you mean 'tpm_pm_resume'?
> >        615 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_inf_resume);
> >            |                                                             ^~~~~~~~~~~~~~
> >      include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
> >        136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
> >            |                                            ^~~
> >      include/linux/pm.h:316:19: note: in expansion of macro 'pm_sleep_ptr'
> >        316 |         .resume = pm_sleep_ptr(resume_fn), \
> >            |                   ^~~~~~~~~~~~
> >      include/linux/pm.h:375:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
> >        375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
> >            |         ^~~~~~~~~~~~~~~~~~~
> >      include/linux/pm.h:417:9: note: in expansion of macro '_DEFINE_DEV_PM_OPS'
> >        417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
> >            |         ^~~~~~~~~~~~~~~~~~
> >      drivers/char/tpm/tpm_infineon.c:615:8: note: in expansion of macro 'DEFINE_SIMPLE_DEV_PM_OPS'
> >        615 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_inf_resume);
> >            |        ^~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > 
> > vim +249 drivers/char/tpm/tpm_tis.c
> > 
> >      248	
> >    > 249	static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
> >      250	
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki

Please sanity check the commit with squashed fixes from my tree.

Br, Jarkko
