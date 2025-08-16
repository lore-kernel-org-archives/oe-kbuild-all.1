Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9611291C17
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 16:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755363287; cv=none; b=t5Rns6MNP8r3swL5yK+3/TrmrrRwj5Wevzhjc2NLa8vjJVZqEn5lGS7c0btGpSHRwOFb6Yw1EjSvpornvhmTl5yjFR8yclM6+OoOFUJvVJ0k8+DIvQHHgNwY9dTewFYk4a+1aL2V+at2yB9OdVo/Ppm+ipDEaDGqyRVFuMAawtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755363287; c=relaxed/simple;
	bh=GQ+UFqRbdccCi5+27Ol1ffouzYJRDm4X1t3l4SneLfU=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=I3jO0Hg5+C1D5baGzJeRo1CgFNlnfITmoEqKYhd7ePrmPa//tb0dG7BQa6SKQIhv7P9MdNqjn4urnxjGtX5+/YNkcZjmmESSk2R3CoTxvl3/z0umpVAI14YbucJzqMgdMJup+5xrqBwZoAA2o3iceRfh1xmooYF0TnSh+K5NuSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=sExSQF6K; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="sExSQF6K"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24457f53d2eso33584385ad.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 09:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755363284; x=1755968084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PStuBj2AcAChrvd5pu9DC77ZtNW23zxXAJXUaaX2ZY=;
        b=sExSQF6KRQgSLj45P9c5G154hs/5mZbhRZphiZ14zO9NNVkVU7QfZmOW5r589C/Mku
         7UyUaAN7ZPuhB8CEDzxqQkbFWx/3B3P8n5CvMrdiQwVlDJz8nif+Lc8wv0EwnI6fQoNN
         twWNils4pfX+OGIW9564jigt7Py1+Ax/3xk3fKLwb8vvc+lU8iR3LkvgNs7cYn7YTYZO
         8jmZMRB14FgGEK7DIBsUvhZZw1+PhN3/VHfWQwrtkZzO9+Kr4hR/DAxnt+2qabxsx9LV
         fEgucvKWVWIud7w9L5HGdCpw86yRraScxLntyFICVZ6nUKJjt2mezd1Dwpl62Ukwcr8k
         CjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755363284; x=1755968084;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PStuBj2AcAChrvd5pu9DC77ZtNW23zxXAJXUaaX2ZY=;
        b=g+rBDUhPtEzvbO95RLN944Q0hsypwpAm8PK3Lq0Ixidw0qwYIB0QWeB70IqJdC1LOk
         EFFNKQhnFjLN6wqQPvnEc0mAYmGXy3C9YvUIsB2LXDS8v5N1C4xB+3tSs63IRvnN2TUb
         Ktax2/K2J9RO4MYYV98QKRCUl/naApdeO2KUmSqdBqYjTbO/i0a/GgC95XC6zJyDm83o
         wH3UWiPNNndCxaM75L/6ybuIRGkV3a+wO2KBzwkkRcFY6w44+CmaqYF68YMElxhJokIx
         hvN4G+KHS2LmXVGplaUQIzOESGc+kMjEzcsl/sjNpen13/uCjoVHN5wqIa42rJrv7JAD
         M2ew==
X-Forwarded-Encrypted: i=1; AJvYcCWtrTyXWvlOklKNrH/dd1xjSbLWZnH6X23wnb3L7h/GPfAl9KyzRLrBMGlx5/9bLRHywesL+aQ+XbAk2nmw@lists.linux.dev
X-Gm-Message-State: AOJu0YztGkMrqw52/IWoQREK3Z9qQPB5P077Y5Qn9qD5r48QlAggYPlR
	1P32gKouaW1N15i6Zpaz1Jm7VKsv6XCQpkXw2T+6AalXCy2a59/6AeVUHkOpBUJr/WQ=
X-Gm-Gg: ASbGncuhJ8vyTXyeb8XDmWBT+XxQ2H5EayIvc4zyXA/OrrjRuzne6PFlP1KOpUuMziI
	fs+DU4Ykxbt2Fw2DtC/V50s2QPKxfbApq5V3fT7iMjIlOJiorhITQjf+TDzwf1+mVLcW5rRacOc
	tpmDqGwjCf+eeU7xb55YtijMz3vqo28l5O1/MX2jU/S7nXsYQ3GSLwKHbEj+xZydEhX9B453Q19
	EcCbG5CYi+KI5POTuxH930X+QSNjy4L2H+eUnAvOfeNiPlqAHVbM7mZw+AE7p1k/Tb+csyEvITR
	uXcfqrEHJbn0asWYtBVLjjdWC4Jrfad0mrEfH080el5jFf9OxituOPDPdZjR13kMVIqqEHId4OJ
	ppk4eduSIIvtHH4eTiXI91RdW3Sps5wwyUs4=
