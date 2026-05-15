Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1729C38736C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 19:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872065; cv=pass; b=P5FHBZnLx5mMn3OfdWtvDagig/2MY6cDRbpL5WQ88RPPUnoj/IIif3iYRGvvpwS6sdEL4ZWuGv2j+MTCYGzqXuAKYtk1FIBtJMdTEuAtVsMArNeJdVvFvjJs9u9NDJq1Xsq/ubW6aYkrAmW3kG4cfMP/kjtXowrSTfcbZfmJtNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872065; c=relaxed/simple;
	bh=mb1275eXwJqneXc4dEDy2KyI4gv+gxxbGFakf7VbqpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gl+3DFluZmCMNE6l65rUnEXHWp53dmmjxIgZZbVmlvpqV7kmGzs2d4FP3kcnFyVNQN1Lj/pdCuWmvf0YkTKCW2Icyql5I+4867zjUUXx8ydVc2MSY0JzTONjT/Yk+REXQQl14J0Uvw7UFpRDQ4US9WZmrvtomObgcLwh0+N1evo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaenJaKF; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaenJaKF"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-130a1776581so12710c88.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 12:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778872063; cv=none;
        d=google.com; s=arc-20240605;
        b=Pe2FJWZFCBtQHyWU5TEp7BQ/k2Djskdry6TQZZsZIpZqir3rnOuJYCFMgzR1uT6ph7
         s3f2y+pdVChrktOoJGfM4pEcJOJpqB9oEZcwqjKsS974INSQ/Z8AWTdQuHq5pkdKrIxM
         8g8ew84LjeUashUg3rs54yuxa2cEdaDS6syS3u9IQwYbykwrtidvPmLOsqhPOYX2QKbZ
         7AMbUwY3SSPl6s2w7atwZCMJ0QPV+z8GHzf2ZgcBunJcFeiH3NumTeJTn4EmcawB8MIV
         LRSDCJTCcHLF7+v2miK61Bb5llsHJGjd40Xq2zQQb4xVmFRvfk42ed7bZIIb6s2Yr29q
         eh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mb1275eXwJqneXc4dEDy2KyI4gv+gxxbGFakf7VbqpA=;
        fh=N7KStN2g/vrzMlsZ5eaQmXpGXtUdCqsFnS7AvKNlQTY=;
        b=SOTXzt7+Ek1Ly/NKuOptF0NzXSTfIchNDuffFPYWMHj6Sb4ZJI0u2DS2s+PW+RgP5S
         lOaM7sKWry+txMQHZ6cIei5qR6bo0io8kPuf343mjmRJsPv5SSplnjvmcT6RXopqoMBX
         +15zV5tSyhH5XetttgDY+vWWmAmNTMEeVYxVXKnNOcHJFpHGRXLBD1gtd16SZVoeBE99
         9eSlpK/Ma6BMinlC2Rhd9zv1WJ3jbAXioRJUEfdl+JbPryE1zUQGdQucB3cmSjnTXH0n
         ix9QHx5nZWX9qqFBplvoQfwBFJjKEtgrEAqesueqrmEmVxWwvn4w8Om96KmN1QcZIV8N
         ZF+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778872063; x=1779476863; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mb1275eXwJqneXc4dEDy2KyI4gv+gxxbGFakf7VbqpA=;
        b=VaenJaKFz1i/wII0apK2cUpp62sTj87dmUncFzUrIkzqQTp5MBy5YaqUB98VUKI3Iv
         LOHnNXmQEZCFBUIxoHPPojlHYQ06zEZzhVOmw/6xP4M+TlE0p8nJ8ku4rppgV1P/fJ9x
         ipueVV84xDCRcfe1uIXH56Fr5TiyURKqksXQtP787/9gXf/EsG7GP+VF3ZPXA2wIADre
         cyM+N/SLofRadZzMTNSGZjhH6XETbKNU4OFEPmVoeXb/pXfJYd8ZVRqu+WGc6jN3lwc5
         ylnPfvxOSZvuWniKrG6bpsBilX1q83sbJG8JB1QGt3DxbFGUEP1yFRomC1efcbwZCvFT
         6Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872063; x=1779476863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mb1275eXwJqneXc4dEDy2KyI4gv+gxxbGFakf7VbqpA=;
        b=FFfOm4B1fdYtNy5HYLDPJZbbmz8ORoIElN/NU4qRxMrF9Q7amZm/ruLONbWxkfxg/M
         UjNlQ+FOzeKx+R2TizHrQGG2K+DCcjRCcBISAj8430bOa2Lt9RE3pjWR0aaOY7DYF3x7
         scex9q5HhOvdJYztr4XrEl3Af9sKzmcU45K9Ey1mpWmWAJGwb3DHyTC0j52SfS+NsXNq
         PxbU7rgszej40g4/3vjJxyVL9BAla6Ot+UFLkYuMMAqPsIFGoiiy18pGXVRku5Ijdyhy
         0+kS0AunJJ77/TEquuIL669cq2swIzqTLc1HNW6XpvHlkO8tNwmpXl7L4nuAhjYESfWT
         uVNw==
