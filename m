Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3105DF19
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706969779; cv=none; b=fQQUDtCSq4Ywj56JG8WYEbvrzEA58K+9Ebpk/BZ3yFlkIxFI5m2K8gGtXaENYS14ACA+PPp0skXDTWuP6Z5eJi23ABVRvSqlenoqII2W1gRt+ywZnH+a93PoFXT7KRwofzQ1kcW4+0egDDl4bPLPXiF0JHsqOmDRvBnMKWuRgwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706969779; c=relaxed/simple;
	bh=qtIn86P5MJ+PDEQkh/mo3yKL9tts2jV8onhYq0bu+BM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=CVIEhbhldmy/PE6HyA9t4+LEd7RlQecu12kX/PyBI4MzA7ax7kWVz8KuSG3dhBgvFBKCKBmCZGnoeJ2LZ0Vfz0y6HxZoD3c/iC20WPplOzWYpij4bqG8HkEgbbzhRcjlCB4r0/e2VS43S/LQx2Ur4Hp2SPBq309zSm0I1pavmR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=avX+JarH; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="avX+JarH"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5112d5ab492so4062966e87.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 03 Feb 2024 06:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706969775; x=1707574575; darn=lists.linux.dev;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qtIn86P5MJ+PDEQkh/mo3yKL9tts2jV8onhYq0bu+BM=;
        b=avX+JarH1St14QXQ5XVgErbFFMBla61iI4w3ON4zInBs4Ngm/24PXIMOTvm6xxd/QH
         wcrCzHHJ7jEKqId2ZSUEJ42Xxwl9NHrivKQ7FtvAi3P8+imwNmmOvqtSKyvYA+bSi/AG
         t7F3xFCYfdR982SC6oIBuI929Ke8MBaOm3dy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706969775; x=1707574575;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtIn86P5MJ+PDEQkh/mo3yKL9tts2jV8onhYq0bu+BM=;
        b=LllwV1gVQQc/FPRcRVPBn0gAzeGkIWEUJ/ZdsVp0d0CgTsLixbY40FcPPn37jNgSrU
         wupQ92V/kmaOzku6klrrgHsVHoDkjLIr3lFd8tOupID1Ehm3b+gphPl6qAFy7FO5SMkf
         cieEUVZLdKmozm6hyKKVSIYzPYlL8IZIZFzHTlQg/h+g6tp98QHZpQfDpkHa9Qrlwa6O
         LxawODpvEYQTu7niBHvMKm1txKw3f2Z3YYweNRtbWy8eVnis3JmCFQHVLEqnF7oP460+
         76mECUYNYSux08JY95MvpFl0f7TrX8Z/QgL4kVDOB1h/lT4hIkV44uHzV12O6XaoGPOg
         pHTQ==
X-Gm-Message-State: AOJu0YwH8z96jvMS848SXKFFoAzciZHNkvTfY7KzOQWf/XH2/RKS8Bwy
	J0rh/ZCvW7lUzZHt/JZGU7o6bDe1uunlPIKoCH84FfGajv6NxAOW11ya+L6+fGc=
X-Google-Smtp-Source: AGHT+IFyHx75uSWDKY4HNMMTWsfeVIFhn0vV9nBur2MZT19CLIbVwIkQBey5cX7kuTpVXL8wcBxCbA==
X-Received: by 2002:a05:6512:10d2:b0:50e:d5df:c61c with SMTP id k18-20020a05651210d200b0050ed5dfc61cmr6482224lfg.44.1706969774827;
        Sat, 03 Feb 2024 06:16:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV0arKeN1Ac07Na4W9l91ewA88ZEXTkfJ5+0tp/G/eDqrgcBm1iETpyUUakbS9NHKYNAdrkEpWI6gp0BHroTiYRl9T3XIxUhUAQkGNjPRkkbQixY0sKXPvrhyGbvDyVNGpl31xoBVDxWNmQcylA8fnqjv3W8gZTxUTiPkVFJrl/iF/lH4DZVsNi6wug6Yk5+Jc8HsxFvDJ9JmY580JsF22nUFyh/NY=
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id s24-20020a056512215800b00511312d9d49sm626605lfr.234.2024.02.03.06.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 06:16:14 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: linux@roeck-us.net
Cc: W_Armin@gmx.de,
	ivor@iwanders.net,
	linux-hwmon@vger.kernel.org,
	lkp@intel.com,
	luzmaximilian@gmail.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [groeck-staging:hwmon-next 13/34] drivers/hwmon/surface_fan.c:22:9: warning: no previous prototype for 'surface_fan_hwmon_is_visible'
Date: Sat,  3 Feb 2024 09:16:10 -0500
Message-Id: <20240203141610.5838-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <ffd297c3-4ac7-45e5-bf76-8f4e4e9e603c@roeck-us.net>
References: <ffd297c3-4ac7-45e5-bf76-8f4e4e9e603c@roeck-us.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

> Yes, I already fixed this up.

Appreciate the confirmation, thank you for fixing this.

~Ivor
