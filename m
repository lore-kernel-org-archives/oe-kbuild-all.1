Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D05343175
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 02:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791773222; cv=none; b=PYSpbFTA1dwZbXCyUcYWeGhuh8ZHrf20twMxTICH8ktJmBTL2FrEkfXpaYCdnBme50PHXV3SRuJkVPE7+JfHB3q+8OlCBhpxTSIpv5RB7syjaKlNSsgiUZ2kDWYH4BM/dZkLdGMXyWex+uX2/X7MXVDpvCK5rkWPMmNASunXYJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791773222; c=relaxed/simple;
	bh=PzBzGVL4MusuLhLbMH3U7Yqabf2eFPNlkkbhKbifZoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9W/WH37GC+Bjs0QY+3ma7Hf6UIw2TW5fXiHZPysgAczF1cD5Laa/LltmuraYnpPUBtspi/kvTDt5woufe6lZ/ZhXVRvo2uYkoOf8OVklSMhuDVkN5BRL1JodagrgBylGYNabi1Ot8NCESeaXiQG1RBem+PLHQHA+B46Oxg8tgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
X-UUID: 2a068ad6c5e711f19a56ed5b684f684d-20261012
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0850f42e-50a6-49f3-9940-5528d616a873,IP:0,U
	RL:0,TC:0,Content:13,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:13
X-CID-META: VersionHash:7db8b62,CLOUDID:8373cbb0e15cea657f10ba62e8dd5557,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|865|898,TC:nil,Content:4|15|50
	|99,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2a068ad6c5e711f19a56ed5b684f684d-20261012
X-User: lijun01@kylinos.cn
Received: from [172.30.70.202] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 122882875; Mon, 12 Oct 2026 10:46:45 +0800
Message-ID: <a82b8ca9-2de1-4be6-9940-dd2bda90fa8e@kylinos.cn>
Date: Mon, 12 Oct 2026 10:46:43 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7478/8449] drivers/char/tpm/tpm_tis.c:249:61:
 error: 'tpm_tis_resume' undeclared here (not in a function); did you mean
 'tpm_tis_remove'?
Content-Language: en-US
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <202609211540.IJG9MjgJ-lkp@intel.com>
 <a7ba40bc-77f5-44f0-935e-16b9a6f5cb48@kylinos.cn>
 <araJahBUUtwlLlUk@kernel.org>
From: lijun <lijun01@kylinos.cn>
In-Reply-To: <araJahBUUtwlLlUk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Yes, i had sanity check the commit, and compiled again.

  2026/9/25 22:47, Jarkko Sakkinen :

