Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4473480345
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990629; cv=pass; b=lgiEZN1KX/p56gsObjGPOTyYtuR7cUUfZVmuJhzX/AOZPelRs6O2LdL1yqvphvfO6vPOEqVjmmhCiL9dF2ukCxKrthET1Q8DDsiuNf0CWgOVIa36SCPWjbZM6GOHkfBSNHkfD64h4IP5IQVRHooCimUzUUymUM03YdXFtKbE+n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990629; c=relaxed/simple;
	bh=FB2RoDWHRP5TG5kB/5M7XrFIp8sR/BsgKWGfpjGsJ7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGIrjg1fG6Yr7+WsCpyasKv459+1qycJAj5uqayy0B2y7i4UIwbsrlLMej1ucflVFvyS3yWImyw48DQZIS7EzLSNbjhYzPxtVZMW5gD5rAkUVIfBVDHIZbtNgFSb+qzlQslPxuVnTb5XoqYU4xud+MAyQ/ffibrAKgOstW9p0fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1k0XiGt; arc=pass smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1k0XiGt"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-463a0e14abfso2635978b6e.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 May 2026 07:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777990627; cv=none;
        d=google.com; s=arc-20240605;
        b=ARuT3KtTObCvL8Ptp0d+QvL9UJgg/Ippse+SNBaXLTwygHIfASbRrcg4YAlnGLKG6E
         l8zRd4etluBLQapBpbBkEXeMZ/6JiEyPgSYhShGy/wkyh0duQQ9ErQ/NPLQ3zSBdHW2c
         x2O9eM/QOEbAdghzoREvct1bZkYicTRxCuwIGb51tTHo4bFozDfeqIHYDMUBA5a7vHXk
         jeh9XuBomDJSIGfx2qzvNXOaoWcMprQu2DZGdmsNrGWBWVcT6EaeZ/aJQgoPHavVbVve
         Bg8jiDFA+bI6IvSIa7eNUX0CGKCK4opki94knfoI31qYe8bj+K5udXVZElO6duX83Dwi
         NeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FB2RoDWHRP5TG5kB/5M7XrFIp8sR/BsgKWGfpjGsJ7Q=;
        fh=f3KjfadDJucYBSKJ23ao3ZrLE5OVHmvt8urLf+0DH1U=;
        b=MWudww7ZXiGPTgjmCgWtyxP+oqOjK4mK4X7OhGDacmqPSLwXiwh1AUeyceB5bMmX4s
         fnyS7HJK6a+vGOXhacijEM2eW+V5WBjsAmz1pXV5Sh2bpjjej55uJnl0cglkAfA4jAZr
         oKfPvZ1MBHjZEXG1Ja329AdYNaopF/dFi+h7ypPm3dLT/zqwGbYG4NNMQ81OvbA8uCRI
         WOzHFytzrqABiicOnHbIfw3/uxoi11iD9r8QaOlfVLBfRKtndVSyrqkHDDVbcp8YlxVf
         /ULanfKfSfOeTM0Z9u0EaiYermFQKv9/mOPDWSp6vyusdHEo1RLVq7+5YrkbBOOarcgy
         ufaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777990627; x=1778595427; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FB2RoDWHRP5TG5kB/5M7XrFIp8sR/BsgKWGfpjGsJ7Q=;
        b=C1k0XiGtkffgbRhgSinRXM4x0Gd57j42GWtWiVaJv9eObGOhXa2/QdMI0TgAtoKI6r
         0iXqZpxZsWULQ2La4vxb5ncf/w7N2VtGg8rW0WrAb0sNQJ2zY1oNK4wxi4FNDg1bS3kM
         w5UzKIX2h3hjoiusr+9JBH5mWIEY76b2OxmBPQXXy4GrsjpO0ZeIVXScMn27oQLXogtf
         mbuDVy77PGr2bS3EtzgI6vXX3nS6QYAkYAwUOf0B8vvLGxBTyEeAwA56EVRA9IIYglBT
         DHADDP7qfrmj229JcIr0FlAzFeuy2ADKHByL+t8RZOVgRRAZXIQgzpotckRq5gQK998H
         JONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990627; x=1778595427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FB2RoDWHRP5TG5kB/5M7XrFIp8sR/BsgKWGfpjGsJ7Q=;
        b=eWrYElZ6sQjPHwUwB4W5yVHznurxRjHEPyZdpsHy7znA0WEmK5piGVmmo6XVupNUy+
         x15tGawa0ZWhIO1p8V8ZEx4D6tWnDOTHDoEk4p3C55eiE0UpasoLAthgchhYL6bcoTfS
         FtN5Ds+KtbyWt3hbWNmWZXyHQa2pcqHHz5RbQOcjzBGZWImmn31eO7cag7qDGmIneVoy
         AswSMyUvdmMoPvySUMUH4hZZ2IUg/L94P1zS8ZupNsCNRIQUCpoKkExwoSGCT518iFyW
         RjUM/yTrB2XVYLf4a1tX0CzgYj8ucjFyWDe4en0B2AwpRMp68ugL7dRqNueLPQfz9OBG
         uzGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8l1MMoTOyoh3QtYiEd5acbPvvTuB8v3ftXSZ8X/lKkIROA9JW9Ap+FSSFHqSHMwi1rsLgmJJhHvBiJ/QLT@lists.linux.dev
