Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C030206F31
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738658680; cv=none; b=Ma2KrNKl72wk/sfeapPxBvUU5DpNzCpP+GpaLRnHUAH2LIDgGWSO01ajogGQcKFq4yzl5MSdklCgDBp4fNz09syH+855Lm+BJZzwSlVrb6xvvuPzV8Jmd7o3yj2xIyi7ljy0LkdD/J9G8Ku7itZPWew1+Ym7Lmlg5TNzcoAz6vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738658680; c=relaxed/simple;
	bh=6kewqzGTUzyCcVE/zCENW2J7lDGyz40n2CCk6+IPqvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uk4qCpX2ABMuwss1LGCXIinTBBawBOy3ZZSLMccWvBB2dzVCJeeRIN6GskRyrFq0CAOIVPyv3O1/P/e+6Kpdh3y0aejtstwlcJ6ZawNg13erhb7BARI0VIVd32N8tTKVwEICFlzSQBjlkp19dsnrrXfnoPe7HZwBKMfWnsonO/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=R2mMs84K; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="R2mMs84K"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43675b1155bso61333125e9.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Feb 2025 00:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738658675; x=1739263475; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YostcXHrEB+tzghnDl6XVsv+6b3LxDjt3PdMmtnYvOk=;
        b=R2mMs84Kjg5RHHTXyewOeqKfdmZHkHSeyt4EmoZ6kd0cwKwTWIbOLqZhGd6IfHA0fV
         4OgH4DYSFww9XbdTWh01crLuVI26TUZUzR5/3ifjqf2LIYoTDygThL9817H/5xyz3qzr
         ti5nLpuIqBQnZVWpPdTRscDnlenlCbsTJvWjJuAElkq2nc0JrwBIbZ8UH9A9HIp6wvsT
         t1JBEr9JIeOWYiqHNzoykh1g5yP4ZkrtfC/SDAkaZBbOzBJIQBWDAB2VJEGEau0e2VOZ
         Qlf7lUcHJhw1O2/v6IHMT6Kb/3ilvpSg/OyEXo04ydPqvWuKy7LB1DyKhUdh1wCoK+ex
         X/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738658675; x=1739263475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YostcXHrEB+tzghnDl6XVsv+6b3LxDjt3PdMmtnYvOk=;
        b=CtyPvlbdZy1a1pHlIEuB02wzWjk9nti2VjL8N8U3J3PLXOk5Bckhswcvvk575mrBVr
         DAoHshaB5ZB7MGaUE2mBTjYcdEdPoTGXb3E0HthXAhcvxQudeYibcdL2KxBWlczSLJSo
         56faQpF30BDe7b3vJPY+bd3Jy4UEE84wEESMsa43N1U8bX02LsA8/xyOiflWah8Utnrb
         kSGgyBgsjDaS2eAH2muttEuBfq3UiYulUZa2YF3AJWujJ3IdWGfMKKkvgJT+107/UbAs
         s6xLfe/hYz1oXtwyo6DdX6M2EV9wyiHC04abpjPTNsWEitajc0FBrkpaNXzgPQJ0iZua
         UwFg==
X-Gm-Message-State: AOJu0YyF8O4xyTwwAsOqUhs2BbBDgx3h/qcV0LAhuNKtoXj4wGXez3qx
	bwk8RWXPgVePn9WzNTTNJiKhXm3S692vJlG1wSRIleWVMcdVp3IuUxEus5aJgGA=
X-Gm-Gg: ASbGncsLq3ayUSoz24s71mC8JR8/5OJnbGhmcm4yBmmiQUyOtXoq4xG/g+xSfeNdGGO
	H7A2R8to26nV0RnRwVHGb56Xy1Ei/QMKz3jpL8mJ8YB33gPzruaRSrO7lVIYpDsMjTRvnaAXR3K
	bI6NxKqkLqeXt0lTzRdq+BpeWy5IwtOGNuVB357fTH6xTXHNrQVMJUZGvxuPyc0PlC884Fy+nnz
	hdzjIKNMvT8ymhfqrX9swwv9YEWxWEiHvsxOd4vf9XZG1P+0/Kql5dZCD/tyjg8S+XWR7Ldk1Wt
	l/X2oeKA3wOfC89zazDlCwAqTK5Zv4bLt/XIlm+JqN7Nqk4j12VbyYUYSBzN
X-Google-Smtp-Source: AGHT+IFxiXrzQIXGjrQ3cXQBxZSKprg/Tf86WhWlyCEDYsvUS+jelCvF+HrJ32Uw4JnHoTjwXOSkHQ==
X-Received: by 2002:a05:600c:3501:b0:434:a7e3:db5c with SMTP id 5b1f17b1804b1-438e2446708mr219703505e9.11.1738658674756;
        Tue, 04 Feb 2025 00:44:34 -0800 (PST)
Received: from dfj (host-95-244-234-244.retail.telecomitalia.it. [95.244.234.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc27125sm215250395e9.15.2025.02.04.00.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:44:32 -0800 (PST)
Date: Tue, 4 Feb 2025 09:43:17 +0100
From: Angelo Dureghello <adureghello@baylibre.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Nuno Sa <nuno.sa@analog.com>
Subject: Re: [jic23-iio:testing 23/47] drivers/iio/dac/adi-axi-dac.c:731
 axi_dac_bus_set_io_mode() warn: always true condition '(mode >= 0) =>
 (0-u32max >= 0)'
Message-ID: <rhmmbt3yqfqhodivu2smuu4g2i77sqyzr3jjjxtvjsny7a6jgd@64bong6elaul>
References: <202502040758.DJqHqhLO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502040758.DJqHqhLO-lkp@intel.com>

Hi Jonathan,

On 04.02.2025 07:23, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   315198c0a370da031f5c3d504b99f771a0c545ab
> commit: 493122c53af1915b4b5b5f47a8c446973ebff052 [23/47] iio: dac: adi-axi-dac: add bus mode setup
> config: m68k-randconfig-r071-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040758.DJqHqhLO-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502040758.DJqHqhLO-lkp@intel.com/
> 
> smatch warnings:
> drivers/iio/dac/adi-axi-dac.c:731 axi_dac_bus_set_io_mode() warn: always true condition '(mode >= 0) => (0-u32max >= 0)'
> 
> vim +731 drivers/iio/dac/adi-axi-dac.c
> 
>    724	
>    725	static int axi_dac_bus_set_io_mode(struct iio_backend *back,
>    726					   enum ad3552r_io_mode mode)
>    727	{
>    728		struct axi_dac_state *st = iio_backend_get_priv(back);
>    729		int ival, ret;
>    730	
>  > 731		if (!(mode >= AD3552R_IO_MODE_SPI && mode <= AD3552R_IO_MODE_QSPI))
>    732

not clear to me the reason of this warning, maybe because mode is an enum ?
Should i take any action ?

			return -EINVAL;
>    733	
>    734		guard(mutex)(&st->lock);
>    735	
>    736		ret = regmap_update_bits(st->regmap, AXI_DAC_CUSTOM_CTRL_REG,
>    737				AXI_DAC_CUSTOM_CTRL_MULTI_IO_MODE,
>    738				FIELD_PREP(AXI_DAC_CUSTOM_CTRL_MULTI_IO_MODE, mode));
>    739		if (ret)
>    740			return ret;
>    741	
>    742		return regmap_read_poll_timeout(st->regmap, AXI_DAC_UI_STATUS_REG, ival,
>    743				FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, ival) == 0, 10,
>    744				100 * KILO);
>    745	}
>    746	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks,
regards,
angelo
