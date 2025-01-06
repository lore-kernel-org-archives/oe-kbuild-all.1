Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF46C1D5ADD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 11:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736164198; cv=none; b=drM68dV3GC2JKHweuMw9Swj3L282DnqTLa15TJ9xque9sDy9tmb/AWebTs/Wq51slZHUT2LdY3zIkhK5IAPXjinQaDQKKh6kyHWe4N0OJ9nMgjEL9XewBhTKvYw5hUfVZQaoUirhR4Qa/LbN0Bm+Gfy91xgXqTZXO3QMowspcmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736164198; c=relaxed/simple;
	bh=4Rw2FXcuLyDvbB4yWFIF9m7FpWxwGc+koiL03Ib+BQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6FWjUYOVKemFYIBUt9fx50+29sj/8KQ2aBQHMa+RAWiuwbHXTZdixhq3be5chgxTpwQbKiZB1TEpo3+hMbpKwlJsRFrigYT4h4TslJ8sHzdfoDTshKzOYDUj36k9cAwjx+Es/QcbisxIuKkCYmoujAgrCzxYkS9TexUzJgUeJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aTD9KwSD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aTD9KwSD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e06af753so7143391f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 03:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736164195; x=1736768995; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Rw2FXcuLyDvbB4yWFIF9m7FpWxwGc+koiL03Ib+BQY=;
        b=aTD9KwSDdbOGNOmnnzuk1RU5/Qs8YV7HnoA+q+dbNnvAlGVT6lasMV7q4W0FMCYk0r
         Z1WCb7JTN3n/NurArV+gBTBEu8N0rt442J1YpTo2s1QlN5fDzvshtLK6rIRwv6qJaRJh
         q67npCt5SEuXNVJBjw0mN9r2u84ltT5GRCIIWfqPpTKvbSD024SWSvMLJC8bBbVrnrGY
         kjzVRQHOB6hqji/Z68h+gXLMh9nBoZ8++Il7XkhIu4ddCzLOlFG7BJ8tpbQi9Lh4EVyp
         B0z5gwBwTPlye1pwbB5rQzEJpULXD3jrJW49//FrcdsQYpUiOCOvRLWVbjGkUqL5NBzH
         zm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736164195; x=1736768995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Rw2FXcuLyDvbB4yWFIF9m7FpWxwGc+koiL03Ib+BQY=;
        b=DyTL8ah77UlhnjTg4H72mmUCc/JJsyK65/LyJ/1FRn6G/PPrcftHjJmtUkEygeyPEk
         3bNPmjQosX3vZfYeqqX8Yjy5OtiY+0U5CesIBm6HcHZiG6ZFBiUiHT6Kosp9gYeRtl5r
         saEw/832KaFmHvfOuBK5lWAtLP4XOHDazYLglgWcBdY2Uo0eT2Hk75hym5FGX1+A8S/e
         y/W5wvDb6sp7Jg4EzI/83Eeoo4WuPGOYA+qwpO+yZKKwKhqp8ib1lSiAZu4gWYRKR1wC
         qdQCQqjFuRpSOVP1R459/Y4fNkS6JBFzSzdKdUTo3ehHLKqLnIRyn6jA4jzqd9KJg7+s
         trZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQc0uWH8plmHstax8pZLSQ1oSGWP6mtUJACAIPKSIuHytHAMYEAwjX4Rgy+jqVaZU1X+f9fiBWMaO4kaO9@lists.linux.dev
X-Gm-Message-State: AOJu0YwZdFX0RLPHygzIIj2/vLwiMBL9lJs+0Zej7k8VhD6TXCSw3Lc6
	TBfNMcpPeG/usrFEo6qShgxQ6D7xYcgK1UEeyTJi7FF/up3qoh50O3W27izuBY/QD2ENQopXmoL
	6T5jASkdRelpJRU7LzS4rI9+nNxzoRaDb9kJq
X-Gm-Gg: ASbGncuzLJ/9bpOUSjZFNAz5V5Jf9oQlqG+lXddYixpsdbzn/hlomX5jJnF6S7ISy+W
	TcBDKNjFfqpinlOVAO8+RBqiK6afYzfTcRFn61mHaD59D9wlJsm1lAh3GYSCP0pgTUbgW
X-Google-Smtp-Source: AGHT+IFTVwCtZdYxRH3gg2J8q1c0et3XC3IEuJFb8eqipTN8aLBnWtMWzAE37+Ba+8Z+XBOu21Ozobzo0Pb/UQtiCH4=
X-Received: by 2002:a5d:47cf:0:b0:385:ee59:44eb with SMTP id
 ffacd0b85a97d-38a221fa9ffmr47376443f8f.33.1736164195277; Mon, 06 Jan 2025
 03:49:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412311507.14xdiaIX-lkp@intel.com> <Z3OyANq7fAkCs+Qi@rli9-mobl>
In-Reply-To: <Z3OyANq7fAkCs+Qi@rli9-mobl>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Jan 2025 12:49:43 +0100
Message-ID: <CAH5fLghNqbu2LO6SMr2Nsciji5k01tagaAEMZQ-WKJ8b9E56hg@mail.gmail.com>
Subject: Re: error[E0425]: cannot find value `__tracepoint_rust_sample_loaded`
 in crate `$crate::bindings`
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2024 at 9:58=E2=80=AFAM Philip Li <philip.li@intel.com> wro=
te:
>
> On Tue, Dec 31, 2024 at 03:15:47PM +0800, kernel test robot wrote:
> > Hi Alice,
> >
> > FYI, the error/warning still remains.
>
> Kindly ignore this report, which had already been discussed in [1]
>
> [1] https://lore.kernel.org/oe-kbuild-all/CAH5fLggEzmerC6Qg1fjuc_wiy21BJQ=
GGYdZSZA+KV=3DoP6q9iJg@mail.gmail.com/

Would it be possible to upgrade bindgen used by this robot? Please see:
https://lore.kernel.org/all/CAH5fLgjmtuZ7Sxp49GoGC079sXqS4wmsEmZKM-T4Mh9Fyc=
DYGQ@mail.gmail.com/

Alice
