Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6673A3B9D85
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283501; cv=none; b=qosrweIi97f5Y9DlmWWUHhtkWuVHFydJ88mc8kEdK4uF9l7cKS2nY/ZiKelTWSVsi04UPvnRcxXUXYWz6yxzcGne+rhjy5oClR+Uh3Q2wCzbaKexQNHOzJfk3TcsoSL7FLuTMeWS3C35WML0v57EM7TOUD3+t0TkpS9ccsxWU1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283501; c=relaxed/simple;
	bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=D/XW3i37fXrhPDr9LUyaKQYGZ5LsS7iMPTDM96Yr1qYDFgC5qcwiBvfjA3yCMwYfufKcxNS61Bsq684P6MQyXFhQmPq8AdjCRC/G8oS36WGCcQhsvSMyK/sFmbblGQZxDGuUC0yIlawBGvgR7GLqXZf/IRfOnhpbRCc4oo3+S/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tct6w9Wr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tct6w9Wr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486b9675d36so36017415e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774283497; x=1774888297; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
        b=Tct6w9WrNth2ceLwrAguWwUkC5XAzjbbjdUp+/9h517e2447SRG8htFFBtaEre0qhK
         ZbzNPhuiS+QDKKt/FTknXZg/11dezBxe0JFK5EAGDrSH7J4jqgYmZKgMMvrQ1foMDuJ3
         KGy9cRm8rhdmg9gij8qpZr+qBvrCeI3OeyRqUEwxeLjdDub6z1s8KffaAFfDXWGoOckO
         ea2CYnFBKheoOC2MwTmXWefGTwRWl816rnnMT0Ph2XErkgsesRDuQLjPloFxpdoEqsPR
         7jfaWdp1qgekxgaYtgSwjoXdm1NTfZ8DHltbOzvFoT1eB/iuyL/dntZ9L5DUvn6j3JjE
         KeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283497; x=1774888297;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
        b=aq640xMw7dI4q9oZWIRJspE4NSdY+eFWLc3tG5bOf1xjTwD0CBwM1l0X3JPeIJIJZ0
         XVpd9UaghrWojx8uQeEldXV+hBS00pNXnTxrYJcwRWZdG8INq1Pp8gmtusjkvqNP35hS
         o0QVG+tYZje38I11KpCqKszBcRBfDSoXQvHBBsAYCx3cLFhEWg+dUoeWywcLG56PK1Fy
         riRPgItSzDJFMSWm6auL6MhOIfsvVSHvPvbf7Ss7AIHekfZ3LpjsLRcJ4krSu4AuXTKa
         wihXxVRjjFLjngcbiEFO4Hii/V5BidY5GgaVPRM6/8+eLm2/TTo5BcTs9+vOAqMeQwgl
         s10g==
X-Forwarded-Encrypted: i=1; AJvYcCUMmfL2hDjRmRDgGR1NBXeRDNEwfwwjqH7MIBs5JTNwEOyQam5ww3WjaSdZ86elkj+fNJdbyRxFiM0PHnf2@lists.linux.dev
X-Gm-Message-State: AOJu0YwGMFm8O4T9l//4Ikr7gVkohWb34IW3ViRb/OWbvMHlV15+zJEF
	vkE/jz4no9gRQKGIWuVPnkdZI99jKBwrHFftl4VHusFMxcTMo55IuyMaC7nPL/918HI=
X-Gm-Gg: ATEYQzwqMlSYEzr0H0WvuvFNytrms71RyLBuz/OuyiVSzAQ46nNU5252+EXTIPf9yzi
	UBnxwC07eRA0LTl4hlkMS9pWOH2jJnJG5XZ6ITYlmURkiwoqp0FT9qKN/XMeo3xJ/4IHxX8d5OC
	nSJjhzjyzDv7vBdHquMADEo6vc1STQG5lalILQMv12E7ruU/IZd5g5XqK+K40T1moqt/7d5IexR
	lLlMs4RfuSyj4PjJMvhdu4DmW018rRu8SWia9pWilqWhPI/mNXiSRWx2Zl3uDkn9ngQ+PnXTPvI
	T5t6A7EC8o2huP/jnRP9/F4XK0zpqypVbWsvxyKz+/NlVpTskVWWrhVkVIXXf8ACu/JneEducfP
	QZ4npMTJAvwJ/h7dfGmg3TMFhYXEIuPdWJQdVBsSVr2szNhvwxS+X2hwWpJDYJB1FdEhvR77Ujt
	5FeJzlzf7eFP18umUD5ftxlvmX3HuvV4B54Wuq8QP3e+w7RNoUXLZeHwNCOKZ6ylM9NSPxSldG1
	B7g2OuXfVom
X-Received: by 2002:a05:600c:a4a:b0:486:fe83:8621 with SMTP id 5b1f17b1804b1-486fee1ab20mr149439885e9.23.1774283496632;
        Mon, 23 Mar 2026 09:31:36 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700377b71sm121384715e9.0.2026.03.23.09.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 09:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 16:31:35 +0000
Message-Id: <DHAB093OVD2G.3IO4C9P3ZI8HP@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "kernel test robot" <lkp@intel.com>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 4/5] mailbox: exynos: Add support for Exynos850 mailbox
X-Mailer: aerc 0.21.0
References: <20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc@linaro.org>
 <202603222239.JTuBxs7K-lkp@intel.com>
In-Reply-To: <202603222239.JTuBxs7K-lkp@intel.com>

On Sun Mar 22, 2026 at 2:15 PM GMT, kernel test robot wrote:
> Hi Alexey,
> kernel test robot noticed the following build warnings:
[..]
>>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_va=
lue' not described in 'exynos_mbox_driver_data'
>>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_va=
lue' not described in 'exynos_mbox_driver_data'

Thanks, I'll correct it in the next version. The warning is a bit vague its=
elf
though, the problem is comment that describes the mentioned struct.

Thanks,
Alexey