X-Google-Smtp-Source: AGHT+IFWyojqKjTT+MeJ+qpupih1PIDLwvSVceT7ZwRfAsyAkrnPrucAznG7NFXOKYitLar8FDpanA==
X-Received: by 2002:a17:902:d485:b0:242:c66f:9f75 with SMTP id d9443c01a7336-2446d9827b2mr84535435ad.55.1755363284187;
        Sat, 16 Aug 2025 09:54:44 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2446ca9d9a7sm39190095ad.23.2025.08.16.09.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 09:54:43 -0700 (PDT)
Date: Sat, 16 Aug 2025 09:54:43 -0700 (PDT)
X-Google-Original-Date: Sat, 16 Aug 2025 09:54:36 PDT (-0700)
Subject:     Re: mm/maccess.c:41:17: sparse: sparse: incorrect type in argument 2 (different address spaces)
In-Reply-To: <20250816161928.GU222315@ZenIV>
CC: lkp@intel.com, cleger@rivosinc.com, oe-kbuild-all@lists.linux.dev,
  linux-kernel@vger.kernel.org, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: viro@zeniv.linux.org.uk
Message-ID: <mhng-9C57C767-A1FB-4547-9651-A430DA137E67@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sat, 16 Aug 2025 09:19:28 PDT (-0700), viro@zeniv.linux.org.uk wrote:
> On Sat, Aug 16, 2025 at 05:28:29PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   dfd4b508c8c6106083698a0dd5e35aecc7c48725
>> commit: ca1a66cdd685030738cf077e3955fdedfe39fbb9 riscv: uaccess: do not do misaligned accesses in get/put_user()
>> date:   2 months ago
>> config: riscv-randconfig-r122-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161713.RWu30Lv1-lkp@intel.com/config)
>> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
>> reproduce: (https://download.01.org/0day-ci/archive/20250816/202508161713.RWu30Lv1-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202508161713.RWu30Lv1-lkp@intel.com/
>>
>> sparse warnings: (new ones prefixed by >>)
>>    WARNING: invalid argument to '-march': '_zacas_zabha'
>> >> mm/maccess.c:41:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned long long [usertype] * @@
>>    mm/maccess.c:41:17: sparse:     expected void const [noderef] __user *from
>>    mm/maccess.c:41:17: sparse:     got unsigned long long [usertype] *
>> >> mm/maccess.c:43:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned int [usertype] * @@
>>    mm/maccess.c:43:17: sparse:     expected void const [noderef] __user *from
>>    mm/maccess.c:43:17: sparse:     got unsigned int [usertype] *
>> >> mm/maccess.c:45:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned short [usertype] * @@
>>    mm/maccess.c:45:17: sparse:     expected void const [noderef] __user *from
>>    mm/maccess.c:45:17: sparse:     got unsigned short [usertype] *
>> >> mm/maccess.c:46:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] * @@
>>    mm/maccess.c:46:9: sparse:     expected void const [noderef] __user *from
>>    mm/maccess.c:46:9: sparse:     got unsigned char [usertype] *
>> >> mm/maccess.c:73:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned long long [usertype] * @@
>>    mm/maccess.c:73:17: sparse:     expected void [noderef] __user *to
>>    mm/maccess.c:73:17: sparse:     got unsigned long long [usertype] *
>> >> mm/maccess.c:75:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned int [usertype] * @@
>>    mm/maccess.c:75:17: sparse:     expected void [noderef] __user *to
>>    mm/maccess.c:75:17: sparse:     got unsigned int [usertype] *
>> >> mm/maccess.c:77:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned short [usertype] * @@
>>    mm/maccess.c:77:17: sparse:     expected void [noderef] __user *to
>>    mm/maccess.c:77:17: sparse:     got unsigned short [usertype] *
>> >> mm/maccess.c:78:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char [usertype] * @@
>>    mm/maccess.c:78:9: sparse:     expected void [noderef] __user *to
>>    mm/maccess.c:78:9: sparse:     got unsigned char [usertype] *
>>    mm/maccess.c:98:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] * @@
>>    mm/maccess.c:98:17: sparse:     expected void const [noderef] __user *from
>>    mm/maccess.c:98:17: sparse:     got unsigned char [usertype] *
>
> ... and that clearly has fuck-all to do with mm/maccess.c.

Ya, sorry, looks like something's just broken on the RISC-V side of 
things.  We lost the __user annotations when moving around the 
misaligned access handling.

> The problem is in
> #define __get_kernel_nofault(dst, src, type, err_label)                 \
>         __get_user_nocheck(*((type *)(dst)), (type *)(src), err_label)
>
> Make that
>         __get_user_nocheck(*((type *)(dst)), (__force __user type *)(src), err_label)
> and similar in
> #define __put_kernel_nofault(dst, src, type, err_label)                 \
>         __put_user_nocheck(*((type *)(src)), (type *)(dst), err_label)
> (cast also on the second argument) and see how much noise will go away.

Thanks, I'll go clean it up.
