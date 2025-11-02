Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE6F81732
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762094577; cv=none; b=J7orWcU5E0gEz/5aeE0D9CGoaOY4bcJJZl2C8V3gj9K6PmF3DiUXhohC8FOSBFSzDlm2zJs9DTfYKr2awlRLAiFi8W9o53Nb2yUVrcyfH9Y8tp4/2vH88QPIZXHZ/c7Sr4OrXm8RAzP1gtny8m79B+zRgpdqRktAG9iFymOH2EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762094577; c=relaxed/simple;
	bh=pbkXVCBiJFTw276Ls/cWRCbqZZ5rRRpoBPyFfh7okEc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=exEnJSUsMNb3c0ZdEPcNOZU2qyrGjeW34gk7+MGNAGlNdZtv4m2tZ6WCYmDVCWRBGkA1AFy6xVaVO4NGi9w2+MMyZimJHPD+SKyVv+U1xYPBF4PHQ0zNVdxxJU0DdHLVLn6ZlTZzZPNDr9UZ8lto2xh5y44y/I0f9Z86DabbAF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3XdnXGS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3XdnXGS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4298b49f103so1358294f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Nov 2025 06:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762094574; x=1762699374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/l01Iq6vPO3vdFoyhFUx3JTe7QcEcGli20S9zTwZ0A=;
        b=B3XdnXGSxSOKeuou6mu3BLpMYfbJEI+YQcBDQDElVBvG51Z+RA3o5Mw6+li9iLAyus
         e/hkK/C796haWf9FKufietkwXhDnCB//aQhAR62fibwpVFoy6qrCXNl6THg3Keklnj1o
         zYOHKXsBZfuI6Q1j17XPjuT5c4bZI3D0RzALOzihF7dlyHtI2WueQScVLk8NKBRN6uDk
         RtPqTcYgbFPYKZWvJL7SjbcpOPKwWmAHqFoBHiBoB9OQeG0BiI7/2aK5ARc6kiYNF6vL
         /XAUiinLB7rV1EZ2QdqOofUBlSt5tR97mmLpXRfK2he6Xw40AdXJZB7N7mnTRKkSY9HC
         gsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762094574; x=1762699374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/l01Iq6vPO3vdFoyhFUx3JTe7QcEcGli20S9zTwZ0A=;
        b=HYE3wHKfJimkF5TqseWLgpOkAb6KTKxqjmS90Vi0vz7rOTrubNpwXSOS3LYarGTxH2
         hIt18MzZf+N+Jt93g7NdzrQgg1//KxL2OTBagqt28NVKtxGjx15V1t95DTRLZN3QaPnR
         3+RBGCMXHldHm8Z0HaSNpPkLXDZMeXEXfWm4wwQkluPlHdnF5TB3TLorV+5rjZEcLuu/
         6XNU6AqXzb9rfEk2m/EbGeGTTB6sMiqutJv8kTKE96YFvSKfbqicVwyXpZeUzKmppwHW
         J9FAFwENwPWNMWmMNaUM3RVOGnNWD0R1rPzJUqLD6cixX+ESADF17HGbeYKOdrO5VWQI
         QQIA==
X-Forwarded-Encrypted: i=1; AJvYcCXxhT2iS50jZRGjUygdcMxK6m8EfYzNLO5QOdOp4m8+o2fTRqGOhn0jl9zzOwIdaU3iiCFshij4shQ51PcG@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+pdAyDPoMU3Ye/rNFwwJpLFGRX1bk4FyqGoxrQQbw1Vus6BOg
	S3l42undEe52D6QWRViiG7KW9UOmn3/fxXn/+YHsWcr0RaxFbkWIAzE7
X-Gm-Gg: ASbGnctVC6oP+J8CBXtHmTQzx4/W4o7iIuJMUMf3LSN4bpnrlK5sAHV+TVZ9G8b31X7
	P91weYOTSkZvOIsJJs+iAU9NrLx/+JFCQTr5Czu3ILHkj4GiuPOzZpVQiF/QWzUPt9z5JwuDS4f
	XVjG2QGkGOFZaDw1l3EaepghrXlfQhM9E//7sGVaNZdOuVNbIznl2yEj31sCrqHMwzpEwRCAzlp
	k5aGgEqC2HvX2a5q7i/Oe/FlZLJdCtjSL1ziMRARGs9RkFM76WkeldefzJGn6Gj01BogNGLdjsj
	5j6lW0Am03sY5cat5uvzZYQKKuLZ5cPxzx5CTHUUTmKYZUIFEYZ/jKRTeKSU23FvcVCvN16yqqD
	QRn9Y7HnBTFNgxbc1LjNs/qj6Rnv4DlGds4JT17cgbCdsDjb7Obwo0vzc/7i1WTiskoH2CTEl6l
	8yIVFqYb4uYI6Vbt6gArU94zRLKtKHkKy7/8hCNOytfQ==
X-Google-Smtp-Source: AGHT+IGwk7NnFJJ2q/GzuT4dp1A2zHQCkjebIZnoggNuBMbwztq8FVr8fUfHMAkKCZzaddYwMARkxg==
X-Received: by 2002:a05:6000:400b:b0:3eb:d906:e553 with SMTP id ffacd0b85a97d-429bd6b0fd0mr7392923f8f.55.1762094573419;
        Sun, 02 Nov 2025 06:42:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c394f0csm102090855e9.16.2025.11.02.06.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 06:42:53 -0800 (PST)
Date: Sun, 2 Nov 2025 14:42:51 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Andrew
 Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Guan-Chun Wu <409411716@gms.tku.edu.tw>
Subject: Re: [akpm-mm:mm-nonmm-unstable 87/91] lib/base64.c:36:28: sparse:
 sparse: Initializer entry defined twice
