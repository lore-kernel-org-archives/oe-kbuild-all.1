Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2611A4E98
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 19:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737143505; cv=none; b=m+GQ9Vnre4/JS5QRtk4bcit4uPiUK4yEWh2+kLvSMzHiVuu8IV2YZRR8MGw8laGhI30AYXlS5kybTloEqYdWD9gXO+pgumP14HoA1OLwRvrTji/mthPNqwQh6HyTxKCtrYeJt7iUdcS49MIJnHZQ9GGUy/eX9obLsNfsUk5y1ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737143505; c=relaxed/simple;
	bh=cqOu65gr+DaZgExus54LrhwixoubpIXd8fHdd0pNZdA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rzxEr6gkl4qB2aviRE50NS4nAbyVAyIJa4LKwwfRez6jfsO5sk4PZGMVjhyjvZfEPhkTNrum0wzHmr+4z96CPu44M6czCYbktoV7MLta6S9cAM2sMscV4pvxzBerJEckDF7frVZsKPrzbFYy6P+/IcO9kKdhagLVnT6iE0GXfOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CoMAjgZ/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CoMAjgZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737143502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnyLnGRtVQN2q1mNgotdRICNU0nfvlNZ9SAirRUqpu8=;
	b=CoMAjgZ/QUXUs198wJTHjQNwvHqrtcYIhC2keKBP6WUDNMfY34s0wqGXwZNj+UWxoEhbFP
	XpqweadSGkoRW3D96xFT9sIqFa0N9sICHUSwmlj0ysB1Q/pP6QxJ7JlwShWdSg6gB/B0Xj
	VJvbtg0x7uFuNiWxVeDnGPHw98Dx6xs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-2F6xW5oXO0yaNQFXtjQK-w-1; Fri, 17 Jan 2025 14:51:41 -0500
X-MC-Unique: 2F6xW5oXO0yaNQFXtjQK-w-1
X-Mimecast-MFC-AGG-ID: 2F6xW5oXO0yaNQFXtjQK-w
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8f14fc179so78203506d6.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 11:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737143500; x=1737748300;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnyLnGRtVQN2q1mNgotdRICNU0nfvlNZ9SAirRUqpu8=;
        b=uUbCJkSWsBLMvEtLrb6e6FO2/hb9HgRcauFJ3VhBO7iLrSN2+TAH+ytKooNJPR4ugm
         5nlFb8mPLSMU1lHGtDqZ7xYU5AuKt7ib/l+JkzyFzbyyhln1sqjo/GOQZ8moG/OliPED
         dtFQkXFjGmmLyt1irUx/R7ihhIsYuEnga1mYuDkigngrALpShchS5VMnGY2CEbTC099s
         NtL0AnjH1VPFaWPw8mKoWW1GtwqiXhBkWmm9twy0ltDqWZgrcbnv00c0H8w9+Dr7KIuX
         MoTGsTbQbGdv2s7zlgF7x9lcXzm5vmptsfKI2uruw2qCz/4Fx2sMRTe9xGfN7CZZp6jL
         d4sQ==
X-Gm-Message-State: AOJu0YxUYZyTMM1mlFOm1qwFzW1qCDnIkgCnfFj/YHIh/sxYjzayAT4l
	jn33z21685lDV8vZ6s1wyzoMsWggsEvpeSA3doI040lQB+WhYG04DFD+McDt1BjCbETMh7MfwMm
	YulYzfdYYiwqUSHSlqOa2CoSg9XXqxebmxmOyWctAUOg0jpsuFFT0rdklr8XFLkLSfafBJ3E=
X-Gm-Gg: ASbGncuFERbItRKCE31sdb6FVn/32DPGUzKuzJwVXV/NnkrvSVMaYjFLP41COdzEwdI
	fQdOMR8bBeRzK4BCUT6dfQg/tAemrJAOz1uU2Xfgj/OZlQ27BOrAjhAw013nCNDSJ/dubDMqplT
	nU49FN1AQ34T75wF9vgrfqIqoxqX18BEBT764LvUKFA0GcgYnq6qK96/1wAy0jOUz4w2j5rxcjq
	x5rJHLQnBGn6mtjOgeMZqXi4XtDuAeAVSxSRb2paVUH3wsUbaoZhY+I9oDUCj2pcFNUf8mYNjh4
	uFbAeNKQCP9vIjWVDLoxr/OSdcI=
