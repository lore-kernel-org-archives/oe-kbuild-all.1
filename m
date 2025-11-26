Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B158723536B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165060; cv=none; b=q4kazy+dt07tU2zWCOJdibE1aP2ijHCyFmxMdPyNdkOHIv9RxuVX/w9agWWKw5xtKiumMPkQtxCL0yDsRoeyhMB0Bvqk/4aNjevnKOzV9FuA+UIE5kPgibley/uJpifE8jaWm/hYYivhk5bRVpzqz/Drees3MMdpcQdIT5J/sEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165060; c=relaxed/simple;
	bh=hVlN1t05NF8J9hwZYP7yS3Hy93FFi7SiwUuqHtqtjZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWvrJBKCbat6CX7tVvNcMN+SVvn9b24KiPxyT6O+1h6UHI2J0iJTa8Tq+oyBOH8lyQ0ORvcw2zhdkj1IPwtdpjiq32sQC3vyBTc6tWyc2rZ/WcNk8ZiHZbbbu5h9gYcqWqp8/i2qTkgABhrfzlT2BnGNEdP5q60R8ws5XvZET+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dk00I9Hr; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dk00I9Hr"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29800ac4ef3so13557885ad.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 05:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764165057; x=1764769857; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MubSNeMbmYM/HeKESQYTWsGeLQj4IZdr09nxlU7W7oE=;
        b=dk00I9HrRC/yuOGaJ1XQCQeOFVDSXpDfgucNfMXdyVGhElShtBd2OZIguvJSP7ihYg
         Tj4eWJu41p6RapA1ex8eQSMM8o6fG/XhgKrkdI+MycOC0jR0RRsRxrUjs3HpbR4RUxBl
         nujTsRLuI4tZjxtXTSATi0ciqgrDsfaeKvmayyaYA1vbj0V6kVFkD50c2yxsC9xNUEHv
         4htCnJ/ztD1kJVhBiFky/7KCaUch5xZAdKpn5gNskOwkrgwZXqiCGqD5A6y5zIJx32ax
         8NANTQGXBag4xHwnCSY+cykYvgwx38hdQGPIXuWiPPlr0V4zJ7Fpjtw5w6ZL+3sxia66
         Rs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764165057; x=1764769857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MubSNeMbmYM/HeKESQYTWsGeLQj4IZdr09nxlU7W7oE=;
        b=gCOBrVy6E+JR8YYttIu5Ht+gpUkTeGMHd5fWuH6UVLCoPEMlWf7MkI+WsB0fEDlEmF
         ax4zjB9OCigWJcX57+Q+g3bJnHGwj0GnfE575h5k8xnS4qhY2i9AM6jRJ/mvia9cWUEU
         ypv4gK710uqP1QxFY+aqknxZ1W0ugGMOBLP/jMqgTXeLwl3oJiJaEaoZa/eGQjOUTV5t
         KOGtIYY0Qc6FuY98Yq4iUdKyO0v5il8yI8Lanv/SrsJnedZNReLliUd3G9tyW5Sjh4Gy
         cGC9VZFp6+1PUUU85+OSlRNuoxyeeH6n5IJ8AgL8Iw3dpUfQfcHTfJ9JbkX7FhuozJe8
         IWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYn+ybzBhPLOp1eIMyXcid2RA70KCF34QkUrZimHdis8aOTi1J2k+bl1KY94ppxicAsaFceB/W59dA/gjb@lists.linux.dev
X-Gm-Message-State: AOJu0YxE4JiViwq7XNXYh8WrJjB2GEnbZhpjPn7a6ERF8oyXrycqd29Z
	u9mY9rOLegv6g3i4vaUBtUz5CEGmuOWllSLCNkPEmNAxcQD7+eyPujN2/r4GDVMxJSkPYCDmWBD
	zmIqbkwJlpe2CpVcuA6HfJ37wIVByTKM=
