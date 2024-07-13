Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0E417C73
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 11:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720871086; cv=none; b=oxi1+edAw/jkYltnjhr7YpXyH1pjLLBcjNmY8+O3gAtuj6KABKWRqlljgu57x+HgrBDczid98eupe5FLUS3Eh2pzavijFO+gx0Z4Pi1U9S1BnqguhX9nY86tfCejV9LQiXafXt96/DRYdlRl1vEIShvlPsX8sgGNIHg7hMR7JDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720871086; c=relaxed/simple;
	bh=9lY6pt1MV3+CLxaXNeff3y+C2Qx2gkloqTPcvNYgAPM=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Z+g/bbbIUmwZhHHtE6v4Qcgvn5NWfPZUQA8IFUhhok92mNG/OGjFq7gnA9ANggtWgG91MbnjL9qYF/PefRMH7peIPddZUKUZ8hQJWyiFf7KrccGwqIB8/52ZvZ6TPDJo84DljIZWWlywKiQ0ZRERofrVS6Nquo7VS0PzM3rBZrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Z+SihG+d; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Z+SihG+d"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8100ff1cec5so957796241.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 04:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1720871083; x=1721475883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xor8/IywY58I3OwpUp/m2nzckRWAxO8gVFnHz0R57ws=;
        b=Z+SihG+dO+Xny4qedHsiG3O9YXzapCWrhDhwzmS9NqTQ6BrklglPTFnqCYMJVIQdqR
         uuGYbzPqXyATWoqMZ9y+2qvSS9s7DbSkuVR2b30p6dnaG1+FMhNMYD0ShOPnK9hO/fZh
         D8LeWrRVZ9XKgWfQ16UlajkJ6e1HBYBS8Ryx4GLmknPIdu00/uh4TEDUYCyHehwcIqxD
         JGUzf6EMTd+DR1X8cGgcr1DBAmixJOfYa2fzMUvw8jzVB3ahPs68l6OB+NQ8JSN+2p8Y
         J9hNYPug6uR82OBUAyuk2lDUDYY0bk9MTr4QelHrmvhamk6kRdX48HbIPnMf6tR5Zr/b
         sJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720871083; x=1721475883;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xor8/IywY58I3OwpUp/m2nzckRWAxO8gVFnHz0R57ws=;
        b=hghL9g7ZbSdr2cZsAHanTXnQrYyuuuzw4vNyy/DYc/3Rx39FWCZUOynRdvSqfA4NDf
         wP0yf1a2eXQjK8ijKIyVzFOefU5JxzndNjglUlQsKPJxryO5HEMIw/Gp8sr+N7nS36Xp
         mWWtEtJr3T53l48zA32sCQcGQBPvsHaty8YLy0JnAs26zx6aRmDsH6bwqN+/JFkgCuc7
         U1tsxuDYjBqugjMFItqJesq/bRU3O1sF4tDNR+vTE6zpNuZ1507/lajNCoJHujWQ4RvB
         QUJW1dIc3ncGZedsqjfYYc3hbnoBKQzQID/3xT5pyOArpMjarMAWtnUqpM2POWFxLrUx
         inPw==
X-Gm-Message-State: AOJu0YxgjYPjPXCpswdOQj7w71Mdw5nHyI4EeF52roM1UooolASppJGZ
	7dOjZDSfwY0PLBpQ8TD8jp7SZjZD0qIyqjNJGIfNZJ/iOrSIW/xiq9x/sf/p4w==
X-Google-Smtp-Source: AGHT+IF4UUVoHwNEnsKxv2JyTRa63lyTvWbm8OJQ9+qM7L8/diVYv/l/aEpmQ7gi93Oz6Wz2N4jayQ==
X-Received: by 2002:a05:6102:26ca:b0:48f:9682:1b1b with SMTP id ada2fe7eead31-490320f7630mr16621757137.7.1720871081811;
        Sat, 13 Jul 2024 04:44:41 -0700 (PDT)
Received: from [192.168.7.16] ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160c65f21sm38222485a.98.2024.07.13.04.44.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jul 2024 04:44:41 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
To: kernel test robot <lkp@intel.com>, KP Singh <kpsingh@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Casey Schaufler <casey@schaufler-ca.com>, Kees Cook <keescook@chromium.org>
Date: Sat, 13 Jul 2024 07:44:40 -0400
Message-ID: <190abe6a978.28a7.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <ZpI3oi+XKDkqU0Nb@rli9-mobl>
References: <ZpI3oi+XKDkqU0Nb@rli9-mobl>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: [linuxsecuritymodule:dev-staging 11/11] include/linux/lsm_hooks.h: linux/jump_label.h is included more than once.
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

Likely my mistake while resolving merge fuzz, I'll fix it when I'm in front 
of a computer this weekend.
--
paul-moore.com

On July 13, 2024 4:15:45 AM kernel test robot <lkp@intel.com> wrote:
> tree:   https://github.com/LinuxSecurityModule/kernel dev-staging
> head:   fe232b5ad921472638f2034c93b15cf3940fa3cf
> commit: fe232b5ad921472638f2034c93b15cf3940fa3cf [11/11] lsm: replace 
> indirect LSM hook calls with static calls
> :::::: branch date: 16 hours ago
> :::::: commit date: 16 hours ago
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 
> 617a15a9eac96088ae5e9134248d8236e34b91b1)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202407122041.NOQqOcs5-lkp@intel.com/
>
> includecheck warnings: (new ones prefixed by >>)
>>> include/linux/lsm_hooks.h: linux/jump_label.h is included more than once.
>>> include/linux/lsm_hooks.h: linux/static_call.h is included more than once.
>
> vim +35 include/linux/lsm_hooks.h
>
>    27
>    28 #include <uapi/linux/lsm.h>
>    29 #include <linux/security.h>
>    30 #include <linux/init.h>
>    31 #include <linux/rculist.h>
>    32 #include <linux/xattr.h>
>    33 #include <linux/static_call.h>
>    34 #include <linux/unroll.h>
>> 35 #include <linux/jump_label.h>
>    36 #include <linux/lsm_count.h>
>    37 #include <linux/static_call.h>
>> 38 #include <linux/jump_label.h>
>    39
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



