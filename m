Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339308;
	b=rlnBsfuSaHvgSA84KEYuL4m9tS+txPN9MNMXNam9nTW/2CwWd0nViLp2b0YVJ4NO4+Gw
	 mDY7jC1z+B7a7CSsJX352rfvBJm0eeFQkUTgq/M+BnjKSW7Cwr1d+20gThTYwPPH9NXGS
	 4zqH26VS5D7dmwkufD23AeF6tU3GwdHIcd7Ywr8BAkYFadNLdBCjaPQaUGPyJ6pRmIO5K
	 70DGS2A2krl/ecvjN9YUzRTvofrL+brksgEzG+UbJ+MGK1MsiL/iSu/SnYM91puwak4eN
	 heagGtvB5SVWIn8tXAsTbnxpjtaG4guckEiDSsnF0mEwAGs+Vl2wloY/CIMP39e/Mww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339308;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:Autocrypt:
	 In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding;
	bh=jk0rm4jvaiDVGk2youcQLM21ekVKsq8blgclz8ObRLc=;
	b=q7Tb6ddaKO/L4WkS0p8X7Ro/dvFOiJfW+wh2tCDgvRN98sk/CtaYUDfNJyaCz+H8V0dw
	 ozJNPQkUxol7Ak+EWITI7ICSJDLkTYXffTYiLumo7hwt5NGkaOu1RO6WxjL4F9dinLjBp
	 1rg0tNizsSBd9CISAkMwKo1Z7Skv/lm7UbFMGj0eMcGYRhSBZeqi5rQ4Cq6QC3N40KwSV
	 +0WGl1NALPwYIRwnL/JoYfOcDFVhRDuz2UecfSQG+gcoBMPVYZAUrT+fMSN5CGXtqJGcd
	 EZ0NKLpW4C7Mw+i0NTTVdjTcMysph/F2UBz4uIMJFe9QtMrKL+3nVeJ6WcZsTYR2wfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AxJPmpnn;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375D0606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 05:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 375D0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AxJPmpnn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793339307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jk0rm4jvaiDVGk2youcQLM21ekVKsq8blgclz8ObRLc=;
	b=AxJPmpnnLcdHHccfyTTqysQCNlGB0yWnrUCZeZf6LkMnrW3iOvdDRrDHgBDe0DN8BbCX/U
	Ve+8RRvQefAISntUtBHjIGduNJgrFRUq8LVhJvysbzZgW7z7iDfJwxrBQ2xSWw/0Zc13xt
	mHg9DQHzQD9WS9NZSk+yJf6q/D4WXuM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-dFSEsyuzMDqvvjPFGY8reQ-1; Fri, 30 Oct 2026 01:48:21 -0400
X-MC-Unique: dFSEsyuzMDqvvjPFGY8reQ-1
X-Mimecast-MFC-AGG-ID: dFSEsyuzMDqvvjPFGY8reQ_1793339301
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48dff112181so312116f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 22:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793339300; x=1793944100;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jk0rm4jvaiDVGk2youcQLM21ekVKsq8blgclz8ObRLc=;
        b=ZohArVS6r+03gcMUy35R+I4RFGOSWfQNChwnJl3H2CX1SZLzhuPbBAVZukK0AOcLC0
         vP3UcPiIpexpATrY6ZCVyaSMiwnvGWE/hTsvGa4AXMapmgiDRg7Y4mIU7RiDi8waEKDV
         uHazQXKg1Oy8iCl2DLrH/mzV+JLDZFA3i4Ku5WgbiK5mQDRlca1cLZ756L66DbDxWlHv
         G1I57wPyDy9YkK2JAWAlipZ0H/asvktvLE9dmSjcRsWyfYyXy+MbGES9oGtG5rw5YEYk
         9YbvWE51J194l1fEZ60Ox7daKHSezvAv1ebaLzg/9//rkjxtD093FVa/h3TeKw0dxIy0
         zyng==
