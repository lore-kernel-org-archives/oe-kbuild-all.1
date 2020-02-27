Content-Type: multipart/mixed; boundary="===============7631023269323772561=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [ambarus:spi-nor/next 8/8] drivers/mtd/spi-nor/sfdp.c:701:38: sparse: sparse: dubious: x | !y
Date: Thu, 27 Feb 2020 17:24:16 +0800
Message-ID: <202002271710.riNkV6EU%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7631023269323772561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/ambarus/linux-0day spi-nor/next
head:   45d79d5c22c864993448fe8cc8b369a2217b7567
commit: 45d79d5c22c864993448fe8cc8b369a2217b7567 [8/8] mtd: spi-nor: Move S=
FDP out of the core
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout 45d79d5c22c864993448fe8cc8b369a2217b7567
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/mtd/spi-nor/sfdp.c:701:38: sparse: sparse: dubious: x | !y
>> drivers/mtd/spi-nor/sfdp.c:1106:13: sparse: sparse: cast to restricted _=
_le32

vim +701 drivers/mtd/spi-nor/sfdp.c

   650	=

   651	/**
   652	 * spi_nor_get_map_in_use() - get the configuration map in use
   653	 * @nor:	pointer to a 'struct spi_nor'
   654	 * @smpt:	pointer to the sector map parameter table
   655	 * @smpt_len:	sector map parameter table length
   656	 *
   657	 * Return: pointer to the map in use, ERR_PTR(-errno) otherwise.
   658	 */
   659	static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const =
u32 *smpt,
   660						 u8 smpt_len)
   661	{
   662		const u32 *ret;
   663		u8 *buf;
   664		u32 addr;
   665		int err;
   666		u8 i;
   667		u8 addr_width, read_opcode, read_dummy;
   668		u8 read_data_mask, map_id;
   669	=

   670		/* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
   671		buf =3D kmalloc(sizeof(*buf), GFP_KERNEL);
   672		if (!buf)
   673			return ERR_PTR(-ENOMEM);
   674	=

   675		addr_width =3D nor->addr_width;
   676		read_dummy =3D nor->read_dummy;
   677		read_opcode =3D nor->read_opcode;
   678	=

   679		map_id =3D 0;
   680		/* Determine if there are any optional Detection Command Descriptor=
s */
   681		for (i =3D 0; i < smpt_len; i +=3D 2) {
   682			if (smpt[i] & SMPT_DESC_TYPE_MAP)
   683				break;
   684	=

   685			read_data_mask =3D SMPT_CMD_READ_DATA(smpt[i]);
   686			nor->addr_width =3D spi_nor_smpt_addr_width(nor, smpt[i]);
   687			nor->read_dummy =3D spi_nor_smpt_read_dummy(nor, smpt[i]);
   688			nor->read_opcode =3D SMPT_CMD_OPCODE(smpt[i]);
   689			addr =3D smpt[i + 1];
   690	=

   691			err =3D spi_nor_read_raw(nor, addr, 1, buf);
   692			if (err) {
   693				ret =3D ERR_PTR(err);
   694				goto out;
   695			}
   696	=

   697			/*
   698			 * Build an index value that is used to select the Sector Map
   699			 * Configuration that is currently in use.
   700			 */
 > 701			map_id =3D map_id << 1 | !!(*buf & read_data_mask);
   702		}
   703	=

   704		/*
   705		 * If command descriptors are provided, they always precede map
   706		 * descriptors in the table. There is no need to start the iteration
   707		 * over smpt array all over again.
   708		 *
   709		 * Find the matching configuration map.
   710		 */
   711		ret =3D ERR_PTR(-EINVAL);
   712		while (i < smpt_len) {
   713			if (SMPT_MAP_ID(smpt[i]) =3D=3D map_id) {
   714				ret =3D smpt + i;
   715				break;
   716			}
   717	=

   718			/*
   719			 * If there are no more configuration map descriptors and no
   720			 * configuration ID matched the configuration identifier, the
   721			 * sector address map is unknown.
   722			 */
   723			if (smpt[i] & SMPT_DESC_END)
   724				break;
   725	=

   726			/* increment the table index to the next map */
   727			i +=3D SMPT_MAP_REGION_COUNT(smpt[i]) + 1;
   728		}
   729	=

   730		/* fall through */
   731	out:
   732		kfree(buf);
   733		nor->addr_width =3D addr_width;
   734		nor->read_dummy =3D read_dummy;
   735		nor->read_opcode =3D read_opcode;
   736		return ret;
   737	}
   738	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7631023269323772561==--

