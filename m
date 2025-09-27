Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F7C217F56
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 22:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759012452; cv=none; b=FZIf4AKuU3tMyrBcWTSqAaiFPJo4pJ4v0iDmZOSRg1MSuax68/y8OJ9S7YA/HIZ8FaZGepzgUQYTte7kMUydm3hN1Me9p0UvHqZAaAJyFKK3AS+D3ESoPFa8vowSyjgKXzOXVm+oj5YD33habAmNRO7mHkmD37X3HMh77SKOvCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759012452; c=relaxed/simple;
	bh=3ykp3PJQEhX+5JnJkdMV+50B1GBtcUenqCvNZ45iXrE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=sNlz+ZXRCnPeubvFp+IOz6Dv4RHTvXmuqREqY4WsEgcnBCZyJBXbFucNrcUJC1puJmS6DGls/OKBQHuG8o6TrjVDFTlqAaAFE37S0NfF10fYikPcoGUoqW59i3Rs1Ukqo4wJ8rd40ho2VH08TwwWXErPEtlIWDxzjwsxAQEDzMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WrLX1aLJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WrLX1aLJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e2562e8cbso26076335e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 15:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759012448; x=1759617248; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LP95bXIdfAP4ieU56Vps/fSmHsDIQFQq65FLLrfhp+Y=;
        b=WrLX1aLJhpsNi+kA34MGsoj93GAqimH6Wxjd8BBcPyEX1I4qFDWA+L1oLJbdh+5QZ4
         Dna/WOn6bZ+zbrqzqv+/wyhs4JfwU5jz4z3Gta3qphbwOWqfT2Ox2NzXpsJYFhpkfbBi
         ZADtgGFJ0JmrJhOPGuhuNkUGt37tA+BcvLmco0YxCIy1Lxrt6kaSQlAe7X6W61KGPXQJ
         iGgbMKuBTzOiqVqUGLdl5M/bNhnclHyUP7B9HaR9cX0IE1i85a19SGjE3gbq+lM84p3b
         9jjmk3yJhyf5ixrg8/EIeAxJlPFUp6OvG8x6IjHydU+b8RmoxT0cZ37KKOYQrhpAtpRG
         x1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759012448; x=1759617248;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LP95bXIdfAP4ieU56Vps/fSmHsDIQFQq65FLLrfhp+Y=;
        b=ApcPSduBb8s8jXarv8OLQFy5wbOv+sgv0cUsyiDwC2lFTFfvlL38usWWowRSp62822
         gW999RByF+AYcW2Ikckh/PtCmQAtj8EYhEY+GHbZeesHnk2llyiaHLW3A7G0vgxY9MCu
         +vSlI0+LyMuWfEJydYUAvBBELIg8Kzi/WdN+ZN6Lqs+b/4vlRZJV4ZPnSj9y8Nh/akeR
         6yDEjOl74V3zknDHrxMXrYnTgCmbEtGwqjs5YPb1Lp0ZqRzL+wo0Dvduy55so/JChfeB
         MTxl1LueFGE+M6XVYKOgJ2EyRKOkDGKZy9UfZofC5v0KDG0SLNPmeeRq2R7ki0/tM56S
         a1Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVIGCcI+NGhrKoECPtAdkJ2FrSqpZ8BNXE74pp/ijPSLXVn2j+e1qkJ3oM9fAYV8ta+yCJEASlv0ZiW5uhl@lists.linux.dev
X-Gm-Message-State: AOJu0YyoBS5lTGuJcC6c0A5RE2FYMecaRYWCpNW+8Dp1ObNGCH4wz3cJ
	72cAN9KClp70u7i1K8RApkh0vbsHn/P7eWz4L+bPNoRSKhBsGO9VRBkTLTLww9ChqMw=
X-Gm-Gg: ASbGnctMCvJD8L9zX13v5Y/vkR6R8rQltX/0ZCjjsYmXAsQ5wNkPLEiwxRaxx6hm2Xj
	4o1+u/v+OAatoRWPBGZxPm4UcR0d/i824w8tTJLwgFnHbYo+07f9VQCHrVZiVGCt7VW8D30vJzV
	ySS38zPD+7KoXuz0zhJXuDra1OsRt8cddtVA8MK09rJb0s4aV+WXYMveAi/eNzil6/4hzvBg50G
	PcsJ7eA6Pb+D/Bln9LVCuxUoxjFd155ejKkOLAgkDDPuuePQ+Z0USEq/yzOBAyGlbsNf/exOq3o
	ciyaerkq1W93IRp6xtmcn6Es+4PPqXAgtcIE8VSG+A8tR2NkXfu9kEpFomFLaRi3XPdMxCnERuu
	744TJvDVyOSh3ru8/CxBvVa1nKFdXb5Yr5Gvo+GZlYUKVPDZBjBDqE+JemmyRsN61VIFyq6H4Ut
	ZuOA6g7wcaU6BM
X-Google-Smtp-Source: AGHT+IEWocz3ojMq+fkp2gZ4P2lO2/bYXWtv4z7dcVb3cIz6dF2JdMUp2ihd8oeyteTrF91YJrtuQQ==
X-Received: by 2002:a5d:5cce:0:b0:414:6fe6:8fbd with SMTP id ffacd0b85a97d-4146fe69211mr5053786f8f.54.1759012448337;
        Sat, 27 Sep 2025 15:34:08 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621? ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc5603365sm12641310f8f.37.2025.09.27.15.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 15:34:07 -0700 (PDT)
Message-ID: <40c2a6fc-8dd9-4f6c-9ebb-2f74f7d0b795@linaro.org>
Date: Sun, 28 Sep 2025 00:34:06 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PM mailing list <linux-pm@vger.kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [GIT PULL] thermal driver for v6.18-rc1 #2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rafael,

after an error reported by kbuild test, it appears a file missed when 
importing the RZ/G3E new driver which stayed locally after a conflict 
resolution. This change is on top of the previous tag. Alternatively, if 
you wish to drop the previous PR, I can emit a new PR with this 
offending change fixed, IOW this fix folded with initial patch (which 
sounds cleaner to me BTW).

The following changes since commit 79428e60897916401c9ed326f6ada4d7c7c997a3:

   dt-bindings: thermal: qcom-tsens: Document the Glymur temperature 
Sensor (2025-09-26 13:27:44 +0200)

are available in the Git repository at:

  
ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git 
tags/thermal-v6.18-rc1-2

for you to fetch changes up to dc67521c20b701b5237ff486ae078829dc1f8fea:

   thermal/drivers/renesas/rzg3e: Fix add thermal driver for the Renesas 
RZ/G3E SoC (2025-09-28 00:19:53 +0200)

----------------------------------------------------------------
- Add missing file when importing conflicting change for the Renesas
   RZ/G3E thermal driver (Daniel Lezcano)

----------------------------------------------------------------
John Madieu (1):
       thermal/drivers/renesas/rzg3e: Fix add thermal driver for the 
Renesas RZ/G3E SoC

  drivers/thermal/renesas/rzg3e_thermal.c | 547 
++++++++++++++++++++++++++++++++
  1 file changed, 547 insertions(+)
  create mode 100644 drivers/thermal/renesas/rzg3e_thermal.c

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

