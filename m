Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98803557EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768393708; cv=none; b=nr2T+GnVpCGQPTav7GZTxssFkWYxIxhSJL0M2oANgNrbJNbYW0Od/Tu/JV6h1OCsHfNr7Su2R652CzvxE/ooCIOpC9+MXmnGVWQswUz6OjgPw+POv7y81yqm+lmxfVC6Ks+IszNjqlK4EjazxqmZ85E3ot+Vg2eiEvQDXfNbydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768393708; c=relaxed/simple;
	bh=j+mQoSqzAh5RCYUg705iz2e3cyvLCAFRTNP2daSCz30=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MnF6qgPSleln6LJ1/Q/Wx3Bm6Z1+uwSThAwbVqK7OlpHGGHcE1TpveBH4pD4k85jISJWhpbxKAIydAlimGvtiJpzYUwHr+ji7Nk8VpQZjDwpJpali/EEjzhSLZU/7pQ7oqFMc48X3SddrIFgo/I1Q0hiwpVHYKeX7ddJW4wNv50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZjkC/wn; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZjkC/wn"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8765b7f4c0so98985766b.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 04:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768393705; x=1768998505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gsd8G2M81+WYoxdkuRC18RhaEdxHWf3NY55zL6lQS6M=;
        b=SZjkC/wnL1Pv8gEMYOfoi6qhKjHnD4pTh2UVX7L2e36zGVVtuuLMFF132UIfKY0fNE
         ZtH3R12wLNW90PFswqIH9Xh1DjpWDv4v0oYRrH810ZXAMD25Uxbc8IJry65bXeXVI21P
         MrBM9tVEk+32gNJcXXotvn51msjlZUzYF5KaKMwsbei6f5628n608Y3AsMCP1OHyfI1R
         8LAkG36IVViioGEFocN1RttOIIEHbl/g50GbU5tPN0XTAbYEHiyfHdoF7aV1S4Zap0Hg
         IvWz2YG8Rnv7UI+JEFWGWr9qhK4L421zJTEa3hljWKj1Zfbm2pKqOteLbxCIAXwspuxv
         nUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768393705; x=1768998505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gsd8G2M81+WYoxdkuRC18RhaEdxHWf3NY55zL6lQS6M=;
        b=KTDRoKq8AKLacHIyRVRVmjRZqU3h3o4+WvddJGsGvbulm2wfRVd+zcIvYyTS+qByai
         w+06TRDgJ/MDYjvzwyHA7zkHY+oZrUcI1F5GBumOUYDCr/8DwPBquFRXLVYnmkqR8XaN
         XUdYRxzc2UfMmXTVC9Z4hrkpnprToNGV5lqyesBXCuznWrM1K7p5I/b6QwCtjWfctYQ+
         2OV0PAqamQ2dZ/BUd9OrKdyD4dvx1Xpd41TSSaL11EPhX1Ai561TBYER5/EU5jM2VYkD
         Xdxd47Rnx5vxhR4/WsU5rYYreJGiw9zGlLeuUZv9r2Lwmg68HFvv8yTFnp/8sS0IgIdN
         Br7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMwVQSQcY0UkBuyYpjS1wIOwFhs3kGQWGUBAjZuPx9RAtM0b4ITF7RwXPTz9jz1ItIlrD6bzy1NgoqzEyr@lists.linux.dev
X-Gm-Message-State: AOJu0YxcVICF8hs9Jo9j+MH5hGs6YVS9jsHLsCdS/w7HTOXLlN6z/+bD
	iVgH1V5RTFbFJ2udEgI6h9kqHos2rcoSw+lQtGN4m1Zzio2RcFKnCX8V6Ckzww==
