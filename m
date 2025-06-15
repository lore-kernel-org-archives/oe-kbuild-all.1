Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD56C1DE2CF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Jun 2025 08:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749975107; cv=none; b=Tti11JCSaO9ADRRrYmpCuB6SMg3ueTzV6w8spHaKNfMj9EZMu1Fu7xxrc85eIfvuM4ZoUFPEWpj6kLQKYoIFhjCDz18Cm6ZFrTYbSz9Ex1f+Gm0CSqJRPy8Du4C1SOhTlUEaXdL12dfxKZOkzGx9s6zPIlAKwfDstAcfuJeG8as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749975107; c=relaxed/simple;
	bh=9CazTd5wS+HK0yBoeUMtHxJDFiS9hWu7YYvjO0MyWcM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBBEXALnSVpfPzzowQaybxGo2Ryo/+drhmqzccgPKw0JiiQ/Jxt/p+iLe4KLtvxHlUfCuRbL031MsBsXrwDFeyTFzwO68bojJv53HAxbeYSgSVCTUztpuSKMu1JghfgS+3ky6scbaxJHjtStsuwJ9KdUkg/RsLQfBw/qHXc0fbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cu98QRSG; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cu98QRSG"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so2171305f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Jun 2025 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749975104; x=1750579904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQC1l4hed+jDjvcuzyYn26zmXocSEaoHbFMpdpPVTZE=;
        b=cu98QRSGC2hspRXgdwa2tKD2r/LcrWHeYQ+vXiNKwavOzVlR2jbuZwe/XPuNcIBOiR
         LjGDOy/Htk3YQBK2Tcj1rdR+UuJCpOKEN19a37UI2C8seTakQicA267roiuR1hmdk1u/
         sV/uqSPhctrn6qO7aPaj5ZhAKg+2zOWRs4KFmxYmcLdEn4ajECfoIRGN32KWAsp9gGmp
         vhCIPIbogI8rb4qeP5/11dJJnO9k4jRdFU/a1K0eniUev9PP05nGvAVhija776NbkBbB
         gk0tIqlEgfLkhs9NL5rup63mshSFUesry4U2/oNPn9/3ekD7a7BwEZ0tZI8UOeYcO8ag
         sTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749975104; x=1750579904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQC1l4hed+jDjvcuzyYn26zmXocSEaoHbFMpdpPVTZE=;
        b=Q8UuR+r6w7IqBruDC5+91bJysztli0t5QwnPwZ47KWSGw5gZU0rQqPhg2+X8cLPpEi
         QmcMpKpUMizQLz+FbJqIkGplZ3W1AhHHyjb1DVm303iJ+u1V4HuCz1iBuFXv6FHimcEr
         sGZrRczCA3LkQXaGVpgr0M+hvKZ2iXrsd5M/bH/wnw5YTnmdPdg9e9IF0raoHGmawFJP
         3YVRQSKZKapV7kNJKGxyfNwuSdXJUt1BDn6K0z6PQGEfOxbwy0AERlalAnpjaixkeQFB
         lEXVfAtJR01V9E93QXkUaEuj8Pn3+RW4JjdjkYhi9gyjm22ZsRsjOqLVOfCnBQlnZ11h
         WpAA==
X-Forwarded-Encrypted: i=1; AJvYcCWdfF2DufkML/qFO5AITHpyB85VTGpS81PMR9trJW54gBrFUwXWkMQ/hvZIpv9HYhELbIVBU2DCNvV+u1Vo@lists.linux.dev
X-Gm-Message-State: AOJu0YwvqO1aWkSJcd9xzUwPOWf2KxVs6JlHDVMGzSG/Tvz9lBIC9KoS
	3SsBf1H31W+s3HvrtpBzy9o4lpQR6hiNJMc+hRED7JfsmA3BNeriSYVe
