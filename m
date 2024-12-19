Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B260A41C64
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734621646; cv=none; b=mbaDroETqFUrlf3DrpkZn1upuBGGEIjpOZQf/x9toL8UmW7o7Pez50b14IrevMKvYF7SfaPet8QCD1qkk27qDwV5+JH5ocHgiTeipUQcd/6Ds+KqP390GIk7/IQcn6uR1rS0PudXIXydmlh4e29sYvHRahpBYidwg615G/MQ+ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734621646; c=relaxed/simple;
	bh=0atyTQrVs5TID2Q0NIU1AGeubueStg+OLX5gkBglMfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+4ABNVU2Xwe4ceC+9noKrhxjCFsO5nk29Uk6BTn+UMz5vKj50f3BicxOzbF8RcXTxpg7Z5dlIZIZKPNqk7gI38pUgfyG5ZWP/r91UDBeDc826knAOfqmt/uDN0Gyp7oMTffqdU/CjHSVrgRLeTe4Z01Z4O7/kDABPdg91aAm6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ky+HEUDQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ky+HEUDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734621643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxg4/kgQg3JhR6w9V1JHaS5wtmU6rL9vlsSmcvQXPGA=;
	b=Ky+HEUDQuYFw8h+ekkWVMj+FngpU9iDaMX58y2c8c5sHznHFHcMIagIFhm6nX53tkRKazp
	tIu3gaU/mW8JbvBYjyS0+4zIAf9FTD0nx5KbzqW8EuTaRfE1QKYJR9d6XK+s8NfvizILET
	rsm2hjViQDc+c8Pz3k7uMHJL9yAadMo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-_U34Qp1FOoGuVSDBYkmokw-1; Thu, 19 Dec 2024 10:20:41 -0500
X-MC-Unique: _U34Qp1FOoGuVSDBYkmokw-1
X-Mimecast-MFC-AGG-ID: _U34Qp1FOoGuVSDBYkmokw
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385e2579507so456802f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 07:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734621639; x=1735226439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxg4/kgQg3JhR6w9V1JHaS5wtmU6rL9vlsSmcvQXPGA=;
        b=SxdTvEEVIiaX+elUMbj0ehwb16JKmztGe3KLUMoE1kNKSuZpNniHTFrm39CVVha3jY
         u2AgeqII9cUTOVy0jtNU8KqLAUUveW8UOKNNmHSi//e2ebfquyKCdj42Ez+Kq+9Cs/4z
         woJRg9ocdKmGn2E/r21lk3P6+dzUJT/z/MwQvWFRnWieeuCA5zcwBulEWX5OMVeX59NT
         LR3WjJTL7Ml7AZYyldNKYEUDFcgOmc84t1mG+1jOGVL2AeRF4u1AEvCoDtLWPOi3CDIg
         +lneQ4rmRqGXmxRGWF0KZ6JDuhisjNKm1ZK/KIMLpd5YUQKnrKOyKg6b4Kn9BD11ymvZ
         A5eA==
X-Gm-Message-State: AOJu0YzsHY2Pjs/quT9UaTlDl2RRJYcYSx00DG7gqdcxRVSsQmzenWo0
	WQMm7E4ZRzGPMFthWw65MUkQMvX/RDHOYuaBHqUTr217Ac68lAR8y/c+yYWlkzM/11bQiY8OIWE
	Adttu/tUUEJP0MeLrFN+QTX3L6ZZy5KU76nxt4GnanIWreL+GwZmpR0CY28K6d3k=
X-Gm-Gg: ASbGncud3pV/73PX1o2rsOYaZL9tQfPqEcI6Vu/EGiTHkZs1GEdfO8xlfhCGGHdv4gX
	ya/aUx3cRCSHu7cynCZs6kfpAcHGLt1sDmsRTe1v21qAiDQrFYMCty9hhW6Qbx40MQ+8dJcjCC8
	pTYZB9KyRKXFChTdPziarGylYRU1LF3DyFWigrFpes2KC6nSHUFy80OweDLhniWnIyCvWCCCkjP
	aUSkSFFYulEtdK4tojzBu0mulJx0hzGwsKWQxeNuvDZcg1Dac+Um1XV0tEbmHZlUariE4USE6z9
	zF2lV9zb5lQuBZ6GKNI/
X-Received: by 2002:a05:6000:154c:b0:385:fd31:ca34 with SMTP id ffacd0b85a97d-388e4dadddemr6455714f8f.54.1734621639356;
        Thu, 19 Dec 2024 07:20:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFATn3RMVm8OeueVi1fHg2WiUqo9D/01bxh1x27CUDyyx7n3ViVQbuGJ06xouj6hEQi1TZE4g==
X-Received: by 2002:a05:6000:154c:b0:385:fd31:ca34 with SMTP id ffacd0b85a97d-388e4dadddemr6455685f8f.54.1734621638910;
        Thu, 19 Dec 2024 07:20:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84ca21sm1795545f8f.63.2024.12.19.07.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 07:20:38 -0800 (PST)
Message-ID: <1403a6a1-14a4-4f94-b258-f71fe6c3c827@redhat.com>
Date: Thu, 19 Dec 2024 16:20:37 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 2209/4829] drm_log.c:undefined reference to
 `get_default_font'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, John Ogness <john.ogness@linutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <202412191602.ZxU3mrBS-lkp@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <202412191602.ZxU3mrBS-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aNdaxXwkzhf_pcvd0jEhUfl6vX74woZ3c8dAkcbcmdA_1734621640
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 10:09, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8503810115fbff903f626adc0788daa048302bc0
> commit: f7b42442c4ac142ab5e261858cec48eb6c9c1567 [2209/4829] drm/log: Introduce a new boot logger to draw the kmsg on the screen
> config: nios2-randconfig-r071-20241219 (https://download.01.org/0day-ci/archive/20241219/202412191602.ZxU3mrBS-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412191602.ZxU3mrBS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412191602.ZxU3mrBS-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 8503810115fbff903f626adc0788daa048302bc0 builds fine.
>        It may have been fixed somewhere.
> 
FYI, the fix is already merged with 
https://patchwork.freedesktop.org/series/142493/

> All errors (new ones prefixed by >>):
> 
>     nios2-linux-ld: drivers/gpu/drm/clients/drm_log.o: in function `drm_log_init_client':
>>> drm_log.c:(.text+0x2dc): undefined reference to `get_default_font'
>>> drm_log.c:(.text+0x2dc): relocation truncated to fit: R_NIOS2_CALL26 against `get_default_font'
> 

