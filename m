Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A218724468A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 07:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755155855; cv=none; b=o5IYKiMNRXIX97Q/luA64PDkKaLywk5Kr7JT+blDVpTOYxSPJLbT2xMP7ctud10xvz8wyuVFbD1blY71fsdtiqI+bqSnmsNlOvbCqAFhaagrGxaj5WKAreBxRi8ysv3dQOq2xWjRnAHID4hQNypJkE29+EvD6b9kcOP84Lmlj0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755155855; c=relaxed/simple;
	bh=wRnQRc7K0HtYDd/lTVjJ9xI7ivo/ekiYVh0jbQ0idrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQbC1vqy5ezqDKAJY4csHa7Dyq6c0fupRzcXPG4I5MVdr4IgYiGj/wkF9ht0XjsdU8956sl0myD97fZzdaIJnF/HJKacziiAFkImNJc5RC9bgryWBu48ZcUvR48yE6Wyosvcd/oKRqMX3vhDNzxvJViF1ZvI3E+HUkyFCjtQn9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cMXWEKcL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=h7hAmQP0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cMXWEKcL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h7hAmQP0"
Date: Thu, 14 Aug 2025 09:17:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755155845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N4tPyO/rR++dcoi4JJtd74mBR88MyjxMXjG7gzCZThc=;
	b=cMXWEKcLOfnEvI8TV/MNfbdWJ/9hcHtlsAQesG1FUUoH2FEFtL6wgCFBgczUtBFYl5kdc+
	/9vOviTr/ud0Tpc1ZuPB9LVwCmiZvxqxvlTKSkzOsjWQpcN89Gf01ntt/R9IrbiM5nubfZ
	eBeZp6Z1DkzkXmWB5K++Gam9zXE6FVV7G7so6ucy8aBIh59rL3EVtZ48ooxx6XKKmttKjL
	3eC55KzdZRl/+h8QjD9+RQ0XzTgm7+kKVmDL0aB2ImEMmaHoByt1p2NZKmNbPBq1etLiwk
	BMvuoJ7cyiRSOEHZ0w6/21/q6bb3f1W8upXcac/fOEkN9vkxW4nOGO8NfuiGhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755155845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N4tPyO/rR++dcoi4JJtd74mBR88MyjxMXjG7gzCZThc=;
	b=h7hAmQP0GpU9v772wr1g2Jz/Pp3aHp9i+hSLy7J7vN2ASyeS3rv+PFXAliKUD7rgpfKLnx
	t9Pupo06TCOpsmBg==
From: Nam Cao <namcao@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)'
 and 'vmlinux.a(security.o at 766562)'
Message-ID: <20250814071723.i7vqUr-E@linutronix.de>
References: <202508140806.Q4rNoCdr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508140806.Q4rNoCdr-lkp@intel.com>

On Thu, Aug 14, 2025 at 08:13:44AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   dfc0f6373094dd88e1eaf76c44f2ff01b65db851
> commit: 890ba5be6335dbbbc99af14ea007befb5f83f174 Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"
> date:   7 weeks ago
> config: riscv-randconfig-r064-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140806.Q4rNoCdr-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140806.Q4rNoCdr-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508140806.Q4rNoCdr-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(security.o at 766562)'

Known issue, being fixed by:
https://lore.kernel.org/lkml/20250710-riscv-restrict-lto-to-medany-v1-1-b1dac9871ecf@kernel.org/#t

Nam
