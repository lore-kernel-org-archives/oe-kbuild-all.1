Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C44D31F9BC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776099770; cv=none; b=RydLOrU0H+BS9Aq6u/wn4k79ZSFBfK1DFMkUqCa8w5+kcCeD2m+0gBhD9FVUZoa5wtCzoF9R7yE+qU4QsS1ujk9b+01VFRzG3geu4x1T4S2OZe2ThwOklI7bl2cJboELxDkHeU1boNxW0ELSVQbcDoQWt+pBgz6WrXPbVEOt1sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776099770; c=relaxed/simple;
	bh=SHLi1RWLFOjbPn4cZZRncC3SjUtxbS0FbG6kvSyyGew=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M20s/7g3cNSs3s0xnJS8i2YAv/3YmLg/gEYGsDLlzjUEQUJTobl8/HucNqazpiDra4lnYE8fsexcu//m8SiWdFarGlheoPu0ntmbpiHK92828pjGXSQFEfh0nuQfjuVYBKGJGBrFUAbpKjI1AsPt3Av2p9zPDv3aYj05ZDNOdMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gmj9Nt9t; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gmj9Nt9t"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7213b6ebso1096085f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 10:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776099768; x=1776704568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5f+XrXQw4NkjWyaZYIEBYFM3RJ/D9h6405xJbdE04Vw=;
        b=Gmj9Nt9tQwANP2m1/V8q+xhZlxLviDeXbL6DsABQhb5IGH8wf2hC47Fd1fJ69VfEOB
         rKUcXs82ZeCXcbayvl0d3ZY05Et5OLPooJM0lsUkasCbQPK0KPPLCTPWxvRi307cb2zk
         7smqW/7U9zlQAkYZD0Rbc2MHK6m8JTPPmdqP3ix+F2tmiKBDbU/pskYwuTLPdxlRi8ZB
         KwzqflR2FqmR99jOb4/kmxJRsjLiaIpKmTeWpdNC9iVG+jKCIQ1bOGMtgBqHV+dECizr
         e5p/K3GKot4xk/Y0AsV6nTrP2jITYFP2/TmIuUns67C/GreOwtO75b37zDDR8r2be1Kz
         bthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776099768; x=1776704568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5f+XrXQw4NkjWyaZYIEBYFM3RJ/D9h6405xJbdE04Vw=;
        b=nZL9en60PI9BgV/8vcey3+lsZA7U8HFiGp9Qz0trkdlY2wDvgT1hPruObJffq920zR
         7Dohz2VxUfIF/hFFZ99ZS+oCTMV0NvfQdk6GCXb7/otK2Pq/pg0/FneT/AaQMF23zzYx
         b7IWAWfHj7ZD6C42YS3M7sch2nKZpPV8mMLvdTOUJcnuZb31DCosimnJorSBzTugKhSi
         s+fsDkBRG3F8z5J/6gWghnvsQZBc36LnoCOJKH5lrFmYKxCLCEMkmG82t4D/QSzd3v0P
         6qWaU5frTBSh87gNDYHp3+lOwGypu79+vr9Hqfpb6+v47fXp+xZUe1EoGwrFtRQLqt7r
         c+RQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VABk/cfQfEykyeZo5K3K4OIk/lMl6u5sLfnZXjW9sti7ijaITNLUttk1gDYCpcIrOufdBPqcOri9qxWVE@lists.linux.dev
X-Gm-Message-State: AOJu0YwIri49stMiorxYcnze0mS/NKDajqjp6Td7QMyOvHNZHK9dsup4
	gLMz6cpKmCq2cETASBJkKJNmY1Y9eH3UMPZzdzpJZDcPce3E4D5Z3zyN
X-Gm-Gg: AeBDievkz2Z+tjr8R13iFBJJOOnvEgdnoMTrVulDe/xno2Shm3es2oPSLh11aFlPOb+
	3ywxVnuDzAN+t1fef05LRuYaZ3Bg1qSzKayUJelo2dL70BtgNn02EJg8VZCbBGS1A4FEaakY0lA
	5wTu6ekVT9Nu/uw7E5AHR+BgT++deDbsoQjqs5I4R95SHfcBhEaZu91h1w8ibChkWqqbeJRV0kX
	AwD8GedC+nPiH6xpADa5TpVcpQsDuVNM4ti71nb579dtJWPNStqD7D5l0uainWECLIpO+irSZ+h
	847QKnIkbqyJKOcBKjuCcTYcDSw20qnzauHmAgly1cCP1/jD2yWxRdk1+JqxYnWF/1CuMhn+sSC
	tECJUebOpD8XrwV4WhICWyHqxGAlHLytuk/b2CK7gszInP/mCxVcQcugZh4LHwwkqwJejvcu5vr
	/LOinpRtFxpluyJ6Pw/GKlUU5pOFDWvOZO3TKIu49aJPOsKtYcJlOGIyZsTmlgSIwRlW8lIJfm8
	Q8=
