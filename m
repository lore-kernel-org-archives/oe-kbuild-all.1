Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918F415ECD7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Feb 2025 15:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738508637; cv=none; b=D4YQITq6XbsHGKpDDkbyhEroU3yHkLTFAIsWhYjRpw024v91Uck/I054BTRHNSj/Ph4GZbXpetugVvzxMh7rqdExHvmblaF69WUnXX51cJr8oeH19ivERrb44I9FPtKTvE5iirwCH+ohbkvPJsHxLgMmuDFLzikJK+8Pabl21VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738508637; c=relaxed/simple;
	bh=aK6lTOk2uznooM/v4CNjHXZcjE+PAC1jEbKNR8kOkUI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PZFFncd8QYbdcInzt/0BWLo7Mdww1ykwA+6bEbFlCqhpD4QTtmL7nn5iAt4hxiRtgdsa3LZ6o6+eP5Re7LtmLonb2F0bLYq3X+5aOMYxSGo0Y69u1937xd0KKrVpYR8we5RipZFb1CAaDBpNmmcVYYpkHV1poEU0+KODgI1/uA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=f3MNus+j; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="f3MNus+j"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-8521df70be6so320458939f.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Feb 2025 07:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738508632; x=1739113432; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KydtdbsD+IHWTKwrGwoogDQujCrW8sBiCm0O7lZ0Q5Y=;
        b=f3MNus+jU3HPdwgoYgceEvoCU9VmfzLG9A0uTDjq2VRkN15kXhKOKOJl4ZrNdRreXf
         ifIC0yhXSu5w5kJprOOzF54Y0kL6DTdlJcy+sfnzi6bWvvRG23nBtYHGWwTAFDOWIuQA
         1zqGhh7nDmeyLOIpbXdtnzSx4+49uC081TSwPqjo4QgOWuV/M9ArDllHIkuObPVYoH+p
         0ySHpiYziBjyEnymi1b7ybOotlG/KV/5WwQp9xEF3ljquWFEqSgZsGTZ6C9OQkv7a/1O
         ajzN0O6n783SGh9OfYB97x1CV2nnS2fBnxxRMaYy+yhnzEUMwkOw9vp1cI4SF+oDLXfn
         Tueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738508632; x=1739113432;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KydtdbsD+IHWTKwrGwoogDQujCrW8sBiCm0O7lZ0Q5Y=;
        b=DdKzw4qxA2Qu+UR2vlinFcuigCddxVCMHqUqgfBXW11Hq6sq8LbItaLnPTbnzEg1pV
         eM9sxnLXGBM6JjR4tK5Es283wFQ4UpHIH+7/82tZkUU7VRhiJ03M6mvko7QiijPztEat
         vdk9ClnAjgDGgeQgqxsgtD/oCtuqNw8ZKIbgUwBuiEZTTJ9XTo1Tn9SMm+Dbfu9o/cBY
         8ee8HUvXI7o6tzZblsArGOnhRpPT+Rog94GNlHj87ut7+DEE7+GM7BhpsgEOLQm3AWdM
         ywNurftNCiRgLzbBBgEYxKaFvRBATHIygFfaNyUwUU6C/DixsOdJzdxWmxXW1mNMWqL5
         B2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCX8KRynqpDe3qLyVYRYMaiN/fPOCwLCbyj5qb2P0p+WrOocCMpoePsMa2vYkWPNWUN8HkXGYeK3OlSrKFN3@lists.linux.dev
X-Gm-Message-State: AOJu0YxelPJOV7ccflJ7R6d3i5V3e14nSAbkhV2oEjg4wvTnryDjkd2L
	oOYHwlhXAnIZy624FnDwHa5qsnCnfxLU3agRBHtjAgJJ46yKhPzY99dWeKVgtUE=
X-Gm-Gg: ASbGncvJZB39NqcdMwn7MbBmVPkHGuF3kzx9YFPqaAe3cjZtn1OksvJWKSOz6OraA4O
	JzLIvpqCO2uU8uhsQxWSL7wdeAyp9wp8l2prlVjcXJzs4ja5XJjGlei+5FdNOs70pSUXdRXrmoB
	qT/ASQqAllrXQeBlgf4IcVpMQup2dodpjObHwlK0j21fXR3GanCqbcffmrZS0vqiKlIjbW9SpLu
	R2sgc0VyT8MRtpyq1pU3PXXghepZpoibY910MtPhGBGEEgw9jKZucJCfAJ3QFhPYtz+7XqmUTAm
	nmwCsR5wJSGR
X-Google-Smtp-Source: AGHT+IEPqLoat6MYW3ZdjzvI83MNOmtwXXYnpkHxGn3p4XVOYsiMR+nl85vGG6lvx+OoyjGP6weUsw==
X-Received: by 2002:a05:6602:398b:b0:84c:e8ce:b547 with SMTP id ca18e2360f4ac-85427e11c63mr1701903539f.13.1738508632237;
        Sun, 02 Feb 2025 07:03:52 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7469ef2dsm1823798173.97.2025.02.02.07.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 07:03:51 -0800 (PST)
Message-ID: <ad76426d-7d2e-45c5-ab19-a6b9679b0b2f@kernel.dk>
Date: Sun, 2 Feb 2025 08:03:50 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [axboe-block:io_uring-epoll-wait 7/19]
 io_uring/io_uring.c:396:43: sparse: sparse: incorrect type in initializer
 (different base types)
To: kernel test robot <lkp@intel.com>
Cc: Max Kellermann <max.kellermann@ionos.com>, oe-kbuild-all@lists.linux.dev
References: <202502021802.ulY6VEco-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202502021802.ulY6VEco-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, Feb 2, 2025 at 3:19?AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-epoll-wait
> head:   81a642b29d7d837fda2d86c4e1dc036effcfa4a7
> commit: 4fbd68dbbb65f14f3fd40e1232045e06d168ecbd [7/19] io_uring: cache io_kiocb->flags in variable
> config: hexagon-randconfig-r112-20250202 (https://download.01.org/0day-ci/archive/20250202/202502021802.ulY6VEco-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
> reproduce: (https://download.01.org/0day-ci/archive/20250202/202502021802.ulY6VEco-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502021802.ulY6VEco-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
>    include/linux/io_uring_types.h:191:37: sparse: sparse: array of flexible structures
> >> io_uring/io_uring.c:396:43: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int const req_flags @@     got restricted io_req_flags_t [usertype] flags @@
>    io_uring/io_uring.c:396:43: sparse:     expected unsigned int const req_flags
>    io_uring/io_uring.c:396:43: sparse:     got restricted io_req_flags_t [usertype] flags
> >> io_uring/io_uring.c:398:25: sparse: sparse: restricted io_req_flags_t degrades to integer

I've folded in a patch making it io_req_flags_t, which is the correct
type. Missed that...

-- 
Jens Axboe

