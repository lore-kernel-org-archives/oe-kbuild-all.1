Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6EC37158
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 15:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695138208; x=1726674208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sISfXUBfWnulmuxrAmnis3aohCw1drXhmiCKZClIA6I=;
  b=KS5zVUWn2E/x5amp1dxm70rR3z6HhGoyfsXrJqcpSy9r5rFokIjpXmOS
   dF6noelLNyotV0e5KsmUdJn0f27UygFpLmPyyri4ScBJ06H5JMzuG3827
   xlqCmhwi5ftmDBNtlcqbRjJIuwhaZk4v6WP9COrQZfqGokgO1/hgpb/LS
   CNNpTBFbE4LJ9BW1BiP/9h0+lqw+DVlwxfDaPnZeol2q9yFLDX626Ozdx
   jrzVJ4AxPaBHixZpM4JUTeQH0k0COo+hkA1yVibn+z7ugxZngOIZk7DBy
   iGtH3kSuMlYTv0FPXIeHZN/YpSmzv/m03sIRPjzpCt5Ngch73CmBn66Wb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="370290172"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="370290172"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 08:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="739762230"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="739762230"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Sep 2023 08:40:23 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qicpp-0007ZF-2j;
	Tue, 19 Sep 2023 15:40:21 +0000
Date: Tue, 19 Sep 2023 23:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 68/116]
 drivers/media/usb/dvb-usb-v2/af9035.c:328:25: warning: ISO C90 forbids mixed
 declarations and code
Message-ID: <202309192322.zMjLnkmg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   2484246e96e01f62d47572e1ac731054b511cd26
commit: bc3ced535f7f85986a01eaad86687346093b7457 [68/116] media: dvb-usb-v2: af9035: Fix null-ptr-deref in af9035_i2c_master_xfer
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230919/202309192322.zMjLnkmg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192322.zMjLnkmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192322.zMjLnkmg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/usb/dvb-usb-v2/af9035.c: In function 'af9035_i2c_master_xfer':
>> drivers/media/usb/dvb-usb-v2/af9035.c:328:25: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     328 |                         u32 reg = msg[0].buf[0] << 16 | msg[0].buf[1] << 8 |
         |                         ^~~
   drivers/media/usb/dvb-usb-v2/af9035.c:389:25: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     389 |                         u32 reg = msg[0].buf[0] << 16 | msg[0].buf[1] << 8 |
         |                         ^~~


vim +328 drivers/media/usb/dvb-usb-v2/af9035.c

