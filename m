Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6142D97A8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029925; cv=none; b=I7RRSgRDUbRRB94h7CHH1OTj/w/SOrMZloLe5e1VLqFkwVIHvp6YqXbKvd71Lvj9cbQFk8fGoNdytIGsZebzVKzhNHlIFcirGLIUjYpoq5q58gN+vhWLJiznBGlVGpGuFjA6O+RpC11emY/30axUNtJzbs9xydco9dLdXMMiHwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029925; c=relaxed/simple;
	bh=mIJdA8oyrBJtCKvVrpFyFaT8GrYlGBhg+w1F4G+yCO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2o0QxywsQtK1ERg5RUMfnxvC2RP0fzykfYrbpp98yasaZbUIW8RbZOtB60Cy3q+ofTZ+gKiEvmSe5ICrwZhoX7jmYI9wx8bB8SiBeQjoJGMUuEBVyjYOBblL+MG7xJA9iJKyl/E4ZNdzbX01YXpGWaHxmzf83ghleCZpkvvIy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KRjR2acc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KRjR2acc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751029921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ys8fge79MdtM3x3QY1EsmwTkUuQvryJDQHLXtfNdWdE=;
	b=KRjR2accMm+8z0ttq/kNXqZH6dMag2Lm1F2WilnE4QXqCCdRRbihCeFdBdlVNoyFSfHG5q
	+0TPrKt0SJfy/E//t8r3IISTDSpKwtIRsGZyUxnJcCdxJw5cHEVT9m2qU+4hlCr1cRhR0Y
	AxMX28GdzJoua9qHjkeLHvdo+JUIH1Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-L7b08BiyOUeJAHgcagEX8g-1; Fri, 27 Jun 2025 09:11:58 -0400
X-MC-Unique: L7b08BiyOUeJAHgcagEX8g-1
X-Mimecast-MFC-AGG-ID: L7b08BiyOUeJAHgcagEX8g_1751029917
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-453691d0a1dso11481675e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 06:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029917; x=1751634717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ys8fge79MdtM3x3QY1EsmwTkUuQvryJDQHLXtfNdWdE=;
        b=q52V7/eHQ4Sl965gpnhZ422kg+eWg7U1I08I0BkHPhgwceWMHNFi7BXhO0+6xY9m+t
         pqZ63Ks80sRxdbPQ04SopHzQlGTg2YtjTDIFy5zs/pxo/1gdmXtdq6ZV2W61WONL+yAc
         +YDB1h2iNlPh434TMBUIGACRNYT0wGeCGJuTbqQMzrntu90IkZecHpZWCnn4dZT9Ti8U
         Wqx7c4Fzoz0nu4NTpl9RH8eSrRBalYPJsdKpDcDsgLWxqxcgK8KPQAlAzXzVr1M8LbnZ
         F0b0QMwYOZuyNGYxSHBSfscIjaSAT2PNx6tRnBPDTY2HJ8xbcYGNHe/nCnpGnF7oXmlm
         xKpg==
X-Gm-Message-State: AOJu0Yy88bpNfFiP09jvUfPmkc5SDCv83T/QEryN6qXz7tSUQrBXtapN
	6AZCA1rFjeMJ084tDEgDgodR67bAR9r1aYCnXnHdaXY0nZ3qFs27rrxpNBTACxQtRS/dkcZgbdy
	crX+g6IZ5L1sl5pTM1p5V9pMt9JwiyEALH+PSRmvCCO/StaLCBMhuPFIXKkmuXALBzpk=
X-Gm-Gg: ASbGncvOA5RYgatSqTZZ6HwbaafXOo54ayq8Ay9pJbyvcPoUXwA9hOsIBO7ORQN/iCf
	tVS8DvTAVJAXsznMftvQXLt6Fro8NgZj9ZWepO+XOppRLFsNmszoHfTfIueJUTlISH3G13O4Ziz
	V7r/Y3+dP/XLWBm9IkIOyd2rX5n0JlA4o/pZ9YJCc0ZQ6n78UiGNUXV16wXa7ix5jliUlWSbJ1p
	OwC0E2jkMX5R/TI+1omGxOpogzY+onzrheAf//HMANseceOMv+l1mnTgaECLI7hsiqSbjG9Jyvz
	vsBQf/VxugBl2LbuJ840VOgHCxT78JaGKyhIrYgp5ZMoNzmAgYOOb5qJhVVDS8QC0zoRSg==
X-Received: by 2002:a05:600c:1c82:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-4538ff99773mr24440135e9.24.1751029916813;
        Fri, 27 Jun 2025 06:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOjbmnV8AGEK3VsZuXyJT+M82EkGZQMH1NSx1G2LB57B4V2LMyf8aplKTlmyoakMjajubMtg==
