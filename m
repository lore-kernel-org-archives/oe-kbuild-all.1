Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7ED14AAA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 03:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706673280; cv=none; b=cvkVRsVncsrrkrnT0gdeJMUctya9Db1JMYNQnG7m4/JMnsiX47E5kUctHPeiqS3zDcstNfx9NEQl55Uw9UklVDIe/mtQsLv1GyihTr+Qq2kODWp5VIX7P7ZM/KS5ycrJDl97V41KlZfOsReS9TJSIUgXAg9A9rgBjNfcl+hR5KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706673280; c=relaxed/simple;
	bh=bD676bUTRiB27+bJohAOrZy+mKQa7TG+3Uo/y23E1ZE=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=PB+FIqN8564sXond1fS9CXpFaC4gXPDEtYhxPCRPxsEskEnVXMxyLyX1ISxbWEE0pU8cEniFgG8bOs9fynuwGsk3DWiddtoPzxmG0kv25JP2p6tBGc8Z1T6aMSszvqT5xg9XPb13D2EJR7+412HpUhQvxZHnEopslG0P8O4/Ucs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8difua+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8difua+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d8da50bfd9so16576195ad.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 19:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706673278; x=1707278078; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASE71pzmnohl3HQd9Mxam6Jh9nwv3ZWE+CF+YUdKSE4=;
        b=X8difua+7ak3gL1NowD4PEBTDBOAVDLtve08Ppz03h7hCIEIDQ89qjeTUP7xnOEsvn
         VjBdX+5R6ymAfdRj3S1G8aHKrD8O/AjXn5CFiEloQ/m362hV4aVy9Ob3i12wcKMRQJSS
         fSwN3cPNNtC5mp2Ev99Hf5bS7AweYNOb+Th0VDTr89G2lAE3d/PXHrrb0nVGfH5zhveF
         gik2Ze6udhY3FwuaMlX/FhDJyh6G5HrjHF++QVhPBMlOEkv0SfkJkOJvPkcFesU3lrub
         sLk+I9Wqc6sPTfC4nz1u4B3wLgkjkSQ7192YRDCtFX+NL1abTsicYP1kin+c2YfXA9oA
         NkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706673278; x=1707278078;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ASE71pzmnohl3HQd9Mxam6Jh9nwv3ZWE+CF+YUdKSE4=;
        b=Ud+C7npt14rLLx29c3AVZA/Oqz9ya2q81ZGyuf26LFy4NDIVqIv0jtEqR0MuEp89kp
         kZppJCWOtuelLxhGjpHIk5hVC9tbBqHAKsUmXIwowCW2mCGoyaCHhyXaUvwDmfiSF5Va
         YuBrnfsPqAv1E6MpacZZJbqw37EFUPSH7mcJqQhfgQ9Dgf0+W7syCWYtSsIfiB/YnEw6
         N2MxDW7Xd6mChg6hd1mBaNjbkffGxbaQwxumc2OS3H8D7Ai2rgwr+BLO3P8zfFjYKm7N
         D7gLvarYFb8ZPc5c+wU4LzdFe42OlHFc0rH9mN1bSPtAmzx0fG8yiDv2pzNrmVHDbwJQ
         XIBg==
X-Gm-Message-State: AOJu0Yy+aWrVYWiu/eiGPGXuO3uYsOucKMvtGJu4a/eTdj254PmChheC
	tl37kzthojvQJLt4oWMQkGTX4MSefd4oxZx+WsqNLD6TTctjB2zdwqtcyfuX
X-Google-Smtp-Source: AGHT+IEeq8/9aTp5cCV8wqe0na5YcHPq9fK74epB9rdy43FX+uavPcd3oOIMOq+CptPzePt0W8+Dxg==
X-Received: by 2002:a17:903:1d2:b0:1d8:fe1e:7cb9 with SMTP id e18-20020a17090301d200b001d8fe1e7cb9mr753740plh.19.1706673278138;
        Tue, 30 Jan 2024 19:54:38 -0800 (PST)
Received: from [10.1.1.24] (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902eb1100b001d8e4de7a44sm4325601plb.127.2024.01.30.19.54.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jan 2024 19:54:37 -0800 (PST)
Subject: Re: [cip:linux-4.4.y-st-rc 878/1809] arch/m68k/kernel/traps.c:32:10:
 fatal error: linux/extable.h: No such file or directory
To: Ulrich Hecht <uli@fpond.eu>, Geert Uytterhoeven <geert@linux-m68k.org>,
 kernel test robot <lkp@intel.com>
References: <202401302324.d3o6tgup-lkp@intel.com>
 <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
 <40ba1136-0505-acac-05cc-0a913398330a@gmail.com>
 <65931638.113348.1706667689205@webmail.strato.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulrich Hecht <uli+cip@fpond.eu>,
 Sasha Levin <sashal@kernel.org>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <571eaa40-e24b-1d6f-7150-d54e32c70100@gmail.com>
Date: Wed, 31 Jan 2024 16:54:29 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <65931638.113348.1706667689205@webmail.strato.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Uli,

Am 31.01.2024 um 15:21 schrieb Ulrich Hecht:
>
>> On 01/30/2024 9:10 PM CET Michael Schmitz <schmitzmic@gmail.com> wrote:
>> The latter, for preference. Thanks for spotting that. Where would I send
>> such a patch?
>
> Please send patches for 4.4.y-st and 4.4.y-cip kernels to cip-dev@lists.cip-project.org. Thank you!

Just to make certain there is no misunderstanding: these patches will be 
applied to 4.4 kernels only? I.e., not applied to later upstream kernels?

Cheers,

	Michael

>
> CU
> Uli
>
