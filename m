Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCC721A45B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797928; cv=none; b=g77Q/i9K79WCkiNBEHcqFaQq/jbqnlpP2kl2918MilDVDuOw6zFJPO9GBENYHbjrJiilL8/BMVxYk+VcVKTlG8TqeR312vgAgLLo2E2ch/cd7L3qai6Fnm42AEdMVa628N4Y+KhS+p29UjBB8LNIAHjp7lpl7PyujkoTXia7b44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797928; c=relaxed/simple;
	bh=MRAFcY9ayAng/g+VDNI+8agAhkl6MiiLqZ85TtSKkcc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eu8zDDxwo2JNJuFgUdMmIN7UWWpgktbWYdEyesuR5FhbHlT91iJHWTq3D/j+n/WsZqEwDTvY4RKMNvkP73MYshAMQZmBOrxg01gKm2THywLQDMfx0u/KkykGDEHvB+57IP2IWTr+l7KL3G9QCux1EHFGgK6OXTI8eOlNEl9WLdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmHwRnTK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmHwRnTK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f2f748128so1332062f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 05:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739797925; x=1740402725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dbv6tZxsXHhtGn9KFBS5fucmEZ2CZu7fW3YyX0NKPZI=;
        b=nmHwRnTKBM3PyVa5N0I8uyaTwHfb7z3h/ChrPiS+UMsAt+X3lhuaACN8aPFigHEtTN
         nkbQYNjKy9O6COKnhYBT/3wt9GnpVjzSS88djMiW1EG1zG9HX7/Rz6ixd6TUsTY08PgW
         0oKMlOnBsHNIXvmtOMQYkDPRZveRk9xP+r4ZO6xR2Wl2oStlU284uaDCTeSDjn4gpN19
         udW9NP0JvTYfKMTADhPOUGwya5M8rWo+mIXzMSMWGu0C4y0rILkTGSVZkJ/c4++og4sI
         CoDqQsJyt05/fZQ5O2fGkXVflOYd+3p+W5rF1Gw0Aq6L/XUAAAIf/6HDr3PPZX487jaa
         py0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739797925; x=1740402725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dbv6tZxsXHhtGn9KFBS5fucmEZ2CZu7fW3YyX0NKPZI=;
        b=YJO9qwxiiICAuEqJEAC+G1jS3tUjW5qQyzHf/7HuxBcqaXIQe5ks3C4V5D1AL7tyGB
         1/FVv4itEvTK7/6e79NRibFkkbY7ZbAK06nNGl1yadQimoN5f3GpFo9sMFgGAmf6YeT2
         OjU5ACz7Qf2UX21MwwQomrtBL1JFfiNFKwaeYORMTf+2VB4WH1+udrlN72KMAJg+PRgP
         7lgoqSxbkz7A2kw4L4lkfyCop9oc8/VKmjhwvOqWO6sZJg/h/Buw9DPgH1L1nCyoqPO+
         QPCWuY/xw3B97atDTEfuzcdfOnzilddZVSgzyIWCbqsik2pcft1sHPQS9MOeVuI/CbD/
         laQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3IE2d9hK4CYzZjecq13ddBsdlDY8cJy/B9aLAyjZIZ+tG93v9rfM5Ra2O0I8TL/+WISj42vYYfBFUSoDE@lists.linux.dev
X-Gm-Message-State: AOJu0YxgxEIVJUGDXTf1uIJt5a3S3/61BBYRJ/H7019X2cHJj+WJMIM/
	5BR13YbFbG6wH866DeTWKrTod+hBT7EQ9BVr5QHGTFUo4lVBIson
X-Gm-Gg: ASbGncso0rWHXnFSSsAI2qQ8yH9ZtJyZKfZ/eBPdG9/XtrtXwr+edVv5LycwRFZU4OY
	VFn3g3yAHQxSejzaYgtlxZEnUwqcv/hSCm/L0DmCTt9jL5SMs3DJwIlW58HEDpoFMYoFKKJk77t
	rP4euPcqNsoXcVXvYJ+8j8hFUN9wDXoQ0Ao55y14orM8WShD8Pe0tfPvxD4/Y0U1CIFetCs+DM4
	YNCHESR1gfGd+lFG8XMdkeEZi78rMAGNvDdbyH+gTu/71V0CbbM/bJtls+9zKMbt8dnDt12nhgL
	4Y1NI86oTa2uBYkbS4CasrlkfBW2uWV/1u+pMrXNSKVi+/VnqPuOjw==
X-Google-Smtp-Source: AGHT+IGI8Y+1gHpNEIL5sYVZymnBYx2kGRoduPMaxMSQCJyc4mjJ84MG14TVAegnNK2lJjDu/Lbf2Q==
X-Received: by 2002:a5d:59a7:0:b0:38f:3224:6615 with SMTP id ffacd0b85a97d-38f33f374bcmr8372027f8f.7.1739797924909;
        Mon, 17 Feb 2025 05:12:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f85c2sm12639181f8f.91.2025.02.17.05.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 05:12:04 -0800 (PST)
Date: Mon, 17 Feb 2025 13:12:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Christoph Hellwig <hch@lst.de>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Carlos
 Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: Re: fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x'
 is never less than zero.
Message-ID: <20250217131203.2657cc4b@pumpkin>
In-Reply-To: <a14347d2-6189-49bc-a1cc-e5959e76e6c2@ghiti.fr>
References: <202502171326.j4Xd3I0j-lkp@intel.com>
	<20250217092445.GA29568@lst.de>
	<a14347d2-6189-49bc-a1cc-e5959e76e6c2@ghiti.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Feb 2025 13:06:49 +0100
Alexandre Ghiti <alex@ghiti.fr> wrote:

> Hi Christoph,
>=20
> On 17/02/2025 10:24, Christoph Hellwig wrote:
> > On Mon, Feb 17, 2025 at 01:53:08PM +0800, kernel test robot wrote: =20
> >> New smatch warnings:
> >> fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x' is neve=
r less than zero. =20
> > Looks like this is an issue in the riscv virt_to_page implementation
> > which also shows up in various other places.  Any chance this could get
> > fixed in the riscv code? =20
>=20
>=20
> To me, the only test that could give rise to this warning is the last=20
> part of:
>=20
> #define is_linear_mapping(x) \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((x) >=3D PAGE_OFFSET && (!IS=
_ENABLED(CONFIG_64BIT) || (x) <=20
> PAGE_OFFSET + KERN_VIRT_SIZE))
>=20
> But given that the config is a 32-bit config, it should not be evaluated=
=20
> at all.
>=20
> Could that be a false-positive and then an issue in smatch?

Why is smatch even looking.
The equivalent check in gcc has been moved to -W2 because of all false posi=
tives.

	David
