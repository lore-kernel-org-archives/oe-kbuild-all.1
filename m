Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F354D19BB7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 04:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724299933; cv=none; b=E1v+gdt4jiigPh6B54/7lhLTJV3fFQT6jbmBZHxEMt/gUcYWVV71BSNkIxUv1ignSMHD5KKlxJlPNtt/F3L4oUgskyXRD/fpndau77m/9vVAoA8TOICbGwXlVDuZnszG07xjhDkAXSOMKOUCcqHShrJu3/L+477zpr+pFJEEn/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724299933; c=relaxed/simple;
	bh=xOPhVQYrdJ4/PDoSa4p+l+ZPMJkFYrTiJbXWbEjW7AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxEMx2fdQ3rpIVpbxiQLRq4e8u6wCrAH1KPpsZS5ZspFWiNNhFecaNwry9nr13TQH1Bni73F1YUs0/JgsxJIP6Ls9zmUXJIZR66ABLdTxlnmIblRTT4GC1r3IrJzFmnwSrq7b04q9qxdgnn9Tw7CjxMf1KsPLieEdTlkitAbqQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QkWqp0C2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QkWqp0C2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20202df1c2fso9942625ad.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 21:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724299931; x=1724904731; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZ+7VFwj048rHa5sI0hRAyf82MkJTEX7rTgiunMl8Iw=;
        b=QkWqp0C2jJy9SBXUrEquUO0JQxJVST/Mesn0p2Z28AFem59SZtTwCzQLBvPTVh1Rvh
         NGOjrxZ6IfeOPsGh1Vdb7R9s8hfF1H1CQb9xXnHXzFGNu7zIaFglzb5CJYV0XTsAXtkJ
         8FUZYrCVk1Qi2PaFy2JcQIBwFMQ9kMcjZsEUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724299931; x=1724904731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ+7VFwj048rHa5sI0hRAyf82MkJTEX7rTgiunMl8Iw=;
        b=Kozug1Ga+hDSFe0YwIeMnVx8c/0v6aqW7mzbdH2fW2jFM5vBjJLIlEh4dGdNteunZ3
         IokT/7itX7gmaHVzpoAiS6fD73/zs4SqPCJtgukGjmZHJisKaJXvmGThdG2Feg0A9fZ3
         4NFOtideR3I+YGd8oMOl0zcNzUmf+E7VPAzTv6nkUmROQN3vDtZg+E1+rQZ28lZnLUpg
         xLRM/MEfNgxPk22Lk3MweoPHM/whfM+H8ZHV2ytsWzvgQVN3ArxnpXCuftNGrg/xnO9C
         zvxFk2gHbNAmCMtrM52FgP5PhE9g6osK36AFfmjdUfjO0iziRiSB9v6eJIGloDUuYHXp
         ljaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmKZE5FvCaFhckB0XUNmWE0M5pYPUyN77BjtZqFNY3yusJTE9BzdbKePnxXfcycvRkNeo6Z/QfD0JCn2xy@lists.linux.dev
X-Gm-Message-State: AOJu0YxluuQfwwxxq74B81gP/myWxkYExtQZZXmcV20zBw2Mh5AWaAfD
	4HaNF95eIo3s9kCS3neKJLLeMR3Ik9BvsoEZaU/+29N13I7+d1NDePdojRDm5nQ=
X-Google-Smtp-Source: AGHT+IGRqwd1qSXYME52HuFQ3VHz4GMr/UyGfyWGAuVueXYnT+iXnDJM2JUqBHJcdEIp3PdVneU4RQ==
X-Received: by 2002:a17:903:230e:b0:202:2e81:27cd with SMTP id d9443c01a7336-2037fe175c4mr29988075ad.26.1724299931002;
        Wed, 21 Aug 2024 21:12:11 -0700 (PDT)
Received: from [172.20.0.208] ([218.188.70.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dd2ccsm3553645ad.156.2024.08.21.21.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 21:12:10 -0700 (PDT)
Message-ID: <5633b2e3-d673-4431-90b2-6c2f6b9acd47@linuxfoundation.org>
Date: Wed, 21 Aug 2024 22:12:07 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [viro-vfs:work.fdtable 13/13] kernel/fork.c:3242 unshare_fd()
 warn: passing a valid pointer to 'PTR_ERR'
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <020d5bd0-2fae-481f-bc82-88e71de1137c@stanley.mountain>
 <20240813181600.GK13701@ZenIV> <20240814010321.GL13701@ZenIV>
 <7bf93dfd-1536-438c-9ffd-f7dcfce0b3f5@linuxfoundation.org>
 <20240822001536.GL504335@ZenIV>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240822001536.GL504335@ZenIV>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/24 18:15, Al Viro wrote:
> On Wed, Aug 21, 2024 at 12:38:48AM -0600, Shuah Khan wrote:
>> On 8/13/24 19:03, Al Viro wrote:
>>> On Tue, Aug 13, 2024 at 07:16:00PM +0100, Al Viro wrote:
>>>> On Tue, Aug 13, 2024 at 11:00:04AM +0300, Dan Carpenter wrote:
>>>>> 3f4b0acefd818e Al Viro           2024-08-06  3240  		if (IS_ERR(*new_fdp)) {
>>>>> 3f4b0acefd818e Al Viro           2024-08-06  3241  			*new_fdp = NULL;
>>>>> 3f4b0acefd818e Al Viro           2024-08-06 @3242  			return PTR_ERR(new_fdp);
>>>>>                                                                                  ^^^^^^^^^^^^^^^^
>>>>> 	err = PTR_ERR(*new_fdp);
>>>>> 	*new_fdp = NULL;
>>>>> 	return err;
>>>>
>>>> Argh...  Obvious braino, but what it shows is that failures of that
>>>> thing are not covered by anything in e.g. LTP.  Or in-kernel
>>>> self-tests, for that matter...
>>>
>>> FWIW, this does exercise that codepath, but I would really like to
>>> have kselftest folks to comment on the damn thing - I'm pretty sure
>>> that it's _not_ a good style for those.
>>
>> Looks good to me. Would you be able to send a patch for this new test?
> 
> Umm...  Send as in "mail somewhere specific", or as "push into vfs.git",
> or...?

If you can send the patch to kselftest mailing test, I can take this through
my tree.

thanks,
-- Shuah
