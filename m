Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0796E1BDD3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707138230; cv=none; b=DaepIMHchBhUp/O2kXlIGNQFRJOFqisvOT4p6l0zlU+nBxVYRQGY9LeWh4IFsjN3n+zqRFa6MwPW+7ov/T7MAiSWpaUzCaQFjYyFXyhgdOMYj6Xglvx8FFOPB/MGI/Bdwge1Tp+qhLEGtIToM9QUSe2rXhA8GNgc830gadnBSR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707138230; c=relaxed/simple;
	bh=WcpAbz6AV2gsZInuJrcAXTj/h+pJXvia51mXmIH4UE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cHSxLABVrBUVKaOR5garV9yBx3U4bYhXWxImSW2toqdB2fGrBdhYLvnSi8vWNHyvGPnrV7EQ8rgK237L6sPaU+vNnkN2z9fZmDDxZg9wngByg8TVOmMzzOFs3F4AVfk17fQnSF+7cOOkVoLRtR5Ek5q7CgNBdrIUuWJHxjJzxzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XelaKLkN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XelaKLkN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40ef64d8955so40114835e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Feb 2024 05:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707138227; x=1707743027; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCCFYRRx7sqy/hZcJRivQvTbALt8zzWJ0JZc+vM4xa8=;
        b=XelaKLkNdgsEXuoxz/A9VQWyOd0xSVOXkpSuKKh566Q647iLiJfH+Hd2hpAgOddit9
         PgOXB49S0/FDqzRlY961QqZGvVhXGZcyDkP7/l/30e5CsNKbuBERxJLdBJdQ9XiC+DMg
         mrkU1xW9Iqz/Cc9FhXEL7DYXs9lH3ERxZVgy+8aHMckn5CCn86XpnmlAa4Hflixmhs9o
         fYhl8UsymBROaLW1Fz7cQM1657bD+NjpqKhu07Ba/CbXG2g5jF+guz90W3ZTVHyKCt3R
         kKKDMaThXAPCg+ulZtxuxVm9zDIIl/Qw0JsNvEoN1AzouxPn1u+Xilc5nvKXINCPRmol
         VX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707138227; x=1707743027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KCCFYRRx7sqy/hZcJRivQvTbALt8zzWJ0JZc+vM4xa8=;
        b=t3QjRovBd5AA9VcI+ZF/AjlDSHaTQcYOJiLELn1DQmlKuQ/TGMPBZ6yaA3h9fj9CTE
         W8+nTbyaNuo0au7ccz6Akqtfpd6nvaS8Pg8zoLS1hh2PGj5sijaYNLUrNDO9bDLT77H9
         UY6k2iMnrOohPjKhrmi+4g3RmipY/M1FPMJUi+3aZ1qR0iTybd96y2P3hgbestyqEBuR
         fiaKURXiMQ2/RPGTmFi1yXYvnb6KqFS0tdTgeVTbsyRNWrHx6rKoVVxnft8OsdboK2iL
         dkneaVzClUz1zkb0y1DR5lSCJA1Bv0O3jF/NEYWbIrYDVqbMF+nyjGIqONe8GNfPji0f
         GsJw==
X-Gm-Message-State: AOJu0YwuEkUAgtJiLXnKaK3CsUtNB9ssfBnxgT1lqflq3TbIaUMOKhTC
	lqKLhaph4EFR3P6obZKc794mtto2nCpVK4dMRxQPdvg2l5sTs1Ky
X-Google-Smtp-Source: AGHT+IGkZv1q3c/Z08Rg+qwoE+fW5QFU4OnPbd9fMInwSp+Rblt9ChI1Wa3utI3TJRqWPej4Ld9bVA==
X-Received: by 2002:a05:600c:4f91:b0:40e:c06a:3ed5 with SMTP id n17-20020a05600c4f9100b0040ec06a3ed5mr5563666wmq.2.1707138226591;
        Mon, 05 Feb 2024 05:03:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWpmbXauPwPy6CaKBeFspi3/ADSZRdhRUFzI4GsjRuW7QRskb4aHkKff8f3lKd+zbfkFhnpr3xnJC3uM47oKuXs35euJ3mUEOJ60ppc6DY87Ofgkqe9OXXgTOHt6uKxiZuMPIg177G8A1oLkzzw0UV41LW9Jeobk6NDKewj1IdbHjyUzLc8Eoc0bM5dXic=
Received: from ?IPV6:2001:7c0:2517:e:38b0:5fc9:aa7:26c6? ([2001:7c0:2517:e:38b0:5fc9:aa7:26c6])
        by smtp.gmail.com with ESMTPSA id v22-20020a05600c12d600b0040ef0e26132sm2332775wmd.0.2024.02.05.05.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 05:03:46 -0800 (PST)
Message-ID: <d96ccd50-9354-4c73-9d8d-021e29e5fcfc@gmail.com>
Date: Mon, 5 Feb 2024 14:03:51 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [groeck-staging:hwmon-next 13/34] drivers/hwmon/surface_fan.c:87:
 undefined reference to `__ssam_device_driver_register'
To: Ivor Wanders <ivor@iwanders.net>
Cc: W_Armin@gmx.de, linux-hwmon@vger.kernel.org, linux@roeck-us.net,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <50af81da-779b-4782-9326-043bc204bfe6@gmail.com>
 <20240205125249.3740-1-ivor@iwanders.net>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20240205125249.3740-1-ivor@iwanders.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 2/5/2024 um 1:52 PM schrieb Ivor Wanders:
>> Missing 'depends on SURFACE_AGGREGATOR' in the Kconfig.
> 
> Unfortunately, `SURFACE_AGGREGATOR` is what was in the Kconfig, it should
> have been `SURFACE_AGGREGATOR_BUS` instead, that's where the missing symbol
> is defined. I wonder if that split still provides value, but that's
> off topic for this thread.
> 
> I see that c3747f28ebcefe34d6ea2e4eb2d3bb6b9d574b5f is no longer in the
> branch, but 42c88a7d1474b6f6e53acca3522d179d3c9b1c6f is where this is
> already changed over.
> 
> Thanks again Guenter!
> 
> ~Ivor

It should actually depend on both. Since SURFACE_AGGREGATOR_BUS is just
a bool, depending on it alone will allow the module to be built in when
SURFACE_AGGREGATOR has not been built in. Which I assume is what caused
this issue.

As for why it's separate: Earlier (gen 4) Surface devices don't require
the bus functionality and have (most of) their client devices defined in
ACPI. But since nowadays all new devices need the bus, we might as well
remove that distinction.

Regards,
Max
