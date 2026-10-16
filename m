Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669EC468C04
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142117; cv=pass; b=lktVVNMwGebW5HMrzAsVV04JTVCC7ubXv/pQcpafw/Uig6PS5mHRWGx8kgn+ZBO9OPr/JUDI8eF/wQP/TKTgs5SQsw5E5IwtMr/VjJ+WtwsqcyH51MujSd27EK8ZeAaiz/m3QTtp1T+Mq1hGDh/SbrGYLW5M1QIDfZuusFJxIpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142117; c=relaxed/simple;
	bh=4lxt+hA7HPd1zgHzvpqvgnyz9EG1BcZ7MHNBGFtWn3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tugYI3c0zhnxdqMleEkunjo4LH0xRwzqXM2d68tO8kAcSknQ3/p53lPyXFcnS+2gIpEERjGFfbZlrtsq9wVYldO8txmPHep+cZ4VRO6O6AQofGRl4tSgva/PUsNszpGi6EzLrosyJU3f0e/pwv2GdagwUhZkltit7/RtVr7befU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+9p6Lar; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+9p6Lar"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1162222a91.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 02:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792142116; cv=none;
        d=google.com; s=arc-20260327;
        b=QWX1cEutmA9eKtcLhSZ95crMRmb2Eut66RfcL8dJfHq/JXmbrJoklvbT2uc/TetXex
         Z6PLRaZr5N3vbFOQ/yXrJB9GMAD/UjSMBBhJHs0c8XZ4xBe/g1Hyh4EGqLny72B56V3i
         JZcCUYYYh5tkWWifSZbOPuh+rFm6u1UkA/Nz7jTBYhAa71jGIcRnfwNASbTYUU+I0sWt
         lMECQlJrfPY8uyHSj6mcu7jwLRpa0yTAOlGt5KA8WdAbaw1imy6JzWhCV6OIRR3k8tDQ
         BKE3FlH3Z3blTvcCx4pEcbbPROmCGeOEhY3iy+C4ZFFGIzSkkjKTLc5zay1rYw4JSG6C
         Rs2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=phYTTl4PHcJvVRbLzfsV00gncMf9YHBKRHMHM3SJjVA=;
        fh=v9oLnuBelN93xyV3pX4YuHTOjpYukRWPlRqf6nWEOH4=;
        b=s5v6rB1aoZe9OqR+Ek4VTMEkeINrrdCz+wTWtnT3Wy7CTcvCOcTsPKP8GNhMtNqkdC
         f8IUMm6tM+FbipOA1dMOPwqDBBYAMvZaC8cce40/C8UyHw0g4b2l6p4jxWhL49JKPzoJ
         zwqH9Qrn62MYMSquIscCNpvj3ms0fXbhMvtGJlDtVnOx9NxebxtAwiUR90kDB/fwSxpA
         DS2r1wB1v+hhfLFlQP0+emQgF4T3ojcwsdH66Mm+tKy4s4VrrJNYBUvZ2MZhLh3c6wxW
         M0FvSqEKwEBDwEUoyZ41OSKEu8ta/hbCTZuzOomIwys+PabPGupfBX1UdzsBvvxLdbGe
         V3eA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142116; x=1792746916; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phYTTl4PHcJvVRbLzfsV00gncMf9YHBKRHMHM3SJjVA=;
        b=B+9p6LarJ63wBGW0SF3q58vfxu4149SApmVAmyRfosgrvRZwAnwffC0wjGx+8kE9FC
         6hh1SKZ5bITrM9EhD0LJRleybItS+w4Nd201nTQ7rUoLcxj3CvtDHUC9s1hEFRvIgsdV
         O4vFFcHlvqOsRQUFyvA8PV4N2Bi0ClKYSkzGdyFHhO3sPtp8kjNaAzI7qpQSXwNW96Pv
         f3BU0TDnk3UXlup8Be9cTursyNeVx6h1HDfApE5akDdNPG278mn7AoKtc+P0zwiHkTe8
         r0yugvdJnZzTk1LQxsLYwm0PmJQ81hPY9cRYFCXdgKRSHh+iUXQ52WQEoc7Y41XkLhzK
         30Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142116; x=1792746916;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=phYTTl4PHcJvVRbLzfsV00gncMf9YHBKRHMHM3SJjVA=;
        b=wxJ+XRp3iOywXIFbDdNU0tPT2dzah4QYLgAkfoH8E64D16cQ/hzmwrrW9lTZxjRNlP
         lwnAMkbStYHAFKCVHDFApqr5V9H/kewC1m3czMI+xl2VLKVNdYAa9eC7BMJcvSR4I6Hu
         mu+AWi4zNGgBn0fFuV1GayFeTV3gQR180xBYLGFUd4Unv9hGq/E3RvDrxUQqtfg4xLEN
         RAS3Giiv1kr/hlfLS07xIbZXSUFpOC5qRTuPjfEj4ze3raUhyS+jpTLXm0XZZMm2j+Ny
         7rbN2ZOefSFARbQENHUfhs3qxfNhTyaG1u6su2mvqKV/nPse9kCSA4VNGPDYOgGm6P6a
         5K7A==
