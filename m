Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCA821516D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 21:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738792617; cv=none; b=dME5hI2OsOKsKMu5/XGi+bIFQ+KGX/OLOFH4F1iTf5pXIvhPNW53n7Izu7nWsvzC0W8RqvigWu38VYo0PEL/oRGL6VjyZ14wPvKmV0m1IexFtHVS+PnybOl8BlmhNWFmJNxBva3ygA4V23v6LxaJvdM4yf+5MAXTCypQLOZJLdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738792617; c=relaxed/simple;
	bh=4qql90pn4szEvuE1q2VwoHg70ZIx94oUk+Hs3pTwU2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DssSCG6vQzWM7DN9Wx+J7ca3CaOXa91ptmjTKTwM4ZGiZxCkFFkGNPKn6QHvsfvT/ZII6WKIoiyOelZ7ugCtK+6tK1UNYxqt7JZuhxUl4yljvH31qGraYw5DjKfZZtptc/siUO0d2KGrHojl7GK7M8x/vBxldKD0P6Wu/3KayVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljaS9P5L; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljaS9P5L"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43622267b2eso2527785e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Feb 2025 13:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738792612; x=1739397412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExpNnKUIu15RnPJeZ+26Wmgur2xuMxA57BJC1TlkS3k=;
        b=ljaS9P5LpPRqMkVhSKU2GktZo6NGXtglaD7r/bFpP797Jfo6pHEMkx5bfXYGMGj6DM
         B+S6kpJ4FbtcJLqwFd6teywNMTAPAkyWTPsNkKvngSTlFx3QL65Z1u0FW/6NZ8AILsxO
         LLgLSdi3T4JUQHQFNDio7Ntpql1mrw4tAmsMICdGj8SqIYhgnLvOcHOyN3Wy0oZyz8X9
         eGvVJ3tcJAkY1CK/Ja5G3fUWjBihnZZe7MRi/S8jd8BGBbGZF3HbnYvOy3Wvg4Eim0n8
         82WEJgL6pPOTrugD7z2CUJgwSTOOWfOht+OElwamHA+VXIZXhVgSB2DHVGisCELINj/1
         +rOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738792612; x=1739397412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExpNnKUIu15RnPJeZ+26Wmgur2xuMxA57BJC1TlkS3k=;
        b=dnxV7kOCAgpNfukATjuE8lEjizH3dJ8L7y/72npmV7b0qSrkHOMY261GHOdgMlKAKv
         vDy4couLvEuAB2DzuSJl0U7wF6Y75yRU8Lq/sVPhPA99I9CQSYM8Lrdlhnb4mGwzBtJd
         zw9kkbwWhsS3hHkYw50YTeCnwa4xIJ213YSGg9xkHvN39kp8RGs9m8y4lglbBZCDBtmw
         eW9fedlgFyis4cBMI0JXhMYfqpaRYOOqjup4OkMrxuklK8g6971qA8Zbn4l6JLcC9gQM
         FHZP3m6jpctdOrsmOEuGFJ2BoifsbZ6RyTWOCvfxfLzElCvau3Jztsneea2UcBLQsI76
         u7uA==
X-Forwarded-Encrypted: i=1; AJvYcCVWHKPAY0UmSa+lX/kKyeSaP+ZTOnwE3Mg02LyVaNH8EuuJxAway4pxKduei7tI37biHV1YWKNTWhRqV3n8@lists.linux.dev
X-Gm-Message-State: AOJu0YzpuuZhyqLxsZGwh4WG1LuGlEQVSmlsh92oSb9UDCviA6mCEd31
	sPvCwNvAeTKUV+3kXV69+T7VpVzEry321QAJV1FL9V9DCWqkIdVC
X-Gm-Gg: ASbGncujCYb+P5R2mSZj6d0N3/gA41vccsccjwDKUKYiNcH4K62jfaYTuRBqBMbg5hH
	0baPhKTGE+qBtLJ+R/xkcQzcbdO8HVdFpvZg3iWdZSdRlggZ0lkO4JgjmpsVL0kQIbV59fA7gu8
	uq79dVcL783QJ8ruI05p/F7EvfgYXZrKduzZTrOphez5U27KicBUo6YZAu+IdPxifmgCWrKrP97
	G/YdOnv8mCD+5m7+yC37W4fOU8bdqXAn4Yt0u9VUhouNKSK0RQtAhTOv4zbQlC1o+KxJHuTsZsO
	hFUs7+uezM9AKd6zMmDlcyRkisICbuEcOPiKqvEH9kLbRP09r2rA6Q==
