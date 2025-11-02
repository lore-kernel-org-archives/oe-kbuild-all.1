Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD74D63CF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762090963; cv=none; b=F0KUmFj54V55iXEKC9tsWsCwVbBzk5+PvycE0HFyYikCAI8ysEZNxYdbXEi6Vpq9tO4XkRUPBvA6/9FrIHsdXf0BKJRm38f6yClcI5qeoUUar7Px2ap6Zhp+5CxQ0ud50W6Du8464aanSRXWHURb+W+8AE8cUSibuFo1ENeWqNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762090963; c=relaxed/simple;
	bh=SkjqPUoQoZDatpUXDy+q2164TzJ5jrvnTh5aZd58iy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJiMxLxBda2wvHjIfQTs1gLbhTNNTWhk0peZtA5ZgBj2XqfVJmnkaVUtDpUqgoSuVphe5XOuacy9oVoT4GPGyabwACqDDclfdKKqNmPquTwpM9pTHt6ZaURP26O0nf4Q8IzXUd5Go5KoiXoA7k3JlsVEhq2IG4b5ODcNKRmJVRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbgdCAgt; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbgdCAgt"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a28c7e3577so3542468b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Nov 2025 05:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762090961; x=1762695761; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gO7NlorKZwi6OyYGVCcMlcZm+zfDgmVHpdXZK4TIm50=;
        b=JbgdCAgtVgg6E7tD0IyhHmF4/DlQh6wsbkbgcQShKcPYkOcznCFmcKowlvyNR11IWf
         ea+rM2Ez+8rizGuXk4WXZvOw9M2sz/o6QtoM25/84NbiMHRBlBleMpV4OaGvpzj/PI20
         Z87JGf7bO1T3bzbjCWjzmR1GyXPB7iyek7sMvrs+Mr1ztKwfY2NMhlZOyCjsKO6Cuuxv
         dsspYLhUiQ4iY2EXG3t/rtRlcqcPCAnALEkNtMRulslmpxEfGSTsEyxOSLomIbmp3SlN
         nysQ/7bfAUVhH6ip8zwSDC2RnEgNiirqhwnOmfRcQ9h3ji736ie4cYKD1fUMjPhqQLcB
         yc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762090961; x=1762695761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO7NlorKZwi6OyYGVCcMlcZm+zfDgmVHpdXZK4TIm50=;
        b=uPuG4aAGBI1wWkMiZy5wVEvRO6qaWMehVdmJaR4xL1GJs/To/pLt2ACajXDYaa5s2u
         5o2lcLPDRjPZtzziN/0cosBfKyqZbdToFsODpe7gr1A2B66RGq4hu/ADe9y2xujN4aMy
         iPgvCmkzqZRdMZbAInM7sUVp4vmVJFsbuNwT9Xy9Ysoo32K8T9CCcSO5wX4hoZ70F2hl
         luf1eVMMk+7fbv2QVdfrsWvW9O/IyvaeRJWxMK6ji5d3zMbHrLVmiBGppZK+0I+U1wJw
         XqfYMOPvYcDzBu7B4yN3JDP/WiMCcSBDhPJRCKLdn6JKF5f7PvYZVX+H/JJI4r1xnKv4
         XQHA==
X-Gm-Message-State: AOJu0YyavkVgl9rXGDTyt5Rp0Q1KoAzI6edVpPaCqIPb6nv9mtpv5S/k
	ZKdj+seooG64lLebzFfYqO0S1vDhCCA3L4/6uF0wvPlyQY+OxztbfQJW
X-Gm-Gg: ASbGncsmiSQvsTCpydyUctH/GSMw7e4rqa+RanfVcicnVDz2t70yMOEqJsDjOgObO6l
	T6jgc2LaBqUZW91WN5fQzy0cm47IMNvBDcRzqvE7Jedz+qOB1hlGGkJeG+8nhOmjy0tMaEOVqIR
	IvoThJJ86e7yG9v/3fdS3sUk42Qtp4Q2kIXD0Op5yKRdKYe7XZ9nBM9eTHKNyISQqRrnP3Mu9sA
	ZCrKzfH551C52P30tYmKBGc1zxtKKpJxrfvegUmCROqbg1rbmlKn5ZyHKy47EVG+aQ/f4ONJMDt
	58i42WS8ca3sjPI7HlgbsSJc5XsC3yIwumV26EebQehy0ESI/kq7EvZv3ef5eJeqFy7lze22M1p
	MI+tUO9hdfMjD2iKPiJ+XlW8s6TmeE4DY0LA2PknoNT0vAw7IeBqxfO7Ii6YY6ZQdqs4y7jgU7V
	c9q2slm0f84M2AEf3MBFyhRqI7q6+2yonxcdTP6v2AQxVx6FlMiSLNn6Bk
