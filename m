Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615C82DECB1;
	Fri,  6 Feb 2026 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770397089; cv=none; b=qBpwOXWtYvU9/CT7VPs338gE9HwErhFpOu/RV9VtC25FD8sJ7MEpKhW67V3m2wsJ0xNRd8OxiLKEvXVrKPoRBQHrGeFxEF+4c28B5p51zCoYPEMD/T30eegKmYNgOXLW/fF6fF6IBABW3sDOTve1EKqPBjqvQ5ClPgANSmJHcjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770397089; c=relaxed/simple;
	bh=oRl+LpeR+45DjoZ+TZiJ+nKaVYRLf4s7pX7ACK8Zom8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dOQEnZDuXDCmX/K6QefYyFRRblpgRU6EQx/XEaIvb0gyB+H+uAjwDOBSdvJFckUHljLu4N8ubBjwYL28Iw7pX26Nv6Fo4B3M5w1t3o5pxBvQogBv9JFkaPu6TxEvKyb1OxJovVwsTS7JVxpuo4ewUXrLfKU1zigiof518aLTlAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjDaPssr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjDaPssr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B19C19423;
	Fri,  6 Feb 2026 16:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770397088;
	bh=oRl+LpeR+45DjoZ+TZiJ+nKaVYRLf4s7pX7ACK8Zom8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FjDaPssrYUm1WQnX3yxYhXx6r5WBhtHosMUJrPzpRLWjYJp0r6lJc3ygWS0SY7nNs
	 AYnLc/JqI1+70mWUCaC8/d1PIBYEEg3Lzk7ces94AaVeimp2UI5172aJ3Vf7g6qk0b
	 Kbq1m+7k2BukWbIR5NOUm/DCS5dW2e7TVFxr2dlARqMrNDy3KnfeA92Wc5pRo255R4
	 UlTiOhcg480AKv6HKnyt1t/TSyx6NUfbR0Z4ng+oiqRZlmAezp+LA+ZilnbWHSEYJu
	 w/QBYb3FEJW9SlFV4TQV2H3lPyor9ityvucSWVrDLG4hXk+YW6z5BilLHDp7+ONWvj
	 mfbe33mG3rIiw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Paul Moore
 <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Igor Korotin <igor.korotin.linux@gmail.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen
 Boyd <sboyd@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 2/9] rust: rename `AlwaysRefCounted` to `RefCounted`.
In-Reply-To: <202602042300.Ec1WiMLA-lkp@intel.com>
References: <20260204-unique-ref-v14-2-17cb29ebacbb@kernel.org>
 <dy5bpeC-xqrWHKJVFV7V6k-eRczMLcKugObZFaXP-cSTQcKzvlLb3Pu7fI9EvBhN_SiALUi_03xXMnpfKQK4hw==@protonmail.internalid>
 <202602042300.Ec1WiMLA-lkp@intel.com>
Date: Fri, 06 Feb 2026 17:57:55 +0100
Message-ID: <877bspq06k.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"kernel test robot" <lkp@intel.com> writes:

> Hi Andreas,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 63804fed149a6750ffd28610c5c1c98cce6bd377]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Hindborg/rust-types-Add-Ownable-Owned-types/20260204-200041
> base:   63804fed149a6750ffd28610c5c1c98cce6bd377
> patch link:    https://lore.kernel.org/r/20260204-unique-ref-v14-2-17cb29ebacbb%40kernel.org
> patch subject: [PATCH v14 2/9] rust: rename `AlwaysRefCounted` to `RefCounted`.
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260204/202602042300.Ec1WiMLA-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602042300.Ec1WiMLA-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602042300.Ec1WiMLA-lkp@intel.com/
>

I guess I have to start building the Rust USB subsystem.


Best regards,
Andreas Hindborg



