Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24A963A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 20:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690056359; x=1721592359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HWszeGqs9OvwdkwrW5XXrOVStwcz3bOsJ83yTsvjE1Y=;
  b=Wxnzd4B6lNGudXbQjRjYvM4z0c8NHOE01qPtB9uiblbcmpNnjFx92JLc
   8QBNpwnipcAnrFo6X4zf7B5Y2vC3j9rvAfNUSaYXsUH4TZl9nrSV+HR8e
   H++qP/8yDGAYM+O7Xwbw0RZWTxJtWs6d3CSdp42x/vMPVeTUfNwDYIYH8
   xjgAPpNmSzUu8V0JPopvzG1pXfVhBuhweCArNlF8KxtzXfEGvFWs2N7OY
   6ZdMbmmCcgVY8vizICH1grllurpbhs1ZVRYW5ljFN4FW3J5oq0Nahid+4
   D2ww9BRiGc5x4GCHjvozPu3TlBB7sC4VLMWbZZXQfyP17UyzQJQPAnx+Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="346826923"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="346826923"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 13:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="790534903"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="790534903"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Jul 2023 13:05:57 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNIrU-0008ZN-0U;
	Sat, 22 Jul 2023 20:05:56 +0000
Date: Sun, 23 Jul 2023 04:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 12/67]
 drivers/soc/sophgo/umcu/mcu.c:367:1: warning: 'inline' is not at beginning
 of declaration
Message-ID: <202307230358.gg7rhGNP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: a2ea3f2c5e43d7a6145891ebcb5c0ab55dff29cb [12/67] driver: soc: Add sophgo sg2042 soc support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230723/202307230358.gg7rhGNP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230358.gg7rhGNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230358.gg7rhGNP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/sophgo/umcu/mcu.c:367:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     367 | static const inline struct mcu_features *dev2features(struct device *dev)
         | ^~~~~~
   drivers/soc/sophgo/umcu/mcu.c: In function 'mcu_msg_append':
   drivers/soc/sophgo/umcu/mcu.c:390:9: warning: function 'mcu_msg_append' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     390 |         len += vsnprintf(base + len, limit - len, fmt, arg);
         |         ^~~
   drivers/soc/sophgo/umcu/mcu.c: At top level:
>> drivers/soc/sophgo/umcu/mcu.c:395:9: warning: no previous prototype for 'info_show' [-Wmissing-prototypes]
     395 | ssize_t info_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~
>> drivers/soc/sophgo/umcu/mcu.c:441:9: warning: no previous prototype for 'brdid_show' [-Wmissing-prototypes]
     441 | ssize_t brdid_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~
>> drivers/soc/sophgo/umcu/mcu.c:457:9: warning: no previous prototype for 'brdip_show' [-Wmissing-prototypes]
     457 | ssize_t brdip_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~
>> drivers/soc/sophgo/umcu/mcu.c:514:9: warning: no previous prototype for 'uptime_show' [-Wmissing-prototypes]
     514 | ssize_t uptime_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~
>> drivers/soc/sophgo/umcu/mcu.c:530:9: warning: no previous prototype for 'temp_show' [-Wmissing-prototypes]
     530 | ssize_t temp_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~
>> drivers/soc/sophgo/umcu/mcu.c:558:9: warning: no previous prototype for 'alert_show' [-Wmissing-prototypes]
     558 | ssize_t alert_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~
>> drivers/soc/sophgo/umcu/mcu.c:642:9: warning: no previous prototype for 'lock_show' [-Wmissing-prototypes]
     642 | ssize_t lock_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~
>> drivers/soc/sophgo/umcu/mcu.c:687:9: warning: no previous prototype for 'power_show' [-Wmissing-prototypes]
     687 | ssize_t power_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~
   drivers/soc/sophgo/umcu/mcu.c: In function 'mcu_critical_action_store':
>> drivers/soc/sophgo/umcu/mcu.c:751:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     751 |         int err;
         |             ^~~
   drivers/soc/sophgo/umcu/mcu.c: In function 'mcu_keep_ddr_poweron_store':
   drivers/soc/sophgo/umcu/mcu.c:874:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     874 |         int err;
         |             ^~~


