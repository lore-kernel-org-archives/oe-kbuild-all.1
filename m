Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807F7F9D9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 04:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756701039; cv=none; b=WDduC2anp7s2ENlJYkyr/pfVC+mtAzXc3qlhyhK9Dhd7VtjWSSk74VzlqjYfsVDLycYsu28OzKMa7MX9EupNARZBn6dr6RPO3L30qTQYetTcsXqSpYhUvqttkwSgo915j3A5RE3gsAMH08K+tI4vyP7uXWlni4VcqDDFH3F3eA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756701039; c=relaxed/simple;
	bh=pSzCqOyvvoq5Jt9kSV5uDNs9QJ567H1LEks3EmaQerM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5uFB+Wt6LMC6wvxAJHBVCs5ZGwiWVtfDd95vpM7Ruqij2mvOgsBicpO+myzCRiovKI74Tonq88J3icuGQIslEVqW4om2eeQmZ25Pi7ERvRE4sNjc1gkXPVq/ca872SbW0xQv5g0wqj9ou925GOf32C0QU34F8///1qQH+uAbpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=NmpTKA+g; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="NmpTKA+g"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0428b537e5so90850066b.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Aug 2025 21:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1756701036; x=1757305836; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDQIe0i3X76egFX6529AeV7wfu/j7t3pxfvYUfSQIbM=;
        b=NmpTKA+gB2W8Bc/FHBw4qFyLD1aMM5GP/JYSK8UhNTnc4b8qOXTIP6MwQGmdO8rZUy
         2KSmjagD7VHqs2Zlcnxgz2owW2omj087WAHxMrpkxDG5GIHMfjOh29CEciSFgA7sVax9
         uf6FQydUHCD7KZtgo98ODaEuL+a6Rx2sZIpIa1vDUpLjhZ9heciH3xn9mGXldLr2lOZ5
         pN/GSMH3HMe0jt+rBRmzruBRB72xyFIUnJchv6XV53HJFfINIOAtpRPgyqM97gAuR3sw
         i0HDdjal2zrZp8IeX22nOueFxXQmS2v5t0JOJw1cVXMhIEgYIWdeWlmPDqFYW0935ulG
         p1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756701036; x=1757305836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDQIe0i3X76egFX6529AeV7wfu/j7t3pxfvYUfSQIbM=;
        b=pbZLF4Jt06kanpmVLuIm5qvlKAHzH6LltwNUtNFSBNBDEOALX70/PAMTuJzdajm/JF
         8Z3ICDH7N8VAyTu1PUOcSYQnzhv1R9tapmyhBK0EMi0lt9F+tyf7BfPVLXWFlSnau4pE
         0g48atbCPRcuEDRlOtY2gU81cf0yvmRb4YEopkIMQYprCiHXPA8MtQIt4itZPgrs2U6a
         RM1yZngAHKsEdu91sQfWSQ53g6hPJG5nV0Ijn3d1/SroONt4t0B0oJu0txACTIt2nKhx
         hQbLfxVNh8ShLLLcgJbcqAehplFsnoLXvinDu4MQHxL07xXvAXWPyKKtJuKV2O1vE45+
         QB4A==
X-Forwarded-Encrypted: i=1; AJvYcCWLyFGTGCc20Zh+Ng7Shj3bd2pI38Rr4JbAt0mHPehfxcSww4uONw53jaUJIIYhsk8GESwU7+5KXQ+ZNB0D@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo5DZl0l0A4etb5dDZCPdCNXMx0LD0VsWZB3AnZmMTLeGOfIpc
	KIA8LFNpyDrYJbSr7iLNI1odk/seyn1nJGxhhUM7oXBv9Kbfjp5wxdYCjHtvmccEmDvm6WIWGG7
	zH0XONoBD0kFwlUfVWNp1xPj5wIkSBC8kF95dufGrrg==
X-Gm-Gg: ASbGncuugNcd3yyRzMH2AYeKMcCcay8vJL+4JBSFEpX+zgDiNSdSstBpJe849hLXvJZ
	xTwSlVXjFVt6OLUApDa8ZB17i3m4OCS/n7dlbLO6HzFaNy5Xv5HjOH57UZ9/xNj6GgFVxbNoJNK
	olRgZaqMNKmtpLrgqt4CnJAf9qdWovjtZbCu7ptd7BhogKky4CfjuUyDJ4v6IxbTvvbX1eXaH/J
	eMH6Pk4cNGgIWpzAvTdXLyn5wabx89li4rneJuqs9lnqg==
X-Google-Smtp-Source: AGHT+IGfZ9IK7/pUtfeHc6DgLv6HZzhwz9kNk2kkDLAQy9Iwa65qh4E0Ue47kA3UHq9LU15ooN9UNEALddPaiQniOhA=
X-Received: by 2002:a17:907:3f10:b0:af6:2f1d:a73f with SMTP id
 a640c23a62f3a-b01d976e782mr648284266b.53.1756701035779; Sun, 31 Aug 2025
 21:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250831093918.2815332-9-max.kellermann@ionos.com> <202509010724.bSPPSD1X-lkp@intel.com>
In-Reply-To: <202509010724.bSPPSD1X-lkp@intel.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 1 Sep 2025 06:30:24 +0200
X-Gm-Features: Ac12FXx1zNxU809yDaeQgGpOMM6Li-1LYjsJkwZ1JPL5dRiRDC0y6VWcjO3jTXw
Message-ID: <CAKPOu+_7w9kd7aOp2J2YtYMDbrV1pfrdUT-CnPmHfexGb7RScg@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] arch, mm/util: add const to arch_pick_mmap_layout()
 parameter
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, david@redhat.com, axelrasmussen@google.com, 
	yuanchu@google.com, willy@infradead.org, hughd@google.com, mhocko@suse.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	vishal.moola@gmail.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 1:44=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
> All errors (new ones prefixed by >>):
>
> >> arch/sparc/kernel/sys_sparc_64.c:1:1: error: unknown type name 'ickj'
>        1 | ickj// SPDX-License-Identifier: GPL-2.0
>          | ^

Oops how did that slip in here...