X-Gm-Gg: ASbGncvNHjZ0xVNBueV/Z/BZ1uSSoiLTBd3GZTXY8DUclMgn6Q5TwSqWFmw8hJ7fwv4
	XINeZZoFvxiaQesO4Uj/D683e4oh8eGxWj7Y0FIaPzblBvDDXaLZ8zEC6hiQZq64lY6EdD6ia0T
	6je7HDzMRKI8Ma6H8gq4crMgw5h6ncSDFpaR1qqiI2USdMANdUvJMBAZ5GbP/X9RompMKawwyWC
	DPs8XqcxoKtYv13FcTeAjVXWcCwzPVaHRCG7ePgIyW6QBQGCue6NO2zellbrtTTDZL6YoUtXchz
	lgCs8rCGPZwtvC6SPE1MHpNxFRfRAjM148HmtirLkrcTAWYc/nLfT86h8QrkZ7Kr1/Q0rwFhrbG
	+X8VbIQD6R4p7e9vz/EmaONiZDKEDl1EL8Es=
X-Google-Smtp-Source: AGHT+IEt4MLx5qWRx8zxKdVal8i4gp60/oEWaofVvMwCZilpflG+8Y3YcJjDCPeWX2cDAdi54HxY8A==
X-Received: by 2002:a05:6000:188b:b0:3a4:ef0d:e614 with SMTP id ffacd0b85a97d-3a572e79d24mr4433375f8f.33.1749975103785;
        Sun, 15 Jun 2025 01:11:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a72cd3sm7231201f8f.32.2025.06.15.01.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 01:11:43 -0700 (PDT)
Date: Sun, 15 Jun 2025 09:11:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Alexander Potapenko
 <glider@google.com>
Subject: Re: mm/kmsan/hooks.c:269:14: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <20250615091142.3c9520d9@pumpkin>
In-Reply-To: <202506131242.qB8fUSlP-lkp@intel.com>
References: <202506131242.qB8fUSlP-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Jun 2025 12:28:55 +0800

Not directly related but...

....
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  267  	ua_flags = user_access_save();
> f926e9326f3a79 Ilya Leoshkevich    2024-06-21  268  	if (!IS_ENABLED(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE) ||
> f926e9326f3a79 Ilya Leoshkevich    2024-06-21 @269  	    (u64)to < TASK_SIZE) {
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  270  		/* This is a user memory access, check it. */
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  271  		kmsan_internal_check_memory((void *)from, to_copy - left, to,
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  272  					    REASON_COPY_TO_USER);
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  273  	} else {
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  274  		/* Otherwise this is a kernel memory access. This happens when a
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  275  		 * compat syscall passes an argument allocated on the kernel
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  276  		 * stack to a real syscall.
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  277  		 * Don't check anything, just copy the shadow of the copied
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  278  		 * bytes.
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  279  		 */

Isn't that comment just wrong?
Compat syscalls just don't do that any more.
They might have done it in the past before setfs(KERNEL_DS) got nuked.
So the 'else' clause can never happen and the test nuked.

So anything here is always 'user' (or will have failed access_ok()).
I think that also means the test can be done before the copy_to_user() itself
since, contrary to the earlier comment (trimmed) all of the kernel memory
that might be copied needs to have valid data.

(Unlike copy_from_user() when only the written part need to be marked
as containing valid data.)

	David

> 75cf0290271bf6 Alexander Potapenko 2022-09-15  280  		kmsan_internal_memmove_metadata((void *)to, (void *)from,
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  281  						to_copy - left);
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  282  	}
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  283  	user_access_restore(ua_flags);
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  284  }
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  285  EXPORT_SYMBOL(kmsan_copy_to_user);
> 75cf0290271bf6 Alexander Potapenko 2022-09-15  286  
> 
> :::::: The code at line 269 was first introduced by commit
> :::::: f926e9326f3a79f7e01ac790e2361f44d8ca8320 kmsan: fix kmsan_copy_to_user() on arches with overlapping address spaces
> 
> :::::: TO: Ilya Leoshkevich <iii@linux.ibm.com>
> :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> 