X-Google-Smtp-Source: AGHT+IHdlKoMU5632pn4GfYLR+xsjg4vaTjWq2y1LHCLtrZP48xtBq0+y9hcaZi8ys6gnjEur/j+KQ==
X-Received: by 2002:a05:6a21:9998:b0:342:41fd:38e2 with SMTP id adf61e73a8af0-348cbda97afmr12398047637.30.1762090960905;
        Sun, 02 Nov 2025 05:42:40 -0800 (PST)
Received: from google.com (114-39-189-33.dynamic-ip.hinet.net. [114.39.189.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050b56b0csm11456022a91.11.2025.11.02.05.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 05:42:40 -0800 (PST)
Date: Sun, 2 Nov 2025 21:42:36 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Guan-Chun Wu <409411716@gms.tku.edu.tw>,
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 87/91] lib/base64.c:36:28: sparse:
 sparse: Initializer entry defined twice
Message-ID: <aQdfzCq2JH5QX9AH@google.com>
References: <202511021343.107utehN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511021343.107utehN-lkp@intel.com>

+Cc David

On Sun, Nov 02, 2025 at 01:36:16PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   97751db460a7c6988b2ab988d9889d4309f9cc8c
> commit: 5b693a7ad2acfa88e8ab0a047335ea4c94fecdb1 [87/91] lib/base64: optimize base64_decode() with reverse lookup tables
> config: m68k-randconfig-r123-20251102 (https://download.01.org/0day-ci/archive/20251102/202511021343.107utehN-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 14.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021343.107utehN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511021343.107utehN-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> lib/base64.c:36:28: sparse: sparse: Initializer entry defined twice
>    lib/base64.c:36:28: sparse:   also defined here
>    lib/base64.c:37:25: sparse: sparse: Initializer entry defined twice
>    lib/base64.c:37:25: sparse:   also defined here
> 

I guess this warning is triggered because we first initialize the array
with [0 ... 255] = -1, and then re-assign values for ['A'], ['a'],
['0'], as well as the 62nd and 63rd characters.

This approach was adopted based on David's suggestion [1] to improve
readability by avoiding the expansion of the large 256 * 3 table.

I'm uncertain whether we should reconsider this method to avoid the
warning, or if it's safe to ignore it in this case?

[1]: https://lore.kernel.org/lkml/20250928195736.71bec9ae@pumpkin/

Regards,
Kuan-Wei

> vim +36 lib/base64.c
> 
>     33	
>     34	static const s8 base64_rev_maps[][256] = {
>     35		[BASE64_STD] = BASE64_REV_INIT('+', '/'),
>   > 36		[BASE64_URLSAFE] = BASE64_REV_INIT('-', '_'),
>     37		[BASE64_IMAP] = BASE64_REV_INIT('+', ',')
>     38	};
>     39	/**
>     40	 * base64_encode() - Base64-encode some binary data
>     41	 * @src: the binary data to encode
>     42	 * @srclen: the length of @src in bytes
>     43	 * @dst: (output) the Base64-encoded string.  Not NUL-terminated.
>     44	 * @padding: whether to append '=' padding characters
>     45	 * @variant: which base64 variant to use
>     46	 *
>     47	 * Encodes data using the selected Base64 variant.
>     48	 *
>     49	 * Return: the length of the resulting Base64-encoded string in bytes.
>     50	 */
>     51	int base64_encode(const u8 *src, int srclen, char *dst, bool padding, enum base64_variant variant)
>     52	{
>     53		u32 ac = 0;
>     54		int bits = 0;
>     55		int i;
>     56		char *cp = dst;
>     57		const char *base64_table = base64_tables[variant];
>     58	
>     59		for (i = 0; i < srclen; i++) {
>     60			ac = (ac << 8) | src[i];
>     61			bits += 8;
>     62			do {
>     63				bits -= 6;
>     64				*cp++ = base64_table[(ac >> bits) & 0x3f];
>     65			} while (bits >= 6);
>     66		}
>     67		if (bits) {
>     68			*cp++ = base64_table[(ac << (6 - bits)) & 0x3f];
>     69			bits -= 6;
>     70		}
>     71		if (padding) {
>     72			while (bits < 0) {
>     73				*cp++ = '=';
>     74				bits += 2;
>     75			}
>     76		}
>     77		return cp - dst;
>     78	}
>     79	EXPORT_SYMBOL_GPL(base64_encode);
>     80	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
