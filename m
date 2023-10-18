Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3121945A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 10:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gEM27ser"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4083740f92dso9536485e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 03:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697625146; x=1698229946; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VsiPnpSACr9B+lnlwbErKj29RaM0XAz/xPYHLf8w0YA=;
        b=gEM27serOAK82h1Z03m+SoUJLyY44zh3X5EQK5/UsGeSZgIhv0rt75kOJOTMgCWyA6
         gms0bAxADy5qQ8U3TZyPu20tvvCtohugzvpLQwcew5xVlyT0hla52i+h+moTcgrJV7yK
         IRG91mQuK1iE8wmknxg3ELPosewk1J3nE92iprH2bxTFSdiWZY5vCY5tw1nQLqIEXayM
         ztChmW/sulkNFF7yeeDUEYN/fIQDqemAKd859WwbTUoKGWPLtM8G2+C3ZrrP6xBAddV8
         izSvPirz1QrHZ7tn+1Uq4lr1nment+QjL4sI1iuUFZQQsTI5V1oQCyE6MHdNhwJE/6WE
         Ga0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697625146; x=1698229946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsiPnpSACr9B+lnlwbErKj29RaM0XAz/xPYHLf8w0YA=;
        b=rI5q990qpJCn4eQ8gYrgLYFmHHZiBMVf1pf+jFqoRKpT2H1XcL/ovdBuP9wcKFniIX
         f7Y3Z/FpAtqp2OZaSOG/piU8GpOcqz7sZv1tjHfDnO/+P8t96LsRAouTqCK2kZojvtUM
         VWsv5//yjJFaZipEGR3tISIZw0er/hibH3KzEghv+2l9Wfm/yILqn8408WiZcERJEvcN
         Hly7ZOUOJEB+YzsGuDK4DyINT2K2tXR894MlV5eTxuwdyEp0A5UkfENbZlmYhbv8mLr8
         wdjRYUIX0NqwLaFHjAWYmkwcN97/9An+y+flK3fpx3u5C2lCbq4tZFviXiM4R4DB8TsG
         R9/A==
X-Gm-Message-State: AOJu0YyNfm7KF6aeE3fkv+fJnvUyOZEWRBvIuKP8xEux1KkDk8H/fDb9
	jXYiQrT9hkNoAttzmyHztBRq5Q==
X-Google-Smtp-Source: AGHT+IHcrwjdRkE5UPJdS7rOGC82f4RgDgBOYpmwPQMMUj4HIKQ5pdH5V2CaRMgoGmuCxZRJQM7h5w==
X-Received: by 2002:adf:fd50:0:b0:32d:87c8:b548 with SMTP id h16-20020adffd50000000b0032d87c8b548mr4100977wrs.21.1697625146265;
        Wed, 18 Oct 2023 03:32:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d4712000000b0031984b370f2sm1798863wrq.47.2023.10.18.03.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 03:32:25 -0700 (PDT)
Date: Wed, 18 Oct 2023 13:32:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild@lists.linux.dev, Lorenzo Stoakes <lstoakes@gmail.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm'
 could be null (see line 3667)
Message-ID: <89caf59a-d3b9-409d-b1ae-9e370cb9ee7d@kadam.mountain>
References: <f82be227-bfde-439a-b339-1b4ee370d59a@kadam.mountain>
 <ZS+dSd9Z6/2wU0Eg@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS+dSd9Z6/2wU0Eg@MiWiFi-R3L-srv>

On Wed, Oct 18, 2023 at 04:54:33PM +0800, Baoquan He wrote:
> Hi,
> 
> On 10/17/23 at 05:26pm, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
> > commit: 4c91c07c93bbbdd7f2d9de2beb7ee5c2a48ad8e7 mm: vmalloc: convert vread() to vread_iter()
> > config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231017/202310171600.WCrsOwFj-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171600.WCrsOwFj-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202310171600.WCrsOwFj-lkp@intel.com/
> > 
> > smatch warnings:
> > mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm' could be null (see line 3667)
> 
> I see the code deficit, while the reproduce link seems to be unavilable.
> Could you double check the link and provide a good one so that I can
> verify the code fix?

Here's a link.  :)

https://repo.or.cz/smatch.git/blob/HEAD:/Documentation/smatch.txt

Just build it and run:

~/smatch/smatch_scripts/kchecker drivers/whatever/file.c

regards,
dan carpenter


