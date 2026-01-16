Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2295830F924;
	Fri, 16 Jan 2026 22:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768603473; cv=none; b=G2GLiARlK/YWi8EtgqsG3hZugkw9eLcdroXkeYNlp6SYNyymd0j090bJRFwJhnLrygJNsDUoqqwudn8sY5SBJ24OVOVxJ3XvQXpo/Xh7fGCtAXntsLyRF+tI+4oxR2n61v7Bc1oytugitMC9I9SKJHcUkBdOOeiVG+3GbDaA4AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768603473; c=relaxed/simple;
	bh=V/vsCp/WP5MKvU59Xj8vPlULcS7SaWctuXVxA9ZRu00=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Pza63Pqx9bKZ4amE9jU9X2ULnc/EY1f9NB/fzCcCfk7+a2iF48r8rJ+FskfPqeglBaeR3sVF4rFAP2LBFrwh8sr3viFfNjnDBOggRcBAiYs0xKxj95EsD49mLtZOqhteYa09ICarbT1r5gcH378BNEPvkIfIrqUGmn/28HXgILE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IIFxkaL4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IIFxkaL4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E2CC116C6;
	Fri, 16 Jan 2026 22:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768603472;
	bh=V/vsCp/WP5MKvU59Xj8vPlULcS7SaWctuXVxA9ZRu00=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IIFxkaL4iT061urusG+m7Y46mioPDUMhB0I/HHmAwx3f8pMvg9QnQ7f6S7h/cGdXj
	 jXezDgUAKRV8rDh8EuthlXcCxeFmrzk2V87AXHLZXGngXFGxV6fbTl8yk21j4coiFs
	 owadUP06S1qLUeqDEpHiODspXUuRAEBmC745NAB0=
Date: Fri, 16 Jan 2026 14:44:31 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>,
 maple-tree@lists.infradead.org, linux-kernel@vger.kernel.org, Suren
 Baghdasaryan <surenb@google.com>, Matthew Wilcox <willy@infradead.org>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Alice Ryhl <aliceryhl@google.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Christian Kujau
 <lists@nerdbynature.de>
Subject: Re: [PATCH 16/28] maple_tree: Start using maple copy node for
 destination
Message-Id: <20260116144431.f597298658fbfe5931e15cab@linux-foundation.org>
In-Reply-To: <xeipv5m2xxjfyhoqifdigymobmo5lnh6kqqloowbg4oiejqyp4@ns5iehb3kzof>
References: <20260115193647.1695937-17-Liam.Howlett@oracle.com>
	<202601161750.eDtUQiJr-lkp@intel.com>
	<xeipv5m2xxjfyhoqifdigymobmo5lnh6kqqloowbg4oiejqyp4@ns5iehb3kzof>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Jan 2026 15:19:30 -0500 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> Fixing these in patch 16 means that future patches will need fixing.
> 
> I can either send you patches to fix up this and subsequent patches.  It
> might be better for me to respin the series?
> 
> Let me know what you think I should do here.
> 
> I'll also include a final patch to correct any other sparse warnings.

Regardless of the From:, a tremendously huge v1 patchset against critical
infrastructure at -rc5 got instaparked in my wait-and-see bucket, sorry ;)

A full resend would suit, thanks.

