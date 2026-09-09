Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D21F3DA5A3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 07:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937992; cv=none; b=gYgc4rdWC8DbPJzp+8daRLiaN5Xwron9g4mK3M3783nVVKjIc7pEPb5JcGYUtT8F4EKcngEtm2h2BWzbm91y8Mrnlil3sVNQbNGjMrT+R3uRo3CCmlI+7NamXcahRq0qS+OLob4YBUTyqHB4jP5PYVWQW2/nyK0gMXyDiWUz/sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937992; c=relaxed/simple;
	bh=zgGJQ1NQlEGrMHCVTwUBOydHTeWREfHl90HMzJ/kQUM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fwVB01gXT7p7DeuLn3fT6Yq2k50Zp19ZmjMluWFk+JhA+LLxqW0wxHQNfd4tvDmSEMoPozQbzK1EbZ/pfXO0TRXcNASRGuxX6dZWywkXudq64eBY0gqgqVd2ELXg8DvaLUV6bagpw6TKd8zUBWMxsuAN7w5y25VFNpt+oQd7N1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLbmVkMU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLbmVkMU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C401F00A3A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 07:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788937990;
	bh=Ok6EUReL2/+6ZlOw6IiqUuTgYM3TDO0+NBqBL2d/8W8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=oLbmVkMUzkAbbWkPPfs8Z8x48INdbgh7ZD33NK1A+m883+coVtaIi/gwFBH6TQndl
	 4xng7tUFxq5Cm0ESoB3wgoZqx387Bm6sdagUKA3iXH4t+jriyJRUtbbmGJfAq4zrbP
	 1fVgogRGxx1x3Z6zJTvrzNT/HjA8WJzaThCAnmld3tOCSAz/cbDaoBeufeOy5Bjoxe
	 A6IA9sNAlE+ZaZMOPlE2s8aNZiMM4NlmG0FVPS85ffqcob3TB/f9dXsQl7JTYIOlOh
	 MDpJtoekUs1r68JpZ5cxkeHGIvTE6fUokeQIwH6Y1VpxYfNUAJwL10EnaNaKGpg+Cf
	 y8qTIgIqY0lvA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id A24F6198003A;
	Wed,  9 Sep 2026 03:13:08 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 09 Sep 2026 03:13:08 -0400
X-ME-Sender: <xms:AwehaqXTiDkjjFCX7GXrkx6oCrck4IlsKpdzTNtMY0OkFLhYIwGfnA>
    <xme:AwehahYvE3sOkAFA0AmVksFWzaYzHPvGnVkTY3Uw0wZjJ84mPKMd6YtHR1n_KWFXn
    0y9Crf6N9WbnkpKMZ6fkNa1jtz3Unm2-6KOcCiBRkPf-LiGr3V1ErcbGA>
X-ME-Proxy-Cause: dmFkZTFz24EGPf1sZe2jqXH0fNeAfuavmSdX9GINuxsz0QewpSZWA4s775vJg30SyIxjPU
    u4Ajef45C8U4l9aUsrjYI3yXlt5567ZctCVbohBlOrNQD2oYKw9Lqr13Lq7bvZjv9JQZbK
    h7KWgjb7WR+XEzWEtY+sSMkzmhX+b7B/iB9Mni8SplOb5cNG49kiKJLtV+M3zfa5DVSuft
    9MZ4e0cGEptlIV0h92BXX+MzRTbqmEeGkWsKT+GKcieb3tpWG590rYrUPIwQV3IjeDAJwA
    yt6X+g0P92DMsUoHyA0lPWyoLgR5cozpBPAo6O4un7PW7MMzVaX7rUinYzAtaitIyhWttI
    3cY1XTBDcHZX1ehjWXyfvVgGo2wjYbJo/0y/7+p2y2XCZPhGDMXyxml3J2kR/wxBcBNFR0
    ywwgonVcrKaqOAd5Rbd/m6NHI0oeKcFY738D2UsBuX97quEtBv8/aqXZiRCwA7zSa8bz85
    hlb7dNMsg3px5g4kLediKTWbdCnE9RwkU+DqT8uqnkqeMgXPhwA820XuUJu6TR72iv1d/U
    3LgAZSxbsFLVEEZJa8O7SZKOCLD8muOzmhf8J7IbR8i5f/eQCBXGFsAkApmTHMYj/hQ6dv
    SLVFllZrDKXjfl84mo+BLk/vQwWV8yegtebQMtWOA2yGBV6kWN4Dn+5ZKXQg
