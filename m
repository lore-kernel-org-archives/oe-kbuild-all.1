Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35887320380
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Sep 2025 16:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757695690; cv=none; b=HtbPSvX/yloZVDpigsGbuiAsvI92ViBV4d15ZyA8Tbv4qAvkcOFstC5a838q9syIauucP5lKhb/3OIlk62z9pnxqZfGhVuRqo+CfmR5M56AfLPPb5gPiuc9Qxsk8QYAZ/Lv2d3cqfmty0BSbGIzf2uo9zrYCkLXJPkG+vyXbMLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757695690; c=relaxed/simple;
	bh=RvDEpeloizCGVbZM9h2TCHBDf+mfeFWHfJJ88MjWEOs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZIHsQdGwYojz0mkpNcUXQuXbjdXTs7ALsIgGGEiVhIBCtrgKD6d+RZ5t5Y2RBUMoXvDWgce0BMt3jZ9xS0vYSfHDesY2s93nSd4bWBorpiF9WQQC3tua9Q67z0JBzwjhQAAFdPmVpJnUBIfrheI2s6a1pquYzfKo/MMWTQwEwN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ettcUxyU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ettcUxyU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24456ce0b96so25060895ad.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Sep 2025 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757695688; x=1758300488; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JojO/2M959zsBWVjUEkcgukb++2NDZNktHYDQOvCs0w=;
        b=ettcUxyUZhPo6lKdBERSTkkKnUNkci5RwRQUpDSjiCOLxHjCUpBaCbsXRxYoeHOiBx
         OU/OhRgh1XNcJjErVpPCUMzOYUjIGisAbM47lqMW78/9Cho6ZwhzAU1N3X5aEYi76Vam
         7hBx9DQSxVtvm8MHJXQYU9Dx50KBwdLj0787c0qVKRr1Yct98AxOMQYMkBT8FIxXuKhD
         B4L1/bQrMJB/K7jx3KFvDugJXspxQ/PxOj9/I5A63HDOIb8vRSFAeVebugW+yBkOt/oB
         jXZfZkcD4xFz0C/Z3fV2hR2utI4jSg8hp1J0u8CvNq9XD9QR07xupKZTkky8PyM5zhgN
         Kznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757695688; x=1758300488;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JojO/2M959zsBWVjUEkcgukb++2NDZNktHYDQOvCs0w=;
        b=lGwY+yPdzjMxJonA1GabfOlLavLLoyS4azQtPJl2c0Rcrp70VySpelHJi12VwKQWb4
         8UImvcGcTxqOGgrjxxWFB+JNj+LYKZ88QgMCE+OkjycCDcAooSerGSxg7mkDqbJpIFyT
         k/3DiTEWeUABXg3UqU9/6MPptDdBiwYWP4wewZXX14qYfYP8nX1HriOaqhH50XRBNbTS
         HjJ4oyBZAS/Zb/Q+tSzEwLkenqjm5zkLoFN3Qr1N5XYci93FFvqr9qrvCJWWeWPMEonI
         Mn2wbnae1v5vVQwu8I77iXhPxfXWx+vDpQ15mj4ATjsyb3hlvTFCWEKhQa5tsEyp+hn5
         ZbLg==
X-Forwarded-Encrypted: i=1; AJvYcCX0OAHfxuG943rWkkznzXNuBkjJzTTb1G1l4lILunq3m5zaO4B9Eo2hUIs8McXUKB6XLB5Zu/ZyPuuAgjxf@lists.linux.dev
X-Gm-Message-State: AOJu0YyKCvBD0CqExUkE91lcCA//CoaP3nUHMIIwws1a7lDmdMMLMkmm
	hqyjRIKz2ELFUimY4OBRpZvMXYUalp2efXnct6O3P7gHl4a638fATB+0
X-Gm-Gg: ASbGnctFEsA0W9f8P416HGzN9l6zdWUjwupZV9u/bfs4JB5VBHp6RmUpsJaI7ceap18
	8UA5k4/bLyL1NS/zGGSPVVNQOD7F6vZ/+sXh+L5+f/cI7uzPSznSRMZ/+iflCC0sKZtFaO1rFxB
	vgI464R9IMe+GdX8+u9JHDmNhVmoFOVWqpJ54uCBP8UyTEvM4EyIc42AkxoxkorVg5blQhtrUEm
	/Zmy0ksW4nK5PkD5tp+9d8mMsfnao4bREkEHQvA12dVk8+PmtY4Di+ODsA/LR8qDxspyOEzZG0W
	KyLSHOtzvK1OnE3nxQ+yaT9HrRSq6GgLSdiTqmf5GKaUoUn2HrEGbIvIVMyI3t0bqlsZhW2ssvg
	LWyYXXGmAYiUZ4+m5dTa69hjqLXTCc0uvaTJTPw4LnN1k8Z1bzU9wQV/NRWI=
X-Google-Smtp-Source: AGHT+IFbLPULombToQlgoB3lZt9f0p06h3JKUzxWJplHYpXNn/n7w1mHGDTg8MpZyVqCQim7jQ46fg==
X-Received: by 2002:a17:902:e750:b0:24d:34:b9e7 with SMTP id d9443c01a7336-25bae8f39c5mr81665195ad.29.1757695688481;
        Fri, 12 Sep 2025 09:48:08 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:c48c:3b10:7546:af9b? ([2620:10d:c090:500::4:ca20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a35b7e31sm5111359a12.11.2025.09.12.09.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 09:48:08 -0700 (PDT)
Message-ID: <b620881ec86c8074731c1ff414dbb7aa8bade3a5.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 09/10] bpf: disable and remove registers
 chain based liveness
From: Eduard Zingerman <eddyz87@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
	bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, daniel@iogearbox.net, 
	martin.lau@linux.dev, kernel-team@fb.com, yonghong.song@linux.dev
Date: Fri, 12 Sep 2025 09:48:06 -0700
In-Reply-To: <202509120205.YfzyI2gp-lkp@intel.com>
References: <202509120205.YfzyI2gp-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-09-12 at 11:17 +0300, Dan Carpenter wrote:
> Hi Eduard,
>=20
> kernel test robot noticed the following build warnings:
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/b=
pf-bpf_verifier_state-cleaned-flag-instead-of-REG_LIVE_DONE/20250911-090604
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20250911010437.2779173-10-eddyz8=
7%40gmail.com
> patch subject: [PATCH bpf-next v1 09/10] bpf: disable and remove register=
s chain based liveness
> config: arm-randconfig-r071-20250911 (https://download.01.org/0day-ci/arc=
hive/20250912/202509120205.YfzyI2gp-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2=
1857ae337e0892a5522b6e7337899caa61de2a6)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202509120205.YfzyI2gp-lkp@intel.com/
>=20
> smatch warnings:
> kernel/bpf/verifier.c:19305 is_state_visited() error: uninitialized symbo=
l 'err'.

Hi Dan,

Thank you for the report, kernel test robot already notified me here:
https://lore.kernel.org/bpf/20250911010437.2779173-1-eddyz87@gmail.com/T/#m=
103a269f4c096b34043bef16fa5f1d629b794968

Thanks,
Eduard

[...]
