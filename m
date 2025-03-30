Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3D9149DFF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 10:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743331904; cv=none; b=lYy8tjCNA7Kb/oYqdfMiOFn7VJTMlt8Z0fyt+6zvWjnPW08c4n1WCkNxaT4GG/eL2AGG1+lcm8ZDlwPjnheB33XoDgHnpn8l0wpHFnw3N0H9cD5sXwuQt2UI394Fx6FAdD1hetTVUZSQ2zunuiT1bhouAt1kvUEceCAJx/2Sahk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743331904; c=relaxed/simple;
	bh=Q5P7NejdXbV1XiS/42ah2Xw7ZPQQT2Z6dbh2accinlU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P4Yg5pyzpv7M1xt2SAJuCswmAqcgWbBmz4aCpGCfeSHgURQSDwnhvjGq1HqatQVuS50MwIm5xhg8BWAIJnl7hH7e4THid+qlhL+AAFgprHCD/03/A6RtR1EuKhWuyDVCkudFVBt6jHowvYL/ZhFZ94un4ck2XGLAwp9RK39Boxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXyzpfOt; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXyzpfOt"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223a7065ff8so45297975ad.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743331902; x=1743936702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4Dc7903aqUi7QARvZQkiVZWl5zvBm3/ivRJbwdI5Nw=;
        b=EXyzpfOtC2rM3p1EUc4NKGk9lVpIG1Af8xZTFkxyQiBzrc019ItABynw5bBghjd7Vg
         yPRxUNRSNhG2Z7ZN8FLhbg7dX2gSWWsJYjd1aZzDAwVKvaGuxFM0hz/bhOtOeu1ZD+au
         Ww9dDXLz4oLasR/Ko0QVtYx31VVlFQA3oqLHXPrKzheLoRAFqm3uAtiDHT2/ezhz5xpp
         kWwuYNDKRDZ2q1Yb8tLcTpIQZKa+OJiPnB7BmD7xN+mVslPxgr9DhP2efa4a/wUoaKoR
         UoQIZ2mKsDnduVgwo9KXpGD5e08F232VYCs64mL5zkn7Ci/tTSwg+LFC6LuO1d/RxKwa
         4jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743331902; x=1743936702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4Dc7903aqUi7QARvZQkiVZWl5zvBm3/ivRJbwdI5Nw=;
        b=lU6oCyoDaKuvdVA/3QrR0+I1qVYzriVtFvnAQMK0GLGZkvNVD/ZZtwmxuGV4r05BaX
         doIaIoqIpj6I6jBFL/AdxyWyrlj1sWRnuz3PykrlIPnRk0VLdq5kyQ+hKAo5BP2zz4W/
         NLnjNbql0/FgYu1y0nJFwq2Gcz3tidocYE9HdHfoM8+JG+FcteHFX4kGlhka6oypQrCn
         7n0KyXq160rMURuT85cSjJziTYytje2z9D2osPDVQjnD/Uw612+bRJM1ytMWnND8/1lu
         4E/gnG5fIMzpBAcCF1rVW7LlvwYr3NSuvXA7f7awxirDlJty3GP8CmDMMTsvRZ0Wt3Zb
         H8cg==
X-Forwarded-Encrypted: i=1; AJvYcCW9sg6qXBhx+DWNY77FDndPqfN8DmX8aSjQuTHvg4018bSaqSQZccTGLzg8mG21ui67c7t67KoriUyMmbwv@lists.linux.dev
X-Gm-Message-State: AOJu0YxRbC6lTMoaTZXfZzmiwBrOqhhTC0M9TZXoaHW/r5irOsPrJLG6
	B2A7GScWqY9cBdmIQoC3M0WbaWmPJM/bBOGOwg23DJYKJmTNgBGq
X-Gm-Gg: ASbGncvixnR9stR4woX0gTksJ4nItNt7BNeaI1Xo0EHB0vM8NuB0TlvOYaO7PjI2zpC
	s/TsVNi/eS9vbcO4JTxJtlcZxylcKBQPki1tg6GBgyuqPySlwJceRr95v0AhgRc69L6DYV/p+X9
	QMXYn/OstDfyM3b1L3HsU8RmaZl9S/XIB/paf7HRPJa5DTojexrvCxiEGcbfPq/alahjHdyjjRO
	JL1/r/3ds3Mj6atqyhjEL0R2RtZHZDnRd/0uwVrgPhPX3iS64jpQvEpsbveg2TYXeCm4HEyUa76
	bnl0UuRvXZqlNT3NS3dojCCuXOD6XkgcnfFQmc1Vs8h2faC9bx0QEoPlPeDorBIAdHBRjBK4NfL
	xAc1zX4e2SfToNYhbryJYEOf6Uk8aYEZ1G0P2toN3hQ==
X-Google-Smtp-Source: AGHT+IGlynswCVf1Afq+yxlrKXxYS9eorTi2vj1TP03egLwpQVeJSiv1lInIOi7BBKDsQVKxiyXUiA==
X-Received: by 2002:a05:6a00:3991:b0:736:ab1d:7ed5 with SMTP id d2e1a72fcca58-7398000b471mr6908974b3a.0.1743331901818;
        Sun, 30 Mar 2025 03:51:41 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e1d922sm4991601b3a.37.2025.03.30.03.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 03:51:41 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: gregkh@linuxfoundation.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	ryotkkr98@gmail.com,
	samuel.holland@sifive.com,
	stable@vger.kernel.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v2 1/2] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Sun, 30 Mar 2025 19:51:35 +0900
Message-Id: <20250330105135.389827-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2025033015-blanching-pagan-db09@gregkh>
References: <2025033015-blanching-pagan-db09@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

On Sun, 30 Mar 2025 09:30:27 +0200, Greg KH wrote:
>On Sun, Mar 30, 2025 at 10:16:10AM +0900, Ryo Takakura wrote:
>> startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
>> The register is also accessed from write() callback.
>> 
>> If console were printing and startup()/shutdown() callback
>> gets called, its access to the register could be overwritten.
>> 
>> Add port->lock to startup()/shutdown() callbacks to make sure
>> their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
>> write() callback.
>> 
>> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
>> Cc: stable@vger.kernel.org
>> ---
>> 
>> Hi,
>> 
>> I'm sorry that I wasn't aware of how Cc stable should be done. 
>> 
>> I added Cc for stable but please tell me if this patch should be
>> resent or if there is any that is missing.
>
>Please resend a v3.

Ok. I'll send v3 shortly ;)

Sincerely,
Ryo Takakura

>thanks,
>
>greg k-h
