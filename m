Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB711860
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Oct 2022 07:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1666855161; bh=CWH0BUUamUN1zm+MuWmdKWd09o8PW11B0POVZLimdi4=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=rdSp3UupTC0WlSoZMqUTaZmN559DBXgQp5fEmKObnzfnrgdEgeHIopJdRGerEDRES
	 ITbjwIi8komcpnOIXhdc8pWs8hhWj0HDDvvqdLIMXxyzYLdjVkqQGQQTy6YTuYz33q
	 VvN3PgNB9JKebxNlKgS/sMNJPIK0Xg3B9NaWbwYncq3cUdWULjBz70CR7Lw7djOGdj
	 adyqbHUUx+MivfIgQQT3jOt7gO2/ObBELY9JuBt6zCFQzgXjfQOVjGgA8FBBNjMpyb
	 HeUH27mSBVly7mb7CXKD3ITOEQY3S9qKeNsR/Oj7Cb8XMuTfj0J73jY6FDFKDC6Fuz
	 Drbw7VXTMoC8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.164.228]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MirjS-1pJyX72Q9E-00ewTs; Thu, 27
 Oct 2022 09:19:21 +0200
Message-ID: <6a1a6b3b-a3dd-ffcf-aa2e-e0722b389bd4@gmx.de>
Date: Thu, 27 Oct 2022 09:19:20 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [linux-next:master 2035/3509] ERROR: modpost:
 "iosapic_serial_irq" [drivers/tty/serial/8250/8250_parisc.ko] undefined!
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202210270740.vg9kIwKJ-lkp@intel.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <202210270740.vg9kIwKJ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jxCjpA0YthpZT/XERhN9iszjn4yK/zEAlg8OMCdysuQ/H5WTC0U
 lGaUcyq7vr8wIZaS1egMD8WJ9RaEqOVVECyuamW+/4lbXT2ykotoM+mJaaLlffQivwowGhI
 df3EUILVE+poforYgCJdVcXjQ7Bc+6RAEG6z/l4G05UpITjteoTIT7NnJzApFfkPeOPDyEM
 oqlr2RJT669Gq96ob79GQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MEHDUk+vulw=;fauG1Lv9bWJ7TnPbtba5+7L72DH
 Bi8laYUM5+oNmmWgtfoDmTikGTGCMtdkQ8gR1q+xbxlRqMnbXHGH9y1/UGQe4Y2n4r1dfPTR2
 LNDfi5ZsSTmre6Y8mGJ/9agkr21DN/nA2UpphuVjawYBX8c2REGbBEEnY6nB0FYHHwDcYlKco
 u0psEhbVrGRVZC5x+vbUGF0hB9ntQAmmD8KNDML3pf9JQbYYFBJejhu5SHjWYqFOg0ssCGpFe
 u+DGBYx0CRKQVQl/sh3reIbHAwapa9YVKnYlMBQMOAcWq5aWHfChI3Kt9HS87UF5a5I0bd9ev
 bObwTve5SNXXjpORDagoC5Qe0Mm2GkDv770RlE5eov/7XdWKe3DECoyFi+PPOPwnOxK4stRaN
 NGilGizzxu9DWGaNEyEeZi3Mk/0SREwXMUfgsaeBOSwgygFxMgp6H048IF4b6BpsLR24MysRp
 bSjZOfowtPqtJst8rDUWT1qR+IQCdXDpuL4ePD3ZKG7mY2KhI6DFbn40cOPD24L4MQUHgRQN8
 I7jZUsFAAEoWJnw7lczyszxXYjTTxFaGZDZO3iizhg42m/0KiuKELamQjmfGp/3BIRK6y4dsm
 HaKYFGcyzm0H5G2G+pi4k0ZUsu+3tDaYk8z1jtxmYC/Z7GUvI8Gc8ToZ27bVd/8A/XqzfTSgW
 wEl7DN3DEv8kg/lIMuaVUInw/qPBbEJWVf91KtjcMNiDhDtPAQ+o9LxfyfXatf05M5Xqh1ubX
 ehrgJbItOpARqQTwwl2sPRYy/lRWyg2DfXMZdnNZ0uVdXyig0rRtcUgRqWXruvp9F46/3saIN
 29USaKxa2DpwZAnukLLeIApflAxgqD4/qTtC29cJMb8mEKbCqI6yns1BNJxSCNRjEVbd0wxWG
 5vIuE/1ZC1djmD2za05gsGCTUbwe32nvM3j92O7tOFdfbRq0MUsQks4lMAMgH+79dvF0WYzpQ
 ylkAcA==

On 10/27/22 02:04, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git master
> head:   60eac8672b5b6061ec07499c0f1b79f6d94311ce
> commit: 9e4e2ce1a78ed92ed91135e90c85f27d75388129 [2035/3509] parisc/seri=
al: Rename 8250_gsc.c to 8250_parisc.c
> config: parisc-randconfig-s031-20221026
> compiler: hppa64-linux-gcc (GCC) 12.1.0
>
>>> ERROR: modpost: "iosapic_serial_irq" [drivers/tty/serial/8250/8250_par=
isc.ko] undefined!

Nice catch.
I fixed it with a commit to the parisc git tree, which exports that symbol=
.
So this error should disappear soon in for-next.

Thanks,
Helge
