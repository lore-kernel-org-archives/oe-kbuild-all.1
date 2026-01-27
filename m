Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555D535B65C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525421; cv=none; b=FsKw/63c5c/c6XzUxtHPYzgnrH4CN8WcEWziLiRIsjsvDN1WUHt4MEvzDhRiV7ykGKVu6IK5HtCbozVSNjgY++YQs0/7WbKap0/EpPCYXdDEsQzjOZVF45lmPL3YrTbubZCEyoA5pY7MOi0JaHGP9lMG351br66catqDUMVWzzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525421; c=relaxed/simple;
	bh=EoIr2nGrfgNFHWd0bDkbOwnDaddYQ35Rq/Oj8XV2UZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1r3UCKNH8vuyXMXFfy6xJ+U67zWrhoLT7r+1ro0Cz7TFRIwbRSCdn8ipref9Xyy3rgVZ/H3EOm0diA9ath+Ti9rK34TTA4NlefnlGEBY3K46hFJwHefWAs7bdQZI+8eIyCwK39KAbiBY7ksYQ4he411JLrjo4V5CttMRMoHMQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=X0jDYcS0; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="X0jDYcS0"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6CB5C40E01A3;
	Tue, 27 Jan 2026 14:50:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6jWB-QP5ZWGh; Tue, 27 Jan 2026 14:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1769525403; bh=O6LwvLRf1hrH5+GTDAUuzluRe78Zfg07wa5OqOK49i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X0jDYcS0nf34yKJW8boup+QGfV7fun3nAqvZdTkeyb9HmLmBNQ7JlIJS/Y4Qt/jWr
	 WdkSKY0cenefujziGxMqxrqHhoRc0R+PaGyFhMxtqv7Z2dUYa03dImSart9O71iQ/C
	 OUyIm2dI/spVp6jP5qv8UJQlEpb1yJbfK6hCHrggk7cyP+u37+1S5f+H5EuyfuDkbR
	 Vwwjorg4yU4A0FpDFENp1jXP1UutF1PaiwzDY5NjZUA6D+lXAZaRGlBkmzYXFpkjrh
	 Bk7HEzsn2qdo/LYX0obbnqMlb1nuYH6UhCsO3sS7mU1lut9iIDdQ9sgPmgCWRP8qmd
	 PVreL/htIJTaZmDa7WsPmNua7+yIOtbyqXWWlxqxwwEUdpsIHcmbvYRWjVvrfZv7cl
	 taiw1Ktd4Q6GXtjVBkBNM4qMy1tvDOWO03pv/gU+y/7l55uTpl/GpcolIJ6UWlL2+k
	 zb1YnwUhHYo3FSKSW5SgHC7tUOw1pS2sOvBcBcI1i2E7rvqC5KElR/6paqixdTjOBK
	 w7zbI803tyVmlcVOzoi40S9JsJ0BtIjzdlN478Dgc91JPCBxj9k9gW7cndGtr4TT1r
	 CbScWnkaeWrmWX2ddpmV7N5yPZPgXdwb9AwfG2Q7DN8iGGXBMUipmMAahme83fvark
	 EOFTGe4NHLnhQjebjPrzMbMU=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 3C4CB40E0140;
	Tue, 27 Jan 2026 14:49:53 +0000 (UTC)
Date: Tue, 27 Jan 2026 15:49:47 +0100
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, x86@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, dave.hansen@linux.intel.com, peterz@infradead.org,
	david.kaplan@amd.com
Subject: Re: [PATCH 1/7] stop_machine: Introduce stop_machine_nmi()
Message-ID: <20260127144947.GKaXjQi8R9cE17WYKM@fat_crate.local>
References: <20260125014224.249901-2-chang.seok.bae@intel.com>
 <202601261901.Yj2kmvgI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202601261901.Yj2kmvgI-lkp@intel.com>

On Mon, Jan 26, 2026 at 07:51:11PM +0800, kernel test robot wrote:
> Hi Chang,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Chang-S-Bae/stop_machine-Introduce-stop_machine_nmi/20260125-101013
> base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> patch link:    https://lore.kernel.org/r/20260125014224.249901-2-chang.seok.bae%40intel.com
> patch subject: [PATCH 1/7] stop_machine: Introduce stop_machine_nmi()
> config: x86_64-randconfig-r133-20260126 (https://download.01.org/0day-ci/archive/20260126/202601261901.Yj2kmvgI-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261901.Yj2kmvgI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601261901.Yj2kmvgI-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> vmlinux.o: error: objtool: stop_machine_nmi_handler+0x23: call to {dynamic}() leaves .noinstr.text section

This one would be hard to fix because that's the

	err = msdata->fn(msdata->data);

function pointer which objtool can't see through.

So my suggestion would be to do:

struct nmi_multi_stop_data {
	cpu_stop_safe_fn_t           fn;

note the different function pointer type which we will hopefully catch during
review in the sense that only *safe* functions should be callable by the
NMI-specific stomp_machine.

Along with:

diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index 189b4b108d13..55a350048d4c 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -230,7 +230,9 @@ bool noinstr stop_machine_nmi_handler(void)
 	raw_cpu_write(stop_machine_nmi_ctrl.nmi_enabled, false);
 
 	msdata = raw_cpu_read(stop_machine_nmi_ctrl.msdata);
+	instrumentation_begin();
 	err = msdata->fn(msdata->data);
+	instrumentation_end();
 	raw_cpu_write(stop_machine_nmi_ctrl.err, err);
 	return true;
 }

ofc.

Unless someone has a better idea ofc...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
