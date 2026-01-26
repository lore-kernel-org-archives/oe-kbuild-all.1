Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737412BEC5E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 13:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435309; cv=none; b=hR/uZutObc94OdVVGOzJf59YQvYrubzKP1kNsPi8xL6j2GE+aOwVq1XzbqXZQXSZowxoqBXHJ1BI1WT3GYszMFtKsXs8ZU9aAQ1qnUWzXzsf6O0X37xOkw+XLDIVANzQUIjIngE2ddQX44xUF7FckiIOm5ah7ojY0Ve+enU+TDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435309; c=relaxed/simple;
	bh=C1WNx8TTu6h8V0nKm1GjdWD+L5eQiW+GebZydlaIEUM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=kkc8jMkI9l3al3peCvMaEgPI4dCUID9bJVvtofCiC6GtDc8AgddS1CLy+YabyMdz+kzzg/lK/AEYBAZs78Ci3++M+Y3pJF6ZzjJL6OFs1/BJyi+ajWqFfURZARSFftZRxs0/PzYZtPb1QiZ47oJsl/pr86XOSNfppmlo6kTZ3BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1Zrn+7u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1Zrn+7u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAFFC116C6;
	Mon, 26 Jan 2026 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769435309;
	bh=C1WNx8TTu6h8V0nKm1GjdWD+L5eQiW+GebZydlaIEUM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=C1Zrn+7uBFGImlsEHDzelH4xe6PWcEnNo+3oVqCkLad4RK7OzCyrD3mrOmB9Bw2vp
	 mdFJ6MgufnMvc5b/k5IA2svSwZ3frJ7dOTK/4ncm8yykAdZcJ7PIEB2sL0wOJYJWGn
	 jVqoTjhJhLabwpDInl6tEqJDxvBO2cR4gEo5Z63dtnybuBwzy41hn9TDtgIDBHEcXL
	 rJv1a9Fug1GUZtcHPHZd8fYaflNzS66IKXT722j4wmzXpyIDNKCCa4AwtLXcwwDGzL
	 rTYTO5WgB52wq/ZWN1LyF4/HFMyeJ5ZpjXO3RgkSyBZ/iWcinMOHPdjdDZdvgHk7cn
	 adCg5CXtJhl5Q==
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 14:48:27 +0100
Message-Id: <DFYKGUAUK609.37Y7XDB82REC3@kernel.org>
Subject: Re: [driver-core:driver-core-testing 12/12] Diff in
 samples/rust/rust_dma.rs:105:
Cc: "kernel test robot" <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
 <devel@driverdev.osuosl.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <202601240553.wieP0mKV-lkp@intel.com>
 <DFYKDPBY1U35.NQFFTDZNU9MW@garyguo.net>
In-Reply-To: <DFYKDPBY1U35.NQFFTDZNU9MW@garyguo.net>

On Mon Jan 26, 2026 at 2:44 PM CET, Gary Guo wrote:
> On Sat Jan 24, 2026 at 4:34 AM GMT, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driv=
er-core.git driver-core-testing
>> head:   c991f93288cac176e6361617f91c17c63c23a86f
>> commit: c991f93288cac176e6361617f91c17c63c23a86f [12/12] rust: samples: =
dma: remove redundant `.as_ref()` for `dev_*` print
>> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20=
260124/202601240553.wieP0mKV-lkp@intel.com/config)
>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f=
0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arch=
ive/20260124/202601240553.wieP0mKV-lkp@intel.com/reproduce)
>
> Oops, forgot to invoke `make rustfmt`.
>
> Danilo, can you fix this up from driver-core side?

I did already. :)
