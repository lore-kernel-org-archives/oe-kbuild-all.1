Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441CF3AD508
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 07:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773299836; cv=pass; b=VpPX+qR3KYkRRHGUrlUisoO8pXGUzhEMCTmoCzJTIgXoaYtAOLf6nj4pjMhJlOceqMqmXoCMAM1gkfyWTxEhYIQbnGC9XjVPXSt50qP5P5L0NSGRaaLziXlk0VQ1AO4t3bJBNxM8dIM+/a7oV7/14xZHm5uLHes759ZCdbANa48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773299836; c=relaxed/simple;
	bh=GVVWkZinbvu+CdqWgWewr2jXtUw5zAnWEAj+UByDKzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkAJiKwl5Cjjjha6Q+QdIT3jMBptnv/1GF/Ijy33ImPi7Yfyz3USF1HICbhJsF7d7G8TrDXTLTTFmHUX09t+D2jFuzmjI6yQSbo7TBkzbbHThGpluv8MAwitGhhP8Cv7IdQjoyF9vRW6ql7vE4w8fr1+2pdirXJVWKuiWgZ7dLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REwa2hvs; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REwa2hvs"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b8095668ebso17602eec.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 00:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773299834; cv=none;
        d=google.com; s=arc-20240605;
        b=VgNVCPKPXNkqVHMiwq8Qjaz520ThoGikAa2Me10ITYwRppogumPRPWkUuvOKeyIHSo
         vEee+UieRMuY6ErBeKZxa4+giqVj2MCGOKvNuYni85+InQ0WS4FI+lZPC9VtNQdBWLbU
         NYLEh2vE81nemjkOi8UFWqvpGBc69+kDmCbdkk2Uk6iU2cxIrW0HFiuY+2USeZ5limCD
         H4/jlMJIMf3cqmm1f/ikGE1czCjCDE07/91O+/qji+mBMEsePaleq+vB+8hC2nPFoKim
         n9rov4JQiWXyktOPZy4zmJKPLhIckNC2lAW5uky63dfHkCWcln6YfzmuuKjmycFRH+8Z
         QIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fijcrm1C28H+gJhNiH167ZaI51N9KFHbWWWA7M7NLpI=;
        fh=PhwgVgshHwnygFoTFoNsMTU0/lwigexFCqUpZGIHmjk=;
        b=HPjZPjYNzJCCxntnVKQqZLAm0HCna+Y9XHibsgWHXlccSoU4XhkaCRH62MpIckwAel
         xW6gK9a3GUxAx3lzL0mrfUWNfZxICviy4HB+h6901CmKxToMamDSeq9H4kvXiNdo8ToC
         SDOYdfxl6vCwpwthpd6kal3u86zpmrgAvrykLq/9IvqNPiP1Rvz0BFGmLYhN49qddRvu
         8EXnzR/kYXXYm/m26ct6dEutySmAklO0rBRt6Y7/5HGxEADWPi5dpTjGgplbOv8AJe+U
         XcfR8cDIIWF/C7KjaXcJICeGUnkKYWtpjASo8vK0FkvB2UkOyAgQUZfQbveEAR37RJXs
         tNAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773299834; x=1773904634; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fijcrm1C28H+gJhNiH167ZaI51N9KFHbWWWA7M7NLpI=;
        b=REwa2hvsiZ8u9r2GjlnbvJczFK1sLBOVJEMSBYk5AyId0ViICA1bFuyZgEno0xr5Cr
         4D29APrxkZHZ0kIasjW2RAvhv1HHRlAoHwjEae8lXUXKwpwC9OJs6QKU/0Vz5UIRR5//
         CDhLWIZiPQPWnQbTkHZNtTC+8qr1smHXNIiuejJRGxMlyPhiGgAuM0au2IxlKQLhMnMF
         rV3FFZk1JBupVEh8eYhTWwACW+Ae10vu/hbHqVdg4EHQ9w+u1oRtbY7/ds1Fzmox6tQA
         dxtyZzmoNGA7X5RIaoFKaVg/CP93/qrfoBG0FXswsdgMZ9hYejX2inp/yOmjDEy4/5+5
         6tJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773299834; x=1773904634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fijcrm1C28H+gJhNiH167ZaI51N9KFHbWWWA7M7NLpI=;
        b=S+ktCj1VN5zfy9+OPGbQqBXqqbggqYeUrEbIEK53uUBBT77tSevgOBjEaBZvMcTxgL
         Xp2YiHr9ZgLbyUWzAE4qcBq1CLQEO+sHF4aSbJ3GzZTdKdS6qzmQsqJ0amBjIZmyXJ6u
         D5U5mOF8w7feKPdv3zsZkPElcF7PuACqP+WzDrU+QqnI1nON+ouPQEnZonG7nINgDWb8
         o4czHrJxkluTzDNrtue8/YgE8zzc7ECp/RRg3Bij99TZFaZZBIj9cwnneE/khcjDncJT
         b+zn+lUWMj92JFia95dPIstChxIfqiUDDcfLxuw53cgBvCaLr82vPVyQ+ywmQcf0ehYi
         58mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTVHjcpvr1+anYaZ/2ABKtikg+35WsG7hcC8VURUv4L94cozpPmDzSLw3Uhm71akEOj+OggDfSv1A68lbw@lists.linux.dev
