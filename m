Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C448267714
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756028697; cv=none; b=sa0SU17py9ioLuXMXPGOE2nem08G3IC5AVxfhDebC6Hs3ycXRx1UZZc9/BebjJ+GZ/K8mopsF8XPsW2+9wR6jitXbeUQiHBlXneMZjWeZF1JGTd6VGxmvwbTr3DcfAPBiLi9bcw7Y4sQ+qXJowagOJvHqEr8PjLgBsDH009N5Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756028697; c=relaxed/simple;
	bh=UArcby6FJL00Uo54+N1xooCcxZA0gl8wD1a2TYSRjak=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GPhj+hkaRza8TymRmPCYMW40E3spOCMppZdfN963gQvAP9cx+CROaz9KLE0NGV5xwJ9ztyco8/5rgkWMcnAHN1VDhoW4jxkR2lr16QUVqm9rJlv9S2tXQGGEgeyJ+ZVfT+qEWPvUt248cLSGDZ9WlfOdkfnVLkkm8V/1gUiFD/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3t3Mo4cE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CAG29hw9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3t3Mo4cE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CAG29hw9"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756028693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKH0ObzuIlDHYn1MyVSrzIjZCBGrA0bqurb9zeCBDeU=;
	b=3t3Mo4cE5o7ldENxPeiUKxX6ch+wGfN1Blf+wqVFpNAM7kX7KULHTzIhSLt7UqafR8sWJ6
	/FNVMOhybaeT59+0z0KFKMS2vsNnr88CKSZKp6WC+olJDyoUTljcZm/PdoWaugDmq60TW3
	jxYEvsL5g/LYY/2I43hAQZGZOAIuXj860Vv0xBD3RuFCK5Rq9887KcDkTdZTUKDEPKmwfw
	izDOHBPS/MxNT5pHKW7KfbGrq9pDXWDqMXo5by83Morakm+FtN/Er8njlKnXldosP2VP0W
	rwvlsqtpZyyPl1MihuPHdkmo3+PZXHRh47uvzhjkrd/1xqxnA3MYmzCmh8nkWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756028693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKH0ObzuIlDHYn1MyVSrzIjZCBGrA0bqurb9zeCBDeU=;
	b=CAG29hw9cny5epg0LId/Or92nL8Dzb5JsiP29TE3ct502eZybQd4/hCxyZNW7N5ZvrsA4T
	yCpyDDYR0j/am+DQ==
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [tglx-devel:rseq/perf 17/47] drivers/hv/mshv_root_main.c:588:2:
 error: call to undeclared function 'rseq_virt_userspace_exit'; ISO C99 and
 later do not support implicit function declarations
In-Reply-To: <202508241053.wbAfNuDn-lkp@intel.com>
References: <202508241053.wbAfNuDn-lkp@intel.com>
Date: Sun, 24 Aug 2025 11:44:52 +0200
Message-ID: <87plcl2gvf.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Aug 24 2025 at 10:25, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
> head:   eb43860d07d75ca9e20e5716da7f8dddee478ed9
> commit: 0de985a3d3f07cb83e1bb418183c75579c3fd912 [17/47] rseq, virt: Retrigger RSEQ after vcpu_run()
> config: x86_64-randconfig-161-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241053.wbAfNuDn-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241053.wbAfNuDn-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508241053.wbAfNuDn-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> drivers/hv/mshv_root_main.c:588:2: error: call to undeclared function 'rseq_virt_userspace_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      588 |         rseq_virt_userspace_exit();
>          |         ^

Bah. lacks an include...
