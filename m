Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A301A58F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 21:09:01 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7950fac19f2so11902639f.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 14:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695244140; x=1695848940; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8qUn3nxGjNlx+f6POlIyJmp9wGSkysuKBIJu4Ey/ztc=;
        b=P4gjBx4LfhftOHZP8O8LYQRZzKa4ko/pXXDSURJnXEA4tLx8tZKDjZKJOi9pGdSVzV
         nc4/kPgdgHN9mZpvMyyybsw7tNaRI7uZ68b+Mu9uL3Tf9OKHV3A7v94LR1t6pGPnRgnE
         0ObOFSV9cfyyJwGy/0LSQhQp2sP8uxscsmsruCE62MbZjrPcDjOqM5jkAy/KEvHfBH7D
         h5iZflhXDsmSZdqh/alsUU/7qDZGuMTtvYfgJpVGHMmMfC/q/j5brs+iLb/O6asbk/Dq
         HpG71ZG4m1RffHntfkjRSudFfY57RcjJEM94zJz201FzXMan7yPmXCz4Sx8itwKdHgU9
         4sFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695244140; x=1695848940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qUn3nxGjNlx+f6POlIyJmp9wGSkysuKBIJu4Ey/ztc=;
        b=ifcKCoYmT8gV0dHrOXtXsfr6z+b39+u2cBy7ISxPMJWegocWGCDanpPJ14MXOLSlpS
         361oiX1wGjbQLWYDhrpwkckYBpkklI2cdqe5bQuRv58iGH9uEzU31Iki0WuGukr9BsLa
         fHOlf+JKbTiPe/frVfhLBcm0fxjWyICIpUorhhhbRXs7ZJj09hUI6aGJx9pnDJlrM+KN
         nzGZ0jXs8xgrMLSxTjvhInC0n4IsiyDhoBpvOzQBDrwNMbcgKAB5L+0qcgWfMFmyLN1v
         MS3uYSkB+CqYFxpjIxcDaYxgAGI4/UTivBP/DfnTc8Q/sQ43qWojWPfnotdPxka8DuK2
         4zWQ==
X-Gm-Message-State: AOJu0Yy+Zn/iSd/awGR+ty9+DGSyvGfl8GYAqDbTj8KaWWbizNPGgfcy
	UkRSlDAXJ0kc98+gSEgb+9I=
X-Google-Smtp-Source: AGHT+IGYw1W53KWnZypxbWlred60PHqCTpktHE7s1/fHzgD86UCvYVfeqqgF3vg0lzaN3E3IbNtdsg==
X-Received: by 2002:a6b:5b16:0:b0:792:72b8:b90 with SMTP id v22-20020a6b5b16000000b0079272b80b90mr4046635ioh.16.1695244140223;
        Wed, 20 Sep 2023 14:09:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e18-20020a02a512000000b0042b3dcb1106sm4458413jam.47.2023.09.20.14.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 14:08:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ad1f36ab-29a6-98b6-8782-3980323760e1@roeck-us.net>
Date: Wed, 20 Sep 2023 14:08:57 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: arch/m68k/include/asm/raw_io.h:91:13: warning: array subscript 0
 is outside array bounds of 'volatile u16[0]' {aka 'volatile short unsigned
 int[]'}
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>
References: <202309192013.vI4DKHmw-lkp@intel.com>
 <CAL_JsqJ0BoR7Dan3=oyWPa6HU3YV=eOFTO5fx7u5zz2i=eB-jQ@mail.gmail.com>
 <a57afd40-71a2-aa68-84cb-44d2a88a1e2b@roeck-us.net>
 <CAL_JsqJYPJVTxH=d5nYK78+ZWhZAfh4VhEyBLqzyg4MzMhrX0g@mail.gmail.com>
 <194e2d22-9eff-ec6c-9bc9-13b62bda870a@roeck-us.net>
 <CAL_JsqKcD4AttSVUEi5zuF8S1E4xNdqdZVKiHmk0r79SRW5Cqw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAL_JsqKcD4AttSVUEi5zuF8S1E4xNdqdZVKiHmk0r79SRW5Cqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/23 09:20, Rob Herring wrote:
[....]

>>
>> Sure, but I still argue that this isn't worth it for drivers like this one.
>> Are you going to submit a fix ? Because otherwise I'll submit a patch
>> to drop COMPILE_TEST from MACHZ_WDT.
> 
> I honestly don't know what the fix is. There's a compiler flag to
> allow 0 address, but that seems like a big hammer. From what I read on
> the fix for gcc-12, we shouldn't be getting this, but I haven't
> confirmed. I was hoping for comment from Geert as the issue doesn't
> appear to be the driver, but the arch code.
> 
> Furthermore, I just built the same HEAD and config as reported and
> don't see this error. I'm using kernel.org nolibc gcc 13.2.0 which
> should be the same version.
> 

Exactly my point. So now we are stuck with a report like this on a
driver which probably has 0 users and we don't know how to fix it,
all to get the benefit of being able to compile it for an architecture
and platform which will never use it.

I seem to recall similar errors with m68k and COMPILE_TEST last time
I tried to enable it on watchdog drivers, so I am not sure if this is
entirely new.

Guenter

