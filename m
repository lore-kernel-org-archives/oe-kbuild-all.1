Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFE5374E5C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 06:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021997; cv=none; b=Oc+DK7WhYm5sCYE67UM76QspuVHLMfW6sXQKxieIJovEC+ncTXFBv0NYbyT74qaZIiRryelE4j4yB9YTpHLDpoVAC9RQu50vS7+aUEJtPC0jvLfwHQbjnSphqO+7zdMCqt37kX2jJIIu8apoKnLYVaJnNM+FNGzYPE4xr6Xghdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021997; c=relaxed/simple;
	bh=2U6dsNXbwUcpneCJm07af3HnxI6Pr5ui3nXbOFVFIFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qWdLUJS1aRRU6WALnC5jJOTUv8FNjcMhJcHGt/z41k8jTlRPP9cnqjLyHOi1sc3iYle4rRvKqwFShXYeifaVW8dfWmQDCt39QaqWPZ3Q6B/uFXarcKupPXAbMWRZSJFrHj5RC6++GP7BnWUhoZ+0O+G+EBGkCCA72C1v08Pc4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lh329WLS; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lh329WLS"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so11568715e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 09 Sep 2026 23:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021994; x=1789626794; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eDFW7V2b4G6mFPAVAKgZGZP/Dvd2Tg0+0VQwRHhDTAY=;
        b=Lh329WLSmSESSlIjFCLI8X00weQ1NSA+1KbBpO+KzM4fZWeplI90ZkSyt5tevPMN7Y
         eOKNT4EpfY7WmzEU7WdPrup5EkgGOhmaG7xEqnUL+vCvkysW3ZmnebCXLLi9Wd9NS0FK
         Xb7NRzij/1cmPOgiLFUPV37Y1fCwAMbIMVyZ7WG2JQaoIfGFBOSNxcwV7aLzR7UdLeQK
         Ftq4emPqfPJ0iEROZKQrKExVhPQdZk4aM7unTS14FunicDKnD4Y2lgPjtHRStOvXk9t8
         wpmo4J6NYgzf6aCdYiel11XyY7uVcQwRU/oNJ/XxGt57iJPnh1cVE0OyDnaWf1Bp1bPK
         UKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021994; x=1789626794;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDFW7V2b4G6mFPAVAKgZGZP/Dvd2Tg0+0VQwRHhDTAY=;
        b=CEa5Ah/Nh49tqPLnvTwHQeMiXTjCFS/1lmNTmBJB7ZovQS5GuQo1MS8TD7xvVuYym6
         U7i3Lp/Y+UVat4N+HEAqU2OGsk8YamtjGGw2ycS9MENjWCdvdwkbL8Z0D0UUjnJrsc2y
         L+Su+/K4akn99ZWf0pLxs8LA9X42X1o4VrWMXnWSnZ3LO6BLSpMy9IJs5JGR8lhLFtLN
         YPK6khqdzwcjk4jXdHW+VKACcKsiU3JCsUSE2vKrAbMOdHx2ufeG6noI8b2Id43wYmDM
         Mw/JWMq9GmJy9tIJGG+mOL84m4PhBxasJhL7wf+0hMYHHqDRex3J23FVo9ZRcQoBUOAQ
         oM1Q==
X-Gm-Message-State: AFuF++mU86yUOfR9oAzDDMlUbyp/tCwbcx3P35SXUz7c5c9h5atzUkz1
	BYATovmvYfi/oCw1IVGvFKUzKDt6Jx7vVD7IONs84BJdcWdkA63Ou8Ly
X-Gm-Gg: AYBFou3g31qSyNEjzoLJ51SPe3u7hIIUEMSB3GC+i+NewLlbkJoHWKyW6oHtUUBoTdj
	+BmeVEO1IwK92Ou3DaS1KZh0AdEpvI6q4rJst4zfBrlJzjzbvDOkaIx4xYn+kdiuabrpJdq08Q3
	kBe8r+9DxJsmDtRnKv5fN4LdujqBJ//b4JpxgRYmbE+H0s/KLetRvoTtZGKDbpmesZnF6NsD2l6
	PKU6pB0odcu8g6ljUkAYWqAoeS7nRzH7Uq7wJonuxqiTN3LH2WV3cbuQ/HaRNIHGxMuMgbqMXs0
	t/FOm8UNlfeccha5R1HgBRoqlF0qEGpiJ0iPkPxSLBcODFH0vHajd9lMdMkE0vSFl9+3lry0+qG
	BdDMN6i+eK47wOFLUdtQOcgMDCdJVEHRN1moWo9OJJIDE+xDTL88dmBtQMZ5xDnuh7ss5pZ2HGv
	GhLdOqBYgEOArLuwrP8MMA8wTE43QqIaikOVJ8uKpI0+LnuZKB6cVWXiq3fTNeUvb6IUgrRHAuf
	xVfSkfuUT8nn5YDj6WCcm6VtirJUdl6sUI2YzxmREnw
X-Received: by 2002:a05:600c:c491:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49d1f368530mr141585555e9.13.1789021993977;
        Wed, 09 Sep 2026 23:33:13 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm48238165e9.2.2026.09.09.23.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:33:13 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: lkp@intel.com
Cc: oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org
Subject: Re: [PATCH] HID: lenovo: suppress phantom radio control input on Yoga Slim 7x Gen 11
Date: Thu, 10 Sep 2026 08:33:03 +0200
Message-ID: <178902198348.4611.5427384880711199776@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <202609100719.bu2saXPQ-lkp@intel.com>
References: <202609100719.bu2saXPQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 07:48:31 +0800
kernel test robot <lkp@intel.com> wrote:

> >> drivers/hid/hid-lenovo.c:523:7: error: use of undeclared identifier 'I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_G11_KEYBOARD'  

Correct, and my mistake: this patch was one half of a two-patch change
and I posted only the half that uses the identifier.  The #define is
added by the i2c-hid quirk patch, which never made it to the list.

Both are now posted together, in the right order, as v2:

  https://lore.kernel.org/all/20260910063051.4556-1-okerixx@gmail.com/

pw-bot: superseded

Thanks,
Oleg
