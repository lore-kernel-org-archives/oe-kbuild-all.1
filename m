Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D742D42AA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776085277; cv=none; b=Zq2fLM8CTE9ymApEIUs5zCvxDSRq9zTzGiEzKD+IfpL+vWS3+pZ+mSkGVsV02Al/GnXg4ZQtB+O6kULtbLx/FVrJQ6ufirzGgS20RjbKhdcCLMOquPkvIhZlxe9WSuFVO2K6TuOoNbDicG6bEtt/xvVM3y8Y8nNLwSEsFdkLLUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776085277; c=relaxed/simple;
	bh=cDZOvcqUwcRizrQYpiX8mJ2AVjBJweZuFlXyAgxKqLo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CR1yej07F3XYU0QXKZ/HHX0+FYW6f4sUkYqn/E486vN6wYD5jhzrFFCs07kFJhe4ykX6YBzWs00ZgXgbCDxalEr/hl+IjiHWhlH/DcERNooqi6iKLmmwkhxbNDhqjzeuYjo6tW/zOdaBnjoaCyGe06z5lvqsv1ByQIzx3/sbPrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppHAexnY; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppHAexnY"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d03db7f87so2722773f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 06:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776085274; x=1776690074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0h56iWNjOtlXX0x2H+2CBPpJUzlrkNXbnZg4wKPy9Q=;
        b=ppHAexnYk+u1P3rdd6IT/oqAaQfH+/1ry2kwInfULhaIrf/ouOsvW/DJSLW2f93v7Y
         24Pd6bSTvZ2cXo3oVvR2v6tq6JTAqoUJCYHzi3Sndo+wdEhUNnFUwpZgE6+PjeOfVdrv
         BMQ+OSAaiQFROw71jVWasFmXKeRKIxoSOYsSqG9uxO9p8O+yWsLupBp/JusmRsiN3U4U
         e9K4ne5U78Mr8l4wqo4Jmy0qGj2xwxquDDRoegqMRNs8XDk/MtE6QWJdw7lUFuQdHqCf
         kBh99oFE/QLozCyj8nbGF9/Ytq83ssgVhQfkgONnx48BhhgqCm2GcjUvkg+yfziw+YZ2
         deEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776085274; x=1776690074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c0h56iWNjOtlXX0x2H+2CBPpJUzlrkNXbnZg4wKPy9Q=;
        b=sgOw298QVPGspeKWZhbGXPlDVAx+PO1gzNrGcGsYOJhCKx772Dhw7Pv8Bol+0fBUUc
         t25byX2cM44qv2HJ3ThkzHWOlbEA+XFrXttY4uexPUGjP/YsXZmnTNnlilNsZC3V9vmP
         Fm+HcXiTMgP35VTWipWCdvN18KDtESkDC1lQcySuYPv+WGMx7t64Tv7PY1C24IbWrANc
         yL5CwPXz/2Dbk05VyT3JhGa8qie6C+Qm1QtjHKpjQRmte7hBZafMp2rdS8t6Ty9a5UuU
         kQpspTMCDPoZQjv1MTdmJm8NBhtVvipMWhbJroubKXouilJ+Abxw0q+eWsSQa0aTXcGD
         WofQ==
X-Forwarded-Encrypted: i=1; AFNElJ/g5qYT9SG3Vzd8N/zDM2Rn+nTddbGEth+s+RcuQA9wZwyQgaAGdGKAabcDIA0jk9XKbXIWIDe+Dundz3kq@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/fEE5UaUxbhGX3RpgwnDz6UvNO3ZN/S+jn17lzFeK/3fpt7ka
	tZqwDTpZOh+X0t6K0LVHAdvQUcDfDbMUW6BGTlgspl2YhXqi1cFZI5+K
X-Gm-Gg: AeBDies+mfGgjoMi38raGJ8vYALtDxfljezEQ2gETXcF86BXvER33qJvTRWa4+4vAXz
	yaodhVmf6xqXW2NBVOCzvMWvcdla7Iv8kfbGFHxnQCZCE5LJN8xDL4lMFjAK2Ir+h5e1gqo6out
	Xom3r3M9AGZ4MGXUUZyR3DXoVK/wWCOiLwtBOO3ze+u/VIczzSroy2TvP+VHegpbQ78raYF3TmF
	xIIE4wRH6kjc9DsZKG/XGBP7Wy+lddBp1fV2GAqXi+pOoBp7fW4SrUkCBw4lyHsFaF18wovqhyd
	99ntV7ndaN/Fw9e/3ksyRloS5og1snYKJqLns+t3WRtJOChITKnH2LUeQYSsrMBOLrb/t59vNcU
	RXv8aMKs4clrn7O4qdstkUozMR2HnECMi2vhLI7kd2AjMqYL1cPr9z02lQ9C25HyAZl9eGYUkCv
	epjUCNOi77qYsKDQFP556kix1msPg35AvlBjx2lMMMaNAp+wRWbrCV+uad1jRQX+qt
