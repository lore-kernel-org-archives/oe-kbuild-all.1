Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6690D46A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 23:14:07 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-578cc95db68so469437a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 16:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695165246; x=1695770046; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+0wJC7iUqUi/VsmoECNjzdaGcwsX7nzVBUm4bndTmRU=;
        b=aq7cyNlGwJ00qmnaHxxmQxUqYvjKfs4OWMSzg/jh7ZTCZmY2JxauKBUx3c53mtC+Q8
         IirZG51CdsSk8w0cf0aeyna8IDbLLGqmflkxpWrY0UiV8LtfzDLP+VmwkcFE9hN7lC+k
         TZhcfrJa5zufXkLoO5p3r/KeP31BWO88DPf+w9yxLrvw9Kl62aiXpB1hJnZkUA9mgG0+
         MkTgKAGZj0HCjTHpTejx9PwdHIux4bw/V//R///bNRnTA3I5Gg1Go+yyTj7WJTkOiUWV
         8BmogWTR3QAS6InKnQGiDmfjcUFl33gsKVBW5JdTWc5DYxugXhTZR7uofAw1kANy1lRa
         wN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695165246; x=1695770046;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0wJC7iUqUi/VsmoECNjzdaGcwsX7nzVBUm4bndTmRU=;
        b=crqLGw69yKUivFH0V03K8PSEOccZ5xcD23AtGxVdK8FAb79RjEF+JBbg/3qv17pmi3
         WSBqSb1Eq28Ex5FOr27ysAaCmgcx9BFGdvDsMRCf3xVhon/ArpSa/aSMTcukm/jXgGPX
         flJjkUP7L+1HKKJCpuoEpz/IaPRhryiS574jH7rtUcFI0GnGVqW6fuhR3d1Bb0cyMgus
         zhanGn75L9HRxUtHirhMmkVY6rACuQKPk9HZ7PddLdi07OC+RQQM4DFnWnmn0b2miEpJ
         zqmG2mmN1DSqpG37YkB9iw+jT8tQajk2ZKcvAixwJI5CvLlWoz1y234a9BX917Cx73v7
         H/bg==
X-Gm-Message-State: AOJu0Yz9ESnob+WHTzfo/LeZXSZggzvzJ60p3jX+aYSCk8LoeQV0n4uj
	7Qjs/O8ANjVciC9Zg9ZTwWM=
X-Google-Smtp-Source: AGHT+IEZe/2KTsL6EVUWfjL3HIExO8u4xxxki/8R7e4Pplf40roIx+nF/BcODB1F5YyVg3S44WH1Tw==
X-Received: by 2002:a05:6a21:8185:b0:14b:7d8b:cbaf with SMTP id pd5-20020a056a21818500b0014b7d8bcbafmr869151pzb.57.1695165246513;
        Tue, 19 Sep 2023 16:14:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090a1f4f00b00276a0d96a2esm123641pjy.46.2023.09.19.16.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 16:14:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a57afd40-71a2-aa68-84cb-44d2a88a1e2b@roeck-us.net>
Date: Tue, 19 Sep 2023 16:14:04 -0700
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
To: Rob Herring <robh@kernel.org>, kernel test robot <lkp@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>
References: <202309192013.vI4DKHmw-lkp@intel.com>
 <CAL_JsqJ0BoR7Dan3=oyWPa6HU3YV=eOFTO5fx7u5zz2i=eB-jQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAL_JsqJ0BoR7Dan3=oyWPa6HU3YV=eOFTO5fx7u5zz2i=eB-jQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/19/23 11:37, Rob Herring wrote:
> On Tue, Sep 19, 2023 at 7:09 AM kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   2cf0f715623872823a72e451243bbf555d10d032
>> commit: f1a43aadb5a690e141a3b6700e2a40c1d4dbe088 watchdog: Enable COMPILE_TEST for more drivers
>> date:   5 weeks ago
>> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230919/202309192013.vI4DKHmw-lkp@intel.com/config)
>> compiler: m68k-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192013.vI4DKHmw-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202309192013.vI4DKHmw-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>     In file included from arch/m68k/include/asm/io_mm.h:25,
>>                      from arch/m68k/include/asm/io.h:8,
>>                      from include/linux/io.h:13,
>>                      from drivers/watchdog/machzwd.c:39:
>>     In function 'zf_set_timer',
>>         inlined from 'zf_timer_on' at drivers/watchdog/machzwd.c:218:2:
>>>> arch/m68k/include/asm/raw_io.h:91:13: warning: array subscript 0 is outside array bounds of 'volatile u16[0]' {aka 'volatile short unsigned int[]'} [-Warray-bounds=]
>>        91 |         __w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v >> 8)<<1)))); \
>>           |         ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     arch/m68k/include/asm/io_mm.h:228:20: note: in expansion of macro 'rom_out_le16'
>>       228 |                  : rom_out_le16(isa_itw(port), (val)))
>>           |                    ^~~~~~~~~~~~
>>     arch/m68k/include/asm/io_mm.h:356:42: note: in expansion of macro 'isa_rom_outw'
>>       356 | #define outw(val, port) ((port) < 1024 ? isa_rom_outw((val), (port)) : out_le16((port), (val)))
>>           |                                          ^~~~~~~~~~~~
>>     drivers/watchdog/machzwd.c:74:53: note: in expansion of macro 'outw'
>>        74 | #define zf_writew(port, data)  { outb(port, INDEX); outw(data, DATA_W); }
>>           |                                                     ^~~~
>>     drivers/watchdog/machzwd.c:173:17: note: in expansion of macro 'zf_writew'
>>       173 |                 zf_writew(COUNTER_1, new);
>>           |                 ^~~~~~~~~
>>     In function 'zf_timer_on':
>>     cc1: note: source object is likely at address zero
> 
> This seems to be some newish check in gcc which looks for fixed
> pointers below 4KB[1]. The linked issue says more was planned for
> gcc-13, but I haven't found what that is. AFAICT, that shouldn't
> happen with this config because isa_itw() should be variable and the
> compiler shouldn't be able to determine the value of _addr. However, a
> config with CONFIG_Q40=n, CONFIG_AMIGA_PCMCIA=n, and
> CONFIG_ATARI_ROM_ISA=n would have a fixed NULL value and could trigger
> the warning. This should also have warnings everywhere outw() (and
> others) are used with a constant port value.
> 
> Rob
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578

A long time ago, when someone submitted a "cleanup: patch for the machzwd
watchdog driver, I approved it but added this comment.

 > If anyone is still using the HW supported by this driver, it would
 > be a prime target for conversion to use the watchdog subsystem.
 > This would reduce code size and improve driver stability.
 > _That_ would be useful.

 > The only reason for replacing 0 with NULL is to make a static checker
 > happy. This kind of change adds zero value to the code. Instead, it
 > takes time from those who have to review the patches and apply them.

 > If we ignore such patches, we'll get them again and again, taking
 > away even more time. If we don't ignore them, we encourage submitters
 > and get even more useless patches. If we try to discourage them, we
 > risk being accused of being unfriendly. This is a perfect lose-lose
 > situation for maintainers.

I do wonder if enabling BUILD_TEST on such drivers is any better.

Guenter

