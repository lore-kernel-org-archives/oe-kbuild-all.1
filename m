Content-Type: multipart/mixed; boundary="===============5112982361269642489=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] rtc: rs5c372: Fix read the time from RTC is illegal When reading time from an uninitialized RTC chip, The value may be illegal
Date: Sun, 23 May 2021 01:22:14 +0800
Message-ID: <202105230100.uUeOryMF-lkp@intel.com>
In-Reply-To: <20210521024026.28472-1-qxj511mail@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5112982361269642489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on v5.13-rc2 next-20210521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/qxj511mail-gmail-com/rtc-r=
s5c372-Fix-read-the-time-from-RTC-is-illegal-When-reading-time-from-an-unin=
itialized-RTC-chip-The-value-may-be-ille/20210522-202320
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git =
rtc-next
config: x86_64-randconfig-s031-20210522 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/62c495535e38dc184558713e6=
c007071f50f516c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review qxj511mail-gmail-com/rtc-rs5c372-F=
ix-read-the-time-from-RTC-is-illegal-When-reading-time-from-an-uninitialize=
d-RTC-chip-The-value-may-be-ille/20210522-202320
        git checkout 62c495535e38dc184558713e6c007071f50f516c
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D=
1 ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-rs5c372.c: In function 'rs5c372_rtc_read_time':
>> drivers/rtc/rtc-rs5c372.c:261:3: error: implicit declaration of function=
 'rs5c372_rtc_set_time'; did you mean 'rs5c372_rtc_read_time'? [-Werror=3Di=
mplicit-function-declaration]
     261 |   rs5c372_rtc_set_time(dev, tm);
         |   ^~~~~~~~~~~~~~~~~~~~
         |   rs5c372_rtc_read_time
   drivers/rtc/rtc-rs5c372.c: At top level:
