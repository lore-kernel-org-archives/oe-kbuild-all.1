Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421ED17109D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714481536; cv=none; b=gVyAw/K7DsvmpKypxwgtjvysLzzusTuRE/C7y/IUGvWOsYQm7/tw3UKeb8sfs92IGR9e5U8KMp3C1I9peq9G5MGjIx5f08hZw1mdIgdwa3UVmO4t8ZhpWn4nd3C24FJtXEdcifwi2Dq/Jtd86IVfZutZSNleMYIIbGs99uzkczI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714481536; c=relaxed/simple;
	bh=AHyYFem93a94lPDvaCLaH9SJvb6gomkmsRMs19Vqr/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFNTSi9+v+WeUwW2I8u8BgbkHc75can7Lt9L1ImEI2ROA271qyXye9hW32z7e969W5glwkJ3SIThSP19b1IAEXvUIJoKAV8Jan1no/NgEtJs0MPD7wYdQL7Aa79RDHLxp6K2Im++ub12HVWkbovICvO14x9x4JeLRAuKmrBmbHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=zhoY/TII; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="zhoY/TII"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ac074ba920so1429183a91.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1714481532; x=1715086332; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vv51ze7Ec3px/NDAkDJ0Mo8NY87K5dXMejfH21FYqBE=;
        b=zhoY/TIICyA2NJ5yjsJnnd5R3a8/41BlV3Smev7VyhupYlYMxHT8SNAbVmiaSs3XlT
         L8HXV52ebV3c4m7PMc+rfcjVdpmozobcKoSLWWXmiFR4ekNfZlcyJDX8iheue8cbn+eL
         mR3AmPtpYPGSDCyuTlo8gdX7gzpQR6OXGrAESctGlK2/f4TIR+pZR7KYtts4UTCiXFOS
         rqalxVNR+m3VH6DSaavClssk2OIcN7IMbvMbwBMB4VIB922l/djQoDSKyLBeR6RPEcLD
         vqHeYwE5mr7KcyUGn0fxaqpgnmizDVQ+pZJ9ohj2R2JU4Je81oeSi+8KK8qk2Yh+5vzC
         DUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481532; x=1715086332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vv51ze7Ec3px/NDAkDJ0Mo8NY87K5dXMejfH21FYqBE=;
        b=MVnggdtmb0+MNX2+n0Y4a96RNjEAD9p4j0EjVSnQmNO6fdEr4MSb/uzAWmDWWl8ndo
         xInCJCT2haAC7nqQlIQ08QkNUUdLpPvk59uhZlNj/bxmxr5iNtluzkrKjE1f3YRIy0IS
         CqXg9Ievo8Mj8jBsQ05+Pa3r2wJegTgm+Yro7nZBEtUoUxY7dT+1IEcwlwj07hCL957F
         vleu/AvVdDZvpIe/raCa4NOj2AZgwvucQF9a+jXCclR4VIRmiKI3nZWTt0c668VZH8YK
         jiwtDqmzPH8/MHD75ar/QjM+5gfCHuK9jP45tWcfpojcglEaLgXw1Am7vykdhV9h0ssA
         +9vA==
X-Gm-Message-State: AOJu0YxyB5Gyim29B0k3evLZJ2h1j/UqLvaVeLul7cK8csIkz2eVrKL8
	4G8EXWgk8h0dTgnIYo9DJg1Iu+H2Kg76uBjdLTyDfbWY6rQ7LCHJzKS+gx0MaPw=
X-Google-Smtp-Source: AGHT+IEnSdhHApuZiot8T+5IlekQAtFkxU75C9+fUyV9oPMXzZSucxUgZa2l6UoQFNQRcKmy4ftbfQ==
X-Received: by 2002:a17:902:d50a:b0:1eb:50eb:c07d with SMTP id b10-20020a170902d50a00b001eb50ebc07dmr11408766plg.4.1714481532292;
        Tue, 30 Apr 2024 05:52:12 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id iw6-20020a170903044600b001ead2c5ef12sm1007354plb.210.2024.04.30.05.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 05:52:11 -0700 (PDT)
Message-ID: <78ae53dd-f927-43ce-8370-a437a9d0fdbe@kernel.dk>
Date: Tue, 30 Apr 2024 06:52:10 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 ipc_imem_handle_irq+0x292 (section: .text) -> .L0 (section: .init.text)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202404301338.VtPxCQfW-lkp@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202404301338.VtPxCQfW-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/24 11:13 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   98369dccd2f8e16bf4c6621053af7aa4821dcf8e
> commit: 561e4f9451d65fc2f7eef564e0064373e3019793 io_uring/kbuf: hold io_buffer_list reference over mmap

Definitely not related at all.

-- 
Jens Axboe

