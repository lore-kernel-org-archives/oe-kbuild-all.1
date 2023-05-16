Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1557B290E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684263018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D8hrgFwj/IxmETrWztPLsjH83oYYFMWk/GEnHhUo1CE=;
	b=QpE2/V5xYM4DGnWnBn8GTKFarw/l7BauxiWMt6eGQAh120o4msOULagRpYX+utbOQ3rkQx
	5fmGb0kuepKnP3+e8y3xUJLXEL4RnPf0raS303V2CY9PNeV8qtplivZM9Ht/Y2mjmvp64o
	cfOuM2W9vr7jiccAyPacGnTLeIX6P1I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-iE-2ML_tOJuJhj5JMAFVLQ-1; Tue, 16 May 2023 14:50:16 -0400
X-MC-Unique: iE-2ML_tOJuJhj5JMAFVLQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-96ad0625249so415480666b.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 11:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684263015; x=1686855015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8hrgFwj/IxmETrWztPLsjH83oYYFMWk/GEnHhUo1CE=;
        b=ZhkBGv3jQM2ro5FGyAmq++1/PQTeDCvLDPiecNmbPsDCj3pEJbCS6QNlSJnohl5cHy
         NEUWcSz5/nLzaNmq9opdKImF5JLNXNnWfhEhU1bByZejRQFxS8dPbsBBQEqePJxOKWhW
         nMxGybQqVN98cyViN0/RekxMCFBND2B5JBQme5OU3SprchzzphM0sMi5Gq01cOwyq4cl
         37fY5AWulSdFCq02M9pYWZXZiuUNb3Ew+4YwagBOYGpRzwG0gdFtIQmkGDiJeq9V9yhV
         hAfWPkRmSAVQT64XN7SZ9xTLVaa28v9HAM517BNDK5lqwf2DHbtGpYxp6WXsxg9ebAXe
         7Kcw==
X-Gm-Message-State: AC+VfDz43jhz8IIb7TgQ2+aZcZFf20eCJcIWGyJ5JGTAPrzBYgnodXXn
	UJ+olNlEWHLALJKtPIDvRCkvdF7MgTX94+uHu1G32kyOo4/bbMfl0FUN2f8W10eMYioPyvRzogG
	9apCtyd2tUl4mrgnSvex9I81/ig==
X-Received: by 2002:a17:907:c10:b0:94d:7b6b:fda6 with SMTP id ga16-20020a1709070c1000b0094d7b6bfda6mr36675641ejc.22.1684263015351;
        Tue, 16 May 2023 11:50:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4U2g54EoTrIFzyZ4p5A6oNWLt/P8us3e/AKgSPx7EgkHlb5A4zBWWO043P6KcRjAE+kPGobw==
X-Received: by 2002:a17:907:c10:b0:94d:7b6b:fda6 with SMTP id ga16-20020a1709070c1000b0094d7b6bfda6mr36675621ejc.22.1684263014834;
        Tue, 16 May 2023 11:50:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id h25-20020a1709070b1900b0094ef923a6ccsm11272105ejl.219.2023.05.16.11.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 11:50:14 -0700 (PDT)
Message-ID: <c234d570-ed0d-8e98-b5f4-bf95d8ad8e38@redhat.com>
Date: Tue, 16 May 2023 20:50:13 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: drivers/platform/x86/apple-gmux.c:276:15: sparse: sparse: cast to
 restricted __be32
To: Orlando Chamberlain <orlandoch.dev@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <56f2f65b-150d-3cf6-95f9-2dd8232d2717@redhat.com>
 <D62B0A4F-6A2E-495D-B3AE-4CEAEE172E39@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <D62B0A4F-6A2E-495D-B3AE-4CEAEE172E39@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/16/23 13:31, Orlando Chamberlain wrote:
> Hi,
> 
>> On 16 May 2023, at 8:27 pm, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> ﻿Hi,
>>
>>> On 5/16/23 12:16, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
>>> commit: 0c18184de990e63f708b090bcb9fc6c0fbc427cd platform/x86: apple-gmux: support MMIO gmux on T2 Macs
>>> date:   9 weeks ago
>>> config: i386-randconfig-s001-20230515
>>> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>>> reproduce:
>>>        # apt-get install sparse
>>>        # sparse version: v0.6.4-39-gce1a6720-dirty
>>>        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c18184de990e63f708b090bcb9fc6c0fbc427cd
>>>        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>        git fetch --no-tags linus master
>>>        git checkout 0c18184de990e63f708b090bcb9fc6c0fbc427cd
>>>        # save the config file
>>>        mkdir build_dir && cp config build_dir/.config
>>>        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
>>>        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/
>>>
>>> If you fix the issue, kindly add following tag where applicable
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Link: https://lore.kernel.org/oe-kbuild-all/202305161712.5l3f4iI4-lkp@intel.com/
>>
>> <snip>
>>
>>> vim +276 drivers/platform/x86/apple-gmux.c
>>>
>>>   265    
>>>   266    static u32 gmux_mmio_read32(struct apple_gmux_data *gmux_data, int port)
>>>   267    {
>>>   268        u32 val;
>>>   269    
>>>   270        mutex_lock(&gmux_data->index_lock);
>>>   271        gmux_mmio_wait(gmux_data);
>>>   272        iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
>>>   273        iowrite8(GMUX_MMIO_READ | sizeof(val),
>>>   274            gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
>>>   275        gmux_mmio_wait(gmux_data);
>>>> 276        val = be32_to_cpu(ioread32(gmux_data->iomem_base));
>>
>> Ok, so sparse does not like this line.
>>
>>>   277        mutex_unlock(&gmux_data->index_lock);
>>>   278    
>>>   279        return val;
>>>   280    }
>>>   281    
>>>   282    static void gmux_mmio_write32(struct apple_gmux_data *gmux_data, int port,
>>>   283                       u32 val)
>>>   284    {
>>>   285        mutex_lock(&gmux_data->index_lock);
>>>> 286        iowrite32(cpu_to_be32(val), gmux_data->iomem_base);
>>
>> Nor this line. But this is what we want (convert to/from be32 to CPU
>> when reading/writing).
>>
>> There is iowrite32be() but that always unconditionally swabs
>> the byte order independent of the CPU byte-order.
>>
>> Now this is an x86 driver so always swapping is fine, still
>> I wonder if there is a better option here then using
>> iowrite32be() and ioread32be() ?
> 
> Thanks for finding those functions. I can't think of anything better unless there's a simple way to change sparse's rules so that it will be happy with code like this.

Ok, can you please submit a pathc to switch to iowrite32be() and
ioread32be() then (when you have time to work on this) ?

Regards,

Hans






>>>   287        iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
>>>   288        iowrite8(GMUX_MMIO_WRITE | sizeof(val),
>>>   289            gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
>>>   290        gmux_mmio_wait(gmux_data);
>>>   291        mutex_unlock(&gmux_data->index_lock);
>>>   292    }
>>>   293    
>>>
>>
> 

