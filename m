Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F8E2C9C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680601834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gWz1ABZ3fmvwgLKtocpzwdklp33JeqGFnHowDmxZOJY=;
	b=a031LqV3OQId7bkyyQiVNFF+Z1CiBT9AwK9XwdmSxBJtMyN2fyeUv5ZBCNtOS4Y10LrXgP
	uDXFSEG+GZYt9/KH7A+ClwbebH0aux6WxhQDK83RmvNSkvPdff+dKSKa+Wghvw8nD83CoB
	4lGgl4V5blq1tF+CHF5bKmcC70yxivA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-mz-n-bOzMFSxUog8e66Q7A-1; Tue, 04 Apr 2023 05:50:28 -0400
X-MC-Unique: mz-n-bOzMFSxUog8e66Q7A-1
Received: by mail-ed1-f71.google.com with SMTP id t26-20020a50d71a000000b005003c5087caso44878786edi.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Apr 2023 02:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680601820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gWz1ABZ3fmvwgLKtocpzwdklp33JeqGFnHowDmxZOJY=;
        b=tka/vZhEhMeqnWNLzybJkiEIuxrtDfjxdf3JGlZ8hdR/uDyyJ2HSGUl7kxpTQjl3qv
         FGEiCLEqTFOZBbeGmPwLv4oBQ6i6Oyhly64X2v90NEfknU6cvb+CqcRF7TM7jVXY1AC7
         ImxPR1VV4riG2JajL5Uzwzw69wML6e1eMbTa7PLkx3o2god3/qopfuNr97ez+SLXlxvL
         LBdBGHMmAr6oWR7qYXv43cVQTdVBCElsQZrvxhSMAyWBlS0FugWc2H5YQPW7pc5VURkj
         +12nhMRqPpzxL6bouHmXK74tMoIBZGdjWipXlMxH7Y99k3FbDkI+0P+DNB/zmjEYS5wq
         EJDw==
X-Gm-Message-State: AAQBX9e1Bbsv1xeMKI9PyrQrAfGPHjsYbz1R8WvtpnFCxtUIRLlYRDIX
	eu05j0egzgAv1XmYBL8W1pIkhXENZQJJ6YEuuzx+d0/bF0iodPhOcWt6xjq4MsQITEctr1W5jW7
	MA7yPiZrd93A3FIl3JswioTDc+Yr4kx+GsQ==
X-Received: by 2002:a17:906:a04b:b0:933:3a65:67ed with SMTP id bg11-20020a170906a04b00b009333a6567edmr1667330ejb.75.1680601819825;
        Tue, 04 Apr 2023 02:50:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350bsscIb2so87VzjSstYrwPOOqnH/+y9SuctIsemdfL5H3GaHYF8eyDlnBJCCD+qFsL8ghPC0w==
X-Received: by 2002:a17:906:a04b:b0:933:3a65:67ed with SMTP id bg11-20020a170906a04b00b009333a6567edmr1667315ejb.75.1680601819503;
        Tue, 04 Apr 2023 02:50:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i5-20020a50d745000000b004fa19f5ba99sm5715114edj.79.2023.04.04.02.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 02:50:18 -0700 (PDT)
Message-ID: <a07aa39e-4a70-6942-9837-717a69484e96@redhat.com>
Date: Tue, 4 Apr 2023 11:50:17 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: sparse false-positive ? (was [linux-next:master 3256/8744]
 drivers/platform/x86/apple-gmux.c:224:48: sparse: sparse: incorrect type in
 argument 1 (different address spaces))
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <lkp@intel.com>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
References: <202304040401.IMxt7Ubi-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202304040401.IMxt7Ubi-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dan,

Can you perhaps help me understand the following sparse warnings,
they seem like false-positives to me. But I'm not used to
sparse giving false-positives so I think I might be missing something
here ?

