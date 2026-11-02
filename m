Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606230;
	b=ygiKQzO6QHb6ZcxVjb8RFQhumpI+p1ptU7gl6AVDlEBfqJROAFYsL0/uzTxSHUftfJCF
	 L3xhjugWwLTjzlHO9mmdlrZOYkSkAatIezwYLYYhiI8WTpKfisg+ds+SSd9aRkz8jQldu
	 /ao2edmneAcl8fyv+KKA2j1nEtg2BmNRAPcZ1Kq1RgtvCUAAKo5tyx7qed4mhIgURI236
	 emXBNJ8m4LvPY6+sn1x6htFVdRfnSwSo0mCM7Yx0VS6mgYDRQEzP3INxqKlZ7n59O3tWg
	 wLJ8FHYrYX7VjTDEKuNjmuE0RRxVjxxuCw+HlqDRVUas/jxzfn8cj0E6bzNQ4kliTSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606230;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:Autocrypt:
	 In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding;
	bh=NaKmM6OIEfyyBlFX9UTGTP7QFA6hXkgY1EikauLPeRw=;
	b=s7zIag16jWgBJnhN0trtMUUFqna/8cuazjCkyE5gb3+AK8zB+OcN089e0+uhQxBd1Z4C
	 VM4XDOtaVqOZLcp8/57kiftrEU68bR4KKilEAIR0lGuM6kkUqkoubQuHpEfFfBte7hsw+
	 1K6a3L8NMMwl2YOS7ygwXQ1q6OyKaYjruT77j8Ek+so1dHPFvwPF8iqlvg7KmUQxg1KVg
	 XgbvKQLeHu90zcI0Vo6zK+lgTtgPiaVeZhD0jxpXjQ6rjcGrX8F+Z8vop6pWM9XkbJ2CJ
	 cjRk6UGQmyZI3VU01Gk1e64C3lCE9TEK7yWhniufcxqYsgKjIybgpe+9ZaYwzlue+jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PziwVxQI;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9AE606A324
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 07:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D9AE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PziwVxQI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793606229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NaKmM6OIEfyyBlFX9UTGTP7QFA6hXkgY1EikauLPeRw=;
	b=PziwVxQIC2wdfAPDRPv50lOgVpETMBNV9HnWVsdpTG9pLdGPdQws1Cm/dqJ7gOGgiki2b0
	HDV81m17Wad4Ca/lTL3hVQY+CZ5VvDfgCgE0+Su55xlTnom1PZbM+rWgNbGqWA+QkIA+2R
	1dA1vU3cj2mrpfwW1fe3NpRC5TJ2rMs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-vMcH4b20N9aLe7Fhbbojwg-1; Mon, 02 Nov 2026 02:57:07 -0500
X-MC-Unique: vMcH4b20N9aLe7Fhbbojwg-1
X-Mimecast-MFC-AGG-ID: vMcH4b20N9aLe7Fhbbojwg_1793606226
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48df730c035so1849077f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Nov 2026 23:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606226; x=1794211026;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaKmM6OIEfyyBlFX9UTGTP7QFA6hXkgY1EikauLPeRw=;
        b=v1BxIvZRDdr5LHVdhZyUw4pfBvIDYMLfvOV/sDlFQWEC1H3jbKP1lftpLt8H0zHYh0
         hglsTVkuDiACe666QLIUt9Dds3Olso0A4n5rPLxDhznV1iBot1QXY2ie0EOQoS7Cench
         aELC70FUHVQVlqLTX1ncKLq604ahiapIaiSPI74ah4ezfAeGKJA92UUv/ln7eOSUrFO+
         Fr8G2iS4LvhhvVaIYLDZFxQ7YsAlFKIfhTkkxbFm3cuXBhRiDQEZdtWvc/mSRXc9BE9D
         MTBkHpj3xz6hsZ3+02EikcHVIW4onkYER3v8/C9Kkb9Xu8ApoeppUO/ONJ7K85Fv3qFt
         UZXQ==
