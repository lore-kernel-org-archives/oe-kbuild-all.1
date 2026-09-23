Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E965344F57E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148972; cv=pass; b=W8XFLXdBbrPcbTjeX64Ymt/s5GgMhdW91hqdhtqnWLe9WdWM1MeWQclQAm0IcYYnEfncmuEcMQHLdv+Ahzh7V5/XgpMHylI6iQSedF5xu4vr6i1P9LB6QqQwxBq8Jq+KGFLePk0HgO9ma5yOm/QJSDHGjVTrGfOBPGpaIyUf138=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148972; c=relaxed/simple;
	bh=a23ZZKTScOgNsAHgR+4PgxxRfDvdi6u4hQaxkldtEbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JkLFoQ7p4tg70dC+Q4uBj7I/xhwzkofWTHGsGkgsJyH2jD6DQeT0v1T/z/w/4rFhcdW+QszIfi4/VGjhuIdJvZT/Sirw8U/oACb9dQJhDNQIbDIKPuZzU/wII3BPHYTx2L4BZhWKiZNvtyzXttyJQasbTkbnX2Fe931gidRON2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vg7Wy5qR; arc=pass smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vg7Wy5qR"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2d747ec6185so2589225ad.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 00:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790148970; cv=none;
        d=google.com; s=arc-20260327;
        b=M6U2/VKfp62piim/HNRFEPhqgZhIrHMscc6gm4DfEDqK5DyXdFRaiFwwgVoZyeNxay
         HxxwX9u55p/Sj1x0H8WXybsBkdVZhiAOmBxEpAAmpmb1yCBcu8Lvm6AmlB6f01VAFENx
         cHRrV0//6CJBEyWlGXzziXyFXS1zagCTQfaLaw0s2xGjXuPPGiHdTMUUoHsNA0KpLTG1
         9RuWky4k1j+yU0xDHz9pQvDAaNY8Tm8rwhz0TLekTtK07UAC4Wvm6xnWqhfLnVo6aby8
         0VRWgywH/DMW+4Vu2zxtlw+L2CQpvvIuEfGuXb01tIulECEQ4zXbZXsELBZ9eOI5MfCs
         5LOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SkYyGyb7z/lWsAu8Sjl8TsKGXsmkYRLIrQI3QJXImNA=;
        fh=wtaFuf0rdOBVUZWc3OxVWxrZeS+cqPBaiKYwrjaEERg=;
        b=G1+LQpoLdtWmX4n3GAT30Obht77YINlYJs8+LJ4Pwz+SF5nDv9BJGTv0mSWIEbKmb6
         IIZcT/Np8GMQ3zoS8484bWtjWVgJDwjqyOKC8hW/LKHbLtfy9e42xf2Z3UjejJDM0LBj
         aJ+26ZkUTzccNKYL+dWsxNF5nlUqqiuXbeb/RjnpLh75IuTj1i+yVjgLqEQbt1xfauMG
         ZG7McT9NvnhHLzOwFBZ6slB4bvmy79IzY4fF3gKeYR9LkQdfq0581okhKqowEdLffQ+0
         VsKYZAhJ5Txvh8u9cAlMAWfUSyQmsW/xK9WeRTUYNDlIG8PMxKyVuRIrcC2kn5uz7UpP
         cY1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148970; x=1790753770; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkYyGyb7z/lWsAu8Sjl8TsKGXsmkYRLIrQI3QJXImNA=;
        b=Vg7Wy5qReZ0rVwsLO6qzouN6M6GSKzqyE7sFnu+Hd0Ap/Hd3Qa7KScwYC+hp1CU8ma
         upK4XKcKd5PKfaFZngwg3qrwdl1O9iAlw3SLvAVOMttLHn9BrtBmGWTHNkszdZGYTT0y
         kF3m4k3ryMu+dNNQTCAcLXuKwla0zBCt+2qC3ds3hyn9UfN5kFAkgMc12sKHUeRVF3Sk
         N/LvMt45Z5QUpdscryBkdOCk2hMhzfFfZZwzAhwXKq+4v47SvS3PcOy7fnYhwKAUsRwx
         lfvPEfCPT3HNt9GjjUq6QRBpMldWjzvCT3VJ/O43wzWC9tLuOGj0MjUo3OtQljDQDYC8
         /gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148970; x=1790753770;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SkYyGyb7z/lWsAu8Sjl8TsKGXsmkYRLIrQI3QJXImNA=;
        b=1ZNcTakmc5H41fP4pAWVgHG2EBmiGLczkJFCwRY7Dmqfk4IbwrCOExbVHz6Y1WGFuF
         rMXZnqZl+RpLoqm/KhXHh+BtKVy42Wo19TtVLMEJthPrJrHqF0dBkZ8RjfASwwnknZ1Y
         cFwSo8f3BZ/Hob0ZpKdCfD8CCRFjU6rmTi8jkQh3MABFgYgIOM5/44pdfhFbrzpkYIIW
         8lpT/Kj+khvBIsOFcYxufm4ycvDfKcQyNLG4oQBrf3Re4u8NL5xIX3ICFSTJvdLsroit
         DurbtVAcAhE3hdWVkUVTtrP4ebG46VA5b14siUD4L3dPtQcSibFKksP3gOwFk5KY6oH6
         hwsw==
