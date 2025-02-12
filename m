Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E13C20D4E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 12:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739364828; cv=none; b=rkMbbKK6nb+B2jamsw4zAnQEqL/09mzNAbWuHvGkNzb2E8e35bQAX6roxosCcDaU2dHoKANrFeln0WkBX0ah6f6yky96c8aNNQVjdy/Ihn3HrGrF7wR1Pq22wtRwR3Zys+DbimO0hd4ZZruV/CZQ8B3qgJzk0NOi0oO3P/61+vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739364828; c=relaxed/simple;
	bh=W4vUf1/0kFjyw3Paou9TarghzObDE/bTqGE1At5j+8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHwTLdk5RQ3NMoGtr9QmyY5MwTywIAJG2a2BBtlefu/nyxM4qGtb6IUkMNo0n8jN0/diF+Kmtey5M5GqcglwG/1LoV9QCyymNH7J6DcHHBYVfg457/O0pfh5Kpt3SxhVvqS34WG4B+F9QfjGn5pztfCwvKzV7rXWS8Vs/iOK9F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O8aJh2Bj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O8aJh2Bj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739364825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=knzBHB+xibELoM9METHHEBNydWfuqJFvfie23B+AtL0=;
	b=O8aJh2BjPCAvji07nv1DJcxjEBEcKsqNKXiBXyMdeBqi0xwmTJRMwe6VGBH1oV0IipotdH
	qRaY9+rs5KISStq10GtTGgE9k6hd0DreiJPtUxO/sgt5qVhlXLpNDIGxR39DkaxYN/4nxR
	9scJQLOTmdy17tA8Oshb1Xdo8TABTcI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-ZFj6jpwdNVGXSrStVCZzSQ-1; Wed, 12 Feb 2025 07:53:42 -0500
X-MC-Unique: ZFj6jpwdNVGXSrStVCZzSQ-1
X-Mimecast-MFC-AGG-ID: ZFj6jpwdNVGXSrStVCZzSQ
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0789c7c67so29553685a.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 04:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739364822; x=1739969622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knzBHB+xibELoM9METHHEBNydWfuqJFvfie23B+AtL0=;
        b=paB5S0WL9Vd64W7Aswklq6janxG+WfXR9wfJI8nDwHctyWuiOh9/VwziSXhSYt1bqc
         iJFy+zXW8UFm6aKf9BncfCZpUSgHoqWypNmQbI3mTXB9kxlAD52K/fU5i8bVPmJ2rzdE
         rLdfhem3Le9CBc+rYRjQ+T9hZYBJOCnKYBnc27nHt/K4tw9j+j6f9xUkcaBq+i9+UfiA
         oAKYqJdg9teOc6ZS1zrjpnznMJxuGoHZOt4vfTMjlxItkBjere84/xTaljv7aBR0BAEI
         Vb+oABrCUiYMrD1KAC1JJrrtpcmbL9j0ybeMbMf1zcUjMp1TO7UtF7Yrl4fydFVdS9Wt
         623A==
X-Gm-Message-State: AOJu0YxjFVy4Ipbu/5UpVQ8Itgo10YoS6Q/luyapuhxiO/zrFb+FMn6l
	+sQjbBnruCGCADFQ32tJfky0OalcmNE7bY5rtFIufY1EkDKxcQyBMC9KbL3D+Jp7cjgUjUblPM4
	zzZSIdQdwEM0kg27prtkpZbGF1MIsNpu/8/XmCdjyW1+iikD9NA3N2LhxXrvM9a4=
X-Gm-Gg: ASbGnctZyvKVd0fIT70CyeADQ3iVs7bVq5ilShofUbao8dY3oEQn36j5ObQBu6UkJ3M
	wNDyyfJm3oOZ6p/Zk1/HoPNetF+KZ9Om2pQ58pj5KpsddL6doYzelI4VCG4tI4kC+zSx+NMt1tL
	qcoD+3FFeLd8mC3tx1BB3akxJaNu031L2+rmEF3Wxw/TkgalOrEeGKb0QA7wZib9nfXj0EtG/FC
	TFLu9Kmn6oGs1/uAZsBbykWMEVWb+emTYr7BDxvecmzL4MDjTFleUV+QLx1kZlyrmSfHOUcunA7
	izIX
X-Received: by 2002:a05:620a:3950:b0:7c0:589b:2f3e with SMTP id af79cd13be357-7c06fc88adcmr407301485a.29.1739364822205;
        Wed, 12 Feb 2025 04:53:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7FcO8kuy6Gfi4rIlvRUBrNcSfOrvcVLper0drGWk6xj15NOdU6I+CCP8OX2xjc19cBs0qPg==
X-Received: by 2002:a05:620a:3950:b0:7c0:589b:2f3e with SMTP id af79cd13be357-7c06fc88adcmr407299085a.29.1739364821922;
        Wed, 12 Feb 2025 04:53:41 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c07518e80fsm66396585a.26.2025.02.12.04.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 04:53:41 -0800 (PST)
Message-ID: <1d2c943f-9521-4dc8-b798-06cbb84bb7dc@redhat.com>
Date: Wed, 12 Feb 2025 07:53:40 -0500
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
 <9416ee48-a68a-465e-85be-89d5a53afcd8@redhat.com>
 <b7ed8d0b07e82a637bfc8a3f4d592f0f15ba9688.camel@gmail.com>
From: David Arcari <darcari@redhat.com>
In-Reply-To: <b7ed8d0b07e82a637bfc8a3f4d592f0f15ba9688.camel@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c1t8QJggsG5vGSI5oVrRTuMZ8Doxmcv8NO2L8IgSPco_1739364822
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/12/25 7:46 AM, Artem Bityutskiy wrote:
> On Wed, 2025-02-12 at 07:41 -0500, David Arcari wrote:
>> - #ifdef the code that doesn't compile
>> - default no_acpi=true in the !CONFIG_ACPI_PROCESSOR_CSTATE case
>>
>> I sort of like the second option better, but I worry about the
>> documentation.  Specifically:
>>
>> "In the case that ACPI is not configured these flags have no impact
>> +on functionality."
>>
>> I guess that is still true.
>>
>> Perhaps there is a better option.  What do you think?
> 
> I've not been involved into kernel that much for long time. In old days
> sprinkling #ifdefs around was an anti-pattern. Most probably nowadays too. So
> the second option sounds better to me.

Another option would be to change the offending code to a function call:

if (ignore_native()) {

And have ignore_native() always return false when ACPI is not configured.

And yes I should have built and tested the kernel with ACPI disabled. 
My apologies.

I will do that for v4.

-DA

> 
> Artem.
> 