X-Forwarded-Encrypted: i=1; AKwUvBzNR9H0i2nTY5Cj8M2RxxPr9qLfs4IIxandlLzvbhqfPH7qdLHahDxbxQdn2NVx6DDG3c/ZD8OcQWu9hi1W@lists.linux.dev
X-Gm-Message-State: AFq9FYLLB2uJNxFQt+wX89GFlEhLeOwM3qzbIUnsuL8hH6cDMp/iTVm7
	ROhR33er9c5vCvPVc23EDddDEVCWdqU5O2hp3DYV3pW6BW8aypwG5abUuyuyn7DSd3Rlugtq/Cj
	C+RwwgzF+usWZj5txhrut34xjlyxnnuSwMdSS
X-Gm-Gg: AYBFou3FKDqRD05PHXTo9kMM/YLIx8o2bT752aytggQ5MudVYURC8Q7+Z/1fsr86I2M
	9v2UAtaXbx/2U2ju5rk+dY+D7cvymEflUFCTvVG9Z0nZTYBaY5Xnjp4bboX82OMkhc7LXRdin6s
	ps+/x0YVyjtz69NOaDo70dFBetXRA1qQhCk6t4+Opjad9VSJoE7yyaFDGxdw62LZuEDqbBRY608
	G+8FQlecVXYIOCJ0LiHCQC0aDdGY+DzPRlIuJhygtbUl30sejfSrMRrE/wSWlJwVMWgkoqq7Xnj
	otVeO+1yb37iTaiF6k+d4wl40hrNOOGg5d0t54QxMoGk8mL44oSY+W7NbSzB26h3B9lgHRwgnvD
	M68Y6LnizlBlYiObPr3ZtEj3ycAiekR8gTHlpaQZNb0YJA7sB16HrXahyNG0IvJBavrE=
X-Received: by 2002:a17:90b:4ac7:b0:3a5:133:ca5f with SMTP id
 98e67ed59e1d1-3ab3af71187mr19329077a91.46.1792142115820; Fri, 16 Oct 2026
 02:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202610152233.eVrGPEyh-lkp@intel.com>
In-Reply-To: <202610152233.eVrGPEyh-lkp@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 16:15:04 +0700
X-Gm-Features: AclHuK9xOpPEoV5IICqolD0ZAyyJiNgo92FzWBvhd8CsN_s17TOQfTH046kzxVA
Message-ID: <CAABR9nGRwfhqrHptqew7=otJch7=JLOghns7Mw0ahB8QcbKhRQ@mail.gmail.com>
Subject: Re: [linux-next:master 5778/17613] sound/soc/mediatek/mt8189/mt8189-afe-clk.c:648
 mt8189_mck_enable() warn: missing unwind goto?
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for the report.

>
> smatch warnings:
> sound/soc/mediatek/mt8189/mt8189-afe-clk.c:648 mt8189_mck_enable() warn: missing unwind goto?
>
..................
> dc637ffeed6c32 Cyril Chao   2025-10-31  645     /* enable div, set rate */
> dc637ffeed6c32 Cyril Chao   2025-10-31  646     if (div_clk_id < 0) {
> dc637ffeed6c32 Cyril Chao   2025-10-31  647             dev_err(afe->dev, "invalid div_clk_id %d\n", div_clk_id);
> dc637ffeed6c32 Cyril Chao   2025-10-31 @648             return -EINVAL;

After re-checking the code, the "div_clk_id < 0" branch can't actually
be reached:
mck_id is bounds-checked earlier,  and every entry in mck_div[] has a
valid div_clk_id.

So this looks like dead code.

I could move the check before the "if (m_sel_id >= 0)" block to avoid
the missing
unwind goto warning, but that doesn't seem really necessary.

This dead check could also be removed in a follow-up cleanup.

Best regards,
Phuc
