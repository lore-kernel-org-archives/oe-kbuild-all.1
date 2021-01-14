Content-Type: multipart/mixed; boundary="===============8640606206487090034=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [intel-linux-intel-lts:5.4/yocto 1/13] drivers/mtd/spi-nor/core.c:3383:34: sparse: sparse: cast to restricted __le32
Date: Thu, 14 Jan 2021 20:14:47 +0800
Message-ID: <202101142036.Xqja9Yjp-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8640606206487090034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Boris,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/intel/linux-intel-lts.git 5.4/yocto
head:   756623e2f190038a96e780f5f07990a065ebf2b9
commit: 4541b62447f9a65c9192597304d5f6cd11664386 [1/13] mtd: spi-nor: Prepa=
re core / manufacturer code split
config: i386-randconfig-s001-20210114 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        # https://github.com/intel/linux-intel-lts/commit/4541b62447f9a65c9=
192597304d5f6cd11664386
        git remote add intel-linux-intel-lts https://github.com/intel/linux=
-intel-lts.git
        git fetch --no-tags intel-linux-intel-lts 5.4/yocto
        git checkout 4541b62447f9a65c9192597304d5f6cd11664386
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> drivers/mtd/spi-nor/core.c:3383:34: sparse: sparse: cast to restricted _=
_le32
>> drivers/mtd/spi-nor/core.c:3651:38: sparse: sparse: dubious: x | !y
   drivers/mtd/spi-nor/core.c:3837:27: sparse: sparse: cast to restricted _=
_le32
   drivers/mtd/spi-nor/core.c:3931:29: sparse: sparse: cast to restricted _=
_le32
   drivers/mtd/spi-nor/core.c:4071:13: sparse: sparse: cast to restricted _=
_le32

vim +3383 drivers/mtd/spi-nor/core.c

