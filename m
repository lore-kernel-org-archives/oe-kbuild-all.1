Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF23A21
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 06:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHeS1yQr"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a1b7b6bf098so64287466b.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Dec 2023 22:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701671895; x=1702276695; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYkuRI2m7gXvcv1On4oJWW4OK0PwVwiAqFsMBy1aG3o=;
        b=ZHeS1yQrZA4pQ8XWfZIYp51iHqSovGI7H4IyvRhyapGdFB2OWrgyovmi+6MCbrAlJc
         sA1w6wSTeebjPCJJDrzdD5uGLOcrT8nZJlbujbL1DSurFqPM96ZZelbJ17daNZ0C5Cqr
         Rlug5t0Yg2OYwcuwJDn1rThWYpfeSwYYxf1rNmYPHTJkPRTfVAqp/5+X49dItVKt+d+4
         t9jTMtovPf6db1jrYKsuICcztr/sD6r0xuOyOWU6hcPp5mG6pKZU27OYQxCd3IScLR9O
         jlZSy1M9WXt0zs5l9jFsLOk63La0rmUyIPgyCRHoPQogJs6aaazOMDbMUNdl0yz2E0Ve
         ZS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701671895; x=1702276695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYkuRI2m7gXvcv1On4oJWW4OK0PwVwiAqFsMBy1aG3o=;
        b=Wiw0lXYlcxjQu51pkv0AlUNZ9lIXnwAoQTdlcV1NVX5lR4agaMCBnEivZUHNGVL7rn
         GwzFv/fkZv+fs+8yvcf7uYZLtVgyWICWlUuaui1kLrq+bNuDVgxXTWWf9CvVVIyDNnpB
         iiRHY3TU4cfspIpkota5bmIMXX+LQBVla2obOtRLyfECi/Lyg7aPDMI85fEKk1TWKQON
         KEHlQugm+N62WT7vyZWpkXo7cr5mVG8RTjSFYTCeajfnqI5hl0SSGbJgc7RtAyi3hOlF
         yY0q/2tYsjH3S9UWku8ktzeQdCN9b8eeMYPw85MJJYkmcDZslmJzCUaeHMnjqrKr2+yc
         UpDA==
X-Gm-Message-State: AOJu0Yzw8moa25NqNyS/So8eBPLGD5/9RWL5qPVwUjKFNg/GqEGG6WdU
	Z0MXJ+DujOa6wKTWcLplU6U=
X-Google-Smtp-Source: AGHT+IG2Dnzu8wpudFdNimHjIwtnoLtfFrOKx2kVghmCSKdW92/o+Is4OyJwD3zNKDLmhR9iZkt35A==
X-Received: by 2002:a17:907:2443:b0:a19:a409:37d7 with SMTP id yw3-20020a170907244300b00a19a40937d7mr1350485ejb.48.1701671895028;
        Sun, 03 Dec 2023 22:38:15 -0800 (PST)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id kg6-20020a17090776e600b009bf7a4d591csm4965910ejc.11.2023.12.03.22.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 22:38:14 -0800 (PST)
Message-ID: <c825b030-1520-426e-a6ad-7df0c276b3ea@gmail.com>
Date: Mon, 4 Dec 2023 07:38:13 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] egalax_ts_serial: Fix potential buffer overflow
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 zboszormenyi@sicom.com, kernel test robot <lkp@intel.com>
References: <202312021646.cwwvptuB-lkp@intel.com>
 <20231203090600.85890-1-zboszor@gmail.com> <ZWzHv7X1UKgJJYTy@google.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <ZWzHv7X1UKgJJYTy@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

2023. 12. 03. 19:35 keltezéssel, Dmitry Torokhov írta:
> Hi Zoltán,
>
> On Sun, Dec 03, 2023 at 10:06:00AM +0100, Zoltán Böszörményi wrote:
>> @@ -42,7 +42,7 @@ struct egalax {
>>   	struct serio *serio;
>>   	int idx;
>>   	u8 data[EGALAX_FORMAT_MAX_LENGTH];
>> -	char phys[32];
>> +	char phys[NAME_MAX];
> This simply wastes 200+ bytes for no good reason. It is perfectly fine
> to truncate phys string (which does not happen in practice).

Okay, I modified the phys[] array to just be 40 bytes.
That's not that wasteful and still avoids the warning.

I noticed that other TS drivers emit the same warning.

>
> If you feel strongly about it then maybe use devm_kasprintf() to
> allocate the needed buffer.
>
> Thanks.
>

