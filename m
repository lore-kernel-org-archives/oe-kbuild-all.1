Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED13D219F2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LlNwinV5"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a1f8510883aso378474266b.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 01:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702373337; x=1702978137; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UKYfbzXvsGiIbL9qJvWj9hTGg+l4DhDjhcdJ8y4v1Ig=;
        b=LlNwinV5o0uNAxyDk3woppLzGPY2FnmLdrk81uceAF1GfKojSVmcxihkwXBP/xbTEk
         d5XdUiQdCXxH++8UFCZu77t2rsbBwl7UFgUdspNH9BwPQRpacmKsmrOXifydeI3YxtQr
         VvphQkyUf91icIzdK+DOvxm/SGFY3+t7JzNJcurRJPynzGam3y6NKR24mSB1/M+Avlb1
         0vJ1dlZoa0z7/9c4xOejIe3OTI6TLw8eND83mN29M9GOa3K0DirJ/dYvqGBmk7nx6y5D
         /+13H9EkPZsSSYOmUnkinOcVUBXxM+XJXEPeBRBkZbBOTKdbjh+aB3dgedJz0ypcuue6
         +MXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702373337; x=1702978137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKYfbzXvsGiIbL9qJvWj9hTGg+l4DhDjhcdJ8y4v1Ig=;
        b=n+FwfNtLfV+ly1B5245WEDv8uMgyxkEXJO2As4Yl06p2+ukksfqAt2enoH/7RD+LJ3
         gpK5FqYGFdBjrEx8L3hHwtZfdjQhSj/XtU30NTD2GylwDpWCv8uWbj5pTdo3hqqeCkyJ
         3kr8sYHxVsHuzGLSPaulY45ut76v7ug3Gx12ZtzidlqCO3VwNKMP4j0Il9EWFJfN8Rcc
         BL50VohI//uOZfkhDA/TjV+wQcSuQLgVyi9zT7X6GhFPQk2GuBuOKSCTUzmbwte6X4St
         0llECX1VH4o5lEXiLaCbpJWsGKVpIm6v4XTVt+InkqTQtqpMyFhOxLLf76Ch6JCFFa8u
         HTkw==
X-Gm-Message-State: AOJu0YxXPbyP4/M3x8469WH5DEUpiEWKBgWt8HpEY53zEAyugZ/hBOxd
	U7cTQOoiitfB25wTqOIPs26sqQ==
X-Google-Smtp-Source: AGHT+IElj6uAARa1VhxPpt1aC7/JAi9b0TrKriiDa11dI+XgV5IVc8hDp+tZ/d2/FnhieF3uoumzFg==
X-Received: by 2002:a17:906:1054:b0:a19:d40a:d260 with SMTP id j20-20020a170906105400b00a19d40ad260mr1687357ejj.300.1702373337115;
        Tue, 12 Dec 2023 01:28:57 -0800 (PST)
Received: from localhost (h1f2c.n1.ips.mtn.co.ug. [41.210.159.44])
        by smtp.gmail.com with ESMTPSA id tm8-20020a170907c38800b00a1e30528af3sm5903254ejc.47.2023.12.12.01.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:28:56 -0800 (PST)
Date: Tue, 12 Dec 2023 12:28:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Luca Abeni <luca.abeni@santannapisa.it>
Subject: Re: drivers/video/fbdev/amifb.c:3375:32: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <3d090a79-7566-4e52-a875-76eec7b794b1@suswa.mountain>
References: <202312051741.BVXr9CRP-lkp@intel.com>
 <b139b275-ee57-4026-83d3-7d49ae04ef49@suswa.mountain>
 <ZXexaBTvLH9Espqn@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXexaBTvLH9Espqn@rli9-mobl>

On Tue, Dec 12, 2023 at 09:03:36AM +0800, Philip Li wrote:
> On Tue, Dec 05, 2023 at 01:06:45PM +0300, Dan Carpenter wrote:
> > Something went wrong with this git bisect.  The Sparse warning predates
> > git.  The file was renamed at some point so I would have thought the
> > bisect would point to that.
> 
> Got it, Dan, we will investigate why several reports are bisected to this commit.
> Sorry about the false reports.
> 

Not a big deal.  It's been a while since I've seen a wrong bisect.

regards,
dan carpenter

