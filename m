Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0390C72621
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 07:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786174533; cv=none; b=eglrvwA7kE2Zf3yDdp9Jp3lFQB5Aju9Z4Ff5ue7gWzbS2sohQRXlVef9tm3ZMo4Dr54gt0jGuPQkqOLHlnFeqZuLXWmXvIWVLAPn9i2XgxEOwrWcSwh91nn9JGyKXDzOjRdqFZc88rsp5IqwWKfwW5mn9RVt+0mQHd9krchHcyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786174533; c=relaxed/simple;
	bh=TMkTgTwdDNYbcxD74Uto7x9YaDeli9iE+fXtDrvBAmQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EnZx9p2GDagbf/J/brf4EX+rreaPt6lrRZNm4myWapo8MQ8uDs02imDjsuWX+HKqQGLQdVDcU7MPhk4qdkYfof0vRAKjTYZTITZpnHUYBw1JDTkSkqF+3q69buin/1AGjgBIZnCDfWefaHk7o3YFivkDaS45S72PNI/36lmQHL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbaRU+/J; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbaRU+/J"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15e592da74so26269066b.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 08 Aug 2026 00:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786174530; x=1786779330; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d7ny+tvaw/RzOPizGWG4ERvF232HiO2/WaSKudACq8M=;
        b=QbaRU+/JxGuA6C5r2TcLCuOYeCIhFTnoBKk4wJxUOlY+7hCSrCZ3r28EsUCvvVyouz
         HUjBtR1dY6QPnEZSO3KH4bsSHpn8CJckjOJiaFVmVE5SPOa5gpRHcBrJc2/m7jUCwzLl
         KEZfZ6yli2BZfsN1M46Y3CWbib+zN0IQf3ct2iN4JstNEocfGJGGOYcG+47JD6C8jjGz
         sXCVboKG9rvcoK+1DbRVKpYBweWQA0RSVHwJtBZTk7Aq2HteDNZ6URJlpJEhIOY3wvH+
         LX3bPlCfGfX4VKptxx0AW9T4SU4fv/Q+qXwyjw0nF1CaTaIxjsozK1+iNod8n82hnwgD
         VsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786174530; x=1786779330;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7ny+tvaw/RzOPizGWG4ERvF232HiO2/WaSKudACq8M=;
        b=lPeU/34rjHlgttjft0lZc4gpknJKTCHLEqpxhi6waQNGZ+tIAX+lnoeqyJq8oDyc3i
         97zXGcZh2kqt5BEMzTJNhLV0qmv6IAkSLCC+h1gy0UVZk4VtU5b0a72b4NzniAy9aGgH
         RY05p+p1MlCp527Hfi8h6SPk6Q1Qs4UohUKSbI585FgTkuyjk6V9k92X37G0EF9jxhjA
         ktSBMlDoq4HM4vAKbla+jd93w2tBFR8Mmlt/j3NGnstUIUE9dvYhuh5tHlONG5ZVJ6i9
         lqhqcf6F5OpfgoEFaGizVZuv1R3EZMR+HIhr70ztNfzZWIsSGnvqwrGHL37Pmyj+1WmO
         Q7yQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3z5okqtVdNXTPR+NAkKGhOW9mzULAeaFR/GM2/I+PeZrauHXrnKe9GxdZlcNtOVykQiNsM4MInRGUxkYw@lists.linux.dev
X-Gm-Message-State: AOJu0YzLlVu8gCTcTOEm5zZzsn+8E57QcyyXn9hf0QTjbbBR27Yo7xi9
	lRibND+Ppw0gW5DIjM6hYpOV6blYnBKxTXmIMobWwLwhTsG7Lt8rBgwB
X-Gm-Gg: AR+sD12KJ6HGYR/DrEOV3gJBXGLm6eLvuyBmzXWgiIjpXcJymZ6s6M2A+YfjZC0EaTh
	Q1r1yIQvKuRU6c++WZ8KxcgWEprdfWTkOtFRMRSmZZObeUD7sFRRZzeWmknja4FzPDedY/kf5BO
	ckGgjkAUrv1GrnBYih/d/kn+Q2nFg5HDbllvrV93KNjVRYitUwEsv14HJzk/mI1I00EjvfSaVk3
	6vgKatZWol7wfm7hppSWCixBk80ICCscgLgBHQw4etQzfVxqWPvI2PAX/6Z7MnUDp6dFqTYjTSm
	jRXCYa+HQTLeNdCgcZxqZ91wFSOKmHAmm19aXAznSniLjfblo4FGv5Yy6DtHV8pEuXxiJNMhoa/
	2zE8eE6XsWBk4XVgAjY8VI94dzyl97WGEJrl6rUk9uvAfYPJ7hj77PkdIMJkf+zaK+DKLaU4jFK
	9Lxl9Lr5BNoRJvDboC5KvSrFqSUNcbN3eJHO3CKsYbnM4YFM3raqCjc8b968rAMXvgy81UY580f
	7NEYnNnTAWFf+hClTAeNvs=
X-Received: by 2002:a17:906:f5aa:b0:c16:2dc0:e1ef with SMTP id a640c23a62f3a-c20873d1e67mr329761166b.14.1786174529874;
        Sat, 08 Aug 2026 00:35:29 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a84sm140914566b.3.2026.08.08.00.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 00:35:28 -0700 (PDT)
Message-ID: <f5dc4a77-b697-cf40-c125-9b1a1e9301cf@outbound.gmail.com>
Date: Sat, 8 Aug 2026 09:35:26 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: drivers/char/xillybus/xillybus_class.c:230 xillybus_find_inode()
 warn: variable dereferenced before check 'inode' (see line 226)
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <202608072246.Ee6OOcT6-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202608072246.Ee6OOcT6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Thanks. The warning is correct, and applies to the first version of the 
patch set referred to. This was however corrected a couple of weeks ago 
in v2:

https://lore.kernel.org/all/20260722102307.49090-1-eli.billauer@gmail.com/T/#m2d3b975e15a454ef4455e6b28fc7cc905dcdbc2d

Regards,
    Eli
