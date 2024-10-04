Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955DC1459E0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034115; cv=none; b=YSSZDVaHHJZP/PoEjmwS0862JGTj7KuPyW01Y/XyH23WtFViW9QkmRVcrcxboGLhl3cBan3cneWcQysa9Yh1S7nKsmasd1TYrbBTW6sWHZCQka9G3KtC+5RNi2oe8V7Bw6502k0XqRkyK6X5TIYUpIC4VVKhz9+jw5Qssbn4+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034115; c=relaxed/simple;
	bh=uGOuVw7JSWiO+xS7wkf4yJmYtuTiRZH1fUVKRzBC20I=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=jC4YyqvV5jv8OC+JX1z6NAAOrX3IMkb4BkNx91PCISrlwZ8TNLgmlSe0vD8vgrdUX4GUM/7hZsUAEK/07BU3eWOGG9h5vyecVa1BrAvSq6xjSAhqWtsCsUF/tvRvMfBY+EQ9YNJW0Pajstd4H5llNv3azfultCq+HgA0ImFx/NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ag75ymbe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=enqJ6yvz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ag75ymbe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=enqJ6yvz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ag75ymbe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="enqJ6yvz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ag75ymbe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="enqJ6yvz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A7D6C1FE95;
	Fri,  4 Oct 2024 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728034111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CABdBMspvPsDdXnUP4QFosL/whlzV3u0BorMMQMM58=;
	b=Ag75ymbeSoSdy8/+P98+092yx7xljUg3eXqL5F/eZGY/FbMGhauDt41tI2ixsxH2tn1BJr
	vMLSEf0BkkPjT3maRfufYt3a+SfKbDRvQ8ix9ABKO6urA6O0Diy3mispsFaUpD3r/z7luJ
	OCts0XWinMXsqr6hJCNEiAx5+DihBB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728034111;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CABdBMspvPsDdXnUP4QFosL/whlzV3u0BorMMQMM58=;
	b=enqJ6yvzJxPZymt2drHb0pIGeSVEjfEmtPGUlDIWkLsfdadcdfhkWa1fbBdky57Iyl7qS8
	Z8u1MxQYgUGFyJAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728034111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CABdBMspvPsDdXnUP4QFosL/whlzV3u0BorMMQMM58=;
	b=Ag75ymbeSoSdy8/+P98+092yx7xljUg3eXqL5F/eZGY/FbMGhauDt41tI2ixsxH2tn1BJr
	vMLSEf0BkkPjT3maRfufYt3a+SfKbDRvQ8ix9ABKO6urA6O0Diy3mispsFaUpD3r/z7luJ
	OCts0XWinMXsqr6hJCNEiAx5+DihBB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728034111;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CABdBMspvPsDdXnUP4QFosL/whlzV3u0BorMMQMM58=;
	b=enqJ6yvzJxPZymt2drHb0pIGeSVEjfEmtPGUlDIWkLsfdadcdfhkWa1fbBdky57Iyl7qS8
	Z8u1MxQYgUGFyJAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92E7C13A55;
	Fri,  4 Oct 2024 09:28:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mR5gEj21/2YaCwAAD6G6ig
	(envelope-from <neilb@suse.de>); Fri, 04 Oct 2024 09:28:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "kernel test robot" <lkp@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, "Peter Zijlstra" <peterz@infradead.org>
Subject: Re: [peterz-queue:sched/core 1/8] fs/bcachefs/fs.c:181:28: error:
 passing argument 1 of 'bit_waitqueue' from incompatible pointer type
In-reply-to: <202410041649.HreQEkk8-lkp@intel.com>
References: <202410041649.HreQEkk8-lkp@intel.com>
Date: Fri, 04 Oct 2024 19:28:26 +1000
Message-id: <172803410635.1692160.3184328102300453899@noble.neil.brown.name>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO


The compile error mentioned below is caused by my patch, but only
because the code is wrong - so the patch causes wrong code to be
highlighted - which is good.

Commit: 112d21fd1a12 ("bcachefs: switch to rhashtable for vfs inodes hash")

introduced a use for bit_waitqueue for inode->i_state and __I_NEW, and=20

Commit: 0fe340a98b58 ("inode: port __I_NEW to var event")

