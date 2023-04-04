Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2696C7C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680605817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5FYgqkX3L6SS1bKKJ+GvTFOSuErZfN9BpiIAzISlufY=;
	b=GctK/EgcqBuwxiq3eZeu67DGA2zKmnIUoopPmzOSLuCqvmvkaHyM6lUzRzN3su00G3V7Og
	FIgis/1kdAcmFu3+3ixVBtDvZZrMqrGh+g9IPBqpeNpy7cIDRi+lWkIbtHByS4i3XeobAw
	Nekw7hvmDeSPOSAYTmSJ95Ihj34Dlhg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-GfWeU79JN7KWunjjSolByg-1; Tue, 04 Apr 2023 06:56:56 -0400
X-MC-Unique: GfWeU79JN7KWunjjSolByg-1
Received: by mail-ed1-f71.google.com with SMTP id t26-20020a50d71a000000b005003c5087caso45108656edi.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Apr 2023 03:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680605814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5FYgqkX3L6SS1bKKJ+GvTFOSuErZfN9BpiIAzISlufY=;
        b=6geFQvhh/p43qYhrNYwGIVp03c9yqaqS/gePNiaS0gEFnl0e2r45xVbkd6vR+A83EX
         D9hzQJ20lpAtC2hCCOxX8Gt0D5qtsURH2CGbqbQM/B1cbXAz3bW4Hjx6ge+vBr+/C/4k
         RIl/fGU78jPxfnw2AL6Lu7zNj6clIPO1A8u7C2FVpqT7Di9/Q4EU1NkBVTbS+zBUHB5t
         STzXI9vW22RmWDiw0yC/N/M72XKJfqGWUuEvN+R8uU50tP81rA9/cR7j0s1lEy039+J6
         ochgUpLxM4PAPLXMWUI7XcvrTJ6eJuOzzMaiXycR7i4J7fFF58m1AM7n31sh6BStndYs
         hY0w==
X-Gm-Message-State: AAQBX9cZgE4ZgUA5ktinaR9nd+6jkSF6Lq3JvyUlhhqS0JtKP5k3GqRo
	rubViOYhK2IyzdpMbpv1RlpDQJyq1pqnzwSB9zgwxh05mYiwoko0Qp3FfuMMKeSWGzYuAoII/Ga
	Nrs+xKu4TA+FalaNlZq2bIocrRA==
X-Received: by 2002:a05:6402:1a46:b0:4fb:6796:14c0 with SMTP id bf6-20020a0564021a4600b004fb679614c0mr2170895edb.22.1680605814361;
        Tue, 04 Apr 2023 03:56:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350b//cnshzfKnu+JxIFi+BgHdznYalW1MBbKckx0B8bWkF0dzB3qofZUxVqCWanZRn12VumHxw==
X-Received: by 2002:a05:6402:1a46:b0:4fb:6796:14c0 with SMTP id bf6-20020a0564021a4600b004fb679614c0mr2170883edb.22.1680605814119;
        Tue, 04 Apr 2023 03:56:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o18-20020a17090608d200b0092973e209f2sm5824454eje.109.2023.04.04.03.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 03:56:53 -0700 (PDT)
Message-ID: <cf11fd99-ec74-5fd9-a4e3-fa0c409ef3df@redhat.com>
Date: Tue, 4 Apr 2023 12:56:52 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: sparse false-positive ? (was [linux-next:master 3256/8744]
 drivers/platform/x86/apple-gmux.c:224:48: sparse: sparse: incorrect type in
 argument 1 (different address spaces))
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <lkp@intel.com>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
References: <202304040401.IMxt7Ubi-lkp@intel.com>
 <a07aa39e-4a70-6942-9837-717a69484e96@redhat.com>
 <f4beb5cb-8887-41a5-9ef8-35e163e2f509@kili.mountain>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f4beb5cb-8887-41a5-9ef8-35e163e2f509@kili.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/4/23 12:07, Dan Carpenter wrote:
> On Tue, Apr 04, 2023 at 11:50:17AM +0200, Hans de Goede wrote:
>> Dan,
>>
>> Can you perhaps help me understand the following sparse warnings,
>> they seem like false-positives to me. But I'm not used to
>> sparse giving false-positives so I think I might be missing something
>> here ?
>>
>> On 4/3/23 22:39, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   31bd35b66249699343d2416658f57e97314a433a
>>> commit: 0c18184de990e63f708b090bcb9fc6c0fbc427cd [3256/8744] platform/x86: apple-gmux: support MMIO gmux on T2 Macs
>>> config: x86_64-randconfig-s023-20230403 (https://download.01.org/0day-ci/archive/20230404/202304040401.IMxt7Ubi-lkp@intel.com/config)
>>> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>>> reproduce:
>>>         # apt-get install sparse
>>>         # sparse version: v0.6.4-39-gce1a6720-dirty
>>>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0c18184de990e63f708b090bcb9fc6c0fbc427cd
>>>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>>         git fetch --no-tags linux-next master
>>>         git checkout 0c18184de990e63f708b090bcb9fc6c0fbc427cd
>>>         # save the config file
>>>         mkdir build_dir && cp config build_dir/.config
>>>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
>>>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/
>>>
>>> If you fix the issue, kindly add following tag where applicable
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Link: https://lore.kernel.org/oe-kbuild-all/202304040401.IMxt7Ubi-lkp@intel.com/
>>>
>>> sparse warnings: (new ones prefixed by >>)
>>>>> drivers/platform/x86/apple-gmux.c:224:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned char [usertype] * @@
>>>    drivers/platform/x86/apple-gmux.c:224:48: sparse:     expected void const [noderef] __iomem *
>>>    drivers/platform/x86/apple-gmux.c:224:48: sparse:     got unsigned char [usertype] *
>>
>> So apple-gmux.c:224 for the commit these sparse warnings are about reads:
>>
>> 	u8 gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
>>
>> Where gmux_data is a "struct apple_gmux_data *" and the iomem_base member is:
>>
>> 	u8 *__iomem iomem_base;
>>
> 
> The __iomem should go before the *.
> 
> 	u8 __iomem *iomem_base;

Heh, thank you Dan!

I'll send out a fix for this right away.

Regards,

Hans


