Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552A61754E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709379454; cv=none; b=NXMz/HiacpcY0R3PT1FgTbPRsyj8wjtyck75KFx4OMX9qUP3VvK5OlQPUjmdv8uB0H9QsKFKbujBSF3HHHVnE18yolSXs8feKr2Iz9R4CVUGhomifNMr/NnBNoL7K3+swYQEWvub2KD33GtQ/pmN/tyRRizlcMcCDjxC2V/oV3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709379454; c=relaxed/simple;
	bh=lK4U4ZLcWMRofj4C36viEsAPI2ibBqPBg1dl/C+Vbbc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IElRmF9v4T2Hi+DFhrVbDxbLFB5EGaZC6P4MSRxi6K1vAABChEdkhV3e4qAXbjvWsfIpm6XcJK+plQRCFmsh2CuCfspK7tbuIDx6dbERP8AJw9Npgv1UhG90bP/JYwnftHsJqNFz3PJcEsNP6U82/bV16MVGVGk+k8fM/ZBh+RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D+k8uPyE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C2g7laN4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D+k8uPyE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C2g7laN4"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709379450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kg/HWn0RBgyKR0X6ry85czEeS/YqxSOJwvJfCZhfBZE=;
	b=D+k8uPyEfOjyY7Y0Omj3cDddiEEu8SaBgIHTay1QinYalGHInnrklrlVczSIpdy/E7rQPi
	m6EDAtJ0M/MAisOkml9qRxBTCn5oTE4q3uHL/+ZveRqpuWWIYebRWPokmgQizgjHSs/pEi
	TYKEDPzd04wuvLmlN/XdYx1YV6KsdQ1zKiER/uf/GcyJhY2ktmA2HoBlbj2pqo3LQj4mIQ
	zc2BqjxQMWImomdPstx38eNXjg10lLEj53Vm4c5B2Y7ZK2Pj8ebKn2d85Bg2iHGtHwTZmj
	b5a45iReS/WDwdDzEc46RVscRi9YHSi6pPJNpogyYU8tzATG+wdn2PQODJ/GsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709379450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kg/HWn0RBgyKR0X6ry85czEeS/YqxSOJwvJfCZhfBZE=;
	b=C2g7laN4Pmwh8tpWg9OdccAbRvdNL0XIMpX8TyeXV/MolAmcZZRzkxZ8/SBG5y2yIHM3/C
	1rqICYqY6avmkXCQ==
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Arjan van
 de Ven <arjan@linux.intel.com>, x86@kernel.org
Subject: Re: arch/x86/include/asm/processor.h:698:16: sparse: sparse:
 incorrect type in initializer (different address spaces)
In-Reply-To: <87a5nhwpus.ffs@tglx>
References: <202403020457.RCJoQ3ts-lkp@intel.com> <87edctwr6y.ffs@tglx>
 <87a5nhwpus.ffs@tglx>
Date: Sat, 02 Mar 2024 12:37:29 +0100
Message-ID: <87y1b0vp8m.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Mar 01 2024 at 23:26, Thomas Gleixner wrote:
> Sorry, my fault. I can reproduce now but it still does not make any
> sense. The code is correct...
>
> Let me put something together which the sparse folks can digest.

Bah. sparse is actually right. I completely missed the fact that this is
an UP build which has:

extern struct cpuinfo_x86	boot_cpu_data;

#define cpu_info		boot_cpu_data

So any access with this_cpu*(), per_cpu*() etc. is actually incorrect from
sparse's point of view.

From a compiler point of view it just works because __percpu dissolves
and the whole thing produces correct code magically.

Most places in x86 use cpu_data(cpu) to access per cpu data which is
defined as per_cpu(cpu_info, cpu) for SMP and boot_cpu_info for UP.

That's fine, but there are places like the MCE code which really needs
raw_cpu_ptr(). Sure we can write ugly wrappers for that and for some
other accessors. But that's all just wrong and ugly.

The proper solution would be to force SMP for x86, but Linus shot it
down when I wanted to do that last time.

Let me think about it.

Thanks,

        tglx