>> drivers/rtc/rtc-rs5c372.c:273:12: error: static declaration of 'rs5c372_=
rtc_set_time' follows non-static declaration
     273 | static int rs5c372_rtc_set_time(struct device *dev, struct rtc_t=
ime *tm)
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-rs5c372.c:261:3: note: previous implicit declaration of =
'rs5c372_rtc_set_time' was here
     261 |   rs5c372_rtc_set_time(dev, tm);
         |   ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +261 drivers/rtc/rtc-rs5c372.c

   208	=

   209	static int rs5c372_rtc_read_time(struct device *dev, struct rtc_time=
 *tm)
   210	{
   211		struct i2c_client *client =3D to_i2c_client(dev);
   212		struct rs5c372	*rs5c =3D i2c_get_clientdata(client);
   213		int		status =3D rs5c_get_regs(rs5c);
   214		unsigned char ctrl2 =3D rs5c->regs[RS5C_REG_CTRL2];
   215		int flags_utime =3D 0;
   216	=

   217		if (status < 0)
   218			return status;
   219	=

   220		switch (rs5c->type) {
   221		case rtc_r2025sd:
   222		case rtc_r2221tl:
   223			if ((rs5c->type =3D=3D rtc_r2025sd && !(ctrl2 & R2x2x_CTRL2_XSTP))=
 ||
   224			    (rs5c->type =3D=3D rtc_r2221tl &&  (ctrl2 & R2x2x_CTRL2_XSTP))=
) {
   225				dev_warn(&client->dev, "rtc oscillator interruption detected. Ple=
ase reset the rtc clock.\n");
   226				return -EINVAL;
   227			}
   228			break;
   229		default:
   230			if (ctrl2 & RS5C_CTRL2_XSTP) {
   231				dev_warn(&client->dev, "rtc oscillator interruption detected. Ple=
ase reset the rtc clock.\n");
   232				return -EINVAL;
   233			}
   234		}
   235	=

   236		tm->tm_sec =3D bcd2bin(rs5c->regs[RS5C372_REG_SECS] & 0x7f);
   237		tm->tm_min =3D bcd2bin(rs5c->regs[RS5C372_REG_MINS] & 0x7f);
   238		tm->tm_hour =3D rs5c_reg2hr(rs5c, rs5c->regs[RS5C372_REG_HOURS]);
   239	=

   240		tm->tm_wday =3D bcd2bin(rs5c->regs[RS5C372_REG_WDAY] & 0x07);
   241		tm->tm_mday =3D bcd2bin(rs5c->regs[RS5C372_REG_DAY] & 0x3f);
   242	=

   243		if (tm->tm_mday < 1) {
   244			// The value read from the register may be zero, which is an illeg=
al value
   245			flags_utime =3D flags_utime + 1;
   246			tm->tm_mday =3D 1;
   247		}
   248	=

   249		/* tm->tm_mon is zero-based */
   250		tm->tm_mon =3D bcd2bin(rs5c->regs[RS5C372_REG_MONTH] & 0x1f) - 1;
   251	=

   252		if (tm->tm_mon < 0) {
   253			flags_utime =3D flags_utime + 1;
   254			tm->tm_mon =3D 0;
   255		}
   256	=

   257		/* year is 1900 + tm->tm_year */
   258		tm->tm_year =3D bcd2bin(rs5c->regs[RS5C372_REG_YEAR]) + 100;
   259	=

   260		if (flags_utime > 0) {
 > 261			rs5c372_rtc_set_time(dev, tm);
   262		}
   263	=

   264		dev_dbg(&client->dev, "%s: tm is secs=3D%d, mins=3D%d, hours=3D%d, "
   265			"mday=3D%d, mon=3D%d, year=3D%d, wday=3D%d\n",
   266			__func__,
   267			tm->tm_sec, tm->tm_min, tm->tm_hour,
   268			tm->tm_mday, tm->tm_mon, tm->tm_year, tm->tm_wday);
   269	=

   270		return 0;
   271	}
   272	=

 > 273	static int rs5c372_rtc_set_time(struct device *dev, struct rtc_time =
*tm)
   274	{
   275		struct i2c_client *client =3D to_i2c_client(dev);
   276		struct rs5c372	*rs5c =3D i2c_get_clientdata(client);
   277		unsigned char	buf[7];
   278		unsigned char	ctrl2;
   279		int		addr;
   280	=

   281		dev_dbg(&client->dev, "%s: tm is secs=3D%d, mins=3D%d, hours=3D%d "
   282			"mday=3D%d, mon=3D%d, year=3D%d, wday=3D%d\n",
   283			__func__,
   284			tm->tm_sec, tm->tm_min, tm->tm_hour,
   285			tm->tm_mday, tm->tm_mon, tm->tm_year, tm->tm_wday);
   286	=

   287		addr   =3D RS5C_ADDR(RS5C372_REG_SECS);
   288		buf[0] =3D bin2bcd(tm->tm_sec);
   289		buf[1] =3D bin2bcd(tm->tm_min);
   290		buf[2] =3D rs5c_hr2reg(rs5c, tm->tm_hour);
   291		buf[3] =3D bin2bcd(tm->tm_wday);
   292		buf[4] =3D bin2bcd(tm->tm_mday);
   293		buf[5] =3D bin2bcd(tm->tm_mon + 1);
   294		buf[6] =3D bin2bcd(tm->tm_year - 100);
   295	=

   296		if (i2c_smbus_write_i2c_block_data(client, addr, sizeof(buf), buf) =
< 0) {
   297			dev_dbg(&client->dev, "%s: write error in line %i\n",
   298				__func__, __LINE__);
   299			return -EIO;
   300		}
   301	=

   302		addr =3D RS5C_ADDR(RS5C_REG_CTRL2);
   303		ctrl2 =3D i2c_smbus_read_byte_data(client, addr);
   304	=

   305		/* clear rtc warning bits */
   306		switch (rs5c->type) {
   307		case rtc_r2025sd:
   308		case rtc_r2221tl:
   309			ctrl2 &=3D ~(R2x2x_CTRL2_VDET | R2x2x_CTRL2_PON);
   310			if (rs5c->type =3D=3D rtc_r2025sd)
   311				ctrl2 |=3D R2x2x_CTRL2_XSTP;
   312			else
   313				ctrl2 &=3D ~R2x2x_CTRL2_XSTP;
   314			break;
   315		default:
   316			ctrl2 &=3D ~RS5C_CTRL2_XSTP;
   317			break;
   318		}
   319	=

   320		if (i2c_smbus_write_byte_data(client, addr, ctrl2) < 0) {
   321			dev_dbg(&client->dev, "%s: write error in line %i\n",
   322				__func__, __LINE__);
   323			return -EIO;
   324		}
   325	=

   326		return 0;
   327	}
   328	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5112982361269642489==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5112982361269642489==--

