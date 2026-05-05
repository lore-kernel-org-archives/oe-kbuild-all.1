Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5823D3A380D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777968216; cv=none; b=gI9cbyCFXnqPW+t279ONYUeQGkSdbUr3iVkpNajoztvOdJQYX0sMkqoYwN5V94URsY2I9Vi12ZkIlby7YUDTFmuaCXWkx/RVxjPI+mkASCPYQ2LEt265TN59pnppV41B8SYq56ghDYb9X7M4Yit9wCjHQnjLWulYNeBwL8/GbO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777968216; c=relaxed/simple;
	bh=eFl3ZW1fQsyuvlaAImo28QlmWhvfN4CAVYLlOWDD41E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M888ZAadHFk8Mt2debI1bpU5OnA/4X+0GF9KycW5h4EZlKw2Kei2cqRWwtybRfUVeFTVlRAP6i+9nR3rFZuktXJ/z1cg43vGSnSSK/V59/54pN9fRlzN65zURNze0xtTBus+QgqrrjsbGXQR9ZMC5CR+UMViuf56F2EynG2MZb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=xjIkz+FV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="xjIkz+FV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso36778375e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 May 2026 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1777968213; x=1778573013; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqR/wy63Urn0t3ThqxSLpf9nxTN7sHcwtEOysFg+/Ls=;
        b=xjIkz+FVPXQrbSFWbSVCf6YDmDS4LQrRPFe3yWmzwaXyZICL3/CELutK44OGGTNp/B
         m4j/bYKp7RjQFJrPg0IpjOVCEIkzYVvxzkvSbcF6fY3gBjkjHRXybnOs6alrWnfPV86z
         ce1iz54qAwmfAzGB5c1xA3zFtCvBWh+BH8g6ATwEECH6oYN/wPwh8UWD62W7IDyNWWWK
         GWMaJ81UT37d4Ps0NAmEwwdsycqLq+hllLbqHH53n9REWLpR5pcZi4+t0GsdNdXWrlyS
         aG32/ssLPoVLCPqQi10/edm5X5IJXvI9bGWe6tymb1XPpxudhsmFb1bqlKHZxRYCW7oj
         A+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777968213; x=1778573013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqR/wy63Urn0t3ThqxSLpf9nxTN7sHcwtEOysFg+/Ls=;
        b=RgPbD5jKIMuzYCrqMcWsM1Z5xF98IzK4X5xzOdgm8HQa02NwOvxTm00EWJLGm1o9U9
         7WB6exjIyexcVjHSTBPWuNHC6MH8zRXfEwDHisYuw7+ttSxVTwpkNR8+GQjJ+4FD87KN
         M76SNS7eZktl4hAV66aspBO7xGFvHrBePI3F62Uok9oMTFIJwKscYMzLHDVTUTl0Ljob
         +na6zkUtb0tVSy5lM8tNWNui2xRS2JSwZXnaZLM1zScdP2fDvRWlA0EgwosZNFm5wauC
         BMpjQbhFa/lYgewe3EL/9NxnsNIs4xAacWSc7/V67cgUbCDDOzGGVRw63ad3JVadcp9M
         XaSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CdP3/2bLv0LXfJd4WpsR1IEgASUaOKiuE+buKhyYBR2c7M7lm5nFrb5O6bdH1I1ijLNNE09bieZ5dgZ5V@lists.linux.dev
X-Gm-Message-State: AOJu0YygabSAqzlnJtrJ+DS4jueAqriPooqve/Ua3CrjHY2Bs7qnIOBv
	gqh4EQlOFV9Ud1aeZCgb/vdClLQfVj+v6HBpcBoqDV5UG1P9y00tN/88o6GqWDbob7gxJrv11kg
	U2fW8kCU=
X-Gm-Gg: AeBDietHrGbI3ujo8zE23xkUTHTOZUGBD6EmbRk3jWPIYQV/UegDpetAZJNljXOD6DZ
	maJvt0Febiwm22dtBOiHco/NvwGllpAM4CH4JJCNG7gtSdJcp0wOoHRMJdqxQk5q29Btz8F9l6l
	n7rvb+NUFTZx+hjEHRLXaxFDeKdeyygkum6GIU6TnmO7wOnczmnAPJKj3RlsuXB/Ncxg6M0AOEt
	BEIIyGRdDzTDkDYpfDFPa75TZFi4AlIwZzYhXX8W31f0rI1rtLYmluBXMDWUCch495G6CIbpB+S
	WfZMGoAKsfxuVWyrMIGU7ZP05B0qn1Q3xUc3k2Egmhe4eV5/8eVGEHab5JCigYA2dpyDRqBdZgX
	na6wj0tTXIqydPxOf1QgchwEtZwqJTC64IPDL0VFbibFblDLzsZMN5nznvFhC7aE0aI4lzHKQcq
	Ah/Eq2dwldFzwHntmlOQ/REUxe13FY6aVu2o5/NIJfNneoeI4R9zD4R799Ma4VTD55M21EWMiA9
	DkC/TliIi2DJcW8N6Fo
X-Received: by 2002:a05:600c:4e15:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-48d186dc89emr31013215e9.5.1777968212669;
        Tue, 05 May 2026 01:03:32 -0700 (PDT)
Received: from [10.211.9.173] ([213.147.98.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14a16187sm12914705e9.9.2026.05.05.01.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:03:31 -0700 (PDT)
Message-ID: <1f1e6ef7-f353-4d4c-8678-77a8728b1d0e@kernel.dk>
Date: Tue, 5 May 2026 02:03:30 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe:io_uring-user-acct.v2 2/2] io_uring/rsrc.c:52:46: warning:
 variable 'count' is uninitialized when used here
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <202605051516.EwH8GTl5-lkp@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202605051516.EwH8GTl5-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/26 1:58 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-user-acct.v2
> head:   3db2fc5d524bb4877e39659d0180dfc0112893ac
> commit: 3db2fc5d524bb4877e39659d0180dfc0112893ac [2/2] io_uring/rsrc: add huge page accounting for registered buffers
> config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260505/202605051516.EwH8GTl5-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051516.EwH8GTl5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605051516.EwH8GTl5-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> io_uring/rsrc.c:52:46: warning: variable 'count' is uninitialized when used here [-Wuninitialized]
>       52 |         xa_store(&ctx->hpage_acct, key, xa_mk_value(count), GFP_KERNEL_ACCOUNT);
>          |                                                     ^~~~~
>    io_uring/rsrc.c:37:21: note: initialize the variable 'count' to silence this warning
>       37 |         unsigned long count;
>          |                            ^
>          |                             = 0
>    1 warning generated.

This one is already fixed in the current tree.

-- 
Jens Axboe

