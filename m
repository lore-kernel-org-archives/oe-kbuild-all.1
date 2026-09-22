Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73F11D5CC9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Sep 2026 01:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040305; cv=none; b=C68MyMuix8TH2ciQ7V3z0KfDXML4YTyZznUlg8RtHE3/WtEsS3XetvXQCLWmsCf9JiQGc6oM+mLea5ZRcoFdPUlk+pKxR41TwN29tT14f3hQnneh0jn30FrVY/EjI+y6IEM3gZSkKbsWMFYuOZabx/iEfgqNuEOVwCRAKViuQTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040305; c=relaxed/simple;
	bh=GoCbFt+elcPC7bTibo4l5Kr1J5Gm3QQ34FOwodd8RUA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OHAZEBFamW7Lou6RNJH8jqi5ARwfQ/kjNdd51dYaCkjn7vm7O8RrYuZcV+6gbrlvDw+3fOzMcLLNm4XFQ1mY1L0nqlC17crfxbtZilDuRQVdFob1n53jpbe23na9qCmuDvEp1rS+CG3SZWE09lWdG+1crQqjnuXQrWP7keRBoTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6b81a95ab62411f19a56ed5b684f684d-20260922
X-CID-CACHE: Type:Local,Time:202609220848+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:30190655-5f71-487b-b8cd-7bd55c13da58,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:9c48c5bf07c5fb779eb17afad7f96dcc,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|865|898,TC:0,Content:0|14|50|9
	9,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6b81a95ab62411f19a56ed5b684f684d-20260922
X-User: lijun01@kylinos.cn
Received: from [172.30.70.202] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1102651531; Tue, 22 Sep 2026 09:24:56 +0800
Message-ID: <a7ba40bc-77f5-44f0-935e-16b9a6f5cb48@kylinos.cn>
Date: Tue, 22 Sep 2026 09:24:54 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: lijun <lijun01@kylinos.cn>
Subject: Re: [linux-next:master 7478/8449] drivers/char/tpm/tpm_tis.c:249:61:
 error: 'tpm_tis_resume' undeclared here (not in a function); did you mean
 'tpm_tis_remove'?
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <202609211540.IJG9MjgJ-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202609211540.IJG9MjgJ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I am sorry , the compilation issue was caused by my mistake.

and should we merge the fix patch and the original patch into one patch,

[PATCH v3] tpm: use DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().

2026/9/21 21:13, kernel test robot :
> tree:https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git  master
> head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
> commit: 69178fc202218a6da564f02dc5a2630dadbb7bf8 [7478/8449] tpm: use DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr()
> config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260921/202609211540.IJG9MjgJ-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260921/202609211540.IJG9MjgJ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot<lkp@intel.com>
> | Closes:https://lore.kernel.org/oe-kbuild-all/202609211540.IJG9MjgJ-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>      In file included from include/linux/kernel.h:35,
>                       from include/linux/random.h:7,
>                       from include/linux/nodemask.h:94,
>                       from include/linux/numa.h:6,
>                       from include/linux/cpumask.h:15,
>                       from arch/x86/include/asm/paravirt.h:19,
>                       from arch/x86/include/asm/irqflags.h:100,
>                       from include/linux/irqflags.h:18,
>                       from arch/x86/include/asm/special_insns.h:10,
>                       from arch/x86/include/asm/processor.h:25,
>                       from arch/x86/include/asm/timex.h:5,
>                       from include/linux/timex.h:67,
>                       from include/linux/time32.h:13,
>                       from include/linux/time.h:60,
>                       from include/linux/stat.h:19,
>                       from include/linux/module.h:13,
>                       from drivers/char/tpm/tpm_tis.c:19:
>>> drivers/char/tpm/tpm_tis.c:249:61: error: 'tpm_tis_resume' undeclared here (not in a function); did you mean 'tpm_tis_remove'?
>        249 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
>            |                                                             ^~~~~~~~~~~~~~
>      include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
>        136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
>            |                                            ^~~
>      include/linux/pm.h:316:19: note: in expansion of macro 'pm_sleep_ptr'
>        316 |         .resume = pm_sleep_ptr(resume_fn), \
>            |                   ^~~~~~~~~~~~
>      include/linux/pm.h:375:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
>        375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
>            |         ^~~~~~~~~~~~~~~~~~~
>      include/linux/pm.h:417:9: note: in expansion of macro '_DEFINE_DEV_PM_OPS'
>        417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
>            |         ^~~~~~~~~~~~~~~~~~
>      drivers/char/tpm/tpm_tis.c:249:8: note: in expansion of macro 'DEFINE_SIMPLE_DEV_PM_OPS'
>        249 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
>            |        ^~~~~~~~~~~~~~~~~~~~~~~~
> --
>      In file included from include/linux/kernel.h:35,
>                       from include/linux/random.h:7,
>                       from include/linux/nodemask.h:94,
>                       from include/linux/numa.h:6,
>                       from include/linux/cpumask.h:15,
>                       from arch/x86/include/asm/paravirt.h:19,
>                       from arch/x86/include/asm/irqflags.h:100,
>                       from include/linux/irqflags.h:18,
>                       from arch/x86/include/asm/special_insns.h:10,
>                       from arch/x86/include/asm/processor.h:25,
>                       from include/linux/sched.h:13,
>                       from include/linux/ratelimit.h:6,
>                       from include/linux/dev_printk.h:16,
>                       from include/linux/device.h:15,
>                       from include/linux/pnp.h:12,
>                       from drivers/char/tpm/tpm_infineon.c:15:
>>> drivers/char/tpm/tpm_infineon.c:615:61: error: 'tpm_inf_resume' undeclared here (not in a function); did you mean 'tpm_pm_resume'?
>        615 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_inf_resume);
>            |                                                             ^~~~~~~~~~~~~~
>      include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
>        136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
>            |                                            ^~~
>      include/linux/pm.h:316:19: note: in expansion of macro 'pm_sleep_ptr'
>        316 |         .resume = pm_sleep_ptr(resume_fn), \
>            |                   ^~~~~~~~~~~~
>      include/linux/pm.h:375:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
>        375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
>            |         ^~~~~~~~~~~~~~~~~~~
>      include/linux/pm.h:417:9: note: in expansion of macro '_DEFINE_DEV_PM_OPS'
>        417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
>            |         ^~~~~~~~~~~~~~~~~~
>      drivers/char/tpm/tpm_infineon.c:615:8: note: in expansion of macro 'DEFINE_SIMPLE_DEV_PM_OPS'
>        615 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_inf_resume);
>            |        ^~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +249 drivers/char/tpm/tpm_tis.c
>
>      248	
>    > 249	static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
>      250	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