X-Received: by 2002:a05:600c:1c82:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-4538ff99773mr24439355e9.24.1751029916255;
        Fri, 27 Jun 2025 06:11:56 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:bd10:2bd0:124a:622c:badb? ([2a0d:3344:244f:bd10:2bd0:124a:622c:badb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f918sm2672083f8f.100.2025.06.27.06.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 06:11:55 -0700 (PDT)
Message-ID: <eca0952c-d96c-4d80-8f07-86c8d4caae0b@redhat.com>
Date: Fri, 27 Jun 2025 15:11:53 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 4/9] vhost-net: allow configuring extended
 features
To: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Jonathan Corbet <corbet@lwn.net>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org
References: <23e46bff5333015d92bf0876033750d9fbf555a0.1750753211.git.pabeni@redhat.com>
 <202506271443.G9cAx8PS-lkp@intel.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <202506271443.G9cAx8PS-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1QvlchIKyFjDlZ-6s0fIsW4GM6yugVgws5Frh8rxoaQ_1751029917
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+csky maintainer
On 6/27/25 8:41 AM, kernel test robot wrote:
> Hi Paolo,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/scripts-kernel_doc-py-properly-handle-VIRTIO_DECLARE_FEATURES/20250624-221751
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/23e46bff5333015d92bf0876033750d9fbf555a0.1750753211.git.pabeni%40redhat.com
> patch subject: [PATCH v6 net-next 4/9] vhost-net: allow configuring extended features
> config: csky-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271443.G9cAx8PS-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271443.G9cAx8PS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506271443.G9cAx8PS-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/uaccess.h:12,
>                     from include/linux/sched/task.h:13,
>                     from include/linux/sched/signal.h:9,
>                     from include/linux/rcuwait.h:6,
>                     from include/linux/percpu-rwsem.h:7,
>                     from include/linux/fs.h:34,
>                     from include/linux/compat.h:17,
>                     from drivers/vhost/net.c:8:
>    arch/csky/include/asm/uaccess.h: In function '__get_user_fn.constprop':
>>> arch/csky/include/asm/uaccess.h:147:9: warning: 'retval' is used uninitialized [-Wuninitialized]
>      147 |         __asm__ __volatile__(                           \
>          |         ^~~~~~~
>    arch/csky/include/asm/uaccess.h:187:17: note: in expansion of macro '__get_user_asm_64'
>      187 |                 __get_user_asm_64(x, ptr, retval);
>          |                 ^~~~~~~~~~~~~~~~~
>    arch/csky/include/asm/uaccess.h:170:13: note: 'retval' was declared here
>      170 |         int retval;
>          |             ^~~~~~
> 
> 
> vim +/retval +147 arch/csky/include/asm/uaccess.h
> 
> da551281947cb2c Guo Ren 2018-09-05  141  
> e58a41c2226847f Guo Ren 2021-04-21  142  #define __get_user_asm_64(x, ptr, err)			\
> da551281947cb2c Guo Ren 2018-09-05  143  do {							\
> da551281947cb2c Guo Ren 2018-09-05  144  	int tmp;					\
> e58a41c2226847f Guo Ren 2021-04-21  145  	int errcode;					\
> e58a41c2226847f Guo Ren 2021-04-21  146  							\
> e58a41c2226847f Guo Ren 2021-04-21 @147  	__asm__ __volatile__(				\
> e58a41c2226847f Guo Ren 2021-04-21  148  	"1:   ldw     %3, (%2, 0)     \n"		\
> da551281947cb2c Guo Ren 2018-09-05  149  	"     stw     %3, (%1, 0)     \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  150  	"2:   ldw     %3, (%2, 4)     \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  151  	"     stw     %3, (%1, 4)     \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  152  	"     br      4f              \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  153  	"3:   mov     %0, %4          \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  154  	"     br      4f              \n"		\
> da551281947cb2c Guo Ren 2018-09-05  155  	".section __ex_table, \"a\"   \n"		\
> da551281947cb2c Guo Ren 2018-09-05  156  	".align   2                   \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  157  	".long    1b, 3b              \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  158  	".long    2b, 3b              \n"		\
> da551281947cb2c Guo Ren 2018-09-05  159  	".previous                    \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  160  	"4:                           \n"		\
> e58a41c2226847f Guo Ren 2021-04-21  161  	: "=r"(err), "=r"(x), "=r"(ptr),		\
> e58a41c2226847f Guo Ren 2021-04-21  162  	  "=r"(tmp), "=r"(errcode)			\
> e58a41c2226847f Guo Ren 2021-04-21  163  	: "0"(err), "1"(x), "2"(ptr), "3"(0),		\
> e58a41c2226847f Guo Ren 2021-04-21  164  	  "4"(-EFAULT)					\
> da551281947cb2c Guo Ren 2018-09-05  165  	: "memory");					\
> da551281947cb2c Guo Ren 2018-09-05  166  } while (0)
> da551281947cb2c Guo Ren 2018-09-05  167  

The intel test report reported the above compile warning on this series:

https://lore.kernel.org/netdev/20250627084609-mutt-send-email-mst@kernel.org/T/#md788de2b3a4e9da23ac93b5f1c773a6070b5b4fb

specifically, in patch 4:

+                       if (get_user(features, featurep + 1 + i))
+                               return -EFAULT;

AFAICS such statement is legit, and the bot points to some problem in
the arch specific get_user() implementation. Could you please have a look?

Thanks,

Paolo

