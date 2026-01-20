Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2772F3876CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931222; cv=none; b=HOwy4lO0UWKOgc6jdyALUIIxV00chQkwrEiLM8ie1/YinVcz9meqHGBszg0Gn59VRDibteZSuGhb0eap1CCgqdjCjOAVlEQ+NOETkDlf6dnNGaTcQ+EAGw+NdW0l2rUZA8S5kJn+Al2NOmRtSwJ96FyfgBQND+o3yLqp8kihlCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931222; c=relaxed/simple;
	bh=u900Q+4+RFYgYvzB3a7xjh9VJi33IT8iMcLC04ZR6kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ItZOl+J8MpPM8m0vXAeKwC5CkNQq7lcRv4EeA5ynMx6xhGQhYv7ov20XjGN2SL/8EhKKTIO9EdUvUTKs+cMYKcMLCY7r99U+RDsakm3EFaH8b2tDxYQmLsLNO2/5d1m/cmXyKmvaubI1gvG9aNVv1UDCx2+coyQxNr7L0wMXTEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZMg4TYGy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZMg4TYGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768931220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HzeTNg3cwqmFZZgWZOl3ddT5SIQlsBVDOdxGNUHteFQ=;
	b=ZMg4TYGyY1Z9D0r/lyXWBq9nid4bbxgbJ2e9LdcWIreibq+fqLYdQXtWa2X6Zmp5KTNW6C
	t7bBkMEUUS1vH4WkhWGqW69lYGVjbFgl24wgj4mf6P1CX4W0yrSUpaSzYLjv5pNgCacBB1
	2013hh57IDxz50hU2CK+MJra6T3+nkI=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-5hXB45bTMjieGMf8MbRuPw-1; Tue, 20 Jan 2026 12:46:58 -0500
X-MC-Unique: 5hXB45bTMjieGMf8MbRuPw-1
X-Mimecast-MFC-AGG-ID: 5hXB45bTMjieGMf8MbRuPw_1768931217
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12338749ea9so6691485c88.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 09:46:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768931217; x=1769536017;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HzeTNg3cwqmFZZgWZOl3ddT5SIQlsBVDOdxGNUHteFQ=;
        b=EYL7ivTg7cTYRMyeT3IMMZGrpWfRIfBCgyYmV4ffxNPDZogp40Ywk0P5uj/aS6Tky3
         SGrWAo1BXE1E1fEKdKkqxPYSOhQD0jZuw7CPlThgPKp06sY+ztzorCjD8zTQjs59qWEl
         lFJV+QpX7IDYvTyj3+FFw/5lV7ZdF32TpvVi6JKEcy1BohkzhQD0q2/xhy97ObTj+DQg
         S5ELEO024sfFcmtpOneYdwKEP6vfok1ZZtcEKd2o6FBh+i/i3Yvxnn2+0qxtD2uysFbE
         5TLs8XyKFPm7oxnMtbiOfiUgjQ/3j3Wi3rQ45aEinYAqfLlrpnh8shZ8nvvqY0OYyBEN
         Wukg==
X-Gm-Message-State: AOJu0Yy0TXbb8fLxHj7q3EOmYhe42SYxNDuPfz/mDcpDjWcCErUe1AZy
	VEmWWFjgqNkKAvRfbCOreZTiyFKo7VggZM/49nVeV2joBZbD0hlDJEsRpyGyFxVRa+Ahnc+uX+Q
	b9o8JDIxBO3fKu6tFSL+zst1kXqyuah9ge7ijYhUHbzZJRjlhjf2BDkcwCOtyEaPHrDhlhY9GFb
	o=
X-Gm-Gg: AY/fxX4kF9AdtfwHUNU7GIe/VgsJ456M9lb5uxaLDOH/bVCC32PbJ3PeXY57mYD0Q9K
	lQS6lrdsekBVgx0364vJ1Fye3+hdZrmTOW+5LSj2srpJSqS0FCug8wpNg51tRNCtH0eNGhmR/sX
	7jpU35SL8ZX+1xGA/fE8wOUY78DtFJqT0xWih/pW8ztTNSAu9stTakbGe+stkxXj4oI+dbIuzHK
	J2ltMjxVsriubuhj5p3tHCnjjkGQ5m1BHIKrAU1bCz0cC6dLTvX1iYFBxseWX3UDui4arNKGbfY
	GhaMpamWw22dl/Bh5JLw6WvE2OyjXqUOyRHK8PPtbFYvZbTB27EJ7V55GaM/Jpn9ArGZKbrEPCn
	xkGJeqRuE2lrKr+NQ5Dc1dBLKavptYNrvElFL3iY4P6nL
X-Received: by 2002:a05:7022:4395:b0:119:e56b:91da with SMTP id a92af1059eb24-1244b3223famr11194679c88.11.1768931217149;
        Tue, 20 Jan 2026 09:46:57 -0800 (PST)
X-Received: by 2002:a05:7022:4395:b0:119:e56b:91da with SMTP id a92af1059eb24-1244b3223famr11194639c88.11.1768931216388;
        Tue, 20 Jan 2026 09:46:56 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac6c2besm22421576c88.5.2026.01.20.09.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 09:46:55 -0800 (PST)
Date: Tue, 20 Jan 2026 12:46:50 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/13] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aW-_iv-p1ygZUs1n@redhat.com>
References: <20260109-mips-pic32-header-move-v1-13-99859c55783d@redhat.com>
 <202601162329.SmQ34jS8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202601162329.SmQ34jS8-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sAxo8oYSis8evaNVDTxOVuJJY-esBWHXgDo358cls-g_1768931217
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 16, 2026 at 11:26:49PM +0800, kernel test robot wrote:
> Hi Brian,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on f417b7ffcbef7d76b0d8860518f50dae0e7e5eda]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/MIPS-copy-pic32-h-header-file-from-asm-mach-pic32-to-include-platform-data/20260110-005057
> base:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
> patch link:    https://lore.kernel.org/r/20260109-mips-pic32-header-move-v1-13-99859c55783d%40redhat.com
> patch subject: [PATCH 13/13] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260116/202601162329.SmQ34jS8-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162329.SmQ34jS8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601162329.SmQ34jS8-lkp@intel.com/

None of the errors in this report appear to be due to the changes that
I made that allow drivers/clk/microchip/clk-core.c to be compiled on all
architectures instead of just MIPS.

Brian

