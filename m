Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F56328C2B6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926703; cv=none; b=YBMQgrksZgmAQUs2sXKfAKU31cuIp/7lFNKtUbYq3qTUM3iEyI+EbjN1oGG9vBgPpWIT2Mi+xnkANWSikdDRch4nu3EpKxG5h9BRWQWMNGxYp5MaLsAcic/0Fq1jRZDx0DBXJ8LWFcq6ZlC2xno2buFnlLzmJ2gIFphyKHqX4Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926703; c=relaxed/simple;
	bh=lkhYoWliZo0qBG7HniWZomlKD5IPdKFN2EYTk1V74Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIyDV0pr+e+p6RZYRHpFxlOOPvSrsKNq+eYfwE2zUE3ZD1hIdGpqsYD3lNrV31bbKgLnSQxybp85hzRuQk6ztF4/SulXgROywkX9Ievv21cAAC/prNNKervgSrjNEawRgETauoHC5bsCP253VJHnFT2YTE5TAc+aDBwOERHG9Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PrK1MBL1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PrK1MBL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747926700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yWmS2pGh+G6CpF0+2pE42XEqkrsgbtOMzRTxNibzaBo=;
	b=PrK1MBL1qq81qX5HXRDRp2HZaCHVFv01KXXWdKH6r8IQ6aNRNiqZYvxS9UMnWCuRm58RMz
	RB1ZV1D0yTPSasYY2gl3vV+kfU1EeMWe5suA4VoGopfUufkaIAStAcn3A6gblQBRKndFvr
	jWmVCfPJgVpw/YyaUHjW6wbTCQGqMJI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-M6HmQCDVNNCpNxlPZv7zvQ-1; Thu, 22 May 2025 11:11:38 -0400
X-MC-Unique: M6HmQCDVNNCpNxlPZv7zvQ-1
X-Mimecast-MFC-AGG-ID: M6HmQCDVNNCpNxlPZv7zvQ_1747926698
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ad53aaae592so713954366b.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 08:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926697; x=1748531497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWmS2pGh+G6CpF0+2pE42XEqkrsgbtOMzRTxNibzaBo=;
        b=D2PBocvUC/9Jq58Ii0gypgNHUs20p5bnHHS7Gkj2fc4ZXC9PkcREb6UjLr2JNOEy1/
         BALXukf3KpYLlosJmyr/4Q87ThneH+IbLggn5/HFolBaFu5QAXNaJDCuJtQp9MwImEEC
         C0Yf8HKO6sHEiGrwcVl5M/EzGa9L+9ikBT1GhHsHOfAC0NvOxjyhlvqFDTX410OaWGCy
         zH+HlrKrlh24o8sFxjTWTLBPdnGe/p55gVp4HKAFz96OqJIe7xGvIiThUJFokK/D+f4H
         rvjdCHXEdGyuSTtaScSqSXItHeXbywJkO81xKi0e/jSeaUTFAzxKaf0lQIiMLaoIpiXj
         Ssdg==
X-Forwarded-Encrypted: i=1; AJvYcCXacUM9wKf5f6aTEKKlZhsKDlXG62gflqQvqmezc9933e4MsLrFuYlfaANJayDmN3PTNbwq71sk66cpAz9v@lists.linux.dev
X-Gm-Message-State: AOJu0YyalvtvyRs70WRahJeiBEp8motXXAZCHY/+jqQEE1Ecn+EW1cQC
	6XKkKIDAyZzMH0RuQEfvqFbMKXWxd8WPYwkDEsne4y56ZTjolr9TmhgSthMt7ld8VssMQiQ+PIH
	BYT04ezc1NhBkS12UfAIdKlSfs173bNmEXo7pBpzD0WGaeICFFCjC4l+LR386EzkWTaY=
