Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DC27E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 00:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685146670; x=1716682670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qrQbmxk6xygssmsvofkQXumyoci5g2H2gRXG4gUPCNM=;
  b=e675vsdI6B2DtGj/sf0j4NcMAI1TIlKhoTDsFN95uvFgd6z/zk/Jp16u
   iBlG6mksxyMcgUx53SeVygZ4LvB5e3Ih/jdI/gEqktkmcX9OZYhd6VqLu
   XFVFNAy4Uzi1BnOCtjmmcvZo56jLSlOWMIzD7nWjt7J5soIein4f9FzzO
   zXbboKkcLhsnJOlhSB4rOKbrJfUuR9QmprMXdMEEngp2y6mdj3CvTDe36
   y+GeBaaySDDEWrKI6OuJqxbxph2BZrv4fUtYWQ9XZC768CWpb3JRGHLK1
   qx8VLeQl8ftA65RuCBMOllR9v035ZPHZ+TAPiZeYSwO8Kfcq1XuIXygzp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="333960878"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="333960878"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 17:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="738451476"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="738451476"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 May 2023 17:17:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2hcx-000Jg2-0C;
	Sat, 27 May 2023 00:17:47 +0000
Date: Sat, 27 May 2023 08:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.3/zen-sauce 3/30] drivers/i2c/busses/i2c-nct6775.c:221:39:
 warning: this statement may fall through
Message-ID: <202305270834.TBcEkjqn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.3/zen-sauce
head:   c25bf38649c4d20ae29994b1dadd4e87c3e67bf9
commit: 8642f233725f1bce3860806dfcb037ccca89f838 [3/30] ZEN: Add OpenRGB patches
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230527/202305270834.TBcEkjqn-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/8642f233725f1bce3860806dfcb037ccca89f838
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.3/zen-sauce
        git checkout 8642f233725f1bce3860806dfcb037ccca89f838
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270834.TBcEkjqn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-nct6775.c: In function 'nct6775_access':
>> drivers/i2c/busses/i2c-nct6775.c:221:39: warning: this statement may fall through [-Wimplicit-fallthrough=]
     221 |                         tmp_data.byte = data->byte;
         |                         ~~~~~~~~~~~~~~^~~~~~~~~~~~
   drivers/i2c/busses/i2c-nct6775.c:222:17: note: here
     222 |                 case I2C_SMBUS_BYTE:
         |                 ^~~~
   drivers/i2c/busses/i2c-nct6775.c: At top level:
   drivers/i2c/busses/i2c-nct6775.c:93:27: warning: 'nct6775_device_names' defined but not used [-Wunused-const-variable=]
      93 | static const char * const nct6775_device_names[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~


vim +221 drivers/i2c/busses/i2c-nct6775.c

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
