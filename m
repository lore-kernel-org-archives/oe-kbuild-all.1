Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC8A3ED104
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206279; cv=none; b=RknrYft1uMd/acgSXODo5vgGRTLBA12DuXamZCppfNqqM6rdF4rXO6HGlotWo9PXPmlVG4XX19ydYQLbtCC8sv3UM14G1lmcOHTJOSya73gwFST1L48T+cz/35yYbDgjPUV58IL0zhOGohTrecsgOnRuIuC3cT06ONVpXBtrR3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206279; c=relaxed/simple;
	bh=rPIn+Mra4o1bR6EHRdELYXEUCRMxJ4FKYJobQW4iQuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ol1mpleIWdw8/9hSk0BULYDwN2kZY0Zbo6UbcD9HAjzBfKrvi4S+mrYvgWpyB3iGtrdyCvuvlEj3cr7yRsZJAfIpEiDTn9CJS9tnoQYFcNO43K/R+/7xFEl9KJ0HrkTNltHcxtQjErJF+5dZFFd/r3vI+mg3ycz/HOL/gOZ6Z8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YpHMRirH; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YpHMRirH"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-4359228b7c6so4753239f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Feb 2026 03:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770206277; x=1770811077; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pfxMamMtxLHcw6K0Fqk6/zfs3lYEE3ZNz2eLveiTn0g=;
        b=YpHMRirHobbTWQYSPWwfxkgFkOdHfBFgU8YJLbs7SVmqvfyM6/CNwuFbsq9BV5tTxO
         KE+jtwHJgJthgwNMBWY9iUHNgLFbYp6goiKNcaG6ra0+5wdqy74uXKbSe6N7dTiEwn8n
         gvmTafJyVynHHwSUm5RdKnAW4FKNP/bEWFS0Zeuk29YnJqeAaDuiJCY27XzoEW56jy5J
         7TFz0o6uOm5loGQJs8WkvC98iz5b6dJjsXAfRYKb/9moGd/UB9SH0uSFOL6bQ48Y5Xzr
         /CQ7+DuWcOV0Ha4+c5yW0749vHJ0dRoUy6+f5Nx765Ul5JgU+001KZT5AO2hZjOrC6KL
         Azwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770206277; x=1770811077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfxMamMtxLHcw6K0Fqk6/zfs3lYEE3ZNz2eLveiTn0g=;
        b=brKvOies1Fsr30Mqqs8BSCReapEVKMuQgVLnGsAd6gej9oQxoHh8E/p9ZoKXwtwwlX
         dyiFeOSFi9v8NRpVr2bWkxrYyNMa2F2neTCq4GfXa9f5kYebdYT9zmsL6zyvjma/ZkeE
         4kKa0o5ma2acia9lB8tvMcNe3KLQbqPRBjJ+VKdY81b/12htTl7m+cnRWGetAxXdV8gI
         1oEdVQDiL/7nwDDMnG3g4eTiD7KBY4GK/OoDMKVvZ+J6R9Bxp18StumbReHMw7GUrRHH
         rZCYWNCLdBtQyAMl6Ss8mODACBoUfpecSQUSSRZKwG1KKq+HSsFKJHW0SNMmP1P1j7Gk
         p1vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN5xQudcvbAwgKfsM3E/693gS96pMn++D3jkbvv+HOWeaSaxgSykosOHUpgnwsADxilLsO/QOpU5FXxhog@lists.linux.dev
X-Gm-Message-State: AOJu0YxzQa+6YDHkAY6i+4H1PvjhMiVO5x64mitQii0eD3vjYest+FKE
	HaN9/TecXttZL64Hx8lv4lMGvsvzUoHpnF0JCXbEQURoOSVOjJxey8U39R5+uqgdpzM=
X-Gm-Gg: AZuq6aL5RS4lI5MtfOlpfl97XVmIIFchG9wfaYtqHm2sSbNi6HG850dvG+38Mo+60P0
	1OqpMOj4Mfoh75uZz0yYH484d7tfIXZ1HtEgPuIlZvFOIyUH9LnC4+ydhHihNfAALieynnaauwn
	8iQiwuqIB9LrOyn7hNcVpNq04k9smLVStgvlXiiMucVnT9ftN6hxInIIolII1dRzQ82AIe8ZP/h
	KP2QPSf8Z8nMHl1n9Qd8gK2fPdTPdvGVKfmzP/2eDQ/edcEtgHwSxINPyKaZwObjbtfXpGu6zRS
	0IOXP4DU48Asan/6WRkZbQ2DqcL9fYUEotGB3sCNyUPzhc0/vbLGzxsYW8jZSprldGqe4hd+ZV9
	vM8uzKx7huDLeCS4VFjDGl2qdPKnLu/n06FvhnVfouPnS0rLMLxU/o+7SXO+c6DWDGG0z7TyXYJ
	ovz5+TOlawWxVUzSK1
X-Received: by 2002:a5d:5f45:0:b0:435:b0e7:ea1 with SMTP id ffacd0b85a97d-43617e400f6mr3907970f8f.19.1770206277324;
        Wed, 04 Feb 2026 03:57:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618058473sm6252472f8f.22.2026.02.04.03.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 03:57:56 -0800 (PST)
Date: Wed, 4 Feb 2026 14:57:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	"lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>
Subject: Re: [linux-next:master 11349/11582] net/ipv4/tcp_output.c:754
 tcp_options_write() error: we previously assumed 'tp' could be null (see
 line 722)
Message-ID: <aYM0QV6sdOpDAU45@stanley.mountain>
References: <202602041310.ZBuXDXC5-lkp@intel.com>
 <PAXPR07MB7984753C52676A18C4CC9C07A398A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR07MB7984753C52676A18C4CC9C07A398A@PAXPR07MB7984.eurprd07.prod.outlook.com>

These are automated emails based on static analysis.  The NULL checking
in this function is weird because there are a bunch of unchecked
dereferences followed by a couple NULL checks and then followed by
several unchecked dereferences.

I've actually sent this warning before and the code was explained.  :(
https://lore.kernel.org/all/fce974f0-cea9-fa92-ecfc-4f7cc4fc95e2@arista.com/

Sorry, I should have been more careful before sending duplicates.  :(

regards,
dan carpenter