X-Forwarded-Encrypted: i=1; AKwUvBwa9kk3T45K8JUMZuGXXc3nwfOlu7xCoHDGAuARTMkhr/Jhurrnj3Ppw9iiAkRUWF4kUWWZL/fRZ6DcLheL@lists.linux.dev
X-Gm-Message-State: AFuF++kwBHQKYsmpjIjUel7WgfmibAd3OgAER78pRhVIOd04URwGWxeK
	LMvfOAzmE/LD2HPZ1SU1lbnsKx1W/l4BAZ+qgHs6lr1G9rLN6ft/+WgPBlLM5nNq6V6QAMGYaJo
	owsgKVqUflvmhT/5TG6Xu9RYUklBsXzE=
X-Gm-Gg: AYBFou00HrJnu+GuedhWvS7NM1cGR+uhvzxhxXEOG2Hl+XH8yyM4xfj1z0btsYqRUNF
	2Bw/E1pq8TxvWI2XyA2xFTan+S7Ub+Azuh/TlC2TQPNCHQN/Qj4zSJhmVNGp72313tKuSF4tEaT
	TxVDuI84EoXJ5GGuoFnohNZuo1BUbwaUjP2xRfCAjuftqCa03nrrCMCNW+gRimY/TSMJDXfMD6I
	VobPmahfnmNRV5bTv8BjIse/Nj9eN+WpnCBOBR/F+oF7VT8f9og9/NmBaeNuKmOgYE+3RBgmNdG
	NgHk+pwwG3ciHyuXUcABzyhdpOTVe2Q8qhxRdx2RzbPSOEWkeWiHJjML6TJgy9I72CwU2zSQ9D8
	uI/2rl6FGXZRCz8LkLeFeFfDz7pL3NHv8madhWXZY46zkGqBZuQPeCg5DI9nntZ0o0PsejIjBqM
	L02Q==
X-Received: by 2002:a17:902:f60c:b0:2dd:c100:4256 with SMTP id
 d9443c01a7336-2df69e0980amr16461265ad.58.1790148970165; Wed, 23 Sep 2026
 00:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609230734.R1jtbjb4-lkp@intel.com>
In-Reply-To: <202609230734.R1jtbjb4-lkp@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 23 Sep 2026 14:35:58 +0700
X-Gm-Features: AcwNN1UFdjoqjrKiQ_nGicFvqanf9D0avKGQtoAWIF7No9uPNmRvBXKiwSAcU1s
Message-ID: <CAABR9nGwX8v2sdRCe1+NBVTS2O+7s3GiJpTVJ-0mK23p1YLUCA@mail.gmail.com>
Subject: Re: [linux-next:master 4776/8910] drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2974
 axienet_probe() warn: platform_get_irq() does not return zero
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Suraj Gupta <suraj.gupta2@amd.com>
Content-Type: text/plain; charset="UTF-8"

It seems the analysis tool may have been mistaken in this case.


> bb2b71024976a39 bui duc phuc             2026-09-09 @2974               if (!lp->rx_irq || !lp->tx_irq) {
>
> These should be checks for negative instead of zero.
>

The check is intended for the case where rx_irq and tx_irq are obtained from
irq_of_parse_and_map(), which returns 0 on failure.

> 95219aa538e11d5 Srikanth Thokala         2015-05-05  2975                       dev_err(&pdev->dev, "could not determine irqs\n");
> bb2b71024976a39 bui duc phuc             2026-09-09  2976                       return -EINVAL;
> 8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2977               }
> bb2b71024976a39 bui duc phuc             2026-09-09  2978               if (lp->rx_irq < 0)
>

This check handles the error return from platform_get_irq()