On 4/3/23 22:39, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   31bd35b66249699343d2416658f57e97314a433a
> commit: 0c18184de990e63f708b090bcb9fc6c0fbc427cd [3256/8744] platform/x86: apple-gmux: support MMIO gmux on T2 Macs
> config: x86_64-randconfig-s023-20230403 (https://download.01.org/0day-ci/archive/20230404/202304040401.IMxt7Ubi-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0c18184de990e63f708b090bcb9fc6c0fbc427cd
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 0c18184de990e63f708b090bcb9fc6c0fbc427cd
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304040401.IMxt7Ubi-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> drivers/platform/x86/apple-gmux.c:224:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned char [usertype] * @@
>    drivers/platform/x86/apple-gmux.c:224:48: sparse:     expected void const [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:224:48: sparse:     got unsigned char [usertype] *

So apple-gmux.c:224 for the commit these sparse warnings are about reads:

	u8 gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);

Where gmux_data is a "struct apple_gmux_data *" and the iomem_base member is:

	u8 *__iomem iomem_base;

And GMUX_MMIO_COMMAND_SEND is:

#define GMUX_MMIO_COMMAND_SEND          0x0f

So I don't understand this warnining ?

Maybe sparse tracks what is being assigned to apple_gmux_data->iomem_base else where ?

The assignment is done like this:

                gmux_data->iomem_base = ioremap(gmux_data->iostart, gmux_data->iolen);

And ioremap() returns a "void __iomem *" so even if the assignment
is tracked things still seem fine ?

Regards,

Hans





>    drivers/platform/x86/apple-gmux.c:227:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned char [usertype] * @@
>    drivers/platform/x86/apple-gmux.c:227:53: sparse:     expected void const [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:227:53: sparse:     got unsigned char [usertype] *
>>> drivers/platform/x86/apple-gmux.c:241:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
>    drivers/platform/x86/apple-gmux.c:241:55: sparse:     expected void [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:241:55: sparse:     got unsigned char [usertype] *
>    drivers/platform/x86/apple-gmux.c:243:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
>    drivers/platform/x86/apple-gmux.c:243:39: sparse:     expected void [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:243:39: sparse:     got unsigned char [usertype] *
>>> drivers/platform/x86/apple-gmux.c:245:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned char [usertype] *[noderef] iomem_base @@
>    drivers/platform/x86/apple-gmux.c:245:32: sparse:     expected void const [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:245:32: sparse:     got unsigned char [usertype] *[noderef] iomem_base
>>> drivers/platform/x86/apple-gmux.c:256:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] *[noderef] iomem_base @@
>    drivers/platform/x86/apple-gmux.c:256:32: sparse:     expected void [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:256:32: sparse:     got unsigned char [usertype] *[noderef] iomem_base
>    drivers/platform/x86/apple-gmux.c:258:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
>    drivers/platform/x86/apple-gmux.c:258:53: sparse:     expected void [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:258:53: sparse:     got unsigned char [usertype] *
>    drivers/platform/x86/apple-gmux.c:260:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
>    drivers/platform/x86/apple-gmux.c:260:39: sparse:     expected void [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:260:39: sparse:     got unsigned char [usertype] *
>    drivers/platform/x86/apple-gmux.c:272:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
>    drivers/platform/x86/apple-gmux.c:272:55: sparse:     expected void [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:272:55: sparse:     got unsigned char [usertype] *
>    drivers/platform/x86/apple-gmux.c:274:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
>    drivers/platform/x86/apple-gmux.c:274:39: sparse:     expected void [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:274:39: sparse:     got unsigned char [usertype] *
>    drivers/platform/x86/apple-gmux.c:276:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned char [usertype] *[noderef] iomem_base @@
>    drivers/platform/x86/apple-gmux.c:276:15: sparse:     expected void const [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:276:15: sparse:     got unsigned char [usertype] *[noderef] iomem_base
>>> drivers/platform/x86/apple-gmux.c:276:15: sparse: sparse: cast to restricted __be32
>>> drivers/platform/x86/apple-gmux.c:286:19: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
>    drivers/platform/x86/apple-gmux.c:286:19: sparse:     expected unsigned int [usertype]
>    drivers/platform/x86/apple-gmux.c:286:19: sparse:     got restricted __be32 [usertype]
>    drivers/platform/x86/apple-gmux.c:286:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] *[noderef] iomem_base @@
>    drivers/platform/x86/apple-gmux.c:286:46: sparse:     expected void [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:286:46: sparse:     got unsigned char [usertype] *[noderef] iomem_base
>    drivers/platform/x86/apple-gmux.c:287:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
>    drivers/platform/x86/apple-gmux.c:287:53: sparse:     expected void [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:287:53: sparse:     got unsigned char [usertype] *
>    drivers/platform/x86/apple-gmux.c:289:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got unsigned char [usertype] * @@
>    drivers/platform/x86/apple-gmux.c:289:39: sparse:     expected void [noderef] __iomem *
>    drivers/platform/x86/apple-gmux.c:289:39: sparse:     got unsigned char [usertype] *
>>> drivers/platform/x86/apple-gmux.c:739:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *[noderef] iomem_base @@     got void [noderef] __iomem * @@
>    drivers/platform/x86/apple-gmux.c:739:39: sparse:     expected unsigned char [usertype] *[noderef] iomem_base
>    drivers/platform/x86/apple-gmux.c:739:39: sparse:     got void [noderef] __iomem *
>>> drivers/platform/x86/apple-gmux.c:889:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *[noderef] iomem_base @@
>    drivers/platform/x86/apple-gmux.c:889:34: sparse:     expected void volatile [noderef] __iomem *addr
>    drivers/platform/x86/apple-gmux.c:889:34: sparse:     got unsigned char [usertype] *[noderef] iomem_base
>    drivers/platform/x86/apple-gmux.c:916:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *[noderef] iomem_base @@
>    drivers/platform/x86/apple-gmux.c:916:34: sparse:     expected void volatile [noderef] __iomem *addr
>    drivers/platform/x86/apple-gmux.c:916:34: sparse:     got unsigned char [usertype] *[noderef] iomem_base
>>> drivers/platform/x86/apple-gmux.c:224:26: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:227:31: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:241:33: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:243:17: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:245:23: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:256:23: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:258:31: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:260:17: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:272:33: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:274:17: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:276:15: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:286:37: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:287:31: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:289:17: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c: note: in included file:
>>> include/linux/apple-gmux.h:69:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *[noderef] __iomem iomem_base @@     got void [noderef] __iomem * @@
>    include/linux/apple-gmux.h:69:41: sparse:     expected unsigned char [usertype] *[noderef] __iomem iomem_base
>    include/linux/apple-gmux.h:69:41: sparse:     got void [noderef] __iomem *
>>> include/linux/apple-gmux.h:80:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got unsigned char [usertype] * @@
>    include/linux/apple-gmux.h:80:34: sparse:     expected void const [noderef] __iomem *
>    include/linux/apple-gmux.h:80:34: sparse:     got unsigned char [usertype] *
>>> include/linux/apple-gmux.h:81:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *[noderef] __iomem iomem_base @@
>    include/linux/apple-gmux.h:81:17: sparse:     expected void volatile [noderef] __iomem *addr
>    include/linux/apple-gmux.h:81:17: sparse:     got unsigned char [usertype] *[noderef] __iomem iomem_base
>>> include/linux/apple-gmux.h:72:14: sparse: sparse: dereference of noderef expression
>    include/linux/apple-gmux.h:80:23: sparse: sparse: dereference of noderef expression
>    include/linux/apple-gmux.h:81:17: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:740:22: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:888:13: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:889:25: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:915:13: sparse: sparse: dereference of noderef expression
>    drivers/platform/x86/apple-gmux.c:916:25: sparse: sparse: dereference of noderef expression
> 
> vim +224 drivers/platform/x86/apple-gmux.c
> 
>    220	
>    221	static int gmux_mmio_wait(struct apple_gmux_data *gmux_data)
>    222	{
>    223		int i = 200;
>  > 224		u8 gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
>    225	
>    226		while (i && gwr) {
>  > 227			gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
>    228			udelay(100);
>    229			i--;
>    230		}
>    231	
>    232		return !!i;
>    233	}
>    234	
>    235	static u8 gmux_mmio_read8(struct apple_gmux_data *gmux_data, int port)
>    236	{
>    237		u8 val;
>    238	
>    239		mutex_lock(&gmux_data->index_lock);
>    240		gmux_mmio_wait(gmux_data);
>  > 241		iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
>    242		iowrite8(GMUX_MMIO_READ | sizeof(val),
>    243			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
>    244		gmux_mmio_wait(gmux_data);
>  > 245		val = ioread8(gmux_data->iomem_base);
>    246		mutex_unlock(&gmux_data->index_lock);
>    247	
>    248		return val;
>    249	}
>    250	
>    251	static void gmux_mmio_write8(struct apple_gmux_data *gmux_data, int port,
>    252				      u8 val)
>    253	{
>    254		mutex_lock(&gmux_data->index_lock);
>    255		gmux_mmio_wait(gmux_data);
>  > 256		iowrite8(val, gmux_data->iomem_base);
>    257	
>    258		iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
>    259		iowrite8(GMUX_MMIO_WRITE | sizeof(val),
>    260			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
>    261	
>    262		gmux_mmio_wait(gmux_data);
>    263		mutex_unlock(&gmux_data->index_lock);
>    264	}
>    265	
>    266	static u32 gmux_mmio_read32(struct apple_gmux_data *gmux_data, int port)
>    267	{
>    268		u32 val;
>    269	
>    270		mutex_lock(&gmux_data->index_lock);
>    271		gmux_mmio_wait(gmux_data);
>  > 272		iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
>    273		iowrite8(GMUX_MMIO_READ | sizeof(val),
>    274			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
>    275		gmux_mmio_wait(gmux_data);
>  > 276		val = be32_to_cpu(ioread32(gmux_data->iomem_base));
>    277		mutex_unlock(&gmux_data->index_lock);
>    278	
>    279		return val;
>    280	}
>    281	
>    282	static void gmux_mmio_write32(struct apple_gmux_data *gmux_data, int port,
>    283				       u32 val)
>    284	{
>    285		mutex_lock(&gmux_data->index_lock);
>  > 286		iowrite32(cpu_to_be32(val), gmux_data->iomem_base);
>  > 287		iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
>    288		iowrite8(GMUX_MMIO_WRITE | sizeof(val),
>    289			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
>    290		gmux_mmio_wait(gmux_data);
>    291		mutex_unlock(&gmux_data->index_lock);
>    292	}
>    293	
> 