3b2a5e8c080da3 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-26  266  
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  267  static int af9035_i2c_master_xfer(struct i2c_adapter *adap,
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  268  		struct i2c_msg msg[], int num)
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  269  {
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  270  	struct dvb_usb_device *d = i2c_get_adapdata(adap);
5da2aecb46597c drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-06-17  271  	struct state *state = d_to_priv(d);
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  272  	int ret;
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  273  
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  274  	if (mutex_lock_interruptible(&d->i2c_mutex) < 0)
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  275  		return -EAGAIN;
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  276  
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  277  	/*
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  278  	 * AF9035 I2C sub header is 5 bytes long. Meaning of those bytes are:
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  279  	 * 0: data len
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  280  	 * 1: I2C addr << 1
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  281  	 * 2: reg addr len
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  282  	 *    byte 3 and 4 can be used as reg addr
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  283  	 * 3: reg addr MSB
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  284  	 *    used when reg addr len is set to 2
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  285  	 * 4: reg addr LSB
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  286  	 *    used when reg addr len is set to 1 or 2
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  287  	 *
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  288  	 * For the simplify we do not use register addr at all.
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  289  	 * NOTE: As a firmware knows tuner type there is very small possibility
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  290  	 * there could be some tuner I2C hacks done by firmware and this may
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  291  	 * lead problems if firmware expects those bytes are used.
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  292  	 *
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  293  	 * TODO: Here is few hacks. AF9035 chip integrates AF9033 demodulator.
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  294  	 * IT9135 chip integrates AF9033 demodulator and RF tuner. For dual
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  295  	 * tuner devices, there is also external AF9033 demodulator connected
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  296  	 * via external I2C bus. All AF9033 demod I2C traffic, both single and
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  297  	 * dual tuner configuration, is covered by firmware - actual USB IO
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  298  	 * looks just like a memory access.
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  299  	 * In case of IT913x chip, there is own tuner driver. It is implemented
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  300  	 * currently as a I2C driver, even tuner IP block is likely build
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  301  	 * directly into the demodulator memory space and there is no own I2C
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  302  	 * bus. I2C subsystem does not allow register multiple devices to same
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  303  	 * bus, having same slave address. Due to that we reuse demod address,
f5b00a767006e4 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  304  	 * shifted by one bit, on that case.
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  305  	 *
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  306  	 * For IT930x we use a different command and the sub header is
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  307  	 * different as well:
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  308  	 * 0: data len
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  309  	 * 1: I2C bus (0x03 seems to be only value used)
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  310  	 * 2: I2C addr << 1
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  311  	 */
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  312  #define AF9035_IS_I2C_XFER_WRITE_READ(_msg, _num) \
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  313  	(_num == 2 && !(_msg[0].flags & I2C_M_RD) && (_msg[1].flags & I2C_M_RD))
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  314  #define AF9035_IS_I2C_XFER_WRITE(_msg, _num) \
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  315  	(_num == 1 && !(_msg[0].flags & I2C_M_RD))
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  316  #define AF9035_IS_I2C_XFER_READ(_msg, _num) \
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  317  	(_num == 1 && (_msg[0].flags & I2C_M_RD))
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  318  
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  319  	if (AF9035_IS_I2C_XFER_WRITE_READ(msg, num)) {
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  320  		if (msg[0].len > 40 || msg[1].len > 40) {
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  321  			/* TODO: correct limits > 40 */
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  322  			ret = -EOPNOTSUPP;
a781edd16c9da9 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  323  		} else if ((msg[0].addr == state->af9033_i2c_addr[0]) ||
35ef193b2aa35e drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2016-11-07  324  			   (msg[0].addr == state->af9033_i2c_addr[1])) {
bc3ced535f7f85 drivers/media/usb/dvb-usb-v2/af9035.c Zhang Shurong         2023-07-06  325  			if (msg[0].len < 3 || msg[1].len < 1)
bc3ced535f7f85 drivers/media/usb/dvb-usb-v2/af9035.c Zhang Shurong         2023-07-06  326  				return -EOPNOTSUPP;
bf97b6373bb10b drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2012-12-08  327  			/* demod access via firmware interface */
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30 @328  			u32 reg = msg[0].buf[0] << 16 | msg[0].buf[1] << 8 |
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  329  					msg[0].buf[2];
bf97b6373bb10b drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2012-12-08  330  
35ef193b2aa35e drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2016-11-07  331  			if (msg[0].addr == state->af9033_i2c_addr[1])
9805992ffc59ec drivers/media/usb/dvb-usb-v2/af9035.c Jose Alberto Reguero  2012-09-23  332  				reg |= 0x100000;
bf97b6373bb10b drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2012-12-08  333  
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  334  			ret = af9035_rd_regs(d, reg, &msg[1].buf[0],
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  335  					msg[1].len);
1882f59f93066c drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-05-12  336  		} else if (state->no_read) {
1882f59f93066c drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-05-12  337  			memset(msg[1].buf, 0, msg[1].len);
1882f59f93066c drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-05-12  338  			ret = 0;
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  339  		} else {
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  340  			/* I2C write + read */
7760e148350bf6 drivers/media/usb/dvb-usb-v2/af9035.c Mauro Carvalho Chehab 2013-11-02  341  			u8 buf[MAX_XFER_SIZE];
9323297dc0ea91 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-11-27  342  			struct usb_req req = { CMD_I2C_RD, 0, 5 + msg[0].len,
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  343  					buf, msg[1].len, msg[1].buf };
7760e148350bf6 drivers/media/usb/dvb-usb-v2/af9035.c Mauro Carvalho Chehab 2013-11-02  344  
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  345  			if (state->chip_type == 0x9306) {
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  346  				req.cmd = CMD_GENERIC_I2C_RD;
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  347  				req.wlen = 3 + msg[0].len;
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  348  			}
9805992ffc59ec drivers/media/usb/dvb-usb-v2/af9035.c Jose Alberto Reguero  2012-09-23  349  			req.mbox |= ((msg[0].addr & 0x80)  >>  3);
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  350  
812fe6d9426a23 drivers/media/dvb/dvb-usb/af9035.c    Hans-Frieder Vogt     2012-04-01  351  			buf[0] = msg[1].len;
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  352  			if (state->chip_type == 0x9306) {
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  353  				buf[1] = 0x03; /* I2C bus */
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  354  				buf[2] = msg[0].addr << 1;
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  355  				memcpy(&buf[3], msg[0].buf, msg[0].len);
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  356  			} else {
bf97b6373bb10b drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2012-12-08  357  				buf[1] = msg[0].addr << 1;
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  358  				buf[3] = 0x00; /* reg addr MSB */
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  359  				buf[4] = 0x00; /* reg addr LSB */
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  360  
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  361  				/* Keep prev behavior for write req len > 2*/
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  362  				if (msg[0].len > 2) {
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  363  					buf[2] = 0x00; /* reg addr len */
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  364  					memcpy(&buf[5], msg[0].buf, msg[0].len);
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  365  
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  366  				/* Use reg addr fields if write req len <= 2 */
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  367  				} else {
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  368  					req.wlen = 5;
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  369  					buf[2] = msg[0].len;
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  370  					if (msg[0].len == 2) {
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  371  						buf[3] = msg[0].buf[0];
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  372  						buf[4] = msg[0].buf[1];
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  373  					} else if (msg[0].len == 1) {
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  374  						buf[4] = msg[0].buf[0];
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  375  					}
57f1c0533850c0 drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-04-05  376  				}
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  377  			}
5da2aecb46597c drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-06-17  378  			ret = af9035_ctrl_msg(d, &req);
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  379  		}
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  380  	} else if (AF9035_IS_I2C_XFER_WRITE(msg, num)) {
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  381  		if (msg[0].len > 40) {
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  382  			/* TODO: correct limits > 40 */
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  383  			ret = -EOPNOTSUPP;
a781edd16c9da9 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  384  		} else if ((msg[0].addr == state->af9033_i2c_addr[0]) ||
35ef193b2aa35e drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2016-11-07  385  			   (msg[0].addr == state->af9033_i2c_addr[1])) {
bc3ced535f7f85 drivers/media/usb/dvb-usb-v2/af9035.c Zhang Shurong         2023-07-06  386  			if (msg[0].len < 3)
bc3ced535f7f85 drivers/media/usb/dvb-usb-v2/af9035.c Zhang Shurong         2023-07-06  387  				return -EOPNOTSUPP;
bf97b6373bb10b drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2012-12-08  388  			/* demod access via firmware interface */
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  389  			u32 reg = msg[0].buf[0] << 16 | msg[0].buf[1] << 8 |
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  390  					msg[0].buf[2];
bf97b6373bb10b drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2012-12-08  391  
35ef193b2aa35e drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2016-11-07  392  			if (msg[0].addr == state->af9033_i2c_addr[1])
9805992ffc59ec drivers/media/usb/dvb-usb-v2/af9035.c Jose Alberto Reguero  2012-09-23  393  				reg |= 0x100000;
bf97b6373bb10b drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2012-12-08  394  
bc3ced535f7f85 drivers/media/usb/dvb-usb-v2/af9035.c Zhang Shurong         2023-07-06  395  			ret = af9035_wr_regs(d, reg, &msg[0].buf[3], msg[0].len - 3);
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  396  		} else {
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  397  			/* I2C write */
7760e148350bf6 drivers/media/usb/dvb-usb-v2/af9035.c Mauro Carvalho Chehab 2013-11-02  398  			u8 buf[MAX_XFER_SIZE];
9323297dc0ea91 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-11-27  399  			struct usb_req req = { CMD_I2C_WR, 0, 5 + msg[0].len,
9323297dc0ea91 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-11-27  400  					buf, 0, NULL };
7760e148350bf6 drivers/media/usb/dvb-usb-v2/af9035.c Mauro Carvalho Chehab 2013-11-02  401  
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  402  			if (state->chip_type == 0x9306) {
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  403  				req.cmd = CMD_GENERIC_I2C_WR;
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  404  				req.wlen = 3 + msg[0].len;
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  405  			}
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  406  
9805992ffc59ec drivers/media/usb/dvb-usb-v2/af9035.c Jose Alberto Reguero  2012-09-23  407  			req.mbox |= ((msg[0].addr & 0x80)  >>  3);
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  408  			buf[0] = msg[0].len;
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  409  			if (state->chip_type == 0x9306) {
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  410  				buf[1] = 0x03; /* I2C bus */
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  411  				buf[2] = msg[0].addr << 1;
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  412  				memcpy(&buf[3], msg[0].buf, msg[0].len);
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  413  			} else {
bf97b6373bb10b drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2012-12-08  414  				buf[1] = msg[0].addr << 1;
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  415  				buf[2] = 0x00; /* reg addr len */
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  416  				buf[3] = 0x00; /* reg addr MSB */
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  417  				buf[4] = 0x00; /* reg addr LSB */
ad30e91befd715 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-04-02  418  				memcpy(&buf[5], msg[0].buf, msg[0].len);
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  419  			}
5da2aecb46597c drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-06-17  420  			ret = af9035_ctrl_msg(d, &req);
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  421  		}
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  422  	} else if (AF9035_IS_I2C_XFER_READ(msg, num)) {
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  423  		if (msg[0].len > 40) {
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  424  			/* TODO: correct limits > 40 */
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  425  			ret = -EOPNOTSUPP;
1882f59f93066c drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-05-12  426  		} else if (state->no_read) {
1882f59f93066c drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-05-12  427  			memset(msg[0].buf, 0, msg[0].len);
1882f59f93066c drivers/media/usb/dvb-usb-v2/af9035.c Alessandro Radicati   2016-05-12  428  			ret = 0;
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  429  		} else {
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  430  			/* I2C read */
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  431  			u8 buf[5];
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  432  			struct usb_req req = { CMD_I2C_RD, 0, sizeof(buf),
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  433  						buf, msg[0].len, msg[0].buf };
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  434  
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  435  			if (state->chip_type == 0x9306) {
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  436  				req.cmd = CMD_GENERIC_I2C_RD;
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  437  				req.wlen = 3;
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  438  			}
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  439  			req.mbox |= ((msg[0].addr & 0x80)  >>  3);
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  440  			buf[0] = msg[0].len;
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  441  			if (state->chip_type == 0x9306) {
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  442  				buf[1] = 0x03; /* I2C bus */
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  443  				buf[2] = msg[0].addr << 1;
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  444  			} else {
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  445  				buf[1] = msg[0].addr << 1;
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  446  				buf[2] = 0x00; /* reg addr len */
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  447  				buf[3] = 0x00; /* reg addr MSB */
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  448  				buf[4] = 0x00; /* reg addr LSB */
5b5560842a7ee0 drivers/media/usb/dvb-usb-v2/af9035.c Olli Salonen          2014-09-21  449  			}
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  450  			ret = af9035_ctrl_msg(d, &req);
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  451  		}
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  452  	} else {
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  453  		/*
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  454  		 * We support only three kind of I2C transactions:
ee36381ee8cec6 drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2014-08-31  455  		 * 1) 1 x write + 1 x read (repeated start)
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  456  		 * 2) 1 x write
3b98c347838d0a drivers/media/usb/dvb-usb-v2/af9035.c Antti Palosaari       2013-03-11  457  		 * 3) 1 x read
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  458  		 */
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  459  		ret = -EOPNOTSUPP;
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  460  	}
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  461  
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  462  	mutex_unlock(&d->i2c_mutex);
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  463  
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  464  	if (ret < 0)
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  465  		return ret;
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  466  	else
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  467  		return num;
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  468  }
7f882c2e353ca5 drivers/media/dvb/dvb-usb/af9035.c    Antti Palosaari       2012-03-30  469  

:::::: The code at line 328 was first introduced by commit
:::::: 7f882c2e353ca58695e9b4fcc9e97a9d4cbcf273 [media] Afatech AF9035 DVB USB driver

:::::: TO: Antti Palosaari <crope@iki.fi>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
