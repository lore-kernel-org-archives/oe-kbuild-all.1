Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EBF3876C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773441571; cv=pass; b=gLvU+U5zngWXQGPoyWjqCV8XQdcTTHal5Q3rNxLRqPypsxmL2Ty9MUstY1Np5C9zovReMvJ+McSZGvkxpPyEJphW1912o6XnVKvrlv8FJf+aNDs4wZjZdc4ic4q7p4rsigIBXY4Y0hljgO5kJXAomCbWKW3b/idR9Rmtap8XiF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773441571; c=relaxed/simple;
	bh=1MXpnJgNd9wve0xok691+KsLsOIVO5aHkrdME7CbtZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Up9VeNYCqBe8CEZTABDAZWnsv9lGaQ8I1WtSh7qDE6jkw/F+z5qwjGTf8yYsU/xaEuCHgGAcdYYO+iO+EBPs+jd13J4+Kejt1V0PxRzGV2P7zJbpVhlkqLHdE0+FFPxeN+w98UMv532yU7RZCffipxd6onqKotmTW3x0j9pQXbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEWWe4PI; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEWWe4PI"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-128eb45835cso82657c88.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 15:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773441567; cv=none;
        d=google.com; s=arc-20240605;
        b=YU+strE/Qh0cVdtWUmiexW0KDmovT0akawj3PjD5EDIXkLwG/gcHsN7AbUYSanSHcB
         8XsZ8OW+y4ESrwAvijudDCLcKti9fWN0RCrD5Cfae7+ZA7koJ1ccLqXaz6Dm2QCEaYt/
         mPCoQN/B9WEvkJOSq2akVjuWSjdnymq+sRIh5EbVXdXrCz9awKOib4hbt0XEN7Sk2qy9
         RaZeuTQ9srXznoeF0WLBUrJc60lM6gdSpCuENPRompdGGUO/8wZ3ho0P1LGSKHL3nxAP
         3aZ0cKAPsDouIcpGXBb2U7xGnM96t8dNTr6Z8yM7AjIYLfmCFp7rNa+ou4rAjws2kA91
         d73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MXpnJgNd9wve0xok691+KsLsOIVO5aHkrdME7CbtZs=;
        fh=kaOulSwuJDHE7aIWxmhuZFrzFyYhbsiR9axoeSwDAaw=;
        b=anXGRwDhPpi5OG31tGZ9HbJBDDqCSQhWlGdZ9mXiFcnfoOx+oeOof9WQWAJUFUOaqg
         zUU0NxxbuEGzv4oscV8XKLp6VjmwlsVdXs9zEcTNjlhPNUumjdbv1O4+azjVbU+V6I6q
         w3rfbOiGT73f91/xMihRoUI2INTfmj1BzHJLnX+LDBHDKHJ5kjjeRXihlZv14ZWvjVt6
         +tWUd4GrEhJ5fTzMrnX5up4VuqeGCTyuISKky6yASEAGVhuRo9QdmkvSv5umqO6BcINw
         MBsQWZ3ysJ+UKn1iWouNvnmeN8t0to0xaHtFzyAqxkWn3cZIe7/SSBadfy8H9iSM8Jxs
         Vhtw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773441567; x=1774046367; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MXpnJgNd9wve0xok691+KsLsOIVO5aHkrdME7CbtZs=;
        b=ZEWWe4PIW2Ms/F/iUUc/uUJUgNiDs5ZBzZvwGr5pcTBsXir9W7BQW3vkwgPjuXFwuD
         rIifaszG1e/BEnvCPsAmeP2+tB1B2S8ng5wSA0qqT/qRTtQWnHWUCVyK0lwXaZtA72s/
         aSOytII++k42aoLiPnWrb8FJrdkKSOG6NArF/slNbU55ptmsoVke4938vwws9QtkkSd1
         yTIeiEyVyQV3dOCGHx+KXCbQOQmd4ZTLPJxn1TlcJSt7VdRGBfvsslr51EShniU8v2lg
         w8fzADtET690qE/V2EYGQXlmZhqqp+/obgMIMFRkj6G4aY+MNVur23eR2dh/X8U+S94j
         IerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773441567; x=1774046367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1MXpnJgNd9wve0xok691+KsLsOIVO5aHkrdME7CbtZs=;
        b=iULUcBFWy05HiRpnRow2tp4XWB3rSV27uuwbYsUFKVjhJBXriBJMKLDDkodeMPrOqX
         uFfUZa+RWlHIwW0Lfbbn7SZ+o0pxXUtQjps7fiFW4JX7pynxATBJ6nrnX9N+jnoRZVCD
         J8IWBM85YcLWAvzgyrUidrc0kQ7bBagmAsB/pcXlJS91MdadTFif9DssU2X84Miwcdur
         y4A+fVYD8jx/Di/yvN4xVsMOVfaPX+hPs8P4/LiYXXyWTbudt+KXJtdBNs07sVJEfO+h
         0kU0n9w1ag1zTSkwPqydS35fo3kgln7JLICLeeTbgNOzZB4RqulcK+av1TTVi3/gdBeo
         gchw==
