Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39021149C52
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 21:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726262403; cv=none; b=Q54fOPWzok3HJ23q7FRz9YFQsSK0EE3MRBfgkL9a8iidmL8y7u8etzrWQCxGU0BP6lQdIwJXjV9BOaAQjdoHlYhUh3C9KF6pMaqhZ/4gfq07b4QtBPnj4yasLUCVRJ6oDuEsumCiSU014QjbeKMhZArMzHx48gIj2hAPqTUZoRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726262403; c=relaxed/simple;
	bh=88CYE3AjwQ+KIWi12vuF5rggMmLxLFqgK4zjkeK1ms4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E/rd1/IzHcyZX+hvMHTkc4k0IqiYWx0Lg+fd5HPwyfTVXtaSL30AAB03a5h6HmVDo8fT2B4EtW8zJR1AZGjBW2uLFCftI+vgNm9TOdTelLBGIomAQ8aHCdJaN5oOL847ELXteXCTb2RSTQHnBVpa8RNYnsTyU53PjMetERRhMNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rZDtd24d; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PRZ2vGaD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rZDtd24d";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PRZ2vGaD"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1726262398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v9JrJhjJibms3C/jI8nwpIFPlhld4McyxEe1szLDd0Q=;
	b=rZDtd24dERG0ojqIrWJlqxl7fLwAk2P90u42lQniTYM8jk6tEIFsUSh51kbNoyi+zl7t5r
	tY2HNqEnlbK1/rTAT5l+FTexz21juxUZoHT0qVJY01clPF3wztDvMtHSaMp6naVnr8ROWz
	i2stiAYWgiUYTr0gB28OjMwaJkY1xf6p9ATQerE1sYK9tspTfgqisg8dm0yvex3sGGASC/
	W1eIV3JmG/UENszv/wpynQcZjjuOVr6Abdbi+Chg2YlBBYwqhPDIdSQ5y0kuH57s4IhEGG
	+2NU2O+mNKX1I1E5h3JSfo4lbxvKXWrYUwp7NtRYwRF+xdOijikXTP9iHvjacA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1726262398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v9JrJhjJibms3C/jI8nwpIFPlhld4McyxEe1szLDd0Q=;
	b=PRZ2vGaDHFfCBKhhiRdmobN86lqjJM29WJ07pMZWLF8U9rZoY8zLAv8OodYwS+QmNQyMgT
	DV12OMVj9C6i/gAQ==
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH next v2 3/4] serial: 8250: Switch to nbcon console
In-Reply-To: <202409140437.EP0Ryw3u-lkp@intel.com>
References: <20240913140538.221708-4-john.ogness@linutronix.de>
 <202409140437.EP0Ryw3u-lkp@intel.com>
Date: Fri, 13 Sep 2024 23:25:58 +0206
Message-ID: <84zfob8d4x.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 2024-09-14, kernel test robot <lkp@intel.com> wrote:
> kernel test robot noticed the following build warnings:
>
>>> drivers/tty/serial/8250/8250_port.c:1904:13: warning: 'modem_status_handler' defined but not used [-Wunused-function]
>     1904 | static void modem_status_handler(struct irq_work *iwp)
>          |             ^~~~~~~~~~~~~~~~~~~~

Thanks kernel test robot. I need to move modem_status_handler() down
into the "#ifdef CONFIG_SERIAL_8250_CONSOLE" block.

John Ogness
