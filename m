Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EBD18A6C5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 14:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767342; cv=none; b=X2lu1Q5WzReIFtYKuxnJDwkkm9Jxab5Emy1sGOtpZ0EDH41SVC8zCYohD4rz3aj+t0WcDirQhEJEgwCJqo61Kze3pqIJaYc2n8e171UhIWmyefF1zl7Ss0KU8gVZgdKFTQWYZ7Q6hQv8bEE2/SoGifr/+TYTaODjUQFsyTWgDNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767342; c=relaxed/simple;
	bh=JVDlAFSieLCBa2p2f9GiLK6BCDksJe1CgdJCp2hWT+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIHkECZC9hbGRE5kyrd8WNz3bjPRx8Ss3FK70r+zMPwoPIYL9Kd5KCfyk0Bt7KTapSKmQwDFIvA0u+hYjL556Q6ds/cTukEY7CHM1j+pN/Er7xGJtG0hjA83MJq7s3ubFtd3yfbKDXmLy8tI6bpFLeGb4514gUoyC39E61IBp+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSR6Rmn3; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSR6Rmn3"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e41e18137bso23114026d6.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Feb 2025 06:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738767339; x=1739372139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TfE1rJBPe7CkBiAeancRxStCuAKdJJY13QvaUg0FeG8=;
        b=iSR6Rmn3hy+F8SqysGeQYBAmDFp72i97QQg1jc8qqing8dJamsFgk4Zz5j/uTY8hKD
         4J1+KS8KIjEAkD+8aG3rIhXZTA8YTCJuujPzh+MYE8NUfDRAfRCxa97wzg1UzUgbn0qX
         FHUa9lvNh/M63A8/wkufR7fZiMguURe66oLIQCGU8jlpO16afH3H/ViUGBOCzMtCORN4
         UqErRc40IRU+ovae9iNxUY6vUGu0PUrY1UbN1/Yjij4NyGRZ3a2UKgzqjtQKTIp995B4
         pRhl/br7nnBbq5jgjoPREcszj2e0JY6489MsuRctaQnGHIlvdRtUIYxbi0X1EEwHLlV+
         vnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738767339; x=1739372139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfE1rJBPe7CkBiAeancRxStCuAKdJJY13QvaUg0FeG8=;
        b=sD0e0HItDTaQounmWhqXjPYc0f9zLQ5jxiH3QQ9wUKR5uOllddttJ9uFtwRU75xV1v
         iPvwGgen54X4L7PF+mEM+TZKLzXqDLgnSd/QFkAmu+sndDqYnXBcoxPNHqheGOUCQuiS
         GzvDlAu2QY0OwiiZrvRqMN/Hw1qpQhmG1oprZm+jELLIQgJV563qSPy9hOlSQMPZ2dif
         YZ9coFapkgsLufLdWEvGnBojMT5mYiDWm9SLWUvX3EgQIUsASkWoyDTzKi+NNbF3H4ng
         0B3oOBisqlF0BRjGMLrRM8RwGh+Q3IWNzSav0ZKEsO3EAHj2mQUMUZK0unbkpz7pG4NZ
         C2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCX8KkC4j5IlQSwRJ8W8BvwIAJBOVycqcu5yUr/mdVWksz6Ndkpmsfi8545mwbnkqoQWzGJBL17ffYR/gjXQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxkWvurlh7+5Tkrg6gvlkyGSbh6LzpqTLX9GVzslEvrn3YRHq45
	sdMLLkn6v6U7pO3qsviS8/7wxbsL+N9D5ADu7VQmKA+6YYk0BbkV
X-Gm-Gg: ASbGncvpfpa2Bk0+Hkan/iN64VH+a84RuVMI553eiBe4eYB5IcJg/V+48VInv2Bj24V
	FI3nxSs+Bl9HR++ix+lsz1C0fCATAoVYkwwPgB/3rcILbdAHCwps03O/EsT0TVrKFidMU+5c7Wr
	9kP+aFQxGH7nPsr/xsH/y3aKwT5hrWxsH22KXLapH+4IiaoKmWnUY/eAbin/6zD/dUD4elyq/Pu
	87AQJITUrDlQFSaxDK66LdoLBKeJarqe0vf/vDwtyKwL1YY9Ihx/TvUWZ9KetgCy6SyCyPgFKs1
	QwZwZ7NhTZHczHg4BQPOj2Nn9sXawU0ycmk+lUkYLUYmH/+5ZBg=
