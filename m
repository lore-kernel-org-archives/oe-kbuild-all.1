Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B755372E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 17:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790790715; cv=none; b=WSi+Qres0JwSyBj+oXg5mkS12bMCLGRggP3nsAjyrvM+pMKTSW3HL5XE9YJApUkFCqXlnWYL2t8ArV8yRqSG6VtA51QcmI3/DfXNVhThB8cRrXzMTp2xRIwNvJb5e7VbIEiBKEikDLE7YoetatLGsM2OpQg1nf45g5ifdzL3YX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790790715; c=relaxed/simple;
	bh=0GPF4uQC3OodiyaFX5OBri/gbJlcbBuJqqAiEYX8IDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIu58Ud3krkh8xQ/i61EarWYPdsllke9QgjvMnM1vQqtxsQuqnpysNWaTz2k6Ef/SRDSQEm2FGI8K3/tnyjcA9RePxo1KiJviByCvH68vIt8RvG8R4OXw0Dr/eXqP8ftwDJ6kUtgWkj3jgxCC8Z2JsRhUxMcSHNfDnoZ+DNY4PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFuY6o8w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFuY6o8w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFF61F00899;
	Wed, 30 Sep 2026 17:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790790714;
	bh=HNO46acxBiNZES1DiQbB52xU4UqQ37O5iu/ip1dxo+4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=AFuY6o8wQZbYrE/P2xqM5IIQ69zjsWQ0pr7DU6JGblL8S7It9kyyoajgmj8I1qj+C
	 f22agqyHAwaiMQzH0Cmr1Kt6wOvVPLxICjp2tNfMo+EKMFERGwvdPOiKJsKp52SJND
	 dXw0bX2Q/ap0TuRxA2YEjib6G+rDKdnEXLk2QFSL31L8LYn8jGT7tIXOW0Xb/JIvM4
	 CHLBJkXUvyKF4aDD4W9Jvp2bfT2zAghFR6b5Pb1zeSZkGT4IdDz6zGkPEDXrj6lW7y
	 wBePgK9rkyy6h571AfqCMoZpW5GPsDNs0DfVJSVH0p8BCyN8SWuYNpCCSan//OHhBp
	 K6ou8ZNjFNAyA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id EDD3DCE097C; Wed, 30 Sep 2026 10:51:53 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:51:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2026.09.18a 24/34] ERROR: modpost:
 fs/btrfs/btrfs.ko: symbol 'cmpxchg_emu_u8' undefined!
Message-ID: <77b3d63b-4a41-4415-969d-a043ced63304@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202610010054.roP05vYH-lkp@intel.com>
 <D067807D-352D-4B55-AEE6-B1334711EBD4@mainlining.org>
 <ce4ed8b6-cf07-44c4-b4e2-9cdb2b452772@paulmck-laptop>
 <F871853E-8AB8-4BDC-BAC8-10B56C4AE330@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F871853E-8AB8-4BDC-BAC8-10B56C4AE330@mainlining.org>

On Wed, Sep 30, 2026 at 06:41:08PM +0100, Bradley Morgan wrote:
> On 30 September 2026 18:39:55 BST, "Paul E. McKenney" <paulmck@kernel.org>
> wrote:
> >On Wed, Sep 30, 2026 at 06:07:46PM +0100, Bradley Morgan wrote:
> >> On 30 September 2026 17:48:44 BST, kernel test robot <lkp@intel.com>
> >wrote:
> >> >tree:   https://github.com/paulmckrcu/linux dev.2026.09.18a
> >> >head:   90599c372e13369d11f6c1a01ff0094b16f72cf8
> >> >commit: c98d10b438b5626edb3f4e06f4f62bcb6ed6fe90 [24/34] lib: Add
> >two-byte cmpxchg emulation function
> >> >config: xtensa-randconfig-1001-20260930
> >(https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/config)
> >> >compiler: xtensa-linux-gcc (GCC) 8.5.0
> >> >reproduce (this is a W=1 build):
> >>
> >>(https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/reproduce)
> >> >
> >> >If you fix the issue in a separate patch/commit (i.e. not just a new
> >> >version of
> >> >the same patch/commit), kindly add following tags
> >> >| Reported-by: kernel test robot <lkp@intel.com>
> >> >| Closes:
> >>
> >>https://lore.kernel.org/oe-kbuild-all/202610010054.roP05vYH-lkp@intel.com/
> >> >
> >> >All errors (new ones prefixed by >>, old ones prefixed by <<):
> >> >
> >> >>> ERROR: modpost: fs/btrfs/btrfs.ko: symbol 'cmpxchg_emu_u8'
> >undefined!
> >> 
> >> What?
> >
> >My bad, allegedly fixed:
> >
> >2395ec347553 ("lib: Add two-byte cmpxchg emulation function")
> 
> Have you merged 2395ec347553 ("lib: Add two-byte cmpxchg emulation
> function") to your tree?

Yes, it is on the current "dev" branch as of yesterday afternoon,
Pacific Time.

							Thanx, Paul

> --- Thanks!
> "I'm not a very positive person" - Linus torvalds
