Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A116EB5F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716284733; cv=none; b=XS0tT7rdb1MNUjzF5/UvX2f4L+v32EWx6J6YFOo6YP9u2KlSI8riTCvKkYSOlfUzaHc9UWjR1U4eZ6VCNCjBaXHqk6ru1jRCVcsul78TVuCyGsxm1ZKlfW5KBuEsttt3ifo8xh7fm06uwslf9XdzbVUvUBJTJPi7J+RoS3p6Svo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716284733; c=relaxed/simple;
	bh=auUr06gKMtQJmw70SqyuisbzOZRSZGi7CZ50SSxwtvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbWFPjOYJgaHiCr+vmPXepleZVGIT3ZS1bWPVGf+MIW7WClzDQLzBCE9qyMrE78Dnc/Rt26nEU58ZuObR+bqFO6uD+N6GAzmRYesXOzcWGvQGEQfVP8NtNSJD9kU+ZmA4kzAHFrqlsMpUIHyMDMBZwjkCtS8Yg6OsM4cMly+rbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KD2YMljs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KD2YMljs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716284729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uutlqnz7GlxG5MMRoikdk+qop535bU307tyY8QMm6Qo=;
	b=KD2YMljshv0/l6JMZ6BeRMFFWl74aYJ0/ky8YcJl4L8BvpOuipEyTPBP95ZP0k1bbFIUaA
	lIXqm90q7zZLW2v8Y6ODfDQcMGGqugoBNCgR0V8lgAverv61EdmFpLl0hXlO3jN/AIISGw
	ONos+vFSBVjtjkwpQxMEtCOjGcWuRCk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-pnuDaxaeOeilyzKY5VU4cw-1; Tue, 21 May 2024 05:45:28 -0400
X-MC-Unique: pnuDaxaeOeilyzKY5VU4cw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a59c0ecd59cso842377366b.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 02:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716284727; x=1716889527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uutlqnz7GlxG5MMRoikdk+qop535bU307tyY8QMm6Qo=;
        b=hkVsydLGWiSky102/UZLrJ2dEswAbgiDFrKHjl3VRsxWBahLVBcfsrTZbqWQqhpIzf
         6FJ2EAs+oz955+D8U59ziPCyZ79qc3ZedpCO5xmZ6K0satlDaFGlWXiaOPvNSQUwyWEd
         l9W8BSrBaYrqjc2NTUMiG31GCgFkoozikOpK6j2V1d60KoZ5uAU4CGIjiZqkg03eCMyQ
         eNmP1Ue793zf5uwEhXqVNS7o/nUAHHNmm08DwJ1Vzb6DeoD43r8Piafx03jGfFdU6+Qf
         9joKbO2hHFa6TCjh6UBdK98R6tLMYiprgfYEypj8cA458zQudgZeoESK5ejRWmWd+Ug0
         PrbQ==
X-Gm-Message-State: AOJu0Yx/SlrgUXIQBroW7i6BhcLUqoSAQKFeRj5WsOQ9e3qdUO7wOLYH
	GET9bulYtM539LEGLpyohr39iWKK4KWcB4+JQenzKuNfeY52rXrIiCYAjnVQ8yXaxFxOhb9QO6+
	CJkMv7cMKCqWzQ/icxIIfJlOyZEOkIT9D4o9RlfaV35Lj8bRgJpUzNOjY6yHEYGw=
X-Received: by 2002:a17:906:b7d4:b0:a5a:1bd8:b7d9 with SMTP id a640c23a62f3a-a5a2d5ccac2mr2984488966b.46.1716284727316;
        Tue, 21 May 2024 02:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE15shLrDIA1bwGzpuKkQi1N9ZuJhZCcByks9Q2SL2bAm9EWYksBkA2ylT1GE1900zyIyzMcg==
X-Received: by 2002:a17:906:b7d4:b0:a5a:1bd8:b7d9 with SMTP id a640c23a62f3a-a5a2d5ccac2mr2984487466b.46.1716284726874;
        Tue, 21 May 2024 02:45:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01631sm1589870066b.153.2024.05.21.02.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 02:45:26 -0700 (PDT)
Message-ID: <e55a1a36-8ed6-490e-b720-a25a0ad57afc@redhat.com>
Date: Tue, 21 May 2024 11:45:25 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: other.c:undefined reference to `devm_led_classdev_register_ext'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <202405182256.FsKBjIzG-lkp@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202405182256.FsKBjIzG-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/18/24 4:09 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   4b377b4868ef17b040065bd468668c707d2477a5
> commit: 9426adb0326a87ed2fa9d010c4c18189047e0c11 platform/x86: x86-android-tablets: Create LED device for Xiaomi Pad 2 bottom bezel touch buttons
> date:   4 days ago
> config: i386-buildonly-randconfig-004-20240118 (https://download.01.org/0day-ci/archive/20240518/202405182256.FsKBjIzG-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182256.FsKBjIzG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405182256.FsKBjIzG-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: drivers/platform/x86/x86-android-tablets/other.o: in function `xiaomi_mipad2_init':
>>> other.c:(.init.text+0x97): undefined reference to `devm_led_classdev_register_ext'

My bad config X86_ANDROID_TABLETS now needs a "select NEW_LEDS" + "select LEDS_CLASS"
I'll submit a patch fixing this and include it in the first pdx86 fixes pull-request for 6.10.

Regards,

Hans


