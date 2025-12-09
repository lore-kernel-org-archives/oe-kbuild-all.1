Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22F522FF22
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 16:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765296227; cv=pass; b=c1d9/O8LuPBefmZDuIBxnxHfQVMVmzHsA7KBSGTTk2swV90nCNxg0KauV/JMdzgaJ8lmHV7Ugo4u2cwWkdPFLmZkogj02fzUchDVXIktYy0k+n4UQvpr4GxgCyaUazPm+E5ifAiO6YvQOFMAPC2e4B4q6Neh278bJbCvq5K/8oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765296227; c=relaxed/simple;
	bh=O73BBPTaI5UjKfydfQskm3aB4nJHujC1W0bQSa5rJlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NECLmonITYfZ4ENOQ9r7PjmHj2/UuJGuHwSkOXGCe6m7FPLgL/XVqMmQJ+fJb2kI1NRxi8ik30uZ/vy8XqSThaoOFUIVn8QVkEnT1qyp61/xiYXpIHIVA4zQWhB7An+BEpOEuVflZIvQHBnvMJhCzXEhDQpWjHHbst/r76sa4VM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hartkopp.net; spf=pass smtp.mailfrom=hartkopp.net; dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b=JAOP7FZj; dkim=permerror (0-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b=YfdlKOOA; arc=pass smtp.client-ip=85.215.255.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hartkopp.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hartkopp.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b="JAOP7FZj";
	dkim=permerror (0-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b="YfdlKOOA"
ARC-Seal: i=1; a=rsa-sha256; t=1765296186; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=b0pAqbWFXrkz+k7izYyacbA1JvZtFlhyGD101aTejGLbrrHt1aSHEhWsmmasOYVc+a
    LUV99R2XiRuCwCb/ruh0mDYoHcBTa23JjZ5S+kyRnhHnJQHefhxD2ctORCsSZ943y+GW
    IGBcoQ7fbRKluK5S4lL/PuiQfsNDOJOHP6VUxTMv6658viLJmpL+ooewVATK7bA8b95y
    7BqG4v6LE66bepQwjnAvgaUV794lTBpyidI1NcMrj6ZqRw5AsCr8vPKXZJVMOXBZcbbm
    B8aDuQOT8o57T74ccjkNdojDlzMdrdfyfGOaMCOGgHda3Q5nmPcbJifd5AtgeWYkJCp+
    hVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1765296186;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=yhnELux68k6jCqiWHymnft8wi/B4sY1nEQ85CU9+SYA=;
    b=KPP9DgBBH5VRAu9JGENOT9Efq+ny4ZxpyJlRG1OdCPXsKizXL4ynpLjq+FYc4YZ4dD
    rSBNfZ+cUql2kh4omBgdf/kUPRUT366tE/HFf9wOBlaotNimLyGbGsOAd0+RuKl67A6b
    86ePHyMqtVzrJ3GSyPUbhb5c/74ZIsVuTr9n670zxwp24HoRG1+LDmUtYB/FSsHUtev/
    qPI8bt54o/kR0ZzuNGFBO35N1S/Fxl/rKdqacGTTWUPBW9r/uJ58xJIMOKtcjl6js4eF
    dkw6Zecwc1P1cWHszfH1jwpEU94pJwP0dF4h28WkVhB79UWBDNOMM/p+uR1tu0mCwmuT
    B3Iw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1765296186;
    s=strato-dkim-0002; d=hartkopp.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=yhnELux68k6jCqiWHymnft8wi/B4sY1nEQ85CU9+SYA=;
    b=JAOP7FZjF3mPiY/wt2BNwBhQYAiSWP/VfrfJ7Z8M2a6Po/sqwm19Np1tXNWm499HHL
    JWas2dPLYiRQstk/POj70/eYTy+sBn5uNAQIYBHozXiqDNXAM0rUpU3uif9tr9EVaOqI
    iFca/re5gjPiPmcIW1koEW3ZUf29F/8d04DawiFoukkTM9mKTVcBvLG1oHqyGTLHcHhf
    VtAQDbxi6CnWZYYYglaPGEKL7J7EyZT8m7UiHAmRgjrT6cUWBkwDOtkTvWyrBtlS4hdj
    ihuHra9HKHBQMHCUBMtLr4eiY1pmnFfXrWi48RfUO6NyF843TlZeLObAQ9gyBjtD7ZeP
    7Pjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1765296186;
    s=strato-dkim-0003; d=hartkopp.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=yhnELux68k6jCqiWHymnft8wi/B4sY1nEQ85CU9+SYA=;
    b=YfdlKOOAaQcfyFO7YNuJ59Jj3C2U632Mc/KvjhpDuq0eZGz4JXPHyWx4m0cOb5DgTg
    2nrGmoh3yeh0kBLjsTCA==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjH4JKvMdQv2tTUsMrZpkO3Mw3lZ/t54cFxeEQ7s8bGWj0Q=="
Received: from [IPV6:2a00:6020:4a38:6810::9f3]
    by smtp.strato.de (RZmta 54.0.0 AUTH)
    with ESMTPSA id Ke2b461B9G35mN5
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 9 Dec 2025 17:03:05 +0100 (CET)
Message-ID: <683375b9-41ad-46cd-8021-00d204db7de7@hartkopp.net>
Date: Tue, 9 Dec 2025 17:02:59 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 12363/13990] kismet: WARNING: unmet direct
 dependencies detected for CAN_DEV when selected by CAN
To: kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Marc Kleine-Budde <mkl@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Vincent Mailhol <mailhol@kernel.org>
References: <202512091523.zty3CLmc-lkp@intel.com>
Content-Language: en-US
From: Oliver Hartkopp <socketcan@hartkopp.net>
In-Reply-To: <202512091523.zty3CLmc-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

There's already a patch addressing the issue:

https://lore.kernel.org/linux-can/20251204100015.1033688-1-arnd@kernel.org/

Many thanks,
Oliver

On 09.12.25 15:29, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   c75caf76ed86bbc15a72808f48f8df1608a0886c
> commit: cb2dc6d2869a4fb7ef8d792a81a74bc6f0958a72 [12363/13990] can: Kconfig: select CAN driver infrastructure by default
> config: loongarch-kismet-CONFIG_CAN_DEV-CONFIG_CAN-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091523.zty3CLmc-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091523.zty3CLmc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512091523.zty3CLmc-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for CAN_DEV when selected by CAN
>     WARNING: unmet direct dependencies detected for CAN_DEV
>       Depends on [n]: NETDEVICES [=n] && CAN [=y]
>       Selected by [y]:
>       - CAN [=y] && NET [=y]
> 