X-Google-Smtp-Source: AGHT+IF9Lnac8vLx0Lch1E/U4g3+70BcOuxYX6wPveyHWXIkh22if2ugk0Wjk5x+SbNJB9g+wbpVMg==
X-Received: by 2002:a05:600c:314a:b0:438:e256:a77d with SMTP id 5b1f17b1804b1-4390d43db08mr38919505e9.15.1738792611470;
        Wed, 05 Feb 2025 13:56:51 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf896sm20490902f8f.94.2025.02.05.13.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 13:56:51 -0800 (PST)
Date: Wed, 5 Feb 2025 21:56:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Xu, Even" <even.xu@intel.com>
Cc: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
 <oe-kbuild-all@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, "Sun,
 Xinpeng" <xinpeng.sun@intel.com>, "Srinivas Pandruvada"
 <srinivas.pandruvada@linux.intel.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>
Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38:
 sparse: sparse: dubious: !x | !y
Message-ID: <20250205215650.1a93dc58@pumpkin>
In-Reply-To: <IA1PR11MB6098ECA558A36C0EAA1F21FCF4F72@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <202501292144.eFDq4ovr-lkp@intel.com>
	<20250129222141.478c03df@pumpkin>
	<IA1PR11MB6098ECA558A36C0EAA1F21FCF4F72@IA1PR11MB6098.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Feb 2025 02:56:05 +0000
"Xu, Even" <even.xu@intel.com> wrote:

> > -----Original Message-----
> > From: David Laight <david.laight.linux@gmail.com>
> > Sent: Thursday, January 30, 2025 6:22 AM
> > To: lkp <lkp@intel.com>
> > Cc: Xu, Even <even.xu@intel.com>; oe-kbuild-all@lists.linux.dev; linux-
> > kernel@vger.kernel.org; Jiri Kosina <jikos@kernel.org>; Sun, Xinpeng
> > <xinpeng.sun@intel.com>; Srinivas Pandruvada
> > <srinivas.pandruvada@linux.intel.com>; Mark Pearson <mpearson-  
> > lenovo@squebb.ca>  
> > Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: sparse:
> > sparse: dubious: !x | !y
> > 
> > On Wed, 29 Jan 2025 22:02:59 +0800
> > kernel test robot <lkp@intel.com> wrote:
> >   
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> > > commit: a688404b2e20f00cce6d0a2b888ef4ca9154e144 HID: intel-thc-hid:  
> > intel-thc: Add THC DMA interfaces  
> > > date:   3 weeks ago
> > > config: x86_64-allyesconfig
> > > (https://download.01.org/0day-ci/archive/20250129/202501292144.eFDq4ov
> > > r-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0 reproduce (this is a W=1
> > > build):
> > > (https://download.01.org/0day-ci/archive/20250129/202501292144.eFDq4ov
> > > r-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new
> > > version of the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes:
> > > | https://lore.kernel.org/oe-kbuild-all/202501292144.eFDq4ovr-lkp@inte
> > > | l.com/
> > >
> > > sparse warnings: (new ones prefixed by >>)  
> > > >> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: sparse:
> > > >> sparse: dubious: !x | !y  
> > >    drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c: note: in included file  
> > (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, ...):  
> > >    include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always  
> > evaluates to false  
> > >    include/linux/page-flags.h:237:46: sparse: sparse: self-comparison
> > > always evaluates to false
> > >
> > > vim +298 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c  
> > ...  
> > >    297		for (i = 0; i < config->prd_tbl_num; i++) {  
> > >  > 298			if (!config->sgls[i] | !config->sgls_nent[i])  
> > >    299				continue;  
> > ...
> > 
> > If zeros are unlikely the bit-wise 'or' is pretty likely to generate better code than a
> > logical 'or'.
> > 
> > 	David  
> 
> Good suggestion!
> So the code can be optimized to:
> 	for (i = 0; i < config->prd_tbl_num; i++) {
> 	         if (config->sgls[i] && config->sgls_nent[i]) {
>                                     ......
>                        }

That just adds a level of indentation to the source.
It'll generate much the same code as !x || !y.
Both will generate two conditional branches.

It almost certainly makes in immeasurable difference here, but !x | !y
can be generated using (on x86) the 'sete' instruction to get a 0/1 from
the x == 0 compare (that sets the flags), and then doing an 'or' and a
single jump.

	David

> 	}
> 
> Will create a patch for this.
> 
> Best Regards,
> Even Xu
> 
> 