X-Gm-Gg: AY/fxX7REdvvTQnv2TiDi5Zg0jTvnMZAtlsTOnX/2Cf04mFdVUR3iUMnAsA89KeJsvk
	bMZtzmeEPeR1+18Vz+mZwFQnCn2uyyzWe6fpIwkhfhHnapI+6ZShMtTLrD8r44CO9woE7Akz/Ed
	BQ7tZi3nPZSmgrg9TTutQ04KtA8YJ7Eb/BF6qXrlPi+BqHiu69G47zPQCylkwHzTmpt25yhateE
	9els2VYBvcUUxOdwHJx4GUT+5F/sdUtELaeEP6pTsmln5D9sj8HDtJEqL7Xe+UQI7Gl8Ow7kNAK
	nutir4BEWMO30mGlNDKfo7u2fEGgf0T3hl2dFIWIzvwqsH6ulW15ezuPeNVHNsOl4p7tWGb/m05
	IiLyDFPL9IP0EPprgczB3eVsk8nxAgd5fmw8O/wiDjQI0LDrQiJFIVVSEiovZVsKGWOPLrLaMpU
	T0EStG0xtMgOB1PJ1ouZSZZgeJal5D4cxUikhbT+gYxOeJVd8w/UQo
X-Received: by 2002:a05:600c:c16a:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-47ee32f14ddmr22777885e9.13.1768386665307;
        Wed, 14 Jan 2026 02:31:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee5914232sm24680845e9.14.2026.01.14.02.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:31:05 -0800 (PST)
Date: Wed, 14 Jan 2026 10:31:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Nicolas Pitre
 <npitre@baylibre.com>, linux-mips@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Subject: Re: mips64-linux-ld: div64.c:undefined reference to `__multi3'
Message-ID: <20260114103103.216aa122@pumpkin>
In-Reply-To: <alpine.DEB.2.21.2601140453090.6421@angie.orcam.me.uk>
References: <202601140146.hMLODc6v-lkp@intel.com>
	<20260113200455.3dffe121@pumpkin>
	<alpine.DEB.2.21.2601140453090.6421@angie.orcam.me.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Jan 2026 06:19:02 +0000 (GMT)
"Maciej W. Rozycki" <macro@orcam.me.uk> wrote:

> On Tue, 13 Jan 2026, David Laight wrote:
> 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
> > >    div64.c:(.text+0x84): undefined reference to `__multi3'  
> > > >> mips64-linux-ld: div64.c:(.text+0x11c): undefined reference to `__multi3'    
> > >   
> > 
> > This looks like a bug in the mips 'port'.
> > arch/mips/lib/multi3.c has the comment:
> > 
> > /*
> >  * GCC 7 & older can suboptimally generate __multi3 calls for mips64r6, so for
> >  * that specific case only we implement that intrinsic here.
> >  *
> >  * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82981
> >  */
> > #if defined(CONFIG_64BIT) && defined(CONFIG_CPU_MIPSR6) && (__GNUC__ < 8)
> > 
> > So this code is excluded for gcc 8.5 but the compiler is generating the call.
> > 
> > Looking at the git log for that file there is a comment that includes:
> > 	"we wouldn't expect any calls to __multi3 to be generated from
> > 	 kernel code".
> > Not true....
> > Not sure why the link didn't fail before though, something subtle must
> > have changed.
> > 
> > I think the fix is just to remove the gcc version check.  
> 
>  Or rather fix the version check.  The GCC fix went in with GCC 10:

Does that mean the GCC 10 generates the multiply instructions and never calls
__multi3?
(Rather than just not using __multi3() for that specific example.)

In this case gcc knows the high bits are all zero - so just needs the two
instructions to generate the high and low parts.

	David

> 
> $ git log -1 --pretty=oneline 48b2123f6336
> 48b2123f6336ba6c06846d7c8b60bd14eaeae7ec re PR target/82981 (unnecessary __multi3 call for mips64r6 linux kernel)
> $ git show 48b2123f6336:gcc/BASE-VER
> 10.0.0
> $ 
> 
> I don't know why the PR got it all wrong; I've fixed it now.
> 
>   Maciej
> 

