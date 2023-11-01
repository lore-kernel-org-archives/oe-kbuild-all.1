Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D4F1B290
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 21:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvYmni75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698875113; x=1730411113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ABxTZ/USW9zFXCr2gtc+uXpHPsYXAsDP3i2YWD1b0U=;
  b=GvYmni75vvd/qUYQ6rxPsMUZVwcz7uhE9DDjP6P/QVb6BF01FAY7qKd0
   3dSGRtVBGGYizx2069mBG5j1D0h+onzOfYyQnorlK43RjxzzFSpEvnoZm
   Bl3EOT5P1dSU/ZZIfbWBiJGw+isQf2ihw4zHE/zfp6l1k9CxQLUQERRHi
   C6LUuq5nyzUgrQCqf6usTxAL0Tde54LqCHxc8Xis4DjTOwEkvb3G5woEh
   J3y+ZNJ1+tCmrLHy3t0/TOz6AH59Zi/nOOClhoKRSoDVu3FCtoF5r7S1Q
   W2DPUy7qwGtFlhCzLKVM+iPXynkbZ104gAvY0IWH41SbeMJSmUka+xmCH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="388396494"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="388396494"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 14:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="710931162"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="710931162"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Nov 2023 14:45:08 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyJ1O-0000yG-1V;
	Wed, 01 Nov 2023 21:45:06 +0000
Date: Thu, 2 Nov 2023 05:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/zen-sauce 3/31] drivers/i2c/busses/i2c-nct6775.c:221:39:
 warning: this statement may fall through
Message-ID: <202311020535.c2AMSGRs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/zen-sauce
head:   b774e19c2b9336cecdbc4a38bbc1d2a6addd9143
commit: dc61e6c116012e03d6367d8f0facc0865542ca80 [3/31] ZEN: Add OpenRGB patches
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231102/202311020535.c2AMSGRs-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311020535.c2AMSGRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311020535.c2AMSGRs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-nct6775.c: In function 'nct6775_access':
>> drivers/i2c/busses/i2c-nct6775.c:221:39: warning: this statement may fall through [-Wimplicit-fallthrough=]
     221 |                         tmp_data.byte = data->byte;
         |                         ~~~~~~~~~~~~~~^~~~~~~~~~~~
   drivers/i2c/busses/i2c-nct6775.c:222:17: note: here
     222 |                 case I2C_SMBUS_BYTE:
         |                 ^~~~
   drivers/i2c/busses/i2c-nct6775.c: At top level:
