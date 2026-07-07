Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F4E3A874D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 19:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451349; cv=none; b=gtj5tpcvl1S3LKwdxM50gVH5ALh5lryzWAYEY0bzOVLLdBN2zuhCGcyd/ellnIrHnr/rSjcO8nyRKj4cCTWlD98GyKAMDAo7/xa20ufp8iZ43uGUgOeyIs09yQ5cDZqBu4HD6V0wCa9AMsiMB4nFhR6OWbYGW93004X+pA4SYC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451349; c=relaxed/simple;
	bh=qyweZ+31INMUvJEjaOBAdeD4WQU/laupE4lHZBMZrTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J53WOmxNWYlvdsc0Fk1+jn0W8rqTUH2ilZuiLV4LAvc+G06VGOq1dKb8sN5hRF/olgrK6OY7mtevbBR4hfaKc1TQJqnP/XplNMmm09KZndu/Q8czLgbaw2dfSlnTdBq0aIvBvSSaSpsGZKR1m9hn0Rb2vpeMQhMnnh6KW10nK3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net; spf=pass smtp.mailfrom=iogearbox.net; dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b=B1hVGUiw; arc=none smtp.client-ip=213.133.104.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iogearbox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iogearbox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iogearbox.net header.i=@iogearbox.net header.b="B1hVGUiw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=cXvsrQuSrGfEGD5snLszhJ/m29hP5ZHXiEo/BfYNzTI=; b=B1hVGUiw/L94Geo/OENqxpa2ob
	fGKrSAGb0eFvbJCiQydJ66FdnokMzypYqRJYBIv9dII7QMBDOEijc3yB4u1seGQ2vThrydp2KoTqC
	z+rS5toZkLy8/GzU0LX/QSAgkDnuZ3pPBx+5Cmrovfy4cdmD45tTuJwF9HCckXmwvXmVT5ttuy4yd
	vvdYJYHBGallwhZMJvvh/da3bfLp3zECjKWYE3nJZTFG3mKymOjkZjSjzfMuc62EUHK/IShnYvcAp
	2Hfn3qkF6CwyVUuiTiZuoktICTZgdKR4rkhpmqmC7hNt0PUGVM2b1LisL/NjFxBkiG8iCdF/JOYqK
	rgX8JL9g==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1whBA8-000HrI-2P;
	Tue, 07 Jul 2026 21:08:56 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1whBA7-000NuU-2h;
	Tue, 07 Jul 2026 21:08:56 +0200
Message-ID: <d7f0aa94-43e7-4890-b4e3-8a9d093a68af@iogearbox.net>
Date: Tue, 7 Jul 2026 21:08:55 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 4051/4300] kernel/bpf/task_iter.c:759:14:
 warning: variable 'mmput_needed' set but not used
To: kernel test robot <lkp@intel.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Puranjay Mohan <puranjay@kernel.org>
References: <202607080254.6qrH5NrH-lkp@intel.com>
Content-Language: en-US
From: Daniel Borkmann <daniel@iogearbox.net>
Autocrypt: addr=daniel@iogearbox.net; keydata=
 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
In-Reply-To: <202607080254.6qrH5NrH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)

On 7/7/26 8:47 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   5c73cd9f0819c1c44e373e3dabb68318b1de1a12
> commit: 311e11cfbfbf3bf8030de95b831d5c45766b847a [4051/4300] bpf: Fix use-after-free on mm_struct in bpf_find_vma()
> config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260708/202607080254.6qrH5NrH-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080254.6qrH5NrH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607080254.6qrH5NrH-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     kernel/bpf/task_iter.c: In function '____bpf_find_vma':
>>> kernel/bpf/task_iter.c:759:14: warning: variable 'mmput_needed' set but not used [-Wunused-but-set-variable=]
>       759 |         bool mmput_needed = false;
>           |              ^~~~~~~~~~~~

Sanghyun, I'm tossing the fix from bpf-next tree, please resubmit with the warning fixed.

> vim +/mmput_needed +759 kernel/bpf/task_iter.c
> 
>     752	
>     753	BPF_CALL_5(bpf_find_vma, struct task_struct *, task, u64, start,
>     754		   bpf_callback_t, callback_fn, void *, callback_ctx, u64, flags)
>     755	{
>     756		struct mmap_unlock_irq_work *work = NULL;
>     757		struct vm_area_struct *vma;
>     758		bool irq_work_busy = false;
>   > 759		bool mmput_needed = false;
>     760		struct mm_struct *mm;
>     761		int ret = -ENOENT;
>     762	
>     763		if (flags)
>     764			return -EINVAL;
>     765	
>     766		if (!task)
>     767			return -ENOENT;
>     768	
>     769		if (task == current) {
>     770			mm = task->mm;
>     771		} else {
>     772			/*
>     773			 * Foreign task: pin task->mm against a concurrent exit_mm().
>     774			 * Use trylock on alloc_lock instead of get_task_mm()'s
>     775			 * blocking task_lock() to avoid deadlocking the target task.
>     776			 */
>     777			if (!IS_ENABLED(CONFIG_MMU))
>     778				return -EOPNOTSUPP;
>     779			if (irqs_disabled())
>     780				return -EBUSY;
>     781			if (!spin_trylock(&task->alloc_lock))
>     782				return -EBUSY;
>     783			mm = task->mm;
>     784			if (mm && !(task->flags & PF_KTHREAD)) {
>     785				mmget(mm);
>     786				mmput_needed = true;
>     787			} else {
>     788				mm = NULL;
>     789			}
>     790			spin_unlock(&task->alloc_lock);
>     791		}
>     792		if (!mm)
>     793			return -ENOENT;
>     794	
>     795		irq_work_busy = bpf_mmap_unlock_get_irq_work(&work);
>     796	
>     797		if (irq_work_busy || !mmap_read_trylock(mm)) {
>     798			ret = -EBUSY;
>     799			goto out;
>     800		}
>     801	
>     802		vma = find_vma(mm, start);
>     803	
>     804		if (vma && vma->vm_start <= start && vma->vm_end > start) {
>     805			callback_fn((u64)(long)task, (u64)(long)vma,
>     806				    (u64)(long)callback_ctx, 0, 0);
>     807			ret = 0;
>     808		}
>     809		bpf_mmap_unlock_mm(work, mm);
>     810	out:
>     811	#ifdef CONFIG_MMU
>     812		if (mmput_needed)
>     813			mmput_async(mm);
>     814	#endif
>     815		return ret;
>     816	}
>     817	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

