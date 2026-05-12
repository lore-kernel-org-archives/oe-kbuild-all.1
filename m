Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C6836A004;
	Tue, 12 May 2026 14:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778597799; cv=none; b=FjFrr0sBbVXsec7Arz77dbnAxTOysUf89bhuOT7xQKk4SmOPNzHrTt5Upo8VJuoJwGzwAzcU346s+dRQfbP6W1nST1ELMRV7VIr9LjOrYdlC3LCn7CeKwmPCUK6jE8O/Lz8yhsVrYdJgoKdvFCQ+LjHaXN5PrFFKAZSS9Kqnedg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778597799; c=relaxed/simple;
	bh=wuIBR3A+oOyuFFHjM9xctUbLZi3KNYapx+NnPKUX06E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVXvnYcmq9/q2MST3TIDFoJsWBCdOZDcUpF5bo8jYS7nBulTttsQRjoXOokNfRzs6deWFHu6kyP+2j1QUgbd6hghRLI4QICcmknkhZRsmQVMgHSxu4wOQAu56welCOmPvu3ztrhDj/Psh22my27ZxhiBSlTawtbhs33XVdWh/gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEm1PC8N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEm1PC8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB1FC2BCB0;
	Tue, 12 May 2026 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778597799;
	bh=wuIBR3A+oOyuFFHjM9xctUbLZi3KNYapx+NnPKUX06E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BEm1PC8NgvdubfFZsmvzbtBHrUxK5FWtm1kXFWkBXm/MyrC6Pg16SUpA8fz309Ned
	 qXp6Ms/QXaKFWv3afgi32CiFPsfMeRaOML/aWXptV33HSrQALYj4E8bGZrsIE90MJs
	 c/d65mx0HdpvU7E9NbELckGkei5JlVZP9pHvkCsvicyLpvwoJiu53og3h34mvMii6A
	 Rz2ey3LOyd/q7gD6PVMvzge6PJsVYqdlC7xryhGiJfp35VEiobyqFcJfP1vZF/L5zU
	 sBbEVAYgKVqBtvcpZCowxENMdANDaVM3IUuaKXHs4HP3v3WYLDNi4oVb69blvkH5kx
	 bkiWeFy2AoCPA==
Date: Tue, 12 May 2026 07:56:38 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [kees:for-next/hardening 1/1] htmldocs:
 Documentation/driver-api/basics:127: ./include/linux/stddef.h:110: WARNING:
 Definition list ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202605120755.4A2AC441EB@keescook>
References: <202605120507.9iQRMgKR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605120507.9iQRMgKR-lkp@intel.com>

On Tue, May 12, 2026 at 05:06:30AM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
> head:   3c74955937520e6aabc0ec921b1bfe01734c6abc
> commit: 3c74955937520e6aabc0ec921b1bfe01734c6abc [1/1] stddef: Document designated initializer semantics for __TRAILING_OVERLAP()
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260512/202605120507.9iQRMgKR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605120507.9iQRMgKR-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    --------------------------------------------------------------------------------------------^
>    Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
>    Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
>    Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
>    Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
> >> Documentation/driver-api/basics:127: ./include/linux/stddef.h:110: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>    Documentation/driver-api/basics:127: ./include/linux/stddef.h:115: ERROR: Unexpected indentation. [docutils]
> >> Documentation/driver-api/basics:127: ./include/linux/stddef.h:116: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>    Documentation/driver-api/basics:127: ./include/linux/stddef.h:117: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>    Documentation/driver-api/basics:127: ./include/linux/stddef.h:122: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>    Documentation/driver-api/basics:127: ./include/linux/stddef.h:124: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>    Documentation/driver-api/basics:127: ./include/linux/stddef.h:139: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>    Documentation/driver-api/basics:127: ./include/linux/stddef.h:140: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]

Oh, hrm, there are a lot of errors in stddef.h for the "htmldocs" make
target. Gustavo, can you see what's needed to fix these?

-Kees

-- 
Kees Cook