vim +/inline +367 drivers/soc/sophgo/umcu/mcu.c

   366	
 > 367	static const inline struct mcu_features *dev2features(struct device *dev)
   368	{
   369		struct i2c_client *i2c = dev2i2c(dev);
   370		struct mcu_ctx *ctx = (struct mcu_ctx *)i2c_get_clientdata(i2c);
   371	
   372		return ctx->features;
   373	}
   374	
   375	static ssize_t help_show(struct device *dev, struct device_attribute *attr,
   376			  char *buf)
   377	{
   378		buf[0] = 0;
   379		strncpy(buf, help, PAGE_SIZE);
   380		return strlen(buf);
   381	}
   382	
   383	static int mcu_msg_append(char *base, unsigned long limit,
   384			   const char *fmt, ...)
   385	{
   386		int len = strlen(base);
   387		va_list arg;
   388	
   389		va_start(arg, fmt);
   390		len += vsnprintf(base + len, limit - len, fmt, arg);
   391		va_end(arg);
   392		return len;
   393	}
   394	
 > 395	ssize_t info_show(struct device *dev, struct device_attribute *attr,
   396			  char *buf)
   397	{
   398		struct i2c_client *i2c = dev2i2c(dev);
   399		struct mcu_ctx *ctx = (struct mcu_ctx *)i2c_get_clientdata(i2c);
   400		struct mcu_info *info = &ctx->info;
   401		const struct mcu_features *features = ctx->features;
   402		int err;
   403	
   404		if (info->updated == 0) {
   405			/* get information from mcu through i2c */
   406			err = mcu_i2c_sreadf(i2c, "%u8%u8%u8%u8",
   407					     features->board_type, &info->board_type,
   408					     features->mcu_ver, &info->mcu_ver,
   409					     features->pcb_ver, &info->pcb_ver,
   410					     features->rst_cnt, &info->rst_cnt);
   411			if (err)
   412				return err;
   413			info->updated = 1;
   414		}
   415	
   416		/* convert to json text */
   417		mcu_msg_append(buf, PAGE_SIZE, "{\n");
   418		mcu_msg_append(buf, PAGE_SIZE, "\t\"model\": \"%s\",\n", features->proj);
   419		mcu_msg_append(buf, PAGE_SIZE, "\t\"chip\": \"%s\",\n", features->soc);
   420		mcu_msg_append(buf, PAGE_SIZE, "\t\"mcu\": \"%s\",\n", features->chip);
   421		mcu_msg_append(buf, PAGE_SIZE, "\t\"board type\": \"0x%02X\",\n", info->board_type);
   422		mcu_msg_append(buf, PAGE_SIZE, "\t\"mcu version\": \"0x%02X\",\n", info->mcu_ver);
   423		mcu_msg_append(buf, PAGE_SIZE, "\t\"pcb version\": \"0x%02X\",\n", info->pcb_ver);
   424		mcu_msg_append(buf, PAGE_SIZE, "\t\"reset count\": %u\n", info->rst_cnt);
   425		err = mcu_msg_append(buf, PAGE_SIZE, "}\n");
   426	
   427		return err;
   428	}
   429	
   430	static ssize_t info_store(struct device *dev, struct device_attribute *attr,
   431				  const char *buf, size_t count)
   432	{
   433		struct i2c_client *i2c = dev2i2c(dev);
   434		struct mcu_ctx *ctx = (struct mcu_ctx *)i2c_get_clientdata(i2c);
   435		struct mcu_info *info = &ctx->info;
   436	
   437		info->updated = 0;
   438		return count;
   439	}
   440	
 > 441	ssize_t brdid_show(struct device *dev, struct device_attribute *attr,
   442			    char *buf)
   443	{
   444		int err = 0;
   445		const struct mcu_features *features = dev2features(dev);
   446	
   447		if (features->brd_id == -1)
   448			return -ENODEV;
   449	
   450		err = mcu_i2c_read_byte(dev2i2c(dev), features->brd_id);
   451		if (err < 0)
   452			return err;
   453	
   454		return sprintf(buf, "brdid:%u\n", err);
   455	}
   456	
 > 457	ssize_t brdip_show(struct device *dev, struct device_attribute *attr,
   458			    char *buf)
   459	{
   460		u8 ip[4];
   461		int err;
   462		const struct mcu_features *features = dev2features(dev);
   463	
   464		if (features->brd_ip == -1)
   465			return -ENODEV;
   466	
   467		memset(ip, 0, sizeof(ip));
   468		err = mcu_i2c_read_block(dev2i2c(dev), features->brd_ip,
   469						    sizeof(ip), ip);
   470		if (err < 0)
   471			return err;
   472	
   473		return mcu_msg_append(buf, PAGE_SIZE, "brdip:%u.%u.%u.%u\n",
   474			ip[0], ip[1], ip[2], ip[3]);
   475	}
   476	
   477	static ssize_t brdip_store(struct device *dev, struct device_attribute *attr,
   478		const char *ubuf, size_t len)
   479	{
   480		u8 ip[4];
   481		char buf[32];
   482		char *s, *p, *n;
   483		unsigned long res;
   484		int i, err;
   485		const struct mcu_features *features = dev2features(dev);
   486	
   487		if (features->brd_ip == -1)
   488			return -ENODEV;
   489	
   490		memset(buf, 0, sizeof(buf));
   491		len = min(sizeof(buf), len);
   492		memcpy(buf, ubuf, len);
   493		s = buf;
   494		for (i = 0; i < 4; i++) {
   495			if (i != 3) {
   496				p = strchr(s, '.');
   497				n = p+1;
   498				*p = '\0';
   499			}
   500			err = kstrtoul(s, 10, &res);
   501			if (err)
   502				return err;
   503			ip[i] = (u8)res;
   504			dev_dbg(dev, "ip[%d] = %d\n", i, ip[i]);
   505			s = n;
   506		}
   507		err = mcu_i2c_write_block(dev2i2c(dev), features->brd_ip,
   508						     sizeof(ip), ip);
   509		if (err < 0)
   510			return err;
   511	
   512		return len;
   513	}
 > 514	ssize_t uptime_show(struct device *dev, struct device_attribute *attr,
   515			    char *buf)
   516	{
   517		u8 t[2];
   518		int err;
   519		const struct mcu_features *features = dev2features(dev);
   520	
   521		err = mcu_i2c_read_block(dev2i2c(dev), features->uptime,
   522						    sizeof(t), t);
   523		if (err < 0)
   524			return err;
   525	
   526		return mcu_msg_append(buf, PAGE_SIZE,
   527				      "%u Seconds\n", t[0] | (t[1] << 8));
   528	}
   529	
 > 530	ssize_t temp_show(struct device *dev, struct device_attribute *attr,
   531			  char *buf)
   532	{
   533		s8 t[2];
   534		int err;
   535		const struct mcu_features *features = dev2features(dev);
   536	
   537		/* get information from mcu through i2c */
   538		err = mcu_i2c_sreadf(dev2i2c(dev), "%s8%s8",
   539				     features->soc_tmp, t,
   540				     features->board_tmp, t + 1);
   541		if (err)
   542			return err;
   543	
   544		mcu_msg_append(buf, PAGE_SIZE,
   545			       "SoC temperature: %d Cel\n", t[0]);
   546		return mcu_msg_append(buf, PAGE_SIZE,
   547				      "Board temperature: %d Cel\n", t[1]);
   548	}
   549	
   550	
   551	static const char *alert_id2name(const struct mcu_features *features, int id)
   552	{
   553		if (features->alert_table[id])
   554			return features->alert_table[id];
   555		return "Unknown alert";
   556	}
   557	
 > 558	ssize_t alert_show(struct device *dev, struct device_attribute *attr,
   559			   char *buf)
   560	{
   561		int cnt = 0;
   562		int i, err;
   563		u8 t[4];
   564		u16 mask, status;
   565		const struct mcu_features *features = dev2features(dev);
   566		const char *alt_msg;
   567	
   568		if (features->alert_status == -1)
   569			return 0;
   570	
   571		err = mcu_i2c_read_block(dev2i2c(dev), features->alert_mask,
   572						    sizeof(t), t);
   573		/* get information from mcu through i2c */
   574		if (err < 0)
   575			return err;
   576	
   577		status = t[0] | (t[1] << 8);
   578		mask = t[2] | (t[3] << 8);
   579		cnt += snprintf(buf + cnt, PAGE_SIZE - cnt,
   580				"Mask 0x%02x, Status 0x%02x\n",
   581				mask, status);
   582	
   583		if (status == 0) {
   584			cnt += snprintf(buf + cnt, PAGE_SIZE - cnt,
   585					"Working fine\n");
   586		} else {
   587			for (i = 0; i < sizeof(status) * 8; ++i) {
   588				if ((status >> i) & 1) {
   589					alt_msg = alert_id2name(features, i);
   590					cnt += snprintf(buf + cnt,
   591							PAGE_SIZE - cnt,
   592							"%d: %s\n",
   593							i, alt_msg);
   594				}
   595			}
   596		}
   597		cnt += snprintf(buf + cnt, PAGE_SIZE - cnt,
   598				"**************************************************\n");
   599	
   600		for (i = 0; i < 16; ++i) {
   601			if (features->alert_table[i] == NULL)
   602				continue;
   603			cnt += snprintf(buf + cnt, PAGE_SIZE - cnt,
   604					"%d: %s\n", i, alert_id2name(features, i));
   605		}
   606	
   607		return cnt;
   608	}
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
