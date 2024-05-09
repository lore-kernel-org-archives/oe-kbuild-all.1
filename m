Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B877D09D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715253307; cv=none; b=ENIPmco0jPx0yq/secMKT23StUr5TM5MPX0Fs6S+TIAUzC/jenEW6cnjaNkRXfTddGCCkkWW0iaHuzSzJBV/W/8cv5hR9sV+S3IK/XgaTGBX3LWQQZ6s0F9Sl7509qtv1ZCgCHzmfDN0uwMPq2PTBWno8MtuzlFkGSVly4gm/Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715253307; c=relaxed/simple;
	bh=vXsFMRaxSZwNwrtFNURLPwY0cD8dWAmv9PX27I1oIPQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNzF3x0uc3SrO71hm3geg2DDWlbNibll49+Cg4BP0xi34BzhENvI9FeKyCYa5uk3IebB3CqgpeUaKgmdMZH/gWq8RPxvwlnmS93VyO4w8QYlnHvbQvvDTDx0tdA0KbVofzuSdqcYBWT1ioN+i7LCsn6n9MUBcJ7ho6rASMFHYN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egCc1kp0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egCc1kp0"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-34e0d8b737eso1078792f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 May 2024 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715253304; x=1715858104; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IJB+OgvYLYogQhbVxq5DLy1Lyjt+NholKOBiVxc0zRI=;
        b=egCc1kp0OQL6vbHr9i5iPGHD//SRbfc2LyrYu0EJg9oQ51h0iO8IYcZL8MH+5z3Lk8
         6RZtC/GPQ9Kcpy6IRtzmcJk+YkdtoJ/qqaxeygGgr5cAFw2eEsjhlUmT+x6M7vCxCCk8
         Ufm3BMR1HVYgHPRNFsy2l/fnsrZf9zTH/VTWdTEB8tUAzToaJNNFVsmEoUot5rJe2xdY
         JmVn+I4nvx2obSBem4hcjVUoPhzmzmwbRxEre2HLPS5DXDJv//Vk+XqehZBo9ddnUwcJ
         Vf3s4gh6s4bzrixzt8zA59ehCFjs8gCXKsAPgr/pxTJRGdR35RdFBIGuk+lMu4/lDdiX
         Q20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715253304; x=1715858104;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJB+OgvYLYogQhbVxq5DLy1Lyjt+NholKOBiVxc0zRI=;
        b=ECyQ79SEwtasoA87B6/WhkAhY02Ot7ubO5wyRfoNijtJF6eH7bASOvKcPINYdoCXC+
         bgntRH34bEEJ9K5eaArXg9cwP3174Ew6TCShpxyhMjzVGmqL8JcrcA1MWCA7IMgZHzvs
         PdQ4BjvSbAqgTXonbDM0jpappcOxi/9W6vN8A9EXzQSOkI1CwIf44bME4C5EQWkDBPs7
         GkkGy+Qtir5PHk5RksJa5LGIHwJx9tXG2J3hmwtfSeKYT7JQKJfyGAqDE31XaxGDM2LL
         tJpKCw6QInlY4Gs61KUZ5StXft0DFnKc/1Tuw4+iFBbpGnR4RN2k/N8pW46OMfzbAv6w
         sXag==
X-Forwarded-Encrypted: i=1; AJvYcCWzC9lg/oOCm3fOXhMQNiIhqgbDkBwCz/ayGIkpLQkIFpEOtK7eyezMbbiFcVu1kSciTN25EZJy1cBJu8pYP3tACg8PsoVPhwPXn3VZBw==
X-Gm-Message-State: AOJu0YyWHdJjd1HG1+LekzMFh3ZGRSr6r5RQe2LQBE/R065DOo/dEieQ
	JKVO2ZBN8YlBETFQJRr2BnP4PT5bDAqWOqldQ2V59/g0LD3b4ioD
X-Google-Smtp-Source: AGHT+IHHCRkykSFXuu6ipQb2TuDdXJTI3AAL4s9XQ0bI3eoTF9YXQdmpGXJ2MLVDIqVGbi11gFDoDg==
X-Received: by 2002:adf:fe8a:0:b0:34c:fd92:3359 with SMTP id ffacd0b85a97d-350185d57e7mr2016967f8f.21.1715253303584;
        Thu, 09 May 2024 04:15:03 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacfd3sm1426846f8f.84.2024.05.09.04.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 04:15:03 -0700 (PDT)
Message-ID: <663cb037.5d0a0220.41af4.3328@mx.google.com>
X-Google-Original-Message-ID: <ZjywNBzF0EwuS4MM@Ansuel-XPS.>
Date: Thu, 9 May 2024 13:15:00 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/5] mips: bmips: rework and cache CBR addr handling
References: <20240503212139.5811-3-ansuelsmth@gmail.com>
 <202405090546.iqx9FAqu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405090546.iqx9FAqu-lkp@intel.com>

On Thu, May 09, 2024 at 07:13:16AM +0800, kernel test robot wrote:
> Hi Christian,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on linus/master v6.9-rc7 next-20240508]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/mips-bmips-BCM6358-make-sure-CBR-is-correctly-set/20240504-052513
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20240503212139.5811-3-ansuelsmth%40gmail.com
> patch subject: [PATCH v2 2/5] mips: bmips: rework and cache CBR addr handling
> config: mips-bcm63xx_defconfig (https://download.01.org/0day-ci/archive/20240509/202405090546.iqx9FAqu-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405090546.iqx9FAqu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405090546.iqx9FAqu-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mips-linux-ld: arch/mips/kernel/smp-bmips.o: in function `bmips_ebase_setup':
> >> smp-bmips.c:(.text+0x114): undefined reference to `bmips_cbr_addr'
> >> mips-linux-ld: smp-bmips.c:(.text+0x118): undefined reference to `bmips_cbr_addr'
>    mips-linux-ld: arch/mips/kernel/smp-bmips.o: in function `bmips_cpu_setup':
>    smp-bmips.c:(.text+0x1a4): undefined reference to `bmips_cbr_addr'
>    mips-linux-ld: smp-bmips.c:(.text+0x1b4): undefined reference to `bmips_cbr_addr'
>

This is caused by legacy brcm47xx and brcm63xx target. v4 will have this
fixed (and I will drop the ACK since I moved code around)

-- 
	Ansuel