X-Gm-Message-State: AOJu0Yw01yH8X8sGULuM3LqwUfO0IZbB1n8sDUqnXz7qe1Wd3Gh8ucrK
	aon6BcllynEvRsEXtISqVAFWAD+CkDF00qWz0x6R9S+1WdS2sNNDyae242P7KTMD5obtB2VlIHu
	oiqt370Hfe60mAzn+gjCUdD5px9kOQQM=
X-Gm-Gg: AeBDiet8hfGHfkydrxn2eZXApWMeopGGo8DMDs/5QAWzXt443EcFEdeDQ18g6RhzHBz
	x0hliS4tyDumQH+JS5G40vEIJ8CNy9kNx17LB0J4wZsd6Y2WqvBwa9YXUDM8Riy8Gt79D6QTUYd
	X7luUfz1YgS7HG93zrCQP2VL6f0UkbzqBv7ygSnb7jwQo9PkdjiZ0lPImK4bvhhZzgadhxg67tT
	FuXZ9O5rF+Zb0xfW+Pwe1aCC7qm0yHhpvZuXaREvHc31ky8xXorBnsZM9Y2adotnqOBVnsQsSux
	ZDHCO6MP3aB9sfkDw9MNm+Odoyo=
X-Received: by 2002:a05:6808:f8c:b0:47c:374:20cc with SMTP id
 5614622812f47-47c892445ccmr6953376b6e.27.1777990626486; Tue, 05 May 2026
 07:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260503072643.2774762-7-jye836@gmail.com> <202605050414.YJmW3t4y-lkp@intel.com>
In-Reply-To: <202605050414.YJmW3t4y-lkp@intel.com>
From: James Ye <jye836@gmail.com>
Date: Wed, 6 May 2026 00:16:53 +1000
X-Gm-Features: AVHnY4IHW_EApghA23w0AimDU8GeJhlp8R6o_CN6px5MGNoaZm9YKYzSqzJ4U4c
Message-ID: <CAEV1_7HRUhPHorhKoaC5a1f7-hyLpDWrLG29XHfc4SmeffpmpA@mail.gmail.com>
Subject: Re: [PATCH 6/6] leds: led-class: mark classdev as unregistering early
To: kernel test robot <lkp@intel.com>
Cc: jikos@kernel.org, bentiss@kernel.org, lee@kernel.org, pavel@kernel.org, 
	oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	denis.benato@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 12:24, kernel test robot <lkp@intel.com> wrote:
>
> Hi James,
>
> kernel test robot noticed the following build errors:

This is due to CONFIG_HID_BATTERY_STRENGTH being turned off, I will
fix it in the next version.
