Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FB523D7FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 02:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785465103; cv=none; b=PgY9fq/t6C7Hj1wOQjnflv7Y0yMLMnLB+oMBRFX/hX9TLJab4rKvC92USYLygfKvFrwf9IHuRTTCtXFXHGeq7wkBJYtvO58SAshKHZOGHTnf759AWebJlUA1EuQFreQr+ML6WLKKdoAEjUNB16G7wpM1aCITKZvKqmMiektGkqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785465103; c=relaxed/simple;
	bh=m5d1tt8rXp0oOafKh/PSNL5LgQSbOfN9zqKw0IxKsTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSdmSi03PoRwLDZUYdfWT4tI7E5FBMvKYknso0Vdmnxw1r/5jj/ub7Dxo4SgPgtaNwRtyyMjzeqA0WOhWMuB9DIkiv+cV5Q6dGFIlUhX9eUDLGfBVeYcVFB689MBcBH2Zi3fUNb/UhCrbIfOu57v+Bc9lzKgzlNqOrTjXtCtlSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJYfqy+8; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJYfqy+8"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so385838a91.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 19:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785465102; x=1786069902; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8H653foimGQenb31E7Zq2z1hCYxXgCkLGl9z+Dd6mAw=;
        b=MJYfqy+8lZEuxV3lyPyU6e6EbDjeLk17KvC/o6CXHUuJXHcvuTzxizYKgeWc1XEXu4
         Y5oxTbSXwwxt7w4iKzgT91DNvVQrPcBR8CvuTlNCxwwVhq86zz7nSafL8PnsqtY4+hpS
         inC+7mmUmg9WTpFA909VvhE1T/Dla/d5W0ak8cCOuf9obGsC5uuoREuoNg8iz7I4nqBM
         uoeLUF8OXuoKR+hKEjl3a7rc3FSBLYqvawy/QxKhDZaFulur800wmHz3zVrs6c261Ynk
         M3/KIYO6Jq5CJmwtHalfzrJNHdFYOvJNh4o3D5kZjiGruPfPcG43pbGrRzGMcHZfRC6f
         DpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785465102; x=1786069902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8H653foimGQenb31E7Zq2z1hCYxXgCkLGl9z+Dd6mAw=;
        b=av/Y2t6TOxp5hUabU4AnckNeUrcJCM8UWND3O9zD6fW839lopRoL/Ghw3T40y8WA3O
         2dy6X7Q8h3zOQVrZpR4Vt5z1LDtU0FVkjEkVhd4QOaLH4AZCmUEW19xs2iuqKqvq1QoU
         5uP5cxVspk0I0e5DQXvPixNKxsiUmhM49a51HdUpWPS/g+GvOYF1DWK/WHmwC3qRi1M9
         VvU8mqcqcvrrjo6ALXixmtgeS3shR+DjEVWdM5Q0Qyc1TQg1jvNt7cyIXXSX+WkP9dVy
         F2CS5MIQZWmah8VPbIrGwg9Z4LW7NLsNHAMtO5Oe7GMozPJPM4nR9ZwaK/aMVd4mly11
         OXDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJjlzFEOYGOND0Dcs5s064H22hZPAqK1uMhplfBb7uojqBBlipNB5QTrRQAMPBeS54qb4i2VhI8/w+i9Hh@lists.linux.dev
X-Gm-Message-State: AOJu0Yyal7YboK8pP6ENn6lx39gv1nAvzPjMm6Mmp+znWC+6fcKtCSOO
	CqJi6rgzb81qK3GmryPYm2vw0TLlqvMzasaNxM3lPlueo73SI2AO1K1Y
