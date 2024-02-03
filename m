Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1555D906
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 12:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706964788; cv=none; b=nJguZzepReW7tMzJnQ+FwvpWd6F9k8Io0dPsQNOdO2Nb6jszt4XDEDrv2z3cHMd8t3T1QIMO8jLxwJf3/yG/xHh00HCv01Df8arcSIK/FvVAQlYvcNtWWeGRX1U5PV8hiq09o79+C1RPpNZSX3+YAhMaMdchyn2WWS3pnWT2ZH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706964788; c=relaxed/simple;
	bh=JZdY8IOfuTQjiuwWDIjJDwKQKcZfUrSJEPA8jdSgfJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=R15QOubxDuUdkMC74qlfMFNFMWTn4xygmEaDBYLPiHqpS9sjLHwRqU6eLr4XshS+iTmKd0bDWcrOFw0MCuDPGxCg/ZcmINEOETNaeNHn04hyPTy+0aN6b2jPb4KNQFxwwZNsIpS0QlbWrgQwqZcIWNl0KrTlqyer6j3U7RC/DCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=YBnUKAEI; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="YBnUKAEI"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78552105081so81487185a.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 03 Feb 2024 04:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706964785; x=1707569585; darn=lists.linux.dev;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ReDNDkHB2lAopRt5GQbKMosWgLU1ti2OpSA2nlGY+M=;
        b=YBnUKAEI/CE7jVWmvJJwWMUW124C4c65ZO/1piBQa4k+tcdvKtmvf6PRzJZ1bw7ptL
         kR/NZ36RGvZmS4hQlsJ+G7KZsU5yN4ynLpKqTuR6aXPEH0GEB1Ai+jGk5umJt0ZrDuSI
         SKJryA+K035LRuK2WQxJAe/z3jv67rmM5TjX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706964785; x=1707569585;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ReDNDkHB2lAopRt5GQbKMosWgLU1ti2OpSA2nlGY+M=;
        b=oqL2lCe/gQTHMkOjyDGfxUEQe/Xzq2cVaOn1JCBK4+KDsI3OSkBiu7UYNTwJI+phjw
         kp24G+lwHwHj9r76lGOFhO3XcAbjfTfOQMF/UhjEdmjZeN1uGzC6T6M2+LNlJaJGYoyR
         zEtqY0hRO/hJvkqFMr89WnlEjHr3NbTBA8FQl50LrY2/4AiD9JFNKv/DvqskqMViHRrr
         LR/vfT7dPmQZJyK9xv7A1C87RlFC80JOV4vTaGplcCqrUA7WhyNhbl6ZxyelEXTYnEkU
         HMuP1gQFYyONXcvWrFqEN/VqjndOzuTvR2Trs3hwMRngJVNORvWyHPqa4SSE5bprdMIf
         ZiVQ==
X-Gm-Message-State: AOJu0YzzE8u8dmH6bY3O1Q4hP7p5P+7XEkiw0wpuk56aj4r+PZDgFWL8
	XL1dm7rCYzhbbZ5KIH81vYDnQRo47lNu1okdo9Fta9T5FAvo4JNW8AKVED2u+w4=
X-Google-Smtp-Source: AGHT+IGSNEYV1+50wnJSgTLibulqA+wAqzNkHFYfrxgDJxTAFJ+fCWNm0uUAU+Il6OPPR08eKRRm3A==
X-Received: by 2002:ad4:5dcf:0:b0:68c:96d2:5a53 with SMTP id m15-20020ad45dcf000000b0068c96d25a53mr578142qvh.32.1706964785163;
        Sat, 03 Feb 2024 04:53:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUk+Wan+YyV7M3bfYVH/NApTQwDBveB7LHlcgNn+CFnzt+LOadrsfXSsRHgoYViiYG3ej+6ltaJz8iEFoUEZqnzMwMqP8IqaYPL/9RzzVz9q3mD8Ve2abUyRZNgRbYbdTyXa8rUN0boqY3cWWjX7vSSzRfsvt5rEkhZ1BPlxYdHiMd5lWX3DFPgNIlk+x4vkqw4DpGj6JDopXxjmbhwd87kOrMXupi6hhgpiA==
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id mc6-20020a056214554600b0068c6e366a64sm1778370qvb.47.2024.02.03.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 04:53:04 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: lkp@intel.com
Cc: W_Armin@gmx.de,
	ivor@iwanders.net,
	linux-hwmon@vger.kernel.org,
	linux@roeck-us.net,
	luzmaximilian@gmail.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [groeck-staging:hwmon-next 13/34] drivers/hwmon/surface_fan.c:22:9: warning: no previous prototype for 'surface_fan_hwmon_is_visible'
Date: Sat,  3 Feb 2024 07:52:17 -0500
Message-Id: <20240203125217.4702-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <202402031253.JPVKEF5X-lkp@intel.com>
References: <202402031253.JPVKEF5X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

> >> drivers/hwmon/surface_fan.c:22:9: warning: no previous prototype for 'surface_fan_hwmon_is_visible' [-Wmissing-prototypes]
>      22 | umode_t surface_fan_hwmon_is_visible(const void *drvdata,

I tried reproducing this, but I think this issue is already fixed in the
most recent hwmon-next?
The function should've been marked `static`. It wasn't in the original v5
patch, but the current commit in the tree (216d66aa89f9fc882) already marks
the function static, resolving the issue.

~Ivor