X-Gm-Message-State: AOJu0YxuFj2clVZF6ye6iZlD/bFeDy98C0acq1OKIHtps5Tu8Q5wY41U
	fE1Hp71A770ZNThC5aLt2HDWkz4BpsKT32bNjTUq6gUafvbwy7oCZuft2Ufeay7fVBy/bl1TpLd
	jIRhT9jKT2rpUxeEk3qfc8w5zGZudOpk=
X-Gm-Gg: ATEYQzzz1Uz87Mj2Rw3dIE3q7THS8Bwm8ikhDz5eycj8Ch8HII6IjnYG6PokR4BOqUV
	rzOVf3psRrlJGXRHZ7GKX5Rw71wI3syA8RRcy81xrd8B/97kgxkDC6jFILahWnIfvb59I3cfU8L
	fvL2uclKpFQVwmvWmeZDTmvoJhU5Vhg4yULtB5QTu7e8DPZiMP2TbRL4ITunycuMqcmYIxhshlK
	He3BRiAqBc+BBjXqKD/ow0Wq9R9p6RwOAN9mZ6MmsDbiAPzmxVDymc2kqbEB9otH1qSTzrPz0s9
	Avcs9LxkcJ2zQmw6zbtujXLdf1c/7C+AVR3qI/u6nofglJG9y1pv5E9hEvS7gXpV/+sSrjYRfc2
	tUe6g+cxzuZW78LYzz6umTMA=
X-Received: by 2002:a05:7301:2b06:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2be99958a2bmr259221eec.1.1773299834239; Thu, 12 Mar 2026
 00:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603120016.x0Fm70Gw-lkp@intel.com> <DH09SQNRVQP3.1CA7359P8IZ66@kernel.org>
In-Reply-To: <DH09SQNRVQP3.1CA7359P8IZ66@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 08:17:01 +0100
X-Gm-Features: AaiRm50xyWOxS2FP3vtgiS0mz-Qzix7ALRCB2dgQaT299nMv1TFjao8Jom99ci8
Message-ID: <CANiq72kp9hYU4LLOHHhQWd5sgsGvQSXH7XnDuNnfWiZwDKYX3Q@mail.gmail.com>
Subject: Re: vmlinux.o: warning: objtool: _RINvMs0_NvNtNtCshc5sK6KjdJJ_6kernel4sync4lock1__INtB6_12___ThePinDataINtNtNtBc_5alloc4kvec3VecINtNtCsbsbRiabPlh9_4core3pin3PinINtNtB1a_4kbox3BoxINtNtBc_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataENtNtB1a_9...
To: Benno Lossin <lossin@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 10:28=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>
> @Miguel, do you know if this is pin-init/syn specific? I don't think
> the syn rewrite should result in a difference like this.

It doesn't look like it, no.

The config has `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy` plus doctests enabled,
so my first guess is that this seems to be a variant of:

  https://lore.kernel.org/rust-for-linux/20251201021659.1729308-1-ojeda@ker=
nel.org/

Cheers,
Miguel
