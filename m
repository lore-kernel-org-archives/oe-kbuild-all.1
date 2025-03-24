Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53F828E7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742816806; cv=none; b=ZOZGJmR3k1dRF3S0DGBZd4v6YvWfBiWbEaxHeoYc9c68t+e8mopPuMeWRk7Az48dTYnpWpPP2fQ13bjd4gDnI/TmDdWJlmRVIWe0B/UOuLR/NRxBy9DEFiz9HPhCewLuDsgw1A2PUwz97mghoJK5Hn12uWJDbStNzafFrMYKdbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742816806; c=relaxed/simple;
	bh=zSuENPiPbtaDwuaQQdXV+mtt2nFje5kEv1tHKaAxAcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAs96l5edJJlpEOPni23r8+j/mU9BmtQWIPdeTZMT+m3qUGBffcZVfYc9AIgNEsnqAg6Q9v0dyXZc/nGE0mzHi/dRrhx2SUI+V5Zx6ch3Mp24ujQvA19Odgrvs64VlifRgBLEQuioyR2t8J1pYlPVmTG5scnF8odzCs/4Rqj2nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=KcZNS0sE; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="KcZNS0sE"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e900a7ce55so66166986d6.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 04:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1742816801; x=1743421601; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G3Pvd4lSSpF3DnIXoRvCoKbkh9+iG8O+meKIYL5SonY=;
        b=KcZNS0sE/ZtCbQOAz1UdYTzGZWRGOKlgGvWgmso//1pqmN0GGHC9UD10aUqEYbjHr6
         JnFh/JuymeCCJEBa5GzzRrLAjQteYEIndvkL7zp58tdl+B+LQnhdwuqfqW7vegI6dx0e
         WwMM2kz56DHVQCAC757TWzIP/MjP2PuNpJS0gOwc6J1up50gwfSPoMNhD2Khz7LedlyA
         FH20IJqjGK2kNUejmQPqdRaMz9m5pNDhmkWEqiOeG+pNa1D/dzeHP6+11mFDrvFvS316
         ugrsho9+Cx2/Qej8/iqqs9Mny9VKLynNljrkpHNs1Nl6pl2A/U5awnABPkec5OuiTTcf
         2gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742816801; x=1743421601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G3Pvd4lSSpF3DnIXoRvCoKbkh9+iG8O+meKIYL5SonY=;
        b=hw6mPI7DFxLqvO+4jeUhmUx1lTlkYzv/6ognzzk+JmZwZ6mORz0A7vu8gwRWwBgI8q
         HJ31F8QfeWNi4rqG4Do9mdhcHE65SujwOpKaiPfOnGgi1eMNWjzGEBTA/GruHOF6hvCn
         ljjVGDbK92Wv3AkCYKJgrYhbf5sGdZZV7SlMCXK20itU/OQHowWMgqAVje12t96FRr2u
         eK/aIFUumM+jHPyNut68E0Hq3iXOnDkMBZ7yx85jUXWonpYVZbxTSp3cNcsrbxIXqqGm
         nF0SeiBa3670DBsAIZC2Ffw43mru7KM2Z9fCC5afunbBIOqJjv53TWatv9aOtCAZew8d
         e7GQ==
X-Gm-Message-State: AOJu0YwGoZZyvmkOCp9aQnNcmgkPpmPnqT474UMWloeVaiR/+aCN/K/a
	hTxYC8vRB5K53kUqLbFCR7XL4cw5HajnIn+9qZ2xXVdjspyGPDNtGP4Pxe813A8=
X-Gm-Gg: ASbGncvtMoJC8EDpwacc+Mr5xeQS+LZ/ID6fVCie34IbThBz117Z6qRZpSW5hGhYWFt
	SVLSB2i6KGh4wjd4+lr9PjHsW5oJYMzMFpBPkiMal3rl5q7afGR8gI0XrSp+0Pzb/G+6qNaHSj4
	Rr22x/4rfVh+CgZcRU3teOY+0tyE5CoFKQLtRbtFju0mL9nWSZHP3sjGbBEGJ7GuD02BT3tqNlB
	+x1RGE7pTqI9LcYLqXYKdheqGWuI8Y4RyQXpTw8Gih3+UCpRWwYMENU5mHtAP3BPAnSQ9Z3RUXD
	iS+G48T7smhYmJulr0MlLx704l+CCKVf0S2/1iQ=
X-Google-Smtp-Source: AGHT+IGB3SXDh5vupaRLjd3wYSCUcTm788Z1i+qNbZf+XMtVSLWO58zJ2BYSTwGnMhxtsq9ZVc/jzQ==
X-Received: by 2002:a05:6214:202b:b0:6e8:9843:ec99 with SMTP id 6a1803df08f44-6eb3f3af7fdmr165618456d6.41.1742816801148;
        Mon, 24 Mar 2025 04:46:41 -0700 (PDT)
Received: from [172.20.6.96] ([99.209.85.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef0e777sm43592136d6.8.2025.03.24.04.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 04:46:40 -0700 (PDT)
Message-ID: <e27c19fe-6d42-4875-b918-8cacbe8daa6d@kernel.dk>
Date: Mon, 24 Mar 2025 05:46:39 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe-block:for-6.15/block 75/76] drivers/block/loop.c:388:6-25:
 WARNING: atomic_dec_and_test variation before object free at line 395.
To: Ming Lei <ming.lei@redhat.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202503240625.LfSMQqA2-lkp@intel.com> <Z-CpA6YVKLc2zxfb@fedora>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Z-CpA6YVKLc2zxfb@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/23/25 6:36 PM, Ming Lei wrote:
> On Mon, Mar 24, 2025 at 06:52:22AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/block
>> head:   4c3f4bad7a6e9022489a9f8392f7147ed3ce74b1
>> commit: dfc77a934a3acdb13dadf237b7417c6a31b19da8 [75/76] loop: try to handle loop aio command via NOWAIT IO first
>> config: i386-randconfig-052-20250323 (https://download.01.org/0day-ci/archive/20250324/202503240625.LfSMQqA2-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202503240625.LfSMQqA2-lkp@intel.com/
>>
>> cocci warnings: (new ones prefixed by >>)
>>>> drivers/block/loop.c:388:6-25: WARNING: atomic_dec_and_test variation before object free at line 395.
> 
> The code itself is safe. Event through the atomic counter drops to zero,
> the object isn't freed, and the counter can be re-initialized & requeued
> internally.
> 
> This cocci rule should be 'wrong', or anyone can explain the exact risk
> here?

It's just a generic thing that it always reports, in case atomic_t is
used where a refcount_t would be "safer". You can just ignore it.

-- 
Jens Axboe
