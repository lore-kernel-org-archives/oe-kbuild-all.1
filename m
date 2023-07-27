Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C1FBE2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 08:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690448254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3nkc4+dPbAiWFlEGHXf8u9z3FP9uwQsYJ7g6Duaf3to=;
	b=PsI/e9QsuMKezQL5grbtW9HMVxkP1xCo+rxjAYn4gfZ0ovccVf8pZBLXXltFdCWosu98MZ
	PGja31IQV9OhJXBx+TMfnNTaq16vDgXoQcDWt9bpczR6iCizl4ZO9st+qMrjpYtVw6z8ub
	uZ/ZEpjtiard+c8fQiSEYM/xzUspKqc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-Ntf0So-kOHKc6rxUhDuFiQ-1; Thu, 27 Jul 2023 04:57:25 -0400
X-MC-Unique: Ntf0So-kOHKc6rxUhDuFiQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-993d631393fso43424766b.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 01:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690448238; x=1691053038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nkc4+dPbAiWFlEGHXf8u9z3FP9uwQsYJ7g6Duaf3to=;
        b=bI/1Cj4ZiekZ/r/fxtfwm7/rYwek5ERBiyhtAG1xvM6lp1RLz/43945uXG4gPqvi4b
         GH3fC2G4eagef9aWJbGkzDdq8gMmOMQWV5GPvl1k/UqPobX9n/xG0QAa/GOLK53SHvpw
         gPdBUeZjHloTPduxiNjC6qxssgIgvfs0RAeqZ+5Fze2KKQn1/0bu1aXuxzjwIJd7fNCk
         QWZZQ93pbJ36lnqEwiVl3I8ZFs7WGXJSAwPmB8lj6ojgQJGFE+lXw4urC4J7ahkK0BeI
         sip/KdNC2Z2YBaDya6Er+H4Bvpuf6qyHbdRoXkDQ222l94zi4iTg0ubY2ncV4I9BdBm5
         PQ6A==
X-Gm-Message-State: ABy/qLb6VC0ClPVZ3k5EaYoJw/nupP211jDe6dCGAROoepsSLQ3ED/+t
	VoyDuDUrrssAE3qGCsSKsBOWrJ9H0kYAE41FRjey8bQ3mN1/grSw/KsLZm6K4hhWb+3FUfT/Fgo
	/Lf02WLjYSDoCpD1tCCWhkNXe4w==
X-Received: by 2002:a17:906:3199:b0:99b:bc51:8ca7 with SMTP id 25-20020a170906319900b0099bbc518ca7mr1399114ejy.1.1690448237886;
        Thu, 27 Jul 2023 01:57:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHSOArl/JjslRsGcr8fTQsEq6JU7jG+dwRs1XY5LKKsjHOmIYRb+FeOHRJ5Kvdr9+tYv5rEaw==
X-Received: by 2002:a17:906:3199:b0:99b:bc51:8ca7 with SMTP id 25-20020a170906319900b0099bbc518ca7mr1399101ejy.1.1690448237625;
        Thu, 27 Jul 2023 01:57:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gy26-20020a170906f25a00b00992b7ff3993sm506316ejb.126.2023.07.27.01.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 01:57:16 -0700 (PDT)
Message-ID: <8848c668-4736-a478-a277-e0cf1aa96ad4@redhat.com>
Date: Thu, 27 Jul 2023 10:57:15 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [sailus-media-tree:master 9/20]
 drivers/media/i2c/ov5693.c:1280:17: warning: incompatible integer to pointer
 conversion assigning to 'struct regmap *' from 'int'
To: kernel test robot <lkp@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <202307271517.dPa1bTSi-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202307271517.dPa1bTSi-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 7/27/23 09:34, kernel test robot wrote:
> tree:   git://linuxtv.org/sailus/media_tree.git master
> head:   215e4463b11d94668b841368cb6882f3a2968148
> commit: 6ca0d78da91133ec78ecfbdaa7d066849b1b0c0c [9/20] media: ov5693: Convert to new CCI register access helpers
> config: arm-randconfig-r012-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271517.dPa1bTSi-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271517.dPa1bTSi-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307271517.dPa1bTSi-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/media/i2c/ov5693.c:1280:19: error: implicit declaration of function 'devm_cci_regmap_init_i2c' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>            ov5693->regmap = devm_cci_regmap_init_i2c(client, 16);

This is caused by a mis-merge:

https://git.linuxtv.org/sailus/media_tree.git/commit/?id=6ca0d78da91133ec78ecfbdaa7d066849b1b0c0c

Shows that the "select V4L2_CCI_I2C" was added to the DW9768 Kconfig block instead of to the OV5693 block.

Regards,

Hans



