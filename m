Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AE2B9C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 05:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714023150; cv=none; b=AlcIcvExQzSSyTOz/sOlNy8iVfxvt9AWQO+sU32eBU5c6i1jJgUjtdClYsi5cXMRUVWVi8Mjc+wJJFFlzwTzmBPgNfwLteYE6KtaaYpiF28ylVFYNfeDyy9KxFAiwh+UM0edHIuBitYiJQ4x0JOctI9Gu9HW8RkPybXmav5B2VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714023150; c=relaxed/simple;
	bh=PZ3JE39u85K0M0rv3SLGJ0Dq4lCTndTsCLjSWF9nMbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KswgInmT1ds9uDW/tI6jYBjqRmldKRYw4TNULC4f5S/GfHK7M8spONxumAoE4lXV2LLyUrSlGu/bvFvpk38v9AXsa5VtRNSITbwUhgZgkSXTgZ2KXoiVWtR1tSJkl3Jz0/+kph3JQOMyDpecx0ojXlSbmbqEACnNoWNpyOKO0+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l0suMeZw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l0suMeZw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41b5082bf0aso778635e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 22:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714023147; x=1714627947; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UdTZwuYXM16Mj2k9VkrP5ulubcWPQ9dmOEwxsHwpBnQ=;
        b=l0suMeZw05zflMXsDduDi6/fmcgGEBSDcMkCeA1sRZ6jOVlr7r6nkq3PfvHYRihDhB
         5dgIG/7P/8WRJmgwAUeoeaZ0Oi5OqYHBQDywu0yvs6EDsb8YQV7vMq+qdsSyRhsgXzRx
         c2hHz6UAkcKe2RAn+RE4cGMpNGhg9xY4T8jrh/QS4RVoha5IlenpuRk1vHDWqsXZVgii
         vZN46gI7PERJuJsGcXB9TWxp5Uegl3V+IGzp0lrgBdO7pZBIolx1zNlwC29agc2gI+Y9
         XkN2u94pXalxOKn2y+lqtLy3fAtbEVca7feUaYI9bb11rZPsHcLV+Bp0GaYykQcj1XK1
         +qpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714023147; x=1714627947;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdTZwuYXM16Mj2k9VkrP5ulubcWPQ9dmOEwxsHwpBnQ=;
        b=Y3eqLtBeKsL2tvDqYBY6bjgjTCCCvJjgCaM3tsT2ZVeYvatGCr/6ynL2FChWW0LVkC
         V9hCVGGMLvEX4jsbE8IIMT7Ds4p9chd0W9twcTagrV2ZSQi5TroUE5jd8DFNOFb22RZz
         gkmutUHbiB2XiCgbgUqcbyg0AN5A5KiT24fVcD2JBS9yLK32WfU6No3ejw7QZGha1wFS
         4GtU5uz4VgrzNlAOPIcpE2g0j6ls8UbG8NCNNlEwPtUV/HvXiOjCdFoqZdZF5pMAO5in
         LEcKYaU5UXMqGrXWv+lHt1emqXaewIqNqix/OctKCZKokmOL37fOA/QAXWSb+T+4bMV/
         hUGg==
X-Forwarded-Encrypted: i=1; AJvYcCVvgHrRVLl6czbRKum1lBqNsOkUAP6WYF+Yxe1AzPLPXPeUSOKSM1fKHSkTRFowoHreR5IiuLG7/u9P47LImPsBt0WGdKtOuFrDwRuSDg==
X-Gm-Message-State: AOJu0Yxm+X2hLVP7bd/u8MxT0A0VHisnkVMEODh/nlZDJ9AMMg/A+Xfn
	7qnn9hMUvvXz3t/vV/y61NVkBC4SClGxs+sbClg93pv9jeG7jpgT1+HxXfN40fc=
X-Google-Smtp-Source: AGHT+IGtnxLdTXO/d17U7QCLeydtbuZFyhcdeuIE7hEySyeMHNs3CFGJBnzsof5+CO3kLG2KnU41vw==
X-Received: by 2002:a05:600c:154f:b0:418:e08c:817 with SMTP id f15-20020a05600c154f00b00418e08c0817mr3027255wmg.32.1714023147171;
        Wed, 24 Apr 2024 22:32:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q12-20020adfcd8c000000b00343cad2a4d3sm18702534wrj.18.2024.04.24.22.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 22:32:26 -0700 (PDT)
Date: Thu, 25 Apr 2024 08:32:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kuniyuki Iwashima <kuniyu@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Kuniyuki Iwashima <kuniyu@amazon.com>
Subject: Re: [PATCH v1 net-next 5/6] arp: Get dev after calling
 arp_req_(delete|set|get)().
Message-ID: <047e4452-c694-4dea-9273-74ebc3a2892c@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422194755.4221-6-kuniyu@amazon.com>

Hi Kuniyuki,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/arp-Move-ATF_COM-setting-in-arp_req_set/20240423-035458
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240422194755.4221-6-kuniyu%40amazon.com
patch subject: [PATCH v1 net-next 5/6] arp: Get dev after calling arp_req_(delete|set|get)().
config: i386-randconfig-141-20240424 (https://download.01.org/0day-ci/archive/20240425/202404251215.QHgck00A-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404251215.QHgck00A-lkp@intel.com/

smatch warnings:
net/ipv4/arp.c:1242 arp_req_delete() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1242 net/ipv4/arp.c

8f4429edb1b716 Kuniyuki Iwashima 2024-04-22  1235  static int arp_req_delete(struct net *net, struct arpreq *r)
46479b432989d6 Pavel Emelyanov   2007-12-05  1236  {
8f4429edb1b716 Kuniyuki Iwashima 2024-04-22  1237  	struct net_device *dev;
46479b432989d6 Pavel Emelyanov   2007-12-05  1238  	__be32 ip;
46479b432989d6 Pavel Emelyanov   2007-12-05  1239  
8f4429edb1b716 Kuniyuki Iwashima 2024-04-22  1240  	dev = arp_req_dev(net, r);
8f4429edb1b716 Kuniyuki Iwashima 2024-04-22  1241  	if (!IS_ERR(dev))

The ! is not supposed to be there.

8f4429edb1b716 Kuniyuki Iwashima 2024-04-22 @1242  		return PTR_ERR(dev);
8f4429edb1b716 Kuniyuki Iwashima 2024-04-22  1243  
46479b432989d6 Pavel Emelyanov   2007-12-05  1244  	if (r->arp_flags & ATF_PUBL)
32e569b7277f13 Pavel Emelyanov   2007-12-16  1245  		return arp_req_delete_public(net, r, dev);
46479b432989d6 Pavel Emelyanov   2007-12-05  1246  
46479b432989d6 Pavel Emelyanov   2007-12-05  1247  	ip = ((struct sockaddr_in *)&r->arp_pa)->sin_addr.s_addr;
8f4429edb1b716 Kuniyuki Iwashima 2024-04-22  1248  
0c51e12e218f20 Ido Schimmel      2022-02-19  1249  	return arp_invalidate(dev, ip, true);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1250  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

