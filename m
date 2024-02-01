Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684523BB3D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 20:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706820274; cv=none; b=W8xXJaXa+xqlvZPoj2Z7gI8ws84NiVmMO2a7UVBT3vw/F+B7DEqNXI33Vyhj36wbeqipLidyOjLWvDFilYc9fU8PsiRrpKRW+5g0iqk864GmhRxLv9tPNtxCoLNVs2F5LI/e3rdsQOIZu+Krw3lSrqFQ+FrTevNhzH2nyYsKt4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706820274; c=relaxed/simple;
	bh=DtrVfB16wUzq5wYzI7OvNToP8E+mRT92oetT55/Sl6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOnHQrZnaCR4ayfCBFxpdxfgv8QcEswTk1QQJLo60lByYj1pxqRI6nHQsUIoghK6eob/1o6G7pbOwS0fCSeZe6B7r7wnX2jmRH5Gl4ci3Ntj0NkcfVlNjRd/bPxrt7LH57j59mVqrjBqZfMRaaEcib2hXUehbnJmuC+Q2aXkgOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLDx+83d; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLDx+83d"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d953fa3286so7473865ad.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 01 Feb 2024 12:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706820270; x=1707425070; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DtrVfB16wUzq5wYzI7OvNToP8E+mRT92oetT55/Sl6k=;
        b=JLDx+83dL/8iMl/Si2Z4jlfuv4rR0kntcDtZT8BajHoazBmpZzxsXjBNoNq/KthmR8
         YeaEjgDw0gwalYUE6F7A6I9pyNUGok8q0JLbujf7GcZtz3W258AxXJHpcJBGHBX1wT8f
         042mSxpzOY6YMfwCnnukrTvfcniMR46mE8csTYZmDEF9wA1dI6LJiKbqz+uyGopyVQpa
         xIF3zngRpqs4CtFzItGRF7IbrrPzuo8hguZJRPQ6MJbw5duxzsKkp3xmtptfB9YV5VfM
         BnBHbT5aEd9dXgoGPCPg5sEkWVbqJIPl2ONITC/RpsIzu8aYFjuIou9jupUG7fv7Xfsi
         mIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706820270; x=1707425070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DtrVfB16wUzq5wYzI7OvNToP8E+mRT92oetT55/Sl6k=;
        b=HYDq27CZ9moCMU3geqBPIymSNarCMRDFFwqnvL0qsTs4J1Kk9bFAeMvTkjDCe1e1D4
         RPfylA+Yr8ultTrxNkY+TXi45za5inoO+ot1gc4rZKC+piwvJG9UtbxZTTLKFMuWJJqc
         OK2x1L9DQM+WExPJSG725vTzw9QFIO+9dGP7rqV4FUSJZeTL8oq74jZbhuN25n5/OXap
         9hses+WwoWRwGMvv5kDECy+qlT7AhoffUtjuDFehZV9ptFSrFLEoI+bHoirraoWSDbJ/
         i6ghptBEGGTDDkOboiJ9zEjmLdZdLiFKpMz+iHkZoM01sEdYU36UDtyMtemxOvb1+kMl
         ZqPA==
X-Gm-Message-State: AOJu0YwMV562gKtFEkpGWUWWynnM+RAoCrz2WwFaSYI0K2L+8WSR7ys0
	juz9okuKiFIpbuER6PWeneXnFSwa5541X5qJy1yry3FqahC099SO
X-Google-Smtp-Source: AGHT+IGyWEvePh2XRfpval5FxvuabPx3YHtX2pbUEIWzcElqsPIvbz4bn2yB0smbJJMIq2CPTwEbbg==
X-Received: by 2002:a17:902:7d85:b0:1d9:21bc:c607 with SMTP id a5-20020a1709027d8500b001d921bcc607mr3207351plm.60.1706820270452;
        Thu, 01 Feb 2024 12:44:30 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX8PKRRpl3B7xetyd2k+IlCkcJWhutE23s3bjh1OY+GHT9xTwUlRTOzix/rUGcdNss6q7tm9oHfudnCtXfSnj19kjC7ZlNEuQJVi29j0DK8wcqalrdsG8I9dMjkOeOjMgvX45PyB1nmBms7p5C7I1B7kD+iMNXj
Received: from ?IPV6:2001:df0:0:200c:31dd:f1e:d88a:7f6a? ([2001:df0:0:200c:31dd:f1e:d88a:7f6a])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902f28a00b001d6f8b31ddcsm254466plc.3.2024.02.01.12.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 12:44:30 -0800 (PST)
Message-ID: <3740daad-57a3-0e08-5efc-c53c8a0341f5@gmail.com>
Date: Fri, 2 Feb 2024 09:44:25 +1300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [cip:linux-4.4.y-st-rc 878/1809] arch/m68k/kernel/traps.c:32:10:
 fatal error: linux/extable.h: No such file or directory
Content-Language: en-US
To: Ulrich Hecht <uli@fpond.eu>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Ulrich Hecht <uli+cip@fpond.eu>, Sasha Levin <sashal@kernel.org>
References: <202401302324.d3o6tgup-lkp@intel.com>
 <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
 <40ba1136-0505-acac-05cc-0a913398330a@gmail.com>
 <8cfa0192-769a-6ef0-4b59-bcfd0eb43453@gmail.com>
 <CAMuHMdVhjCJqOpLA1VYMCLDrXVkhV6qBJzUOMVA324-UyfUxSQ@mail.gmail.com>
 <17eb05e1-256d-d3da-5f3d-47af2fed0cf6@gmail.com>
 <73999659.348550.1706777587689@webmail.strato.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <73999659.348550.1706777587689@webmail.strato.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Uli,

On 1/02/24 21:53, Ulrich Hecht wrote:
>> On 01/31/2024 7:47 PM CET Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Would adding 0ef7653797addea8 to the list of v4.4 patches be acceptable,
>> Uli? No functional change as a result of that commit.
> If the issue can be fixed within arch/m68k, we would strongly prefer that, I think.

Fair enough. Patch just went out (compile tested only so far).

Cheers,

     Michael

>
> CU
> Uli
