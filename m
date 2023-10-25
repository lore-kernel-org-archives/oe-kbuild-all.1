Received: from 19.mo583.mail-out.ovh.net (19.mo583.mail-out.ovh.net [46.105.35.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA8330CFE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 22:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=milecki.pl
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.146.168])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id F3E7428821
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 20:29:44 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xdzxr (unknown [10.110.208.177])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9136E1FD81;
	Wed, 25 Oct 2023 20:29:44 +0000 (UTC)
Received: from RCM-web1.webmail.mail.ovh.net ([176.31.238.120])
	by ghost-submission-6684bf9d7b-xdzxr with ESMTPSA
	id 362cFbh6OWWMOgUA4Tup6w
	(envelope-from <rafal@milecki.pl>); Wed, 25 Oct 2023 20:29:44 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 25 Oct 2023 22:29:44 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [srini-nvmem:for-next 1/1] drivers/mtd/mtdcore.c:548:29: warning:
 unused variable 'node'
In-Reply-To: <202310260402.NPx7gZH3-lkp@intel.com>
References: <202310260402.NPx7gZH3-lkp@intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <4c79d7ff70f62e73870137bf4be7bba6@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8842817872044665636
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrledtgddugeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpefgvdduueeuveffudehkeeghfekfffhkeeuudfhleelgfetjeegleeutddvhefgteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghdpiedqrhgtuddrihhtnecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipddujeeirdefuddrvdefkedruddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht

On 2023-10-25 22:24, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git 
> for-next
> head:   ca7384334d9bf741e2768d60887924671c4d9a7f
> commit: ca7384334d9bf741e2768d60887924671c4d9a7f [1/1] Revert "nvmem:
> add new config option"
> config: m68k-allyesconfig
> (https://download.01.org/0day-ci/archive/20231026/202310260402.NPx7gZH3-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20231026/202310260402.NPx7gZH3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> https://lore.kernel.org/oe-kbuild-all/202310260402.NPx7gZH3-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/mtd/mtdcore.c: In function 'mtd_nvmem_add':
>>> drivers/mtd/mtdcore.c:548:29: warning: unused variable 'node' 
>>> [-Wunused-variable]
>      548 |         struct device_node *node = mtd_get_of_node(mtd);
>          |                             ^~~~

This warning comes from applying this patch on top of v6.6-rc1.

It was meant to be applied after my commit 2cc3b37f5b6d ("nvmem: add
explicit config option to read old syntax fixed OF cells") that is now
part of the:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/log/?h=char-misc-next

-- 
Rafał Miłecki
