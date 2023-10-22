Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3177FC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="dzACHCnc"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507c91582fdso3344394e87.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1697967970; x=1698572770; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OT8NQtExuF3HMHiil8WHD2dltgv1lNqqQ5cT4R0t6aQ=;
        b=dzACHCncJ8S/qto/Jn/sLOjuDvplI2Mfc2714cPxMfllAmHtz3saP3NrFylWEhTUdX
         Z7xdkcAKnTgtcG18tzVD30OM15PdVdMAudIij7ThA3AnlMciY3Atr5Y2pFsA65HNgBI5
         mr8HdxQbkPdnsa23cmg7jVVFXCR/7KwcZ8pilF6PZoAHlyLd9fs0bcJD6WcXKUrtdfV7
         0tObPFJG9G2b4vIV4e9vU4aUreewOiOxdqIAWYk6PBG7z1DiyK9ny/mkyewmQDWXhFVj
         GHXRKAZ3JBCIoRQaoHv5lYEMTYy0AotWZMllGW9ecSH0pylRoFjceSmF4tVnvGZDUEQv
         YOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697967970; x=1698572770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OT8NQtExuF3HMHiil8WHD2dltgv1lNqqQ5cT4R0t6aQ=;
        b=tevhqFXIXwCbhGqeojPUyYZ04V7yeKpH23zerT3PxXQ8NoTJZUczvlC/n8RXdHrcJE
         hI7i4fHiK6/I2l/Q2UezVTfS7DcqGyugFgMwB7rxNKlMyeuyM319Cxd3KszO6q45C++x
         ckWPXFnCd+iuXHFzpwv/2fSUi/9pXw5eWt4/s95vkdqKqtf15AQ1YWvO/aENqiaORToN
         5MrbCLgOa2D6lcp/H+XhGMMjsoLi5y/7FKxI3R7A3c5lr5dw/KFiaNyazApA3fEAq+Nz
         V/TW+xCZbxgFjQP1hsz5Ffc/yEeJc1kYEP3hqKxkgT6E1LQFaCOC8WbaIMZBAgPtCiy9
         8AHw==
X-Gm-Message-State: AOJu0YxQ5et1EMBFlpkAYhNwsrhUzeTYiBsAINJgAWiYpdzWKM7E2Lvi
	ki5uNHJ0Xe/F2krwfvF7Uhb7AQ==
X-Google-Smtp-Source: AGHT+IExI6Vc2RBTVW0umlxDiyhbyW8Ff/B7MNW/fotNxuFKW1BwheppsFU8K0zjidaZbU/v5A7csg==
X-Received: by 2002:ac2:5398:0:b0:506:926c:9b0d with SMTP id g24-20020ac25398000000b00506926c9b0dmr4301164lfh.20.1697967970374;
        Sun, 22 Oct 2023 02:46:10 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c19cd00b004068e09a70bsm6601663wmq.31.2023.10.22.02.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 02:46:09 -0700 (PDT)
Date: Sun, 22 Oct 2023 11:46:08 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: kernel test robot <lkp@intel.com>
Cc: netdev@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [patch net-next v3 08/10] netlink: specs: devlink: add the
 remaining command to generate complete split_ops
Message-ID: <ZTTvYIGmJPrZKtX5@nanopsycho>
References: <20231021112711.660606-9-jiri@resnulli.us>
 <202310212326.u0Z0O9Hx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310212326.u0Z0O9Hx-lkp@intel.com>

Sat, Oct 21, 2023 at 06:04:36PM CEST, lkp@intel.com wrote:
>Hi Jiri,
>
>kernel test robot noticed the following build warnings:
>
>[auto build test WARNING on net-next/main]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Pirko/genetlink-don-t-merge-dumpit-split-op-for-different-cmds-into-single-iter/20231021-192916
>base:   net-next/main
>patch link:    https://lore.kernel.org/r/20231021112711.660606-9-jiri%40resnulli.us
>patch subject: [patch net-next v3 08/10] netlink: specs: devlink: add the remaining command to generate complete split_ops
>reproduce: (https://download.01.org/0day-ci/archive/20231021/202310212326.u0Z0O9Hx-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202310212326.u0Z0O9Hx-lkp@intel.com/
>
># many are suggestions rather than must-fix

All in generated code.
