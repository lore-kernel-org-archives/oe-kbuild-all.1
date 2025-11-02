Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8B1E555
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762095469; cv=none; b=NBUQJD2lNDJz1tazCGnfSaPLh+a9iJHm4+l03pF8A7rt73j7kk88yrUFCstJ5JnDf+b02owH4kAnHj3TOberDN/Ag+netvNfKSqjqmbZ5phvpgBTykeW3qYtW3scKiNZvPykzvZLgcwhkPScfSUWp3Sw6cqSrac9yWgHfLGX86c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762095469; c=relaxed/simple;
	bh=NBGhX8V09gS4oA7SD1eR0/4Po/imWbn0GG7PnfdzihI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urOFNDc2dgNL3rc8bLsTF5pNJT+C9FZo4sMRgEx2Rj+K7o302eLhN2P44QkNshoqvwkwsyHI97yshkJ5y3p27BJGcPenNGD37LiROT9ahv+TLRYaPYCIIIUs3+MFXsYysdR7jGSL8muz9gNqHG8d8PsUBhYFefX+an7Gm+vroQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHQiPPvw; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHQiPPvw"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b67684e2904so2510703a12.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Nov 2025 06:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762095467; x=1762700267; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EW+evJrk5p1TwCCxbQG/bGH1p9PSRSCoapL/P+6NYsg=;
        b=KHQiPPvwkFUe4DKDwAXWHF5qeXInnBaUU8bKx6dGXhMMuQE564t0kG7+Nf3HFtGzmH
         w2KN9Zyr69agaFR/1x8U9pyq1E/pbqgC9igMLqZxJNvWNaTvznZORQAvuijzWYbA9ms3
         bxWCZCriqRvxe6Y+vj70aVbTB5MvenWLovQs+AS+Igp/n8RYNjQRZbMp/mvroIIJCED5
         fMPXlpMk3cb9exlW8bVQB1vNsaPFq8SEJEQUhHO8K2juqUIpWhGg882VGKDU/fwYS+PD
         Z/DtRpgubW+mv4ABCUQJbizsx6tCf4KFhdAsnKGkmy3TEffw744xjmLv0Lep/gfStbtz
         ImgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762095467; x=1762700267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EW+evJrk5p1TwCCxbQG/bGH1p9PSRSCoapL/P+6NYsg=;
        b=A3s1tYL+hP6tZZB9ZMB426BAIEErIS+h16NpL6RwE+KAy7m25zQQa+6sscggzE1aTz
         pmk2QbF0sZlbgi9ync2+gIXPwe86zAHjfWi7h1+xRaQva01DnK9kUxDkzI0kzw0J6Nr3
         VUT9y8JP0B2aDlYhM0o8be2wm9TiCmETqZissCpYJBGT6GkT06XKsBny8fc5jOGq4F1W
         r/0aC1OU5YQJhUJjNQKBSRDLcqNi646/FdNnXin+S3ZwOUWZM8pAsA8wV07okDHus4XI
         EHYHQMcE+lySo08zQhMfGKead+IhS3+XWWeI3m4Rx4dD+h/parWqvNPuwNFTcW6s2ijW
         gpBg==
X-Forwarded-Encrypted: i=1; AJvYcCU5zfKpW9hrXUZrBAQQ0co8FvkqJoWEiYmrQumqreMdBiH0h4PMvRi4RxwwLrNVRB7Asate0edNACwd/rzf@lists.linux.dev
X-Gm-Message-State: AOJu0YxSRE9S8tfRV1iN7Gl6hR0/2qbVv+I9EmjKJibG4PJXIvVuS3ho
	T/zRlYLsu+ZzuwuuY4FONLDNkH83rThQwv17mEnERjJFgNe5XPOZuwQc