> On Tue, Sep 22, 2026 at 09:24:54AM +0800, lijun wrote:
>> I am sorry , the compilation issue was caused by my mistake.
>>
>> and should we merge the fix patch and the original patch into one patch,
>>
>> [PATCH v3] tpm: use DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().
>>
>> 2026/9/21 21:13, kernel test robot :
>>> tree:https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git  master
>>> head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
>>> commit: 69178fc202218a6da564f02dc5a2630dadbb7bf8 [7478/8449] tpm: use DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr()
>>> config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260921/202609211540.IJG9MjgJ-lkp@intel.com/config)
>>> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260921/202609211540.IJG9MjgJ-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot<lkp@intel.com>
>>> | Closes:https://lore.kernel.org/oe-kbuild-all/202609211540.IJG9MjgJ-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>       In file included from include/linux/kernel.h:35,
>>>                        from include/linux/random.h:7,
>>>                        from include/linux/nodemask.h:94,
>>>                        from include/linux/numa.h:6,
>>>                        from include/linux/cpumask.h:15,
>>>                        from arch/x86/include/asm/paravirt.h:19,
>>>                        from arch/x86/include/asm/irqflags.h:100,
>>>                        from include/linux/irqflags.h:18,
>>>                        from arch/x86/include/asm/special_insns.h:10,
>>>                        from arch/x86/include/asm/processor.h:25,
>>>                        from arch/x86/include/asm/timex.h:5,
>>>                        from include/linux/timex.h:67,
>>>                        from include/linux/time32.h:13,
>>>                        from include/linux/time.h:60,
>>>                        from include/linux/stat.h:19,
>>>                        from include/linux/module.h:13,
>>>                        from drivers/char/tpm/tpm_tis.c:19:
>>>>> drivers/char/tpm/tpm_tis.c:249:61: error: 'tpm_tis_resume' undeclared here (not in a function); did you mean 'tpm_tis_remove'?
>>>         249 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
>>>             |                                                             ^~~~~~~~~~~~~~
>>>       include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
>>>         136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
>>>             |                                            ^~~
>>>       include/linux/pm.h:316:19: note: in expansion of macro 'pm_sleep_ptr'
>>>         316 |         .resume = pm_sleep_ptr(resume_fn), \
>>>             |                   ^~~~~~~~~~~~
>>>       include/linux/pm.h:375:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
>>>         375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
>>>             |         ^~~~~~~~~~~~~~~~~~~
>>>       include/linux/pm.h:417:9: note: in expansion of macro '_DEFINE_DEV_PM_OPS'
>>>         417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
>>>             |         ^~~~~~~~~~~~~~~~~~
>>>       drivers/char/tpm/tpm_tis.c:249:8: note: in expansion of macro 'DEFINE_SIMPLE_DEV_PM_OPS'
>>>         249 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
>>>             |        ^~~~~~~~~~~~~~~~~~~~~~~~
>>> --
>>>       In file included from include/linux/kernel.h:35,
>>>                        from include/linux/random.h:7,
>>>                        from include/linux/nodemask.h:94,
>>>                        from include/linux/numa.h:6,
>>>                        from include/linux/cpumask.h:15,
>>>                        from arch/x86/include/asm/paravirt.h:19,
>>>                        from arch/x86/include/asm/irqflags.h:100,
>>>                        from include/linux/irqflags.h:18,
>>>                        from arch/x86/include/asm/special_insns.h:10,
>>>                        from arch/x86/include/asm/processor.h:25,
>>>                        from include/linux/sched.h:13,
>>>                        from include/linux/ratelimit.h:6,
>>>                        from include/linux/dev_printk.h:16,
>>>                        from include/linux/device.h:15,
>>>                        from include/linux/pnp.h:12,
>>>                        from drivers/char/tpm/tpm_infineon.c:15:
>>>>> drivers/char/tpm/tpm_infineon.c:615:61: error: 'tpm_inf_resume' undeclared here (not in a function); did you mean 'tpm_pm_resume'?
>>>         615 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_inf_resume);
>>>             |                                                             ^~~~~~~~~~~~~~
>>>       include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
>>>         136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
>>>             |                                            ^~~
>>>       include/linux/pm.h:316:19: note: in expansion of macro 'pm_sleep_ptr'
>>>         316 |         .resume = pm_sleep_ptr(resume_fn), \
>>>             |                   ^~~~~~~~~~~~
>>>       include/linux/pm.h:375:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
>>>         375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
>>>             |         ^~~~~~~~~~~~~~~~~~~
>>>       include/linux/pm.h:417:9: note: in expansion of macro '_DEFINE_DEV_PM_OPS'
>>>         417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
>>>             |         ^~~~~~~~~~~~~~~~~~
>>>       drivers/char/tpm/tpm_infineon.c:615:8: note: in expansion of macro 'DEFINE_SIMPLE_DEV_PM_OPS'
>>>         615 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_inf_pm, tpm_pm_suspend, tpm_inf_resume);
>>>             |        ^~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>>
>>> vim +249 drivers/char/tpm/tpm_tis.c
>>>
>>>       248	
>>>     > 249	static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
>>>       250	
>>>
>>> --
>>> 0-DAY CI Kernel Test Service
>>> https://github.com/intel/lkp-tests/wiki
> Please sanity check the commit with squashed fixes from my tree.
>
> Br, Jarkko
