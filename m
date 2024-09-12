Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B1014EC51
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 17:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726161022; cv=none; b=ey1K/QhQCrlaaJW1yj64k6TggpEQ7dMWwzEvvOWF0NqqzYerszxLPAmQIWPuxobJnMhST9JCOE1rTpkir1z/xWh1PhztNWEsvH23Xb4I2DQcRDrcyfEwmiwWltuu5BWHF34zUwxY25KoYxvEXkl2ZkqqW/T6H1SFVqQQTC3AcAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726161022; c=relaxed/simple;
	bh=HOhb4hNq7z9rr9ZEiCwpGut0qhXrpyHakpj2p0jVD3M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K3lU2WY8IN3XDcPE/vf6z2lcCQF1dT2Ki2wgMxFRTIoadq54CAEu9M7QPifoURwAIv56QHLGOgg2pzO+IdrJdU3WihlW845qksGnDpKFIADFEivzwLmzH2WUfACIq1VQdLmjkKS+J35TBoFrGhqeE9AG8NIVRkTq1IRnKBbKb6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=SVcvn/sG; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="SVcvn/sG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1726157734;
	bh=HOhb4hNq7z9rr9ZEiCwpGut0qhXrpyHakpj2p0jVD3M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SVcvn/sGQYacPWIkmTWLS7By6x6GWecAx5cfLlTz0EUsgI1afAMuWHRS+KJyxkFRn
	 EF1xWnbu5j82Uc+wkBGL8gH1+a/Qhar9GZT6tgTJS8MXV1w71X01G5mwsVHHoy2QDO
	 oy4WlLjbAJ9qg+TbM+wT/o28xhUPATJsckDBzuYk=
Received: by gentwo.org (Postfix, from userid 1003)
	id 77DAA401CB; Thu, 12 Sep 2024 09:15:34 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 75DA0401C8;
	Thu, 12 Sep 2024 09:15:34 -0700 (PDT)
Date: Thu, 12 Sep 2024 09:15:34 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: kernel test robot <lkp@intel.com>
cc: Christoph Lameter via B4 Relay <devnull+cl.gentwo.org@kernel.org>, 
    Vlastimil Babka <vbabka@suse.cz>, Pekka Enberg <penberg@kernel.org>, 
    David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Hyeonggon Yoo <42.hyeyoo@gmail.com>, Yang Shi <shy828301@gmail.com>, 
    oe-kbuild-all@lists.linux.dev, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    Huang Shijie <shijie@os.amperecomputing.com>
Subject: Re: [PATCH v2] SLUB: Add support for per object memory policies
In-Reply-To: <202409080304.haF25cFZ-lkp@intel.com>
Message-ID: <2011fcea-b4f3-a7ec-e747-6ee0195452e1@gentwo.org>
References: <20240906-strict_numa-v2-1-f104e6de6d1e@gentwo.org> <202409080304.haF25cFZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 8 Sep 2024, kernel test robot wrote:

> config: sparc64-randconfig-r121-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080304.haF25cFZ-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.1.0
> reproduce: (https://download.01.org/0day-ci/archive/20240908/202409080304.haF25cFZ-lkp@intel.com/reproduce)

> sparse warnings: (new ones prefixed by >>)
> >> mm/slub.c:222:1: sparse: sparse: symbol 'strict_numa' was not declared. Should it be static?


Ummm.. This code declares strict_numa. Whats wrong with sparc64 / sparse ?

> vim +/strict_numa +222 mm/slub.c
>
>    220
>    221	#ifdef CONFIG_NUMA
>  > 222	DEFINE_STATIC_KEY_FALSE(strict_numa);
>    223	#endif
>    224
>