X-Gm-Gg: ASbGncsD30HfGyDyqf+rb4t1s7XM50zWwZwtX/9Gu9wHaVwc8BeHqsoU4oeOjuTP2IY
	tcYmjw1YYqxU39F9V0XL9bOsrN2ZjchsQJ77X2nYDjkEys6Y/bLeTP2EMbYf74dInULTA3SdiBq
	SAzWuOzNNTa73C0642UfB0di48gWmD2n1T2lsCiqLd42tQZL/bj1uWKyM2JsF/VVNsXCgI+RSBH
	XajmQxVl1iMvN/I+0K7Y65Yah2Vf76z1EFTqvgeMIPBiWmPA2BjvN+X9Y0W15DEe322DAreWppL
	qBTBfA9guMcEgr/veaI9AHeSXI0hlEd/aQMVzKAKUfMrBvtOnpAYIuqOoxwGTaHvF43KgyIbWcN
	KRWspLbFV19ztXpUg48pouXRMc2LrjzR1FlOegi1nGNeowM/By5kN56cRMsSrcw==
X-Received: by 2002:a17:907:1c0b:b0:ad5:76a5:4970 with SMTP id a640c23a62f3a-ad576a54aa2mr1521642766b.36.1747926697261;
        Thu, 22 May 2025 08:11:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIN/KdD7jbH4+1Cd9TQM5JESCRP49ASteAuoMqOKFVgceWZVYB+UR2wUo2cbCQIiFDrq+BPg==
X-Received: by 2002:a17:907:1c0b:b0:ad5:76a5:4970 with SMTP id a640c23a62f3a-ad576a54aa2mr1521636866b.36.1747926696720;
        Thu, 22 May 2025 08:11:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af13sm1102918766b.18.2025.05.22.08.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:11:35 -0700 (PDT)
Message-ID: <85091184-1d5b-4a11-a940-2d818d46afef@redhat.com>
Date: Thu, 22 May 2025 17:11:35 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 109/109]
 drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator
 'charge_types' does not refer to any field in type 'const struct
 power_supply_ext'
To: Sebastian Reichel <sre@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
 Jelle van der Waa <jvanderwaa@redhat.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>
References: <202505221051.khDhUKJ0-lkp@intel.com>
 <f981b9ac-41cc-489a-9f37-c9e87e748c99@redhat.com>
 <ba4bcvf3tjqunxncrqeire4j257px4plbk5eew7sfbmycscbys@xymzswpfmadw>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ba4bcvf3tjqunxncrqeire4j257px4plbk5eew7sfbmycscbys@xymzswpfmadw>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qAOEXFFhdBfxqvVvvb8Q_TMtc1HxZLGycgzjukIBJsI_1747926698
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sebastian,

On 22-May-25 3:52 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, May 22, 2025 at 11:36:47AM +0200, Hans de Goede wrote:
>> On 22-May-25 4:39 AM, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
>>> head:   b2012b38080e2f92d43eca59e8249c174a27527c
>>> commit: b2012b38080e2f92d43eca59e8249c174a27527c [109/109] platform/x86: ideapad: Expose charge_types
>>> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250522/202505221051.khDhUKJ0-lkp@intel.com/config)
>>> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
>>> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221051.khDhUKJ0-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505221051.khDhUKJ0-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator 'charge_types' does not refer to any field in type 'const struct power_supply_ext'
>>>     2044 |         .charge_types           = (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>>>          |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>     2045 |                                    BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
>>>          |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>    1 error generated.
>>>
>>>
>>> vim +2044 drivers/platform/x86/ideapad-laptop.c
>>
>> Hmm, this patch depends on:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git/commit/?h=for-next&id=c1f7375a246e5f810191a6c3031d2fa2b80e9f5e
> 
> I should have merged that through an immutable branch :(
> 
>> I guess that that patch is not in review-ilpo-next,
>> maybe Sebastian can take this patch instead of taking
>> it through pdx86-next ?  Or it can be merged after
>> 6.16-rc1?
> 
> I will be on trekking trip for 3 weeks starting on Monday (more or
> less directly after sending my 6.16 PR), so I don't want to take any
> late patches as I cannot handle potential problems.

No worries, I guess we can just merge the patch after 6.16-rc1 then.

Enjoy your trekking trip.

Regards,

Hans


