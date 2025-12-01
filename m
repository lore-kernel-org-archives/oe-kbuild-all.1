Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D760530BF4E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592982; cv=none; b=PI5cwOmoIVan5zSibJx+p3UGKdIoX3jL7nCEJZUFNcRzRylDkEO7qP6W0Zq1eXdPMNB7yFSz0HBg7ADip9IH8X1wS2pKASl3nRyoBim3eJ0QJQaUrcTz6PAS9GgZ2Q4nBcznRAb+OqgXwFl+wXtmHRXGv3iJif4/uqZQKBcmcoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592982; c=relaxed/simple;
	bh=svPoRxPS43BPKTLrltC3ak/4gl0ABpNEWI8OrVjwyq0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDdEKsESVOehB55wI+bDMBoV9jNI8XBcIZsLFojlh9AQ8Wm0B33z0x/TYGyUwcVN4JxCZDF4zUUu2+kfmMgsYLmQfcxZVUvJLwtbHWHACjJEwZMazadySupp4XnxhMOCCHGInmLJ6gxeQEkPkHrzKj/cKsiCgDAxUpCqZ3yPrS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iX/Y99tV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iX/Y99tV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477632b0621so25186235e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Dec 2025 04:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764592979; x=1765197779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYt20FSADt9I5kSNlRqEq42Zd+FfZ9PYdPxZ/0RvZNU=;
        b=iX/Y99tVgCpwrPzvvkvKR4eJ0sgL4ovCLc8+DMth02jSccJWP2u8EeWKP4EFW+YolO
         wN4avIzz7wks0HMzCVdqcBs4cM4U2RohbX/VJ480QU6/NkC8gSePwRITCMrqhte/JXdw
         BdrMcmXliPfc4jhShGkmJ+9doQD4owmxVTHFNyevhrUkS3ZZYnBf9VXO3nUD+TXbkzyO
         QCr6hZcR49YLe7gdNn7QDbueO3Hc5CZtAGNHzDeS36UlAiugbBjYXzLAVFBYlm6ySCLP
         /SXrWuAXAOnVv2qZCjQKaoUYS/zbx8Mb9dNJRux4FUmHBa2LWArSal27UD6GsU+I9QwA
         ImUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764592979; x=1765197779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYt20FSADt9I5kSNlRqEq42Zd+FfZ9PYdPxZ/0RvZNU=;
        b=tYRYqmPhCream5wZQrapemgtINqMBg3tgG1tXkvEDFtfcnSTM2Y0KbiAMROicrK6fc
         9vY7qlca/8Ei9I6S3yOKlQ/aWl/LVEJW2dzU9JsBjMpsN4D73KiylDARO7lAkSZR0STx
         jcRiCZreuyqTFRO5SeinLrgLag8qHocL5j0JkSSVQJhPCMvevQ8pSau7UsNOsh3Xbsq1
         9rfEQ8AROwjLEIlWSgjn9Ho9AcEJYWOJydzNGWevVvz06uFzXXehq1iCnHeuYwC1ko8I
         ez3+duCLWcJgN60q1KPhxYB0JRY731vhFVm+QFFOIVZoUCIyAc5Ot2nnDYnFf7n0HnCe
         pOyw==
X-Gm-Message-State: AOJu0Yy+9eH3wdoy3IIbmRQGR8mYPL27o2/CkM/afF0yq1dUHHfKShXP
	eq8YJNXF0um/FbS5TKxYkLSPjMLiMKL4QNn04rmnmhkPOSF7gwUmRSXEJ6aFQw==
X-Gm-Gg: ASbGncvugalCCkAwKpqJm7MyOO57wot/dWrlQwk1R3tIPBl0lPvF0pRO0tyL0tVo0L+
	afxXCIFkAT3yaI+z7HWDWR1Og9qgru932HAj9fW3z5PC3X4/n4AStbI1sQhwVlQ0+0nHjPpsc9m
	vebHEDsULQZE/4fHgFnWxWq3NCyFNi5Z+QBE0to5PB9/Xr/bIt7lMgpXG4FperfqkTqjAMoRKo2
	S6Ao8WgufmaR6aXxMz9WTQDjajG/q/0AeB9+zQFKgKPj1XqI5v5RDPnQyc2pxHZbZnMpIUqCL6m
	+x4eeZS1CmcK/YL/iWaxNke6mXFKmTXyqquB5pvVUWUnUIb9Wz4iDvNzpRx3ppycZawcBdk8jd2
	tjPo27NAF3V2T9OkQSgtfFxtWuCE/Bt3FapUZUmZ2V5uP3bHnh6dNNADyOPXVUCc/VP65t4Zf42
	Zo4vFACBU2+v5RwVBG9aR3Xi5DqwI3bAY+rJNpzoVIk/N9EFO6fgqm
X-Google-Smtp-Source: AGHT+IG85RiTJUWEOGK/7ZFEjOZnrOg9BUCOhLnj1T/rfnqLJrTgVpxAsow5FA0qXUjziRAlEcGDpw==
X-Received: by 2002:a05:600c:1f0f:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-477c1131db6mr366327925e9.30.1764592978713;
        Mon, 01 Dec 2025 04:42:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add608bsm305002035e9.5.2025.12.01.04.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:42:58 -0800 (PST)
Date: Mon, 1 Dec 2025 12:42:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [linux-next:master 12420/13171]
 include/linux/compiler_types.h:602:45: error: call to
 '__compiletime_assert_293' declared with attribute error: min(burstcnt, len
 - count - 1) signedness error
Message-ID: <20251201124256.328f4f35@pumpkin>
In-Reply-To: <202512012040.BkoYgkkr-lkp@intel.com>
References: <202512012040.BkoYgkkr-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Dec 2025 20:18:45 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
> commit: 9ce4f8e56bd2ed2bd473572bbd4c1a7f8863487c [12420/13171] drivers/char/tpm: use min() instead of min_t()
> config: xtensa-randconfig-r123-20251201 (https://download.01.org/0day-ci/archive/20251201/202512012040.BkoYgkkr-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012040.BkoYgkkr-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512012040.BkoYgkkr-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
>    drivers/char/tpm/tpm_tis_core.c: In function 'tpm_tis_send_data':
> >> include/linux/compiler_types.h:602:45: error: call to '__compiletime_assert_293' declared with attribute error: min(burstcnt, len - count - 1) signedness error  
...
>    drivers/char/tpm/tpm_tis_core.c:456:28: note: in expansion of macro 'min'
>      456 |                 burstcnt = min(burstcnt, len - count - 1);

I hate compiler differences.
Usually the:
	if (burstcnt < 0) {
		...
		goto out_err;
	}
a few lines higher is enough to make the statically_true(burstcnt >= 0) pass.

I'm not sure why it doesn't here.

	David
