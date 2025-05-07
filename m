Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF1928A73F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636215; cv=none; b=ZAinB2NwqCFPLuFrOAuCKX5RW8oUteFFd1BuLulPme87D3TELfUCgo1YXB/oCx+HL73+J8DUJCedJqQCoxlWJgRpQ2nIwhdMga8oagAkowbrRMo3M6BjIKol8Jf8+IscsDgZr0UqO6rO0MyM+f4YNFCNLBzLowZA8i182YUHBnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636215; c=relaxed/simple;
	bh=EvWdi5XNZLdnXpve/eWdpgLxAPpyzBhgiXRcZCDqLVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpUv2m6GzIDZspK1Wi5lenXukRZM+bzb4AGa7sSP788Fuz15QvxPbXObacnrBAPEEz3WlWmQWGsNGfc1sHPv83uU0f0JPJKKiTNNSdPQDorfcTHsVrAbu+OijlBjoNZ+vmX7+L/JbYNkIArUYlfgvE6e10jgo6oKCaAa6vM9hEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTtxdbPJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTtxdbPJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4E7C4CEE2;
	Wed,  7 May 2025 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746636214;
	bh=EvWdi5XNZLdnXpve/eWdpgLxAPpyzBhgiXRcZCDqLVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTtxdbPJQCdKgEBfi9ciWWB7xNdc7D7Tem4LZk4IBR+zsl8dm2Q/lUgHd5GfPQ3MX
	 tr1u0GGn8p0A4yw+08pr2kUaYEtHOooQujMGqNUJxXbRzX97e8+u85zP7v0P/vMuHn
	 I8G9QNpYWp0sDnFavwRnUN364ndAmZYpH0XsVP3GOrZQ6DhLsrgAi+Pc4UC7p4Eng8
	 BX6qrDH/aYBTFh2SXgcvfWyXzFzApywX83H9PlenQvUoxxpB9fzu+uiAqtv5sWzwKr
	 RpcJfLGUQ4kQdz6cSszGr91Fl73PgThgjFCq1o8xjJJTY58sKYn9AJM1Iv7inUD4CQ
	 5hhCiNE0BM/tg==
Date: Wed, 7 May 2025 06:43:33 -1000
From: Tejun Heo <tj@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: Re: [tj-wq:tmp2 1/2] error[E0308]: mismatched types
Message-ID: <aBuNtdGK6hongCFN@slm.duckdns.org>
References: <202505071347.5qXsnO7G-lkp@intel.com>
 <CAJ-ks9kM5KNoXcPEc_CwNZQhBg_5d5q_551q1GBBYbcd+KvwEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ-ks9kM5KNoXcPEc_CwNZQhBg_5d5q_551q1GBBYbcd+KvwEw@mail.gmail.com>

On Wed, May 07, 2025 at 11:38:31AM -0400, Tamir Duberstein wrote:
> This is caused by the absence of the prerequisite patch, as discussed
> in https://lore.kernel.org/all/CAJ-ks9k2FEfL4SWw3ThhhozAeHB=Ue9-_1pxb9XVPRR2E1Z+SQ@mail.gmail.com/.

Yeah, this is kernel testbot being a bit too eager and testing a temp
branch. Please ignore.

Thanks.

-- 
tejun
