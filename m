Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34BF20C031
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739364079; cv=none; b=GT+U9/Hm/1/kYnUmzrWMrGpLEcjT33rXZV5iRPCwSYnJYR9oAmCG29yRtrfxkybbKnXAPg4VmsTJFmbLLTNm3B3eGbaXLhQadadLwzYq25IMKwqhZDt/psWkVOdj1P6mLqUAnEcYTI9uWNMDGAjrKUMLc3ur82wp0TKWmKdREOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739364079; c=relaxed/simple;
	bh=ME5xsF3un+RPwTZSAF0pplXPAeDr4ydnwfVUmHp8McU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgyXa9ptBEAQk5h5Lt0eJuTlFy3gJfymWYFrMsgzPRDZ4mvotX+Y3w2f8zHtw3vsuelfynV5BRf+UOg6KyrKRsLwTtnCV18y+Frwx0EI2VjQO/VNBvigtNv0U9TKurJ3Uov7RLvfQexjh7fNxWwAW/yHx8O/ptD8q5L5fepYqZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IMc9ov/k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IMc9ov/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739364076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IcCcfwfQhYUa1+LUaKcJqa7S3yY7KgRC7fJ6fRDLjdI=;
	b=IMc9ov/kOTB3KB2ZzP/HhuOryZgvCns/3RNzCHQab0SYLIZZxI+Ri09Bv2jul3VS2oI5H/
	sWwbNteHZEj1nQJkHZA6qUTIrxukBB8C/211Tm45f2RXRT5YbF+tjctaVfmYZ8YKX7mf7b
	kTZYLORrWxdQoKHMmDJ5q1IdZGbfbQw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-jmqvntxtN6inlX8YzEQE8Q-1; Wed, 12 Feb 2025 07:41:15 -0500
X-MC-Unique: jmqvntxtN6inlX8YzEQE8Q-1
X-Mimecast-MFC-AGG-ID: jmqvntxtN6inlX8YzEQE8Q_1739364075
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-471bb28454cso3689811cf.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 04:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739364075; x=1739968875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IcCcfwfQhYUa1+LUaKcJqa7S3yY7KgRC7fJ6fRDLjdI=;
        b=Rih1LbGF0cJCoyWbRq3NxksTJL7tqu45Wn+BWBCsWQKdMUWlBdNlLYa1gnOpV9jytE
         djfowYe+k3ggKVbjBj4THWCMEUwAtxsvVOrLh6SIn7v848bAxIc34Pbh1MSWukumc2Jf
         u/j4NYyQIp2niVW41WA0dKv1K95eZMNaMX1gyPFGSRmC6pIy/mpb77PBwhCfWGdzGVyv
         Zwu7J12KAYK/w49qWs6NZB7dUisCmkyoJqIqtQ8QxkvY51oWCwdEOuSKOQm8ULr0PXzw
         4NU7MJlh4wT4stNdUNMbj9izvO7hLP+HFn6gR4DZlsB+IYMW9u+nyf37DAlA/kZFM3Jz
         Q9Ew==
X-Gm-Message-State: AOJu0YxS7ny0XBdcYhkZ5pkNqiv9k5Qk+MJhlgYKvUuqvP9vt+E2yZjs
	QriRlpe4u/SPc+bfFqA84gUShfZnNyf0CXXfrSDMPImR0uQ/yfU/qSo3mMcwKxAW89/n/bBvRZz
	hmBz9u8gxihVyqi+SW+8wAejjh6lR8feq8QgrEYdZFlEHy4QfgeLvXZukhq2SBL4=
X-Gm-Gg: ASbGnctOtiMY3BJ/DR4y/cqfCMYPcF5VX2gJ7+SPQWsccwAvmn5OfPS6ZCCUiRkOG3s
	V7DaNQdF08cVAAhjtYHNBPAjnycRdVisAy/yySDQOjGiFQTc/ZZm0gZqgL7KjBqx/sRTOOTUkUB
	9IZiW/4TtZRaWmToZdqyjLzBVNoxeGt+2a6WyDyp+d/JTDtblr3bQ45pWexdiAYO13c2XzNS2iz
	GhICXXfBcpTNRhwVtsUsFyNTk6KrvkEVLSi/E7w8HTAAebt3ZrVNuPFaydYcm2JsKXRsyVvrYtm
	XpdM
X-Received: by 2002:ac8:7e90:0:b0:46e:2d0b:e1bf with SMTP id d75a77b69052e-471a1285b1dmr107223551cf.11.1739364074940;
        Wed, 12 Feb 2025 04:41:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEc/5GZoYwqTghTlMDfKo+W14Qj3PAyNsgnM8EOKyze88sNfy/x51BtROYbXMZUOJtzdRgkfg==
X-Received: by 2002:ac8:7e90:0:b0:46e:2d0b:e1bf with SMTP id d75a77b69052e-471a1285b1dmr107223131cf.11.1739364074559;
        Wed, 12 Feb 2025 04:41:14 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47180b1ca44sm51284181cf.76.2025.02.12.04.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 04:41:14 -0800 (PST)
Message-ID: <9416ee48-a68a-465e-85be-89d5a53afcd8@redhat.com>
Date: Wed, 12 Feb 2025 07:41:12 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] intel_idle: introduce 'no_native' module parameter
To: dedekind1@gmail.com, kernel test robot <lkp@intel.com>,
 linux-pm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Prarit Bhargava <prarit@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250211132741.99944-1-darcari@redhat.com>
 <202502121732.P7lZkbhm-lkp@intel.com>
 <21e66060c13c6a3cc33592f71cb08975711a6adb.camel@gmail.com>
From: David Arcari <darcari@redhat.com>
In-Reply-To: <21e66060c13c6a3cc33592f71cb08975711a6adb.camel@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: le6KDGFJsry-kTAvd_U85jAK6Xl6RDRJtGWLWMmHPEs_1739364075
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Artem,

On 2/12/25 6:32 AM, Artem Bityutskiy wrote:
> On Wed, 2025-02-12 at 18:09 +0800, kernel test robot wrote:
>>     drivers/idle/intel_idle.c: In function 'intel_idle_init':
>>>> drivers/idle/intel_idle.c:2289:27: error: 'no_acpi' undeclared (first use
>>>> in this function); did you mean 'no_action'?
>>      2289 |         if (no_native && !no_acpi) {
>>           |                           ^~~~~~~
>>           |                           no_action
>>     drivers/idle/intel_idle.c:2289:27: note: each undeclared identifier is
>> reported only once for each function it appears in
> 
> David, this must be the !CONFIG_ACPI_PROCESSOR_CSTATE case.
> 
> Thanks!

Oh - I see the problem.

After a quick look I see two options:

- #ifdef the code that doesn't compile
- default no_acpi=true in the !CONFIG_ACPI_PROCESSOR_CSTATE case

I sort of like the second option better, but I worry about the 
documentation.  Specifically:

"In the case that ACPI is not configured these flags have no impact
+on functionality."

I guess that is still true.

Perhaps there is a better option.  What do you think?

Thanks,
-DA

