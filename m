Received: from va-2-115.ptr.blmpb.com (va-2-115.ptr.blmpb.com [209.127.231.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0953A9DA1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 06:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036779; cv=none; b=czGAoaSzonS3c7uPuTLm7SfZeghffUppki9rieUbD1F4JmnquuU+GwDH1Tl5Q1NSi8EIJLn74/OxDVbV9soxJzGndSr7X3X+W6W47KNZIUsR57s8Ol3GUfSYCzKd7go7pF5KB/YEd3EFROqUsotatf/NlNQkISNdPLUvZ9Z5ZBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036779; c=relaxed/simple;
	bh=AlOg1oR8IXqMRTwkdxPxwcoRI7qC1sl/KDGrpRTmnvY=;
	h=References:Content-Type:In-Reply-To:From:Subject:To:Cc:Date:
	 Message-Id:Mime-Version; b=E1oL5ltEtfLr3aLJNQwKDgb54P0hwya3OxAsnzVGj8aBg9SvUVlVKYmWPeuC6PiOjIq8FtgOPAQTr1Muw17KyrcBH216DHc9xx4FAceQ3KCtT7+M3pAjA5HwD+IO08Vwh/PBIy0UODVJZwWZMCe8SOEkfV29HOGz4VhzoAQeJbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=aFXAvM/s; arc=none smtp.client-ip=209.127.231.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="aFXAvM/s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1780036763; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=XzW3F6CsLR0UAm+3hG2ux5GBKP33UPCEJhu7hKH3KUU=;
 b=aFXAvM/sABgSxnVn3yyONEtK5GSDDQr0bcr5IOEZkSzDqNtCUEIsmfar2ftVeEOOrc1DOA
 IZrvBtEJONqWK+xjicPYAeuSFyuGEM1kYstelSUTtp2C7wV2RrWg8IeQsuxvo891JLNz1E
 fXjnRATaWAVZ9v0tqKpYAeDtYUJOfWCU7X3x1hae04VIDkMTptFbUEZw34WGBQL69d94aT
 LXcyqIOBs7DctQLA/JMZu44Qdq4RQFWRwqUjj/k4B++7cBbfpL1kPrvLOWKrebHERspwAb
 ZCxgyTPeMtmXknsSNW0whGETCFUJ1vBljZU/4AXKz+iIERbf1tBnNnTlsqpbrw==
References: <202605291433.OHkzEFaS-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <202605291433.OHkzEFaS-lkp@intel.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: Re: [bigeasy-staging:smp_call_function_any 4/12] kernel/smp.c:806:28: warning: assignment to 'cpumask_t *' {aka 'struct cpumask *'} from 'int' makes pointer from integer without a cast
User-Agent: Mozilla Thunderbird
To: "kernel test robot" <lkp@intel.com>
Cc: <oe-kbuild-all@lists.linux.dev>, 
	"Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Date: Fri, 29 May 2026 14:39:09 +0800
X-Lms-Return-Path: <lba+26a193499+746821+lists.linux.dev+zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Message-Id: <cff3a200-0473-48db-8027-435ff7832e42@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>

On 2026-05-29 2:26 p.m., kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git smp_call_function_any
> head:   cec01329013ce633ca5857f5bb9273e000fdc6cf
> commit: 98f51da91a96beeef4adf696e0c4f768fee75f33 [4/12] smp: Use task-local IPI cpumask in smp_call_function_many_cond()
> config: i386-buildonly-randconfig-003-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291433.OHkzEFaS-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291433.OHkzEFaS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291433.OHkzEFaS-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     kernel/smp.c: In function 'smp_task_ipi_mask_alloc':
>     kernel/smp.c:806:30: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
>       806 |         task->ipi_mask_ptr = kmalloc(cpumask_size(), GFP_KERNEL);
>           |                              ^~~~~~~
>           |                              mm_alloc
>>> kernel/smp.c:806:28: warning: assignment to 'cpumask_t *' {aka 'struct cpumask *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
>       806 |         task->ipi_mask_ptr = kmalloc(cpumask_size(), GFP_KERNEL);
>           |                            ^
>     kernel/smp.c: In function 'smp_task_ipi_mask_free':
>     kernel/smp.c:818:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
>       818 |         kfree(task->ipi_mask_ptr);
>           |         ^~~~~
>     cc1: some warnings being treated as errors
> 

V6 fixes this problem by explicitly including <linux/slab.h> in smp.c.

Thanks.

> 
> vim +806 kernel/smp.c
> 
>     800	
>     801	int smp_task_ipi_mask_alloc(struct task_struct *task)
>     802	{
>     803		if (static_branch_unlikely(&ipi_mask_inlined))
>     804			return 0;
>     805	
>   > 806		task->ipi_mask_ptr = kmalloc(cpumask_size(), GFP_KERNEL);
>     807		if (!task->ipi_mask_ptr)
>     808			return -ENOMEM;
>     809	
>     810		return 0;
>     811	}
>     812	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
