Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7513ED532
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690448375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wM6TEnn+NJffXTv9Y3Obw9sX6bbN14vizzC7Lcy1RP8=;
	b=W6l6bizATwX9RcZQLp5v0zh2VEOgJcJybC5woacq5WuQRc/V9PL2dWeT47jwyKXwgEKTRP
	8m7PQd1VJ3NJvQx36/jn7wLpYHCzSQ0VYgpY3AcposH5lXfaNaQmI0/jgksoujuqST8KFn
	ndvlWFkOl8ExAthf42U+DvBAnbdhDTg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-7gpKV0RnNaOLKb70c9Aowg-1; Thu, 27 Jul 2023 04:59:33 -0400
X-MC-Unique: 7gpKV0RnNaOLKb70c9Aowg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99bc711a20eso42924066b.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 01:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690448372; x=1691053172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wM6TEnn+NJffXTv9Y3Obw9sX6bbN14vizzC7Lcy1RP8=;
        b=Px6SozwA+yqVU9AHRPeClDivDfoj+mK0U1PjxvU7dL1Mzf2PnFjldI+7YRK/dTKMj0
         KMOGuDXVuMBaH+PLmo2b19mOKJt+TVpjlhFYbDGZng3uvYJ6uMeFP1+ozueFcwTcHMba
         cZulVRxlMfWWiaYGKzBJTY/6rXaxkAW72E837XA/n7WWXdGbzyU4/tsQ0mz0JKiHNBfO
         ZPSBeSZJdIrl+X/HXDty1eL3o/9LqWCCowe833JDlUG+xdOqYsUcAaYUNvBgzYkF5gTA
         0CZZI53rXkJwQhvwm8bsRKfxZP4f0vVLqR8CH5Fd12Coh8LIqLcH5BPlSp3YTzPICiGX
         CMPw==
X-Gm-Message-State: ABy/qLZg72c3CWi5zNP1j6zxz0jmb5QRvLFc6KPDD08bnMvKAjKmcoTG
	wN3apIATRtQPkS6NN0hktlu3z1BrP+C5h/qFDc4aXZHfa0vpLYDGIVB553T2hSbRBghJqcaDDx2
	FE0DLWx9AFPwFXfWnGHX0I+2wvQ==
X-Received: by 2002:a17:906:ca:b0:994:4f6a:dbb with SMTP id 10-20020a17090600ca00b009944f6a0dbbmr1496091eji.27.1690448372830;
        Thu, 27 Jul 2023 01:59:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFOGtxV672LHuBwo8IVK6mXlQeX9g+tGk4amvCV1LtLU0sPTvCxE0p04W52Jav0Wwzp9i9p5A==
X-Received: by 2002:a17:906:ca:b0:994:4f6a:dbb with SMTP id 10-20020a17090600ca00b009944f6a0dbbmr1496077eji.27.1690448372450;
        Thu, 27 Jul 2023 01:59:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gw19-20020a170906f15300b0097404f4a124sm520959ejb.2.2023.07.27.01.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 01:59:32 -0700 (PDT)
Message-ID: <777c616d-fd2b-b7d7-c6e6-6e374d42c5ae@redhat.com>
Date: Thu, 27 Jul 2023 10:59:31 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [sailus-media-tree:master 10/20]
 drivers/media/i2c/imx290.c:1526:17: warning: incompatible integer to pointer
 conversion assigning to 'struct regmap *' from 'int'
To: kernel test robot <lkp@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <202307271639.6vSx9BOA-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202307271639.6vSx9BOA-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 7/27/23 10:16, kernel test robot wrote:
> tree:   git://linuxtv.org/sailus/media_tree.git master
> head:   215e4463b11d94668b841368cb6882f3a2968148
> commit: 51b1f81e3b15a4cf6c5c1bfd6bb14ff8bc9951fb [10/20] media: imx290: Convert to new CCI register access helpers
> config: arm-randconfig-r012-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271639.6vSx9BOA-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271639.6vSx9BOA-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307271639.6vSx9BOA-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/media/i2c/imx290.c:1526:19: error: implicit declaration of function 'devm_cci_regmap_init_i2c' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>            imx290->regmap = devm_cci_regmap_init_i2c(client, 16);

This is caused by a mis-merge:

https://git.linuxtv.org/sailus/media_tree.git/commit/?id=51b1f81e3b15a4cf6c5c1bfd6bb14ff8bc9951fb

Shows that the "select V4L2_CCI_I2C" was added to the ADV748X Kconfig block instead of to the IMX290 block.

Regards,

Hans


p.s.

Thank you for merging this series.

