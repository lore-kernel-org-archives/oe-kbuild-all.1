Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B6D1A6822
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jul 2026 23:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785108612; cv=none; b=Y7ItbLgtZx3lTyAD44bUIs5AanvqWfXBnHA72V83y2GqHPi+G26DmGPTbRaJXz2GcYcBswhDLRyi0xDNxO+EkvbKwwJ6Xdv6FoOjTlp6RCj9+umucfnDB9u5UOOavctShu2UFU/Zxw+kxG6Dibyc+qpf6WDJeKsgGDSLlMaoI4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785108612; c=relaxed/simple;
	bh=6xV4GJITgK9DJkU8ZJnUhE5P0Gb8xfybThNB26RMQsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEfcKxz/htqBSzru9v9DUAVoLo4JpIIbG+1f/uvxvYiOM9y+EdVVCmHTtQ2qWi82y6CGUjfa8J7RDjSSZQBz98O3ZhnvFIHAJ0ywBNoqNXWJbKfqHSGtMe6J+9eAxgYGXi1eYQFLrmyJd1JPTcXKdJka5wHqDBINQ9JIlRvz44I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtCdlVVd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtCdlVVd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328251F00A3D;
	Sun, 26 Jul 2026 23:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785108610;
	bh=SIRBAupJ4CWfp9gil41OP9lpGcXQgkWuzOXj+vDV42I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RtCdlVVdowMzbn8oWVqIY8bNW2ue9gqKctalXY53yLM3qYgfh2xgf4R9yuoZVi2c6
	 a+4k/Eq2a6ENEJkpL/pe4pLLXdMNA4DyhpDHpjiG7dihea/a/ESQwk/NyrkQvGgh6S
	 ts5OVVIpWajZmG4+ROmSYS6vDsJDoVMt9rdlswTbGzliFHXXkZGuo443PKEvHyCeij
	 J1aMuFVaVVSUaON7d1tDr2/CadCobWPwk5rL9LOTVd5jLsPruiV1WUMSDKft/CjsCa
	 lqEi3WflVJeYCIEEOWeO8Hzxwt9iHeSV9U0eJlHSgEALCZt82G+U+f2mm8uV53Wtpf
	 yz2Ri/D6u4SMQ==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3FAE2F4006E;
	Sun, 26 Jul 2026 19:30:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sun, 26 Jul 2026 19:30:09 -0400
X-ME-Sender: <xms:gZhmal7pWsDtWfr_tyDdEok55kc4ph6vuakyQywWvlpQnSXfujD8yw>
    <xme:gZhmalLV1TkvYIYqkCt9gIGUXuNQYxYQCxpLi06D2_Tz5_o49uKoWlz61YbGSF2wf
    1DVKBSCdDrUqV6KciltYG0blrjusguRcMdRo2Qcfaw13vM6izVtkw>
X-ME-Received: <xmr:gZhmautbj2wRHo4lmT41B6yGgQFq__oxMLx0SBsfh2WbnslqWWOhx6XPhQ>
X-ME-Proxy-Cause: dmFkZTEbsb2OqAjujPLW+jvGUueQhwPa8QvsH9eeLSdvuRT/ax7yC8NVTwBljLEaaUBAXf
    okrPcWFWtSuXxZlW+xH3WbjGesfK0no/fvHHSpXDxuivil383AGyvWFmNIqoTgevN48v3k
    7vMebKR1j7wdY/DNyrpDMRlcbpI+XXijjtZfm3u9xlwNTTCuDBiOuztybsMyt8RsTDNi2V
    M03ctdviaMixKXsmPHYm1a++raYd1ZGhjA7H12hKiCytZrbQL0K21pH/M8r062kdsj5p5X
    htpEbQ15kEGc/OtUOUu8svBVOojwETfI/Z7ig5w8i1b8Z/idcyEK3QiwYJ+J4w1PMQdrq0
    Y5lzLDkJnf9ROPc+MNYvdW54vY/nQ0N/HemSkHMCKAVDKFyq6fDJen/oQ8sDSk7UwAMPzg
    /1qmwxxCPVRt1+eZLpxMb3d9gZbkDTa23uxLGsYtQbJVa9hGO+MFcxKv6SyjlTx11z3a7n
    M2Md1GRpzkDJNNyfIha09j5iqZ/I+k+elJO6qT3SbmpbaZEi3BxJEWlJmSufFMXL+Nq4xT
    B/kbKyZ4b4q2QnXVwTVzTQNsVI+sc/srLDzu/3JPv78ysv/GSIXr3qRbD5ICT7HC33R53V
    0yS9NVz50srBjKyok00Kj2zHyBY21zmzTjnqVcRPxVMji/3yXyVI/5XRVriQ
X-ME-Proxy: <xmx:gZhmakKz8hrzg4mGka8ktoLDhOtjTNEHKZ8ytp652Jg24MW9bT9uFQ>
    <xmx:gZhman9z8Eq2cKutJI6d6D9qN56SJsXziYD3qO2qrUkvQPnmNu6iaQ>
    <xmx:gZhmatymht01RXTTvJpvFfgNWgemtaO2Yu9BCK6eMESPjaQuopGFbA>
    <xmx:gZhmak4P6VqaB30gjoro9_MCHayCSJyevSpnOxfMm1h4bfs23qLHtw>
    <xmx:gZhmak-TTGfgkTF2xYnaylB0g1IJaAXhYsBu8PR5j11e8fXUeNBRTn6E>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Jul 2026 19:30:08 -0400 (EDT)
Date: Sun, 26 Jul 2026 16:30:06 -0700
From: Boqun Feng <boqun@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: Re: [boqun:rust-sync 19/24] warning: unresolved link to `rcu::Guard`
Message-ID: <amaYfo35n4am1caP@MacBook-0RXW5>
References: <202607251809.JZpaswzZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607251809.JZpaswzZ-lkp@intel.com>

On Sat, Jul 25, 2026 at 06:22:13PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
> head:   6f6629ab2185d27cbc65d7d85908159b1293c082
> commit: f27758ba5f0adefa226d8fc91c73e2300cf97ca9 [19/24] rust: sync: Add abstraction for synchronize_rcu()
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260725/202607251809.JZpaswzZ-lkp@intel.com/config)
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260725/202607251809.JZpaswzZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607251809.JZpaswzZ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 

Thanks! I've fixed in my tree.

Regards,
Boqun

> >> warning: unresolved link to `rcu::Guard`
>    --> rust/kernel/sync/rcu.rs:57:9
>    |
>    57 | /// a [`rcu::Guard`]) at the moment of the function call to finish.
>    |         ^^^^^^^^^^ no item named `rcu` in scope
>    |
>    = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
