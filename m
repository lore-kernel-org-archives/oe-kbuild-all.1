Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9656A1922CD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 21:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725399369; cv=none; b=S89hDf5XEoUCB8FsuGLZnho9Uv4hTzP1kTeQl7wFQ5U4xm9knzSOWEtGM29MCmn15SEaxifn/6hKkZfegE2F+gxLX0qIYhE5MASyyxXX7SMbEh1BrFKfl22W68OYCXNoB7wuMfiV9b0tl8GKAdHucq4Xb0wvbgMNtIFK9r7NlGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725399369; c=relaxed/simple;
	bh=nCrFWGMDxQuMbZRItJMO0iz0Ov7WnSxq3I12lkjNzWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mn0MEPdsb97fm5iYPkoEiBWQKAbNQSQdyxpYgr+gjmii5F9976gifGk+7I6vETfvHQYegSRZcfcJz6OMbs0VINNDmFirq1y/JDX6MsGlY66lqE9u8lWtw5K3hA2O9yMchhMMX4FauxydJwom49J1dAuQKitXuJDMmNxW6+zJGVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L+qZLI8P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L+qZLI8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725399365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QOYCBVVf7ZnRwicC9+NS20rvfNEeqfFLMvqFVIwv7T0=;
	b=L+qZLI8PqvDCpHJPhkP4OT/4IAkScggGrEj9ES9lIx73Hn78KVDYUPsvIrI0mNh9D3mZSx
	CK/BgmO9WVxQ/4wPF0pUWtsthZclRLG6oWCPSgoHkSi046jm0P/vFf91WGqYJHlqTrzOLV
	bYd3Qdnvuq83HJy/MDrZSCZhVQF//dQ=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-2DQR6XbjOriGQ4opWpinow-1; Tue, 03 Sep 2024 17:36:04 -0400
X-MC-Unique: 2DQR6XbjOriGQ4opWpinow-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-53445c8a9c8so1102334e87.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 03 Sep 2024 14:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725399363; x=1726004163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOYCBVVf7ZnRwicC9+NS20rvfNEeqfFLMvqFVIwv7T0=;
        b=fg/zTistei+mz3+iJhV3oVy24g9ggZ6JQ0g59SJTybhdoMbmvvbB3K1Gfqe4hMGouK
         0Ldy2m3E4XiF56ypl5cfILEOcFZ8saFOSaYXiCfnkR3jFRD5S0RoisWY33dpcftY/PcH
         xc7CUpsMvyDKuhKjhPEm/KmSEeasmXUmOOx9Fcj80H8TdIG4Aisjgw+NhpBJi5isDMyV
         TfAzKNnLtcAySKQdQ8PmtLUSwJkS7iufE6y6VPYh/6Z1gSSuMW57cGqwoGpWMGyYvxhc
         F16B2bUxKH3QQGqNiSBb4n7EyJV4tk7Y/xd6X6ScPPHBuU1ZLxa7ThgeAhgU75QZOpSt
         fbGg==
X-Forwarded-Encrypted: i=1; AJvYcCWvch+OfYOaklv+Y/xo/JR0f0VbwuMx3tBGTpaf/zum99tSJPhT5bv9vTJggYDlnxKt50tTcwDFw8WDoDZL@lists.linux.dev
X-Gm-Message-State: AOJu0Yx52SjyVwo6FgWNgefuyy0wpTGKH+lZNMEO/8HWs/12ZNQ8LLEt
	1o/+am0HAOFhI4E76aa0MCIRJATMxPAPggGncozxU/eudJscGdA3j7idRD716aUn7rgsyZ9fp+s
	4N63qyjp6pP6JqA93KVvu+HUe4idYxQHTgEZEn721ti7YSVtILJhYI9mKOfGUyR8=
X-Received: by 2002:a05:6512:2346:b0:52c:dc25:d706 with SMTP id 2adb3069b0e04-53546b9b8e8mr11462746e87.52.1725399362565;
        Tue, 03 Sep 2024 14:36:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhZun+wguHVObRsS5/SaDZQzDzbnPS8ajhxMp/REyeS+41joO/Fe23UQc5fc2KLSAPQPBrVQ==
