Received: from 5.mo550.mail-out.ovh.net (5.mo550.mail-out.ovh.net [178.33.45.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3360513AD1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 17:15:26 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.20.237])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 6062924C8C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 16:59:04 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zfdpl (unknown [10.110.115.151])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B81521FDF3;
	Tue, 18 Jul 2023 16:59:01 +0000 (UTC)
Received: from RCM-web4.webmail.mail.ovh.net ([176.31.235.81])
	by ghost-submission-6684bf9d7b-zfdpl with ESMTPSA
	id utcTHtXEtmSNUQEAfcRA7w
	(envelope-from <rafal@milecki.pl>); Tue, 18 Jul 2023 16:59:01 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 18:59:01 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: kernel test robot <lkp@intel.com>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Alban Bedel <albeu@free.fr>, Christian Marangi
 <ansuelsmth@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "nvmem: add new config option"
In-Reply-To: <202307182316.AVNL1wNs-lkp@intel.com>
References: <20230718084804.20139-1-zajec5@gmail.com>
 <202307182316.AVNL1wNs-lkp@intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d9aea2179b54f83084e22eee137819b7@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14184087028245310427
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtjehjtddtredvnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeetheelfefgjedutdeivdduvdethffhhedulefggeeitdejudfhkeetjeekieejgfenucfkphepuddvjedrtddrtddruddpfedurdduuddrvddukedruddtiedpudejiedrfedurddvfeehrdekudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht

On 2023-07-18 18:00, kernel test robot wrote:
>    drivers/mtd/mtdcore.c: In function 'mtd_nvmem_add':
>>> drivers/mtd/mtdcore.c:542:29: warning: unused variable 'node' 
>>> [-Wunused-variable]
>      542 |         struct device_node *node = mtd_get_of_node(mtd);
>          |                             ^~~~

My patch I mentioned:
[PATCH V4] nvmem: add explicit config option to read old syntax fixed OF 
cells

adds following line:
config.add_legacy_fixed_of_cells = of_device_is_compatible(node, 
"nvmem-cells");

So this is a false kernel bot warning (but I understand kernel bot
couldn't understand it needs my other patch).
