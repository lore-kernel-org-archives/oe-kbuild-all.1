Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AA62A8C1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 18:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741457985; cv=none; b=rT4BXoyCnTShmfJSXkkgWqQ2zgynwMn/7OxwPKEuPt2qSHnITmi9e+wHikog20pIyckNcyKFXc+dCT3BzGKbfvTjfhQWYLE+EJ97g405hcBURI8SEhwbQyvbOCifuPE4Y1fE0Lk3DC+Fk/G3DPTp0swCyy2g92nuMkqrppJAkbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741457985; c=relaxed/simple;
	bh=3ZbtnjaBp0JSEnHRsCIJgQ9vp2KNBHBRTefIL+bnMvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pR+L/IsVLE/BUZv1bm8AAV3W3nEYDlmNAiWhAl1n7sMDaSf9TNVLE1sder02tDr+lKtU/0Ks1Bn3iC1NWBl0vp/wj9QrCwGFAU3cAua2RZtD8MKkhBNc5PAfosGtexvI/731ANUHvRvkZHmYteC/dO4+RspaGJzUTsqsYO9Rj9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6504FC4CEE0;
	Sat,  8 Mar 2025 18:19:44 +0000 (UTC)
Date: Sat, 8 Mar 2025 13:19:43 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>
Subject: Re: [trace:ring-buffer/for-next 1/12]
 arch/arm64/include/asm/memory.h:424:66: error: passing argument 1 of
 'virt_to_pfn' makes pointer from integer without a cast
Message-ID: <20250308131943.702eb9d4@batman.local.home>
In-Reply-To: <202503090135.MkaxUr8M-lkp@intel.com>
References: <202503090135.MkaxUr8M-lkp@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 9 Mar 2025 01:48:17 +0800
kernel test robot <lkp@intel.com> wrote:

>    kernel/trace/ring_buffer.c: In function '__rb_map_vma':
> >> arch/arm64/include/asm/memory.h:424:66: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]  
>      424 |         __is_lm_address(__addr) && pfn_is_map_memory(virt_to_pfn(__addr));      \
>          |                                                                  ^~~~~~
>          |                                                                  |
>          |                                                                  long unsigned int
>    kernel/trace/ring_buffer.c:7093:21: note: in expansion of macro 'virt_addr_valid'
>     7093 |                 if (virt_addr_valid(cpu_buffer->subbuf_ids[s]))
>          |                     ^~~~~~~~~~~~~~~
>    arch/arm64/include/asm/memory.h:379:53: note: expected 'const void *' but argument is of type 'long unsigned int'
>      379 | static inline unsigned long virt_to_pfn(const void *kaddr)
>          |                                         ~~~~~~~~~~~~^~~~~

This is the third report of the same bug:

Other two are here:

  https://lore.kernel.org/all/202503090238.GMaKCb2n-lkp@intel.com/
  https://lore.kernel.org/all/202503090029.zj0DretW-lkp@intel.com/

And I just wrote the fix here:

  https://lore.kernel.org/all/20250308123649.1330e9ca@batman.local.home/

The mistake was that this was only tested on x86 which casts to
unsigned long for virt_addr_valid() so it didn't mind having an
unsigned long passed to it. But other archs expect a pointer.

Could you update the infrastructure to not send the same bug report for
every architecture it affects?

Thanks,

-- Steve
