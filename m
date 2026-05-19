Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A343DC4BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177547; cv=none; b=cvZJHxvf8aXNo0ZZGbQw3yBYKsZbvYId/ORz98zWAKsgTx8su98UA6FRyTkpHa/Gqm1A30aBFEp1mcHs8CstkAtjRbk7jyPVJpQUbeHxB60e3MiDZszDTtuKSCdOgXtUiL33UbmsXa7dk7vIXHLwrvSOFM7lEzW9P7b/UP/tF+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177547; c=relaxed/simple;
	bh=dDe5ISZtdomf+hnyNFOgzEv6n1mbjYqwSsrmVrOVxHY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ua1P/0s2ol5yxTz7nNc1/NWXEwBvo2KxvnMeVxnsfUM9/DBcvxV62eFt2o+7qrBfa3afCV2AqcTT8Y2WoAebbPIY+woumkapR3MuLRN91mkrD7kTZoRViEGyvQdq2wczOc0NQqxZMLDgpw9VFj3AnK1dTbDPa5BlW96NarhzcHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLpwMTcD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLpwMTcD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso16832215e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779177545; x=1779782345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIaDQb61nFaJysAgVO0hYea1n6OBZz1pXSKqoKiGMyA=;
        b=sLpwMTcD0Zjia6OkCPMhg0wOgRVLcDYrTH+alh4EnBEqMs8OFFWxkP0fdL28tZWe4F
         6frfCKbN85s1BUQpRLhusfhFU++lD7tBrguT8IsNMmw0nx7AQy8mCicMq/DzudUZP0dx
         mI3Q6NDFWRBSFRNUVqj1Gv08qaOaOBBg4yb2n4ujrKDSt7733K1qMzn8VH0vpWKJb44D
         FMRz4jAxc2amoJxKujOS1lDUosfvuRW27HDtkGBpWyPV7qQPcoOqwNXa72K2a2QHjPnF
         5GApytPZo2CDhaowFMzTtzyXmmDtcxrkVzQoa6KbzsCA5yoSmXmeWYmDIhUbEML8Xsah
         obfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779177545; x=1779782345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qIaDQb61nFaJysAgVO0hYea1n6OBZz1pXSKqoKiGMyA=;
        b=tZ5WwwpVR74ebMg1U1tUEajatI/apnaXjDP7CCzh2JoYdQW3Nv+3eo5qQY4lu3gK2m
         Me7M4v3DB2JwvDEEd2UGLDVJkAO1g/vfAMvQYzFZi8vdpZ53ZFpcno/k25Eaa2DoLIGw
         8nO2ZsR0mrlQ1VTfqyl8wXlhu7MVkb5Ixbe/JaR6F19r41GI9R4n3Auhb56epo5YDQyv
         RrBOsCKZ1onY4pn3whzbD36vKiB07n3oQki8SHV6rW50BVgWhW7QE49l9l6DCipexPn5
         DBLnszBwDl/7Bi+fCZqN+P0J5o91kU29NKiNfrBC1nD1yzqeTV6lu4wnvaDROUZVXGh+
         v/2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8RPe148RiUo37HAbaFNIbSugH7hnb8IEbCre25mSQpe/xwgZqyuCunI/ub5vLq3ihbyxLSlgDxiaXBVkqb@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4hObSACaEn08GA8DkVaPAJKH5hbHaQjyL+iRLVLpNdQlZF4S2
	66X0iBtTnb6ot2NiBjoKg93ONayEPA4HLgtgHeXPQXPECC/SWt9gKTdf
X-Gm-Gg: Acq92OE6Iw6KZtT7h2i2sqRyQEe16mIzzHjRQbM1iVUab1bKO2nuPymjsIDH2Rkmzst
	tJMWqxgwqG46FPFP/tpW/cPNyIFUiZs3st4mKM2PKdM+8OsjD3Oy/L2HfBz2dFvhyx1+Xcy5jcQ
	bu3K0x7CAyN2KHPejZmaefuKr1pwDq3piNMs2tXurf36NSnrUwFcEzDByUN+V/QODpObPfvysox
	EAg/itVkkeufYYfMwiXDRv3/rrVHL0nKtLxhO2SfF3QFUgvzo7GFH0ivAg+fkcXHGpw6YP+AaK0
	ZFqO2GFs8e+HgnV19fnIV6K+Pw0Hb8rvXdrb6NNtK6hFnIOfh/gU4ajrMybBrzb+iYG9VT/S6YQ
	bVXiZKVkaI0V7CJirTKCJ60Vop1pq3oV4/5ID1xO9BcJOlDsRvdmzow0J5LrT5UbBjIILxFyiMb
	Qv2sI1JmwTVNyM/iAToZ6wusto4BRsYw1DRybsHo5TIQddcTI7YbOiYNcUKoxVjAHY
X-Received: by 2002:a05:600c:4685:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-48fe5fd494dmr283200195e9.1.1779177544506;
        Tue, 19 May 2026 00:59:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490225bf8d6sm1893155e9.13.2026.05.19.00.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:59:04 -0700 (PDT)
Date: Tue, 19 May 2026 08:59:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v0 1/1] iio: Convert IIO_CHAN_SOFT_TIMESTAMP() to be
 compound literal
Message-ID: <20260519085902.28b1730a@pumpkin>
In-Reply-To: <agtXwmSPs8iARJ_e@ashevche-desk.local>
References: <20260518071349.469748-1-andriy.shevchenko@linux.intel.com>
	<202605190130.oWitiRzG-lkp@intel.com>
	<agtXwmSPs8iARJ_e@ashevche-desk.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 May 2026 21:17:38 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Tue, May 19, 2026 at 01:32:51AM +0800, kernel test robot wrote:
> 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on jic23-iio/togreg]
> > [also build test WARNING on linus/master v7.1-rc4 next-20260518]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/iio-Convert-IIO_CHAN_SOFT_TIMESTAMP-to-be-compound-literal/20260518-151541
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
> > patch link:    https://lore.kernel.org/r/20260518071349.469748-1-andriy.shevchenko%40linux.intel.com
> > patch subject: [PATCH v0 1/1] iio: Convert IIO_CHAN_SOFT_TIMESTAMP() to be compound literal
> > config: sparc64-randconfig-r132-20260518 (https://download.01.org/0day-ci/archive/20260519/202605190130.oWitiRzG-lkp@intel.com/config)
> > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> > sparse: v0.6.5-rc1
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190130.oWitiRzG-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605190130.oWitiRzG-lkp@intel.com/
> > 
> > sparse warnings: (new ones prefixed by >>)  
> > >> drivers/iio/adc/max11410.c:807:31: sparse: sparse: cast to non-scalar
> > >> drivers/iio/adc/max11410.c:807:31: sparse: sparse: cast from non-scalar  
> 
> Thanks, the sparks were expected exactly in this and one more driver.
> I mentioned that in my reply to my own patch already.
> 

Can you just remove then cast from:
a44ef7c4609724e Ibrahim Tilki    2022-10-03 @807 \
  	channels[chan_idx] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(chan_idx);
since it is no longer needed?

-- David
