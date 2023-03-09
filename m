Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDC0D50B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 16:02:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0DCC222144;
	Thu,  9 Mar 2023 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678377725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4zVFSqmyf9RDe64bjyRp7rfL7ImPtuzZQTByG8VwMU=;
	b=tRR3Wha85MzqLdbmVy69jvx+fFMDt9yPBToC5HQ4XvMUuDlexjx+BN+g3gpTiZmkQOfC8e
	f0h4vR2W92VZgdvgM4il9B096OQiCDtvd6Si39siP3OX/MWTaYmXi1lOyfQOUnyez/mZVg
	14mUmh48VWkUJWMPkMdhKOZ2wunsYOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678377725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4zVFSqmyf9RDe64bjyRp7rfL7ImPtuzZQTByG8VwMU=;
	b=ue3w/+gq4DAqPXlAkjZe8QDAvWdbN+hcD2B52gQEwCtSQ9i9Vyok3JXbVXtlBWbjTdHgfC
	foP9GpXux91lKTAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C24F91391B;
	Thu,  9 Mar 2023 16:02:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hLfJK/wCCmQLbgAAMHmgww
	(envelope-from <lhenriques@suse.de>); Thu, 09 Mar 2023 16:02:04 +0000
Received: from localhost (brahms.olymp [local])
	by brahms.olymp (OpenSMTPD) with ESMTPA id a029511b;
	Thu, 9 Mar 2023 16:02:04 +0000 (UTC)
From: =?utf-8?Q?Lu=C3=ADs_Henriques?= <lhenriques@suse.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] fscrypt: new helper function -
 __fscrypt_prepare_atomic_open()
References: <20230309121910.18939-2-lhenriques@suse.de>
	<202303092108.lUCfozm1-lkp@intel.com>
Date: Thu, 09 Mar 2023 16:02:04 +0000
In-Reply-To: <202303092108.lUCfozm1-lkp@intel.com> (kernel test robot's
	message of "Thu, 9 Mar 2023 21:37:47 +0800")
Message-ID: <87jzzpx69v.fsf@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> writes:

> Hi Lu=C3=ADs,
>
> [FYI, it's a private test report for your RFC patch.]
> [auto build test ERROR on ceph-client/testing]
> [also build test ERROR on ceph-client/for-linus linus/master v6.3-rc1 nex=
t-20230309]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lu-s-Henriques/fsc=
rypt-new-helper-function-__fscrypt_prepare_atomic_open/20230309-202021
> base:   https://github.com/ceph/ceph-client.git testing
> patch link:    https://lore.kernel.org/r/20230309121910.18939-2-lhenrique=
s%40suse.de
> patch subject: [RFC PATCH 1/2] fscrypt: new helper function - __fscrypt_p=
repare_atomic_open()
> config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230309=
/202303092108.lUCfozm1-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=3D1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/bc0e93e713bcb2b95=
af1bcb4ac369a7fe3a72863
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Lu-s-Henriques/fscrypt-new-helpe=
r-function-__fscrypt_prepare_atomic_open/20230309-202021
>         git checkout bc0e93e713bcb2b95af1bcb4ac369a7fe3a72863
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 O=3Dbuild_dir ARCH=3Di386 olddefconfig
>         make W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303092108.lUCfozm1-lkp@i=
ntel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from fs/super.c:34:
>>> include/linux/fscrypt.h:692:5: warning: no previous prototype for '__fs=
crypt_prepare_atomic_open' [-Wmissing-prototypes]
>      692 | int __fscrypt_prepare_atomic_open(struct inode *dir, struct de=
ntry *dentry)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Doh, I forgot to declare the helper as 'static' for the !CONFIG_FS_ENCRYPTI=
ON
case.  But I guess I'll hold on sending a v2 until I get some feedback
from the fscrypt maintainers.

Cheers,
--=20
Lu=C3=ADs

> --
>    ld: fs/ioctl.o: in function `__fscrypt_prepare_atomic_open':
>>> ioctl.c:(.text+0x10a): multiple definition of `__fscrypt_prepare_atomic=
_open'; fs/super.o:super.c:(.text+0x461): first defined here
>    ld: fs/dcache.o: in function `__fscrypt_prepare_atomic_open':
>    dcache.c:(.text+0x897): multiple definition of `__fscrypt_prepare_atom=
ic_open'; fs/super.o:super.c:(.text+0x461): first defined here
>    ld: fs/libfs.o: in function `__fscrypt_prepare_atomic_open':
>    libfs.c:(.text+0x782): multiple definition of `__fscrypt_prepare_atomi=
c_open'; fs/super.o:super.c:(.text+0x461): first defined here
>
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