X-Received: by 2002:a05:6000:200f:b0:43d:2f94:3b40 with SMTP id ffacd0b85a97d-43d64255019mr19079892f8f.6.1776085273230;
        Mon, 13 Apr 2026 06:01:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d76eeb2d1sm13081378f8f.22.2026.04.13.06.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 06:01:11 -0700 (PDT)
Date: Mon, 13 Apr 2026 14:01:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Ping-Ke Shih"
 <pkshih@realtek.com>, "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>,
 "kernel test robot" <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
 <oe-kbuild-all@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: include/linux/build_bug.h:78:41: error: static assertion
 failed: "sizeof(struct rtw8814a_efuse) == 512"
Message-ID: <20260413140109.2b20de7c@pumpkin>
In-Reply-To: <6b6310b8-2b0d-4390-992e-5ccd81cef2e0@app.fastmail.com>
References: <202604101721.fsv5XmCX-lkp@intel.com>
	<2fb2a553-3e67-497e-b964-7fa5f940e8a1@gmail.com>
	<1e02bd10a68747f4a342caedde76ef04@realtek.com>
	<CAMuHMdWW=CFtTKG7ZqsULvo4hpOWh8miBZPemR6L2n1qCNvTWg@mail.gmail.com>
	<c09417ea7d534e2c812d470bd166fa3a@realtek.com>
	<CAMuHMdVWW1SOq_=FUZfqLyYKEgwVW_k+FywdYCu5j6Rnrv_GXg@mail.gmail.com>
	<6b6310b8-2b0d-4390-992e-5ccd81cef2e0@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Apr 2026 11:30:25 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Mon, Apr 13, 2026, at 11:15, Geert Uytterhoeven wrote:
> > On Mon, 13 Apr 2026 at 02:48, Ping-Ke Shih <pkshih@realtek.com> wrote:  
> >> > On Fri, 10 Apr 2026 at 14:15, Ping-Ke Shih <pkshih@realtek.com> wrote:
> >> > How can that make a difference?
> >> > Both rtw8814au_efuse and rtw8814ae_efuse contain just (the same number
> >> > of) bytes, so __packed on the union should not make any difference?
> >> > Moreover, rtw8814au_efuse and rtw8814ae_efuse are already tagged with
> >> > __packed, which should also not make any difference.  Someone's been
> >> > sprinkling too many __packed all over the place?  
> >>
> >> I have similar thought as yours, but arm-linux-gnueabi-gcc compiler seems
> >> have special treatment with union. For this case, without __packed
> >> the offset of followed field res5 will become 0xe0.  
> >
> > Hmm, I can confirm the original issue, and that adding __packed does
> > have an impact (it reduces the size of rtw8814a_efuse from 522 to 520),
> > but the actual size is still wrong (should be 512).
> >
> > drivers/net/wireless/realtek/rtw88/rtw88xxa.h has a similar issue, but
> > adding __packed does not make a difference there.
> >
> > Removing the __packed from struct rtw8814au_efuse increases its size
> > from 14 to 16 bytes.  Looks like that ABI pads every structure to a
> > multiple of 4 bytes?  
> 
> Correct, that is a unique property of the ARM "OABI" legacy ABI,
> triggered by this defconfig line:
> 
> # CONFIG_AEABI is not set
> 
> Nobody should be using ARM OABI any more, and I think we should
> remove it from the kernel once support for the StrongARM
> CPU gets removed (I have patches for that), as those CPUs were
> the last ones that regularly used OABI.

That would definitely save all the annoyance of the otherwise
pointless __packed.
(I've seen it crop up before, but wasn't sure which architecture it was.)
Doesn't OABI also have 32bit bool?

> Annotating the union as '__packed' is the correct fix for
> the theoretical users of OABI, and does nothing on other
> supported targets in Linux.

The other option is to ensure the specific drivers aren't ever compiled
for !CONFIG_AEABI.
Then it'll all get tidied up when you remove it.

I read that the patches to remove 486 support have been merged.
I'm sure it would have made sense to drop everything before P-Pro
so that cmov can be used.

	David

> 
>        Arnd
> 

