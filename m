Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2952CA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 20:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7BEC433C7;
	Mon, 14 Aug 2023 20:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1692045700;
	bh=O+BUwhd4tuHOozaUhAugYlfRFci1sm+tiT7rHq5lmWE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=o7amlwIichgASkz4ImiOJplEYbcMkDyJfP4eg1h2tJilDhsvE0UXSsEkyvSK4E7ZR
	 HEMdxhk7LpbkO0X2C6dGorppRfYQwF5tGuMb/CsBcA4UthjsErtHFDE10AAey4XiJW
	 6dvcbf2V7soBT5TsuFl/ZqklZCVlwg6W+S0GYejw=
Date: Mon, 14 Aug 2023 13:41:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: kernel test robot <lkp@intel.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-stable 219/240] mm/memory.c:5410:41: error:
 implicit declaration of function 'vma_is_tcp'; did you mean 'vma_is_dax'?
Message-Id: <20230814134139.1a590870aa184f2ed34fd923@linux-foundation.org>
In-Reply-To: <CAJuCfpHF_gJYT6A6PC5YpoVefdF2rSEKNaSc2mH3Vqp51r3hjQ@mail.gmail.com>
References: <202308131610.jF4ncWp6-lkp@intel.com>
	<20230814130623.90cf2bc8c625087ea616dd3c@linux-foundation.org>
	<CAJuCfpGfsZtY5_Qi+Gew1z7Z0_Z_cAkrmxt+6cF6Sp-TR3A_kg@mail.gmail.com>
	<CAJuCfpHF_gJYT6A6PC5YpoVefdF2rSEKNaSc2mH3Vqp51r3hjQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Aug 2023 13:33:19 -0700 Suren Baghdasaryan <surenb@google.com> wrote:

> Andrew, is "mm: handle userfaults under VMA lock" merged into
> mm-stable? I could not find it and in fact the whole "Per-VMA lock
> support for swap and userfaults" patchset
> (https://lore.kernel.org/all/CAJuCfpHSFikZ=h34yS980BmUP5M=+j6rB4_b-q7MCc10Xs24+w@mail.gmail.com/)
> seems to be missing in mm-stable. That's problematic because Matthew's
> "Handle most file-backed faults under the VMA lock" patchset
> (https://lore.kernel.org/all/20230724185410.1124082-1-willy@infradead.org/)
> requires at least one patch from my patchset to work correctly, this
> one: https://lore.kernel.org/all/20230630211957.1341547-4-surenb@google.com/.
> 
> An additional note,
> https://lore.kernel.org/all/20230812002033.1002367-1-willy@infradead.org/
> is fixing a known issue in "Handle most file-backed faults under the
> VMA lock" patchset and it's missing from mm-stable too. As Matthew
> mentioned in that patch, ideally it should be placed before "mm:
> handle faults that merely update the accessed bit under the VMA lock"
> 

I was unaware of these dependencies.

All the above-mentioned patches are in mm-unstable, so we have
bisection holes.

If I get sent a replacement patch series, I'll move it to
back-of-queue, because I'll assume all previous testing is invalidated.
I assume this is how this misordering came about.  If I get sent
little -fix patches, I don't do this reordering.
