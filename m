Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353103191BB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764934546; cv=none; b=g4o+X/fE4M9d6texpCdphflwuDo08lkVpRQlHHjzABuZQJVo4374Y3F8nX2YKFQAYnu8zTjVdrYPjKB2o0UBIGi4H5r78AiD/s6zPD8hWWoxfYYl2kxVgFIwUxYsCwsJ+ZDS4ul6nXpT1iOSNADqntTbaky+ZStILIhBTAFsjpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764934546; c=relaxed/simple;
	bh=Jzm1bEXUYpHnFh9ZcEKGxsYxoLlxjGYwQ1tCJYuM+v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fL/33oskLpL7lw2BskXhXjcBohds4oLJik7teOCnpm8uq4mmvVP/WQu3TJG7Mu5gRn8iS7Nbaa+P9exSZGao2AeI8LtvGrTkmLzoNhhed7tynLgAQ8u6tBKscYARyPgAizMd7L6eiBxjQd4+5rm0MD2FMPxqEFvbbxIT2fz6LNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkvBvR35; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkvBvR35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764934541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WMNKSESp2KhR2u7iq37LU6C6fvZCMOUrQKe23habOVo=;
	b=dkvBvR358674SeC4wDy1v9nlEc8tdhmL/DixkoBvO/FO/DZgMUgiMh6vVdq/PC0smxL6L+
	BX+kPQ70w3kANJ0PezJFmxbhYvyLSTEEEqM+DEE3tBRvN5eccHur0WPVp8E/hdTCAgIeZX
	Es0i7RqWC9eHlAp4kyxQ89eI2br4bv0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-AQYZa-LkOIadCsFyMUhJUw-1; Fri, 05 Dec 2025 06:35:40 -0500
X-MC-Unique: AQYZa-LkOIadCsFyMUhJUw-1
X-Mimecast-MFC-AGG-ID: AQYZa-LkOIadCsFyMUhJUw_1764934540
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee1964b1b4so31024581cf.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 05 Dec 2025 03:35:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764934540; x=1765539340;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WMNKSESp2KhR2u7iq37LU6C6fvZCMOUrQKe23habOVo=;
        b=H+zaC+tLEsqtdBOTJt/VPNGO+8BNzQu9tMgn4d5/y2gC85SEtiZGBfuuNBPuHEZIHT
         0Z9IO5+z5KjA5xtHJ4nyZaseKKOb6qdTkKPevcUJwAWkN63I6UE+STgxMh9JQSwXsKcM
         K1ddZRLAaU3qbW00VzXudFp3uuwBBRbCUV633XdOZsbIhex3+Hc5dSa7zFhCJ5HRkkSJ
         NJf0QOCnKJx78svsbu42L4z+gje9AiFFDTgpYYSrMRGdgZzE52S+9FKSamBO1dM2MWgV
         w0Vtngdz8Gq3P8H5GThytID+UiyFaDwJ1CpfAxRbCDicAJJZwcaUNh8BRDfHY0IwIoxR
         UDGw==
X-Forwarded-Encrypted: i=1; AJvYcCUETYxn1tlF8zwagl5Kw9PF3iAr41IO0Ss77AgJ5oIkbf6u/B9+2GB5W5VtExGDrNCMGx6cchcjYdt4Ud9c@lists.linux.dev
X-Gm-Message-State: AOJu0YwWkszbEFI2w09iajgyPTKEF6OqpcB+8MZaTIlW4Q9lt4yfddQB
	SaaZfcdjrv4Npp3XQEgVXv6VdSEA7CgE7xEuxcv2N0IQEfsT3/EyrkWr8ShZ2zulDAvky0FbOgJ
	rPf348Aw9qpl1UR8/cugWJ9bBl6XrdeTYCVXzcgBPMWqAX4U45tH/lFLvn1xFpjtcfoi6JnfS0G
	8=
X-Gm-Gg: ASbGncveDOaeCTIl52lOSYbg9kLq+h6tGl5hmWddOb5Z16WssZwx/igBec5gpa+5eu6
	1Onan9BSGIS4KkMQz3bX2AjKQjaibIRslQBGVac3t3eeNm3uy1oqRRYvOzj2spvgZfwLFpLBsgU
	wSJ4pRqOAKY2pKrJlAc131dV3bl3muJrliuZwYx7LboEuTPZXLeoBV8P3uJR+Rd/2/Ypgb7/sGG
	QXZJBgIpViAEzRtylWYEBGPNh3lamg27PyIqpji2kz7XtF2LIbWWBe7ZzTtyCcKfQKT/dOCDj9w
	JU9YInTduv3tZzxVVvRamzG911qpPRnC4hpNkbw4pQv7ZcvLfcAQ5du4Xt1l0efvJHREmysu4ao
	TririDK9toatL2x/Ty+D9RTl53SBOfNb7Os3ZpzY9OLij
X-Received: by 2002:a05:622a:188f:b0:4ee:2942:c4fb with SMTP id d75a77b69052e-4f017547426mr129888001cf.31.1764934539903;
        Fri, 05 Dec 2025 03:35:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYtLtTV+jrOOLlUAt4J0kXxIGaZvbsF+GW5Ikr3Ny5hO9ethXcJdrLBtX7RmdExo1wPjVblQ==
X-Received: by 2002:a05:622a:188f:b0:4ee:2942:c4fb with SMTP id d75a77b69052e-4f017547426mr129887661cf.31.1764934539516;
        Fri, 05 Dec 2025 03:35:39 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b6252cebddsm368213285a.24.2025.12.05.03.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:35:38 -0800 (PST)
Date: Fri, 5 Dec 2025 06:35:36 -0500
From: Brian Masney <bmasney@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor@kernel.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aTLDiK50Me-iNkdz@redhat.com>
References: <20251201-clk-microchip-fixes-v2-3-9d5a0daadd98@redhat.com>
 <202512050233.R9hAWsJN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202512050233.R9hAWsJN-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5S6YggvtEgRU31CMhBUubNWMb0Ef-MV0lal-pooalBM_1764934540
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 05, 2025 at 10:21:55AM +0300, Dan Carpenter wrote:
> smatch warnings:
> drivers/clk/microchip/clk-core.c:300 roclk_get_parent() warn: signedness bug returning '(-22)'
> drivers/clk/microchip/clk-core.c:833 sclk_get_parent() warn: signedness bug returning '(-22)'
> 
> vim +300 drivers/clk/microchip/clk-core.c
> 
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  286  static u8 roclk_get_parent(struct clk_hw *hw)
>                                                              ^^
> returns a u8.
> 
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  287  {
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  288  	struct pic32_ref_osc *refo = clkhw_to_refosc(hw);
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  289  	u32 v, i;
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  290  
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  291  	v = (readl(refo->ctrl_reg) >> REFO_SEL_SHIFT) & REFO_SEL_MASK;
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  292  
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  293  	if (!refo->parent_map)
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  294  		return v;
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  295  
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  296  	for (i = 0; i < clk_hw_get_num_parents(hw); i++)
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  297  		if (refo->parent_map[i] == v)
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  298  			return i;
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  299  
> ce6e11884659988 Purna Chandra Mandal 2016-05-13 @300  	return -EINVAL;
>                                                         ^^^^^^^^^^^^^^^
> So it can't return negative error codes.
> 
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  301  }

This was an existing bug in the driver. Since I'm making changes
to this driver, I'll go ahead and fix this as well.

Brian

