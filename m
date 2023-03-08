Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E786C8BF3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 19:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XIF03nYXb5dhhTsEarU3WDCs8g6Dey25jT9N9ETyFXc=; b=fdvs7woN8vUOfm9nn8vNS5eUSA
	hkdh31Uohq3PgWKNV7uvULme7LUjMHiCKGFlSHz+3UlxCnPiEL7B5M/36OkgGGNtf7BkpaO9SYIXr
	xbaeaKF6H+cVrvKg5UhYfE3Wb8Hr4JpngdkthEwXqGYYOdA+EFlmJdJFS7TiVgpd8vBVrWDlOu4Nv
	BV0/ofvogU2CrTAZcEVl+qJjiEh8WIdVLr02AgRCAN82J24hZUkdULmr9KNkvFqGtibcw7EpxjEvU
	k15mHi8QBb654JNLZh1sdHhMRiDzCf2ghGdLanjiBFFf/65Xpj2WJOfqRPZVrMOLKA8XaMbo9SIS+
	CQ3gbVtw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZzw3-006c2o-Ro; Wed, 08 Mar 2023 19:58:51 +0000
Date: Wed, 8 Mar 2023 11:58:51 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Jason Baron <jbaron@akamai.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 816/1532]
 drivers/infiniband/ulp/srp/ib_srp.c:66: warning:
 "DEFINE_DYNAMIC_DEBUG_METADATA" redefined
Message-ID: <ZAjo+2O/GhcAb7mc@bombadil.infradead.org>
References: <202303071444.sIbZTDCy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303071444.sIbZTDCy-lkp@intel.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Tue, Mar 07, 2023 at 02:37:52PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   709c6adf19dc558e44ab5c01659b09a16a2d3c82
> commit: b1ec22f8dc85bb0b2e82a528a7ebca377f46d4cb [816/1532] dyndbg: use the module notifier callbacks
> config: arc-randconfig-r011-20230305 (https://download.01.org/0day-ci/archive/20230307/202303071444.sIbZTDCy-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):

Jason can you take a look?

  Luis