X-Received: by 2002:a05:6214:29e3:b0:6d8:9838:d3a9 with SMTP id 6a1803df08f44-6e1b21c72f7mr54482546d6.26.1737143500389;
        Fri, 17 Jan 2025 11:51:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmgTKoDNg+mdRqxXapTpIigI8ztamLxf/H4UZA73IYIA2oKFLE/IE2jLXWZEeJM/Bkj5jLmg==
X-Received: by 2002:a05:6214:29e3:b0:6d8:9838:d3a9 with SMTP id 6a1803df08f44-6e1b21c72f7mr54482296d6.26.1737143500094;
        Fri, 17 Jan 2025 11:51:40 -0800 (PST)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afce3967sm14726306d6.99.2025.01.17.11.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 11:51:39 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <4ea9fbd6-dc6d-499e-9110-461ed0462309@redhat.com>
Date: Fri, 17 Jan 2025 14:51:38 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tj-cgroup:for-next 5/5] kernel/cgroup/cpuset-v1.c:397:18: error:
 implicit declaration of function 'cgroup_path_ns_locked'; did you mean
 'cgroup_path_ns'?
To: kernel test robot <lkp@intel.com>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
 Tejun Heo <tj@kernel.org>
References: <202501180315.KcDn5BG5-lkp@intel.com>
In-Reply-To: <202501180315.KcDn5BG5-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ryCUm-hFmdM8EESsnVeLd5RkISDXh7YKkxO-T6KS-yM_1737143501
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/17/25 2:45 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
> head:   03a12b026323247a320495fed3719d39cffdbe9b
> commit: 03a12b026323247a320495fed3719d39cffdbe9b [5/5] cgroup/cpuset: Move procfs cpuset attribute under cgroup-v1.c
> config: x86_64-buildonly-randconfig-006-20250118 (https://download.01.org/0day-ci/archive/20250118/202501180315.KcDn5BG5-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180315.KcDn5BG5-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501180315.KcDn5BG5-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     kernel/cgroup/cpuset-v1.c: In function 'proc_cpuset_show':
>>> kernel/cgroup/cpuset-v1.c:397:18: error: implicit declaration of function 'cgroup_path_ns_locked'; did you mean 'cgroup_path_ns'? [-Werror=implicit-function-declaration]
>       397 |         retval = cgroup_path_ns_locked(css->cgroup, buf, PATH_MAX,
>           |                  ^~~~~~~~~~~~~~~~~~~~~
>           |                  cgroup_path_ns
>     cc1: some warnings being treated as errors
>
>
> vim +397 kernel/cgroup/cpuset-v1.c
>
>     375	
>     376	#ifdef CONFIG_PROC_PID_CPUSET
>     377	/*
>     378	 * proc_cpuset_show()
>     379	 *  - Print tasks cpuset path into seq_file.
>     380	 *  - Used for /proc/<pid>/cpuset.
>     381	 */
>     382	int proc_cpuset_show(struct seq_file *m, struct pid_namespace *ns,
>     383			     struct pid *pid, struct task_struct *tsk)
>     384	{
>     385		char *buf;
>     386		struct cgroup_subsys_state *css;
>     387		int retval;
>     388	
>     389		retval = -ENOMEM;
>     390		buf = kmalloc(PATH_MAX, GFP_KERNEL);
>     391		if (!buf)
>     392			goto out;
>     393	
>     394		rcu_read_lock();
>     395		spin_lock_irq(&css_set_lock);
>     396		css = task_css(tsk, cpuset_cgrp_id);
>   > 397		retval = cgroup_path_ns_locked(css->cgroup, buf, PATH_MAX,
>     398					       current->nsproxy->cgroup_ns);
>     399		spin_unlock_irq(&css_set_lock);
>     400		rcu_read_unlock();
>     401	
>     402		if (retval == -E2BIG)
>     403			retval = -ENAMETOOLONG;
>     404		if (retval < 0)
>     405			goto out_free;
>     406		seq_puts(m, buf);
>     407		seq_putc(m, '\n');
>     408		retval = 0;
>     409	out_free:
>     410		kfree(buf);
>     411	out:
>     412		return retval;
>     413	}
>     414	#endif /* CONFIG_PROC_PID_CPUSET */
>     415	
>
Now cpuset-v1.c needs to include "cgroup-internal.h".

Cheers,
Longman

