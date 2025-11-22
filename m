Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05520187346;
	Sat, 22 Nov 2025 01:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763775259; cv=none; b=K2XMQknEXtUvOCG6ristVV+UP3La5+Xf5uds+qZO0Dl+/6V5oC34lz51OEnm4HgkQehx4jCZezAJWNA9Odpzm9q6rSPq7TCG1fmSn1WaNT6VHt65J5r7tlO3CZjMFafN1duont0gB/UqvQxZF8N72jo+BR3k4Bah72c6FKkMu3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763775259; c=relaxed/simple;
	bh=qWrLGr89uBYtWITFw21jNcJqPMmsHWJsIBi7m9mjleU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lO+tm+tNbVCrMZF599vDuxOxen0gZK2p8gCp1FRoslrJqfZ9+/yOS3wiAck+WMgwh0M0cKSNHHKGvoYSYUgCCAxcd/hm6NygVnEzqgH+iDmRqMKlY90h+nTj4Eba5umjvI/hgWvP2UKmcOjr5jgL2/qoGDr1eLvW5H3fFhrRm3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/BBAbdk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/BBAbdk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A1EC4CEF1;
	Sat, 22 Nov 2025 01:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763775258;
	bh=qWrLGr89uBYtWITFw21jNcJqPMmsHWJsIBi7m9mjleU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/BBAbdkrRCQdIjU2YWk6Tmqo+91kYcSAECQnI/+FVgt/v1o3XH0X+vWm7oMfhtIu
	 GaN06Q79OsLsVxDlyirtByB8s67wpzLdIQzZ8KO2HXM0M9LrM4AUNX2ObrTurNBfH9
	 Vh1dK/FNT7B8Rs3rYcYLJpjtDfxuBQJfPlOsPMV3Kuod9VWl2ll43dhrtSbIEbDEUJ
	 /RHRkX22kZQY3bYprD6bPPkdxfL9eSbh955XL595iMkn4TEPsbQln4piCfCwony6R/
	 FRHH3VJ37YEYJNyDGUwCPGNxe85sZINBnqkDisesOolgD53aSNTluj8GCvUO1Ya7kY
	 rHjJMqc+wbusg==
Date: Fri, 21 Nov 2025 18:34:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: drivers/media/i2c/ccs/ccs.o: error: objtool:
 ccs_set_selection(): unexpected end of section .text.ccs_set_selection
Message-ID: <20251122013414.GA3094872@ax162>
References: <aSEGwejeD3f7lnUL@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSEGwejeD3f7lnUL@rli9-mobl>

On Sat, Nov 22, 2025 at 08:41:37AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   2eba5e05d9bcf4cdea995ed51b0f07ba0275794a
> commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
> date:   8 months ago
> :::::: branch date: 4 hours ago
> :::::: commit date: 8 months ago
> config: x86_64-randconfig-101-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220717.5HHMLUHG-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220717.5HHMLUHG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202511220717.5HHMLUHG-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/media/i2c/ccs/ccs.o: error: objtool: ccs_set_selection(): unexpected end of section .text.ccs_set_selection

That change obviously does not result in this warning/error. This
appears to be another divide by zero issue but based on my analysis so
far, I do not understand how...

https://github.com/ClangBuiltLinux/linux/issues/2129

Cheers,
Nathan
