Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FAB3210
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jan 2023 11:14:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8E3416AC3B;
	Fri, 13 Jan 2023 11:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1673608447;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aZNc6Ts8gsC2qFGxunll1fDXhnQd5a/ni0dEVqb5OHw=;
	b=c/2i0LBZ78Z/OeDSPY8gxc5nEo+4KFKm054nlr1pr6P9FmdvP23kFDhDRfTPHl+peXbWK0
	H5LiMv+Q3u9L3Y1Iksh82YsegOYpqZl03xTA63800FH5j74e+JKoKSjXPvNiZUPuaur6fg
	IPWVD8xrOd+CFBlrp+fvc5/Ct6+LLg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1673608447;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aZNc6Ts8gsC2qFGxunll1fDXhnQd5a/ni0dEVqb5OHw=;
	b=IYfnUA/cCKQoaF496h7ISWza8pQMUuWPmCADrEyMYyjPDRbxV011FxjN2etLIVd01S9RzI
	nc8DjATNn3/+BICg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5DC8B1358A;
	Fri, 13 Jan 2023 11:14:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id FeHwFf88wWMxLQAAMHmgww
	(envelope-from <dsterba@suse.cz>); Fri, 13 Jan 2023 11:14:07 +0000
Date: Fri, 13 Jan 2023 12:08:31 +0100
From: David Sterba <dsterba@suse.cz>
To: kernel test robot <lkp@intel.com>
Cc: Boris Burkov <boris@bur.io>, oe-kbuild-all@lists.linux.dev,
	David Sterba <dsterba@suse.com>
Subject: Re: [kdave-btrfs-devel:misc-next 34/37] fs/btrfs/block-group.c:584:
 undefined reference to `__udivdi3'
Message-ID: <20230113110831.GS11562@suse.cz>
Reply-To: dsterba@suse.cz
References: <202301131428.Ld2Yt4mV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301131428.Ld2Yt4mV-lkp@intel.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)

On Fri, Jan 13, 2023 at 02:45:47PM +0800, kernel test robot wrote:
> tree:   https://github.com/kdave/btrfs-devel.git misc-next
> head:   84efa3e1284659ad6b9e1663390564b6adb8f595
> commit: 083f74fb93fb92e6e9faa60e20318fcbd4a0ae98 [34/37] btrfs: load block group size class when caching
> config: i386-randconfig-a014
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/kdave/btrfs-devel/commit/083f74fb93fb92e6e9faa60e20318fcbd4a0ae98
>         git remote add kdave-btrfs-devel https://github.com/kdave/btrfs-devel.git
>         git fetch --no-tags kdave-btrfs-devel misc-next
>         git checkout 083f74fb93fb92e6e9faa60e20318fcbd4a0ae98
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 olddefconfig
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    ld: fs/btrfs/block-group.o: in function `sample_block_group_extent_item':
> >> fs/btrfs/block-group.c:584: undefined reference to `__udivdi3'

My reference 32bit build does not report that:

$ make ARCH=i386
fs/btrfs/block-group.o
  CALL    scripts/checksyscalls.sh
  CC [M]  fs/btrfs/block-group.o

I guess it's because gcc 12.2.1 can do the 64bit division without the
library, which is good but until 12 is the minimum required version it
still needs to be fixed in code.
