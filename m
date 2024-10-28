Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555061D5CC6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730113017; cv=none; b=JsVZCWUjOic+p9P6uoVcO7RLJsBvO373MmM9nf2PMFa4lrSrn3dYyfJ0XaFIY4YTTZ8S1UwVnJUSuTZHcbSQWh+voWDk+fXqklAg1KCkXl9zj1OOvI3vQvWsQa2guZ6IdmowjXOneECAIv/oS4gDibj+gZ4rqvAATKsxuKxDFt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730113017; c=relaxed/simple;
	bh=/Qwr1pB2SeM8Epvx/jOrwL6hE/RVoOH1whZM56KgSOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qttC3Qbypa6GyO2IUx5BS1zzHrZDEB5xChgQezaZqkYPlMZhj/gGTK1MhWKdhmPyBPCb5sqNuzuds7VZeg53qjN/wf+Jnnw343vWm864kbhE75CIv09+UP7wnfEP1+MFi3rYEEIzPZ/1i/VoaCgnqSKAJgHJamBcgrfzUadixbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a0472306cso568786566b.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 03:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730113013; x=1730717813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPxB9+Y6Dhx5f6Jz5TtPrWIreAq0S2BvQ8Yv7G3dcZw=;
        b=wyDuJxu+0SNJ4P2/0og/lTBcDYpS7n7l8lpSIRcHZkgGCPL0HCsDUr2MlRJSUYX38H
         iuZrb4eIhUAtF3SE64GV4uybcxhqFtKv6++mX14WgUUTrnmgBcm5HhuTPEQ2tCg9rnTm
         iBYJ3mV1lEbbRr6/jOiYgevK2Shz82l20+m69mkMlaRmMiH1mWAMrp9GUHViaXBU7pHR
         wjcpG0cZ9YDeozeKgCWBx5HgfOTt9Eeyd9Q35EhOTzACzcTOKxs1Kz8VWADkM9VAO7+L
         Zm8T+nUAn4GpFHFCAJprxoPh97Azj5nqkNuKCzCweABAjlS8zo9y+zTT5RjIZLZMQrOG
         2tgQ==
X-Gm-Message-State: AOJu0YxQ1GrQ3xcHw3TQisxilnRu+bfXCmXgYXmTInLrr4bFA91SRy9i
	pccR48VkTSYUt0AFiabYosNodtqEPUUz5etAYYV8gUoxkeEWzGCe
X-Google-Smtp-Source: AGHT+IE6RuG3kBekrSkc3prrrW2VAIHSBMekPMPs4hCjBgnbG4uLZaBmaUvJsgxnw7vjH/8GA6BPCw==
X-Received: by 2002:a17:907:9724:b0:a9a:5e3a:641d with SMTP id a640c23a62f3a-a9de61e0cd2mr631691166b.59.1730113013229;
        Mon, 28 Oct 2024 03:56:53 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-009.fbsv.net. [2a03:2880:30ff:9::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f02954esm366893466b.68.2024.10.28.03.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:56:52 -0700 (PDT)
Date: Mon, 28 Oct 2024 03:56:50 -0700
From: Breno Leitao <leitao@debian.org>
To: kernel test robot <lkp@intel.com>,
	Madalin Bucur <madalin.bucur@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:2745:24: sparse:
 sparse: cast to restricted __be32
Message-ID: <20241028-sticky-refined-lionfish-b06c0c@leitao>
References: <202410271721.jiVrriXD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410271721.jiVrriXD-lkp@intel.com>

On Sun, Oct 27, 2024 at 05:36:56PM +0800, kernel test robot wrote:
> Hi Breno,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   850925a8133c73c4a2453c360b2c3beb3bab67c9
> commit: 782fe08e9861d00ce8aca370453dd9ceb9a23d50 soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
> date:   3 months ago
> config: arm-randconfig-r123-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271721.jiVrriXD-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
> reproduce: (https://download.01.org/0day-ci/archive/20241027/202410271721.jiVrriXD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410271721.jiVrriXD-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:2745:24: sparse: sparse: cast to restricted __be32
>    drivers/net/ethernet/freescale/dpaa/dpaa_eth.c: note: in included file (through include/linux/module.h):
>    include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>    drivers/net/ethernet/freescale/dpaa/dpaa_eth.c: note: in included file:
> >> include/soc/fsl/qman.h:245:16: sparse: sparse: cast to restricted __be32
> >> include/soc/fsl/qman.h:245:16: sparse: sparse: cast from restricted __be16

Thanks. The commit above "782fe08e98 ("soc: fsl: qbman: FSL_DPAA depends
on COMPILE_TEST") was created to detect problems like this, since it is
not possible to compile-test dpaa driver. 

Copying Madalin Bucur <madalin.bucur@nxp.com>, who currently maintains
this driver.