Message-ID: <20251102144251.7f0fa78c@pumpkin>
In-Reply-To: <aQdfzCq2JH5QX9AH@google.com>
References: <202511021343.107utehN-lkp@intel.com>
	<aQdfzCq2JH5QX9AH@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 2 Nov 2025 21:42:36 +0800
Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> +Cc David
> 
> On Sun, Nov 02, 2025 at 01:36:16PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> > head:   97751db460a7c6988b2ab988d9889d4309f9cc8c
> > commit: 5b693a7ad2acfa88e8ab0a047335ea4c94fecdb1 [87/91] lib/base64: optimize base64_decode() with reverse lookup tables
> > config: m68k-randconfig-r123-20251102 (https://download.01.org/0day-ci/archive/20251102/202511021343.107utehN-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 14.3.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021343.107utehN-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202511021343.107utehN-lkp@intel.com/
> > 
> > sparse warnings: (new ones prefixed by >>)  
> > >> lib/base64.c:36:28: sparse: sparse: Initializer entry defined twice  
> >    lib/base64.c:36:28: sparse:   also defined here
> >    lib/base64.c:37:25: sparse: sparse: Initializer entry defined twice
> >    lib/base64.c:37:25: sparse:   also defined here
> >   
> 
> I guess this warning is triggered because we first initialize the array
> with [0 ... 255] = -1, and then re-assign values for ['A'], ['a'],
> ['0'], as well as the 62nd and 63rd characters.
> 
> This approach was adopted based on David's suggestion [1] to improve
> readability by avoiding the expansion of the large 256 * 3 table.
> 
> I'm uncertain whether we should reconsider this method to avoid the
> warning, or if it's safe to ignore it in this case?

I was worried something might complain.
But any other initialiser makes it pretty easy to forget to initialise
one of the fields.
I don't know whether the code can be annotated to stop sparse complaining,
maybe sparse could be fixed to ignore a non-zero default initialiser.

The only other obvious initialiser is to pass in the values for "+-/_".
eg:
#define BASE64_REV_INIT(val_plus, val_comma, val_minus, val_slash, val_under) { \
	[ 0 ... '+'-1 ] = -1, \
	[ '+' ] = val_plus, val_comma, val_minus, -1, val_slash, \ 
	[ '0' ] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, \
	[ '9'+1 ... 'A'-1 ] = -1, \
	[ 'A' ] = 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, \
		  23, 24, 25, 26, 27, 28, 28, 30, 31, 32, 33, 34, 35, \
	[ 'Z'+1 ... '_'-1 ] = -1, \
	[ '_' ] = val_under, \
	[ '_'+1 ... 'a'-1 ] = -1, \
	[ 'a' ] = 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, \
		  49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, \
	[ 'z'+1 ... 255 ] = -1 \
}

Then have:
	static const s8 base64_rev_maps[][256] = {
		[BASE64_STD] = BASE64_REV_INIT(62, -1, -1, 63, -1),  
		[BASE64_URLSAFE] = BASE64_REV_INIT(-1, -1, 62, -1, 63),  
		[BASE64_IMAP] = BASE64_REV_INIT(62, 63, -1, -1, -1)
	};

But even that is error-prone, and doesn't really scale.

The static testing tools shouldn't really make coding error-prone.
So I'd definitely look for a way of stopping sparse complaining.

	David


> 
> [1]: https://lore.kernel.org/lkml/20250928195736.71bec9ae@pumpkin/
> 
> Regards,
> Kuan-Wei
> 
> > vim +36 lib/base64.c
> > 
> >     33	
> >     34	static const s8 base64_rev_maps[][256] = {
> >     35		[BASE64_STD] = BASE64_REV_INIT('+', '/'),  
> >   > 36		[BASE64_URLSAFE] = BASE64_REV_INIT('-', '_'),  
> >     37		[BASE64_IMAP] = BASE64_REV_INIT('+', ',')
> >     38	};
> >     39	/**
> >     40	 * base64_encode() - Base64-encode some binary data
> >     41	 * @src: the binary data to encode
> >     42	 * @srclen: the length of @src in bytes
> >     43	 * @dst: (output) the Base64-encoded string.  Not NUL-terminated.
> >     44	 * @padding: whether to append '=' padding characters
> >     45	 * @variant: which base64 variant to use
> >     46	 *
> >     47	 * Encodes data using the selected Base64 variant.
> >     48	 *
> >     49	 * Return: the length of the resulting Base64-encoded string in bytes.
> >     50	 */
> >     51	int base64_encode(const u8 *src, int srclen, char *dst, bool padding, enum base64_variant variant)
> >     52	{
> >     53		u32 ac = 0;
> >     54		int bits = 0;
> >     55		int i;
> >     56		char *cp = dst;
> >     57		const char *base64_table = base64_tables[variant];
> >     58	
> >     59		for (i = 0; i < srclen; i++) {
> >     60			ac = (ac << 8) | src[i];
> >     61			bits += 8;
> >     62			do {
> >     63				bits -= 6;
> >     64				*cp++ = base64_table[(ac >> bits) & 0x3f];
> >     65			} while (bits >= 6);
> >     66		}
> >     67		if (bits) {
> >     68			*cp++ = base64_table[(ac << (6 - bits)) & 0x3f];
> >     69			bits -= 6;
> >     70		}
> >     71		if (padding) {
> >     72			while (bits < 0) {
> >     73				*cp++ = '=';
> >     74				bits += 2;
> >     75			}
> >     76		}
> >     77		return cp - dst;
> >     78	}
> >     79	EXPORT_SYMBOL_GPL(base64_encode);
> >     80	
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki  