>> drivers/i2c/busses/i2c-nct6775.c:93:27: warning: 'nct6775_device_names' defined but not used [-Wunused-const-variable=]
      93 | static const char * const nct6775_device_names[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~


vim +221 drivers/i2c/busses/i2c-nct6775.c

    91	
    92	/* used to set data->name = nct6775_device_names[data->sio_kind] */
  > 93	static const char * const nct6775_device_names[] = {
    94		"nct6106",
    95		"nct6775",
    96		"nct6776",
    97		"nct6779",
    98		"nct6791",
    99		"nct6792",
   100		"nct6793",
   101		"nct6795",
   102		"nct6796",
   103		"nct6798",
   104	};
   105	
   106	static const char * const nct6775_sio_names[] __initconst = {
   107		"NCT6106D",
   108		"NCT6775F",
   109		"NCT6776D/F",
   110		"NCT6779D",
   111		"NCT6791D",
   112		"NCT6792D",
   113		"NCT6793D",
   114		"NCT6795D",
   115		"NCT6796D",
   116		"NCT6798D",
   117	};
   118	
   119	#define SIO_REG_LDSEL		0x07	/* Logical device select */
   120	#define SIO_REG_DEVID		0x20	/* Device ID (2 bytes) */
   121	#define SIO_REG_SMBA		0x62	/* SMBus base address register */
   122	
   123	#define SIO_NCT6106_ID		0xc450
   124	#define SIO_NCT6775_ID		0xb470
   125	#define SIO_NCT6776_ID		0xc330
   126	#define SIO_NCT6779_ID		0xc560
   127	#define SIO_NCT6791_ID		0xc800
   128	#define SIO_NCT6792_ID		0xc910
   129	#define SIO_NCT6793_ID		0xd120
   130	#define SIO_NCT6795_ID		0xd350
   131	#define SIO_NCT6796_ID		0xd420
   132	#define SIO_NCT6798_ID		0xd428
   133	#define SIO_ID_MASK			0xFFF0
   134	
   135	static inline void
   136	superio_outb(int ioreg, int reg, int val)
   137	{
   138		outb(reg, ioreg);
   139		outb(val, ioreg + 1);
   140	}
   141	
   142	static inline int
   143	superio_inb(int ioreg, int reg)
   144	{
   145		outb(reg, ioreg);
   146		return inb(ioreg + 1);
   147	}
   148	
   149	static inline void
   150	superio_select(int ioreg, int ld)
   151	{
   152		outb(SIO_REG_LDSEL, ioreg);
   153		outb(ld, ioreg + 1);
   154	}
   155	
   156	static inline int
   157	superio_enter(int ioreg)
   158	{
   159		/*
   160		 * Try to reserve <ioreg> and <ioreg + 1> for exclusive access.
   161		 */
   162		if (!request_muxed_region(ioreg, 2, DRVNAME))
   163			return -EBUSY;
   164	
   165		outb(0x87, ioreg);
   166		outb(0x87, ioreg);
   167	
   168		return 0;
   169	}
   170	
   171	static inline void
   172	superio_exit(int ioreg)
   173	{
   174		outb(0xaa, ioreg);
   175		outb(0x02, ioreg);
   176		outb(0x02, ioreg + 1);
   177		release_region(ioreg, 2);
   178	}
   179	
   180	/*
   181	 * ISA constants
   182	 */
   183	
   184	#define IOREGION_ALIGNMENT	(~7)
   185	#define IOREGION_LENGTH		2
   186	#define ADDR_REG_OFFSET		0
   187	#define DATA_REG_OFFSET		1
   188	
   189	#define NCT6775_REG_BANK	0x4E
   190	#define NCT6775_REG_CONFIG	0x40
   191	
   192	static struct i2c_adapter *nct6775_adapter;
   193	
   194	struct i2c_nct6775_adapdata {
   195		unsigned short smba;
   196	};
   197	
   198	/* Return negative errno on error. */
   199	static s32 nct6775_access(struct i2c_adapter * adap, u16 addr,
   200			 unsigned short flags, char read_write,
   201			 u8 command, int size, union i2c_smbus_data * data)
   202	{
   203		struct i2c_nct6775_adapdata *adapdata = i2c_get_adapdata(adap);
   204		unsigned short nuvoton_nct6793d_smba = adapdata->smba;
   205		int i, len, cnt;
   206		union i2c_smbus_data tmp_data;
   207		int timeout = 0;
   208	
   209		tmp_data.word = 0;
   210		cnt = 0;
   211		len = 0;
   212	
   213		outb_p(NCT6793D_SOFT_RESET, SMBHSTCTL);
   214	
   215		switch (size) {
   216			case I2C_SMBUS_QUICK:
   217				outb_p((addr << 1) | read_write,
   218				       SMBHSTADD);
   219				break;
   220			case I2C_SMBUS_BYTE_DATA:
 > 221				tmp_data.byte = data->byte;
   222			case I2C_SMBUS_BYTE:
   223				outb_p((addr << 1) | read_write,
   224				       SMBHSTADD);
   225				outb_p(command, SMBHSTIDX);
   226				if (read_write == I2C_SMBUS_WRITE) {
   227					outb_p(tmp_data.byte, SMBHSTDAT);
   228					outb_p(NCT6793D_WRITE_BYTE, SMBHSTCMD);
   229				}
   230				else {
   231					outb_p(NCT6793D_READ_BYTE, SMBHSTCMD);
   232				}
   233				break;
   234			case I2C_SMBUS_WORD_DATA:
   235				outb_p((addr << 1) | read_write,
   236				       SMBHSTADD);
   237				outb_p(command, SMBHSTIDX);
   238				if (read_write == I2C_SMBUS_WRITE) {
   239					outb_p(data->word & 0xff, SMBHSTDAT);
   240					outb_p((data->word & 0xff00) >> 8, SMBHSTDAT);
   241					outb_p(NCT6793D_WRITE_WORD, SMBHSTCMD);
   242				}
   243				else {
   244					outb_p(NCT6793D_READ_WORD, SMBHSTCMD);
   245				}
   246				break;
   247			case I2C_SMBUS_BLOCK_DATA:
   248				outb_p((addr << 1) | read_write,
   249				       SMBHSTADD);
   250				outb_p(command, SMBHSTIDX);
   251				if (read_write == I2C_SMBUS_WRITE) {
   252					len = data->block[0];
   253					if (len == 0 || len > I2C_SMBUS_BLOCK_MAX)
   254						return -EINVAL;
   255					outb_p(len, SMBBLKSZ);
   256	
   257					cnt = 1;
   258					if (len >= 4) {
   259						for (i = cnt; i <= 4; i++) {
   260							outb_p(data->block[i], SMBHSTDAT);
   261						}
   262	
   263						len -= 4;
   264						cnt += 4;
   265					}
   266					else {
   267						for (i = cnt; i <= len; i++ ) {
   268							outb_p(data->block[i], SMBHSTDAT);
   269						}
   270	
   271						len = 0;
   272					}
   273	
   274					outb_p(NCT6793D_WRITE_BLOCK, SMBHSTCMD);
   275				}
   276				else {
   277					return -ENOTSUPP;
   278				}
   279				break;
   280			default:
   281				dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
   282				return -EOPNOTSUPP;
   283		}
   284	
   285		outb_p(NCT6793D_MANUAL_START, SMBHSTCTL);
   286	
   287		while ((size == I2C_SMBUS_BLOCK_DATA) && (len > 0)) {
   288			if (read_write == I2C_SMBUS_WRITE) {
   289				timeout = 0;
   290				while ((inb_p(SMBHSTSTS) & NCT6793D_FIFO_EMPTY) == 0)
   291				{
   292					if(timeout > MAX_RETRIES)
   293					{
   294						return -ETIMEDOUT;
   295					}
   296					usleep_range(250, 500);
   297					timeout++;
   298				}
   299	
   300				//Load more bytes into FIFO
   301				if (len >= 4) {
   302					for (i = cnt; i <= (cnt + 4); i++) {
   303						outb_p(data->block[i], SMBHSTDAT);
   304					}
   305	
   306					len -= 4;
   307					cnt += 4;
   308				}
   309				else {
   310					for (i = cnt; i <= (cnt + len); i++) {
   311						outb_p(data->block[i], SMBHSTDAT);
   312					}
   313	
   314					len = 0;
   315				}
   316			}
   317			else {
   318				return -ENOTSUPP;
   319			}
   320			
   321		}
   322	
   323		//wait for manual mode to complete
   324		timeout = 0;
   325		while ((inb_p(SMBHSTSTS) & NCT6793D_MANUAL_ACTIVE) != 0)
   326		{
   327			if(timeout > MAX_RETRIES)
   328			{
   329				return -ETIMEDOUT;
   330			}
   331			usleep_range(250, 500);
   332			timeout++;
   333		}
   334	
   335		if ((inb_p(SMBHSTERR) & NCT6793D_NO_ACK) != 0) {    	
   336			return -ENXIO;
   337		}
   338		else if ((read_write == I2C_SMBUS_WRITE) || (size == I2C_SMBUS_QUICK)) {
   339			return 0;
   340		}
   341	
   342		switch (size) {
   343			case I2C_SMBUS_QUICK:
   344			case I2C_SMBUS_BYTE_DATA:
   345				data->byte = inb_p(SMBHSTDAT);
   346				break;
   347			case I2C_SMBUS_WORD_DATA:
   348				data->word = inb_p(SMBHSTDAT) + (inb_p(SMBHSTDAT) << 8);
   349				break;
   350		}
   351		return 0;
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
