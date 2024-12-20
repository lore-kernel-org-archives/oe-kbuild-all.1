Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8D1215F6A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 16:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734712261; cv=none; b=h4ws5qVdd3tZr3x1yMR6yG4tCOvqQGyeWYxRhW3qvtgwA+gQHrqys2+BE7PzWPSPcSVK2XUd3TpyJAUI1oDYfTMRGRZ/Qd+ScXTV+oPiLR5E9DZ038Ja5U33+fk+9rc+xx3EHlj1rxfLH7n7NXHNt01Bd7nOFDYjDEkb0t46YPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734712261; c=relaxed/simple;
	bh=/tWzHMh4g9FVVPDXbSszYGrI6uTYCicnCqJpSJCmmhM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TnUyQ9bnYsLb2ydupkI5/F9eqL49rstNO2wkua8CPVMHBz5FSQA8DPkxxQ/QvkCdZri6xW9Wlls2SI62Nny+Ef7a8t1ikQqBdw3ThbFB22TMIxEeQYrEw7Qr6FjQr6j+jv27x2ElpyTu9J2dfjv1Xh8GgIa17p6DwJ/rMODh4ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRkwDFix; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRkwDFix"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so1482509f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 08:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734712258; x=1735317058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ys/Cf5TzonEK4BqNTE0TisMQIDKQfjwPaUSyGPP2aqY=;
        b=RRkwDFixsJQ2fJ4nJGId3Qs2Wx9s+iyuFehQf+HS6rb3IYR9lLsGAChMarHGAP+Z0J
         nLtldbAluXIy4ZTtfNWHx7Edp7HjS55EJgUDfAgxocEbIX6OXB8Jor+TYyXKYJLC+JZB
         OlEUR97zurga4lajXkkLTcuoXzfM+jKlkGGR6Mp5TVXi4AqbSUGgTM3r1cjcSknbs5m3
         YNFsu1wDGmv5PuWS3wrP4KCa38y9wi7yHn6YbqBQhbJS2K49rgN5kyPLndXzoV35l0wX
         oolV9rUFRGgmnnhfNg8A+yF1b5lLtLU/mDd9HAKwpEVW5as2jJLU8cLdgetwPb/obEFD
         gzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734712258; x=1735317058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ys/Cf5TzonEK4BqNTE0TisMQIDKQfjwPaUSyGPP2aqY=;
        b=iC2rDE3fzzYfd8yJuhbvS2+7W4NIIpWoU5KNb8HX6dFeacFxjhHYhxCh/1vdktoBKY
         MSbTYIMXiIFOILysVW43iJKjqbJ8HAFKrSgHwULwSJB/tPpivS8WQTeMi/RnBj2Vz7Jb
         bcC2Ub3QKvdfxKhnGD31Kg97uylTQgPT3HbWbpJmZHxDZlqRhZ64Mol6LxpK+B7MoOf8
         /liilIYBg05wRZ+lP+oMkmJSaG9fsuNmfsYZxhaEDuRmFHRkLDIp/K6Sr4jP10M9nwGS
         BFdUZgRfJosbVEXY3+HzZmWzSK9GYXtoSIPX3yGkErZQ35IIHD3QrwQH0tNZ9maOfED2
         mx/w==
X-Forwarded-Encrypted: i=1; AJvYcCXtf6xeGruD0J303/nMve1K1MbQTu3i4bMDPg1rtEd8QXSY1dBqs2AGKjEcG+o7dDIUpum5TLbLIrLkrsIF@lists.linux.dev
X-Gm-Message-State: AOJu0YyE8n5ty8QPuinbWwOVNzt78JtfOjkqwNACAnyijbQP0UbU0SE9
	Kl+2jZLPgVTlMu0c+aV81ZT4ofDohOcLWBS5RmZQFH86ySRXLBrq
X-Gm-Gg: ASbGncv2fPj1T/FdMxe2eeUuAgDf6Mlu2Hve6uAv/P7HdGou8GlIbTRZdVg4xOFa6oI
	WSZWGcGlVdnGr3gZlqJe77ZiuHIbRInt3EN6ioUWZ+VvvZgwz7YSQXhQZdOBBsgl8I9Fj0yOfEB
	2xkRoxbiFrthzB9IhTMK7crtKx+SdzGcPew6/v2cU8vrkEdjISClU7DbKfySWkMI+N4OJexaAX1
	SsvQKdbhBqItPU3nyuvZpCvPtIAojlBVw437ocyk52gNHZTRyBGnNi1oxswDDWlZElSqUt/Z6Je
	vcLRP+bQVTHu48LrtWLIx44=
X-Google-Smtp-Source: AGHT+IEEww8vXlz80Gut/Cl9tQP1T2MHpQ3Sk0POjZ6qvj24VIMFIW25rpndW/pHoA+dcPxCnxjiig==
X-Received: by 2002:a5d:5f8c:0:b0:385:fa26:f0b5 with SMTP id ffacd0b85a97d-38a22a4c3camr2958336f8f.20.1734712257631;
        Fri, 20 Dec 2024 08:30:57 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8b874asm4384714f8f.109.2024.12.20.08.30.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2024 08:30:57 -0800 (PST)
Date: Fri, 20 Dec 2024 16:30:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, Eddie James <eajames@linux.ibm.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/hwmon/pmbus/ibm-cffps.c:184:60: warning: '%04X'
 directive output may be truncated writing between 4 and 8 bytes into a
 region of size 5
Message-ID: <20241220163056.7bad4962@dsl-u17-10>
In-Reply-To: <b8b9dc2c-cb70-41c5-8606-eb3aa6cdc257@roeck-us.net>
References: <202412202139.tZ2VJL2f-lkp@intel.com>
	<b8b9dc2c-cb70-41c5-8606-eb3aa6cdc257@roeck-us.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Dec 2024 07:21:18 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> On 12/20/24 05:54, kernel test robot wrote:
> > Hi Eddie,
> > 
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   8faabc041a001140564f718dabe37753e88b37fa
> > commit: 2f8a855efe8a6faf962c53af406e5ea4791b3877 pmbus: (ibm-cffps) Add support for version 2 of the PSU
> > date:   5 years ago
> > config: x86_64-randconfig-077-20241209 (https://download.01.org/0day-ci/archive/20241220/202412202139.tZ2VJL2f-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202139.tZ2VJL2f-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202412202139.tZ2VJL2f-lkp@intel.com/
> >   
> 
> We could use %2. 2X and %4.4X to make the compiler happy, but those are false positives.
> rc is known in all cases to not exceed the format size. I don't see the point of changing
> the code just to make the compiler happy.

I doubt they'd make any difference.

>
> >     drivers/hwmon/pmbus/ibm-cffps.c:171:60: warning: '%02X' directive output may be truncated writing between 2 and 8 bytes into a region of size 3 [-Wformat-truncation=]
> >       171 |                                 snprintf(&data[i * 2], 3, "%02X", rc);

The only ways I know are to bound check the value or to use
OPTIMISER_HIDE_VAR() on the length.

	David
