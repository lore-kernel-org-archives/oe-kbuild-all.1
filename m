Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBF02583
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 19:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A46B46329207;
	Sat, 13 May 2023 21:35:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8kUiQWiHA3oR; Sat, 13 May 2023 21:35:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E3A7E6329209;
	Sat, 13 May 2023 21:35:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QJ224lwLRLoe; Sat, 13 May 2023 21:35:37 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C4B976329207;
	Sat, 13 May 2023 21:35:37 +0200 (CEST)
Date: Sat, 13 May 2023 21:35:37 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: kernel test robot <lkp@intel.com>
Cc: Hou Tao <houtao1@huawei.com>, oe-kbuild-all <oe-kbuild-all@lists.linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <590831364.9288931.1684006537639.JavaMail.zimbra@nod.at>
In-Reply-To: <202305140230.7MbEpzXY-lkp@intel.com>
References: <202305140230.7MbEpzXY-lkp@intel.com>
Subject: Re: [stable:linux-4.19.y 27/9999] fs/ubifs/ioctl.c:174: Error:
 unrecognized opcode `csrs sstatus,a3'
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: fs/ubifs/ioctl.c:174: Error: unrecognized opcode `csrs sstatus,a3'
Thread-Index: a1zpVStwVS5TsvGfvw47B9BQpi+lWA==

----- Urspr=C3=BCngliche Mail -----
> Von: "kernel test robot" <lkp@intel.com>
> An: "Hou Tao" <houtao1@huawei.com>
> CC: "oe-kbuild-all" <oe-kbuild-all@lists.linux.dev>, "Greg Kroah-Hartman"=
 <gregkh@linuxfoundation.org>, "richard"
> <richard@nod.at>
> Gesendet: Samstag, 13. Mai 2023 20:13:39
> Betreff: [stable:linux-4.19.y 27/9999] fs/ubifs/ioctl.c:174: Error: unrec=
ognized opcode `csrs sstatus,a3'

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le.git
> linux-4.19.y
> head:   cdfda37ab2cfc783a190b563806cda611c35d1e3
> commit: 08ae5ec4be5a6d9e97bebb93d916d666e1763572 [27/9999] ubifs: Reject
> unsupported ioctl flags explicitly
> config: riscv-randconfig-r006-20230511
> (https://download.01.org/0day-ci/archive/20230514/202305140230.7MbEpzXY-l=
kp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin=
/make.cross -O
>        ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        #
>        https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stabl=
e.git/commit/?id=3D08ae5ec4be5a6d9e97bebb93d916d666e1763572
>        git remote add stable
>        https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stabl=
e.git
>        git fetch --no-tags stable linux-4.19.y
>        git checkout 08ae5ec4be5a6d9e97bebb93d916d666e1763572
>        # save the config file
>        mkdir build_dir && cp config build_dir/.config
>        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cros=
s W=3D1 O=3Dbuild_dir
>        ARCH=3Driscv olddefconfig
>        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cros=
s W=3D1 O=3Dbuild_dir
>        ARCH=3Driscv SHELL=3D/bin/bash M=3Dfs/ubifs
>=20
> If you fix the issue, kindly add following tag where applicable
>| Reported-by: kernel test robot <lkp@intel.com>
>| Link: https://lore.kernel.org/oe-kbuild-all/202305140230.7MbEpzXY-lkp@in=
tel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>   fs/ubifs/ioctl.c: Assembler messages:
>>> fs/ubifs/ioctl.c:174: Error: unrecognized opcode `csrs sstatus,a3'
>>> fs/ubifs/ioctl.c:174: Error: unrecognized opcode `csrc sstatus,a3'
>   fs/ubifs/ioctl.c:165: Error: unrecognized opcode `csrs sstatus,a5'
>   fs/ubifs/ioctl.c:165: Error: unrecognized opcode `csrc sstatus,a5'

Is this really ubifs specific? Seems much more like a gcc/binutils mismatch
in your toolchain to me.

Thanks,
//richard