change inode->i_state to require the new inode_bit_waitqueue().

These were in independant devel branches and this would have been caught
in -next if my patch had already been present.  Sorry I didn't do this
earlier :-)

NeilBrown


On Fri, 04 Oct 2024, kernel test robot wrote:
> Hi NeilBrown,
>=20
> FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sc=
hed/core
> head:   927731dfa8be3059636e928c62518d0fafd901f0
> commit: be52a0b9d87298fb1c4006e2235c2089112c953b [1/8] sched: change wake_u=
p_bit() and related function to expect unsigned long *
> config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/202410=
04/202410041649.HreQEkk8-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241004/202410041649.HreQEkk8-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410041649.HreQEkk8-lkp@i=
ntel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from include/linux/fs.h:6,
>                     from include/linux/highmem.h:5,
>                     from include/linux/bvec.h:10,
>                     from include/linux/blk_types.h:10,
>                     from include/linux/bio.h:10,
>                     from fs/bcachefs/bcachefs.h:188,
>                     from fs/bcachefs/fs.c:4:
>    fs/bcachefs/fs.c: In function '__wait_on_freeing_inode':
> >> fs/bcachefs/fs.c:180:31: error: initialization of 'long unsigned int *' =
from incompatible pointer type 'u32 *' {aka 'unsigned int *'} [-Wincompatible=
-pointer-types]
>      180 |         DEFINE_WAIT_BIT(wait, &inode->i_state, __I_NEW);
>          |                               ^
>    include/linux/wait_bit.h:22:20: note: in definition of macro '__WAIT_BIT=
_KEY_INITIALIZER'
>       22 |         { .flags =3D word, .bit_nr =3D bit, }
>          |                    ^~~~
>    fs/bcachefs/fs.c:180:9: note: in expansion of macro 'DEFINE_WAIT_BIT'
>      180 |         DEFINE_WAIT_BIT(wait, &inode->i_state, __I_NEW);
>          |         ^~~~~~~~~~~~~~~
>    fs/bcachefs/fs.c:180:31: note: (near initialization for 'wait.key.flags')
>      180 |         DEFINE_WAIT_BIT(wait, &inode->i_state, __I_NEW);
>          |                               ^
>    include/linux/wait_bit.h:22:20: note: in definition of macro '__WAIT_BIT=
_KEY_INITIALIZER'
>       22 |         { .flags =3D word, .bit_nr =3D bit, }
>          |                    ^~~~
>    fs/bcachefs/fs.c:180:9: note: in expansion of macro 'DEFINE_WAIT_BIT'
>      180 |         DEFINE_WAIT_BIT(wait, &inode->i_state, __I_NEW);
>          |         ^~~~~~~~~~~~~~~
> >> fs/bcachefs/fs.c:181:28: error: passing argument 1 of 'bit_waitqueue' fr=
om incompatible pointer type [-Wincompatible-pointer-types]
>      181 |         wq =3D bit_waitqueue(&inode->i_state, __I_NEW);
>          |                            ^~~~~~~~~~~~~~~
>          |                            |
>          |                            u32 * {aka unsigned int *}
>    include/linux/wait_bit.h:33:54: note: expected 'long unsigned int *' but=
 argument is of type 'u32 *' {aka 'unsigned int *'}