2aaa5f7e0c07a0f1 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2018-12-06  =
3324  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3325  /**
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3326   * spi_nor_parse_bfpt() - read and parse the Basic Flash Parameter Ta=
ble.
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3327   * @nor:		pointer to a 'struct spi_nor'
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3328   * @bfpt_header:	pointer to the 'struct sfdp_parameter_header' descri=
bing
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3329   *			the Basic Flash Parameter Table length and version
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3330   * @params:		pointer to the 'struct spi_nor_flash_parameter' to be
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3331   *			filled
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3332   *
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3333   * The Basic Flash Parameter Table is the main and only mandatory tab=
le as
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3334   * defined by the SFDP (JESD216) specification.
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3335   * It provides us with the total size (memory density) of the data ar=
ray and
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3336   * the number of address bytes for Fast Read, Page Program and Sector=
 Erase
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3337   * commands.
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3338   * For Fast READ commands, it also gives the number of mode clock cyc=
les and
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3339   * wait states (regrouped in the number of dummy clock cycles) for ea=
ch
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3340   * supported instruction op code.
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3341   * For Page Program, the page size is now available since JESD216 rev=
 A, however
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3342   * the supported instruction op codes are still not provided.
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3343   * For Sector Erase commands, this table stores the supported instruc=
tion op
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3344   * codes and the associated sector sizes.
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3345   * Finally, the Quad Enable Requirements (QER) are also available sin=
ce JESD216
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3346   * rev A. The QER bits encode the manufacturer dependent procedure to=
 be
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3347   * executed to set the Quad Enable (QE) bit in some internal register=
 of the
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3348   * Quad SPI memory. Indeed the QE bit, when it exists, must be set be=
fore
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3349   * sending any Quad SPI command to the memory. Actually, setting the =
QE bit
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3350   * tells the memory to reassign its WP# and HOLD#/RESET# pins to func=
tions IO2
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3351   * and IO3 hence enabling 4 (Quad) I/O lines.
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3352   *
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3353   * Return: 0 on success, -errno otherwise.
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3354   */
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3355  static int spi_nor_parse_bfpt(struct spi_nor *nor,
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3356  			      const struct sfdp_parameter_header *bfpt_header,
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3357  			      struct spi_nor_flash_parameter *params)
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3358  {
c46872170a54c902 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-08-23  =
3359  	struct spi_nor_erase_map *map =3D &params->erase_map;
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3360  	struct spi_nor_erase_type *erase_type =3D map->erase_type;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3361  	struct sfdp_bfpt bfpt;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3362  	size_t len;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3363  	int i, cmd, err;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3364  	u32 addr;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3365  	u16 half;
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3366  	u8 erase_mask;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3367  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3368  	/* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. =
*/
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3369  	if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3370  		return -EINVAL;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3371  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3372  	/* Read the Basic Flash Parameter Table. */
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3373  	len =3D min_t(size_t, sizeof(bfpt),
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3374  		    bfpt_header->length * sizeof(u32));
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3375  	addr =3D SFDP_PARAM_HEADER_PTP(bfpt_header);
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3376  	memset(&bfpt, 0, sizeof(bfpt));
bfa4133795e5a0ba drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-09-06  =
3377  	err =3D spi_nor_read_sfdp_dma_unsafe(nor,  addr, len, &bfpt);
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3378  	if (err < 0)
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3379  		return err;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3380  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3381  	/* Fix endianness of the BFPT DWORDs. */
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3382  	for (i =3D 0; i < BFPT_DWORD_MAX; i++)
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26 @=
3383  		bfpt.dwords[i] =3D le32_to_cpu(bfpt.dwords[i]);
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3384  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3385  	/* Number of address bytes. */
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3386  	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK)=
 {
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3387  	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3388  		nor->addr_width =3D 3;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3389  		break;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3390  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3391  	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3392  		nor->addr_width =3D 4;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3393  		break;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3394  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3395  	default:
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3396  		break;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3397  	}
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3398  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3399  	/* Flash Memory Density (in bits). */
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3400  	params->size =3D bfpt.dwords[BFPT_DWORD(2)];
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3401  	if (params->size & BIT(31)) {
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3402  		params->size &=3D ~BIT(31);
b8f3911610529ba5 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2017-09-12  =
3403  =

b8f3911610529ba5 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2017-09-12  =
3404  		/*
b8f3911610529ba5 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2017-09-12  =
3405  		 * Prevent overflows on params->size. Anyway, a NOR of 2^64
b8f3911610529ba5 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2017-09-12  =
3406  		 * bits is unlikely to exist so this error probably means
b8f3911610529ba5 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2017-09-12  =
3407  		 * the BFPT we are reading is corrupted/wrong.
b8f3911610529ba5 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2017-09-12  =
3408  		 */
b8f3911610529ba5 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2017-09-12  =
3409  		if (params->size > 63)
b8f3911610529ba5 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2017-09-12  =
3410  			return -EINVAL;
b8f3911610529ba5 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2017-09-12  =
3411  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3412  		params->size =3D 1ULL << params->size;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3413  	} else {
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3414  		params->size++;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3415  	}
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3416  	params->size >>=3D 3; /* Convert to bytes. */
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3417  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3418  	/* Fast Read settings. */
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3419  	for (i =3D 0; i < ARRAY_SIZE(sfdp_bfpt_reads); i++) {
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3420  		const struct sfdp_bfpt_read *rd =3D &sfdp_bfpt_reads[i];
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3421  		struct spi_nor_read_command *read;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3422  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3423  		if (!(bfpt.dwords[rd->supported_dword] & rd->supported_bit)) {
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3424  			params->hwcaps.mask &=3D ~rd->hwcaps;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3425  			continue;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3426  		}
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3427  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3428  		params->hwcaps.mask |=3D rd->hwcaps;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3429  		cmd =3D spi_nor_hwcaps_read2cmd(rd->hwcaps);
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3430  		read =3D &params->reads[cmd];
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3431  		half =3D bfpt.dwords[rd->settings_dword] >> rd->settings_shift;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3432  		spi_nor_set_read_settings_from_bfpt(read, half, rd->proto);
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3433  	}
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3434  =

