Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1E74078FC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129345; cv=none; b=key7ChsXlA9j6OV7shfRWOJdlyjVeM4Xf3278ZGPLRgZRiTQnwFRN1KSx9yxKEmRNS0pW4NgBREdhHoxZahHRPHrejGUt/dzdiK1023fWaEu2I90fQR2YEbjXsluFLkjmsWRZG6CJH3kKEbDymr6IjPeDubqSHLmEsXl8X+Lqiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129345; c=relaxed/simple;
	bh=MgFjQH3kgdFgCoc4l/+xy8WhFKmK4hGtujrcyhVeg+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twO71fhoGEFoCX4kFi+ekvKc3x67IJbya8lOMIpUFfJ9ujkLxBHoyvSC8VZ0eUo3r1tkIl9w4iRmwkXT+4NYn3Uprbh2mZciJa/Zon2f9CUWF67vPM21Z3AANiHL7mlnlvIZIQHY5QnlYq9QVC9/77TwOc1Q2Uiikow7W5yalRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifq10hPD; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifq10hPD"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so4341205e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789129342; x=1789734142; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYg6ENX3iBZcZ6V+nXDUolx1uCJT2hGf2/9jC8O6fjE=;
        b=ifq10hPDpgAgDXdjf3K5wy5vm4dbb1hmpjRMQ2Dbw+vapti/31dIl/ZrSnEDcO+ElA
         UzBVy9snprAd9dzX9bTkXQRlimsvUgNABcnfjcxK09b7Q49knBnCNe3aQQcA2W8eHDHE
         U50bc/lsh/d6n7P9P62Hfb4RZnbHbMJc8z7F6lsbqA0puHTWoelkZC0xPUxsRd6BEiHu
         97i7YF+vMJc2qLd/c0jrsICZdMVs5mQxfYPtWq0D0v1foBIHjGZrtwHpl8rYaLghkXSC
         Qge2INNwWvt+qR+L7BhUTzXvtmuG8T/ixuE4ROqhsEtuWBcMhF6xQYcC36eg/toCyTkj
         c8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129342; x=1789734142;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aYg6ENX3iBZcZ6V+nXDUolx1uCJT2hGf2/9jC8O6fjE=;
        b=ER6okMj8KEKdemdNiYzsTAGDdtHdV+PeqdcFQI1dNIdHhm5F9QsjA6vAIv3HunIiQN
         Z1rVYwEU+jR5fB6mMO5A4avg+kgBQsizhTqDxb036yzJmenQXUFKacRikDvtoM26NokQ
         bRi/gkJQk3RCLWMwWpThsC0TAgBmib6vKO3OrGYphu96yF8wSLPwMIdF7oVdCfANfbtJ
         nw3fFkKkLiMEpH+8hWX8TXT3dJUN27h2Vxhp1rcXOFevfyPFRz0QJW8rSEKDbtfl9lAA
         UyeZzCyngMkRMTkPYjN03SaoNTXTkFjokCop8siUzIxOofwqAxLxrUg/bl8Re4rulDRY
         dqHw==
X-Forwarded-Encrypted: i=1; AKwUvBywX4I+A6KcPHAP1B4OV1b3sXTOp3/S7JxzkIX0K/++4KnZOwT9gxq1Q2Yrp0sGrB6hwywtpZ26D1RrOqmb@lists.linux.dev
X-Gm-Message-State: AFuF++lZrr+cwdH9sCTYtBPWsZacF0JSy8WddfcFwAHFlaQM26lidVb7
	wjubYZ0fOSpxpLTU2wCZxgjrZ/fVZIWQGpMq5rKZsUTs9Fqa4eAGI1vs
X-Gm-Gg: AYBFou2MeKAmyRysBmMU0/hrb0lCVulUgL8duHhZzo3cM4vWPva61xRM0Ig8NU0gUoh
	lWYrpArlYSrnwouEduY+DIbeGad1CgoAuB4A4uZxYUMdn5nyvGC8NQnMuaCwRhW3+g2/RBk504o
	MNA9IcCVnUbIW7HJxkMFH4xGyyzBXky60PuLGRfaXq4urpsg+k00FDbK0piTDPeZii5HODOaO0r
	+wE8AoKvyvDY/jLdez2Ey7XRGhr86c4mHbxcVul+/1A+dUme/a9wTpLptlgeZRWTjju1kkRZSK7
	09PsQphoiOXyMo2EJLv5rk1B7XYTJLX2662OQd0ZSaUjgGszH+XQnqXqU2vgvzv+825DtPQCphd
	0pimyIg90rTR7OdRiptIkTRGnJhMs6RlsMC8tF/D4cUlxS34oFpqOjcAwwk+joTwDTNUiK6tnin
	WoJrdU0cNSY1q8Zd2L8hHL+ijZa10J8mQPoQYDAt5tDjfuNtIBb+SBkTKYBsSWR29cDx8=
X-Received: by 2002:a05:600c:c493:b0:49d:2607:4ada with SMTP id 5b1f17b1804b1-49e619bf31cmr80924325e9.14.1789129341343;
        Fri, 11 Sep 2026 05:22:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm164864835e9.7.2026.09.11.05.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:22:20 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:22:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/dma-buf/st-dma-fence-chain.c:207 test_find_seqno() warn:
 passing freed memory 'fence' (line 195)
Message-ID: <aqPyeNLCsy-k0DIz@stanley.mountain>
References: <202609081301.6ARYAElY-lkp@intel.com>
 <3f26027d-805f-4ab5-a181-d56a2708c50a@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f26027d-805f-4ab5-a181-d56a2708c50a@amd.com>

On Fri, Sep 11, 2026 at 09:49:54AM +0200, Christian König wrote:
> Hi Dan,
> 
> I just double check and this one and the other "warn: passing freed memory 'fence'" look like a false positive to me.
> 
> Any idea why smatch things that the memory is already freed in the test case?

dma_fence_put() can free the fence if we drop the last reference.
Or imagine that we aren't holding the last reference and a different
thread is holding it and they could call dma_fence_put() which is
also a use after free.

Incrementing then decrementing then incrementing the reference
count doesn't make any sense.  We are relying on something else
to hold the reference.  If we can rely on that, then we don't
need to increment and decrement the reference count for certain
basically random places.

regards,
dan carpenter