X-Gm-Gg: ASbGncvoHxcne/pYDzIh+chl56IK+zaAWbfdBZe/Pl7Hs6e1dAWo6vFhid4pypyYaRf
	GV13Ar4wrvvdCJ04ixR7ci6qBkL3XlhdsQqfaSdsW+fN8TiZRq2dkJvo2yVM27d+9fNJqsn3Jg5
	3/pCmBISkNzgCQVS10PKSS14+pLaqIfiNycrl8W978hsnksYITH3yZp2SQdPLH3Wmh4Q/4zl71T
	qdZxE4veItg7RR4KTJGu6coIjSNp9RquFN86zFUWKQ9AWc/4iirTD6cmwXsHSBgbxwgl0aQ26RR
	HIgDxeemX+JShniclzs3w3n5MR6vKRXU29z3H1ZTLgeuQpAFGrkYm2jv/+Oao1HOhdfgB+CDREH
	eNEyopNAvQ1606A==
X-Google-Smtp-Source: AGHT+IHyjyBhvKxSJvpXE0N3bS4+qnIUQ/hrP8nt2xNCh1iG/p92wXmacntCXSyEtcLWpcePqvDURhRBURjbbMcC7kM=
X-Received: by 2002:a05:7300:7b01:b0:2a4:3593:2c08 with SMTP id
 5a478bee46e88-2a7249fec39mr7725470eec.1.1764165056986; Wed, 26 Nov 2025
 05:50:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511210858.uwVivgvn-lkp@intel.com> <84b74435-5aad-4c15-aea5-db87b4a6bf11@kernel.org>
In-Reply-To: <84b74435-5aad-4c15-aea5-db87b4a6bf11@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Nov 2025 14:50:44 +0100
X-Gm-Features: AWmQ_bktxfIw2Y2gRIytid6imUptHKKwkrT99X3ar_u-JsKJ1SBOQUCIAfvL4CA
Message-ID: <CANiq72mCd7FVO0Btsvct5Dy67TkBJd=QJgnPvLMn9d43Vy0YnA@mail.gmail.com>
Subject: Re: [linux-next:master 4806/10599] error[E0560]: struct
 `bindings::kernel_param_ops` has no field named `get`
To: Daniel Gomez <da.gomez@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Andreas Hindborg <a.hindborg@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Benno Lossin <lossin@kernel.org>, 
	linux-modules@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-um <linux-um@lists.infradead.org>, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 2:41=E2=80=AFPM Daniel Gomez <da.gomez@kernel.org> =
wrote:
>
> On 21/11/2025 01.24, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
> > commit: 0b08fc292842a13aa496413b48c1efb83573b8c6 [4806/10599] rust: int=
roduce module_param module
> > config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/arc=
hive/20251121/202511210858.uwVivgvn-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project=
 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20251121/202511210858.uwVivgvn-lkp@intel.com/reproduce)
>
> We can't reproduce this.
>
> If anyone cares, please let us know how to reproduce it.
>
> Tested on Debian testing x86_64 host.
>
> rustc --version
> rustc 1.91.1 (ed61e7d7e 2025-11-07
>
> /home/dagomez/0day/llvm-22.0.0-e19fa930ca838715028c00c234874d1db4f93154-2=
0250918-184558-x86_64/bin/clang-22 --version
> ClangBuiltLinux clang version 22.0.0git (https://github.com/llvm/llvm-pro=
ject.git e19fa930ca838715028c00c234874d1db4f93154)
> Target: x86_64-unknown-linux-gnu
> Thread model: posix
> InstalledDir: /home/dagomez/0day/llvm-22.0.0-e19fa930ca838715028c00c23487=
4d1db4f93154-20250918-184558-x86_64/bin
>
>   561  wget https://download.01.org/0day-ci/archive/20251121/202511210858=
.uwVivgvn-lkp@intel.com/config
>   563  git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
>   565  mkdir -p build_dir && cp config build_dir/.config
>
>   571  COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang-22 ~/lkp-tests=
/kbuild/make.cross W=3D1 O=3Dbuild_dir ARCH=3Dum olddefconfig
>   572  COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang-22 ~/lkp-tests=
/kbuild/make.cross W=3D1 O=3Dbuild_dir ARCH=3Dum prepare
>   573  COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang-22 ~/lkp-tests=
/kbuild/make.cross W=3D1 O=3Dbuild_dir ARCH=3Dum -j$(nproc)
>
> I'm just getting these warnings:
>
> ...

Cc'ing UML so that they are in the loop.

Cheers,
Miguel