X-Gm-Message-State: APuU4Z/EZ0d/trg6ZtAofb7XIypl0xSpDkgMW/dAd0a4fzhP0hItQzZm
	BJjYCbegbBgD5Hg2YkSgpJYP4DVtxw4VikJQo/kITx8Bcc+d8haWGpGC7eB0zhOqVKk/CPqd6lU
	s3OqhMqPoaFgX8CtLYikME6iVdP2yJ3rn7qlOjnZprj/weqXghwO2dKIBMThEHS+iL8M=
X-Gm-Gg: AYBFou2O//3LE8C5BrSSgdLLKkKwl5DNEEQNr2dsPHG7P59Fv7pVTABezaOM5fH4+P9
	AQTbFY+rW9tgPIfDW//Jf2yj+4M7074IKqTdERH88d5e++ar/PRlFnDr8XEdCLIIIEFMFXtauIU
	OmYaHpTiv0wM64yKAJXCSKh24nv79jwruNzC6yH4J391DcAU/YQCv9CUGpPoSSobbdSDoxtT8vF
	LZ01GYwp1JBnbSHmE8HrFYJAeXFIGwdH0cyVWh4uwG0DU1M4H914bncJFnZIHUMVXchn/VzmQDm
	R1++svCoEunkKTPAyrOpcixPrZrYpW6sgLGwOq0roLPZ9qx2JCUp61FGwPFRQCYO56OcAxiZz06
	ezyuw3vb1gJdtYESgMwGdW9ZMLIs3cHTYaKWQczy5je+y
X-Received: by 2002:a05:6000:430d:b0:48e:25d7:d276 with SMTP id ffacd0b85a97d-48e6e2c3527mr22212192f8f.2.1793606226551;
        Sun, 01 Nov 2026 23:57:06 -0800 (PST)
X-Received: by 2002:a05:6000:430d:b0:48e:25d7:d276 with SMTP id ffacd0b85a97d-48e6e2c3527mr22211158f8f.2.1793606214582;
        Sun, 01 Nov 2026 23:56:54 -0800 (PST)
Received: from [192.168.0.9] ([47.64.112.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm19049763f8f.30.2026.11.01.23.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:56:54 -0800 (PST)
Message-ID: <c93dab72-6877-4923-adf5-4382b2118eff@redhat.com>
Date: Mon, 2 Nov 2026 08:56:52 +0100
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [arnd-asm-generic:asm-generic 15/15]
 /usr/aarch64-linux-gnu/include/linux/types.h:12: Error: unknown mnemonic
 `typedef' -- `typedef __signed__ __int128 __s128
 __attribute__((aligned(16)))'
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <202610291918.kHO0GTDB-lkp@intel.com>
 <9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com>
 <cdf09fa3-e251-4d8d-9f0a-316998df036b@redhat.com>
 <5f898f0f-915c-4aef-a3f9-0118f4539951@app.fastmail.com>
 <33492528-ecd8-444b-a42d-d084857a57cd@app.fastmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <33492528-ecd8-444b-a42d-d084857a57cd@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K7h_eyfu3LgGQvHknplK_q_-CRXBqA9pvVZTGEikROI_1793606226
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2026 22.16, Arnd Bergmann wrote:
> On Fri, Oct 30, 2026, at 19:23, Arnd Bergmann wrote:
> 
>> The idea sounds right, but it doesn't appear to do anything for me,
>> I still get the same output:
>>
>> arnd@studio:~/arm-soc/asm-generic$ make O=../build/tmp/ ARCH=arm64 -C
>> tools/testing/selftests/vDSO/ V=1
> ...
>>
>> It looks like tools/testing/selftests/ is built in the source directory,
>> while the 'make headers_install' installed the headers to the object
>> directory in '../build/tmp/usr/include/'.
>>
>> I have never been able to figure out how kselftest actually wants
>> to handle this.
> 
> 
> Nevermind, I figured out that your fix works when doing
> 'make -C tools/testing/selftests', since tools/testing/selftests/Makefile
> is what sets KHDR_INCLUDES. When I tried to use 'make -C tools/testing/selftests/vDSO'
> the assignment gets skipped, so I got the same error as before.
FWIW, I build single selftests from the top of my build directory like this:

  make kselftest-all TARGETS=vDSO

and to run them:

  make kselftest TARGETS=vDSO

  Thomas

