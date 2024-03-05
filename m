Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D50750272
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 09:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709630863; cv=none; b=szY6KL+HGQX43XEeWqEOHtvfAwGV6Xc4gPMgX8CuGIxfORLkXekN7dMPzL5JLl2w7L6/ut5sQkw3E8+unJXJLGYLNM6JMlSeeGVOiCB63yb0tDwxNANWm3pEEiRx+8VHJGtCmvTGJRyLtsdTBFyOQsV7Gt8/D92p7wcg7Kj7EQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709630863; c=relaxed/simple;
	bh=hhP4XU8PPTJplv1l0YzJ9uullD2EJhJdpXiJno/Icvk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=rd1FF7Dmiq3n+a29zTSgKAIt5UNLZN+eSSPxBkrPGjBQp3t/qzcEx894rnECbNUTaNPwqTStWb9yqxxd+HOroGI8NIdSc1aBh+5DbP/yFUyPuRaF4mrNXcwyqy1qumIRBzWnKgweyDzFkJq/resx23HHTvwxmMny1iu1iPCP/k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmicPXfo; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmicPXfo"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so322218a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 Mar 2024 01:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709630862; x=1710235662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhP4XU8PPTJplv1l0YzJ9uullD2EJhJdpXiJno/Icvk=;
        b=DmicPXfoLHvRtVb5eNJZJ0TnqbZ6Ahit4oTRnBwLyD6hmYcX6h2FwTS9T8h5NQrg7k
         JVX+Klv3krl8Rpr6SJy3teZvwOd1eDl4uI2/yalLWkWzfmd25XJco8kY/mgB2EMOV036
         akNDDyWET9amIpYekMqeAbLr66GL7Xi8CZXhtWLiDxFsCyUL3Nc4S1GCkU2Sc7etmZed
         DaP4NngMzTppa9tO6OCqYt/o8o5bfmI+OovKwr05XJktcDK8v3p3qCKttvv5JixN7z5a
         vdqkOVF5Mx/Jj3u7po/3L+cvsDRcNi66gc6rlyRO1i2NtH02BSssp04vqtcemMBSQzkR
         1yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709630862; x=1710235662;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hhP4XU8PPTJplv1l0YzJ9uullD2EJhJdpXiJno/Icvk=;
        b=OSyYroHmqJ7ZUtmJmwbtaij7OApMEFxkgee7R5lnyj7E7nk4uEhzAFA7xjewjvrOof
         WPgg3T2l4kOM8nr/xsyT4zZfCCt9gpr9GSdPQtzi8MkMarWaamoIcibIk/NcTY9GZM36
         kNHBo/eb9KPeovqK4xsqn4R4lqffn94d6t5e+M9MBCdBlDIRHgCQRafW+FgA3XmspIYz
         H6Cmsr1R5rv8oTOEw588jdO9jZF/tnLEfC1ovMaZGjs+QsBvKcY+wGnVu6q65u6u1tFr
         jwwLGHl61vVje5ubMtQrBPaOISz5qQgSCyKjjN+rMTDZN2QZAN8NiwZECOpzvHCYHReV
         wwQw==
X-Forwarded-Encrypted: i=1; AJvYcCV98pr5YRB/pfH/v+zSXYeeqEmrfmeq2HpL6zOXKxe4G+aQ95lIvBNjcPuR1JRxwb4CwA9ww7HPSynhbm9vVWuyMqPAWz1HYWhLQj82Ww==
X-Gm-Message-State: AOJu0YxPzjTb/PjHBfYWrcjTlscCnjW+DjxSConmLawa5/uDtH6/r7Gd
	4trxglyijrZl5OH4/QOZKZk1HElbKmC96WDAlDwFwexKpLGrJ4kc
X-Google-Smtp-Source: AGHT+IGR1KL13nTmlMI521isttizQfqG/VQ8qF0ECHK2t/qEmkZsDpPCuyUscmFTfM1I8R7HnWlP8Q==
X-Received: by 2002:a05:6a20:42a5:b0:1a1:4697:585e with SMTP id o37-20020a056a2042a500b001a14697585emr1318266pzj.18.1709630861848;
        Tue, 05 Mar 2024 01:27:41 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:863:befc:ec5c:8cb:6f1e:1f69])
        by smtp.gmail.com with ESMTPSA id y16-20020a056a00181000b006e63039486esm1812329pfa.189.2024.03.05.01.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 01:27:41 -0800 (PST)
Message-ID: <65e6e58d.050a0220.6580e.7a57@mx.google.com>
X-Google-Original-Message-ID: <20240103122005.GA3347@francesco-nb> (raw)
From: pratikmanvar09@gmail.com
To: francesco@dolcini.it
Cc: festevam@gmail.com,
	jun.li@nxp.com,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	pratik.manvar@ifm.com,
	pratikmanvar09@gmail.com,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	xiaoning.wang@nxp.com
Subject: Re: [PATCH v3] pwm: imx27: workaround of the pwm output bug
Date: Tue,  5 Mar 2024 14:57:29 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240103110200.1018-1-pratikmanvar09@gmail.com>
References: <20240103122005.GA3347@francesco-nb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Francesco,=0D
=0D
Sorry for the abysmal delay.=0D
Thanks for your review and suggestions.=0D
=0D
>Hello Pratik,=0D
>=0D
>On Wed, Jan 03, 2024 at 04:32:00PM +0530, pratikmanvar09@gmail.com wrote:=
=0D
>> From: Clark Wang <xiaoning.wang@nxp.com>=0D
>> =0D
>> This fixes the pwm output bug when decrease the duty cycle.=0D
>> This is a limited workaround for the PWM IP issue TKT0577206.=0D
>> =0D
>> Root cause:=0D
>> When the SAR FIFO is empty, the new write value will be directly applied=
=0D
>> to SAR even the current period is not over.=0D
>> If the new SAR value is less than the old one, and the counter is=0D
>> greater than the new SAR value, the current period will not filp the=0D
>> level. This will result in a pulse with a duty cycle of 100%.=0D
>> =0D
>> Workaround:=0D
>> Add an old value SAR write before updating the new duty cycle to SAR.=0D
>> This will keep the new value is always in a not empty fifo, and can be=0D
>> wait to update after a period finished.=0D
>> =0D
>> Limitation:=0D
>> This workaround can only solve this issue when the PWM period is longer=
=0D
>> than 2us(or <500KHz).=0D
>> =0D
>> Reviewed-by: Jun Li <jun.li@nxp.com>=0D
>> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>=0D
>> Link: https://github.com/nxp-imx/linux-imx/commit/16181cc4eee61d87cbaba0=
e5a479990507816317=0D
>> Tested-by: Pratik Manvar <pratik.manvar@ifm.com>=0D
>> Signed-off-by: Pratik Manvar <pratik.manvar@ifm.com>=0D
>=0D
>A very similar patch was already send in 2021 [1], did it had review=0D
>comments not addressed? Please have a look.=0D
>=0D
>In general please refrain from sending a new patch version every other=0D
>day, while every Linux kernel subsystem has different rules and a=0D
>difference pace of development, in this specific case sending a v3 just=0D
>adding your signed-off-by without allowing a little bit of time to wait=0D
>for more feedback is just not sane.=0D
Ok, I will keep this in mind. Thanks!=0D
>=0D
>[1] https://lore.kernel.org/all/?q=3Ddfn%3Adrivers%2Fpwm%2Fpwm-imx27.c+AND=
+b%3A%22Clark+Wang%22=0D
Ok, I did not check this. I will look into this. Thanks!=0D
=0D
Thanks & Regards,=0D
Pratik Manvar=