X-Gm-Message-State: AFq9FYJD9cQxVtzs7q2Bq6/p4w4XRTlGwX7Nn6c9/adMi7xJeb5G6A65
	QyHk+UqczLoRiUkoaqnh+MGOvEQpItGLIeWhSm/4edz744mzLKljCH0QtQJ5SICmpQPH0fHfpD+
	LHK//1VeAmg+4X6MeJsOPJESnQrSKjDwWRSlV+j9FN/UumK/saw8sFyMZst8VKop47uQ=
X-Gm-Gg: AYBFou2NjydQO1JcxW9F8ehp4/Sj0Ls6UrWMY3PSxy0ySgT0Td8/z8z6ljg9g+bm+Oe
	BLGoa4GXzXPHTrlNo879cqeWg4GTL8paUSvdadGZfrzmwPhY5ZKxLXSuQTu7rNx42NC4Iw4Zvcv
	RDzhB6Hqnfg9TNyC4p6JZWgLUvEHXMfZBccKFKQ9uL0BKRXPTz7ErbXdjXey1pLZCBoFTIwKG2r
	oQqDxbwboHLDHSJSG2QJvybT65QIgGo7uy3vzAOrm+mQFqAI1QWK+3jtRP1/jsIrOj2U7dSpoQn
	Sl+otrO67pYZ2/co2qi8c8N1QH0Nzt8rWiMhC4P7aEzvXB/us2uY+NNGZaTX/7a6MjlzuHDyXbx
	OVD7W+NuZ6afZ/uSXHWeiVGk2Zy42OLTpuV96d5UR6rIa5vI=
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4ac181e759dmr23905785e9.31.1793339300606;
        Thu, 29 Oct 2026 22:48:20 -0700 (PDT)
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4ac181e759dmr23905515e9.31.1793339300195;
        Thu, 29 Oct 2026 22:48:20 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.112.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm1501346f8f.3.2026.10.29.22.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 22:48:19 -0700 (PDT)
Message-ID: <0a5de4d5-8b02-40f3-8067-f75b9f1020eb@redhat.com>
Date: Fri, 30 Oct 2026 06:48:17 +0100
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
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <202610291918.kHO0GTDB-lkp@intel.com>
 <9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GvKKOMCbyM6UUpnyjbER0D8tKEybKo1gGN-xuSwGLLU_1793339301
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 23.13, Arnd Bergmann wrote:
> On Thu, Oct 29, 2026, at 19:09, kernel test robot wrote:
>> tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
>> asm-generic
>> head:   dd7cc8c26b6a37a54adc5ce38d286521b7201044
>> commit: dd7cc8c26b6a37a54adc5ce38d286521b7201044 [15/15] treewide: Stop
>> defining __ASSEMBLY__ for assembler files
> 
> Hi Thomas,
> 
>> config: arm64-allnoconfig-bpf
>> (https://download.01.org/0day-ci/archive/20261029/202610291918.kHO0GTDB-lkp@intel.com/config)
>> compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20261029/202610291918.kHO0GTDB-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes:
>> https://lore.kernel.org/oe-kbuild-all/202610291918.kHO0GTDB-lkp@intel.com/
>>
>> Note: the arnd-asm-generic/asm-generic HEAD
>> dd7cc8c26b6a37a54adc5ce38d286521b7201044 builds fine.
>>        It only hurts bisectability.
>>
>> All errors (new ones prefixed by >>):
>>
>>     /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h: Assembler messages:
>>>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:20: Error: unknown mnemonic `typedef' -- `typedef __signed__ char __s8'
>>>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:21: Error: unknown mnemonic `typedef' -- `typedef unsigned char __u8'
> 
> 
>  From what I can tell, this happens after your last patch when cross-compiling
> kselftest against system headers that still check for __ASSEMBLY__ instead of
> __ASSEMBLER__.
D'oh! Could you please drop that last patch for now 'til I figured out a 
solution for that mess...?

  Thanks,
   Thomas

