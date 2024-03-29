Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F14913CFAE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 23:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711754148; cv=none; b=AGNm3mSqfPiCKRQGzLcQhfY9P87yZmVcxY+r09cEK0od0OmxYMuIk+s3lId1e/1phExm+gmBxBgMcPR4cyQJEDjlefQCD3b5Bgy+UMA2mb4Pu7YA5P8lli7rHX5nVWtbbvFHIT3FvxUXtbdMyGVKfD+wrwZ9knOyf/iGb3YOQgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711754148; c=relaxed/simple;
	bh=B38TqAIR6twb3262TohECiLCnvKqAKZDcFpAUNQGD2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2dcxBAi17lkmRUdICegxg6aZSxElRsD8B5niPY7f7PXa+DU4x+Amx0FT8Sl1fvlXfcdYht/0Dfpx5EwnsM7/c6Gh5VpW8y44SG8o1HfGLK129QVOKtj1IWI1jSeVnZW1T4JZjjUOhxLoTh7CPUhFaU3wLW+yD+9N43nIGNXx58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=e8YgaQDH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="e8YgaQDH"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dde367a10aso3339565ad.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 16:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1711754145; x=1712358945; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btl1USfK6BwXzey2GUv6BywGO2c/oXOq7q5Lz+WFwhk=;
        b=e8YgaQDHLxJNhrrTKIXoNCY4n94nF+FSslpsWP9V/kqvfkrlAPIJkvH3Ohw5lQURlR
         NdnoKjj6mNmxzJYYv7sZEyXi3ooZnmArTLRwVxYquL8BPl9UXUtPIayXg9eXtpighnT1
         07jg0LsGsXs3LPDuGwK1LY9GOAC4wRaVvoq43r86TU8TMb6Npa/qXq0ZQ694H82T/eQu
         TLwGLvpzIF5gKci/5wqMADCb1JOpfMKy3HjaF+iuKj4BTo0P7eLYVdLA2B8AJc39bvom
         PxM8rb3xM1tIt4kJzjRnNJraxE2z1uhMDbp5jz7jhcW16klzRSETHYwUC+WsULmiXyfx
         zvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711754145; x=1712358945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btl1USfK6BwXzey2GUv6BywGO2c/oXOq7q5Lz+WFwhk=;
        b=MUdIkKM9C5gXc0FZgZ3wVcihG/JVimqsJN4ObFy8mOgW8vl5C1bfxNut1yI9LrPFkv
         gqaZcwr0T2beIjfAG38fiPKDonenXSQDddzKdQh5vVoiIt6m9Ow2hGCe5g9jmn3vcmIf
         DtzNOK81gOmt32bbdwygP9T3VMVP9Zy60XMVbpY0xH++L3l/DiMftAl+7KkNb0uaZZpb
         7fHo2bk1Kt7r4CScoiNM2cTu7abR7NppLId6aP7DmU5Yh64nGWY0RybsKbL/Jo/mc534
         tcPiieNWeYqABMhfTPN6mjfgu2/U4PH8Af+oQYOoPGJ+BgUmPw327pf1xgjfCF3b12kT
         6ayA==
X-Gm-Message-State: AOJu0YybYePFr0zynHeQPq7mnINnyny7KcecW6P8XHFi6LyGdwjHT3QE
	+8vny2AiWXA+TMlTcFJv13Xh12VY7Gv1BR9EIFYx2H1IRstfXVs3bQC0+X8I6z4=
X-Google-Smtp-Source: AGHT+IHh/wJNDKYjDS0Le/CHe87pb86v8J4ceX9zE09VetBqcdnyHpg0XYEZONgJzfODOr4SfEliaw==
X-Received: by 2002:a17:902:c255:b0:1de:e8ce:9d7a with SMTP id 21-20020a170902c25500b001dee8ce9d7amr3684053plg.5.1711754145427;
        Fri, 29 Mar 2024 16:15:45 -0700 (PDT)
Received: from [10.46.44.174] ([156.39.10.100])
        by smtp.gmail.com with ESMTPSA id w20-20020a1709027b9400b001dca3a65200sm4004014pll.228.2024.03.29.16.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 16:15:44 -0700 (PDT)
Message-ID: <940f0842-194d-4799-8bb2-2024e6903608@kernel.dk>
Date: Fri, 29 Mar 2024 17:15:44 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe-block:for-6.10/io_uring 42/42] io_uring/register.c:175:24:
 warning: arithmetic between different enumeration types ('enum
 io_uring_register_restriction_op' and 'enum io_uring_register_op')
Content-Language: en-US
To: Gabriel Krisman Bertazi <krisman@suse.de>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev,
 io-uring@vger.kernel.org
References: <202403291458.6AjzdI64-lkp@intel.com>
 <87h6go66fm.fsf@mailhost.krisman.be>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87h6go66fm.fsf@mailhost.krisman.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/29/24 4:04 PM, Gabriel Krisman Bertazi wrote:
> kernel test robot <lkp@intel.com> writes:
> 
> [+ io_uring list ]
> 
>>>> io_uring/register.c:175:24: warning: arithmetic between different
>> enumeration types ('enum io_uring_register_restriction_op' and 'enum
>> io_uring_register_op') [-Wenum-enum-conversion]
>>      175 |         if (!arg || nr_args > IORING_MAX_RESTRICTIONS)
>>          |                               ^~~~~~~~~~~~~~~~~~~~~~~
>>    io_uring/register.c:31:58: note: expanded from macro 'IORING_MAX_RESTRICTIONS'
>>       31 | #define IORING_MAX_RESTRICTIONS (IORING_RESTRICTION_LAST + \
>>          |                                  ~~~~~~~~~~~~~~~~~~~~~~~ ^
>>       32 |                                  IORING_REGISTER_LAST + IORING_OP_LAST)
>>          |                                  ~~~~~~~~~~~~~~~~~~~~
>>    14 warnings generated.
> 
> hm.
> 
> Do we want to fix?  The arithmetic is safe here.  I actually tried
> triggering the warning with gcc, but even with -Wenum-conversion in
> gcc-12 (which is in -Wextra and we don't use in the kernel build), I
> couldn't do it.  only llvm catches this.
> 
> can we explicit cast to int to silent it?

I don't think we care, there are others like it in the kernel already.
Plus you need some magic warning incantation to hit it, clang by default
is not going to be enough.

-- 
Jens Axboe

