Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CA921A45A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714236; cv=none; b=b1+3vJlKq1bG2AhkIlGToRo8sae36Bj7G7vtfxrmRTGQ35+qvB8+N16kTafeiDg/HT3wyXMYHl+DMPVXPXja++ZCYj46W/Z0bhF38QJ2xe8qP10U5qgu9I7mweym9makX/U3T9ArdcZYfH5oUL05nXJgVzdxQNgulChYxNEVuR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714236; c=relaxed/simple;
	bh=0kRMw6SphHS3WoqMjpyaGllomG4am6IMUg/Z4vnnJRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dfR9LJPhQzIyKDZCdKngZofxRqYasqJIo93pgq5GDtggwu30BTrIS8vaQnKzkBrzOHcncpj1uuMDug9FOl1As48+wu5aYRgdj3YW/kA7q6iKs2B0O/FSvqvXDW5Ib+/c6iid2/LUQg6mPqmhwkx3yBJcQtdCHRs+V8M3B8hDGas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkbRlliB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkbRlliB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21669fd5c7cso21526375ad.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 09:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734714234; x=1735319034; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=we+WXxtsGrv0pNus+2PJBBsf74XQ21BNbwwUUD4AVGQ=;
        b=QkbRlliB11yz4GmnANn9RKQjIKSsX/8OeireKYclNzsMAHEe2LRCEYfmLTkZKKaerw
         R41JqOMqWPY32HNlf6CyAeXoKRfgBk4njPYA0dFYBldN+ae4jHDrt8mYRYZ5AehO+zhI
         +g/fTPG/SVU3LHRaKvM0ko/FNE8zK0shrcjVyf60oNUEWMyNrDw7KeEebCV9IXjfb+L2
         vFPxXkGLq0I2ab3hlc0pJ7toCAi6gphel32T0t+ZH9aMM0U49hUBiwCETF9lmauyfxxr
         zDeRT5AltPrZQpe/wTjeUHz2xAM2UZjHP1dCTz3Mrr6YMXKaeHg+gmJK1jBrb1/R3cMT
         3YGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734714234; x=1735319034;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=we+WXxtsGrv0pNus+2PJBBsf74XQ21BNbwwUUD4AVGQ=;
        b=Z5s2mbmbP6+0CYlqz+mQoCHs+k9bvvB3lqL0I6rcS1Gs3LHWbIlhV92PaJXx2W47dp
         XKH9cvaPZ41ZGHtdfL6OW+lchQTkGTLg/VPlU0J3xyzC+onjlEVwMICiQqT7gdSS6uKE
         Zcnj80o+vVSaMTevCrc34nys4ij1ZjLF6JyHRmmonkCVh10h+oGXicvPULPWVfY4F59C
         +UVVLYXJx0KR8rqu2XeLB/+0rQUtIPy20q2xQdNwpjGc9ocGRgf7iSYzCB5SZQJd+b65
         gwervo0ms2Cq8un3Xo9ulmL7gnEoV+qhD8JJspnU399NC1caZjes7C39HEXZ/Pioqe+E
         j8/g==
X-Forwarded-Encrypted: i=1; AJvYcCUs/lLg/MH++/dQSEr3a19SjCa+simoXqNPT2vpkzwGsgqba7KIWcImW+7H8OfBTb9W9QiWLSDqsQlAzbYc@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz4k2fyUKhA5G1As+WWLzaNWMtE8+497Lv9I33oZuxQU5NBngy
	M2wMk67BVPSAyJgZnIlKj8HRhy0VoJ/yGVaICqbkBXOQyXnrdfwx
X-Gm-Gg: ASbGncvID+r9ikI95AH8P0DQbD5cNDnA+5XYpm9d6eteuOYwpGbtoSVs8/Sy+SqHSfd
	RMX+zTNK4m/IdyUM9ZvAb5r0jnClog7rcos1s2TLgPS0yKV9yzSwrkdRj9EEAgxcDrlh6Sf6OCZ
	u9VPA1AnLdKFWv28bvSr+fdEqUdD356cmhttJgbstg7oE/7vCWdEONgmypZzPugKphzmXO1HdSM
	q1SejHKGacd1tD5BgffRXOhCl6N1R0MzuqmpZXa6lyf/eHwW6/37iXBZ1oSIJmPZAh/XY3C2YrY
	mTwHwZoYL8mwkK0MSxmzB8dO5VtNgA==
X-Google-Smtp-Source: AGHT+IHKaBy1NYpophugpV4KP67tP5vFbOfQbOogNHbZ82vS+tl1EbKjHbMZ5ehrW3Xb3jtQ4hCXeA==
X-Received: by 2002:a17:903:2cc:b0:216:7aab:71f0 with SMTP id d9443c01a7336-219e6f2f028mr55406275ad.38.1734714233501;
        Fri, 20 Dec 2024 09:03:53 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f5147sm31288325ad.199.2024.12.20.09.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 09:03:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e76a0071-b6dd-4a99-9a78-69f104278c70@roeck-us.net>
Date: Fri, 20 Dec 2024 09:03:51 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/hwmon/pmbus/ibm-cffps.c:184:60: warning: '%04X' directive
 output may be truncated writing between 4 and 8 bytes into a region of size 5
To: David Laight <david.laight.linux@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Eddie James <eajames@linux.ibm.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202412202139.tZ2VJL2f-lkp@intel.com>
 <b8b9dc2c-cb70-41c5-8606-eb3aa6cdc257@roeck-us.net>
 <20241220163056.7bad4962@dsl-u17-10>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241220163056.7bad4962@dsl-u17-10>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/24 08:30, David Laight wrote:
> On Fri, 20 Dec 2024 07:21:18 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 12/20/24 05:54, kernel test robot wrote:
>>> Hi Eddie,
>>>
>>> FYI, the error/warning still remains.
>>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   8faabc041a001140564f718dabe37753e88b37fa
>>> commit: 2f8a855efe8a6faf962c53af406e5ea4791b3877 pmbus: (ibm-cffps) Add support for version 2 of the PSU
>>> date:   5 years ago
>>> config: x86_64-randconfig-077-20241209 (https://download.01.org/0day-ci/archive/20241220/202412202139.tZ2VJL2f-lkp@intel.com/config)
>>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202139.tZ2VJL2f-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202412202139.tZ2VJL2f-lkp@intel.com/
>>>    
>>
>> We could use %2. 2X and %4.4X to make the compiler happy, but those are false positives.
>> rc is known in all cases to not exceed the format size. I don't see the point of changing
>> the code just to make the compiler happy.
> 
> I doubt they'd make any difference.
> 
Yes, you are correct.

>>
>>>      drivers/hwmon/pmbus/ibm-cffps.c:171:60: warning: '%02X' directive output may be truncated writing between 2 and 8 bytes into a region of size 3 [-Wformat-truncation=]
>>>        171 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
> 
> The only ways I know are to bound check the value or to use
> OPTIMISER_HIDE_VAR() on the length.
> 

-                               snprintf(&data[i * 2], 3, "%02X", rc);
+                               snprintf(&data[i * 2], 3, "%02X", rc & 0xff);

works as well, at least with gcc 11 and 12, but I really dislike that kind of nonsense.

Guenter

