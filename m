Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6145A18FC65
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 07:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737357568; cv=none; b=in0Q31O2Sdy+MdSZeMgFa18xtUqflXCKLvMY0lu836zKsob6qck+LJw3jY2abx6ulaQCu3v6d24nj4+iGqg6/f0MA+wI8h3WxZtCSdn8y51LMYFVw2ZOt5JfyhfKIKbAz3j8lvDfjfMEkcivGGkY99ebcxUYMtV/7+gLpItk9HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737357568; c=relaxed/simple;
	bh=mD55gZXGjEOipHB2Fv7DErcdu19Vk8kxoVnIpaNc+MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+D/F6kRs3JxmdhmdiLgq6tu1PjrNIL7+z+LOBljFMbtUKmfCRC2l+PNsImJgZF08V0nSU5jCCFCNmgWmkAQsH8s/SLUX4PxI58FBcdrtDbKfKdvF7HqfdV4M1ORQpnhYWbicOPIpkDCcn2SukpkNHBQrfSVYDPyLtGeyUUvZOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AloG8MMr; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=q6x1GvaP; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AloG8MMr";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="q6x1GvaP"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Yc1tN2syPz9sd0;
	Mon, 20 Jan 2025 08:19:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737357564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4LA2ukubE/YCr1L85/J7P2L3RQjXJ8EWSX8yGCpJG7s=;
	b=AloG8MMrR5LYvSzCl5u3FfgAGbnAVubvMozqkuG/3X814m4x+EOOxbhFaGUm8fDeJEpe6L
	YoioqjSBnTgkEaT/1kOAamc5d1GwrfRMRvTwD6uQce1TcBk73T93I6Cq22qzUuWQQU6A3o
	8SAg/vJx/bcpgwZW9YCTq4CVqcJfQA6m8QGem1e0nvXnCpAXO648tmeON2sbL2TQODS3eM
	gfJfJpdU39j856VgdWHngWeFLm0NygwnliKyDubwWKzho1uMBpmoEv4gHQed9K2uQ003A/
	sN7vhMGpi09dNrbh1NcRU4XBVO59OqiPV2/9Xs7NZ26HiaP4XfSDo7GhAKNBjQ==
Message-ID: <55f6f8ec-48bf-4d0e-ab74-b5bc7c9a7f56@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737357562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4LA2ukubE/YCr1L85/J7P2L3RQjXJ8EWSX8yGCpJG7s=;
	b=q6x1GvaP8sr41UCkeapIKouVoeW6G0oeA4tlCquJluLY2TfZ9xGCRyOfEYfE4pTwf2zBX4
	ZtzFa7jLGH+Jcw6KABODa4onbm+37JHolOwECIyCEdTM/DccZ8osQAqaG7RQTQntQLD/uE
	n+1WqmDRAUjXQKsQTSCbozgi5p/RMmVrCFst6kw05qWnV3i0g232J1ClUdoC9+U4EskBS6
	odXIA5Jygz4hff+WyrpHkMdB/OnWkjsH1Xk4BOFFQqpVvnBtJDPI0ayhS1E0fXsjXKLpo6
	UyueHwGVpqE+suNjxNSZFDX/sPLt15clnfDzCOqOq9oZpE+MSxqhPKETzDmQwQ==
Date: Mon, 20 Jan 2025 08:19:20 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: drivers/clk/clk-renesas-pcie.c:178:31: warning: '%d' directive
 output may be truncated writing between 1 and 4 bytes into a region of size 2
To: kernel test robot <lkp@intel.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>
References: <202501200756.HycDH8wZ-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <202501200756.HycDH8wZ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: cc63488b02ab3a81836
X-MBO-RS-META: maw5fd7unbhaerfpszyws8ojcjum6rbh

On 1/20/25 12:45 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9528d418de4d83c7ada69314ddd8d4427b1f703a
> commit: cd9a5c97dfdaeb9c8ac02e14d7ccbd445e8b5265 clk: rs9: Replace model check with bitshift from chip data
> date:   1 year, 1 month ago
> config: s390-randconfig-r111-20250120 (https://download.01.org/0day-ci/archive/20250120/202501200756.HycDH8wZ-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250120/202501200756.HycDH8wZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501200756.HycDH8wZ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers/clk/clk-renesas-pcie.c: In function 'rs9_probe':
>>> drivers/clk/clk-renesas-pcie.c:178:31: warning: '%d' directive output may be truncated writing between 1 and 4 bytes into a region of size 2 [-Wformat-truncation=]
>       178 |         snprintf(name, 5, "DIF%d", idx);
>           |                               ^~
>     In function 'rs9_get_output_config',
>         inlined from 'rs9_probe' at drivers/clk/clk-renesas-pcie.c:305:9:
>     drivers/clk/clk-renesas-pcie.c:178:27: note: directive argument in the range [-250, 63]
>       178 |         snprintf(name, 5, "DIF%d", idx);
>           |                           ^~~~~~~
>     drivers/clk/clk-renesas-pcie.c:178:9: note: 'snprintf' output between 5 and 8 bytes into a destination of size 5
>       178 |         snprintf(name, 5, "DIF%d", idx);
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
I can extend the name variable to length 8 to mitigate this warning, but 
there is some 8 DIF outputs maximum on this hardware, so it is known 
this %d field would not be longer than 1 decimal number. Shall I send 
such a patch ?
