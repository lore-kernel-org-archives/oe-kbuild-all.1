Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8F9214A9F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733736609; cv=none; b=hCEKU/Hl3YD95i6f4t8xMOCL7x9tvSc+Sus3UXtKU2DM49UPJgoLIGA3PD7bICEWJbvG0iSo60vUpgrKNnQ7vbfL4NtPn+nbSetmOqXIjqc8z3jottofcLsQRwzjFwZqIt2baSulBq4si1tU5ShaPU4einvlfHsP77pT6mVVM5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733736609; c=relaxed/simple;
	bh=aejW8lohHUSDFMCS7USRN+tdhS4pBbMff4Hio4VbJ2U=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YAK5jwdR1tquHybi4ukKK+acKcwvmWjj3pxt4kedrlQ+iWHNtOGStbGnHB5lpmgWcvjVZS00v5iSKuEWJEL31mi40m2ehdTFYOfyrheexQUQs5/47dXO5rjV3u8cFHKhtoZKTqAEn4GVlET1KO/vcdJiGPqR5uSHQIojtYmJ1Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e74yOYxW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e74yOYxW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F88C4CEDE;
	Mon,  9 Dec 2024 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733736609;
	bh=aejW8lohHUSDFMCS7USRN+tdhS4pBbMff4Hio4VbJ2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e74yOYxWKcFFErExLonCAgjyHDF6erPpYOPYerUO3dLky1gcTVBUApCGA96NOh/Ry
	 Al57zR8p99lob/uYOcDm078h9+eZB07QSu2Vga4iGfeOMn1/Scvp+FK4srN7L4Smx6
	 CsoRVHSesoeDemeFzjZ7WyQvVb8fuPoGVxuMTBpbB16ed3eN8vSIxVcBs9fKIs6BqG
	 r7eJ46nxMDUmYCmszIeuDPIW1O8r9TYrzhhMRLyOnRZjIeOO8zzuvoHsEpLHYnY9Bk
	 RRxBSA/Bgl8FMRHEgosdPVUoclaSDIvofJ3JIAh+uyYEIxq55QOZYoJjvxvC92iEYH
	 bCsJCuNDmaEHA==
Date: Mon, 9 Dec 2024 18:30:05 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [mhiramat:topic/fprobe-on-fgraph 19/19]
 kernel/trace/bpf_trace.c:1053:22: error: call to undeclared function
 'ftrace_get_symaddr'; ISO C99 and later do not support implicit function
 declarations
Message-Id: <20241209183005.a67852bcbb4a8a95d1784719@kernel.org>
In-Reply-To: <202412061859.I5bvmqEu-lkp@intel.com>
References: <202412061859.I5bvmqEu-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 6 Dec 2024 18:38:12 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
> head:   e6369db4372d722c47a45887eeb6a0f483c20ced
> commit: e6369db4372d722c47a45887eeb6a0f483c20ced [19/19] bpf: Use ftrace_get_symaddr() in get_entry_ip()
> config: x86_64-randconfig-161-20241206 (https://download.01.org/0day-ci/archive/20241206/202412061859.I5bvmqEu-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061859.I5bvmqEu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412061859.I5bvmqEu-lkp@intel.com/
> 

> >> kernel/trace/bpf_trace.c:1053:22: error: call to undeclared function 'ftrace_get_symaddr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     1053 |         unsigned long ret = ftrace_get_symaddr(fentry_ip);
>          |                             ^

OK, this comes from the real issue, bpf_trace.c can be built without
CONFIG_DYNAMIC_FTRACE. Let's define it outside of CONFIG_DYNAMIC_FTRACE.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