X-Forwarded-Encrypted: i=1; AJvYcCVjdj2ZcL0JQUlm9QsnngMCv4dGtUjix0SUyR5+mt09BBrZW4OXntkvAAL3Lhgn3oi4iDY4W4i6sh/DcgNx@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9nkuZUQtJJRAROVgpDTntLrBDThjSzKe0IYsTC08aIGIsEebh
	sHDoNRoRNdSkIjIZIejwYRI1JXTc+TXHrLupZH2fJ+u6fGGem5qWFoiwI3t4fpO9VVQUWCDR6s9
	MlwsCGtGGmdbx22TS1uNYK+6dgXYLthk=
X-Gm-Gg: ATEYQzyasHYW94fmQXOk3cmC6a3e1SrxNhQW6TQyJfA9Vkjwzg/+YJqGA2uBrq1hRHE
	c6CmpLV9weyXx7bz0zxtRBvR/BNnb5V8usSvTAqs3gAtlw2rfL9nGzQ4dHnHS8ImzqLhKaGbwN3
	U/gf7JA7Tk+V1zOlfvQzOoaNTeRV8/NHgQ5021FWpKkQvD7AujnHMChatf5llExEkOTazYsgZ13
	e5OZ9OSBu7qMnF3ACXri5Kv90UG4FO1lGV+6a4flBGIRjbfNsVZ3gb74ACRQKUcIRx0F1vMvz1E
	79pRYqElZgZaxpL82YCaOfA/3qNSyLRK1o6nfg/de9R/VGut0p4Q7qJEha3jwGFuzrmYpym9sNH
	KLVHhGKgud+D6yx9L0PvQvQ0=
X-Received: by 2002:a05:7300:fb86:b0:2be:e92:7f44 with SMTP id
 5a478bee46e88-2bea572033amr1222141eec.8.1773441567469; Fri, 13 Mar 2026
 15:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603121235.tpnRxFKO-lkp@intel.com> <20260313213638.GA147391@ax162>
In-Reply-To: <20260313213638.GA147391@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Mar 2026 23:39:14 +0100
X-Gm-Features: AaiRm52mq6KFRynN2HWB61zFcs2DGJMHqt1i6x4Cnd5DvVDH6nH69snDO17l0xg
Message-ID: <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Mike Rapoport <rppt@kernel.org>, 
	kernel test robot <lkp@intel.com>, Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> It looks like this is a conflict between Alice's "rust_binder: check owne=
rship
> before using vma" [1] (currently in char-misc-linus [2]) and Mike's
> "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unstable [4]),
> hence why it was bisected to the -next merge commit.

Thanks Nathan, yeah, adding a raw pointer (not function pointer) to
the struct makes the type `!Sync` in Rust.

I assume this is best handled with a patch on top of char-misc-linus.
Perhaps creating a wrapper to assert it is `Sync`, since the
`BINDER_VM_OPS` contents are unused (so far).

Cc'ing more folks related to the commit.

Cheers,
Miguel