>       33 | struct wait_queue_head *bit_waitqueue(unsigned long *word, int b=
it);
>          |                                       ~~~~~~~~~~~~~~~^~~~
>=20
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for GET_FREE_REGION
>    Depends on [n]: SPARSEMEM [=3Dn]
>    Selected by [y]:
>    - RESOURCE_KUNIT_TEST [=3Dy] && RUNTIME_TESTING_MENU [=3Dy] && KUNIT [=
=3Dy]
>=20
>=20
> vim +/bit_waitqueue +181 fs/bcachefs/fs.c
>=20
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16    3 =20
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   @4  #include "bcachefs.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16    5  #include "acl.h"
> 07a1006ae81580 Kent Overstreet     2020-12-17    6  #include "bkey_buf.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16    7  #include "btree_update.=
h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16    8  #include "buckets.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16    9  #include "chardev.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   10  #include "dirent.h"
> d4bf5eecd78a90 Kent Overstreet     2022-07-18   11  #include "errcode.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   12  #include "extents.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   13  #include "fs.h"
> 9638574229e3ae Kent Overstreet     2019-10-02   14  #include "fs-common.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   15  #include "fs-io.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   16  #include "fs-ioctl.h"
> dbbfca9f41e869 Kent Overstreet     2023-08-03   17  #include "fs-io-buffere=
d.h"
> dbbfca9f41e869 Kent Overstreet     2023-08-03   18  #include "fs-io-direct.=
h"
> dbbfca9f41e869 Kent Overstreet     2023-08-03   19  #include "fs-io-pagecac=
he.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   20  #include "fsck.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   21  #include "inode.h"
> 1809b8cba756d3 Kent Overstreet     2023-09-10   22  #include "io_read.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   23  #include "journal.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   24  #include "keylist.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   25  #include "quota.h"
> 8e877caaad8185 Kent Overstreet     2023-08-16   26  #include "snapshot.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   27  #include "super.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   28  #include "xattr.h"
> 747d1d6c7efdfb Youling Tang        2024-05-31   29  #include "trace.h"
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   30 =20
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   31  #include <linux/aio.h>
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   32  #include <linux/backing=
-dev.h>
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   33  #include <linux/exportf=
s.h>
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   34  #include <linux/fiemap.=
h>
> 929d954330142a Thomas Bertschinger 2024-05-27   35  #include <linux/fs_cont=
ext.h>
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   36  #include <linux/module.=
h>
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   37  #include <linux/pagemap=
.h>
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   38  #include <linux/posix_a=
cl.h>
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   39  #include <linux/random.=
h>
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   40  #include <linux/seq_fil=
e.h>
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   41  #include <linux/statfs.=
h>
> ffcf9ec78c133f Stijn Tintel        2021-05-13   42  #include <linux/string.=
h>
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   43  #include <linux/xattr.h>
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   44 =20
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   45  static struct kmem_cach=
e *bch2_inode_cache;
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   46 =20
> 32b26e8c7f6418 Kent Overstreet     2021-11-06   47  static void bch2_vfs_in=
ode_init(struct btree_trans *, subvol_inum,
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   48  				struct bch_inode_in=
fo *,
> 9ca4853b98af5f Kent Overstreet     2021-10-27   49  				struct bch_inode_un=
packed *,
> 9ca4853b98af5f Kent Overstreet     2021-10-27   50  				struct bch_subvolum=
e *);
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   51 =20
> 32b26e8c7f6418 Kent Overstreet     2021-11-06   52  void bch2_inode_update_=
after_write(struct btree_trans *trans,
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   53  				   struct bch_inode=
_info *inode,
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   54  				   struct bch_inode=
_unpacked *bi,
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   55  				   unsigned fields)
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   56  {
> 32b26e8c7f6418 Kent Overstreet     2021-11-06   57  	struct bch_fs *c =3D t=
rans->c;
> 32b26e8c7f6418 Kent Overstreet     2021-11-06   58 =20
> 32b26e8c7f6418 Kent Overstreet     2021-11-06   59  	BUG_ON(bi->bi_inum !=
=3D inode->v.i_ino);
> 32b26e8c7f6418 Kent Overstreet     2021-11-06   60 =20
> 385f0c05d670a2 Kent Overstreet     2024-06-08   61  	bch2_assert_pos_locked=
(trans, BTREE_ID_inodes, POS(0, bi->bi_inum));
> 32b26e8c7f6418 Kent Overstreet     2021-11-06   62 =20
> b43a0f60a61e8e Kent Overstreet     2019-09-25   63  	set_nlink(&inode->v, b=
ch2_inode_nlink_get(bi));
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   64  	i_uid_write(&inode->v,=
 bi->bi_uid);
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   65  	i_gid_write(&inode->v,=
 bi->bi_gid);
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   66  	inode->v.i_mode	=3D bi=
->bi_mode;
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   67 =20
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   68  	if (fields & ATTR_ATIM=
E)
> 9e87705289667a Linus Torvalds      2023-10-30   69  		inode_set_atime_to_ts=
(&inode->v, bch2_time_to_timespec(c, bi->bi_atime));
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   70  	if (fields & ATTR_MTIM=
E)
> 9e87705289667a Linus Torvalds      2023-10-30   71  		inode_set_mtime_to_ts=
(&inode->v, bch2_time_to_timespec(c, bi->bi_mtime));
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   72  	if (fields & ATTR_CTIM=
E)
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   73  		inode_set_ctime_to_ts=
(&inode->v, bch2_time_to_timespec(c, bi->bi_ctime));
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   74 =20
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   75  	inode->ei_inode		=3D *=
bi;
> 2ea9004864b918 Kent Overstreet     2018-07-17   76 =20
> 2ea9004864b918 Kent Overstreet     2018-07-17   77  	bch2_inode_flags_to_vf=
s(inode);
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   78  }
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   79 =20
> 2ea9004864b918 Kent Overstreet     2018-07-17   80  int __must_check bch2_w=
rite_inode(struct bch_fs *c,
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   81  				  struct bch_inode_=
info *inode,
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   82  				  inode_set_fn set,
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   83  				  void *p, unsigned=
 fields)
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   84  {
> 6bd68ec266ad71 Kent Overstreet     2023-09-12   85  	struct btree_trans *tr=
ans =3D bch2_trans_get(c);
> 67e0dd8f0d8b4b Kent Overstreet     2021-08-30   86  	struct btree_iter iter=
 =3D { NULL };
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   87  	struct bch_inode_unpac=
ked inode_u;
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   88  	int ret;
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   89  retry:
> 6bd68ec266ad71 Kent Overstreet     2023-09-12   90  	bch2_trans_begin(trans=
);
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   91 =20
> 6bd68ec266ad71 Kent Overstreet     2023-09-12   92  	ret   =3D bch2_inode_p=
eek(trans, &iter, &inode_u, inode_inum(inode),
> 5dd8c60e1e0448 Kent Overstreet     2024-04-07   93  				BTREE_ITER_intent) =
?:
> 6bd68ec266ad71 Kent Overstreet     2023-09-12   94  		(set ? set(trans, ino=
de, &inode_u, p) : 0) ?:
> 6bd68ec266ad71 Kent Overstreet     2023-09-12   95  		bch2_inode_write(tran=
s, &iter, &inode_u) ?:
> cb52d23e77a6e5 Kent Overstreet     2023-11-11   96  		bch2_trans_commit(tra=
ns, NULL, NULL, BCH_TRANS_COMMIT_no_enospc);
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   97 =20
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   98  	/*
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16   99  	 * the btree node lock=
 protects inode->ei_inode, not ei_update_lock;
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16  100  	 * this is important f=
or inode updates via bchfs_write_index_update
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16  101  	 */
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16  102  	if (!ret)
> 6bd68ec266ad71 Kent Overstreet     2023-09-12  103  		bch2_inode_update_aft=
er_write(trans, inode, &inode_u, fields);
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16  104 =20
> 6bd68ec266ad71 Kent Overstreet     2023-09-12  105  	bch2_trans_iter_exit(t=
rans, &iter);
> 47c46c95316390 Kent Overstreet     2020-04-01  106 =20
> 549d173c1bd9b5 Kent Overstreet     2022-07-17  107  	if (bch2_err_matches(r=
et, BCH_ERR_transaction_restart))
> 47c46c95316390 Kent Overstreet     2020-04-01  108  		goto retry;
> 47c46c95316390 Kent Overstreet     2020-04-01  109 =20
> e47a390aa5946e Kent Overstreet     2023-05-27  110  	bch2_fs_fatal_err_on(b=
ch2_err_matches(ret, ENOENT), c,
> 112d21fd1a122f Kent Overstreet     2024-06-08  111  			     "%s: inode %llu=
:%llu not found when updating",
> 3ed94062e3801e Kent Overstreet     2024-03-17  112  			     bch2_err_str(re=
t),
> 711bf946d55d28 Kent Overstreet     2023-03-15  113  			     inode_inum(inod=
e).subvol,
> 711bf946d55d28 Kent Overstreet     2023-03-15  114  			     inode_inum(inod=
e).inum);
> 711bf946d55d28 Kent Overstreet     2023-03-15  115 =20
> 6bd68ec266ad71 Kent Overstreet     2023-09-12  116  	bch2_trans_put(trans);
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16  117  	return ret < 0 ? ret :=
 0;
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16  118  }
> 1c6fdbd8f2465d Kent Overstreet     2017-03-16  119 =20
> 0f5254aa98befa Kent Overstreet     2018-12-17  120  int bch2_fs_quota_trans=
fer(struct bch_fs *c,
> 0f5254aa98befa Kent Overstreet     2018-12-17  121  			   struct bch_inode_=
info *inode,
> 0f5254aa98befa Kent Overstreet     2018-12-17  122  			   struct bch_qid ne=
w_qid,
> 0f5254aa98befa Kent Overstreet     2018-12-17  123  			   unsigned qtypes,
> 0f5254aa98befa Kent Overstreet     2018-12-17  124  			   enum quota_acct_m=
ode mode)
> 0f5254aa98befa Kent Overstreet     2018-12-17  125  {
> 0f5254aa98befa Kent Overstreet     2018-12-17  126  	unsigned i;
> 0f5254aa98befa Kent Overstreet     2018-12-17  127  	int ret;
> 0f5254aa98befa Kent Overstreet     2018-12-17  128 =20
> 0f5254aa98befa Kent Overstreet     2018-12-17  129  	qtypes &=3D enabled_qt=
ypes(c);
> 0f5254aa98befa Kent Overstreet     2018-12-17  130 =20
> 0f5254aa98befa Kent Overstreet     2018-12-17  131  	for (i =3D 0; i < QTYP=
_NR; i++)
> 0f5254aa98befa Kent Overstreet     2018-12-17  132  		if (new_qid.q[i] =3D=
=3D inode->ei_qid.q[i])
> 0f5254aa98befa Kent Overstreet     2018-12-17  133  			qtypes &=3D ~(1U << =
i);
> 0f5254aa98befa Kent Overstreet     2018-12-17  134 =20
> 0f5254aa98befa Kent Overstreet     2018-12-17  135  	if (!qtypes)
> 0f5254aa98befa Kent Overstreet     2018-12-17  136  		return 0;
> 0f5254aa98befa Kent Overstreet     2018-12-17  137 =20
> 0f5254aa98befa Kent Overstreet     2018-12-17  138  	mutex_lock(&inode->ei_=
quota_lock);
> 0f5254aa98befa Kent Overstreet     2018-12-17  139 =20
> 0f5254aa98befa Kent Overstreet     2018-12-17  140  	ret =3D bch2_quota_tra=
nsfer(c, qtypes, new_qid,
> 0f5254aa98befa Kent Overstreet     2018-12-17  141  				  inode->ei_qid,
> 0f5254aa98befa Kent Overstreet     2018-12-17  142  				  inode->v.i_blocks=
 +
> 0f5254aa98befa Kent Overstreet     2018-12-17  143  				  inode->ei_quota_r=
eserved,
> 0f5254aa98befa Kent Overstreet     2018-12-17  144  				  mode);
> 0f5254aa98befa Kent Overstreet     2018-12-17  145  	if (!ret)
> 0f5254aa98befa Kent Overstreet     2018-12-17  146  		for (i =3D 0; i < QTY=
P_NR; i++)
> 0f5254aa98befa Kent Overstreet     2018-12-17  147  			if (qtypes & (1 << i=
))
> 0f5254aa98befa Kent Overstreet     2018-12-17  148  				inode->ei_qid.q[i] =
=3D new_qid.q[i];
> 0f5254aa98befa Kent Overstreet     2018-12-17  149 =20
> 0f5254aa98befa Kent Overstreet     2018-12-17  150  	mutex_unlock(&inode->e=
i_quota_lock);
> 0f5254aa98befa Kent Overstreet     2018-12-17  151 =20
> 0f5254aa98befa Kent Overstreet     2018-12-17  152  	return ret;
> 0f5254aa98befa Kent Overstreet     2018-12-17  153  }
> 0f5254aa98befa Kent Overstreet     2018-12-17  154 =20
> 112d21fd1a122f Kent Overstreet     2024-06-08  155  static bool subvol_inum=
_eq(subvol_inum a, subvol_inum b)
> 284ae18c1d7aa4 Kent Overstreet     2021-03-16  156  {
> 112d21fd1a122f Kent Overstreet     2024-06-08  157  	return a.subvol =3D=3D=
 b.subvol && a.inum =3D=3D b.inum;
> 284ae18c1d7aa4 Kent Overstreet     2021-03-16  158  }
> 284ae18c1d7aa4 Kent Overstreet     2021-03-16  159 =20
> 112d21fd1a122f Kent Overstreet     2024-06-08  160  static int bch2_vfs_ino=
de_cmp_fn(struct rhashtable_compare_arg *arg,
> 112d21fd1a122f Kent Overstreet     2024-06-08  161  				 const void *obj)
> 284ae18c1d7aa4 Kent Overstreet     2021-03-16  162  {
> 112d21fd1a122f Kent Overstreet     2024-06-08  163  	const struct bch_inode=
_info *inode =3D obj;
> 112d21fd1a122f Kent Overstreet     2024-06-08  164  	const subvol_inum *v =
=3D arg->key;
> 284ae18c1d7aa4 Kent Overstreet     2021-03-16  165 =20
> 112d21fd1a122f Kent Overstreet     2024-06-08  166  	return !subvol_inum_eq=
(inode->ei_inum, *v);
> 284ae18c1d7aa4 Kent Overstreet     2021-03-16  167  }
> 284ae18c1d7aa4 Kent Overstreet     2021-03-16  168 =20
> 112d21fd1a122f Kent Overstreet     2024-06-08  169  static const struct rha=
shtable_params bch2_vfs_inodes_params =3D {
> 112d21fd1a122f Kent Overstreet     2024-06-08  170  	.head_offset		=3D offs=
etof(struct bch_inode_info, hash),
> 112d21fd1a122f Kent Overstreet     2024-06-08  171  	.key_offset		=3D offse=
tof(struct bch_inode_info, ei_inum),
> 112d21fd1a122f Kent Overstreet     2024-06-08  172  	.key_len		=3D sizeof(s=
ubvol_inum),
> 112d21fd1a122f Kent Overstreet     2024-06-08  173  	.obj_cmpfn		=3D bch2_v=
fs_inode_cmp_fn,
> 112d21fd1a122f Kent Overstreet     2024-06-08  174  	.automatic_shrinking	=
=3D true,
> 112d21fd1a122f Kent Overstreet     2024-06-08  175  };
> 112d21fd1a122f Kent Overstreet     2024-06-08  176 =20
> 112d21fd1a122f Kent Overstreet     2024-06-08  177  static void __wait_on_f=
reeing_inode(struct inode *inode)
> 284ae18c1d7aa4 Kent Overstreet     2021-03-16  178  {
> 112d21fd1a122f Kent Overstreet     2024-06-08  179  	wait_queue_head_t *wq;
> 112d21fd1a122f Kent Overstreet     2024-06-08 @180  	DEFINE_WAIT_BIT(wait, =
&inode->i_state, __I_NEW);
> 112d21fd1a122f Kent Overstreet     2024-06-08 @181  	wq =3D bit_waitqueue(&=
inode->i_state, __I_NEW);
> 112d21fd1a122f Kent Overstreet     2024-06-08  182  	prepare_to_wait(wq, &w=
ait.wq_entry, TASK_UNINTERRUPTIBLE);
> 112d21fd1a122f Kent Overstreet     2024-06-08  183  	spin_unlock(&inode->i_=
lock);
> 112d21fd1a122f Kent Overstreet     2024-06-08  184  	schedule();
> 112d21fd1a122f Kent Overstreet     2024-06-08  185  	finish_wait(wq, &wait.=
wq_entry);
> 284ae18c1d7aa4 Kent Overstreet     2021-03-16  186  }
> 284ae18c1d7aa4 Kent Overstreet     2021-03-16  187 =20
>=20
> :::::: The code at line 181 was first introduced by commit
> :::::: 112d21fd1a122f778c383aa44d5448f4da9518c3 bcachefs: switch to rhashta=
ble for vfs inodes hash
>=20
> :::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
> :::::: CC: Kent Overstreet <kent.overstreet@linux.dev>
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20

