Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D443D388876
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599575; cv=none; b=OmlAPNkbj1lgyvVFhW2Jg2/YjSsV2W0P54LvitdvkNwI48qMHxZcU3eHg3Uad3n+aGhVZPJUolby1gKd6ijeUkS7UhPPwx0ZPgJNs90VS/jLoeXnVJdqI0C6X+1GIwbr1oRvWfxVhk+niQSIs2rNb2aixf8C3Ry6865e+9JkqIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599575; c=relaxed/simple;
	bh=k61eFfUpNPZI2+RmqnwLXyI8eLFam8VRdLnuEW8C34o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMRcFmsFrU7uS0uOdzYXYIl/Y56WBy8Ne9mE3sTyFy0b1KzLSaUyOlbnqqQBICcFZDCBTGfpg+S5lTPN/bOOQzph+jyYdZE/r8S3WRYNDYqdzWFyZeCK8RoaBmCgSJwo46wH5TQPDEynNAkMxDjkf5RsZGjuIamLmh4vujLkOQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=V06xrac3; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="V06xrac3"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-69489b43d66so1604317eaf.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1778599573; x=1779204373; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oa6p1Qpev/3fA0M0sLxiI9JuOC87QNT1WPoNcbjnCA=;
        b=V06xrac3xUm6tVLJYP6///WsSh166+jJKwQgIsQ+xJvfDx1h42J84ZDSCBI6vGywq2
         ZMXoJp05YGOShk2qaZw4LaE7JFqMrlHynnoticCk7yUEHrMSR4yG47q6eV4RYRAuSRCs
         1pyqbbv2rzWq0W8dAe+xdy7DIXWDznTBninJgt5wKa6loLk1erani+WmP9NBNxVl2nfb
         Y2Li9FpHEZz+YstAtngTaqaOJUa4FIqUFEU95pVkKHPmHcpLnSutkKan8jcNrBVpf+co
         418NmzUUInSY0U6Vt8s6GNUh7VrS49IwGInkyx/MuJfdJWA56q7UfT7ByLj7Dr4hquM7
         y/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599573; x=1779204373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oa6p1Qpev/3fA0M0sLxiI9JuOC87QNT1WPoNcbjnCA=;
        b=rcVBG5HKOEniixJpcUQiil7FH4t7VHmS24VVGSoZXGvrY0m30BAiiDYB4Vb+dhyKMZ
         exH1Fg/CKhq6UIsLongOE43HULtVr+NB27AgTH4+rAYBe0Ait9M6qD9LWLzf0an+uGJa
         4OLED9XuI3aQDlp43iwSII8g9nErVxUOGnmqn7szDmjN59ba4LEB0tChd4z5iwEkdvF/
         csJ/nilm0ftFc8BbdD1tlT2kN3iJAyt+0JXOzZXpmqcMebl+366erufDdP2/dtRSKMd9
         gK6LLOvYDDCbWQ7NQYqRQxkvdPQswBx4Q/AF2NaBL42tWsVNqVLfa0P0lV6l6+sttoLy
         JYXw==
X-Gm-Message-State: AOJu0Ywv3Ptq4rvXeNFqXZ7L2gP5KWQUUh25Guui7WyRyqQcKKFYOLKd
	eEm2p1/Qa6Tfx05sSIVhymg5CjxCu7n4rr86LATCmB99VXFmakiHV8bpSUKhLazKFbY=
X-Gm-Gg: Acq92OFGUpW4L+sPQiukOkjh3gToLQgnzjda0rcOaxH6D7CHVkey+AVBUI56n52mVvs
	StRAJHRb3ZgGgeT5hrDy65Z+k6sq/BALkWOsPs4jVvRdT4DckPYcfsjS3GARHIU/OyK6zr5hJsv
	scONU3LyPsuKtSjxG2zdrm8KQ1p6g5f/gfI4Eetu8q9t9XQzI4Y6uYJ0n+IpUzNDbVDMTKJ+KkG
	zsdugNf9p2B99ltXvKAZe1jYFlDJK50kowzjVvb/VBD/1hIkV/GrbEbNMCtX6/jZqkWslzSncYF
	ORg92pJcXazV2jx0ZhVN9s0ANOYYr+t3yt9vbN5VxDiquiJoeAycN94FaIX61q5qb+l9nrVrgc8
	8actdHV8+0sLC4/wJLQoAn0wR4jGBcMQB7UTL740oK8/jmgWWagsc2CT+Uukm0tfRybdtRaSNd9
	5TPnPLnaPsmpRdpSITOrULKjQGfYODaTTMNjyLkc7EOGSVdVdTHXol2V/PhP9a4uUrDNyynRH4W
	bC7sD2Q
X-Received: by 2002:a05:6820:4b0d:b0:69b:5696:e63f with SMTP id 006d021491bc7-69b69e08d56mr1556214eaf.24.1778599572707;
        Tue, 12 May 2026 08:26:12 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25c76cc4sm7890844eaf.6.2026.05.12.08.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 08:26:12 -0700 (PDT)
Message-ID: <d76cebb2-644c-472e-8b2d-af4f942bc900@kernel.dk>
Date: Tue, 12 May 2026 09:26:11 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe:for-7.2/block 1/2] ./usr/include/linux/drbd.h:18:10: fatal
 error: sys/types.h: No such file or directory
To: kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202605101346.V2wwJqv1-lkp@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202605101346.V2wwJqv1-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/10/26 12:03 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.2/block
> head:   8098eeb693c4cc4e774c62fbd4875197cb5578ce
> commit: a54f499838292c1768f6575ed1ec7cf35f1b6489 [1/2] drbd: move UAPI headers to include/uapi/linux/
> config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260510/202605101346.V2wwJqv1-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101346.V2wwJqv1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605101346.V2wwJqv1-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
>>> ./usr/include/linux/drbd.h:18:10: fatal error: sys/types.h: No such file or directory
>       18 | #include <sys/types.h>
>          |          ^~~~~~~~~~~~~
>    compilation terminated.

Christian, are you fixing these? I keep getting emails about this
one and the one in patch 2 as well...

-- 
Jens Axboe

