Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D25AD5A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 19:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D408C4339B;
	Fri,  3 Feb 2023 19:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675453346;
	bh=TZJ34dFgqRWVTdpaFD2AC0EUub6GKCVUamtG1qVSiFo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ppQj4Yr0+nNApXMoioToRQEfDV9gBMfViUTdA1khmNF204dJvOyrRT3ReUD4THoXM
	 uBN74c13VXRemhd9IBh7G4TT4TUD9uLK6lTjxgyiCGIuieEIZiDeI/btDHQv2SVlTT
	 kUkdqv0oGK+mzNtFnCY1Lhtz2LHL+EOuV3cN88M212XKbPvhikpyUef0FgCnxEyVMm
	 spnunTqtE2XP07uXYG6NI683pdb2qOs1R5U90SnRSL7lN5+jnsduXyvEj4f0oZvjo3
	 WQ+zuM66IJEFmjTm9ytFKOZ2pxR1IgqAcNrWGOFuGLKfQGr7KjFskG39kvr0P6wB3L
	 deL4jgQ+9SsJg==
Date: Fri, 3 Feb 2023 11:42:25 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Eric Dumazet <edumazet@google.com>, "David S . Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
 eric.dumazet@gmail.com, Alexander Duyck <alexanderduyck@fb.com>, Soheil
 Hassas Yeganeh <soheil@google.com>
Subject: Re: [PATCH net-next 4/4] net: add dedicated kmem_cache for
 typical/small skb->head
Message-ID: <20230203114225.22ee17da@kernel.org>
In-Reply-To: <202302040329.E10xZHbY-lkp@intel.com>
References: <20230202185801.4179599-5-edumazet@google.com>
	<202302040329.E10xZHbY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 4 Feb 2023 03:37:10 +0800 kernel test robot wrote:
> All errors (new ones prefixed by >>):
> 
>    net/core/skbuff.c: In function 'kmalloc_reserve':
> >> net/core/skbuff.c:503:23: error: 'KMALLOC_NOT_NORMAL_BITS' undeclared (first use in this function)  
>      503 |             !(flags & KMALLOC_NOT_NORMAL_BITS)) {
>          |                       ^~~~~~~~~~~~~~~~~~~~~~~
>    net/core/skbuff.c:503:23: note: each undeclared identifier is reported only once for each function it appears in

diff --git a/net/Kconfig b/net/Kconfig
index 27bc49c7ad73..41e27a4805a8 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -8,6 +8,7 @@ menuconfig NET
        select NLATTR
        select GENERIC_NET_UTILS
        select BPF
+       depends on !SLOB
        help
          Unless you really know what you are doing, you should say Y here.
          The reason is that some programs need kernel networking support even

? :)
