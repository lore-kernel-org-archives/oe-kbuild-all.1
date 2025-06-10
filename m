Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F8C28C2BE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550780; cv=none; b=H3zYh1DlSJUICSHch0wpOCrF+cz+xWZOw2SpxxLf8nl86r0YfXTtMEHGRr9TbAUo0WSe1HADUjtuFahYnrcXhuTJU3GVtm+JsfUJ0ojAvWuYLCEJyDXssplPbX5dwDUYiJD/LuOdPFuBLt+0Ij8s12UeheZxLLwRhmIWMKybtPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550780; c=relaxed/simple;
	bh=KF0IhGV/YNxW7lLT7JdCh6GbHi7Mpvxy/sSQeOI9XcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvV+ZKqfWE1Bh3po7L0rIRtIsqLhCSpkEcQEPji0ZdH2EWE98Se6lyHCl+zCIqMa0yoU9g5VAn6Y8sjYSWocOTmlL44KL0ltBltZq4RCyhZmOCp3VKlRhoyOjRHjHLTwi108xr/XWWwzXNR81roes2UWkka7BKjMOKRBBffPckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=YvZMcqLN; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="YvZMcqLN"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so5010731a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 03:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749550777; x=1750155577; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KF0IhGV/YNxW7lLT7JdCh6GbHi7Mpvxy/sSQeOI9XcA=;
        b=YvZMcqLNVN8fibiArSz/ZbgCXRFZ3zo7DxA4KamJ3h+OG8wjjwsMlp2FptHI3RhFzu
         UtEA78+oqjKdSWkM+jaB9v8ka1hhXqvHryMes8TjoQezBoc+CF0w8HbhPPjib2HLLFCo
         k22w7ryz+eaBlK3AsBf1x4wRGzbVoLLLaJT2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550777; x=1750155577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KF0IhGV/YNxW7lLT7JdCh6GbHi7Mpvxy/sSQeOI9XcA=;
        b=fqukTWD1r3GJSQrjRVzWa4zBzNxOwLogXmeQyGOWPd+LIuTM6x19dnkLLfisPx8sL7
         v7ZRlOinvUie6dYyTPSxIo4VzgVhxSrsXy/uq1KLjeo50g1S5mJGved9k3QKW4qK6mN6
         MEJvfShMWC57l6uZxWYfps2ffcvhlZHUQm+Zch92iTOf1Rw8lf8pldn9zHgpAAH5D6U1
         zp0LlKV2BoHYj8NQGkHm019lBvBp5xuGdorpzd34cWP23SQ9FhFUZtlIS8btl4ENt3Ce
         RHVl2X+fOyVmHv0XIlnyWksWh3it/PHfElWAfHHcIqsp9ZTIRxI4M8bvq2lBwemaz3Ms
         04zg==
X-Forwarded-Encrypted: i=1; AJvYcCX+rshFUpKtz1OLJ7XbO7Ni0Av87SOQLxS2NtHGtHSExVCk5M09W03nwdHIbmWMPQAP9DgKH7R0pgA74cXa@lists.linux.dev
X-Gm-Message-State: AOJu0YxXeUtBbAePJPvHURrQX+e3hcO3sOuzPYCEJDdncTboEZu8Z4fm
	mpOXSKp266OKtAhKryFTsqZcibs37BHFKovW1Q9Kk4qxoQQKtsWBfBmYZ8WQqZgK9Uc=
X-Gm-Gg: ASbGncs6bn1iJLXkmNE6xAKAoctUZgc1+CK0BTm404b/6DWQRs/zLEGyCpNkxh9T+xg
	UHu1mxXAhPgXZhr2axjNpb28Y84U/7MlSZeDQc8fqBuYjksC9ay8/WM5p/kmknlIxHe6KWLzvnD
	GyHM8bwXCB/hpZTHgMfbYV/ndYKPtOLXyAzURopeZ4tQ2kll5kMUS5VO457Lf15L/4lab6zu1qK
	TwAoxbkqhSMar8YaHqh9bhWvw1QuhALo52jcUMkCDWijqFIDyblkZ+QBA42jkjmwvrBu0zIC867
	P8vJ5INujpP/PUHpVnlXVxbXwn74q5QLL9pN703cnDBv2pzuS4ceaePvy2buzzBcIg==
X-Google-Smtp-Source: AGHT+IHDGq+r2IlKiecsvDQCxKT8f5zu0ppTH97cYtt7W5yjJyBOo4m2JwFoDG0lIxxYNFZqnFnEIQ==
X-Received: by 2002:a05:6402:26c6:b0:607:2a09:38dd with SMTP id 4fb4d7f45d1cf-6082d9b391bmr1857192a12.18.1749550776974;
        Tue, 10 Jun 2025 03:19:36 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783dd48esm5869944a12.56.2025.06.10.03.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:19:36 -0700 (PDT)
Message-ID: <1eef4644-f22d-4c5b-8cfe-843ed88c050c@neon.tech>
Date: Tue, 10 Jun 2025 11:19:35 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/mm: Handle alloc failure in phys_*_init()
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
References: <25c5e747-107f-4450-8eb0-11b2f0dab14d@neon.tech>
 <202506100041.N8Bgx8q0-lkp@intel.com>
Content-Language: en-US
From: Em Sharnoff <sharnoff@neon.tech>
In-Reply-To: <202506100041.N8Bgx8q0-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Apologies for not catching this. New version here:
https://lore.kernel.org/all/a31e3b89-5040-4426-9ce8-d674b8554aa1@neon.tech/

Em
