Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9788B156675
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 09:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719914146; cv=none; b=beol4Cp2C1iUfQR6b5cMrk/hJ+8hVevvYczmUhb60hsmDvCKLQ8IOPqUcPwYzydo66cWixIw30WihpHg6S/dno6GsVVK3x/uVLa0Ym02tq0Marrhi351UMIuYgYKkFnWrFzg3Zq+r75/CI6CkS/8lBayUrSKM2KtHDeIwwRrHxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719914146; c=relaxed/simple;
	bh=MtYqxGVsiucXKQDSYUlWauuhbg/pDes1bRUtDedyeQk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tldoACJRwmbNqWwh0bsP3Uqj9NpE4CxRiIQxXziPVZn7Ed3WpI5qYveMXE0+tBvhTKoskly7Ay0YisVCqDq1tP7FBFo3hUM4Iw8ZW31yed++i6RONN58OiakkguHFa/SeXkJFO+Z8WTo6u7nO6j/QkTS2ZCyBYsFcvl7n2uOPxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=d5I5JA81; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="d5I5JA81"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6fe7a0cb58so209146466b.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Jul 2024 02:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719914143; x=1720518943; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h7lKw+krOjTRGYIf5SOXym+J0JFKwzz6LVW8Ps6ttw4=;
        b=d5I5JA81mlTCvUbIQhonhStlL58hjJr6SMSeZp8MhfGBi7OmtwCmi6HAHXLeDHefoI
         DcA4ygaBqQL5UjYLWIc0T4TvuPZNaEbnEFKULjtlQtqIaOWaNT/IUwW8lMTSDmNirZac
         bWc/+FHwqEGMOix7deaE/ArIubmGKTdyMy+VtenIFGVGglwOvFGgIQkrPidZVL723Ak2
         MrxrLPFMYiOzs1YnENzR/cUNcmovtkWtWoCvkj9riN5UVZfYdfqavxCNDOZ5SY48cGto
         lrCsdfA3hYMDtbldnUVxe9ziCLhWws2vKYHzTH1gSkqbkM2YwuGoeA1w29/A7s71whsA
         06kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719914143; x=1720518943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7lKw+krOjTRGYIf5SOXym+J0JFKwzz6LVW8Ps6ttw4=;
        b=hvuUoJPF2tKf3x1p9vYizoPTHhJTqbth1v+7bIXrMjT/HBG7MDHVw+xuHE8Snft57m
         I6FKkH/0FO8w8BDpAVJorIcOBhVTj9U6tF+wRcAvo+Oo/+7qvQ2Sn7Up2GX1CZMTV6rQ
         M3hxyCSwIB43y8Gyx1h/Txb0QqJmPUwdSZZPxxCkvYgaqZvF/4Rp1wh5AGFz1LA9aivw
         ieae51fWkV945OfJmu7/VupNEPzIePve6okO7bT27Pjt+6APnxY0RF1hmhk3oMQVF86z
         h0Pe1eKxT1UsumZND9Pw+8a9lLd1Urv4PNoDa7KqG2mTwCupjMTPvSy4rAgZg/OAC8eV
         HubA==
X-Forwarded-Encrypted: i=1; AJvYcCU046Nf8RVbidmqKtfPW8uIXTLNoZBQvcQ0H5J80YqX3wtfBzP26Ez4tvNfL9ktGEwqt3MP+voKLsTRQMAHJEjH5x2UWAjFYLVb9SZY1A==
X-Gm-Message-State: AOJu0YyxxBBdBl4vINYOcdsbd4aK8kQu/UtSEPBvr+SpEljFmG3cFeq6
	7NwfAlqQ2t7NPjzvj44/8P3ZfdNfwyNDz7VeCPTGUr9TddeZhOUVK2lb0iDMshM=
X-Google-Smtp-Source: AGHT+IG7nNHw9EPFKI8kGvKxgPuay6SC8NTsNk5lC+URj+fmaR+Cr212qir31uzIDTloIiPvg69mUw==
X-Received: by 2002:a05:6402:1913:b0:587:2dd1:4b6c with SMTP id 4fb4d7f45d1cf-587a0822bdemr7647851a12.30.1719914142710;
        Tue, 02 Jul 2024 02:55:42 -0700 (PDT)
Received: from localhost (host-82-61-26-208.retail.telecomitalia.it. [82.61.26.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324ff85sm5481652a12.29.2024.07.02.02.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 02:55:42 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 2 Jul 2024 11:55:56 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: kernel test robot <lkp@intel.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [linux-next:master 3392/8232]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb:
 /soc@107c000000/timer@7c003000: failed to match any schema with compatible:
 ['brcm,bcm2835-system-timer']
Message-ID: <ZoPOrBdevxVrrZfW@apocalypse>
References: <202406260927.CS1A5Ugr-lkp@intel.com>
 <bfc60a7e-54d2-48a6-a288-4fe76d66507a@gmx.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfc60a7e-54d2-48a6-a288-4fe76d66507a@gmx.net>

Hi stefan,

On 16:53 Wed 26 Jun     , Stefan Wahren wrote:
> Am 26.06.24 um 04:02 schrieb kernel test robot:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
> > commit: cbda7c3ffe6d78933ee8c2d5e71de60ff4f4847b [3392/8232] arm64: dts: broadcom: Add minimal support for Raspberry Pi 5
> > config: arm64-randconfig-051-20240626 (https://download.01.org/0day-ci/archive/20240626/202406260927.CS1A5Ugr-lkp@intel.com/config)
> > compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> > dtschema version: 2024.6.dev1+g833054f
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260927.CS1A5Ugr-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406260927.CS1A5Ugr-lkp@intel.com/
> > 
> > dtcheck warnings: (new ones prefixed by >>)
> >     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /: failed to match any schema with compatible: ['raspberrypi,5-model-b', 'brcm,bcm2712']
> >     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /: failed to match any schema with compatible: ['raspberrypi,5-model-b', 'brcm,bcm2712']

Ack, will take a look asap.

> >     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/mmc@fff000: failed to match any schema with compatible: ['brcm,bcm2712-sdhci', 'brcm,sdhci-brcmstb']
> I think the last one can be ignored, because the relevant dt-bindings
> change is in Ulf Hansson's tree.

Ok.

> > > > arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/timer@7c003000: failed to match any schema with compatible: ['brcm,bcm2835-system-timer']
> > > > arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/local-intc@7cd00000: failed to match any schema with compatible: ['brcm,bcm2836-l1-intc']
> > > > 
> I can take care of these binding conversions. But don't expect fast
> results during the summertime.

Really appreciated, many thanks.

Best regards,
Andrea

> 
> Best regards
