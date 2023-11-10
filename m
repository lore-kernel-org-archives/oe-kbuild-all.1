Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97F514AB0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vkZfFS+R";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cUuXo8IO"
Date: Fri, 10 Nov 2023 16:43:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1699630994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDUnFWkz9m1SxE9OD5lKZxPMSGqq0UdgfhdcM17FYxo=;
	b=vkZfFS+R7cgzPfYqJuNwjKq9wqYq2u0qceq4PxqiGOIKdE+txAiuMik2u197ebPhX6XXvI
	ViKNmblxDV67K78kwHMwqneVn06W/juRP8ktaiBcuRdJcbkyV0kE8sSaUtJ9KcWynPss2d
	y298PIQEIDg9GehIgFFY193wHEqfIelRJZasgA5z42NDi4VrxvHWJ/e8OyWBn7HSVE8/7+
	wa94t+McqLCIj4sO2aVsUGphWjymdIg7Qc3AFSjEa85kyOTdmeltDXLCdyuY6L1Wa1jZHq
	VIXBRbllT7tS2HACexszNA9zWEzohfyC8cnxHvwtdaHzAp/FhnMWOgUZGIvyTg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1699630994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDUnFWkz9m1SxE9OD5lKZxPMSGqq0UdgfhdcM17FYxo=;
	b=cUuXo8IOBNYv/I8RjdhGiuLkvNyNJTQjE6jaGY9HtcCUGY4eD5OY/WmuwUm5b2KJTmTRBN
	MvF1c7Kcvfqcy9CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: mm/vmstat.c:358:9: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <20231110154312.1xjowQfg@linutronix.de>
References: <202311080409.LlOfTR3m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202311080409.LlOfTR3m-lkp@intel.com>

On 2023-11-08 05:48:25 [+0800], kernel test robot wrote:
=E2=80=A6

Same report as in 20231110154208.5UoC_qsI@linutronix.de but for
different file. Don't see anything wrong.

Sebastian
