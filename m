Content-Type: multipart/mixed; boundary="===============2200327424611093099=="
MIME-Version: 1.0
From: Hannes Reinecke <hare@suse.de>
To: kbuild-all@lists.01.org
Subject: Re: [dm:for-next 53/58] drivers/md/dm-zoned-metadata.c:779:3: error: implicit declaration of function 'export_uuid'
Date: Fri, 15 May 2020 09:25:35 +0200
Message-ID: <a1e65e5a-4b23-6c6e-d52f-7bf6eb69e7c8@suse.de>
In-Reply-To: <202005151432.U61i8wOc%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2200327424611093099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On 5/15/20 8:32 AM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/lin=
ux-dm.git for-next
> head:   6c871f63986b34c7768080259ddf5991c55ee385
> commit: 70978208ec91d798066f4c291bc98ff914bea222 [53/58] dm zoned: metada=
ta version 2
> config: nios2-allyesconfig (attached as .config)
> compiler: nios2-linux-gcc (GCC) 9.3.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          git checkout 70978208ec91d798066f4c291bc98ff914bea222
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cros=
s ARCH=3Dnios2
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> drivers/md/dm-zoned-metadata.c: In function 'dmz_write_sb':
>>> drivers/md/dm-zoned-metadata.c:779:3: error: implicit declaration of fu=
nction 'export_uuid' [-Werror=3Dimplicit-function-declaration]
> 779 |   export_uuid(sb->dmz_uuid, &zmd->uuid);
> |   ^~~~~~~~~~~
> drivers/md/dm-zoned-metadata.c: In function 'dmz_check_sb':
>>> drivers/md/dm-zoned-metadata.c:1015:3: error: implicit declaration of f=
unction 'import_uuid' [-Werror=3Dimplicit-function-declaration]
> 1015 |   import_uuid(&sb_uuid, sb->dmz_uuid);
> |   ^~~~~~~~~~~
> cc1: some warnings being treated as errors
> =

> vim +/export_uuid +779 drivers/md/dm-zoned-metadata.c
> =

>     761	=

>     762	/*
>     763	 * Write super block of the specified metadata set.
>     764	 */
>     765	static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int se=
t)
>     766	{
>     767		struct dmz_mblock *mblk =3D zmd->sb[set].mblk;
>     768		struct dmz_super *sb =3D zmd->sb[set].sb;
>     769		struct dmz_dev *dev =3D zmd->sb[set].dev;
>     770		sector_t sb_block;
>     771		u64 sb_gen =3D zmd->sb_gen + 1;
>     772		int ret;
>     773	=

>     774		sb->magic =3D cpu_to_le32(DMZ_MAGIC);
>     775	=

>     776		sb->version =3D cpu_to_le32(zmd->sb_version);
>     777		if (zmd->sb_version > 1) {
>     778			BUILD_BUG_ON(UUID_SIZE !=3D 16);
>   > 779			export_uuid(sb->dmz_uuid, &zmd->uuid);
>     780			memcpy(sb->dmz_label, zmd->label, BDEVNAME_SIZE);
>     781			export_uuid(sb->dev_uuid, &dev->uuid);
>     782		}
>     783	=

>     784		sb->gen =3D cpu_to_le64(sb_gen);
>     785	=

>     786		/*
>     787		 * The metadata always references the absolute block address,
>     788		 * ie relative to the entire block range, not the per-device
>     789		 * block address.
>     790		 */
>     791		sb_block =3D zmd->sb[set].zone->id << zmd->zone_nr_blocks_shift;
>     792		sb->sb_block =3D cpu_to_le64(sb_block);
>     793		sb->nr_meta_blocks =3D cpu_to_le32(zmd->nr_meta_blocks);
>     794		sb->nr_reserved_seq =3D cpu_to_le32(zmd->nr_reserved_seq);
>     795		sb->nr_chunks =3D cpu_to_le32(zmd->nr_chunks);
>     796	=

>     797		sb->nr_map_blocks =3D cpu_to_le32(zmd->nr_map_blocks);
>     798		sb->nr_bitmap_blocks =3D cpu_to_le32(zmd->nr_bitmap_blocks);
>     799	=

>     800		sb->crc =3D 0;
>     801		sb->crc =3D cpu_to_le32(crc32_le(sb_gen, (unsigned char *)sb, DM=
Z_BLOCK_SIZE));
>     802	=

>     803		ret =3D dmz_rdwr_block(dev, REQ_OP_WRITE, zmd->sb[set].block,
>     804				     mblk->page);
>     805		if (ret =3D=3D 0)
>     806			ret =3D blkdev_issue_flush(dev->bdev, GFP_NOIO, NULL);
>     807	=

>     808		return ret;
>     809	}
>     810	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =

This is cause by missing commit d01cd62400b3 ("uuid: Add inline helpers =

to import / export UUIDs"), which went into 5.7.
Mind to update your tree?

Cheers,

Hannes
-- =

Dr. Hannes Reinecke            Teamlead Storage & Networking
hare(a)suse.de                               +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
HRB 36809 (AG N=C3=BCrnberg), Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6r=
ffer
--===============2200327424611093099==--

