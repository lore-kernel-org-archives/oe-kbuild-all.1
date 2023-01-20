Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CE617F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674211401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRrN050GgXHRXbbu2KLh4d8G3uUBIckRfr97uwxP040=;
	b=CqUbnRlxDokuAWbI8ckdZX0icGGbVF+blzsS4x8EggQkVStI+jtwDtMooMDrqPUpUG3x3J
	enZ/vX/UxKZg6lQXOkVIBT/3mU4sLhQLp5vE5fvacMN6rKesKbETS0ewW143HIx5lolu/l
	I5YYuhD0ZCnBFzjvY++v0WA3/V3g0zM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-ecOtrvvQPYi3xag1AMq-og-1; Fri, 20 Jan 2023 05:43:20 -0500
X-MC-Unique: ecOtrvvQPYi3xag1AMq-og-1
Received: by mail-ej1-f69.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso3569035ejb.5
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 02:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRrN050GgXHRXbbu2KLh4d8G3uUBIckRfr97uwxP040=;
        b=MkglPH66MQgLtwTdyUGRbixttgskb0XA5BwFPRPNetcNFD7BFpIWL3PLiMZR83wJVu
         aG995+1+oyNqNLPLSLBhZUSJC7lY1kDl4qaHTJF6DKgziayWKxdZVfzwIwJf0uc2yARg
         UE4UTisfv9P7srrseJbBAO/CP76yG9rL0+tJXalsNBUEOBE3T7gEW89bbfjiQ/tjGkPe
         BnWqW/9QnS+nf2Oq8gjRpGK2Hmi0t3V8DNiBjybshmglZMDUpf9bWESRf2bVn9NerHZR
         WPF8C6ZBzp2uo+xJLvqQAeKDg67GaXz54zgICJAeLIedzuZJe2S3oJkUFkGVuNjWL54H
         YtMg==
X-Gm-Message-State: AFqh2kr7EudPuGSL4E4ndYYnZ9y2cu8spwW2n+IFvKW1UFiNXAd1nwtL
	hbZq0t+2NKyCklx1VJs91AoRueFD5GESSRf+Re8puUxFDDqNaBF9UM8dnzxfuVG2ICr2TZVIMnk
	uk5srmGQArBXnP+mlu9s/l3C3TA==
X-Received: by 2002:a17:906:2c49:b0:7c0:fd1e:972e with SMTP id f9-20020a1709062c4900b007c0fd1e972emr16808784ejh.46.1674211399364;
        Fri, 20 Jan 2023 02:43:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuJfsF0tTZl6ENN+WVUaG2RDJlxoNjReE/SLntnLila3nkrLcnCVXwSWNFe/ZZ+qTg0nC36Jw==
X-Received: by 2002:a17:906:2c49:b0:7c0:fd1e:972e with SMTP id f9-20020a1709062c4900b007c0fd1e972emr16808762ejh.46.1674211399143;
        Fri, 20 Jan 2023 02:43:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b007933047f923sm17711093ejn.118.2023.01.20.02.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 02:43:18 -0800 (PST)
Message-ID: <815d6485-45f4-1f9c-0707-c2163ab32e0e@redhat.com>
Date: Fri, 20 Jan 2023 11:43:17 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 06/11] media: v4l2-core: Built async and fwnode code
 into videodev.ko
To: kernel test robot <lkp@intel.com>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Daniel Scally <djrscally@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
 Mark Pearson <markpearson@lenovo.com>, Andy Yeh <andy.yeh@intel.com>,
 Hao Yao <hao.yao@intel.com>
References: <20230119130053.111344-7-hdegoede@redhat.com>
 <202301200320.AbLvd1xh-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202301200320.AbLvd1xh-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/19/23 20:47, kernel test robot wrote:
> Hi Hans,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.2-rc4]
> [cannot apply to media-tree/master pavel-leds/for-next next-20230119]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/leds-led-class-Add-missing-put_device-to-led_put/20230119-210441
> patch link:    https://lore.kernel.org/r/20230119130053.111344-7-hdegoede%40redhat.com
> patch subject: [PATCH v4 06/11] media: v4l2-core: Built async and fwnode code into videodev.ko
> config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230120/202301200320.AbLvd1xh-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/adfeffb48aad34dd2148e22caaf13d67cd92c285
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Hans-de-Goede/leds-led-class-Add-missing-put_device-to-led_put/20230119-210441
>         git checkout adfeffb48aad34dd2148e22caaf13d67cd92c285
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    ld: vmlinux.o: in function `videodev_init':
>>> v4l2-dev.c:(.init.text+0x4c7c5): undefined reference to `v4l2_async_debugfs_init'
>    ld: vmlinux.o: in function `videodev_exit':
>>> v4l2-dev.c:(.exit.text+0x1f95): undefined reference to `v4l2_async_debugfs_exit'


Right, v4l2_async_debugfs_init + v4l2_async_debugfs_exit need
static inline stubs for when CONFIG_V4L2_ASYNC is not set,
I will fix this in the next version.

Regards,

Hans