5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3435  	/*
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3436  	 * Sector Erase settings. Reinitialize the uniform erase map using t=
he
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3437  	 * Erase Types defined in the bfpt table.
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3438  	 */
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3439  	erase_mask =3D 0;
c46872170a54c902 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2019-08-23  =
3440  	memset(&params->erase_map, 0, sizeof(params->erase_map));
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3441  	for (i =3D 0; i < ARRAY_SIZE(sfdp_bfpt_erases); i++) {
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3442  		const struct sfdp_bfpt_erase *er =3D &sfdp_bfpt_erases[i];
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3443  		u32 erasesize;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3444  		u8 opcode;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3445  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3446  		half =3D bfpt.dwords[er->dword] >> er->shift;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3447  		erasesize =3D half & 0xff;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3448  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3449  		/* erasesize =3D=3D 0 means this Erase Type is not supported. */
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3450  		if (!erasesize)
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3451  			continue;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3452  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3453  		erasesize =3D 1U << erasesize;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3454  		opcode =3D (half >> 8) & 0xff;
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3455  		erase_mask |=3D BIT(i);
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3456  		spi_nor_set_erase_settings_from_bfpt(&erase_type[i], erasesize,
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3457  						     opcode, i);
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3458  	}
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3459  	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3460  	/*
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3461  	 * Sort all the map's Erase Types in ascending order with the smalle=
st
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3462  	 * erase size being the first member in the erase_type array.
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3463  	 */
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3464  	sort(erase_type, SNOR_ERASE_TYPE_MAX, sizeof(erase_type[0]),
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3465  	     spi_nor_map_cmp_erase_type, NULL);
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3466  	/*
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3467  	 * Sort the erase types in the uniform region in order to update the
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3468  	 * uniform_erase_type bitmask. The bitmask will be used later on when
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3469  	 * selecting the uniform erase.
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3470  	 */
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3471  	spi_nor_regions_sort_erase_types(map);
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3472  	map->uniform_erase_type =3D map->uniform_region.offset &
5390a8df769ec9ba drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus   2018-09-11  =
3473  				  SNOR_ERASE_TYPE_MASK;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3474  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3475  	/* Stop here if not JESD216 rev A or later. */
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3476  	if (bfpt_header->length < BFPT_DWORD_MAX)
2aaa5f7e0c07a0f1 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2018-12-06  =
3477  		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt,
2aaa5f7e0c07a0f1 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2018-12-06  =
3478  						params);
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3479  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3480  	/* Page size: this field specifies 'N' so the page size =3D 2^N byte=
s. */
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3481  	params->page_size =3D bfpt.dwords[BFPT_DWORD(11)];
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3482  	params->page_size &=3D BFPT_DWORD11_PAGE_SIZE_MASK;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3483  	params->page_size >>=3D BFPT_DWORD11_PAGE_SIZE_SHIFT;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3484  	params->page_size =3D 1U << params->page_size;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3485  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3486  	/* Quad Enable Requirements. */
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3487  	switch (bfpt.dwords[BFPT_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3488  	case BFPT_DWORD15_QER_NONE:
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3489  		params->quad_enable =3D NULL;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3490  		break;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3491  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3492  	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3493  	case BFPT_DWORD15_QER_SR2_BIT1_NO_RD:
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3494  		params->quad_enable =3D spansion_no_read_cr_quad_enable;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3495  		break;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3496  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3497  	case BFPT_DWORD15_QER_SR1_BIT6:
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3498  		params->quad_enable =3D macronix_quad_enable;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3499  		break;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3500  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3501  	case BFPT_DWORD15_QER_SR2_BIT7:
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3502  		params->quad_enable =3D sr2_bit7_quad_enable;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3503  		break;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3504  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3505  	case BFPT_DWORD15_QER_SR2_BIT1:
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3506  		params->quad_enable =3D spansion_read_cr_quad_enable;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3507  		break;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3508  =

f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3509  	default:
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3510  		return -EINVAL;
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3511  	}
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3512  =

2aaa5f7e0c07a0f1 drivers/mtd/spi-nor/spi-nor.c Boris Brezillon 2018-12-06  =
3513  	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt, params);
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3514  }
f384b352cbf0310f drivers/mtd/spi-nor/spi-nor.c Cyrille Pitchen 2017-06-26  =
3515  =


:::::: The code at line 3383 was first introduced by commit
:::::: f384b352cbf0310fd20c379c4710408c70e769b6 mtd: spi-nor: parse Serial =
Flash Discoverable Parameters (SFDP) tables

:::::: TO: Cyrille Pitchen <cyrille.pitchen@microchip.com>
:::::: CC: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8640606206487090034==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
K9ABAA==
--===============8640606206487090034==--