X-Forwarded-Encrypted: i=1; AFNElJ8KcMbJv5XrfwDzKaNYXFS3ixhrRbwYAkQ6mCqwQ3ucvgtIFR9Y2YnGO7rO7ETrbsVV4T0MtJ7bvZisfBRq@lists.linux.dev
X-Gm-Message-State: AOJu0YyTa5rY3Zl1/zBhqaoMUoDEx36xPxNLz+uf44/VxPgukMrbeBY5
	8at2nFs7T3ADR2NBYbemxqz+xZ3t5lJiy6bS7pUG7p6px0LHLcgcGmPAyzadzaDGWHeFtebQaLq
	VfOSx/+7yTdUtdKnAyVOavzxIwegl2rM=
X-Gm-Gg: Acq92OFf8/SRNFX+LpY0h41lDrSlAiVBSenWU/S0Tk8hSgwRxQHpy0YhAfnVaYOVB9+
	jQJ/Z4J7HRlITXyo58JckbSuTIE8LCV06JPdX/C7itn6aB84tYq/hPymHy3NSuF1yue/04pRIBo
	NysUOhF+uyMxkE0TFDm1NvhjN9TlUW9pjdUVhwbYjKODx2DU14ppS6ReNE4N47JSN8OzimkweQG
	+LcZ7n47DA010jUlCNguYYOts3idVvw039nNlV7BikO9W/6+ruOXLduQgF8i0s/oMcjN9Zn3Vth
	vRHpvqqRNLEh1kn62b2pC8lJA4b8hhxgTMA0ZySpL1AzyZW5UvFfZfW6VVY0N45PnP0qignqhU6
	U566vywUNqcA1rYtriC2nlaw=
X-Received: by 2002:a05:7301:6785:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-30398176f35mr1270947eec.2.1778872063122; Fri, 15 May 2026
 12:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACeWta-RVTqcmLVmLTJ7yLrStjrLEyL_oYpG8QLAcy7sEyKmCA@mail.gmail.com>
In-Reply-To: <CACeWta-RVTqcmLVmLTJ7yLrStjrLEyL_oYpG8QLAcy7sEyKmCA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 15 May 2026 21:07:30 +0200
X-Gm-Features: AVHnY4LEIX3vOzKlV2ckoEdFUoIObrLviqRMWlwHLjWbRjHNlz5QC0VlkWAildI
Message-ID: <CANiq72kVzYdu+74M-VNSRgq53n201qjoOaua1K5S4abDqrsn=w@mail.gmail.com>
Subject: Re: [PATCH] rust: cred: add safe abstractions for capable() and ns_capable()
To: Arnav Sharma <arnav4324@gmail.com>
Cc: lkp@intel.com, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	Benno Lossin <lossin@kernel.org>, oe-kbuild-all@lists.linux.dev, ojeda@kernel.org, 
	paul@paul-moore.com, rust-for-linux@vger.kernel.org, 
	Serge Hallyn <sergeh@kernel.org>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 7:13=E2=80=AFPM Arnav Sharma <arnav4324@gmail.com> =
wrote:
>
> I don't have an immediate in-tree use case for this. I'm fairly new to ke=
rnel development and was going through the existing Rust-for-Linux abstract=
ions. I noticed that capable() and ns_capable() had no safe Rust wrappers a=
nd attempted to fill that gap =E2=80=94 I was approaching it more from a "H=
mm.. this seems missing" angle rather than "Do we even need it". I understa=
nd now that abstractions need concrete users to justify their inclusion, an=
d I'll keep that in mind going forward.

Yeah, in general, all kernel code needs a user, i.e. a justification
for it to be added (i.e. it is a general rule, not just for Rust
abstractions).

Please see https://rust-for-linux.com/contributing#submitting-new-abstracti=
ons-and-modules
for some more details.

(By the way, your email uses HTML, so it may not reach the mailing
list. Please use plain text instead.)

Cheers,
Miguel