X-Google-Smtp-Source: AGHT+IF3XZ/IV9J6BC0V47ejems8aEmi8jDYR0YTl2CtiheoXWDbmV4/l2AsPvc7xCrJOicSokEI8Q==
X-Received: by 2002:a05:6214:234f:b0:6e4:2b39:3612 with SMTP id 6a1803df08f44-6e42fb22760mr47783196d6.4.1738767339197;
        Wed, 05 Feb 2025 06:55:39 -0800 (PST)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e4221b7088sm20913446d6.85.2025.02.05.06.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:55:38 -0800 (PST)
Date: Wed, 5 Feb 2025 09:55:37 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Robert Winkler <rwinkler@antmicro.com>, oe-kbuild-all@lists.linux.dev,
	geert@linux-m68k.org
Subject: Re: [litex-hub:litex-rebase 11/15] drivers/fpga/litex-fpga.c:114:17:
 sparse: sparse: cast to restricted __be32
Message-ID: <Z6N76QX8uLeZQYIK@glsmbp.wifi.local.cmu.edu>
References: <202502051703.2QcrfJ0B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502051703.2QcrfJ0B-lkp@intel.com>
X-Clacks-Overhead: GNU Terry Pratchett

On Wed, Feb 05, 2025 at 06:06:11PM +0800, kernel test robot wrote:
> tree:   https://github.com/litex-hub/linux litex-rebase
> head:   a1cd33eb9593685b8b0716cbecf1a817b6410ca2
> commit: 8e7a6c0a5ea5b945506ef310544efdd7c64bb3ae [11/15] LiteX: driver for ICAPBitstream fpga manager
> config: arm-randconfig-r113-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051703.2QcrfJ0B-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250205/202502051703.2QcrfJ0B-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502051703.2QcrfJ0B-lkp@intel.com/

Thanks for the report!

> sparse warnings: (new ones prefixed by >>)
> >> drivers/fpga/litex-fpga.c:114:17: sparse: sparse: cast to restricted __be32
> 
> vim +114 drivers/fpga/litex-fpga.c
> 
>     89	
>     90	static int litex_fpga_write(struct fpga_manager *mgr,
>     91				    const char *buf, size_t count)
>     92	{
>     93		const struct litex_fpga *fpga_s = (const struct litex_fpga *) mgr->priv;
>     94		uint32_t *buf32;

changed this to s/uint32_t/__be32/

>     95		int i, count32;
>     96	
>     97		/* Bitstream should consist of 32bit words*/
>     98		if (!bit_is_aligned((uint8_t *) buf, count)) {
>     99			dev_err(&mgr->dev, "Invalid bitstream alignment\n");
>    100			return -EINVAL;
>    101		}
>    102	
>    103		/* Correct bitstream contains sync word */
>    104		if (!bit_has_sync((uint8_t *) buf, count)) {
>    105			dev_err(&mgr->dev, "Bitstream has no sync word\n");
>    106			return -EINVAL;
>    107		}
>    108	
>    109		buf32 = (uint32_t *) buf;

also changed this to s/uint32_t/__be32/

Geert: I left this as a separate "fixup" patch (for now); I'll merge
it into the original "LiteX: driver for ICAPBitstream fpga manager"
once we convince ourselves it was the right thing to do (I am not set
up to test this patch at the moment).

Thanks,
--Gabriel

>    110		count32 = count / BITSTREAM_INSTR_SIZE;
>    111		for (i = 0; i < count32; ++i) {
>    112			while (!READ_SINK_READY(fpga_s->membase))
>    113				;
>  > 114			WRITE_SINK_DATA(fpga_s->membase, be32_to_cpu(buf32[i]));
>    115		}
>    116	
>    117		return 0;
>    118	}
>    119	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