X-Received: by 2002:a05:6000:1acb:b0:43d:7a97:78c6 with SMTP id ffacd0b85a97d-43d7a977a20mr5860225f8f.35.1776099767733;
        Mon, 13 Apr 2026 10:02:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7d5812dcsm4267528f8f.32.2026.04.13.10.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:02:47 -0700 (PDT)
Date: Mon, 13 Apr 2026 18:02:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Ping-Ke Shih"
 <pkshih@realtek.com>, "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>,
 "kernel test robot" <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
 <oe-kbuild-all@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: include/linux/build_bug.h:78:41: error: static assertion
 failed: "sizeof(struct rtw8814a_efuse) == 512"
Message-ID: <20260413180245.7a5ff542@pumpkin>
In-Reply-To: <6284c801-e378-4861-9c1e-f167bc14ef89@app.fastmail.com>
References: <202604101721.fsv5XmCX-lkp@intel.com>
	<2fb2a553-3e67-497e-b964-7fa5f940e8a1@gmail.com>
	<1e02bd10a68747f4a342caedde76ef04@realtek.com>
	<CAMuHMdWW=CFtTKG7ZqsULvo4hpOWh8miBZPemR6L2n1qCNvTWg@mail.gmail.com>
	<c09417ea7d534e2c812d470bd166fa3a@realtek.com>
	<CAMuHMdVWW1SOq_=FUZfqLyYKEgwVW_k+FywdYCu5j6Rnrv_GXg@mail.gmail.com>
	<6b6310b8-2b0d-4390-992e-5ccd81cef2e0@app.fastmail.com>
	<20260413140109.2b20de7c@pumpkin>
	<6284c801-e378-4861-9c1e-f167bc14ef89@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Apr 2026 15:46:50 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Mon, Apr 13, 2026, at 15:01, David Laight wrote:
> > On Mon, 13 Apr 2026 11:30:25 +0200 "Arnd Bergmann" <arnd@arndb.de> wrote:  
> >> On Mon, Apr 13, 2026, at 11:15, Geert Uytterhoeven wrote:
> >>
> >> Annotating the union as '__packed' is the correct fix for
> >> the theoretical users of OABI, and does nothing on other
> >> supported targets in Linux.  
> >
> > The other option is to ensure the specific drivers aren't ever compiled
> > for !CONFIG_AEABI.
> > Then it'll all get tidied up when you remove it.  
> 
> That sounds like even more work, for my own testing I have
> just stopped building OABI configuration altogether, though
> I'm still testing ARMv4 kernels.

Is it possible to stop the build robot doing that as well?
Might stop us having to worry about obscure build failures
on something that is heading to its death bed.

> 
> > I read that the patches to remove 486 support have been merged.
> > I'm sure it would have made sense to drop everything before P-Pro
> > so that cmov can be used.  
> 
> That is an entirely unrelated discussion of course. I don't
> think there is any need to discontinue support for 586-class
> processors (Pentium, Pentium MMX, MediaGX/GeodeGX1, AMD K6,
> Vortex86/DX/MX, Via C3) any earlier than the rest of the
> x86-32 kernel support: There is no practical difference
> other than compiler flags, and the Vortex86MX+ is still
> in production (originally released in 2010 with a projected
> 10 year support life). This is very different from earlier
> 486-class CPUs that lack CMPXCHG8B and TSC.

That is a lot more recent that the 1995 date of the P6/pro itself.

I was contemplating writing the 'masked user access' code for x86.
Mostly just involves generating the address space gap.
But the asm is easiest if it uses cmov.
I may need to work out how to use qemu, a userpace consisting of
a busybox shell running as pid 1 is probably enough.

	David
 


> 
>       Arnd