X-Gm-Gg: AR+sD13UP70fn15PaAkpytdfX1HxcE3uyIS9lmoErKNJ17HnlawdH0BVoPhZavmtatw
	FzJEGFWvfU7wmV24FkIfy3IfmWBTwl5LpLM1qTmYw9jm4qEHUtWEE1yMyWQR1nq+ZIbU6CyMVhy
	ODvLt9hV5BTm61kIgg3c9pvD35j5vl0TE+Kj/cnactHdsFbbPidx6Euiz2YHUB1fCcQgziAgdrH
	CrhXmbRcmPzq6wgo6PoDJA/kWu1+8gYfOiaeSffKEfIa5GWLKpGooxiNyONZdqTVXZ9lfPU9RoH
	dpGuTwd0AjhYB73eL0gloNT2wj3y3gfI5d0COJG57REKfNxmOfCUkDnzrEe7BdqEVXBuVZeewQ7
	V2HBlJEpj+RRTOlEvlIkOtCx3jVVd23kF6y+WXv0VWnjMnBFLJHAbuQcHFbAmEH1PGdu0b8NHSq
	+A4IXC+QY6we0Tzyc1K8f6cfCVx2bqhDXwtUGKhha9nUSNQpOtnjTu65zdeYxwc3yGqdZ5Q5Q1E
	bFwYgEqp4UTb7Kn2eWi2UXxqnWvzqns3dASahFFIoJx/Xk9XlQgRlU=
X-Received: by 2002:a17:90b:1cce:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-38fb146aa98mr269345a91.20.1785465101692;
        Thu, 30 Jul 2026 19:31:41 -0700 (PDT)
Received: from ?IPV6:2001:fb1:d9:513:c19b:e656:f1b3:7eae? ([2001:fb1:d9:513:c19b:e656:f1b3:7eae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30e3a5asm1988a91.16.2026.07.30.19.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 19:31:41 -0700 (PDT)
Message-ID: <c7269c03-45b5-4979-a3c2-c52d7a683ea9@gmail.com>
Date: Fri, 31 Jul 2026 09:31:36 +0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [trace:trace/core 16/16] WARNING: modpost: vmlinux: section
 mismatch in reference: trace_printk_init_buffers.part.0+0xc8 (section:
 .text.unlikely) -> initcall_level_names (section: .init.data)
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
References: <202607291326.Dr0maCyu-lkp@intel.com>
 <20260729113613.7f6af519@gandalf.local.home>
 <087e006b-d856-4307-8429-f8225273a785@gmail.com>
 <20260730092845.4b889ccb@gandalf.local.home>
Content-Language: en-US
From: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
In-Reply-To: <20260730092845.4b889ccb@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/7/2569 BE 20:28, Steven Rostedt wrote:
> On Thu, 30 Jul 2026 14:04:20 +0700
> Woradorn Laodhanadhaworn <woradorn.laon@gmail.com> wrote:
> 
>> I reproduced this locally with commit
>> `c33330b2ec170dd38b3284a72bc6a07a49cc9a65`, and it also reports:
>>
>> WARNING: modpost: vmlinux: section mismatch in reference:
>> trace_printk_init_buffers.part.0+0xc8 (section: .text.unlikely) ->
>> initcall_level_names (section: .init.data)
>>
>> Then I tried the same configuration and reproduction steps with the parent
>> commit, `b6ccdca8d11c28338776811f0b9024d92c4bedb4`. It doesn't report anything
>> related to `modpost: vmlinux: section mismatch in reference:
>> trace_printk_init_buffers.part`.
> 
> Did you do a "make mrproper" between both builds?
> 

Yes, I did, but with a different approach. I removed the build_dir and 
recreated it.

>>
>> So it looks like this commit introduced the warning. I'm not sure where to look
>> yet, but I'll dig into `modpost.c` to understand the root cause. If you have any 
>> suggestions on where I should start looking, I'd really appreciate them.
>>
>> Also, I'd like to ask how urgent this issue is. It might take me some time to
>> find the root cause.
> 
> It's only a warning with the W=1 build. There's many other warnings there
> too, so I don't think it's high priority.
> 

Understood, thanks.

> Thanks,
> 
> -- Steve


Thanks,
Woradorn
