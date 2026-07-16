Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBA13E2742
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 12:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784203967; cv=none; b=lU1AKI5aGXvf43vH+8sMH4CKcyjR7iemDRUBAZ/n4HBu7C/sRCPOK2f+wcrERsgmB4kcDfkko0yLQNd/f3IWDwrQsAAnIqwCULlPI9MliX0v2IqmD4hx7+z/m6TXyvimpYpfzqm87u3rWtNnderMuTlSRE+YKqXBVZFvHQRTo1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784203967; c=relaxed/simple;
	bh=I5pqpcMV7L4mrd4nX8oIR4rLt3ilY/PwNl7Lu6Kma98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMYPrD1k0U7jyIvOzDLYiFgKTtSC48cU1ADuO9CqRhA4mjNLQAhf97HrDZBtGn5vKyqs6qF/sEZphhzYrx4T1eyhFIMXlgOiZ2uPYJNO3xpsxGT3YPkOxkN+6BP2yq9BKeo6MefAOe0Bu3e7bxH3sIdNlxOQVwTpaUNLhdr03dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=fy1kMQl5; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="fy1kMQl5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rZFmlXwk0dYCSCIG+IcelyE0fnGwYDzQrotGEipp0xc=; b=fy1kMQl5LHOHlkMPTox/Op+PzJ
	vU6qc0QGO69TV9nNgaGeSOVKLM+VrO3YjLlcA8Z0dcAfTY0SiMPiuuf5qZ+AoNv2PoKVDdSQE00O/
	LYfiZ+xPNWJat16HaEGpf9wxeKyML/0VgKX/rqZgV77VhpUgVw98UMacPnPB/7Lzrv+vGx5eXQ/zs
	J1UpMSN5d7gVtDiwy096ucm/IRgeoqBf4HgAl8MpgEovRcibuZwr8coOzc00udYksIfjafQcdk9YL
	GltwNThRQoQPCxTuD8rmB/74Z9duE8NlvUTQvcPaRPz8Q9WmEWcBg/HzhmHRhcQrCjiY7afgP5r/V
	YR8vqBfw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wkKxA-003oN0-2O;
	Thu, 16 Jul 2026 12:12:37 +0000
Date: Thu, 16 Jul 2026 05:12:32 -0700
From: Breno Leitao <leitao@debian.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [linux-next:master 4043/6789] vmlinux.o: error: objtool:
 efi_crash_gracefully_on_page_fault+0xc4: efi_rts_park_worker() missing
 __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <aljKh-mLVxOOzE7_@gmail.com>
References: <202607161357.1gRSAwY4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607161357.1gRSAwY4-lkp@intel.com>
X-Debian-User: leitao

On Thu, Jul 16, 2026 at 02:05:23PM +0800, kernel test robot wrote:
> Hi Breno,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
> commit: 3e5ba97c181e32ca9b810414272b57bb7600998e [4043/6789] efi/runtime-wrappers: factor out efi_rts_park_worker()
> config: x86_64-randconfig-101-20260715 (https://download.01.org/0day-ci/archive/20260716/202607161357.1gRSAwY4-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161357.1gRSAwY4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607161357.1gRSAwY4-lkp@intel.com/
> 
> Note: the linux-next/master HEAD b8809969e1d7a591e0f49dd464a5d04b3cf02ab1 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
> >> vmlinux.o: error: objtool: efi_crash_gracefully_on_page_fault+0xc4: efi_rts_park_worker() missing __noreturn in .c/.h or NORETURN() in noreturns.h

This is now fixed in commit 9633e384bff9ac ("efi/runtime-wrappers: mark
efi_rts_park_worker() as __noreturn")