X-Received: by 2002:a05:6512:2346:b0:52c:dc25:d706 with SMTP id 2adb3069b0e04-53546b9b8e8mr11462726e87.52.1725399361950;
        Tue, 03 Sep 2024 14:36:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c241fbceb6sm5164476a12.83.2024.09.03.14.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 14:36:01 -0700 (PDT)
Message-ID: <d5e6a9b4-f9e2-4c6a-ac2d-bba1b12d7675@redhat.com>
Date: Tue, 3 Sep 2024 23:36:00 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [daniel-lezcano:timers/drivers/next 4/9]
 drivers/platform/x86/intel/pmc/core.c:1213: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
To: =?UTF-8?Q?Marek_Ma=C5=9Blanka?= <mmaslanka@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-doc@vger.kernel.org
References: <202409031410.a9beukFc-lkp@intel.com>
 <f385b684-f6c3-4181-8386-68cb4e04358f@redhat.com>
 <CAGcaFA1RbfghBahot831C0ko3Nn2HegNTd0jtD4ajawcsJESdA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAGcaFA1RbfghBahot831C0ko3Nn2HegNTd0jtD4ajawcsJESdA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Marek,

On 9/3/24 11:32 PM, Marek Maślanka wrote:
> Hello Hans,
> Do I need to send the fixed patch v7 in response to the https://lore.kernel.org/lkml/e438d8c4-3c10-4674-916b-dd645d19f210@linaro.org/ <https://lore.kernel.org/lkml/e438d8c4-3c10-4674-916b-dd645d19f210@linaro.org/> to continue the thread?

Since Daniel has already merged the patches the fix should be a new separate
patch which only replaces the '/**' with '/*' on top of the:

timers/drivers/next branch of  http://git.linaro.org/people/daniel.lezcano/linux.git:

http://git.linaro.org/people/daniel.lezcano/linux.git/log/?h=timers/drivers/next

Regards,

Hans





> On Tue, Sep 3, 2024 at 10:31 AM Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     Hi,
> 
>     On 9/3/24 8:10 AM, kernel test robot wrote:
>     > tree:   http://git.linaro.org/people/daniel.lezcano/linux <http://git.linaro.org/people/daniel.lezcano/linux> timers/drivers/next
>     > head:   8f8b0349aa312eb7e67e623ed1f296a04126fe7f
>     > commit: 2d167560d43c809c66e6389b6cc651b77fcbf951 [4/9] platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when suspended
>     > config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240903/202409031410.a9beukFc-lkp@intel.com/config <https://download.01.org/0day-ci/archive/20240903/202409031410.a9beukFc-lkp@intel.com/config>)
>     > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>     > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031410.a9beukFc-lkp@intel.com/reproduce <https://download.01.org/0day-ci/archive/20240903/202409031410.a9beukFc-lkp@intel.com/reproduce>)
>     >
>     > If you fix the issue in a separate patch/commit (i.e. not just a new version of
>     > the same patch/commit), kindly add following tags
>     > | Reported-by: kernel test robot <lkp@intel.com <mailto:lkp@intel.com>>
>     > | Closes: https://lore.kernel.org/oe-kbuild-all/202409031410.a9beukFc-lkp@intel.com/ <https://lore.kernel.org/oe-kbuild-all/202409031410.a9beukFc-lkp@intel.com/>
>     >
>     > All warnings (new ones prefixed by >>):
>     >
>     >>> drivers/platform/x86/intel/pmc/core.c:1213: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     >     * Enable or disable ACPI PM Timer
>     >
>     >
>     > vim +1213 drivers/platform/x86/intel/pmc/core.c
>     >
>     >   1211       
>     >   1212        /**
>     >> 1213  * Enable or disable ACPI PM Timer
>     >   1214         *
>     >   1215         * This function is intended to be a callback for ACPI PM suspend/resume event.
>     >   1216         * The ACPI PM Timer is enabled on resume only if it was enabled during suspend.
>     >   1217         */
> 
>     Ok, so to fix this we just need to change the /** to /* .
> 
>     Marek, can you please submit a patch for this to Daniel?
> 
>     Since the commit introducing this problem is in Daniel's
>     linux/timers/drivers/next tree, the fix will need to be merged
>     there too.
> 
>     Regards,
> 
>     Hans
> 
> 