X-ME-Proxy: <xmx:BAehahBuc2_Ci49I27klkvtDksMx76CUKlh66Fw_F7TZX4nUyuUFhw>
    <xmx:BAehateFoqcMkZBfwxV0EpziOYCiXh4S3dWFlfKEPnDkcq6UDla8-Q>
    <xmx:BAehakKkbCJ1fPJPJt-Ugmn6X6SLal5UYc7qLR-6jIYrukOz1eN9Iw>
    <xmx:BAehaocnRYpyXia70imGvmcBfCQdiNWx9bX4H_3HnGP8Byv1-YS57w>
    <xmx:BAehaj3R_V4VpRn9besm-4lUCrJKSYEDvr8130eaXfFNO9_0G7v6yDAo>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 85267F8007D; Wed,  9 Sep 2026 03:13:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 09:12:46 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Message-Id: <7b9400d4-ebf4-4757-81ce-9e52295cecf4@app.fastmail.com>
In-Reply-To: <202609090804.938npPl7-lkp@intel.com>
References: <202609090804.938npPl7-lkp@intel.com>
Subject: Re: drivers/firmware/efi/libstub/vsprintf.c:511:5: warning: no previous
 prototype for function 'efi_snprintf'
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Please stop spamming me with reports about code that appeared
on one of my branches for a brief period, was apparently pulled
into some intel LKP branch but was never submitted by me for any
kind of review.

Thanks.


On Wed, 9 Sep 2026, at 09:00, kernel test robot wrote:
> tree:   
> https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/x86-boot-Drop-pointless-re-implementation-of-panic/20260906-150819
> head:   c551ec0edb0b057c415d5530905c288523a9bde8
> commit: c551ec0edb0b057c415d5530905c288523a9bde8 efi/libstub: Add 
> efi_snprintf() to construct wide strings
> date:   3 days ago
> config: loongarch-allyesconfig 
> (https://download.01.org/0day-ci/archive/20260909/202609090804.938npPl7-lkp@intel.com/config)
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project 
> ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20260909/202609090804.938npPl7-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202609090804.938npPl7-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/firmware/efi/libstub/vsprintf.c:274:5: warning: no previous 
> prototype for function 'efi_vsnprintf' [-Wmissing-prototypes]
>      274 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char 
> *fmt, va_list ap,
>          |     ^
>    drivers/firmware/efi/libstub/vsprintf.c:274:1: note: declare 
> 'static' if the function is not intended to be used outside of this 
> translation unit
>      274 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char 
> *fmt, va_list ap,
>          | ^
>          | static 
>>> drivers/firmware/efi/libstub/vsprintf.c:511:5: warning: no previous prototype for function 'efi_snprintf' [-Wmissing-prototypes]
>      511 | int efi_snprintf(efi_char16_t *buf, size_t size, const char 
> *fmt, ...)
>          |     ^
>    drivers/firmware/efi/libstub/vsprintf.c:511:1: note: declare 
> 'static' if the function is not intended to be used outside of this 
> translation unit
>      511 | int efi_snprintf(efi_char16_t *buf, size_t size, const char 
> *fmt, ...)
>          | ^
>          | static 
>    2 warnings generated.
>
>
> vim +/efi_snprintf +511 drivers/firmware/efi/libstub/vsprintf.c
>
>    510	
>  > 511	int efi_snprintf(efi_char16_t *buf, size_t size, const char *fmt, ...)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