X-Gm-Gg: ASbGncvFbiOUQRcIqkyb9gPkX2Xo429q8QeMfYMPvCt9B9ngFBcLmnbB5NWCASuBG6b
	gU+PXCynXgD+g8W4L3d76fOjcCXv/f2hvQeGKBNpjgS7WmfZtmjpzteAIWWqfpV0hyQPK2sZffx
	qdhZvKwoD1caZ5gLZCIOB5qMa3VzyjRVZJ9O5PQL6ZjmTW+ykpiGz/xxs1R0RXbNDb/IoY081wW
	XDnzj0S0+e1RSTgMJ/sEa9005dWBvKWHG412X6yo79kolih5w/U+tAqa1e2jSB1I+yRWPQS81JG
	Nu70Nf2p/XY5Rukw1oEKTjjteRoFQp/w6vNACxec1vmo/JIC9X5xEmKdtOPHiTmO9+TZhNDsZIx
	SB7v/1TgPQxtNsQie5wRYTpJlZ11X44ibAGcRpAJ7WbMnoDvwXk4c+pVdYXh7c+cz4PUtZUoEhR
	B12kfBpZRX+pcmZsnmapSGK47cdfL4DXRbmfL1r99oPuOoP4qEgu16flCzgCqvN6kkIn0=
X-Google-Smtp-Source: AGHT+IFU2DNnYwsIyV4r7s9YtpZ7QQ1tNNIWx6HST/ojw1e0uIZWMRFwK+HdG4jzTgIZNpdYhvzBag==
X-Received: by 2002:a17:903:2441:b0:295:28a4:f0aa with SMTP id d9443c01a7336-29528a4f2a9mr121037185ad.43.1762095467244;
        Sun, 02 Nov 2025 06:57:47 -0800 (PST)
