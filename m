Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20CE3246EC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 11:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764934437; cv=none; b=D77ODK/nyfpge+r0eY3mvlqFsoa7yQIOC7gDS9En6zHumF3en0KRWUzBpilIqxpZ10n4Nc8gzh/JBNgwJIACQQlEX/6/R8kmWLyOk/gyhOIx2jZwUeHr/bItiumP5wb4T9gt9FWDaOGvNCpFEjkHt7toy5/iwsn84xh/dwqUvcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764934437; c=relaxed/simple;
	bh=LbT3jVPLKHvakm9K5J5rWn/tGJu+SgRY8N4vHbBATcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=l8BfyCV4wv8nZ5MQ8IR0VANGtoEEK0GfDH4BNs1yV0W1chEvQtS3kC1cmSb6O51mIYTgNxVLTRXr3vVNxpbefrfoU9OOejSo3g5HdsxT8hBZ2qS5sLnBI28TTl1XJXQIVBs5tsLw4hb+qL/JIZd3oT0/oKLWaur3XBlAzmq5zVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H2jpKsDr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2jpKsDr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764934432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7SiuR9d+PsViqtUAja0334g1LJzjIh7Uvcnu3cxAFw0=;
	b=H2jpKsDrtoG9emjeoE87kxNuP3gXOETZnvOvkff51K2TvNWDjCw92VCOVPtgpjQGwIIHzu
	tx+RxVZ14JIRXocsj1y+7F5f52umS9Ay6zdTXXgmizAW4ScLlzPJxRZmyR/Xp2aJ8XWuZm
	Ok3ebRWGiCJ20hdvBaqo8Fx7D14DBvs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-AfDz6EpeMuuhsf7I1o3mQQ-1; Fri, 05 Dec 2025 06:33:51 -0500
X-MC-Unique: AfDz6EpeMuuhsf7I1o3mQQ-1
X-Mimecast-MFC-AGG-ID: AfDz6EpeMuuhsf7I1o3mQQ_1764934430
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e41884a0so476020685a.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 05 Dec 2025 03:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764934430; x=1765539230;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7SiuR9d+PsViqtUAja0334g1LJzjIh7Uvcnu3cxAFw0=;
        b=avstg/vEGubBnbiHpzD/pmqq5t/h9S9oFLeXf0UTbpAU1OJFX58ouptLEATYdTiNoa
         IB9xIa52gcpu+GDRHmvdlJtkKqJgPUIVet88XbZiFl+ZlzNNYaFau5XrG/MChFQl0nY8
         RSPH0JseIBLWTtHHtgf4ZsNkzzLX0V5dro0ZKO0BaWwIJlvxVFYcM78aDmqWwQEtJrk8
         eT8RAJ2/4vliUBcL1pY3U59I91VCp5eQ/oVCkGTT9YnP4grqmGgAGS/juy9zZoOV8vHu
         ZWXO6D4qdZg6juFkikUer0EGH5XtS8riykQj/DjFJr/lJSO6iUj17WSwVxZkC1OaEqY7
         IQ2w==
X-Forwarded-Encrypted: i=1; AJvYcCV5pqMpW2r0lZnmCRMNKEazWv3URMcmRxdhgKh7KyIMSwf6mUvvtLyE+ugu9HZ7X8+rdUGWDj/1CCVzTgbH@lists.linux.dev
X-Gm-Message-State: AOJu0YyCdzYv43Tqx2aF73r6yHK6H66ZsIl6iXzvMmOdTuiGqiY3tGCM
	v4XTE3gOEB4K5aWBdZruaoeaE1N0Ol4L/+c0nn0wZw49Nh/zDohEpopVml7FKhYpVHcenovcfZ3
	HkGI3W0syQSdV6nyOWaOkzcyQsxuGs0Yscsh4G9LTdP9+r+7bbXz1KHahy3M74K0PSs8=
X-Gm-Gg: ASbGncsSLXhPFdPjs0Fv6IAo3YMaBYqgTuzdgVCuqqTBXki+LGGswMTQsW9Q6KHCFCt
	/XXMfR80pYcIGtxgvO592b2EJsrzgiX8xVwDqLwwDA8J89sn+W+OPcAcI5Kp0KVwAfOOXb+BN4s
	0/eYkdhZEcnPCmpOF/8GtD+sToj4AIoGZXi2S9+J7e/zcYxawMQJogoG0TqiS5RG5SnY02D7dMm
	lM1AasGxWZyxgqP7YRerqU4KqiLYTOqbK3vWO1TI2CIYI0y9FUnnsVJtxq0rbx+aAcRU2VfBjCN
	RI/horUcJTaagKpzZkluGrRaGORx7nR/GjhPFmE3/4G2Wb4nnGFKTs7Ctb+/7+VqwqlZuHHxvAy
	n11H5Ob8Qz3sbzNfmFtJclQNzwRM9KnknfK+uIHsmbTpq
X-Received: by 2002:a05:620a:bce:b0:8b2:edc8:13d0 with SMTP id af79cd13be357-8b5e47a48efmr1441749385a.17.1764934430586;
        Fri, 05 Dec 2025 03:33:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9wykJ16DbQPdhh4wIDn2WMVE/7FVuzUzyijuNYKHdKL3aiyIVqnHcx/xOhxOQZ464+ZuuBg==
X-Received: by 2002:a05:620a:bce:b0:8b2:edc8:13d0 with SMTP id af79cd13be357-8b5e47a48efmr1441744585a.17.1764934430021;
        Fri, 05 Dec 2025 03:33:50 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b6252a08fbsm375431085a.8.2025.12.05.03.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:33:49 -0800 (PST)
Date: Fri, 5 Dec 2025 06:33:47 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor@kernel.org>, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aTLDG_LEGQwgJUwg@redhat.com>
References: <20251201-clk-microchip-fixes-v2-3-9d5a0daadd98@redhat.com>
 <202512051151.N3iZUKEG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202512051151.N3iZUKEG-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H9UrW0O1niqs42j8x6EW8Oa933Kzpl5SIucAz96Y0Io_1764934430
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 05, 2025 at 11:51:12AM +0800, kernel test robot wrote:
>    drivers/clk/microchip/clk-core.c: Assembler messages:
> >> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
> >> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
> >> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
> >> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
> >> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'
>    drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'

That's related to these calls: __asm__ __volatile__("nop");
In the case of compile test, I'll just make this a noop. I'll post a new
version.

Brian

