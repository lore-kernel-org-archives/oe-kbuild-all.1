Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1183A20EE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 07:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7seXEgAdc8qPGxtHP21kULUfiKGh1FHlFgwWdj5tgX8=; b=dyWOBGt395EKWiyJ4Ng3oSACSi
	7j4aP8ZU/bcIjQsOeK4keygeQh3DGRQak0zyTx2paHMsIEDIzbg31AhUsFKum/I429uM9J0QGP6EL
	beYcLjGIP1FfENpsguGmVEsx+Nra9o3wnahGWJe/MPy5WGAG66TW6jrcrctt13+7rwm40wbFBD4UW
	H7lAO94m4Aq5V92/iPUdWlsrdtyZH4FsbTw+Z6J37j4K0hLAxocaSjrF5QewaCD8yAyJ1f1dH9d0N
	0NlZUFchqPrkUR2ulcuI4S3K6M8b6ded2u93PTY5JIojHZNYmcxuiPPUwq3Vs7d59J3XtPTsmd9vl
	wy0IVE6w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pZR82-00EWSX-2x;
	Tue, 07 Mar 2023 06:48:55 +0000
Date: Tue, 7 Mar 2023 06:48:54 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:viro/vfs/work.minix 3/4] fs/sysv/dir.c:32:
 multiple definition of `dir_put_page'; fs/minix/dir.o:fs/minix/dir.c:30:
 first defined here
Message-ID: <20230307064854.GC3390869@ZenIV>
References: <202303071352.h8Mj6c0x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303071352.h8Mj6c0x-lkp@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Mar 07, 2023 at 01:13:55PM +0800, kernel test robot wrote:
> tree:   https://github.com/ammarfaizi2/linux-block viro/vfs/work.minix
> head:   39d0d7f9b65f1fe91c5ba6d375f1ddb0c34fe843
> commit: b7176563af9725b556c512d0fee2dbd051839147 [3/4] minixfs: Use dir_put_page() in minix_unlink() and minix_rename()
> config: i386-randconfig-a005-20230306 (https://download.01.org/0day-ci/archive/20230307/202303071352.h8Mj6c0x-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/ammarfaizi2/linux-block/commit/b7176563af9725b556c512d0fee2dbd051839147
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block viro/vfs/work.minix
>         git checkout b7176563af9725b556c512d0fee2dbd051839147
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 olddefconfig
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303071352.h8Mj6c0x-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: fs/sysv/dir.o: in function `dir_put_page':
> >> fs/sysv/dir.c:32: multiple definition of `dir_put_page'; fs/minix/dir.o:fs/minix/dir.c:30: first defined here

Grrr...  FWIW, it ought to be static inline in both of them,
and quite likely - moved over to some place like highmem.h.

put_and_unmap_page(page, addr), perhaps?
