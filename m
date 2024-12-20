Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D0221B191
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 17:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734717390; cv=none; b=ZHjFn6j7pHti6YAisG3kLqKX8xgRi9k0t6U1rW5DWTBYNqNy3fXM3Utond8AJ5mFGjJV3J7YgGJNfk/w2R1PCMXYTng0WvRoRdC9uGAJMkziSIyjdPEMcDLvTu2KYkb28tZScvtALs/uzljUGsIfszYmE5JfPzn6dwu5amDNsEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734717390; c=relaxed/simple;
	bh=ZssHTtwuAEuFLHBiJzNavKRacJfw9OmZtHdNKn6l570=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKG3H226StAmcdeTsuh18NiioIcKsoq4Dd9J6TmPU3Bi7J3uwwMXQZZzogjg7FtWvXpjvxDauzmSc81GQEhItW9cphdm6BJVXcAGY/QIMC5CPe3dKROMzV6QX70flcpJQ74zx/Hlv8V1gKBBvIfc2nv5yIDudyDqkzxQwAipebM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vd0YiOCS; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vd0YiOCS"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so1556733a12.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 09:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734717388; x=1735322188; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kPPoPflgR5Y7FB7919rc5lq6nG94jnWOh++J2lp9DN0=;
        b=Vd0YiOCSbgmkKQxid/md9xuEPJPJnmT8d9b6UdTTNwrrGbElwbzbi5O8uL7x2N/Wz0
         fPSpOLXPHGzCZSYUiY6HoxPcex4d+sRzD/FvdWv/71gDWvG+oRuKTKY9hRDrd1zA2G2F
         DxD589CjL895Q9LE67MH1ZUT0Ov+Z6vxodwebabrSEqyC0qyAAyNgtY7ycQW/tpzPPRu
         4D/mL4s6C/YS738NlfKbYL3N9Vz52J0ixIFVP1N433Q1+s2rox0XAV3htwtEX/bz4m76
         BK5EKkXEDgtjucINBE4eNUCJ9U6ZcWckneaRbe+LcgSzvMCgDiyIBpzA/7dzbl44bMBi
         xMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734717388; x=1735322188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPPoPflgR5Y7FB7919rc5lq6nG94jnWOh++J2lp9DN0=;
        b=CdUgFexv9ntOypENL/RZe3xUBExahf1Ox4fxz2Pe28ZiJi7fjE+8+ErszYK9onuzWz
         ldK8l42AdOoeLJXcJCcIwIc1iqrIYtFwv42auR9dYDVCYhfYr/jst7h73NWvG5uQ5D6i
         MW9T9kI5IYTDP95M16Snz1qoR4BYOZ+Upj/hyLYC472Z5AHRuf/oag0ZyrQd/2kVKVDQ
         tjC8WMhldHmobVDHNikqlbMlkvomuRCUMOj4kQr5ir43AjXRJe904yQtsiL6tH0JWEL7
         yfINWfqDrGpHwzAK7+i1m67aiF+RpMz/6k0jyFGbhwxHzLIYU/Pv7YdM+nQ8afjy+Cxb
         /2jw==
X-Forwarded-Encrypted: i=1; AJvYcCVxfZ4Ehg4Gtv9MPriabc4R8Ga0E01LacMH0LcVJ6+Iv64sY3NOfpY0lGJw61NUHzffPNFPpsBzLzIQi+QP@lists.linux.dev
X-Gm-Message-State: AOJu0YxwWm15FQFtJkYGEyMMTRkzhGYZdDk+TqHPZorpsSVQ6xU2tx5H
	VuBXtFfI2BUMbsil3G834s4p6qMITMrZ8Ug9szk+RF4a+Fk6YYyZ
X-Gm-Gg: ASbGncsJNCfYZ1T29qEGHYnFR5Mqy7rkLi9YAyNV9TibTzwNtcl2568jxaicPQg1Z1f
	ZZcV/cFPiMDOkM8Ekh8r2CQwdJLzf502jZr9McuSBrof/WSBPVfOY7sQ1jPW99ge5xN5dQzxVsN
	ktLGENdX9Waj1EaBLkbOidckCibKjFlClC+o7WWwbS10LMFV8RW/YQ2zjcUTaU51u7bkTBmOWTF
	M07gQBab1mCgV3q0v1vmY7ZVLAmBRDHTBQ3Egvs4C799HtzZXrtNB6dxyIKDqc4nb9/mpdM646E
	IOYKxfXrjIwRplbzft4VZ9D8x6ugYA==
X-Google-Smtp-Source: AGHT+IEbL9B7Zd06/hj5S61BIigZlkxPunGh1/TOWneLd3d9JwMr+EiLoQBkO07ikDItlxG6hevBwA==
X-Received: by 2002:a17:90b:4c0a:b0:2ee:f22a:61dd with SMTP id 98e67ed59e1d1-2f452ee08e5mr5520096a91.32.1734717388062;
        Fri, 20 Dec 2024 09:56:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4478ac7dbsm3613335a91.50.2024.12.20.09.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 09:56:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ddf5066a-8bf3-4686-a39d-a921452c41fb@roeck-us.net>
Date: Fri, 20 Dec 2024 09:56:26 -0800
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
 <e76a0071-b6dd-4a99-9a78-69f104278c70@roeck-us.net>
 <20241220172920.7a34eb46@dsl-u17-10>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241220172920.7a34eb46@dsl-u17-10>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/20/24 09:29, David Laight wrote:
> On Fri, 20 Dec 2024 09:03:51 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 12/20/24 08:30, David Laight wrote:
> ...
>>>>   
>>>>>       drivers/hwmon/pmbus/ibm-cffps.c:171:60: warning: '%02X' directive output may be truncated writing between 2 and 8 bytes into a region of size 3 [-Wformat-truncation=]
>>>>>         171 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
>>>
>>> The only ways I know are to bound check the value or to use
>>> OPTIMISER_HIDE_VAR() on the length.

Actually, that doesn't work.

-                               snprintf(&data[i * 2], 3, "%02X", rc);
+                               snprintf(&data[i * 2], OPTIMIZER_HIDE_VAR(3), "%02X", rc);

triggers:

drivers/hwmon/pmbus/ibm-cffps.c: In function ‘ibm_cffps_debugfs_read’:
./include/linux/compiler.h:186:9: error: expected expression before ‘__asm__’

>>>    
>>
>> -                               snprintf(&data[i * 2], 3, "%02X", rc);
>> +                               snprintf(&data[i * 2], 3, "%02X", rc & 0xff);
>>
>> works as well, at least with gcc 11 and 12, but I really dislike that kind of nonsense.
> 
> Ditto.
> Using the result in some ways can also remove the warning.
> But you have to try quite hard, a simple (void) really ought to be
> enough to show you 'just don't care' but even 'if (snprintf(...)) {}'
> isn't enough (it does silence 'warn-unused-result').
> 
> I mean, the whole point of snprintf() is that it truncates.
> 

Using scnprintf() "fixes" the problem as well, but there are other patches
suggesting that snprintf() should be used if the return value is not
needed/checked because it is slightly simpler.

Guenter