Received: from google.com (114-39-189-33.dynamic-ip.hinet.net. [114.39.189.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29556d61d85sm54355065ad.68.2025.11.02.06.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 06:57:46 -0800 (PST)
Date: Sun, 2 Nov 2025 22:57:43 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: David Laight <david.laight.linux@gmail.com>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Guan-Chun Wu <409411716@gms.tku.edu.tw>
Subject: Re: [akpm-mm:mm-nonmm-unstable 87/91] lib/base64.c:36:28: sparse:
 sparse: Initializer entry defined twice
Message-ID: <aQdxZ_bmyfWTEvW2@google.com>
References: <202511021343.107utehN-lkp@intel.com>
 <aQdfzCq2JH5QX9AH@google.com>
 <20251102144251.7f0fa78c@pumpkin>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102144251.7f0fa78c@pumpkin>

+Cc Luc Van Oostenryck for sparse discussion

On Sun, Nov 02, 2025 at 02:42:51PM +0000, David Laight wrote:
> On Sun, 2 Nov 2025 21:42:36 +0800
> Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> 
> > +Cc David
> > 
> > On Sun, Nov 02, 2025 at 01:36:16PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> > > head:   97751db460a7c6988b2ab988d9889d4309f9cc8c
> > > commit: 5b693a7ad2acfa88e8ab0a047335ea4c94fecdb1 [87/91] lib/base64: optimize base64_decode() with reverse lookup tables
> > > config: m68k-randconfig-r123-20251102 (https://download.01.org/0day-ci/archive/20251102/202511021343.107utehN-lkp@intel.com/config)
> > > compiler: m68k-linux-gcc (GCC) 14.3.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021343.107utehN-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202511021343.107utehN-lkp@intel.com/
> > > 
> > > sparse warnings: (new ones prefixed by >>)  
> > > >> lib/base64.c:36:28: sparse: sparse: Initializer entry defined twice  
> > >    lib/base64.c:36:28: sparse:   also defined here
> > >    lib/base64.c:37:25: sparse: sparse: Initializer entry defined twice
> > >    lib/base64.c:37:25: sparse:   also defined here
> > >   
> > 
> > I guess this warning is triggered because we first initialize the array
> > with [0 ... 255] = -1, and then re-assign values for ['A'], ['a'],
> > ['0'], as well as the 62nd and 63rd characters.
> > 
> > This approach was adopted based on David's suggestion [1] to improve
> > readability by avoiding the expansion of the large 256 * 3 table.
> > 
> > I'm uncertain whether we should reconsider this method to avoid the
> > warning, or if it's safe to ignore it in this case?
> 
> I was worried something might complain.
> But any other initialiser makes it pretty easy to forget to initialise
> one of the fields.
> I don't know whether the code can be annotated to stop sparse complaining,
> maybe sparse could be fixed to ignore a non-zero default initialiser.
> 
> The only other obvious initialiser is to pass in the values for "+-/_".
> eg:
> #define BASE64_REV_INIT(val_plus, val_comma, val_minus, val_slash, val_under) { \
> 	[ 0 ... '+'-1 ] = -1, \
> 	[ '+' ] = val_plus, val_comma, val_minus, -1, val_slash, \ 
> 	[ '0' ] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, \
> 	[ '9'+1 ... 'A'-1 ] = -1, \
> 	[ 'A' ] = 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, \
> 		  23, 24, 25, 26, 27, 28, 28, 30, 31, 32, 33, 34, 35, \
> 	[ 'Z'+1 ... '_'-1 ] = -1, \
> 	[ '_' ] = val_under, \
> 	[ '_'+1 ... 'a'-1 ] = -1, \
> 	[ 'a' ] = 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, \
> 		  49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, \
> 	[ 'z'+1 ... 255 ] = -1 \
> }
> 
> Then have:
> 	static const s8 base64_rev_maps[][256] = {
> 		[BASE64_STD] = BASE64_REV_INIT(62, -1, -1, 63, -1),  
> 		[BASE64_URLSAFE] = BASE64_REV_INIT(-1, -1, 62, -1, 63),  
> 		[BASE64_IMAP] = BASE64_REV_INIT(62, 63, -1, -1, -1)
> 	};
> 
> But even that is error-prone, and doesn't really scale.
> 
> The static testing tools shouldn't really make coding error-prone.
> So I'd definitely look for a way of stopping sparse complaining.
> 

I also think the current code is more readable and less error-prone.
I'll loop in Luc to see if he has any feedback or thoughts on this.

Regards,
Kuan-Wei

> 	David
> 
> 
> > 
> > [1]: https://lore.kernel.org/lkml/20250928195736.71bec9ae@pumpkin/
> > 
> > Regards,
> > Kuan-Wei
> > 
> > > vim +36 lib/base64.c
> > > 
> > >     33	
> > >     34	static const s8 base64_rev_maps[][256] = {
> > >     35		[BASE64_STD] = BASE64_REV_INIT('+', '/'),  
> > >   > 36		[BASE64_URLSAFE] = BASE64_REV_INIT('-', '_'),  
> > >     37		[BASE64_IMAP] = BASE64_REV_INIT('+', ',')
> > >     38	};
> > >     39	/**
> > >     40	 * base64_encode() - Base64-encode some binary data
> > >     41	 * @src: the binary data to encode
> > >     42	 * @srclen: the length of @src in bytes
> > >     43	 * @dst: (output) the Base64-encoded string.  Not NUL-terminated.
> > >     44	 * @padding: whether to append '=' padding characters
> > >     45	 * @variant: which base64 variant to use
> > >     46	 *
> > >     47	 * Encodes data using the selected Base64 variant.
> > >     48	 *
> > >     49	 * Return: the length of the resulting Base64-encoded string in bytes.
> > >     50	 */
> > >     51	int base64_encode(const u8 *src, int srclen, char *dst, bool padding, enum base64_variant variant)
> > >     52	{
> > >     53		u32 ac = 0;
> > >     54		int bits = 0;
> > >     55		int i;
> > >     56		char *cp = dst;
> > >     57		const char *base64_table = base64_tables[variant];
> > >     58	
> > >     59		for (i = 0; i < srclen; i++) {
> > >     60			ac = (ac << 8) | src[i];
> > >     61			bits += 8;
> > >     62			do {
> > >     63				bits -= 6;
> > >     64				*cp++ = base64_table[(ac >> bits) & 0x3f];
> > >     65			} while (bits >= 6);
> > >     66		}
> > >     67		if (bits) {
> > >     68			*cp++ = base64_table[(ac << (6 - bits)) & 0x3f];
> > >     69			bits -= 6;
> > >     70		}
> > >     71		if (padding) {
> > >     72			while (bits < 0) {
> > >     73				*cp++ = '=';
> > >     74				bits += 2;
> > >     75			}
> > >     76		}
> > >     77		return cp - dst;
> > >     78	}
> > >     79	EXPORT_SYMBOL_GPL(base64_encode);
> > >     80	
> > > 
> > > -- 
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki  
> 
